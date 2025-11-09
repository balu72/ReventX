#!/usr/bin/env python3
"""
Automatic Meeting Scheduler

This module provides a comprehensive command-line interface for scheduling
meetings from Excel files. It includes input file validation, prerequisite
checking, and meeting creation with preview mode support.

Features:
- Excel file validation and processing
- Prerequisite validation (automatic_slot_filler.py execution check)
- Command-line argument parsing with validation
- Interactive user confirmation for operations
- Comprehensive logging to timestamped files
- Preview mode for safe testing
- Excel column mapping system
- Database integration with Flask and SQLAlchemy

Prerequisites:
- automatic_slot_filler.py must be executed first to populate time slots
- Excel file must contain required columns including 'Buyer ID'
"""

import sys
import os
import logging
import argparse
import pandas as pd
from datetime import datetime
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from dotenv import load_dotenv
from typing import List, Dict, Any, Optional

# Load environment variables from the backend directory
load_dotenv('../../splash25-backend/.env')

# Import models and utilities from separate modules
from scheduler_models import (
    db, User, SystemSetting, SellerProfile, BuyerProfile, BuyerCategory, 
    StallType, Stall, Meeting, MeetingStatus, TimeSlot
)

# Create minimal Flask app
app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = os.getenv('DATABASE_URI', 'postgresql://splash25user:splash25password@localhost:5432/splash25_core_db')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# Initialize SQLAlchemy with the same instance from scheduler_models
db.init_app(app)

from scheduler_utils import (
    validate_excel_columns, map_excel_columns, validate_buyer_ids_in_dataframe,
    get_prerequisite_confirmation_message, get_operation_confirmation_message_with_date,
    format_validation_errors, format_processing_summary, validate_and_parse_date
)
from scheduler_db_queries import (
    validate_buyer_ids_from_list, create_meeting_from_excel_data,
    get_system_settings, precalculate_seller_stall_type_quotas,
    precalculate_buyer_category_quotas, fetch_all_sellers_with_accepted_meetings,
    fetch_buyers_optimized_with_matching, get_accepted_meetings,
    execute_core_scheduling_logic_first_buyer, execute_core_scheduling_logic_for_specific_buyer,
    execute_core_scheduling_logic_second_buyer_onwards,
    build_distance_matrix_optimization, get_optimal_seller_sequence_dynamic_origin, get_starting_point_stall_id,
    initialize_seller_stall_distance_matrix
)
from scheduler_log_utils import (
    setup_logging, log_execution_start, 
    validate_common_arguments, get_user_confirmation, check_slot_filler_log_files
)

# Excel column to database field mapping
EXCEL_COLUMN_MAPPING = {
    'Buyer ID': 'user_id',  # Maps directly to user_id in users table
    # Add other mappings as needed for future columns
    # 'Seller ID': 'seller_id',
    # 'Meeting Date': 'meeting_date',
    # 'Meeting Time': 'meeting_time',
}

# Database field mapping (for clarity in DB operations)
DB_FIELD_MAPPING = {
    'user_id': 'user_id',  # user_id in script maps to user_id in database
}

def validate_input_file(file_path: str) -> List[str]:
    """Validate Excel input file."""
    errors = []
    
    if not file_path:
        return errors
    
    # Check file exists
    if not os.path.exists(file_path):
        errors.append(f"File does not exist: {file_path}")
        return errors
    
    # Check file extension
    valid_extensions = ['.xlsx', '.xls']
    file_ext = os.path.splitext(file_path)[1].lower()
    
    if file_ext not in valid_extensions:
        errors.append(f"Input file must be Excel format (.xlsx or .xls)")
        errors.append(f"Found: {file_path}")
        return errors
    
    # Try to read Excel file
    try:
        pd.read_excel(file_path, nrows=1)  # Just read first row to test
    except ImportError:
        errors.append("pandas library not installed. Please install with: pip install pandas openpyxl")
    except Exception as e:
        errors.append(f"Cannot read Excel file: {str(e)}")
    
    return errors

def process_excel_file(file_path: str, preview_mode: bool = False) -> Dict[str, Any]:
    """
    Complete Excel file processing with column mapping and validation.
    
    Steps:
    1. Read Excel file
    2. Validate required columns exist
    3. Map Excel columns to internal fields
    4. Validate buyer IDs exist in database
    5. Process meeting data
    6. Create meetings (with preview mode support)
    """
    try:
        logging.info(f"Starting Excel file processing: {file_path}")
        
        # Step 1: Read Excel file
        df = pd.read_excel(file_path)
        logging.info(f"Read {len(df)} rows from Excel file")
        
        # Step 2: Validate required columns exist
        required_columns = list(EXCEL_COLUMN_MAPPING.keys())
        column_validation = validate_excel_columns(df, required_columns)
        
        if not column_validation['success']:
            return {
                'success': False,
                'error': 'Missing required columns',
                'validation_details': column_validation
            }
        
        # Step 3: Map Excel columns to internal fields
        mapped_df = map_excel_columns(df, EXCEL_COLUMN_MAPPING)
        
        # Step 4: Validate user IDs in DataFrame format  
        buyer_validation = validate_buyer_ids_in_dataframe(mapped_df)
        
        if not buyer_validation['success']:
            return {
                'success': False,
                'error': 'Invalid user IDs in DataFrame',
                'validation_details': buyer_validation
            }
        
        # Step 5: Validate user IDs exist in database (treating them as user_ids)
        db_validation = validate_buyer_ids_from_list(buyer_validation['buyer_ids_list'])
        
        if not db_validation['success']:
            return {
                'success': False,
                'error': 'User IDs not found in database',
                'validation_details': db_validation
            }
        
        # Step 6: Process meeting data
        meetings_created = 0
        meetings_failed = 0
        processing_results = []
        
        logging.info(f"Processing {len(mapped_df)} meeting records...")
        
        for index, row in mapped_df.iterrows():
            try:
                user_id = int(row['user_id'])
                
                # Create meeting from Excel row
                meeting_result = create_meeting_from_excel_data(
                    buyer_id=user_id,  # Pass user_id as buyer_id parameter
                    preview_mode=preview_mode
                )
                
                if meeting_result['success']:
                    meetings_created += 1
                    processing_results.append({
                        'row': index + 1,
                        'user_id': user_id,
                        'status': 'success',
                        'meeting_id': meeting_result.get('meeting_id'),
                        'sql_preview': meeting_result.get('sql_preview')
                    })
                    
                    if preview_mode:
                        logging.info(f"Row {index + 1}: PREVIEW - Would create meeting for user_id {user_id}")
                    else:
                        logging.info(f"Row {index + 1}: Created meeting for user_id {user_id}")
                else:
                    meetings_failed += 1
                    processing_results.append({
                        'row': index + 1,
                        'user_id': user_id,
                        'status': 'failed',
                        'error': meeting_result.get('error')
                    })
                    logging.error(f"Row {index + 1}: Failed to create meeting for user_id {user_id}: {meeting_result.get('error')}")
                    
            except Exception as e:
                meetings_failed += 1
                logging.error(f"Row {index + 1}: Error processing row: {str(e)}")
                processing_results.append({
                    'row': index + 1,
                    'status': 'error',
                    'error': str(e)
                })
        
        return {
            'success': True,
            'rows_processed': len(mapped_df),
            'meetings_created': meetings_created,
            'meetings_failed': meetings_failed,
            'valid_buyers': len(db_validation['valid_buyers']),
            'processing_results': processing_results,
            'preview_mode': preview_mode
        }
        
    except Exception as e:
        error_msg = f"Error processing Excel file: {str(e)}"
        logging.error(error_msg)
        return {
            'success': False,
            'error': error_msg
        }

def initialize_scheduler_data() -> Dict[str, Any]:
    """
    Initialize all required data for meeting scheduling.
    
    This function performs the following initialization steps:
    a. Read System Settings (event start & end dates, meeting information)
    b. Read all stall types and calculate maximum meetings allowed
    c. Read all buyer category quotas
    d. Read all seller info (seller_profile) and store in variable
    e. Read all buyer info (buyer_profile) and store in variable
    f. Read all ACCEPTED MEETINGS only and store in variable
    
    Returns:
        Dict containing all initialized data or error information
    """
    try:
        logging.info("=" * 60)
        logging.info("INITIALIZING SCHEDULER DATA")
        logging.info("=" * 60)
        
        # Step a: Read System Settings
        print("   🔧 Reading system settings...")
        logging.info("Step a: Reading system settings")
        system_settings = get_system_settings()
        logging.info(f"Retrieved system settings: event dates, meeting duration, intervals, breaks")
        
        # Step b: Read all stall types and calculate quotas
        print("   🏪 Calculating stall type quotas...")
        logging.info("Step b: Reading stall types and calculating meeting quotas")
        stall_quota_map = precalculate_seller_stall_type_quotas()
        logging.info(f"Calculated quotas for {len(stall_quota_map)} stall types")
        
        # Step c: Read buyer category quotas
        print("   👥 Reading buyer category quotas...")
        logging.info("Step c: Reading buyer category quotas")
        category_quota_map = precalculate_buyer_category_quotas()
        logging.info(f"Retrieved quotas for buyer categories")
        
        # Step d: Read all seller info (including those with full quotas who have accepted meetings)
        print("   🏢 Loading seller profiles...")
        logging.info("Step d: Reading all seller profiles")
        available_sellers, total_sellers = fetch_all_sellers_with_accepted_meetings(stall_quota_map)
        logging.info(f"Loaded {len(available_sellers)} sellers with accepted meetings out of {total_sellers} total")
        
        # Step e: Skip buyer loading here - will load specific buyers from Excel later
        print("   🛒 Buyer profiles will be loaded from Excel file...")
        logging.info("Step e: Buyer profiles will be loaded from Excel file after processing")
        available_buyers = []  # Will be populated from Excel
        total_buyers = 0  # Will be set from Excel
        
        # Step f: Read all ACCEPTED meetings
        print("   📅 Loading accepted meetings...")
        logging.info("Step f: Reading all accepted meetings")
        accepted_meetings = get_accepted_meetings()
        logging.info(f"Loaded {len(accepted_meetings)} accepted meetings")
        
        # Step g: Initialize seller-stall-distance matrix cache
        print("   🗺️ Building seller distance cache...")
        logging.info("Step g: Building seller-stall-distance matrix cache")
        seller_distance_cache = initialize_seller_stall_distance_matrix()
        logging.info(f"Built seller distance cache for {len(seller_distance_cache)} sellers")
        
        # Prepare initialization result
        init_data = {
            'system_settings': system_settings,
            'stall_quota_map': stall_quota_map,
            'category_quota_map': category_quota_map,
            'available_sellers': available_sellers,
            'total_sellers': total_sellers,
            'available_buyers': available_buyers,
            'total_buyers': total_buyers,
            'accepted_meetings': accepted_meetings,
            'seller_distance_cache': seller_distance_cache
        }
        
        logging.info("=" * 60)
        logging.info("SCHEDULER DATA INITIALIZATION COMPLETED SUCCESSFULLY")
        logging.info(f"System Settings: {len(system_settings)} keys")
        logging.info(f"Stall Types: {len(stall_quota_map)} types with quotas")
        logging.info(f"Buyer Categories: {len(category_quota_map)} categories with quotas")
        logging.info(f"Available Sellers: {len(available_sellers)}/{total_sellers}")
        logging.info(f"Available Buyers: {len(available_buyers)}/{total_buyers}")
        logging.info(f"Accepted Meetings: {len(accepted_meetings)}")
        logging.info("=" * 60)
        
        return {
            'success': True,
            'data': init_data,
            'summary': {
                'system_settings_count': len(system_settings),
                'stall_types_count': len(stall_quota_map),
                'buyer_categories_count': len(category_quota_map),
                'available_sellers_count': len(available_sellers),
                'total_sellers_count': total_sellers,
                'available_buyers_count': len(available_buyers),
                'total_buyers_count': total_buyers,
                'accepted_meetings_count': len(accepted_meetings)
            }
        }
        
    except Exception as e:
        error_msg = f"Error during scheduler data initialization: {str(e)}"
        logging.error(error_msg)
        logging.error("SCHEDULER DATA INITIALIZATION FAILED")
        return {
            'success': False,
            'error': error_msg
        }

def validate_prerequisites() -> bool:
    """Complete prerequisite validation flow."""
    # Check for log files
    log_check = check_slot_filler_log_files()
    
    # Get user confirmation message
    confirmation_msg = get_prerequisite_confirmation_message(
        log_check['log_files_found'], 
        log_check['log_files']
    )
    
    # Display message and get user input
    print(confirmation_msg, end='')
    response = input().strip().lower()
    
    confirmed = response in ['y', 'yes']
    
    if not confirmed:
        print("\n❌ Error: automatic_slot_filler.py must be executed first.")
        print("\nPlease run the following command first:")
        print("python automatic_slot_filler.py -t -s")
        print("\nThis will populate the time slots required for meeting scheduling.")
        print("After running the slot filler, you can then use this script.")
        
        # Log the decision
        logging.error("User confirmed they have NOT run automatic_slot_filler.py")
        logging.error("Prerequisite validation failed - exiting")
        
        return False
    
    # Log successful confirmation
    logging.info("User confirmed they have run automatic_slot_filler.py")
    logging.info("Prerequisite validation passed")
    
    return True


def parse_arguments():
    """Parse command line arguments."""
    parser = argparse.ArgumentParser(
        description='Automatic Meeting Scheduler - Schedule meetings from Excel files',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  %(prog)s -i meetings.xlsx -d "15/01/2025"
  %(prog)s -i meetings.xlsx -d "15-01-25" --preview
  %(prog)s -i meetings.xlsx -d "20250115" -v -s G2
  %(prog)s -i meetings.xlsx -d "15/01/2025" --preview -v -s

Prerequisites:
  - automatic_slot_filler.py must be executed first to populate time slots
  - Excel file must contain 'Buyer ID' column with valid buyer profile IDs

For more information, see the documentation.
        """
    )
    
    # Required arguments
    parser.add_argument('-i', '--input-file', type=str, required=True,
                       help='Excel file (.xlsx/.xls) with meeting data containing Buyer ID column (REQUIRED)')
    parser.add_argument('-d', '--date', type=str, required=True,
                       help='Target date for scheduling in format DD/MM/YYYY, DD/MM/YY, DD-MM-YYYY, DD-MM-YY, or YYYYMMDD (REQUIRED)')
    
    # Optional arguments
    parser.add_argument('--preview', action='store_true',
                       help='Preview mode - log operations but do not commit to database')
    parser.add_argument('-v', '--verbose', action='store_true',
                       help='Enable verbose logging (DEBUG level)')
    parser.add_argument('-l', '--logging', type=str,
                       choices=['i', 'info', 'INFO', 'e', 'error', 'ERROR', 
                               'w', 'warn', 'WARN', 'd', 'debug', 'DEBUG'],
                       default='info',
                       help='Set logging level (default: info). Verbose (-v) overrides this to debug.')
    parser.add_argument('-s', '--starting-point', type=str, default='ENTEX1',
                       help='Starting point for meeting scheduling (default: ENTEX1)')
    parser.add_argument('-m', '--max-runs', type=int, default=5,
                       help='Maximum number of scheduling runs to attempt (default: 5)')
    parser.add_argument('--summary', action='store_true',
                       help='Show summary after operations')
    
    return parser.parse_args()

def validate_arguments(args, system_settings: Dict[str, Any]) -> List[str]:
    """Validate argument combinations and check for required parameters."""
    errors = []
    
    # Validate input file
    if not args.input_file:
        errors.append("Input file is required (-i/--input-file)")
    else:
        file_errors = validate_input_file(args.input_file)
        errors.extend(file_errors)
    
    # Validate date parameter (mandatory)
    if not args.date:
        errors.append("Date parameter is required (-d/--date)")
        errors.append("Supported formats: DD/MM/YYYY, DD/MM/YY, DD-MM-YYYY, DD-MM-YY, YYYYMMDD")
    else:
        try:
            validated_date, formatted_date = validate_and_parse_date(args.date, system_settings)
            # Store validated date for later use
            args.validated_date = validated_date
            args.formatted_date = formatted_date
        except ValueError as e:
            errors.append(f"Date validation failed: {str(e)}")
    
    return errors

def display_argument_summary(args, validation_errors: List[str], log_filename: str):
    """Display summary of parsed arguments and validation results."""
    print("🔍 Automatic Meeting Scheduler - Argument Analysis")
    print("=" * 60)
    
    # Command summary
    print(f"\n📋 Command Summary:")
    print(f"   Command: {' '.join(sys.argv)}")
    
    # Parsed arguments
    print(f"\n📊 Parsed Arguments:")
    print(f"   • Input file: {args.input_file}")
    if args.preview:
        print("   • Preview mode: ✅ Enabled (no database commits)")
    if args.verbose:
        print("   • Verbose logging: ✅ Enabled (DEBUG level)")
    if args.summary:
        print("   • Show summary: ✅ Enabled")
    
    print(f"   • Log file: {log_filename}")
    
    # Validation results
    if validation_errors:
        print(f"\n❌ Argument Validation Failed:")
        for error in validation_errors:
            print(f"   • {error}")
        return False
    else:
        print(f"\n🔍 Argument Validation:")
        print("   ✅ All arguments are valid")
        print("   ✅ Input file exists and is readable")
        
        # Operations to execute
        print(f"\n📋 Operations to Execute:")
        print(f"   1. Validate prerequisites (automatic_slot_filler.py execution)")
        print(f"   2. Initialize scheduler data (system settings, quotas, profiles)")
        print(f"   3. Process Excel file: {args.input_file}")
        print(f"   4. Validate Excel columns and buyer IDs")
        print(f"   5. Create meetings from Excel data")
        if args.summary:
            print(f"   6. Show processing summary")
        
        if args.preview:
            print("   • Use preview mode (no database changes)")
        if args.verbose:
            print("   • Use verbose logging throughout")
        
        return True


def execute_operations(args) -> Dict[str, Any]:
    """Execute the requested operations."""
    results = {}
    
    try:
        # Operation 1: Validate prerequisites
        print("\n🔍 Validating Prerequisites...")
        if not validate_prerequisites():
            return {'success': False, 'error': 'Prerequisites validation failed'}
        
        print("   ✅ Prerequisites validation passed!")
        
        # Operation 2: Initialize scheduler data
        print("\n🔧 Initializing Scheduler Data...")
        init_result = initialize_scheduler_data()
        results['initialization'] = init_result
        
        if not init_result['success']:
            print(f"   ❌ Scheduler data initialization failed!")
            print(f"   • Error: {init_result.get('error', 'Unknown error')}")
            return {'success': False, 'error': 'Scheduler data initialization failed'}
        
        print("   ✅ Scheduler data initialization completed!")
        summary = init_result['summary']
        print(f"   • System settings: {summary['system_settings_count']} keys")
        print(f"   • Stall types: {summary['stall_types_count']} with quotas")
        print(f"   • Buyer categories: {summary['buyer_categories_count']} with quotas")
        print(f"   • Available sellers: {summary['available_sellers_count']}/{summary['total_sellers_count']}")
        print(f"   • Available buyers: {summary['available_buyers_count']}/{summary['total_buyers_count']}")
        print(f"   • Accepted meetings: {summary['accepted_meetings_count']}")
        
        # Operation 2.5: Resolve starting point stall ID once (optimization)
        print(f"\n🎯 Resolving Starting Point...")
        starting_point_stall_id = get_starting_point_stall_id(args.starting_point)
        if not starting_point_stall_id:
            print(f"   ❌ Starting point '{args.starting_point}' not found!")
            return {'success': False, 'error': f'Starting point {args.starting_point} not found'}
        
        print(f"   ✅ Starting point '{args.starting_point}' resolved to stall_id: {starting_point_stall_id}")
        
        # Operation 3: Process Excel file and get buyer IDs
        print(f"\n📄 Processing Excel File...")
        excel_result = process_excel_file(args.input_file, args.preview)
        results['excel_processing'] = excel_result
        
        if not excel_result['success']:
            print(f"   ❌ Excel file processing failed!")
            print(f"   • Error: {excel_result.get('error', 'Unknown error')}")
            return {'success': False, 'error': 'Excel file processing failed'}
        
        print("   ✅ Excel file processing completed!")
        
        # Operation 4: Execute Core Scheduling Logic for Excel Buyers
        print(f"\n🎯 Executing Core Scheduling Logic for Excel Buyers...")
        init_data = init_result['data']
        
        # Initialize global time conflicts counter
        total_number_of_meeting_not_allocated_time_conflicts = [0]  # Use list for mutable reference
        
        # Get user IDs from Excel processing results
        if 'processing_results' in excel_result:
            # Get list of user IDs from Excel processing results
            excel_user_ids = []
            for result in excel_result['processing_results']:
                if result.get('status') == 'success' and 'user_id' in result:
                    excel_user_id = result['user_id']
                    excel_user_ids.append(excel_user_id)
                    logging.info(f"Found valid user_id from Excel: {excel_user_id}")
            
            if not excel_user_ids:
                error_msg = "No valid user IDs found in Excel processing results"
                logging.error(error_msg)
                print(f"   ❌ {error_msg}!")
                return {'success': False, 'error': error_msg}
            
            print(f"   📋 Processing {len(excel_user_ids)} buyer(s) from Excel: {excel_user_ids}")
            logging.info(f"Total valid user IDs from Excel to process: {len(excel_user_ids)}")
            logging.info(f"Excel user IDs: {excel_user_ids}")
            
            # Load buyer profiles for the specific Excel user IDs
            from scheduler_db_queries import fetch_buyer_profiles_from_list
            excel_buyer_profiles = fetch_buyer_profiles_from_list(excel_user_ids)
            print(f"   👥 Loaded {len(excel_buyer_profiles)} buyer profiles from Excel user IDs")
            logging.info(f"Loaded {len(excel_buyer_profiles)} buyer profiles from Excel user IDs")
            
            # Update init_data with Excel-specific buyers
            init_data['available_buyers'] = excel_buyer_profiles
            init_data['total_buyers'] = len(excel_buyer_profiles)
            
            # Multi-run iterative approach to reduce time conflicts
            max_runs = 1 #args.max_runs
            run_number = 1
            previous_conflicts = float('inf')
            all_runs_results = []
            
            print(f"\n🔄 Starting Multi-Run Iterative Scheduling (Max {max_runs} runs)")
            logging.info(f"Starting Multi-Run Iterative Scheduling (Max {max_runs} runs)")
            
            while run_number <= max_runs:
                # Reset conflict counter for this run
                total_number_of_meeting_not_allocated_time_conflicts[0] = 0
                
                # Log run start
                print(f"\n🔄 Starting Run {run_number}/{max_runs}")
                logging.info(f"=" * 60)
                logging.info(f"STARTING RUN {run_number}/{max_runs}")
                logging.info(f"=" * 60)
                
                # Process each buyer from Excel file with appropriate logic
                all_scheduling_results = []
                
                for buyer_index, excel_user_id in enumerate(excel_user_ids):
                    is_first_buyer = (buyer_index == 0)
                    buyer_type = "FIRST BUYER" if is_first_buyer else f"BUYER #{buyer_index + 1} (Second Buyer Onwards)"
                    
                    print(f"\n   👤 Processing {buyer_type} - User ID {excel_user_id}...")
                    
                    if is_first_buyer:
                        # Process first buyer using the Excel user_id directly
                        print(f"   🚀 Using FIRST BUYER scheduling logic for user_id {excel_user_id}...")
                        logging.info(f"Processing FIRST BUYER - Excel user_id: {excel_user_id}")
                        logging.info(f"Starting point: {args.starting_point}")
                        logging.info(f"Target date: {args.validated_date}")
                        logging.info(f"Preview mode: {args.preview}")
                        
                        # Log available meetings for this buyer
                        buyer_meetings = [m for m in init_data['accepted_meetings'] 
                                        if m['buyer_id'] == excel_user_id]
                        logging.info(f"Found {len(buyer_meetings)} accepted meetings for buyer {excel_user_id}")
                        
                        core_scheduling_result = execute_core_scheduling_logic_first_buyer(
                            accepted_meetings=init_data['accepted_meetings'],
                            buyer_id=excel_user_id,  # This is the user_id from Excel
                            available_buyers=excel_user_ids,  # List of all Excel user IDs 
                            available_sellers=init_data['available_sellers'],
                            starting_point=args.starting_point,
                            target_date=args.validated_date,
                            preview_mode=args.preview,
                            seller_distance_cache=init_data['seller_distance_cache'],
                            total_number_of_meeting_not_allocated_time_conflicts=total_number_of_meeting_not_allocated_time_conflicts
                        )
                    else:
                        # Use second buyer onwards logic
                        print(f"   🔄 Using SECOND BUYER ONWARDS scheduling logic...")
                        core_scheduling_result = execute_core_scheduling_logic_second_buyer_onwards(
                            buyer_id=excel_user_id,
                            available_buyers=init_data['available_buyers'],
                            available_sellers=init_data['available_sellers'],
                            starting_point_stall_id=starting_point_stall_id,
                            target_date=args.validated_date,
                            preview_mode=args.preview,
                            seller_distance_cache=init_data['seller_distance_cache'],
                            total_number_of_meeting_not_allocated_time_conflicts=total_number_of_meeting_not_allocated_time_conflicts
                        )
                    
                    all_scheduling_results.append(core_scheduling_result)
                
                if core_scheduling_result['success']:
                    print(f"   ✅ {buyer_type} scheduling completed!")
                    print(f"   • Meetings scheduled: {core_scheduling_result.get('meetings_scheduled', 0)}")
                    print(f"   • Time slots updated: {core_scheduling_result.get('time_slots_updated', 0)}")
                    if core_scheduling_result.get('remaining_unallocated_sellers'):
                        print(f"   • Unallocated sellers: {len(core_scheduling_result['remaining_unallocated_sellers'])}")
                else:
                    print(f"   ❌ {buyer_type} scheduling failed!")
                    print(f"   • Error: {core_scheduling_result.get('error', 'Unknown error')}")
                
                    # After each buyer (except the last), refetch accepted meetings for real-time consistency
                    if not is_first_buyer and buyer_index < len(excel_user_ids) - 1:
                        print(f"   🔄 Refetching data for next buyer...")
                        # Note: In the new logic, data is refetched within the second buyer onwards function
                
                # Check run completion and conflicts
                current_conflicts = total_number_of_meeting_not_allocated_time_conflicts[0]
                
                # Combine results for this run
                total_meetings = sum(r.get('meetings_scheduled', 0) for r in all_scheduling_results)
                total_updates = sum(r.get('time_slots_updated', 0) for r in all_scheduling_results)
                total_failures = sum(r.get('failed_updates', 0) for r in all_scheduling_results)
                successful_buyers = sum(1 for r in all_scheduling_results if r.get('success', False))
                
                run_result = {
                    'run_number': run_number,
                    'buyers_processed': len(excel_user_ids),
                    'successful_buyers': successful_buyers,
                    'meetings_scheduled': total_meetings,
                    'time_slots_updated': total_updates,
                    'failed_updates': total_failures,
                    'time_conflicts_count': current_conflicts,
                    'detailed_results': all_scheduling_results
                }
                all_runs_results.append(run_result)
                
                # Log run completion
                print(f"   ✅ Run {run_number} completed!")
                print(f"   • Meetings scheduled: {total_meetings}")
                print(f"   • Time conflicts: {current_conflicts}")
                logging.info(f"Run {run_number} completed: {total_meetings} meetings, {current_conflicts} conflicts")
                
                # Check termination conditions
                if current_conflicts == 0:
                    print(f"   🎉 SUCCESS: All time conflicts resolved in Run {run_number}!")
                    logging.info(f"SUCCESS: All time conflicts resolved in Run {run_number}")
                    break
                elif current_conflicts >= previous_conflicts:
                    print(f"   ⚠️  No improvement from Run {run_number-1} ({previous_conflicts}) to Run {run_number} ({current_conflicts})")
                    logging.info(f"No improvement from Run {run_number-1} to Run {run_number}, terminating")
                    break
                elif run_number == max_runs:
                    print(f"   ⚠️  Reached maximum runs ({max_runs}), terminating with {current_conflicts} remaining conflicts")
                    logging.info(f"Reached maximum runs ({max_runs}), terminating with {current_conflicts} remaining conflicts")
                    break
                else:
                    improvement = previous_conflicts - current_conflicts
                    print(f"   📈 Improvement: {improvement} fewer conflicts (from {previous_conflicts} to {current_conflicts})")
                    logging.info(f"Improvement: {improvement} fewer conflicts, continuing to next run")
                
                # Prepare for next run
                previous_conflicts = current_conflicts
                run_number += 1
                
                # Brief pause between runs for clarity
                print(f"   ⏳ Preparing for Run {run_number}...")
            
            # Final results summary
            final_run = all_runs_results[-1] if all_runs_results else None
            if final_run:
                final_conflicts = final_run['time_conflicts_count']
                total_runs_executed = len(all_runs_results)
                
                print(f"\n📊 Multi-Run Summary:")
                print(f"   • Total runs executed: {total_runs_executed}")
                print(f"   • Final time conflicts: {final_conflicts}")
                print(f"   • Final meetings scheduled: {final_run['meetings_scheduled']}")
                
                logging.info(f"Multi-Run Summary: {total_runs_executed} runs, {final_conflicts} final conflicts")
                
                # Use final run results for core_scheduling_result
                core_scheduling_result = {
                    'success': final_run['successful_buyers'] > 0,
                    'buyers_processed': final_run['buyers_processed'],
                    'successful_buyers': final_run['successful_buyers'],
                    'meetings_scheduled': final_run['meetings_scheduled'],
                    'time_slots_updated': final_run['time_slots_updated'],
                    'failed_updates': final_run['failed_updates'],
                    'time_conflicts_count': final_run['time_conflicts_count'],
                    'starting_point': args.starting_point,
                    'starting_point_stall_id': starting_point_stall_id,
                    'target_date': args.validated_date,
                    'preview_mode': args.preview,
                    'detailed_results': final_run['detailed_results'],
                    'total_runs_executed': total_runs_executed,
                    'all_runs_results': all_runs_results
                }
            else:
                # Fallback if no runs completed
                core_scheduling_result = {
                    'success': False,
                    'error': 'No runs completed successfully',
                    'buyers_processed': len(excel_user_ids),
                    'successful_buyers': 0,
                    'meetings_scheduled': 0,
                    'time_slots_updated': 0,
                    'failed_updates': 0,
                    'time_conflicts_count': total_number_of_meeting_not_allocated_time_conflicts[0],
                    'starting_point': args.starting_point,
                    'starting_point_stall_id': starting_point_stall_id,
                    'target_date': args.validated_date,
                    'preview_mode': args.preview,
                    'total_runs_executed': 0,
                    'all_runs_results': []
                }
        else:
            print(f"   ❌ No processing results found in Excel data!")
            return {'success': False, 'error': 'No processing results found in Excel data'}
        
        results['core_scheduling'] = core_scheduling_result
        
        if core_scheduling_result['success']:
            print("   ✅ Core scheduling logic completed!")
            print(f"   • Buyers processed: {core_scheduling_result['buyers_processed']}")
            print(f"   • Successful buyers: {core_scheduling_result['successful_buyers']}")
            print(f"   • Total meetings scheduled: {core_scheduling_result['meetings_scheduled']}")
            print(f"   • Total time slots updated: {core_scheduling_result['time_slots_updated']}")
            print(f"   • Time conflicts count: {core_scheduling_result['time_conflicts_count']}")
            print(f"   • Starting point: {core_scheduling_result['starting_point']} (stall_id: {core_scheduling_result['starting_point_stall_id']})")
            print(f"   • Target date: {core_scheduling_result['target_date']}")
            if core_scheduling_result['failed_updates'] > 0:
                print(f"   • Failed updates: {core_scheduling_result['failed_updates']}")
            if args.preview:
                print("   🔍 PREVIEW MODE: No actual database changes made")
            
            # Log the summary to log file
            logging.info("Core scheduling logic completed!")
            logging.info(f"   • Buyers processed: {core_scheduling_result['buyers_processed']}")
            logging.info(f"   • Successful buyers: {core_scheduling_result['successful_buyers']}")
            logging.info(f"   • Total meetings scheduled: {core_scheduling_result['meetings_scheduled']}")
            logging.info(f"   • Total time slots updated: {core_scheduling_result['time_slots_updated']}")
            logging.info(f"   • Time conflicts count: {core_scheduling_result['time_conflicts_count']}")
            logging.info(f"   • Starting point: {core_scheduling_result['starting_point']} (stall_id: {core_scheduling_result['starting_point_stall_id']})")
            logging.info(f"   • Target date: {core_scheduling_result['target_date']}")
            if core_scheduling_result['failed_updates'] > 0:
                logging.info(f"   • Failed updates: {core_scheduling_result['failed_updates']}")
            if args.preview:
                logging.info("   🔍 PREVIEW MODE: No actual database changes made")
        else:
            print(f"   ❌ Core scheduling logic failed!")
            print(f"   • Error: {core_scheduling_result.get('error', 'Unknown error')}")
            
            # Log the failure to log file
            logging.error(f"Core scheduling logic failed!")
            logging.error(f"   • Error: {core_scheduling_result.get('error', 'Unknown error')}")
        
        # Operation 5: Show summary (if requested)
        if args.summary:
            print("\n📋 Core Scheduling Summary...")
            if core_scheduling_result['success']:
                print(f"✅ Core scheduling completed successfully!")
                print(f"   • Buyers processed: {core_scheduling_result['buyers_processed']}")
                print(f"   • Successful buyers: {core_scheduling_result['successful_buyers']}")
                print(f"   • Total meetings scheduled: {core_scheduling_result['meetings_scheduled']}")
                print(f"   • Total time slots updated: {core_scheduling_result['time_slots_updated']}")
                print(f"   • Time conflicts count: {core_scheduling_result['time_conflicts_count']}")
                print(f"   • Failed updates: {core_scheduling_result['failed_updates']}")
                print(f"   • Starting point: {core_scheduling_result['starting_point']} (stall_id: {core_scheduling_result['starting_point_stall_id']})")
                print(f"   • Target date: {core_scheduling_result['target_date']}")
                if core_scheduling_result['preview_mode']:
                    print("   🔍 PREVIEW MODE: No actual database changes made")
            else:
                print(f"❌ Core scheduling failed: {core_scheduling_result.get('error', 'Unknown error')}")
        
        return results
        
    except Exception as e:
        error_msg = f"Error during operations execution: {str(e)}"
        logging.error(error_msg)
        print(f"\n❌ {error_msg}")
        return {'success': False, 'error': error_msg}

def main():
    """Main function with enhanced argument handling."""
    
    # Special case: if no arguments provided, show help
    if len(sys.argv) == 1:
        parser = argparse.ArgumentParser(
            description='Automatic Meeting Scheduler - Schedule meetings from Excel files',
            formatter_class=argparse.RawDescriptionHelpFormatter,
            epilog="""
Examples:
  python automatic_meeting_scheduler.py -i meetings.xlsx -d "15/01/2025"
  python automatic_meeting_scheduler.py -i meetings.xlsx -d "15-01-25" --preview
  python automatic_meeting_scheduler.py -i meetings.xlsx -d "20250115" -v -s G2

Prerequisites:
  - automatic_slot_filler.py must be executed first to populate time slots
  - Excel file must contain 'Buyer ID' column with valid buyer profile IDs

For more information, see the documentation.
            """
        )
        parser.add_argument('-i', '--input-file', type=str, required=True,
                           help='Excel file (.xlsx/.xls) with meeting data containing Buyer ID column (REQUIRED)')
        parser.add_argument('-d', '--date', type=str, required=True,
                           help='Target date for scheduling in format DD/MM/YYYY, DD/MM/YY, DD-MM-YYYY, DD-MM-YY, or YYYYMMDD (REQUIRED)')
        parser.add_argument('--preview', action='store_true',
                           help='Preview mode - log operations but do not commit to database')
        parser.add_argument('-v', '--verbose', action='store_true',
                           help='Enable verbose logging (DEBUG level)')
        parser.add_argument('-s', '--starting-point', type=str, default='ENTEX1',
                           help='Starting point for meeting scheduling (default: ENTEX1)')
        parser.add_argument('--summary', action='store_true',
                           help='Show summary after operations')
        
        print("🚀 Automatic Meeting Scheduler - Help")
        print("=" * 40)
        print("\nThis script requires an input Excel file and target date.")
        parser.print_help()
        sys.exit(0)
    
    # Parse arguments
    args = parse_arguments()
    
    # Setup logging first
    log_filename = setup_logging(args, "meeting_scheduler")
    
    # Initialize system settings BEFORE validation (needed for date validation)
    with app.app_context():
        try:
            system_settings = get_system_settings()
        except Exception as e:
            print(f"❌ Error loading system settings: {str(e)}")
            sys.exit(1)
    
    # Validate arguments (including date range validation)
    validation_errors = validate_arguments(args, system_settings)
    
    # Handle validation errors
    if validation_errors:
        print("❌ Argument validation failed:")
        for error in validation_errors:
            print(f"   • {error}")
        print("\nUse -h or --help for usage information.")
        
        # Log the errors
        logging.error("Argument validation failed:")
        for error in validation_errors:
            logging.error(f"  - {error}")
        
        sys.exit(1)
    
    # Display argument summary
    if not display_argument_summary(args, validation_errors, log_filename):
        sys.exit(1)
    
    # Get user confirmation with date information
    confirmation_msg = get_operation_confirmation_message_with_date(
        args.input_file, 
        args.formatted_date, 
        args.preview
    )
    if get_user_confirmation(confirmation_msg):
        # Log execution start
        log_execution_start(args, True, log_filename, "Automatic Meeting Scheduler")
        
        # Execute operations within Flask app context
        with app.app_context():
            try:
                results = execute_operations(args)
                
                print("\n" + "=" * 60)
                print("✅ Automatic Meeting Scheduler completed successfully!")
                logging.info("Automatic Meeting Scheduler completed successfully!")
                
            except Exception as e:
                print(f"\n❌ Error during execution: {str(e)}")
                logging.error(f"Error during execution: {str(e)}")
                import traceback
                logging.error(traceback.format_exc())
                sys.exit(1)
    else:
        print("\nOperation cancelled by user.")
        log_execution_start(args, False, log_filename, "Automatic Meeting Scheduler")
        logging.info("Operation cancelled by user")
        sys.exit(0)

if __name__ == "__main__":
    main()
