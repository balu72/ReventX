#!/usr/bin/env python3
"""
Seller Time Slots Population Tool

This script provides a dedicated command-line interface for populating
time slots for all sellers based on system settings.

Features:
- Automatic time slot generation for all sellers
- Clear existing slots by default
- Command-line argument parsing with validation
- Interactive user confirmation for operations
- Comprehensive logging to timestamped files
- Preview mode support
- Summary reporting
"""

import sys
import os
import logging
import argparse
from datetime import datetime
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from dotenv import load_dotenv

# Load environment variables from the backend directory
load_dotenv('../../splash25-backend/.env')

# Import models and utilities from separate modules first
from scheduler_models import (
    db, User, SystemSetting, SellerProfile, BuyerProfile, BuyerCategory, 
    StallType, Stall, StallInventory, Meeting, MeetingStatus, TimeSlot
)

# Create minimal Flask app
app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = os.getenv('DATABASE_URI', 'postgresql://splash25user:splash25password@localhost:5432/splash25_core_db')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# Initialize SQLAlchemy with the same instance from scheduler_models
db.init_app(app)
from scheduler_utils import (
    parse_date_from_iso, parse_time_from_string, 
    parse_meeting_breaks, create_datetime_from_date_time,
    add_minutes_to_time, time_overlaps_with_breaks
)
from scheduler_db_queries import (
    get_system_settings, get_seller_users, get_valid_sellers_with_quota_info
)

# Import additional required modules
import json
from datetime import datetime, timedelta, time, date
from typing import Dict, List, Tuple, Optional, Any

def get_seller_attendee_count(seller_id: int) -> int:
    """Get the number of attendees for a seller based on their stall type."""
    try:
        # Get seller's stall information through the relationship chain
        seller_stall_info = db.session.query(
            User.id.label('user_id'),
            User.username,
            SellerProfile.business_name,
            SellerProfile.is_verified,
            Stall.allocated_stall_number,
            Stall.stall_id,
            StallType.id.label('stall_type_id'),
            StallType.attendees,
            StallType.max_meetings_per_attendee
        ).select_from(User)\
        .join(SellerProfile, User.id == SellerProfile.user_id)\
        .join(Stall, User.id == Stall.seller_id)\
        .join(StallInventory, Stall.stall_id == StallInventory.id)\
        .join(StallType, Stall.stall_type_id == StallType.id)\
        .filter(
            User.id == seller_id,
            User.role == 'seller',
            SellerProfile.is_verified == True,
            Stall.allocated_stall_number.isnot(None),
            Stall.allocated_stall_number != '',
            Stall.stall_id.isnot(None)
        ).first()
        
        if seller_stall_info and seller_stall_info.attendees:
            attendee_count = seller_stall_info.attendees
            logging.debug(f"Seller {seller_id} ({seller_stall_info.username}) has {attendee_count} attendees")
            return attendee_count
        else:
            logging.warning(f"No attendee count found for seller {seller_id}, defaulting to 1")
            return 1  # Default to 1 attendee if not found
            
    except Exception as e:
        logging.error(f"Error getting attendee count for seller {seller_id}: {str(e)}")
        return 1  # Default to 1 attendee on error

def populate_time_slots_for_all_sellers(clear_existing: bool = True, preview_mode: bool = False) -> Dict[str, Any]:
    """Main function to populate time_slots table for all sellers based on system settings."""
    logging.info("Starting time slot population for all sellers")
    
    try:
        # Step 1: Fetch all required data
        logging.info("Fetching system settings...")
        settings = get_system_settings()
        
        # Step 2: Parse system settings
        event_start_date, start_date_formatted = parse_date_from_iso(settings['event_start_date'])
        event_end_date, end_date_formatted = parse_date_from_iso(settings['event_end_date'])
        
        meeting_duration = int(settings['meeting_duration'])
        meeting_interval = int(settings['meeting_interval'])
        
        day_start_time = parse_time_from_string(settings['day_start_time'])
        day_end_time = parse_time_from_string(settings['day_end_time'])
        
        meeting_breaks = parse_meeting_breaks(settings['meeting_breaks'])
        
        logging.info(f"Event period: {start_date_formatted} to {end_date_formatted}")
        logging.info(f"Daily schedule: {day_start_time} to {day_end_time}")
        logging.info(f"Meeting duration: {meeting_duration} minutes, interval: {meeting_interval} minutes")
        logging.info(f"Meeting breaks: {len(meeting_breaks)} configured")
        
        # Step 3: Get valid sellers using consistent validation criteria
        valid_sellers_with_quota, total_sellers_found = get_valid_sellers_with_quota_info()
        if not valid_sellers_with_quota:
            return {
                'success': False,
                'error': 'No valid sellers found using validation criteria',
                'seller_count': 0,
                'total_slots': 0
            }
        
        # Convert to format expected by rest of function: (user_id, username)
        sellers = [(seller['user_id'], seller['username']) for seller in valid_sellers_with_quota]
        logging.info(f"Found {len(sellers)} valid sellers (using consistent validation criteria) out of {total_sellers_found} total sellers")
        
        # Step 4: Clear existing slots if requested
        if clear_existing:
            seller_ids = [seller[0] for seller in sellers]
            deleted_count = TimeSlot.query.filter(TimeSlot.user_id.in_(seller_ids)).count()
            
            if preview_mode:
                logging.info(f"PREVIEW: Would clear {deleted_count} existing time slots")
            else:
                TimeSlot.query.filter(TimeSlot.user_id.in_(seller_ids)).delete(synchronize_session=False)
                logging.info(f"Cleared {deleted_count} existing time slots")
        
        # Step 5: Generate time slots
        total_slots_created = 0
        slots_per_seller = {}
        time_slots_to_create = []
        
        # Loop 1: For each seller
        for seller_id, seller_username in sellers:
            logging.info(f"Processing seller: {seller_username} (ID: {seller_id})")
            seller_slots = 0
            
            current_date = event_start_date
            
            # Loop 2: While start_date <= event_end_date
            while current_date <= event_end_date:
                logging.debug(f"Processing date: {current_date}")
                
                meeting_start_time = day_start_time
                meeting_end_time = add_minutes_to_time(meeting_start_time, meeting_duration)
                
                # Loop 3: Until meeting_end_time >= day_end_time
                while meeting_end_time <= day_end_time:
                    if not time_overlaps_with_breaks(meeting_start_time, meeting_end_time, meeting_breaks):
                        start_datetime = create_datetime_from_date_time(current_date, meeting_start_time)
                        end_datetime = create_datetime_from_date_time(current_date, meeting_end_time)
                        
                        if not preview_mode:
                            # Get attendee count for this seller
                            attendee_count = get_seller_attendee_count(seller_id)
                            
                            # Create multiple time slots based on attendee count
                            for attendee_num in range(attendee_count):
                                time_slot = TimeSlot()
                                time_slot.user_id = seller_id
                                time_slot.start_time = start_datetime
                                time_slot.end_time = end_datetime
                                time_slot.is_available = True
                                time_slot.meeting_id = None
                                time_slot.created_at = datetime.now()
                                
                                time_slots_to_create.append(time_slot)
                                seller_slots += 1
                                
                                logging.debug(f"Created slot {attendee_num + 1}/{attendee_count} for {seller_username} at {start_datetime}")
                                
                                # Batch insert logic
                                if len(time_slots_to_create) >= 100:
                                    db.session.add_all(time_slots_to_create)
                                    db.session.commit()
                                    logging.debug(f"Batch inserted {len(time_slots_to_create)} time slots")
                                    time_slots_to_create = []
                        else:
                            # Preview mode - calculate what would be created
                            attendee_count = get_seller_attendee_count(seller_id)
                            seller_slots += attendee_count  # Add attendee_count instead of 1
                            logging.debug(f"PREVIEW: Would create {attendee_count} time slots for {seller_username} at {start_datetime}")
                    
                    meeting_start_time = add_minutes_to_time(meeting_end_time, meeting_interval)
                    meeting_end_time = add_minutes_to_time(meeting_start_time, meeting_duration)
                
                current_date += timedelta(days=1)
            
            slots_per_seller[seller_username] = seller_slots
            total_slots_created += seller_slots
            
            if preview_mode:
                logging.info(f"PREVIEW: Would create {seller_slots} time slots for {seller_username}")
            else:
                logging.info(f"Created {seller_slots} time slots for {seller_username}")
        
        # Insert any remaining time slots
        if not preview_mode and time_slots_to_create:
            db.session.add_all(time_slots_to_create)
            db.session.commit()
            logging.debug(f"Final batch inserted {len(time_slots_to_create)} time slots")
        
        if not preview_mode:
            db.session.commit()
            logging.info(f"Successfully created {total_slots_created} time slots for {len(sellers)} sellers")
        else:
            logging.info(f"PREVIEW: Would create {total_slots_created} time slots for {len(sellers)} sellers")
        
        return {
            'success': True,
            'seller_count': len(sellers),
            'total_slots': total_slots_created,
            'slots_per_seller': slots_per_seller,
            'event_period': f"{start_date_formatted} to {end_date_formatted}",
            'settings_used': {
                'meeting_duration': meeting_duration,
                'meeting_interval': meeting_interval,
                'day_start_time': str(day_start_time),
                'day_end_time': str(day_end_time),
                'breaks_count': len(meeting_breaks)
            },
            'preview_mode': preview_mode
        }
        
    except Exception as e:
        if not preview_mode:
            db.session.rollback()
        error_msg = f"Error populating time slots: {str(e)}"
        logging.error(error_msg)
        return {
            'success': False,
            'error': error_msg,
            'seller_count': 0,
            'total_slots': 0,
            'preview_mode': preview_mode
        }

def get_time_slots_summary() -> Dict[str, Any]:
    """Get summary of existing time slots by seller."""
    try:
        total_slots = TimeSlot.query.count()
        sellers = get_seller_users()
        slots_by_seller = {}
        
        for seller_id, seller_username in sellers:
            count = TimeSlot.query.filter_by(user_id=seller_id).count()
            available_count = TimeSlot.query.filter_by(user_id=seller_id, is_available=True).count()
            
            slots_by_seller[seller_username] = {
                'total': count,
                'available': available_count,
                'booked': count - available_count
            }
        
        return {
            'success': True,
            'total_slots': total_slots,
            'seller_count': len(sellers),
            'slots_by_seller': slots_by_seller
        }
        
    except Exception as e:
        return {
            'success': False,
            'error': str(e)
        }

def validate_system_settings() -> Dict[str, Any]:
    """Validate that all required system settings exist and are properly formatted."""
    try:
        settings = get_system_settings()
        validation_results = {}
        errors = []
        
        # Validate dates
        try:
            start_date, _ = parse_date_from_iso(settings['event_start_date'])
            end_date, _ = parse_date_from_iso(settings['event_end_date'])
            
            if start_date > end_date:
                errors.append("Event start date is after end date")
            
            validation_results['dates'] = 'valid'
        except Exception as e:
            errors.append(f"Invalid date format: {str(e)}")
            validation_results['dates'] = 'invalid'
        
        # Validate times
        try:
            start_time = parse_time_from_string(settings['day_start_time'])
            end_time = parse_time_from_string(settings['day_end_time'])
            
            if start_time >= end_time:
                errors.append("Day start time is not before end time")
            
            validation_results['times'] = 'valid'
        except Exception as e:
            errors.append(f"Invalid time format: {str(e)}")
            validation_results['times'] = 'invalid'
        
        # Validate numeric values
        try:
            duration = int(settings['meeting_duration'])
            interval = int(settings['meeting_interval'])
            
            if duration <= 0:
                errors.append("Meeting duration must be positive")
            if interval < 0:
                errors.append("Meeting interval cannot be negative")
            
            validation_results['numeric'] = 'valid'
        except (ValueError, TypeError) as e:
            errors.append(f"Invalid numeric values: {str(e)}")
            validation_results['numeric'] = 'invalid'
        
        # Validate breaks
        try:
            breaks = parse_meeting_breaks(settings['meeting_breaks'])
            validation_results['breaks'] = f'{len(breaks)} breaks parsed'
        except Exception as e:
            errors.append(f"Invalid meeting breaks format: {str(e)}")
            validation_results['breaks'] = 'invalid'
        
        return {
            'success': len(errors) == 0,
            'errors': errors,
            'validation_results': validation_results,
            'settings': settings if len(errors) == 0 else None
        }
        
    except Exception as e:
        return {
            'success': False,
            'errors': [f"Failed to validate settings: {str(e)}"],
            'validation_results': {}
        }

# CLI Functions

def determine_log_level(args) -> int:
    """Determine the appropriate logging level based on arguments."""
    if args.verbose:
        return logging.DEBUG
    return logging.INFO

def setup_logging(args) -> str:
    """Setup logging configuration with file and console handlers."""
    # Generate timestamped log filename
    timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
    log_filename = f"populate_seller_time_slots_{timestamp}.log"
    
    # Configure logging
    log_level = determine_log_level(args)
    
    # Create formatters
    file_formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
    console_formatter = logging.Formatter('%(levelname)s: %(message)s')
    
    # Setup root logger
    root_logger = logging.getLogger()
    root_logger.setLevel(logging.DEBUG)  # Always DEBUG for file
    
    # Clear existing handlers
    root_logger.handlers.clear()
    
    # File handler (always DEBUG, append mode)
    file_handler = logging.FileHandler(log_filename, mode='a')
    file_handler.setLevel(logging.DEBUG)
    file_handler.setFormatter(file_formatter)
    root_logger.addHandler(file_handler)
    
    # Console handler (respects logging level setting)
    console_handler = logging.StreamHandler()
    console_handler.setLevel(log_level)
    console_handler.setFormatter(console_formatter)
    root_logger.addHandler(console_handler)
    
    return log_filename

def parse_arguments():
    """Parse command line arguments."""
    parser = argparse.ArgumentParser(
        description='Seller Time Slots Population Tool',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  %(prog)s                           # Populate time slots (clear existing by default)
  %(prog)s -v                        # Verbose logging
  %(prog)s -p                        # Preview mode (no database changes)
  %(prog)s --validate                # Validate system settings first
  %(prog)s --summary                 # Show summary after completion
  %(prog)s -v -p --validate --summary # Full preview with validation and summary

For more information, see the documentation.
        """
    )
    
    # Global options
    parser.add_argument('-v', '--verbose', action='store_true',
                       help='Enable verbose logging (DEBUG level)')
    parser.add_argument('-c', '--clear-existing', action='store_true', default=True,
                       help='Clear existing time slots first (default: True)')
    parser.add_argument('-p', '--preview', action='store_true',
                       help='Preview mode - log operations but do not commit to database')
    parser.add_argument('--summary', action='store_true',
                       help='Show summary after operations')
    parser.add_argument('--validate', action='store_true',
                       help='Validate system settings before populating time slots')
    
    return parser.parse_args()

def display_argument_summary(args, log_filename: str):
    """Display summary of parsed arguments."""
    print("🔍 Seller Time Slots Population Tool - Operation Summary")
    print("=" * 60)
    
    # Command summary
    print(f"\n📋 Command Summary:")
    print(f"   Command: {' '.join(sys.argv)}")
    
    # Parsed arguments
    print(f"\n📊 Operation Details:")
    if args.verbose:
        print("   • Verbose logging: ✅ Enabled (DEBUG level)")
    if args.clear_existing:
        print("   • Clear existing slots: ✅ Enabled (default)")
    if args.preview:
        print("   • Preview mode: ✅ Enabled (no database commits)")
    if args.validate:
        print("   • System validation: ✅ Enabled")
    if args.summary:
        print("   • Show summary: ✅ Enabled")
    
    print(f"   • Log file: {log_filename}")
    
    # Operations to execute
    print(f"\n📋 Operations to Execute:")
    operation_count = 0
    if args.validate:
        operation_count += 1
        print(f"   {operation_count}. Validate system settings")
    
    operation_count += 1
    action = "Populate time slots for all sellers"
    if args.clear_existing:
        action += " (clear existing first)"
    print(f"   {operation_count}. {action}")
    
    if args.summary:
        operation_count += 1
        print(f"   {operation_count}. Show summary after completion")
    
    if args.verbose:
        print("   • Use verbose logging throughout")

def get_user_confirmation(args) -> bool:
    """Get explicit user permission before proceeding."""
    
    # Show warnings for potentially destructive operations
    warnings_shown = False
    
    if args.clear_existing and not args.preview:
        print("\n⚠️  WARNING: This will clear all existing time slots for sellers!")
        warnings_shown = True
    
    if args.preview:
        print("\n🔍 PREVIEW MODE: No database changes will be made - operations will be logged only")
        warnings_shown = True
    
    if not warnings_shown:
        print("\n📋 Ready to execute operations.")
    
    # Get user input - MANDATORY confirmation
    if args.preview:
        response = input("\nDo you want to proceed with PREVIEW mode (no database changes)? (y/N): ").strip().lower()
    else:
        response = input("\nDo you want to proceed with these operations? (y/N): ").strip().lower()
    
    confirmed = response in ['y', 'yes']
    
    # Log the decision
    logging.info(f"User Confirmation: {'YES' if confirmed else 'NO'} - User {'approved' if confirmed else 'declined'} execution")
    
    return confirmed

def log_execution_start(args, user_confirmed: bool, log_filename: str):
    """Log the start of execution with all parameters."""
    logging.info("=" * 60)
    logging.info("Seller Time Slots Population Session Started")
    logging.info(f"Command: {' '.join(sys.argv)}")
    
    # Log parsed arguments
    args_dict = {
        'verbose': args.verbose,
        'clear_existing': args.clear_existing,
        'preview': args.preview,
        'summary': args.summary,
        'validate': args.validate
    }
    logging.info(f"Arguments: {args_dict}")
    logging.info(f"User Confirmation: {'YES' if user_confirmed else 'NO'} - User {'approved' if user_confirmed else 'declined'} execution")
    logging.info(f"Log file: {log_filename}")
    logging.info("=" * 60)
    
    if user_confirmed:
        logging.info("Starting operations execution...")

def execute_operations(args) -> Dict[str, Any]:
    """Execute the requested operations in logical order."""
    results = {}
    
    try:
        # Operation 1: Validate settings (if requested)
        if args.validate:
            print("\n🔍 Validating System Settings...")
            validation_result = validate_system_settings()
            results['validation'] = validation_result
            
            if validation_result['success']:
                print("   ✅ System settings validation passed!")
                
                if validation_result.get('settings'):
                    settings = validation_result['settings']
                    start_date, _ = parse_date_from_iso(settings['event_start_date'])
                    end_date, _ = parse_date_from_iso(settings['event_end_date'])
                    start_time = parse_time_from_string(settings['day_start_time'])
                    end_time = parse_time_from_string(settings['day_end_time'])
                    breaks = parse_meeting_breaks(settings['meeting_breaks'])
                    
                    print(f"   • Event period: {start_date.strftime('%d/%m/%Y')} to {end_date.strftime('%d/%m/%Y')}")
                    print(f"   • Daily schedule: {start_time} to {end_time}")
                    print(f"   • Meeting duration: {settings['meeting_duration']} minutes")
                    print(f"   • Meeting interval: {settings['meeting_interval']} minutes")
                    print(f"   • Meeting breaks: {len(breaks)} configured")
                    
                    for break_item in breaks:
                        print(f"     - {break_item.get('label', 'Break')}: {break_item['start_time']} to {break_item['end_time']}")
            else:
                print("   ❌ System settings validation failed!")
                for error in validation_result['errors']:
                    print(f"     • {error}")
                print("\n⚠️  Cannot proceed with time slot population due to validation failures.")
                return results
        
        # Operation 2: Populate time slots (main operation)
        print("\n🔄 Populating Seller Time Slots...")
        timeslot_result = populate_time_slots_for_all_sellers(
            clear_existing=args.clear_existing, 
            preview_mode=args.preview
        )
        results['time_slots'] = timeslot_result
        
        if timeslot_result['success']:
            mode_text = "PREVIEW: Would populate" if args.preview else "Populated"
            print(f"   ✅ {mode_text} time slots successfully!")
            print(f"   • Sellers processed: {timeslot_result['seller_count']}")
            print(f"   • Total slots {'would be created' if args.preview else 'created'}: {timeslot_result['total_slots']}")
            print(f"   • Event period: {timeslot_result['event_period']}")
            
            if args.preview:
                print("   • Preview mode: No database changes were made")
        else:
            print(f"   ❌ Error populating time slots: {timeslot_result['error']}")
        
        # Operation 3: Show summary (if requested)
        if args.summary and not args.preview:
            print("\n📊 Time Slots Summary...")
            summary_result = get_time_slots_summary()
            results['summary'] = summary_result
            
            if summary_result['success']:
                print("   ✅ Summary geneated successfully!")
                print(f"   • Total slots in system: {summary_result['total_slots']}")
                print(f"   • Sellers: {summary_result['seller_count']}")
                
                if summary_result['slots_by_seller']:
                    print("   • Slots by seller:")
                    for seller, counts in summary_result['slots_by_seller'].items():
                        print(f"     - {seller}: {counts['total']} total, {counts['available']} available, {counts['booked']} booked")
            else:
                print(f"   ❌ Error generating summary: {summary_result['error']}")
        elif args.summary and args.preview:
            print("\n📊 Summary skipped in preview mode")
        
        return results
        
    except Exception as e:
        error_msg = f"Error during operations execution: {str(e)}"
        logging.error(error_msg)
        print(f"\n❌ {error_msg}")
        return results

def main():
    """Main function with enhanced argument handling."""
    
    # Parse arguments
    args = parse_arguments()
    
    # Setup logging first
    log_filename = setup_logging(args)
    
    # Display argument summary
    display_argument_summary(args, log_filename)
    
    # Get user confirmation - MANDATORY
    if get_user_confirmation(args):
        # Log execution start
        log_execution_start(args, True, log_filename)
        
        # Execute operations within Flask app context
        with app.app_context():
            try:
                results = execute_operations(args)
                
                print("\n" + "=" * 60)
                print("✅ Seller Time Slots Population completed successfully!")
                logging.info("Seller Time Slots Population completed successfully!")
                
            except Exception as e:
                print(f"\n❌ Error during execution: {str(e)}")
                logging.error(f"Error during execution: {str(e)}")
                import traceback
                logging.error(traceback.format_exc())
                sys.exit(1)
    else:
        print("\nOperation cancelled by user.")
        log_execution_start(args, False, log_filename)
        logging.info("Operation cancelled by user")
        sys.exit(0)

if __name__ == "__main__":
    main()
