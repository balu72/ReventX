#!/usr/bin/env python3
"""
Process Distance Matrix

This module provides a comprehensive command-line interface for processing
Excel distance matrix files and populating the stall_distance_matrix table.
It follows the same pattern as other scheduler modules with Flask integration
for database connectivity.

Features:
- Excel file validation and processing
- Command-line argument parsing with validation
- Interactive user confirmation for operations
- Comprehensive logging to timestamped files
- Preview mode for safe testing
- Database integration with Flask and SQLAlchemy

Prerequisites:
- Excel file must contain distance matrix data with stall names
- Database must be accessible and contain stall_inventory data
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
    db, StallInventory, StallDistanceMatrix
)

# Create minimal Flask app
app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = os.getenv('DATABASE_URI', 'postgresql://splash25user:splash25password@localhost:5432/splash25_core_db')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# Initialize SQLAlchemy with the same instance from scheduler_models
db.init_app(app)

from scheduler_log_utils import (
    setup_logging, log_execution_start, get_user_confirmation
)

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

def get_stall_id_map() -> Dict[str, int]:
    """Returns a mapping from stall name to id from stall_inventory using SQLAlchemy models."""
    try:
        stalls = StallInventory.query.all()
        stall_map = {stall.stall_number: stall.id for stall in stalls}
        logging.info(f"Retrieved {len(stall_map)} stall mappings from database")
        return stall_map
    except Exception as e:
        logging.error(f"Error retrieving stall mappings: {str(e)}")
        raise

def process_distance_matrix(file_path: str, preview_mode: bool = False, clear_existing: bool = True, batch_size: int = 25) -> Dict[str, Any]:
    """
    Process Excel distance matrix file and populate database.
    
    Args:
        file_path: Path to Excel file containing distance matrix
        preview_mode: If True, log operations but don't commit to database
        clear_existing: If True, clear all existing data before inserting new data
        batch_size: Number of Excel rows (destinations) to process in each batch before committing
    
    Returns:
        Dict containing processing results and statistics
    """
    try:
        logging.info(f"Starting distance matrix processing: {file_path}")
        logging.info(f"Batch size: {batch_size}")
        
        # Step 1: Get stall name to id mapping
        stall_name_to_id = get_stall_id_map()
        
        # Step 2: Read Excel file
        df = pd.read_excel(file_path, header=None)
        logging.info(f"Read Excel file with shape: {df.shape}")
        
        # Step 3: Extract origins from first row starting from column B
        origins_row = df.iloc[0, 1:].tolist()  # B1, C1, D1, etc.
        origins = []
        for origin_name in origins_row:
            if pd.isna(origin_name) or origin_name == '':
                break  # Stop at first empty cell
            origins.append(origin_name)
        
        # Step 4: Extract destinations from column A starting from row 2
        destinations_column = df.iloc[1:, 0].tolist()  # A2, A3, A4, etc.
        destinations = []
        for dest_name in destinations_column:
            if pd.isna(dest_name) or dest_name == '':
                break  # Stop at first empty cell
            destinations.append(dest_name)
        
        logging.info(f"Found {len(origins)} origins and {len(destinations)} destinations")
        
        # Step 5: Special case mapping - "MASTER ENTRY" maps to id 900
        if origins and origins[0] == "MASTER ENTRY":
            stall_name_to_id["MASTER ENTRY"] = 900
            logging.info("Applied special case mapping: MASTER ENTRY -> 900")
        
        # Step 6: Prepare distance data
        total_records_prepared = 0
        skipped_origins = 0
        skipped_destinations = 0
        skipped_distances = 0
        
        if preview_mode:
            # In preview mode, just count what would be processed
            for dest_idx, dest_name in enumerate(destinations):
                dest_id = stall_name_to_id.get(dest_name)
                if not dest_id:
                    skipped_destinations += 1
                    continue
                    
                for origin_idx, origin_name in enumerate(origins):
                    origin_id = 900 if origin_name == "MASTER ENTRY" else stall_name_to_id.get(origin_name)
                    if not origin_id:
                        skipped_origins += 1
                        continue
                        
                    dest_row = dest_idx + 1
                    origin_col = origin_idx + 1
                    distance = df.iloc[dest_row, origin_col]
                    
                    if pd.isna(distance):
                        skipped_distances += 1
                        continue
                        
                    total_records_prepared += 1
            
            estimated_batches = (len(destinations) + batch_size - 1) // batch_size
            logging.info(f"PREVIEW MODE: Would process {len(destinations)} destination rows in batches of {batch_size} rows ({estimated_batches} batches)")
            logging.info(f"PREVIEW MODE: Would insert {total_records_prepared} distance records")
            logging.info(f"PREVIEW MODE: Skipped: {skipped_origins} origins, {skipped_destinations} destinations, {skipped_distances} empty distances")
            
            return {
                'success': True,
                'preview_mode': True,
                'destination_rows': len(destinations),
                'records_prepared': total_records_prepared,
                'batch_size': batch_size,
                'estimated_batches': estimated_batches,
                'clear_existing': clear_existing,
                'skipped_origins': skipped_origins,
                'skipped_destinations': skipped_destinations,
                'skipped_distances': skipped_distances,
                'file_processed': file_path
            }
        
        # Step 7: Delete existing data (if clear_existing is True)
        deleted_count = 0
        if clear_existing:
            logging.info("Deleting existing distance matrix data...")
            deleted_count = StallDistanceMatrix.query.count()
            StallDistanceMatrix.query.delete()
            db.session.commit()
            logging.info(f"Deleted {deleted_count} existing distance records")
        else:
            logging.info("Keeping existing distance matrix data (clear_existing=False)")
        
        # Step 8: Process and insert data in batches (by destination rows)
        total_inserted = 0
        batch_count = 0
        current_batch_records = []
        rows_in_current_batch = 0
        
        for dest_idx, dest_name in enumerate(destinations):
            dest_id = stall_name_to_id.get(dest_name)
            if not dest_id:
                logging.warning(f"Destination '{dest_name}' not found in stall_inventory")
                skipped_destinations += 1
                continue
                
            dest_row = dest_idx + 1
            row_records = []  # Records for this destination row
            
            # Process all origins for this destination
            for origin_idx, origin_name in enumerate(origins):
                origin_id = 900 if origin_name == "MASTER ENTRY" else stall_name_to_id.get(origin_name)
                if not origin_id:
                    skipped_origins += 1
                    continue
                    
                origin_col = origin_idx + 1
                distance = df.iloc[dest_row, origin_col]
                
                if pd.isna(distance):
                    skipped_distances += 1
                    continue
                    
                # Create distance object for this cell
                distance_obj = StallDistanceMatrix(
                    origin_stall_id=origin_id,
                    destination_stall_id=dest_id,
                    distance=float(distance),
                    created_at=datetime.utcnow(),
                    updated_at=datetime.utcnow()
                )
                row_records.append(distance_obj)
            
            # Add this row's records to current batch
            current_batch_records.extend(row_records)
            rows_in_current_batch += 1
            
            # Commit batch when we reach batch_size rows
            if rows_in_current_batch >= batch_size:
                if current_batch_records:
                    db.session.bulk_save_objects(current_batch_records)
                    db.session.commit()
                    
                    batch_count += 1
                    total_inserted += len(current_batch_records)
                    logging.info(f"Batch {batch_count}: Processed {rows_in_current_batch} rows, inserted {len(current_batch_records)} records (Total: {total_inserted})")
                
                # Reset for next batch
                current_batch_records = []
                rows_in_current_batch = 0
        
        # Insert any remaining records from the final partial batch
        if current_batch_records:
            db.session.bulk_save_objects(current_batch_records)
            db.session.commit()
            
            batch_count += 1
            total_inserted += len(current_batch_records)
            logging.info(f"Final batch {batch_count}: Processed {rows_in_current_batch} rows, inserted {len(current_batch_records)} records (Total: {total_inserted})")
        
        logging.info(f"Successfully processed {len(destinations)} destination rows and inserted {total_inserted} distance records in {batch_count} batches")
        
        return {
            'success': True,
            'preview_mode': False,
            'records_inserted': total_inserted,
            'destination_rows_processed': len(destinations),
            'records_deleted': deleted_count,
            'batch_count': batch_count,
            'batch_size': batch_size,
            'skipped_origins': skipped_origins,
            'skipped_destinations': skipped_destinations,
            'skipped_distances': skipped_distances,
            'file_processed': file_path
        }
        
    except Exception as e:
        error_msg = f"Error processing distance matrix: {str(e)}"
        logging.error(error_msg)
        return {
            'success': False,
            'error': error_msg
        }

def parse_arguments():
    """Parse command line arguments."""
    parser = argparse.ArgumentParser(
        description='Process Distance Matrix - Convert Excel distance data to database',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  %(prog)s -i GT_distance_table_manual.xlsx
  %(prog)s -i distance_matrix.xlsx -p
  %(prog)s -i distance_matrix.xlsx --preview --summary
  %(prog)s -i distance_matrix.xlsx -b 50 --summary
  %(prog)s -i distance_matrix.xlsx --batch-size 10 -v --summary
  %(prog)s --input-file distance_data.xlsx -p -b 100 --summary

For more information, see the documentation.
        """
    )
    
    # Required arguments
    parser.add_argument('-i', '--input-file', type=str, required=True,
                       help='Excel file (.xlsx/.xls) containing distance matrix data (REQUIRED)')
    
    # Optional arguments
    parser.add_argument('-p', '--preview', action='store_true',
                       help='Preview mode - log operations but do not commit to database')
    parser.add_argument('-c', '--clear-existing', action='store_true', default=True,
                       help='Clear all existing data from stall_distance_matrix table before inserting new data (default: True)')
    parser.add_argument('-b', '--batch-size', type=int, default=25,
                       help='Number of Excel rows (destinations) to process in each batch before committing to database (default: 25)')
    parser.add_argument('--summary', action='store_true',
                       help='Show final summary after operations')
    parser.add_argument('-v', '--verbose', action='store_true',
                       help='Enable verbose logging (DEBUG level)')
    parser.add_argument('-l', '--logging', type=str,
                       choices=['i', 'info', 'INFO', 'e', 'error', 'ERROR', 
                               'w', 'warn', 'WARN', 'd', 'debug', 'DEBUG'],
                       default='info',
                       help='Set logging level (default: info). Verbose (-v) overrides this to debug.')
    
    return parser.parse_args()

def validate_arguments(args) -> List[str]:
    """Validate argument combinations and check for required parameters."""
    errors = []
    
    # Validate input file
    if not args.input_file:
        errors.append("Input file is required (-i/--input-file)")
    else:
        file_errors = validate_input_file(args.input_file)
        errors.extend(file_errors)
    
    # Validate batch size
    if args.batch_size <= 0:
        errors.append("Batch size must be a positive integer")
    elif args.batch_size > 1000:
        errors.append("Batch size should not exceed 1000 for optimal performance")
    
    return errors

def display_argument_summary(args, validation_errors: List[str], log_filename: str):
    """Display summary of parsed arguments and validation results."""
    print("🔍 Process Distance Matrix - Argument Analysis")
    print("=" * 60)
    
    # Command summary
    print(f"\n📋 Command Summary:")
    print(f"   Command: {' '.join(sys.argv)}")
    
    # Parsed arguments
    print(f"\n📊 Parsed Arguments:")
    print(f"   • Input file: {args.input_file}")
    if args.preview:
        print("   • Preview mode: ✅ Enabled (no database commits)")
    print(f"   • Clear existing data: {'✅ Enabled' if args.clear_existing else '❌ Disabled'}")
    print(f"   • Batch size: {args.batch_size} rows")
    if args.verbose:
        print("   • Verbose logging: ✅ Enabled (DEBUG level)")
    if args.summary:
        print("   • Show summary: ✅ Enabled")
    
    effective_logging = 'debug' if args.verbose else args.logging
    print(f"   • Logging level: {effective_logging.upper()}")
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
        print(f"   1. Read stall inventory mappings from database")
        print(f"   2. Process Excel file: {args.input_file}")
        print(f"   3. Extract distance matrix data")
        print(f"   4. Validate stall names against database")
        print(f"   5. {'Preview' if args.preview else 'Delete existing and insert new'} distance data")
        if args.summary:
            print(f"   6. Show processing summary")
        
        if args.preview:
            print("   • Use preview mode (no database changes)")
        
        return True

def execute_operations(args) -> Dict[str, Any]:
    """Execute the distance matrix processing operations."""
    results = {}
    
    try:
        print("\n🔧 Processing Distance Matrix...")
        
        # Process the distance matrix file
        processing_result = process_distance_matrix(args.input_file, args.preview, args.clear_existing, args.batch_size)
        results['processing'] = processing_result
        
        if not processing_result['success']:
            print(f"   ❌ Distance matrix processing failed!")
            print(f"   • Error: {processing_result.get('error', 'Unknown error')}")
            return {'success': False, 'error': 'Distance matrix processing failed'}
        
        print("   ✅ Distance matrix processing completed!")
        
        if processing_result['preview_mode']:
            print(f"   🔍 PREVIEW MODE - No database changes made")
            print(f"   • Records prepared: {processing_result['records_prepared']}")
        else:
            print(f"   • Records deleted: {processing_result['records_deleted']}")
            print(f"   • Records inserted: {processing_result['records_inserted']}")
        
        print(f"   • Skipped origins: {processing_result['skipped_origins']}")
        print(f"   • Skipped destinations: {processing_result['skipped_destinations']}")
        print(f"   • Skipped empty distances: {processing_result['skipped_distances']}")
        
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
            description='Process Distance Matrix - Convert Excel distance data to database',
            formatter_class=argparse.RawDescriptionHelpFormatter,
            epilog="""
Examples:
  python process_distance_matrix.py -i GT_distance_table_manual.xlsx
  python process_distance_matrix.py -i distance_matrix.xlsx -p
  python process_distance_matrix.py -i distance_matrix.xlsx --preview --summary

Prerequisites:
  - Excel file must contain distance matrix data with stall names
  - Database must be accessible and contain stall_inventory data

For more information, see the documentation.
            """
        )
        parser.add_argument('-i', '--input-file', type=str, required=True,
                           help='Excel file (.xlsx/.xls) containing distance matrix data (REQUIRED)')
        parser.add_argument('-p', '--preview', action='store_true',
                           help='Preview mode - log operations but do not commit to database')
        parser.add_argument('--summary', action='store_true',
                           help='Show final summary after operations')
        parser.add_argument('-v', '--verbose', action='store_true',
                           help='Enable verbose logging (DEBUG level)')
        parser.add_argument('-l', '--logging', type=str, default='info',
                           help='Set logging level (default: info)')
        
        print("🚀 Process Distance Matrix - Help")
        print("=" * 40)
        print("\nThis script requires an input Excel file containing distance matrix data.")
        parser.print_help()
        sys.exit(0)
    
    # Parse arguments
    args = parse_arguments()
    
    # Setup logging first
    log_filename = setup_logging(args, "distance_matrix_processor")
    
    # Validate arguments
    validation_errors = validate_arguments(args)
    
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
    
    # Get user confirmation
    confirmation_msg = f"\n🔍 Ready to process distance matrix from: {args.input_file}"
    if args.preview:
        confirmation_msg += "\n   • PREVIEW MODE: No database changes will be made"
    confirmation_msg += "\n\nProceed with distance matrix processing? (y/n): "
    
    if get_user_confirmation(confirmation_msg):
        # Log execution start
        log_execution_start(args, True, log_filename, "Process Distance Matrix")
        
        # Execute operations within Flask app context
        with app.app_context():
            try:
                results = execute_operations(args)
                
                # Show summary if requested
                if args.summary and results.get('processing', {}).get('success'):
                    print("\n📋 Processing Summary")
                    print("=" * 40)
                    processing = results['processing']
                    
                    if processing['preview_mode']:
                        print("🔍 PREVIEW MODE - No database changes made")
                        print(f"   • Records that would be inserted: {processing['records_prepared']}")
                    else:
                        print("✅ Database updated successfully")
                        print(f"   • Records deleted: {processing['records_deleted']}")
                        print(f"   • Records inserted: {processing['records_inserted']}")
                    
                    print(f"   • File processed: {processing['file_processed']}")
                    print(f"   • Skipped origins: {processing['skipped_origins']}")
                    print(f"   • Skipped destinations: {processing['skipped_destinations']}")
                    print(f"   • Skipped empty distances: {processing['skipped_distances']}")
                
                print("\n" + "=" * 60)
                print("✅ Process Distance Matrix completed successfully!")
                logging.info("Process Distance Matrix completed successfully!")
                
            except Exception as e:
                print(f"\n❌ Error during execution: {str(e)}")
                logging.error(f"Error during execution: {str(e)}")
                import traceback
                logging.error(traceback.format_exc())
                sys.exit(1)
    else:
        print("\nOperation cancelled by user.")
        log_execution_start(args, False, log_filename, "Process Distance Matrix")
        logging.info("Operation cancelled by user")
        sys.exit(0)

if __name__ == "__main__":
    main()
