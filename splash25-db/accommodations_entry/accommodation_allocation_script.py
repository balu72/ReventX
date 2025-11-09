#!/usr/bin/env python3
"""
Accommodation Allocation Script for Splash25

This script parses an Excel file containing accommodation data and allocates accommodations
to buyers using the backend API endpoint.

Usage:
    python accommodation_allocation_script.py <excel_file> <admin_user> <admin_password> [options]

Arguments:
    excel_file      Path to the Excel file (e.g., "Hotel Accommodation 0907.xlsx")
    admin_user      Admin username for authentication
    admin_password  Admin password for authentication

Options:
    --base-url      Base URL of the backend API (default: http://localhost:5000)
    --preview       Preview mode - no actual API calls, just validation and logging
    --log-file      Custom log file path (default: accommodation_allocation_YYYYMMDD_HHMMSS.log)

Examples:
    python accommodation_allocation_script.py "Hotel Accommodation 0907.xlsx" admin_user admin_pass
    python accommodation_allocation_script.py "Hotel Accommodation 0907.xlsx" admin_user admin_pass --preview
    python accommodation_allocation_script.py "Hotel Accommodation 0907.xlsx" admin_user admin_pass --base-url http://api.splash25.com
"""

import argparse
import logging
import pandas as pd
import requests
import sys
import json
import os
from datetime import datetime, timedelta
from pathlib import Path
import re
from typing import Dict, Any, Optional, Tuple
from dotenv import load_dotenv
import psycopg2
from psycopg2.extras import RealDictCursor

# =============================================================================
# CONFIGURATION AND FIELD MAPPINGS
# =============================================================================

# Field mappings organized by database table
FIELD_MAPPINGS = {
    # 1. Table Users
    'users': {
        'Buyer User ID': 'id'
    },
    
    # 2. Table Buyer_profiles  
    'buyer_profiles': {
        'Buyer User ID': 'user_id',
        'Name': 'name'
    },
    
    # 3. Table Host_properties
    'host_properties': {
        'Host Property Id': 'property_id'
    },
    
    # 4. Table Travel_plans
    'travel_plans': {
        'Travel Plan id': 'id',
        'Buyer User ID': 'user_id'
    },
    
    # 5. Table Accommodations (new entries to be created)
    'accommodations': {
        'Travel Plan id': 'travel_plan_id',
        'Buyer User ID': 'buyer_id',
        'Arrival date/time': 'check_in_datetime',
        'Room Type': 'room_type',
        'Arr Special request': 'special_notes',
        'Room Mate': 'room_mate'
    }
}

# Room type conversion mapping
ROOM_TYPE_MAPPING = {
    'Single': 'single',
    'Double': 'shared',
    'Triple': 'shared'
}

# Fixed values for accommodations
FIXED_VALUES = {
    'check_out_datetime': '2025-07-14T10:00:00',
    'checkin_hour_offset': 2  # Add 2 hours to arrival time
}

# Logging fields (for informational logging)
LOGGING_FIELDS = {
    'Buyer User ID': 'buyer_id',
    'WTO': 'wto_number', 
    'Name': 'buyer_name'
}

# =============================================================================
# UTILITY CLASSES
# =============================================================================

class DataProcessor:
    """Handles data extraction and processing from Excel rows"""
    
    def __init__(self):
        self.field_mappings = FIELD_MAPPINGS
        self.room_type_mapping = ROOM_TYPE_MAPPING
        
    def extract_table_data(self, row: pd.Series, table_name: str) -> Dict[str, Any]:
        """Extract data for a specific table from Excel row"""
        table_mapping = self.field_mappings.get(table_name, {})
        extracted_data = {}
        
        for excel_col, db_field in table_mapping.items():
            if excel_col in row and not pd.isna(row[excel_col]):
                extracted_data[db_field] = row[excel_col]
                
        return extracted_data
    
    def process_accommodations_data(self, row: pd.Series) -> Dict[str, Any]:
        """Special processing for accommodations table"""
        # Get base mapping
        accom_data = self.extract_table_data(row, 'accommodations')
        
        # Process check_in_datetime (add 2 hours to arrival)
        if 'check_in_datetime' in accom_data and not pd.isna(accom_data['check_in_datetime']):
            try:
                # Handle different date formats
                arrival_time_raw = accom_data['check_in_datetime']
                
                # If it's already a datetime object
                if isinstance(arrival_time_raw, pd.Timestamp):
                    arrival_time = arrival_time_raw
                else:
                    # Try to parse as date string
                    arrival_time = pd.to_datetime(str(arrival_time_raw))
                
                # Add 2 hours to arrival time
                check_in_time = arrival_time + timedelta(hours=FIXED_VALUES['checkin_hour_offset'])
                accom_data['check_in_datetime'] = check_in_time.strftime('%Y-%m-%dT%H:%M:%S')
                
            except (ValueError, TypeError) as e:
                logging.warning(f"Could not parse arrival date/time '{arrival_time_raw}': {e}")
                # Remove invalid datetime
                del accom_data['check_in_datetime']
        
        # Process room_type conversion
        if 'room_type' in accom_data:
            room_type_raw = str(accom_data['room_type']).strip()
            accom_data['room_type'] = self.room_type_mapping.get(room_type_raw, room_type_raw.lower())
        
        # Combine Room Mate and Arr Special request into special_notes
        special_notes_parts = []
        
        # Add Room Mate information if available
        if 'room_mate' in accom_data and not pd.isna(accom_data['room_mate']):
            room_mate = str(accom_data['room_mate']).strip()
            if room_mate:
                special_notes_parts.append(f"Room Mate: {room_mate}")
        
        # Add Arr Special request if available
        if 'special_notes' in accom_data and not pd.isna(accom_data['special_notes']):
            special_request = str(accom_data['special_notes']).strip()
            if special_request:
                special_notes_parts.append(f"Special Request: {special_request}")
        
        # Combine all parts into special_notes
        accom_data['special_notes'] = '; '.join(special_notes_parts) if special_notes_parts else ''
        
        # Remove room_mate from the data since it's now included in special_notes
        if 'room_mate' in accom_data:
            del accom_data['room_mate']
        
        # Add fixed checkout datetime
        accom_data['check_out_datetime'] = FIXED_VALUES['check_out_datetime']
        
        return accom_data
    
    def build_api_payload(self, row: pd.Series) -> Dict[str, Any]:
        """Build the complete API payload for accommodation allocation"""
        
        # Extract data for each table
        user_data = self.extract_table_data(row, 'users')
        buyer_profile_data = self.extract_table_data(row, 'buyer_profiles') 
        host_property_data = self.extract_table_data(row, 'host_properties')
        travel_plan_data = self.extract_table_data(row, 'travel_plans')
        accommodation_data = self.process_accommodations_data(row)
        
        # Build the API payload structure based on the backend endpoint
        api_payload = {
            'host_property_id': host_property_data.get('property_id'),
            'room_type': accommodation_data.get('room_type'),
            'check_in_datetime': accommodation_data.get('check_in_datetime'),
            'check_out_datetime': accommodation_data.get('check_out_datetime'),
            'special_notes': accommodation_data.get('special_notes', '')
        }
        
        return api_payload, user_data.get('id')

class TableValidator:
    """Validates data for different database tables"""
    
    def validate_users_data(self, user_data: Dict[str, Any]) -> Tuple[bool, str]:
        """Validate users table data"""
        if not user_data.get('id'):
            return False, "User ID is required"
        try:
            int(user_data['id'])
        except (ValueError, TypeError):
            return False, "User ID must be a valid integer"
        return True, ""
    
    def validate_travel_plans_data(self, travel_plan_data: Dict[str, Any]) -> Tuple[bool, str]:
        """Validate travel_plans table data"""
        if not travel_plan_data.get('id'):
            return False, "Travel Plan ID is required"
        try:
            int(travel_plan_data['id'])
        except (ValueError, TypeError):
            return False, "Travel Plan ID must be a valid integer"
        return True, ""
    
    def validate_host_properties_data(self, host_property_data: Dict[str, Any]) -> Tuple[bool, str]:
        """Validate host_properties table data"""
        if not host_property_data.get('property_id'):
            return False, "Host Property ID is required"
        try:
            int(host_property_data['property_id'])
        except (ValueError, TypeError):
            return False, "Host Property ID must be a valid integer"
        return True, ""
    
    def validate_accommodations_data(self, accommodation_data: Dict[str, Any]) -> Tuple[bool, str]:
        """Validate accommodations table data"""
        required_fields = ['room_type', 'check_out_datetime']
        for field in required_fields:
            if not accommodation_data.get(field):
                return False, f"Accommodation {field} is required"
        
        # Validate room type
        valid_room_types = ['single', 'shared']
        if accommodation_data.get('room_type') not in valid_room_types:
            return False, f"Invalid room type. Must be one of: {valid_room_types}"
        
        return True, ""

class DatabaseClient:
    """Handles database connections and queries"""
    
    def __init__(self, database_uri: str):
        self.database_uri = database_uri
        self.connection = None
        
    def connect(self) -> bool:
        """Connect to the database"""
        try:
            self.connection = psycopg2.connect(self.database_uri)
            logging.info("Successfully connected to database")
            return True
        except Exception as e:
            logging.error(f"Database connection failed: {str(e)}")
            return False
    
    def disconnect(self):
        """Disconnect from the database"""
        if self.connection:
            self.connection.close()
            self.connection = None
            logging.info("Database connection closed")
    
    def get_travel_plan_for_user(self, user_id: int) -> Optional[int]:
        """Query travel_plans table to get travel plan ID for a user"""
        if not self.connection:
            logging.error("No database connection available")
            return None
            
        try:
            with self.connection.cursor(cursor_factory=RealDictCursor) as cursor:
                # Query for travel plans for this user
                cursor.execute(
                    "SELECT id FROM travel_plans WHERE user_id = %s ORDER BY id DESC LIMIT 1",
                    (user_id,)
                )
                result = cursor.fetchone()
                
                if result:
                    travel_plan_id = result['id']
                    logging.info(f"Found travel plan ID {travel_plan_id} for user ID {user_id} in database")
                    return travel_plan_id
                else:
                    logging.warning(f"No travel plan found for user ID {user_id} in database")
                    return None
                    
        except Exception as e:
            logging.error(f"Database query failed for user ID {user_id}: {str(e)}")
            return None
    
    def load_all_host_properties(self) -> Dict[int, Dict[str, Any]]:
        """Load all host properties into memory for efficient lookup"""
        if not self.connection:
            logging.error("No database connection available")
            return {}
            
        try:
            with self.connection.cursor(cursor_factory=RealDictCursor) as cursor:
                # Query for all host property details (only select existing columns)
                cursor.execute(
                    "SELECT property_id, property_name FROM host_properties"
                )
                results = cursor.fetchall()
                
                # Create lookup dictionary
                host_properties = {}
                for result in results:
                    property_id = result['property_id']
                    host_properties[property_id] = dict(result)
                
                logging.info(f"Loaded {len(host_properties)} host properties into memory for lookup")
                return host_properties
                    
        except Exception as e:
            logging.error(f"Database query failed for loading host properties: {str(e)}")
            # Rollback the transaction to recover from error
            try:
                self.connection.rollback()
                logging.info("Database transaction rolled back after error")
            except:
                pass
            return {}
    
    def get_host_property_details(self, property_id: int, host_properties_cache: Dict[int, Dict[str, Any]]) -> Optional[Dict[str, Any]]:
        """Get property details from the pre-loaded cache"""
        return host_properties_cache.get(property_id)

class APIClient:
    """Handles API authentication and requests"""
    
    def __init__(self, base_url: str, username: str, password: str):
        self.base_url = base_url.rstrip('/')
        self.username = username
        self.password = password
        self.session = requests.Session()
        self.auth_token = None
        
    def authenticate(self) -> bool:
        """Authenticate with the backend API and store token"""
        try:
            login_url = f"{self.base_url}/api/auth/login"
            login_data = {
                'username': self.username,
                'password': self.password
            }
            
            response = self.session.post(login_url, json=login_data)
            
            if response.status_code == 200:
                data = response.json()
                self.auth_token = data.get('access_token')
                
                if self.auth_token:
                    # Set authorization header for future requests
                    self.session.headers.update({
                        'Authorization': f'Bearer {self.auth_token}',
                        'Content-Type': 'application/json'
                    })
                    logging.info("Successfully authenticated with backend API")
                    return True
                else:
                    logging.error("No access token received from login response")
                    return False
            else:
                logging.error(f"Authentication failed: {response.status_code} - {response.text}")
                return False
                
        except Exception as e:
            logging.error(f"Authentication error: {str(e)}")
            return False
    
    def allocate_accommodation(self, buyer_id: int, payload: Dict[str, Any]) -> Dict[str, Any]:
        """Call the accommodation allocation API endpoint"""
        try:
            url = f"{self.base_url}/api/admin/buyers/{buyer_id}/allocate-accommodation"
            
            response = self.session.post(url, json=payload)
            
            result = {
                'status_code': response.status_code,
                'success': response.status_code == 201,
                'response_data': {}
            }
            
            try:
                result['response_data'] = response.json()
            except json.JSONDecodeError:
                result['response_data'] = {'error': 'Invalid JSON response', 'text': response.text}
            
            return result
            
        except Exception as e:
            return {
                'status_code': 0,
                'success': False,
                'response_data': {'error': f'Request failed: {str(e)}'}
            }

# =============================================================================
# MAIN PROCESSING FUNCTIONS
# =============================================================================

def setup_logging(log_file: Optional[str] = None) -> str:
    """Setup logging configuration"""
    if log_file is None:
        timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
        log_file = f'accommodation_allocation_{timestamp}.log'
    
    # Create logs directory if it doesn't exist
    log_path = Path(log_file)
    log_path.parent.mkdir(parents=True, exist_ok=True)
    
    # Configure logging
    logging.basicConfig(
        level=logging.INFO,
        format='%(asctime)s - %(levelname)s - %(message)s',
        handlers=[
            logging.FileHandler(log_file, encoding='utf-8'),
            logging.StreamHandler(sys.stdout)
        ]
    )
    
    return str(log_path)

def load_excel_file(file_path: str) -> pd.DataFrame:
    """Load and validate Excel file"""
    try:
        # Check if file exists
        if not Path(file_path).exists():
            raise FileNotFoundError(f"Excel file not found: {file_path}")
        
        # Read Excel file
        df = pd.read_excel(file_path, sheet_name='Master')
        
        # Validate required columns
        required_columns = [
            'Buyer User ID', 'Name', 'Host Property Id', 
            'Travel Plan id', 'Room Type', 'Arrival date/time'
        ]
        
        missing_columns = [col for col in required_columns if col not in df.columns]
        if missing_columns:
            raise ValueError(f"Missing required columns: {missing_columns}")
        
        logging.info(f"Successfully loaded Excel file: {file_path}")
        logging.info(f"Total rows: {len(df)}")
        logging.info(f"Columns: {list(df.columns)}")
        
        return df
        
    except Exception as e:
        logging.error(f"Failed to load Excel file: {str(e)}")
        raise

def process_row(row: pd.Series, row_number: int, processor: DataProcessor, 
                validator: TableValidator, api_client: APIClient, db_client: DatabaseClient,
                host_properties_cache: Dict[int, Dict[str, Any]], preview_mode: bool = False) -> Dict[str, Any]:
    """Process a single Excel row"""
    
    # Extract logging info
    buyer_id = row.get('Buyer User ID')
    wto_number = row.get('WTO', 'N/A')
    buyer_name = row.get('Name', 'N/A')
    
    # Skip if buyer ID is empty
    if pd.isna(buyer_id) or str(buyer_id).strip() == '':
        logging.info(f"Row {row_number}: Skipping row - Buyer User ID with WTO {wto_number} and Name {buyer_name} is empty")
        return {'status': 'skipped', 'reason': 'Empty Buyer ID', 'buyer_id': None}
    
    try:
        buyer_id = int(float(buyer_id))  # Handle potential float values from Excel
    except (ValueError, TypeError):
        logging.error(f"Row {row_number}: Invalid Buyer User ID '{buyer_id}' for WTO {wto_number} and Name {buyer_name}")
        return {'status': 'failed', 'reason': 'Invalid Buyer ID format', 'buyer_id': buyer_id}
    
    logging.info(f"Row {row_number}: Processing Buyer ID {buyer_id}, WTO {wto_number}, Name {buyer_name}")
    
    # Process data for each table
    try:
        # Validate each table's data
        user_data = processor.extract_table_data(row, 'users')
        valid, error = validator.validate_users_data(user_data)
        if not valid:
            return {'status': 'failed', 'reason': f"Users validation: {error}", 'buyer_id': buyer_id}
        
        travel_plan_data = processor.extract_table_data(row, 'travel_plans')
        valid, error = validator.validate_travel_plans_data(travel_plan_data)
        if not valid:
            # If travel plan ID is missing from Excel, try to get it from database
            if "Travel Plan ID is required" in error:
                logging.info(f"Row {row_number}: No travel plan ID specified in Excel for Buyer ID {buyer_id}, querying database...")
                db_travel_plan_id = db_client.get_travel_plan_for_user(buyer_id)
                
                if db_travel_plan_id:
                    # Update the row data with the travel plan ID from database
                    row = row.copy()
                    row['Travel Plan id'] = db_travel_plan_id
                    travel_plan_data = processor.extract_table_data(row, 'travel_plans')
                    valid, error = validator.validate_travel_plans_data(travel_plan_data)
                    
                    if valid:
                        logging.info(f"Row {row_number}: Successfully retrieved travel plan ID {db_travel_plan_id} from database for Buyer ID {buyer_id}")
                    else:
                        logging.error(f"Row {row_number}: Retrieved travel plan ID {db_travel_plan_id} from database but validation failed: {error}")
                        return {'status': 'failed', 'reason': f"Travel plans validation (from DB): {error}", 'buyer_id': buyer_id}
                else:
                    logging.error(f"Row {row_number}: No travel plan found in database for Buyer ID {buyer_id}")
                    return {'status': 'failed', 'reason': f"Travel plans validation: {error} (not found in database either)", 'buyer_id': buyer_id}
            else:
                return {'status': 'failed', 'reason': f"Travel plans validation: {error}", 'buyer_id': buyer_id}
        
        host_property_data = processor.extract_table_data(row, 'host_properties')
        valid, error = validator.validate_host_properties_data(host_property_data)
        if not valid:
            return {'status': 'failed', 'reason': f"Host properties validation: {error}", 'buyer_id': buyer_id}
        
        accommodation_data = processor.process_accommodations_data(row)
        valid, error = validator.validate_accommodations_data(accommodation_data)
        if not valid:
            return {'status': 'failed', 'reason': f"Accommodations validation: {error}", 'buyer_id': buyer_id}
        
        # Build API payload
        api_payload, extracted_buyer_id = processor.build_api_payload(row)
        
        # Get host property details for enhanced logging
        property_id = api_payload.get('host_property_id')
        
        # Convert property_id to int for lookup (Excel might have it as float/string)
        if property_id is not None:
            try:
                property_id_int = int(float(property_id))
                property_details = db_client.get_host_property_details(property_id_int, host_properties_cache)
            except (ValueError, TypeError):
                logging.warning(f"Row {row_number}: Invalid property ID format: {property_id}")
                property_details = None
                property_id_int = property_id
        else:
            property_details = None
            property_id_int = property_id
        
        property_info = ""
        if property_details:
            property_name = property_details.get('property_name', 'Unknown')
            property_info = f" at Property ID {property_id_int} ({property_name})"
        elif property_id_int:
            property_info = f" at Property ID {property_id_int}"
        
        # Log the payload for debugging
        logging.debug(f"Row {row_number}: API payload: {json.dumps(api_payload, indent=2)}")
        
        # Make API call (unless in preview mode)
        if preview_mode:
            logging.info(f"Row {row_number}: PREVIEW MODE - Would allocate accommodation for Buyer ID {buyer_id}{property_info}")
            return {
                'status': 'preview_success', 
                'reason': 'Preview mode - no API call made',
                'buyer_id': buyer_id,
                'payload': api_payload
            }
        else:
            result = api_client.allocate_accommodation(buyer_id, api_payload)
            
            if result['success']:
                logging.info(f"Row {row_number}: Successfully allocated accommodation for Buyer ID {buyer_id}{property_info}")
                return {
                    'status': 'success', 
                    'reason': 'Accommodation allocated successfully',
                    'buyer_id': buyer_id,
                    'api_response': result['response_data']
                }
            else:
                error_msg = result['response_data'].get('error', 'Unknown API error')
                logging.error(f"Row {row_number}: Failed to allocate accommodation for Buyer ID {buyer_id}: {error_msg}")
                return {
                    'status': 'failed', 
                    'reason': f"API error: {error_msg}",
                    'buyer_id': buyer_id,
                    'api_response': result['response_data']
                }
        
    except Exception as e:
        logging.error(f"Row {row_number}: Unexpected error processing Buyer ID {buyer_id}: {str(e)}")
        return {'status': 'failed', 'reason': f"Processing error: {str(e)}", 'buyer_id': buyer_id}

def process_excel_file(df: pd.DataFrame, api_client: APIClient, db_client: DatabaseClient, preview_mode: bool = False) -> Dict[str, Any]:
    """Process the entire Excel file"""
    
    processor = DataProcessor()
    validator = TableValidator()
    
    # Load all host properties once for efficient lookup
    host_properties_cache = db_client.load_all_host_properties()
    
    # Initialize counters
    total_rows = len(df)
    processed = 0
    skipped = 0
    failed = 0
    successful = 0
    
    results = []
    
    logging.info(f"Starting to process {total_rows} rows (Preview mode: {preview_mode})")
    
    # Process each row
    for index, row in df.iterrows():
        row_number = index + 2  # +2 because Excel is 1-indexed and has a header row
        
        result = process_row(row, row_number, processor, validator, api_client, db_client, host_properties_cache, preview_mode)
        results.append(result)
        
        # Update counters
        if result['status'] == 'skipped':
            skipped += 1
        elif result['status'] == 'failed':
            failed += 1
        elif result['status'] in ['success', 'preview_success']:
            successful += 1
        
        processed += 1
        
        # Log progress every 10 rows
        if processed % 10 == 0:
            logging.info(f"Progress: {processed}/{total_rows} rows processed")
    
    # Generate summary
    summary = {
        'total_rows': total_rows,
        'processed': processed,
        'successful': successful,
        'failed': failed,
        'skipped': skipped,
        'preview_mode': preview_mode,
        'results': results
    }
    
    return summary

def print_summary(summary: Dict[str, Any]):
    """Print processing summary"""
    print("\n" + "="*60)
    print("ACCOMMODATION ALLOCATION SUMMARY")
    print("="*60)
    print(f"Total rows in Excel file: {summary['total_rows']}")
    print(f"Rows processed: {summary['processed']}")
    print(f"Successful allocations: {summary['successful']}")
    print(f"Failed allocations: {summary['failed']}")
    print(f"Skipped rows: {summary['skipped']}")
    print(f"Preview mode: {'Yes' if summary['preview_mode'] else 'No'}")
    
    if summary['failed'] > 0:
        print(f"\nFailed rows:")
        for result in summary['results']:
            if result['status'] == 'failed':
                print(f"  - Buyer ID {result['buyer_id']}: {result['reason']}")
    
    if summary['skipped'] > 0:
        print(f"\nSkipped rows:")
        for result in summary['results']:
            if result['status'] == 'skipped':
                print(f"  - {result['reason']}")
    
    print("="*60)

def main():
    """Main function"""
    # Load environment variables from .env file
    load_dotenv()
    
    parser = argparse.ArgumentParser(
        description='Allocate accommodations from Excel file to buyers via API',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=__doc__
    )
    
    parser.add_argument('excel_file', help='Path to the Excel file')
    parser.add_argument('--admin-user', help='Admin username for authentication (can also use ADMIN_USER env var)')
    parser.add_argument('--admin-password', help='Admin password for authentication (can also use ADMIN_PASSWORD env var)')
    parser.add_argument('--base-url', help='Base URL of the backend API (can also use BASE_URL env var, default: http://localhost:5000)')
    parser.add_argument('--preview', action='store_true', 
                       help='Preview mode - no actual API calls, just validation and logging')
    parser.add_argument('--log-file', help='Custom log file path')
    
    args = parser.parse_args()
    
    # Get credentials from args or environment variables
    admin_user = args.admin_user or os.getenv('ADMIN_USER')
    admin_password = args.admin_password or os.getenv('ADMIN_PASSWORD')
    base_url = args.base_url or os.getenv('BASE_URL', 'http://localhost:5000')
    database_uri = os.getenv('DATABASE_URI')
    
    # Validate required credentials
    if not admin_user:
        logging.error("Admin username is required. Provide via --admin-user argument or ADMIN_USER environment variable.")
        sys.exit(1)
    
    if not admin_password:
        logging.error("Admin password is required. Provide via --admin-password argument or ADMIN_PASSWORD environment variable.")
        sys.exit(1)
    
    if not database_uri:
        logging.error("Database URI is required. Provide via DATABASE_URI environment variable.")
        sys.exit(1)
    
    # Setup logging
    log_file = setup_logging(args.log_file)
    
    try:
        logging.info("Starting accommodation allocation script")
        logging.info(f"Excel file: {args.excel_file}")
        logging.info(f"Admin user: {admin_user}")
        logging.info(f"Base URL: {base_url}")
        logging.info(f"Preview mode: {args.preview}")
        logging.info(f"Log file: {log_file}")
        
        # Load Excel file
        df = load_excel_file(args.excel_file)
        
        # Initialize API client
        api_client = APIClient(base_url, admin_user, admin_password)
        
        # Initialize database client
        db_client = DatabaseClient(database_uri)
        if not db_client.connect():
            logging.error("Database connection failed. Exiting.")
            sys.exit(1)
        
        # Authenticate (skip in preview mode)
        if not args.preview:
            if not api_client.authenticate():
                logging.error("Authentication failed. Exiting.")
                db_client.disconnect()
                sys.exit(1)
        else:
            logging.info("Preview mode: Skipping authentication")
        
        # Process Excel file
        summary = process_excel_file(df, api_client, db_client, args.preview)
        
        # Disconnect from database
        db_client.disconnect()
        
        # Print summary
        print_summary(summary)
        
        # Log completion
        logging.info("Accommodation allocation script completed successfully")
        
        # Exit with appropriate code
        if summary['failed'] > 0:
            sys.exit(1)
        else:
            sys.exit(0)
            
    except Exception as e:
        logging.error(f"Script failed with error: {str(e)}")
        print(f"\nERROR: {str(e)}")
        sys.exit(1)

if __name__ == '__main__':
    main()
