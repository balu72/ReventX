#!/usr/bin/env python3
"""
Automatic Slot Filling CLI Tool

This script automatically matches buyers and sellers who have free meeting slots
based on interest matching algorithms and creates meetings between them.

Features:
- Command-line argument parsing with validation
- Interactive user confirmation for operations
- Comprehensive logging to timestamped files
- Automatic slot filling algorithms using interest-based matching
- Preview mode for testing without database changes
- Summary reporting for all operations
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
    StallType, Stall, Meeting, MeetingStatus, TimeSlot
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
    get_system_settings, get_seller_users, get_event_duration_days,
    get_default_max_meetings_per_attendee, get_system_default_max_meetings,
    precalculate_seller_stall_type_quotas, precalculate_buyer_category_quotas,
    fetch_sellers_optimized_with_matching, fetch_buyers_optimized_with_matching,
    fetch_sellers_optimized, fetch_buyers_optimized, get_valid_sellers_with_quota_info
)
from scheduler_auto_slot_filling import (
    find_best_buyer_match, create_meeting_entry, find_exact_matches, 
    find_partial_matches_sorted, update_buyer_slots
)

# Import additional required modules
import json
from datetime import datetime, timedelta, time, date
from typing import Dict, List, Tuple, Optional, Any



def log_seller_statistics_only(preview_mode: bool = False) -> Dict[str, Any]:
    """
    Log ONLY the following statistics:
    - Total number of sellers
    - Total number of sellers who have free quota
    - Free quota count per seller
    - Total number of seller free slots
    """
    logging.info("Starting seller statistics logging")
    
    try:
        # Get valid sellers with quota info using the new validation criteria
        valid_sellers_with_quota, total_sellers_found = get_valid_sellers_with_quota_info()
        
        if not valid_sellers_with_quota:
            logging.warning("No valid sellers found using validation criteria")
            return {
                'success': False,
                'error': 'No valid sellers found',
                'total_sellers': 0,
                'sellers_with_free_quota': 0,
                'total_free_slots': 0
            }
        
        # Calculate statistics
        sellers_with_free_quota = [seller for seller in valid_sellers_with_quota if seller['has_free_quota']]
        total_free_slots = sum(seller['free_quota'] for seller in sellers_with_free_quota)
        
        # Log comprehensive seller statistics
        logging.info("=" * 60)
        logging.info("🔍 SELLER STATISTICS REPORT")
        logging.info("=" * 60)
        logging.info(f"Total sellers in system: {total_sellers_found}")
        logging.info(f"Valid sellers (meeting all criteria): {len(valid_sellers_with_quota)}")
        logging.info(f"Sellers with free quota: {len(sellers_with_free_quota)}")
        logging.info(f"Total seller free slots: {total_free_slots}")
        logging.info("")
        
        if sellers_with_free_quota:
            logging.info("📊 Per-seller quota breakdown:")
            for seller in sellers_with_free_quota:
                logging.info(f"  • {seller['username']} ({seller['business_name']}): {seller['free_quota']} free slots")
        else:
            logging.info("📊 No sellers have free quota available")
        
        logging.info("=" * 60)
        
        return {
            'success': True,
            'total_sellers': total_sellers_found,
            'valid_sellers': len(valid_sellers_with_quota),
            'sellers_with_free_quota': len(sellers_with_free_quota),
            'total_free_slots': total_free_slots,
            'sellers_with_quota_details': valid_sellers_with_quota,
            'preview_mode': preview_mode
        }
        
    except Exception as e:
        error_msg = f"Error during seller statistics logging: {str(e)}"
        logging.error(error_msg)
        import traceback
        logging.error(traceback.format_exc())
        return {
            'success': False,
            'error': error_msg,
            'total_sellers': 0,
            'sellers_with_free_quota': 0,
            'total_free_slots': 0
        }

def perform_automatic_slot_filling(preview_mode: bool = False) -> Dict[str, Any]:
    """
    Perform automatic slot filling by identifying sellers and buyers who have 
    remaining meeting quota capacity, then match them based on interests and create meetings.
    
    Args:
        preview_mode: If True, only log SQL without executing database changes
    
    Returns:
        Dict containing results of the matching and meeting creation process
    """
    logging.info("Starting automatic slot filling process")
    
    try:
        # Step 1: Pre-calculate seller quotas by stall type
        logging.info("Pre-calculating seller meeting quotas by stall type...")
        stall_quota_map = precalculate_seller_stall_type_quotas()
        
        # Step 2: Pre-calculate buyer quotas by category
        logging.info("Pre-calculating buyer meeting quotas by category...")
        category_quota_map = precalculate_buyer_category_quotas()
        
        # Step 3: Process sellers with target market data
        logging.info("Processing sellers...")
        to_be_processed_sellers, total_sellers_found = fetch_sellers_optimized_with_matching(stall_quota_map)
        
        # Step 4: Process buyers with interests data
        logging.info("Processing buyers...")
        available_buyers, total_buyers_found = fetch_buyers_optimized_with_matching(category_quota_map)
        
        # Step 5: Log comprehensive summary
        log_processing_summary(
            to_be_processed_sellers, available_buyers, 
            total_sellers_found, total_buyers_found
        )
        
        # Step 6: Enhanced Multi-Slot Matching and Meeting Creation
        logging.info("=" * 60)
        logging.info("STARTING ENHANCED MULTI-SLOT MATCHING AND MEETING CREATION")
        logging.info("=" * 60)
        
        meetings_created = []
        successful_matches = 0
        failed_matches = 0
        unmatched_sellers = []
        
        # Create a copy of available buyers to track who's been matched
        remaining_buyers = available_buyers.copy()
        
        # Process each seller for multi-slot matching
        for seller_index, seller in enumerate(to_be_processed_sellers):
            seller_name = seller['username']
            seller_business = seller['business_name']
            seller_target_market = seller.get('target_market', 'Not specified')
            seller_remaining_slots = seller['remaining_slots']
            
            logging.info(f"Processing seller {seller_index + 1}/{len(to_be_processed_sellers)}: {seller_name} (Business: {seller_business})")
            logging.info(f"Seller target market: '{seller_target_market}'")
            logging.info(f"Seller available slots: {seller_remaining_slots}")
            
            if not remaining_buyers:
                logging.warning(f"No more available buyers for seller {seller_name}")
                unmatched_sellers.append(seller)
                continue
            
            seller_meetings_created = 0
            
            # Phase 1: Fill slots with exact matches first
            logging.info(f"Phase 1: Finding exact matches for seller {seller_name}")
            exact_matches = find_exact_matches(seller, remaining_buyers)
            
            for exact_buyer in exact_matches:
                if seller['remaining_slots'] <= 0:
                    break
                
                # Create meeting entry
                meeting_result = create_meeting_entry(
                    buyer_id=exact_buyer['user_id'],
                    seller_id=seller['user_id'],
                    preview_mode=preview_mode
                )
                
                if meeting_result['success']:
                    successful_matches += 1
                    seller_meetings_created += 1
                    meetings_created.append({
                        'seller': seller,
                        'buyer': exact_buyer,
                        'meeting_id': meeting_result.get('meeting_id'),
                        'sql_preview': meeting_result.get('sql_preview'),
                        'match_type': 'exact'
                    })
                    
                    # Update seller's remaining slots
                    seller['remaining_slots'] -= 1
                    
                    # Update buyer's remaining slots and remove if necessary
                    buyer_still_available = update_buyer_slots(exact_buyer, remaining_buyers)
                    
                    logging.info(f"🎉 EXACT MATCH MEETING CREATED: Seller {seller_name} <-> Buyer {exact_buyer['username']}")
                    if preview_mode:
                        logging.info(f"   Preview SQL: {meeting_result.get('sql_preview')}")
                    else:
                        logging.info(f"   Meeting ID: {meeting_result.get('meeting_id')}")
                else:
                    failed_matches += 1
                    logging.error(f"❌ FAILED to create exact match meeting: {meeting_result['message']}")
            
            # Phase 2: Fill remaining slots with partial matches (if any slots left)
            if seller['remaining_slots'] > 0:
                logging.info(f"Phase 2: Finding partial matches for seller {seller_name} ({seller['remaining_slots']} slots remaining)")
                partial_matches = find_partial_matches_sorted(seller, remaining_buyers)
                
                for partial_buyer in partial_matches:
                    if seller['remaining_slots'] <= 0:
                        break
                    
                    # Create meeting entry
                    meeting_result = create_meeting_entry(
                        buyer_id=partial_buyer['user_id'],
                        seller_id=seller['user_id'],
                        preview_mode=preview_mode
                    )
                    
                    if meeting_result['success']:
                        successful_matches += 1
                        seller_meetings_created += 1
                        meetings_created.append({
                            'seller': seller,
                            'buyer': partial_buyer,
                            'meeting_id': meeting_result.get('meeting_id'),
                            'sql_preview': meeting_result.get('sql_preview'),
                            'match_type': 'partial',
                            'match_score': partial_buyer.get('match_score', 0)
                        })
                        
                        # Update seller's remaining slots
                        seller['remaining_slots'] -= 1
                        
                        # Update buyer's remaining slots and remove if necessary
                        buyer_still_available = update_buyer_slots(partial_buyer, remaining_buyers)
                        
                        logging.info(f"🎉 PARTIAL MATCH MEETING CREATED: Seller {seller_name} <-> Buyer {partial_buyer['username']} (score: {partial_buyer.get('match_score', 0)})")
                        if preview_mode:
                            logging.info(f"   Preview SQL: {meeting_result.get('sql_preview')}")
                        else:
                            logging.info(f"   Meeting ID: {meeting_result.get('meeting_id')}")
                    else:
                        failed_matches += 1
                        logging.error(f"❌ FAILED to create partial match meeting: {meeting_result['message']}")
            
            # Log seller completion summary
            if seller_meetings_created > 0:
                logging.info(f"✅ Seller {seller_name} completed: {seller_meetings_created} meetings created, {seller['remaining_slots']} slots remaining")
            else:
                logging.info(f"❌ Seller {seller_name}: No meetings created")
                unmatched_sellers.append(seller)
            
            # After each seller is processed, refetch data for real-time consistency
            # (except for the last seller to avoid unnecessary database query)
            if seller_index < len(to_be_processed_sellers) - 1:  # Not the last seller
                logging.info(f"🔄 Refetching seller and buyer data after processing seller {seller_index + 1}/{len(to_be_processed_sellers)}")
                
                try:
                    # Refetch seller quota information to get updated meeting counts
                    updated_stall_quota_map = precalculate_seller_stall_type_quotas()
                    updated_sellers, _ = fetch_sellers_optimized_with_matching(updated_stall_quota_map)
                    
                    # Refetch buyer quota information to get updated meeting counts  
                    updated_category_quota_map = precalculate_buyer_category_quotas()
                    updated_buyers, _ = fetch_buyers_optimized_with_matching(updated_category_quota_map)
                    
                    # Update the remaining_buyers list with fresh data
                    # Keep only buyers who still have free quota
                    remaining_buyers.clear()
                    remaining_buyers.extend([buyer for buyer in updated_buyers if buyer['remaining_slots'] > 0])
                    
                    logging.info(f"✅ Refetched data: {len(remaining_buyers)} buyers still have free quota")
                    
                except Exception as e:
                    logging.error(f"⚠️ Error refetching data after seller {seller_name}: {str(e)}")
                    logging.warning("Continuing with existing data - may lead to stale quota information")
        
        # Step 7: Quota Filling - Create meetings for sellers below quota without interest matching
        logging.info("=" * 60)
        logging.info("STARTING QUOTA FILLING - SELLERS BELOW QUOTA")
        logging.info("=" * 60)
        
        # Get updated seller quota information after interest-based matching (fresh DB query)
        logging.info("Fetching updated seller quota information after interest-based matching...")
        updated_stall_quota_map = precalculate_seller_stall_type_quotas()
        sellers_below_quota, total_sellers_after_matching = get_valid_sellers_with_quota_info()
        
        # Filter only sellers who still have free quota
        sellers_with_free_slots = [seller for seller in sellers_below_quota if seller['has_free_quota']]
        logging.info(f"Found {len(sellers_with_free_slots)} sellers with free slots after interest-based matching")
        
        # Get updated buyer quota information (fresh DB query)
        logging.info("Fetching updated buyer quota information after interest-based matching...")
        updated_category_quota_map = precalculate_buyer_category_quotas()
        available_buyers_for_quota_fill, total_buyers_after_matching = fetch_buyers_optimized_with_matching(updated_category_quota_map)
        
        # Filter buyers who still have meeting quota available
        buyers_with_quota = [buyer for buyer in available_buyers_for_quota_fill if buyer['remaining_slots'] > 0]
        logging.info(f"Found {len(buyers_with_quota)} buyers with remaining quota after interest-based matching")
        
        # Initialize quota fill tracking variables
        quota_fill_meetings_created = []
        quota_fill_successful_matches = 0
        quota_fill_failed_matches = 0
        
        if sellers_with_free_slots and buyers_with_quota:
            logging.info("Starting quota filling process...")
            
            # Loop through each seller with free slots
            for seller in sellers_with_free_slots:
                seller_name = seller['username']
                seller_business = seller['business_name']
                initial_free_slots = seller['free_quota']
                
                logging.info(f"Processing seller {seller_name} ({seller_business}) with {initial_free_slots} free slots")
                
                # Loop through available buyers for this seller
                for buyer in buyers_with_quota:
                    if seller['free_quota'] <= 0:
                        logging.info(f"Seller {seller_name} quota filled, moving to next seller")
                        break  # Seller quota filled, move to next seller
                        
                    if buyer['remaining_slots'] <= 0:
                        continue  # Buyer quota filled, try next buyer
                        
                    buyer_name = buyer['username']
                    buyer_organization = buyer['organization']
                    
                    # Create ACCEPTED meeting without interest checking (since interest matching was done once)
                    logging.info(f"Creating quota fill meeting: {seller_name} <-> {buyer_name}")
                    meeting_result = create_meeting_entry(
                        buyer_id=buyer['user_id'],
                        seller_id=seller['user_id'],
                        preview_mode=preview_mode
                    )
                    
                    if meeting_result['success']:
                        quota_fill_successful_matches += 1
                        quota_fill_meetings_created.append({
                            'seller': seller,
                            'buyer': buyer,
                            'meeting_id': meeting_result.get('meeting_id'),
                            'sql_preview': meeting_result.get('sql_preview'),
                            'match_type': 'quota_fill'
                        })
                        
                        # Update quotas in memory for this loop
                        seller['free_quota'] -= 1
                        buyer['remaining_slots'] -= 1
                        
                        logging.info(f"🎉 QUOTA FILL MEETING CREATED: Seller {seller_name} <-> Buyer {buyer_name}")
                        if preview_mode:
                            logging.info(f"   Preview SQL: {meeting_result.get('sql_preview')}")
                        else:
                            logging.info(f"   Meeting ID: {meeting_result.get('meeting_id')}")
                        
                        logging.info(f"   Seller {seller_name} remaining slots: {seller['free_quota']}")
                        logging.info(f"   Buyer {buyer_name} remaining slots: {buyer['remaining_slots']}")
                    else:
                        quota_fill_failed_matches += 1
                        logging.error(f"❌ FAILED to create quota fill meeting: {meeting_result['message']}")
                
                slots_filled = initial_free_slots - seller['free_quota']
                logging.info(f"Completed seller {seller_name}: {slots_filled} additional meetings created via quota filling")
        else:
            if not sellers_with_free_slots:
                logging.info("No sellers with free slots found for quota filling")
            if not buyers_with_quota:
                logging.info("No buyers with remaining quota found for quota filling")
        
        # Quota filling summary
        logging.info("=" * 60)
        logging.info("QUOTA FILLING RESULTS SUMMARY")
        logging.info("=" * 60)
        logging.info(f"Sellers with free slots: {len(sellers_with_free_slots)}")
        logging.info(f"Buyers with remaining quota: {len(buyers_with_quota)}")
        logging.info(f"Quota fill successful matches: {quota_fill_successful_matches}")
        logging.info(f"Quota fill failed matches: {quota_fill_failed_matches}")
        logging.info(f"Total quota fill meetings created: {len(quota_fill_meetings_created)}")
        
        if preview_mode:
            logging.info("PREVIEW MODE: No actual database changes were made for quota filling")
        else:
            logging.info("NORMAL MODE: Quota fill database changes have been committed")
        
        logging.info("=" * 60)
        
        # Combined final summary
        total_successful_matches = successful_matches + quota_fill_successful_matches
        total_failed_matches = failed_matches + quota_fill_failed_matches
        total_meetings_created = meetings_created + quota_fill_meetings_created
        
        logging.info("=" * 60)
        logging.info("COMBINED FINAL RESULTS SUMMARY")
        logging.info("=" * 60)
        logging.info(f"Interest-based matching:")
        logging.info(f"  • Sellers processed: {len(to_be_processed_sellers)}")
        logging.info(f"  • Successful matches: {successful_matches}")
        logging.info(f"  • Failed matches: {failed_matches}")
        logging.info(f"  • Meetings created: {len(meetings_created)}")
        logging.info(f"")
        logging.info(f"Quota filling:")
        logging.info(f"  • Sellers with free slots: {len(sellers_with_free_slots)}")
        logging.info(f"  • Buyers with quota: {len(buyers_with_quota)}")
        logging.info(f"  • Successful matches: {quota_fill_successful_matches}")
        logging.info(f"  • Failed matches: {quota_fill_failed_matches}")
        logging.info(f"  • Meetings created: {len(quota_fill_meetings_created)}")
        logging.info(f"")
        logging.info(f"GRAND TOTALS:")
        logging.info(f"  • Total successful matches: {total_successful_matches}")
        logging.info(f"  • Total failed matches: {total_failed_matches}")
        logging.info(f"  • Total meetings created: {len(total_meetings_created)}")
        
        if preview_mode:
            logging.info("PREVIEW MODE: No actual database changes were made")
        else:
            logging.info("NORMAL MODE: All database changes have been committed")
        
        logging.info("=" * 60)
        
        return {
            'success': True,
            'to_be_processed_sellers': to_be_processed_sellers,
            'available_buyers': available_buyers,
            'seller_count': len(to_be_processed_sellers),
            'buyer_count': len(available_buyers),
            'total_sellers_in_system': total_sellers_found,
            'total_buyers_in_system': total_buyers_found,
            'algorithm_used': 'enhanced_interest_matching_with_quota_fill',
            'meetings_created': meetings_created,
            'successful_matches': successful_matches,
            'failed_matches': failed_matches,
            'unmatched_sellers': unmatched_sellers,
            'remaining_buyers': remaining_buyers,
            'quota_fill_meetings_created': quota_fill_meetings_created,
            'quota_fill_successful_matches': quota_fill_successful_matches,
            'quota_fill_failed_matches': quota_fill_failed_matches,
            'sellers_with_free_slots_after_interest_matching': len(sellers_with_free_slots),
            'buyers_with_quota_after_interest_matching': len(buyers_with_quota),
            'total_successful_matches': total_successful_matches,
            'total_failed_matches': total_failed_matches,
            'total_meetings_created': total_meetings_created,
            'preview_mode': preview_mode
        }
        
    except Exception as e:
        error_msg = f"Error during automatic slot filling: {str(e)}"
        logging.error(error_msg)
        import traceback
        logging.error(traceback.format_exc())
        return {
            'success': False,
            'error': error_msg,
            'to_be_processed_sellers': [],
            'available_buyers': [],
            'seller_count': 0,
            'buyer_count': 0,
            'meetings_created': [],
            'successful_matches': 0,
            'failed_matches': 0
        }


def log_processing_summary(to_be_processed_sellers: List[Dict], available_buyers: List[Dict], 
                          total_sellers_found: int, total_buyers_found: int):
    """Log comprehensive summary of the processing results."""
    
    # Calculate percentages
    sellers_with_free_slots = len(to_be_processed_sellers)
    buyers_with_free_slots = len(available_buyers)
    sellers_percentage = (sellers_with_free_slots / total_sellers_found * 100) if total_sellers_found > 0 else 0
    buyers_percentage = (buyers_with_free_slots / total_buyers_found * 100) if total_buyers_found > 0 else 0
    
    # Log final summary
    logging.info("=" * 60)
    logging.info("AUTOMATIC SLOT FILLING - PROCESSING SUMMARY")
    logging.info("=" * 60)
    logging.info(f"Total sellers in system: {total_sellers_found}")
    logging.info(f"Total Sellers with free slots: {sellers_with_free_slots} ({sellers_percentage:.1f}%)")
    logging.info(f"Sellers excluded (quota full): {total_sellers_found - sellers_with_free_slots}")
    logging.info("")
    logging.info(f"Total buyers in system: {total_buyers_found}")
    logging.info(f"Total buyers with free slots: {buyers_with_free_slots} ({buyers_percentage:.1f}%)")
    logging.info(f"Buyers excluded (quota full): {total_buyers_found - buyers_with_free_slots}")
    logging.info("=" * 60)
    
    # Log detailed lists
    if to_be_processed_sellers:
        logging.info("TO BE PROCESSED SELLERS:")
        for seller in to_be_processed_sellers:
            logging.info(f"  - {seller['username']} ({seller['business_name']}) - {seller['remaining_slots']} slots available")
    else:
        logging.info("TO BE PROCESSED SELLERS: None")
    
    logging.info("")
    
    if available_buyers:
        logging.info("AVAILABLE BUYERS:")
        for buyer in available_buyers:
            logging.info(f"  - {buyer['username']} ({buyer['organization']}) - {buyer['remaining_slots']} slots available")
    else:
        logging.info("AVAILABLE BUYERS: None")
    
    logging.info("=" * 60)

# CLI Functions

def determine_log_level(args) -> int:
    """Determine the appropriate logging level based on arguments."""
    # If verbose is specified, it overrides --logging and sets to DEBUG
    if args.verbose:
        return logging.DEBUG
    
    # Otherwise, use --logging parameter
    log_level_map = {
        'i': logging.INFO, 'info': logging.INFO, 'INFO': logging.INFO,
        'e': logging.ERROR, 'error': logging.ERROR, 'ERROR': logging.ERROR,
        'w': logging.WARNING, 'warn': logging.WARNING, 'WARN': logging.WARNING,
        'd': logging.DEBUG, 'debug': logging.DEBUG, 'DEBUG': logging.DEBUG
    }
    return log_level_map.get(args.logging, logging.INFO)

def setup_logging(args) -> str:
    """Setup logging configuration with file and console handlers."""
    # Generate timestamped log filename
    timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
    log_filename = f"automatic_slot_filler_log_{timestamp}.log"
    
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
        description='Automatic Slot Filling CLI Tool - Matches buyers and sellers with free meeting slots',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  %(prog)s -a                        # Perform automatic slot filling
  %(prog)s -a -p                     # Preview automatic slot filling (no DB changes)
  %(prog)s -a --summary              # Automatic slot filling with summary report
  %(prog)s -v -a -p --summary        # Verbose preview with full summary
  %(prog)s -a -l debug --summary     # Debug logging with summary
  %(prog)s -f                        # Log seller statistics only
  %(prog)s -f -v                     # Verbose seller statistics logging
  %(prog)s -f -p                     # Preview seller statistics (no DB changes)

Purpose: Automatically match and fill free meeting slots between buyers and sellers
who have remaining quota capacity, based on interest matching algorithms.
The -f flag provides seller statistics reporting only.

For more information, see the documentation.
        """
    )
    
    # Global options
    parser.add_argument('-v', '--verbose', action='store_true',
                       help='Enable verbose logging (DEBUG level)')
    parser.add_argument('-l', '--logging', type=str,
                       choices=['i', 'info', 'INFO', 'e', 'error', 'ERROR', 
                               'w', 'warn', 'WARN', 'd', 'debug', 'DEBUG'],
                       default='info',
                       help='Set logging level (default: info). Verbose (-v) overrides this to debug.')
    parser.add_argument('--summary', action='store_true',
                       help='Show summary after operations')
    parser.add_argument('-p', '--preview', action='store_true',
                       help='Preview mode - log SQL commands but do not commit to database')
    
    # Operations (mutually exclusive)
    operation_group = parser.add_mutually_exclusive_group(required=True)
    operation_group.add_argument('-a', '--auto-slot', action='store_true',
                                help='Perform automatic slot filling (no parameters required)')
    operation_group.add_argument('-f', '--seller-stats', action='store_true',
                                help='Log seller statistics only (total sellers, free quota, free slots)')
    
    return parser.parse_args()


def validate_arguments(args) -> List[str]:
    """Validate argument combinations and check for required operations."""
    errors = []
    
    # Check if at least one operation is specified
    if not args.auto_slot and not args.seller_stats:
        # No operations specified - this triggers help display
        return ['no_operations_specified']
    
    return errors

def display_argument_summary(args, validation_errors: List[str], log_filename: str):
    """Display summary of parsed arguments and validation results."""
    print("🔍 Automatic Slot Filling - Argument Analysis")
    print("=" * 50)
    
    # Command summary
    print(f"\n📋 Command Summary:")
    print(f"   Command: {' '.join(sys.argv)}")
    
    # Parsed arguments
    print(f"\n📊 Parsed Arguments:")
    if args.verbose:
        print("   • Verbose logging: ✅ Enabled (DEBUG level)")
    if args.summary:
        print("   • Show summary: ✅ Enabled")
    if args.auto_slot:
        print("   • Automatic slot filling: ✅ Enabled")
    if args.seller_stats:
        print("   • Seller statistics: ✅ Enabled")
    if args.preview:
        print("   • Preview mode: ✅ Enabled (no database commits)")
    
    print(f"   • Log file: {log_filename}")
    
    # Validation results
    if validation_errors:
        print(f"\n❌ Argument Validation Failed:")
        for error in validation_errors:
            print(f"   • {error}")
        return False
    else:
        print(f"\n🔍 Argument Validation:")
        print("   ✅ All argument combinations are valid")
        print("   ✅ No conflicts detected")
        
        # Operations to execute
        print(f"\n📋 Operations to Execute:")
        operation_count = 0
        if args.auto_slot:
            operation_count += 1
            print(f"   {operation_count}. Perform automatic slot filling")
        if args.summary:
            operation_count += 1
            print(f"   {operation_count}. Show summary after completion")
        
        if args.verbose:
            print("   • Use verbose logging throughout")
        
        return True

def get_user_confirmation(args) -> bool:
    """Get explicit user permission before proceeding."""
    
    # Show warnings for potentially destructive operations
    warnings_shown = False
    
    if args.auto_slot:
        print("\n⚠️  INFO: Automatic slot filling will assign available slots based on system logic")
        warnings_shown = True
    
    if args.preview:
        print("\n🔍 PREVIEW MODE: No database changes will be made - SQL commands will be logged only")
        warnings_shown = True
    
    if not warnings_shown:
        print("\n📋 Ready to execute operations.")
    
    # Get user input
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
    logging.info("=" * 50)
    logging.info("Automatic Slot Filling Session Started")
    logging.info(f"Command: {' '.join(sys.argv)}")
    
    # Log parsed arguments
    args_dict = {
        'verbose': args.verbose,
        'summary': args.summary,
        'auto_slot': args.auto_slot,
        'preview': args.preview
    }
    logging.info(f"Arguments: {args_dict}")
    logging.info(f"Validation: PASSED - All arguments valid")
    logging.info(f"User Confirmation: {'YES' if user_confirmed else 'NO'} - User {'approved' if user_confirmed else 'declined'} execution")
    logging.info(f"Log file: {log_filename}")
    logging.info("=" * 50)
    
    if user_confirmed:
        logging.info("Starting operations execution...")

def execute_operations(args) -> Dict[str, Any]:
    """Execute the requested operations in logical order."""
    results = {}
    
    try:
        # Operation: Seller statistics
        if args.seller_stats:
            print("\n📊 Logging Seller Statistics...")
            stats_result = log_seller_statistics_only(preview_mode=args.preview)
            results['seller_stats'] = stats_result
            
            if stats_result['success']:
                print("   ✅ Seller statistics logged successfully!")
                print(f"   • Total sellers in system: {stats_result['total_sellers']}")
                print(f"   • Valid sellers (meeting criteria): {stats_result['valid_sellers']}")
                print(f"   • Sellers with free quota: {stats_result['sellers_with_free_quota']}")
                print(f"   • Total seller free slots: {stats_result['total_free_slots']}")
                
                if args.preview:
                    print("   • Preview mode: No database changes were made")
            else:
                print(f"   ❌ Error during seller statistics logging: {stats_result['error']}")
        
        # Operation: Automatic slot filling
        if args.auto_slot:
            print("\n🤖 Performing Automatic Slot Filling...")
            autoslot_result = perform_automatic_slot_filling(preview_mode=args.preview)
            results['auto_slot'] = autoslot_result
            
            if autoslot_result['success']:
                print("   ✅ Automatic slot filling completed!")
                print(f"   • Sellers eligible for processing: {autoslot_result['seller_count']}")
                print(f"   • Buyers available for meetings: {autoslot_result['buyer_count']}")
                print(f"   • Total sellers in system: {autoslot_result['total_sellers_in_system']}")
                print(f"   • Total buyers in system: {autoslot_result['total_buyers_in_system']}")
                print(f"   • Algorithm used: {autoslot_result['algorithm_used']}")
                print(f"   • Successful matches: {autoslot_result['successful_matches']}")
                print(f"   • Failed matches: {autoslot_result['failed_matches']}")
                
                if args.preview:
                    print("   • Preview mode: No database changes were made")
            else:
                print(f"   ❌ Error during automatic slot filling: {autoslot_result['error']}")
        
        # Show summary if requested
        if args.summary and args.auto_slot and results.get('auto_slot', {}).get('success'):
            print("\n📊 Automatic Slot Filling Summary...")
            autoslot_result = results['auto_slot']
            
            print("   ✅ Interest-Based Matching Results:")
            print(f"   • Interest-based meetings created: {len(autoslot_result.get('meetings_created', []))}")
            print(f"   • Interest-based successful matches: {autoslot_result.get('successful_matches', 0)}")
            print(f"   • Interest-based failed matches: {autoslot_result.get('failed_matches', 0)}")
            print(f"   • Unmatched sellers: {len(autoslot_result.get('unmatched_sellers', []))}")
            print(f"   • Remaining buyers after interest matching: {len(autoslot_result.get('remaining_buyers', []))}")
            
            # Show match types breakdown for interest-based matching
            meetings = autoslot_result.get('meetings_created', [])
            exact_matches = len([m for m in meetings if m.get('match_type') == 'exact'])
            partial_matches = len([m for m in meetings if m.get('match_type') == 'partial'])
            
            if exact_matches > 0 or partial_matches > 0:
                print("   • Interest-based match types:")
                if exact_matches > 0:
                    print(f"     - Exact matches: {exact_matches}")
                if partial_matches > 0:
                    print(f"     - Partial matches: {partial_matches}")
            
            # Show quota filling results
            print(f"\n   ✅ Quota Filling Results:")
            print(f"   • Sellers with free slots after interest matching: {autoslot_result.get('sellers_with_free_slots_after_interest_matching', 0)}")
            print(f"   • Buyers with quota after interest matching: {autoslot_result.get('buyers_with_quota_after_interest_matching', 0)}")
            print(f"   • Quota fill successful matches: {autoslot_result.get('quota_fill_successful_matches', 0)}")
            print(f"   • Quota fill failed matches: {autoslot_result.get('quota_fill_failed_matches', 0)}")
            print(f"   • Quota fill meetings created: {len(autoslot_result.get('quota_fill_meetings_created', []))}")
            
            # Show grand totals
            print(f"\n   🎯 Grand Totals:")
            print(f"   • Total successful matches: {autoslot_result.get('total_successful_matches', 0)}")
            print(f"   • Total failed matches: {autoslot_result.get('total_failed_matches', 0)}")
            print(f"   • Total meetings created: {len(autoslot_result.get('total_meetings_created', []))}")
        
        return results
        
    except Exception as e:
        error_msg = f"Error during operations execution: {str(e)}"
        logging.error(error_msg)
        print(f"\n❌ {error_msg}")
        return results

def main():
    """Main function with enhanced argument handling."""
    
    # Special case: if no arguments provided, show help
    if len(sys.argv) == 1:
        parser = parse_arguments()
        
        print("🚀 Automatic Slot Filling - Help")
        print("=" * 40)
        print("\nThis script automatically matches buyers and sellers with free meeting slots.")
        print("At least one operation argument is required.")
        parser.print_help()
        sys.exit(0)
    
    # Parse arguments
    args = parse_arguments()
    
    # Validate arguments
    validation_errors = validate_arguments(args)
    
    # Handle no operations specified
    if 'no_operations_specified' in validation_errors:
        print("❌ Error: At least one operation must be specified.")
        print("\nUse -h or --help for usage information.")
        sys.exit(1)
    
    # Setup logging first
    log_filename = setup_logging(args)
    
    # Handle other validation errors
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
    if get_user_confirmation(args):
        # Log execution start
        log_execution_start(args, True, log_filename)
        
        # Execute operations within Flask app context
        with app.app_context():
            try:
                results = execute_operations(args)
                
                print("\n" + "=" * 50)
                print("✅ Meeting Scheduler completed successfully!")
                logging.info("Meeting Scheduler completed successfully!")
                
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
