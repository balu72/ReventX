"""
Scheduler Database Queries Module

This module contains all database query functions and operations for the meeting scheduler.
Includes quota calculations, data fetching, and complex database operations.
"""

import logging
from datetime import datetime
from typing import Dict, List, Tuple, Optional, Any
from scheduler_models import (
    db, User, SystemSetting, SellerProfile, BuyerProfile, BuyerCategory, 
    StallType, Stall, Meeting, MeetingStatus, StallInventory, StallDistanceMatrix, TimeSlot, SellerAttendees
)
from scheduler_utils import parse_date_from_iso, normalize_datetime

def calculate_seller_meeting_quota_local(seller_id: int, seller_profile) -> Dict[str, Any]:
    """
    Calculate meeting quota information for a seller using the same logic as meeting_utils.py
    but without external dependencies.
    
    Args:
        seller_id (int): The user ID of the seller
        seller_profile (SellerProfile): The seller's profile object
        
    Returns:
        dict: A dictionary containing meeting quota information with sellerAllowedMeetingQuota
    """
    try:
        # Calculate event duration in days
        event_start_date = SystemSetting.query.filter_by(key='event_start_date').first()
        event_end_date = SystemSetting.query.filter_by(key='event_end_date').first()
        
        if event_start_date and event_end_date and event_start_date.value and event_end_date.value:
            try:
                # Parse ISO 8601 format (e.g., 2025-07-11T00:00:00.000Z)
                # First, extract just the date part (YYYY-MM-DD)
                start_date_str = event_start_date.value.split('T')[0]
                end_date_str = event_end_date.value.split('T')[0]
                
                # Then parse with the correct format
                start_date = datetime.strptime(start_date_str, '%Y-%m-%d')
                end_date = datetime.strptime(end_date_str, '%Y-%m-%d')
                
                event_days = (end_date - start_date).days + 1  # +1 to include both start and end days
            except (ValueError, TypeError, IndexError):
                event_days = 3  # Default to 3 days if dates are invalid (typical event duration)
        else:
            event_days = 3  # Default to 3 days if settings are missing (typical event duration)
        
        # Calculate sellerMaxMeetingsPerDay
        # Initialize variables
        seller_max_meetings_per_day = 0
        
        # Get default max meetings per attendee per day from system settings or use default
        max_meetings_setting = SystemSetting.query.filter_by(key='max_seller_attendees_per_day').first()
        max_meetings_per_attendee_per_day = int(max_meetings_setting.value) if max_meetings_setting else 30  # Default to 30
        
        # Get all stalls allocated to this seller
        seller_stalls = Stall.query.filter_by(seller_id=seller_id).all()
        
        # For each stall, calculate max meetings
        for stall in seller_stalls:
            # Get stall type using the stall_type_id foreign key
            stall_type = None
            if stall.stall_type_id:
                stall_type = StallType.query.get(stall.stall_type_id)
            
            if stall_type and stall_type.attendees is not None and stall_type.max_meetings_per_attendee is not None and stall_type.max_meetings_per_attendee >= 0:
                # Multiply attendees by max_meetings_per_attendee
                seller_max_meetings_per_day += stall_type.attendees * stall_type.max_meetings_per_attendee
            else:
                # If we have stall_type and attendees but no max_meetings_per_attendee
                if stall_type and stall_type.attendees is not None:
                    seller_max_meetings_per_day += stall_type.attendees * max_meetings_per_attendee_per_day
                else:
                    # Default case - assume 1 attendee
                    seller_max_meetings_per_day += 1 * max_meetings_per_attendee_per_day
        
        # Calculate allowed meeting quota (without multiplying by 2)
        sellerAllowedMeetingQuota = event_days * seller_max_meetings_per_day
        
        # Return the meeting quota information (only what we need)
        return {
            'sellerAllowedMeetingQuota': sellerAllowedMeetingQuota
        }
        
    except Exception as e:
        logging.error(f"Error calculating seller meeting quota for seller {seller_id}: {str(e)}")
        # Return fallback quota
        return {
            'sellerAllowedMeetingQuota': 3 * 30  # 3 days * 30 meetings per day default
        }

def get_system_settings() -> Dict[str, Any]:
    """Fetch all required system settings from the database."""
    required_keys = [
        'event_start_date',
        'event_end_date', 
        'meeting_duration',
        'meeting_interval',
        'day_start_time',
        'day_end_time',
        'meeting_breaks'
    ]
    
    settings = SystemSetting.query.filter(SystemSetting.key.in_(required_keys)).all()
    settings_dict = {setting.key: setting.value for setting in settings}
    
    missing_keys = [key for key in required_keys if key not in settings_dict]
    if missing_keys:
        raise Exception(f"Missing required system settings: {missing_keys}")
    
    logging.info(f"Retrieved system settings: {list(settings_dict.keys())}")
    return settings_dict

def get_seller_users() -> List[Tuple[int, str]]:
    """Get all users with seller role and validate they have seller_profiles entries."""
    # Use the new consistent validation logic
    valid_sellers_with_quota, total_count = get_valid_sellers_with_quota_info()
    
    # Convert to the expected format (user_id, username)
    valid_sellers = [(seller['user_id'], seller['username']) for seller in valid_sellers_with_quota]
    
    logging.info(f"Found {len(valid_sellers)} valid sellers using new validation criteria")
    return valid_sellers

def get_valid_sellers_with_quota_info() -> Tuple[List[Dict], int]:
    """
    Get valid sellers based on strict criteria:
    a. Valid user ID with role 'seller' in users table
    b. Entry in seller_profiles where user_id matches users.id
    c. seller_profiles.is_verified = True
    d. Has allocated stall number (stalls table with allocated_stall_number not NULL/empty and stall_id not NULL/empty)
       and stall_id corresponds to valid ID in stall_inventory table
    
    Returns:
        Tuple of (valid_sellers_list, total_sellers_count)
    """
    try:
        # Count total sellers for comparison
        total_sellers_count = User.query.filter_by(role='seller').count()
        
        # Step 1: Get all sellers with complete validation criteria
        sellers_query = db.session.query(
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
            User.role == 'seller',
            SellerProfile.is_verified == True,
            Stall.allocated_stall_number.isnot(None),
            Stall.allocated_stall_number != '',
            Stall.stall_id.isnot(None)
        ).all()
        
        total_valid_sellers = len(sellers_query)
        logging.info(f"Found {total_valid_sellers} sellers meeting all validation criteria")
        
        if not sellers_query:
            logging.warning("No sellers found meeting the validation criteria")
            return [], 0
        
        # Step 2: Calculate quota information for each seller
        # Get system settings for quota calculation
        event_days = get_event_duration_days()
        max_meetings_per_attendee_default = get_default_max_meetings_per_attendee()
        
        # Step 3: Get current meeting counts for all valid sellers
        valid_seller_ids = [seller.user_id for seller in sellers_query]
        seller_meeting_counts = db.session.query(
            Meeting.seller_id,
            db.func.count(Meeting.id).label('accepted_count')
        ).filter(
            Meeting.seller_id.in_(valid_seller_ids),
            Meeting.status == MeetingStatus.ACCEPTED
        ).group_by(Meeting.seller_id).all()
        
        # Convert to dictionary for O(1) lookup
        meeting_count_map = {seller_id: count for seller_id, count in seller_meeting_counts}
        
        # Step 4: Process each seller and calculate quota info using calculate_seller_meeting_quota
        valid_sellers_with_quota = []
        
        for seller in sellers_query:
            # Get seller profile for quota calculation
            seller_profile = SellerProfile.query.filter_by(user_id=seller.user_id).first()
            
            if seller_profile:
                # Use calculate_seller_meeting_quota_local function to get the correct quota
                quota_info = calculate_seller_meeting_quota_local(seller.user_id, seller_profile)
                total_quota = quota_info['sellerAllowedMeetingQuota']
            else:
                # Fallback if seller profile not found
                logging.warning(f"Seller profile not found for user_id {seller.user_id}, using fallback quota")
                total_quota = event_days * max_meetings_per_attendee_default
            
            # Get current accepted meeting count
            accepted_count = meeting_count_map.get(seller.user_id, 0)
            
            # Calculate free quota
            free_quota = max(0, total_quota - accepted_count)
            
            seller_info = {
                'user_id': seller.user_id,
                'username': seller.username,
                'business_name': seller.business_name,
                'is_verified': seller.is_verified,
                'allocated_stall_number': seller.allocated_stall_number,
                'stall_id': seller.stall_id,
                'stall_type_id': seller.stall_type_id,
                'attendees': seller.attendees,  # Using stall type attendees
                'max_meetings_per_attendee': seller.max_meetings_per_attendee,
                'total_quota': total_quota,
                'accepted_meetings': accepted_count,
                'free_quota': free_quota,
                'has_free_quota': free_quota > 0
            }
            
            valid_sellers_with_quota.append(seller_info)
            
            logging.debug(f"Seller {seller.username}: stall_attendees={seller.attendees}, quota={total_quota}, accepted={accepted_count}, free={free_quota}")
        
        logging.info(f"Processed {len(valid_sellers_with_quota)} valid sellers with quota information")
        
        return valid_sellers_with_quota, total_valid_sellers
        
    except Exception as e:
        logging.error(f"Error in get_valid_sellers_with_quota_info: {str(e)}")
        import traceback
        logging.error(traceback.format_exc())
        return [], 0

def get_event_duration_days() -> int:
    """Get event duration in days from system settings."""
    event_start_date = SystemSetting.query.filter_by(key='event_start_date').first()
    event_end_date = SystemSetting.query.filter_by(key='event_end_date').first()
    
    if event_start_date and event_end_date and event_start_date.value and event_end_date.value:
        try:
            start_date_str = event_start_date.value.split('T')[0]
            end_date_str = event_end_date.value.split('T')[0]
            
            start_date = datetime.strptime(start_date_str, '%Y-%m-%d')
            end_date = datetime.strptime(end_date_str, '%Y-%m-%d')
            
            event_days = (end_date - start_date).days + 1
            logging.debug(f"Event duration: {event_days} days ({start_date_str} to {end_date_str})")
            return event_days
        except (ValueError, TypeError, IndexError):
            logging.warning("Invalid event dates, using default 3 days")
            return 3
    else:
        logging.warning("Event dates not found in settings, using default 3 days")
        return 3

def get_default_max_meetings_per_attendee() -> int:
    """Get default max meetings per attendee from system settings."""
    max_meetings_setting = SystemSetting.query.filter_by(key='max_seller_attendees_per_day').first()
    default_value = int(max_meetings_setting.value) if max_meetings_setting else 30
    logging.debug(f"Default max meetings per attendee per day: {default_value}")
    return default_value

def get_system_default_max_meetings() -> int:
    """Get system default max meetings for buyers."""
    max_meetings_setting = SystemSetting.query.filter_by(key='max_seller_attendees_per_day').first()
    default_value = int(max_meetings_setting.value) if max_meetings_setting else 30
    logging.debug(f"System default max meetings for buyers: {default_value}")
    return default_value

def precalculate_seller_stall_type_quotas() -> Dict[int, int]:
    """Pre-calculate meeting quotas for all stall types to avoid repeated DB calls."""
    # Get system settings once
    event_days = get_event_duration_days()
    max_meetings_per_attendee_default = get_default_max_meetings_per_attendee()
    
    # Get all stall types
    stall_types = StallType.query.all()
    stall_quota_map = {}
    
    logging.debug(f"Found {len(stall_types)} stall types to process")
    
    for stall_type in stall_types:
        if stall_type.attendees and stall_type.max_meetings_per_attendee and stall_type.max_meetings_per_attendee >= 0:
            quota_per_day = stall_type.attendees * stall_type.max_meetings_per_attendee
        elif stall_type.attendees:
            quota_per_day = stall_type.attendees * max_meetings_per_attendee_default
        else:
            quota_per_day = 1 * max_meetings_per_attendee_default
        
        total_quota = event_days * quota_per_day
        stall_quota_map[stall_type.id] = total_quota
        
        logging.debug(f"Stall Type '{stall_type.name}' (ID: {stall_type.id}): "
                     f"{stall_type.attendees or 1} attendees × "
                     f"{stall_type.max_meetings_per_attendee or max_meetings_per_attendee_default} meetings × "
                     f"{event_days} days = {total_quota} total quota")
    
    logging.info(f"Pre-calculated quotas for {len(stall_quota_map)} stall types")
    return stall_quota_map

def precalculate_buyer_category_quotas() -> Dict[Optional[int], int]:
    """Pre-calculate meeting quotas for the Hosted buyer category (ID=1) only."""
    # Get system default
    max_meetings_default = get_system_default_max_meetings()
    
    # Get only the "Hosted" buyer category (ID=1)
    hosted_category = BuyerCategory.query.filter_by(id=1).first()
    
    category_quota_map = {}
    
    if hosted_category:
        logging.debug(f"Found 1 buyer category to process: {hosted_category.name}")
        
        if hosted_category.max_meetings and hosted_category.max_meetings >= 0:
            quota = hosted_category.max_meetings
        else:
            quota = max_meetings_default
        
        category_quota_map[hosted_category.id] = quota
        logging.debug(f"Buyer Category '{hosted_category.name}' (ID: {hosted_category.id}): {quota} meetings quota")
    else:
        logging.warning("Hosted buyer category (ID=1) not found in database")
    
    # Handle buyers with no category (use default)
    category_quota_map[None] = max_meetings_default
    logging.debug(f"Default quota for buyers with no category: {max_meetings_default}")
    
    logging.info(f"Pre-calculated quotas for Hosted category only + default")
    return category_quota_map

def fetch_all_sellers_with_accepted_meetings(stall_quota_map: Dict[int, int]) -> Tuple[List[Dict], int]:
    """
    Fetch ALL sellers who have accepted meetings (regardless of quota) for scheduling date/time.
    This function is specifically for scheduling existing accepted meetings, not creating new ones.
    """
    # Use the same validation logic to get valid sellers
    valid_sellers_with_quota, total_sellers_found = get_valid_sellers_with_quota_info()
    
    if not valid_sellers_with_quota:
        logging.warning("No valid sellers found using validation criteria")
        return [], total_sellers_found
    
    # Process each valid seller - include ALL who have accepted meetings
    all_sellers_with_meetings = []
    
    for seller in valid_sellers_with_quota:
        # INCLUDE ALL SELLERS WHO HAVE ACCEPTED MEETINGS (regardless of quota)
        # This is needed for scheduling date & time for existing accepted meetings
        if seller['accepted_meetings'] > 0:
            seller_info = {
                'user_id': seller['user_id'],
                'username': seller['username'],
                'business_name': seller['business_name'],
                'current_accepted_meetings': seller['accepted_meetings'],
                'allowed_meeting_quota': seller['total_quota'],
                'remaining_slots': seller['free_quota'],
                'stall_type_ids': [seller['stall_type_id']]  # Single stall type per seller in new validation
            }
            all_sellers_with_meetings.append(seller_info)
            
            if seller['has_free_quota']:
                logging.info(f"✅ ADDED for scheduling: {seller['username']} (Remaining slots: {seller['free_quota']})")
            else:
                logging.info(f"✅ ADDED for scheduling: {seller['username']} (Quota full but has accepted meetings: {seller['accepted_meetings']}/{seller['total_quota']})")
        else:
            logging.info(f"❌ EXCLUDED from scheduling: {seller['username']} (No accepted meetings: {seller['accepted_meetings']})")
    
    logging.info(f"Found {len(all_sellers_with_meetings)} sellers with accepted meetings out of {total_sellers_found} valid sellers")
    
    return all_sellers_with_meetings, total_sellers_found

def fetch_sellers_optimized_with_matching(stall_quota_map: Dict[int, int]) -> Tuple[List[Dict], int]:
    """Fetch all sellers using pre-calculated quotas with optimized database queries, including target market data."""
    # Use the new consistent validation logic to get valid sellers
    valid_sellers_with_quota, total_sellers_found = get_valid_sellers_with_quota_info()
    
    if not valid_sellers_with_quota:
        logging.warning("No valid sellers found using new validation criteria")
        return [], total_sellers_found
    
    # Process each valid seller for matching
    to_be_processed_sellers = []
    
    for seller in valid_sellers_with_quota:
        # Only include sellers who have free quota
        if seller['has_free_quota']:
            # Get target market for this seller
            seller_profile = SellerProfile.query.filter_by(user_id=seller['user_id']).first()
            target_market = getattr(seller_profile, 'target_market', '') or '' if seller_profile else ''
            
            seller_info = {
                'user_id': seller['user_id'],
                'username': seller['username'],
                'business_name': seller['business_name'],
                'target_market': target_market,  # Include target market for matching
                'current_accepted_meetings': seller['accepted_meetings'],
                'allowed_meeting_quota': seller['total_quota'],
                'remaining_slots': seller['free_quota'],
                'stall_type_ids': [seller['stall_type_id']]  # Single stall type per seller in new validation
            }
            to_be_processed_sellers.append(seller_info)
            
            logging.info(f"✅ ADDED to 'To Be Processed Sellers': {seller['username']} (Remaining slots: {seller['free_quota']})")
        else:
            logging.info(f"❌ EXCLUDED from processing: {seller['username']} (Quota full: {seller['accepted_meetings']}/{seller['total_quota']})")
    
    logging.info(f"Using new validation criteria: {len(to_be_processed_sellers)} sellers with free quota out of {total_sellers_found} valid sellers")
    
    return to_be_processed_sellers, total_sellers_found

def fetch_buyer_profiles_from_list(buyer_user_ids: List[int]) -> List[Dict]:
    """
    Fetch buyer profiles for specific user IDs from Excel file.
    No quota checking - just load the profiles for scheduling.
    
    Args:
        buyer_user_ids: List of user IDs from Excel file
        
    Returns:
        List of buyer profile dictionaries
    """
    try:
        if not buyer_user_ids:
            logging.warning("No buyer user IDs provided")
            return []
        
        logging.info(f"Loading buyer profiles for {len(buyer_user_ids)} user IDs from Excel: {buyer_user_ids}")
        
        # Single query to get buyer profiles for specific user IDs
        buyers_with_categories = db.session.query(User, BuyerProfile, BuyerCategory)\
            .join(BuyerProfile, User.id == BuyerProfile.user_id)\
            .outerjoin(BuyerCategory, BuyerProfile.category_id == BuyerCategory.id)\
            .filter(
                User.role == 'buyer',
                User.id.in_(buyer_user_ids)
            ).all()
        
        buyer_profiles = []
        
        for user, buyer_profile, buyer_category in buyers_with_categories:
            # Basic profile info without quota checking
            organization = buyer_profile.organization if buyer_profile else 'Unknown Organization'
            category_name = buyer_category.name if buyer_category else 'No Category'
            interests = getattr(buyer_profile, 'interests', []) or []
            
            buyer_info = {
                'user_id': user.id,
                'username': user.username,
                'organization': organization,
                'category_id': buyer_profile.category_id if buyer_profile else None,
                'category_name': category_name,
                'interests': interests
            }
            buyer_profiles.append(buyer_info)
            
            logging.info(f"Loaded buyer profile: {user.username} (ID: {user.id}, Organization: {organization})")
        
        # Check for missing buyers
        found_user_ids = [buyer['user_id'] for buyer in buyer_profiles]
        missing_user_ids = [uid for uid in buyer_user_ids if uid not in found_user_ids]
        
        if missing_user_ids:
            logging.warning(f"Could not find buyer profiles for user IDs: {missing_user_ids}")
        
        logging.info(f"Successfully loaded {len(buyer_profiles)} buyer profiles out of {len(buyer_user_ids)} requested")
        
        return buyer_profiles
        
    except Exception as e:
        logging.error(f"Error loading buyer profiles from list: {str(e)}")
        return []

def fetch_buyers_optimized_with_matching(category_quota_map: Dict[Optional[int], int]) -> Tuple[List[Dict], int]:
    """Fetch all buyers using pre-calculated quotas with optimized database queries, including interests data."""
    # Single query to get all buyers with their categories and interests
    buyers_with_categories = db.session.query(User, BuyerProfile, BuyerCategory)\
        .join(BuyerProfile, User.id == BuyerProfile.user_id)\
        .outerjoin(BuyerCategory, BuyerProfile.category_id == BuyerCategory.id)\
        .filter(User.role == 'buyer')\
        .all()
    
    total_buyers_found = len(buyers_with_categories)
    logging.info(f"Found {total_buyers_found} buyers in system")
    
    if not buyers_with_categories:
        logging.warning("No buyers found in system")
        return [], 0
    
    # Batch query for all buyer meeting counts
    buyer_ids = [user.id for user, _, _ in buyers_with_categories]
    buyer_meeting_counts = db.session.query(
        Meeting.buyer_id,
        db.func.count(Meeting.id).label('accepted_count')
    ).filter(
        Meeting.buyer_id.in_(buyer_ids),
        Meeting.status == MeetingStatus.ACCEPTED
    ).group_by(Meeting.buyer_id).all()
    
    # Convert to dictionary for O(1) lookup
    buyer_meeting_count_map = {buyer_id: count for buyer_id, count in buyer_meeting_counts}
    
    # Process each buyer
    available_buyers = []
    
    for user, buyer_profile, buyer_category in buyers_with_categories:
        # Get quota for this buyer's category
        category_id = buyer_profile.category_id if buyer_profile else None
        quota = category_quota_map.get(category_id, category_quota_map[None])
        
        # Get accepted meeting count (0 if no meetings)
        accepted_count = buyer_meeting_count_map.get(user.id, 0)
        
        # Log processing
        organization = buyer_profile.organization if buyer_profile else 'Unknown Organization'
        category_name = buyer_category.name if buyer_category else 'No Category'
        interests = getattr(buyer_profile, 'interests', []) or []
        
        logging.info(f"Processing buyer: {user.username} (ID: {user.id}, Organization: {organization})")
        logging.info(f"Buyer {user.username}: Category = {category_name}, Interests = {interests}")
        logging.info(f"Buyer {user.username}: Allowed meeting quota = {quota}")
        logging.info(f"Buyer {user.username}: Current accepted meetings = {accepted_count}")
        
        # Decision logic
        if accepted_count < quota:
            remaining_slots = quota - accepted_count
            buyer_info = {
                'user_id': user.id,
                'username': user.username,
                'organization': organization,
                'category_id': category_id,
                'category_name': category_name,
                'interests': interests,  # Include interests for matching
                'current_accepted_meetings': accepted_count,
                'allowed_meeting_quota': quota,
                'remaining_slots': remaining_slots
            }
            available_buyers.append(buyer_info)
            logging.info(f"✅ ADDED to 'Available Buyers': {user.username} (Remaining slots: {remaining_slots})")
        else:
            logging.info(f"❌ EXCLUDED from available buyers: {user.username} (Quota full: {accepted_count}/{quota})")
    
    return available_buyers, total_buyers_found

def get_accepted_meetings() -> List[Dict[str, Any]]:
    """Fetch accepted meetings from database that don't have scheduled date/time."""
    try:
        accepted_meetings = db.session.query(Meeting)\
            .filter(
                Meeting.status == MeetingStatus.ACCEPTED,
                Meeting.meeting_date.is_(None),
                Meeting.meeting_time.is_(None)
            )\
            .all()
        
        meetings_list = []
        for meeting in accepted_meetings:
            meeting_info = {
                'meeting_id': meeting.id,
                'seller_id': meeting.seller_id,
                'buyer_id': meeting.buyer_id,
                'status': meeting.status.value,  # Access enum value properly
                'created_at': meeting.created_at
            }
            meetings_list.append(meeting_info)
        
        logging.info(f"Retrieved {len(meetings_list)} accepted meetings with NULL meeting_date and meeting_time")
        return meetings_list
        
    except Exception as e:
        logging.error(f"Error fetching accepted meetings: {str(e)}")
        return []

def resolve_buyer_user_id(user_id: int) -> Optional[int]:
    """Validate user_id exists in buyer_profiles table and return it directly."""
    try:
        buyer_profile = BuyerProfile.query.filter_by(user_id=user_id).first()
        if buyer_profile:
            return user_id  # Return the user_id directly since it exists
        return None
    except Exception as e:
        logging.error(f"Error resolving user_id {user_id}: {str(e)}")
        return None

def validate_buyer_exists(user_id: int) -> bool:
    """Check if user_id exists in buyer_profiles table."""
    try:
        buyer_profile = BuyerProfile.query.filter_by(user_id=user_id).first()
        return buyer_profile is not None
    except Exception as e:
        logging.error(f"Error validating user_id {user_id}: {str(e)}")
        return False

def validate_buyer_ids_from_list(user_ids: List[int]) -> Dict[str, Any]:
    """Validate that all User IDs exist in buyer_profiles table."""
    valid_buyers = []
    invalid_buyers = []
    
    for user_id in user_ids:
        try:
            user_id_int = int(user_id)
            if validate_buyer_exists(user_id_int):
                valid_buyers.append(user_id_int)
            else:
                invalid_buyers.append(user_id_int)
        except (ValueError, TypeError):
            invalid_buyers.append(user_id)
    
    return {
        'success': len(invalid_buyers) == 0,
        'valid_buyers': valid_buyers,
        'invalid_buyers': invalid_buyers,
        'total_buyers': len(user_ids)
    }

def create_meeting_from_excel_data(buyer_id: int, seller_id: Optional[int] = None, 
                                 meeting_data: Optional[Dict] = None, 
                                 preview_mode: bool = False) -> Dict[str, Any]:
    """
    Create meeting from Excel row data.
    
    Args:
        buyer_id: Buyer profile ID (will be converted to user_id)
        seller_id: Optional seller user ID
        meeting_data: Optional additional meeting data
        preview_mode: If True, log SQL without executing
    
    Returns:
        Result dictionary with success status and details
    """
    try:
        buyer_user_id = resolve_buyer_user_id(buyer_id)
        
        if not buyer_user_id:
            return {
                'success': False,
                'error': f'Buyer ID {buyer_id} not found in buyer_profiles'
            }
        
        if preview_mode:
            sql_preview = f"INSERT INTO meetings (buyer_id, seller_id, ...) VALUES ({buyer_user_id}, {seller_id}, ...)"
            logging.info(f"PREVIEW: Would create meeting with buyer_id={buyer_id} (user_id={buyer_user_id})")
            return {
                'success': True,
                'sql_preview': sql_preview,
                'buyer_id': buyer_id,
                'buyer_user_id': buyer_user_id,
                'seller_id': seller_id
            }
        else:
            # TODO: Implement actual meeting creation logic
            # This is a placeholder for the actual meeting creation
            logging.info(f"Would create meeting with buyer_id={buyer_id} (user_id={buyer_user_id})")
            return {
                'success': True,
                'meeting_id': None,  # Would be actual meeting ID
                'buyer_id': buyer_id,
                'buyer_user_id': buyer_user_id,
                'seller_id': seller_id
            }
            
    except Exception as e:
        error_msg = f"Error creating meeting for buyer_id {buyer_id}: {str(e)}"
        logging.error(error_msg)
        return {
            'success': False,
            'error': error_msg
        }

def initialize_seller_stall_distance_matrix() -> Dict[int, Dict[str, Any]]:
    """
    Build comprehensive seller-stall-distance cache with detailed destination info.
    Each seller has pre-loaded distances FROM their stall TO all other stalls.
    
    Returns:
        Dict mapping seller_user_id to:
        {
            'seller_id': int,
            'seller_stall_id': int,
            'stall_number': str,
            'distance_matrix': {
                destination_stall_id: {
                    'destination_stall_id': int,
                    'destination_stall_name': str,
                    'distance': float
                }
            }
        }
        Distance matrix is sorted by distance ascending (closest first)
    """
    try:
        logging.info("Building seller-stall-distance matrix cache...")
        
        # Step 1: Get all sellers with their stall information
        sellers_with_stalls = db.session.query(
            User.id.label('seller_user_id'),
            User.username,
            Stall.stall_id,
            StallInventory.stall_number
        ).select_from(User)\
        .join(SellerProfile, User.id == SellerProfile.user_id)\
        .join(Stall, User.id == Stall.seller_id)\
        .join(StallInventory, Stall.stall_id == StallInventory.id)\
        .filter(
            User.role == 'seller',
            SellerProfile.is_verified == True,
            Stall.stall_id.isnot(None)
        ).all()
        
        if not sellers_with_stalls:
            logging.warning("No sellers with stalls found")
            return {}
        
        logging.info(f"Found {len(sellers_with_stalls)} sellers with stall assignments")
        
        # Step 2: Build the seller distance cache
        seller_distance_cache = {}
        
        for seller in sellers_with_stalls:
            seller_user_id = seller.seller_user_id
            seller_stall_id = seller.stall_id
            seller_stall_number = seller.stall_number
            
            # Step 3: Get all distances FROM this seller's stall TO other stalls
            distance_entries = db.session.query(
                StallDistanceMatrix.destination_stall_id,
                StallInventory.stall_number.label('destination_stall_name'),
                StallDistanceMatrix.distance
            ).select_from(StallDistanceMatrix)\
            .join(StallInventory, StallDistanceMatrix.destination_stall_id == StallInventory.id)\
            .filter(StallDistanceMatrix.origin_stall_id == seller_stall_id)\
            .order_by(StallDistanceMatrix.distance.asc()).all()  # Ascending = closest first
            
            # Step 4: Build distance matrix for this seller
            distance_matrix = {}
            for dest_stall_id, dest_stall_name, distance in distance_entries:
                distance_matrix[dest_stall_id] = {
                    'destination_stall_id': dest_stall_id,
                    'destination_stall_name': dest_stall_name,
                    'distance': distance
                }
            
            # Step 5: Store seller info with distance matrix
            seller_distance_cache[seller_user_id] = {
                'seller_id': seller_user_id,
                'seller_stall_id': seller_stall_id,
                'stall_number': seller_stall_number,
                'distance_matrix': distance_matrix
            }
            
            logging.info(f"Cached distances for seller {seller_user_id} "
                        f"(stall {seller_stall_number}): {len(distance_matrix)} destinations")
        
        total_sellers = len(seller_distance_cache)
        total_distances = sum(len(seller['distance_matrix']) for seller in seller_distance_cache.values())
        
        logging.info(f"Built seller distance cache: {total_sellers} sellers with {total_distances} total distance mappings")
        
        return seller_distance_cache
        
    except Exception as e:
        logging.error(f"Error building seller-stall-distance matrix: {str(e)}")
        return {}

def build_distance_matrix_optimization() -> Dict[int, List[int]]:
    """
    Build optimized distance matrix as {origin_stall_id: [destination_stall_ids_sorted_by_distance]}.
    This reduces repeated database queries during optimization.
    
    Returns:
        Dictionary mapping each origin stall ID to a list of destination stall IDs sorted by distance ASC
    """
    try:
        logging.info("Building optimized distance matrix...")
        
        # Get all distance matrix entries sorted by origin and distance
        distance_entries = db.session.query(
            StallDistanceMatrix.origin_stall_id,
            StallDistanceMatrix.destination_stall_id,
            StallDistanceMatrix.distance
        ).order_by(
            StallDistanceMatrix.origin_stall_id,
            StallDistanceMatrix.distance
        ).all()
        
        if not distance_entries:
            logging.warning("No entries found in stall_distance_matrix table")
            return {}
        
        # Build the optimized matrix
        distance_matrix = {}
        current_origin = None
        current_destinations = []
        
        for origin_id, dest_id, distance in distance_entries:
            if origin_id != current_origin:
                # Save previous origin's data
                if current_origin is not None:
                    distance_matrix[current_origin] = current_destinations
                
                # Start new origin
                current_origin = origin_id
                current_destinations = []
            
            # Add destination to current origin's list
            current_destinations.append(dest_id)
        
        # Don't forget the last origin
        if current_origin is not None:
            distance_matrix[current_origin] = current_destinations
        
        total_origins = len(distance_matrix)
        total_entries = sum(len(destinations) for destinations in distance_matrix.values())
        
        logging.info(f"Built distance matrix: {total_origins} origins with {total_entries} total destination mappings")
        logging.info(f"Sample: Origin stall 1 has {len(distance_matrix.get(1, []))} destinations")
        
        return distance_matrix
        
    except Exception as e:
        logging.error(f"Error building distance matrix optimization: {str(e)}")
        return {}

def get_optimal_seller_sequence_dynamic_origin(seller_user_ids: List[int], 
                                             starting_stall_id: int,
                                             distance_matrix: Dict[int, List[int]]) -> List[Dict]:
    """
    Get optimal seller sequence using dynamic origin traveling salesman approach.
    
    Algorithm:
    1. Start at starting_stall_id (e.g., G1)
    2. Find closest seller to current origin
    3. Move origin to that seller's stall
    4. Find next closest seller to new origin
    5. Repeat until all sellers allocated
    
    Args:
        seller_user_ids: List of seller user IDs to schedule
        starting_stall_id: Starting point stall inventory ID (e.g., G1 = 314)
        distance_matrix: Pre-built distance matrix for O(1) lookups
    
    Returns:
        List of sellers in optimal sequence with distance info
    """
    try:
        logging.info(f"Calculating optimal seller sequence using dynamic origin approach")
        logging.info(f"Starting point: stall_id={starting_stall_id}")
        logging.info(f"Sellers to schedule: {seller_user_ids}")
        
        # Build seller_user_id to stall_id mapping
        seller_stall_map = {}
        for seller_user_id in seller_user_ids:
            stall_id = get_seller_stall_id_from_user_id(seller_user_id)
            if stall_id:
                seller_stall_map[seller_user_id] = stall_id
            else:
                logging.warning(f"No stall found for seller {seller_user_id}")
        
        if not seller_stall_map:
            logging.error("No stalls found for any sellers")
            return []
        
        # Create reverse mapping: stall_id -> seller_user_id
        stall_seller_map = {stall_id: seller_id for seller_id, stall_id in seller_stall_map.items()}
        
        # Available seller stall IDs
        remaining_seller_stalls = set(seller_stall_map.values())
        optimal_sequence = []
        current_origin = starting_stall_id
        
        logging.info(f"Seller stall mappings: {seller_stall_map}")
        
        # Dynamic origin algorithm
        sequence_number = 1
        while remaining_seller_stalls:
            logging.info(f"Step {sequence_number}: Current origin = stall_id {current_origin}")
            logging.info(f"Remaining sellers: {len(remaining_seller_stalls)} stalls")
            
            # Get sorted destinations from current origin (pre-calculated)
            if current_origin not in distance_matrix:
                logging.error(f"Origin stall {current_origin} not found in distance matrix")
                break
            
            sorted_destinations = distance_matrix[current_origin]
            
            # Find first destination that's still available
            selected_stall_id = None
            selected_distance = None
            
            for dest_stall_id in sorted_destinations:
                if dest_stall_id in remaining_seller_stalls:
                    selected_stall_id = dest_stall_id
                    
                    # Get distance for logging
                    distance_entry = StallDistanceMatrix.query.filter_by(
                        origin_stall_id=current_origin,
                        destination_stall_id=dest_stall_id
                    ).first()
                    selected_distance = distance_entry.distance if distance_entry else 999
                    break
            
            if selected_stall_id is None:
                logging.error(f"No available destination found from origin {current_origin}")
                break
            
            # Get seller info
            seller_user_id = stall_seller_map[selected_stall_id]
            
            # Add to sequence
            seller_info = {
                'seller_user_id': seller_user_id,
                'seller_stall_id': selected_stall_id,
                'distance': selected_distance,
                'sequence': sequence_number,
                'origin_stall_id': current_origin
            }
            optimal_sequence.append(seller_info)
            
            logging.info(f"Selected: Seller {seller_user_id} at stall {selected_stall_id} "
                        f"(distance={selected_distance} from origin {current_origin})")
            
            # Update for next iteration
            remaining_seller_stalls.remove(selected_stall_id)
            current_origin = selected_stall_id  # Move origin to selected seller's stall
            sequence_number += 1
        
        logging.info(f"Optimal sequence calculated: {len(optimal_sequence)} sellers")
        logging.info("Final sequence:")
        for i, seller in enumerate(optimal_sequence):
            logging.info(f"  {i+1}. Seller {seller['seller_user_id']} "
                        f"at stall {seller['seller_stall_id']} "
                        f"(distance={seller['distance']} from previous)")
        
        return optimal_sequence
        
    except Exception as e:
        logging.error(f"Error calculating optimal seller sequence: {str(e)}")
        return []

def fetch_sellers_optimized(stall_quota_map: Dict[int, int]) -> Tuple[List[Dict], int]:
    """Fetch all sellers using pre-calculated quotas with optimized database queries."""
    # Use the new consistent validation logic to get valid sellers
    valid_sellers_with_quota, total_sellers_found = get_valid_sellers_with_quota_info()
    
    if not valid_sellers_with_quota:
        logging.warning("No valid sellers found using new validation criteria")
        return [], total_sellers_found
    
    # Process each valid seller
    to_be_processed_sellers = []
    
    for seller in valid_sellers_with_quota:
        # Only include sellers who have free quota
        if seller['has_free_quota']:
            seller_info = {
                'user_id': seller['user_id'],
                'username': seller['username'],
                'business_name': seller['business_name'],
                'current_accepted_meetings': seller['accepted_meetings'],
                'allowed_meeting_quota': seller['total_quota'],
                'remaining_slots': seller['free_quota'],
                'stall_type_ids': [seller['stall_type_id']]  # Single stall type per seller in new validation
            }
            to_be_processed_sellers.append(seller_info)
            
            logging.info(f"✅ ADDED to 'To Be Processed Sellers': {seller['username']} (Remaining slots: {seller['free_quota']})")
        else:
            logging.info(f"❌ EXCLUDED from processing: {seller['username']} (Quota full: {seller['accepted_meetings']}/{seller['total_quota']})")
    
    logging.info(f"Using new validation criteria: {len(to_be_processed_sellers)} sellers with free quota out of {total_sellers_found} valid sellers")
    
    return to_be_processed_sellers, total_sellers_found

def fetch_buyers_optimized(category_quota_map: Dict[Optional[int], int]) -> Tuple[List[Dict], int]:
    """Fetch all buyers using pre-calculated quotas with optimized database queries."""
    # Single query to get all buyers with their categories
    buyers_with_categories = db.session.query(User, BuyerProfile, BuyerCategory)\
        .join(BuyerProfile, User.id == BuyerProfile.user_id)\
        .outerjoin(BuyerCategory, BuyerProfile.category_id == BuyerCategory.id)\
        .filter(User.role == 'buyer')\
        .all()
    
    total_buyers_found = len(buyers_with_categories)
    logging.info(f"Found {total_buyers_found} buyers in system")
    
    if not buyers_with_categories:
        logging.warning("No buyers found in system")
        return [], 0
    
    # Batch query for all buyer meeting counts
    buyer_ids = [user.id for user, _, _ in buyers_with_categories]
    buyer_meeting_counts = db.session.query(
        Meeting.buyer_id,
        db.func.count(Meeting.id).label('accepted_count')
    ).filter(
        Meeting.buyer_id.in_(buyer_ids),
        Meeting.status == MeetingStatus.ACCEPTED
    ).group_by(Meeting.buyer_id).all()
    
    # Convert to dictionary for O(1) lookup
    buyer_meeting_count_map = {buyer_id: count for buyer_id, count in buyer_meeting_counts}
    
    # Process each buyer
    available_buyers = []
    
    for user, buyer_profile, buyer_category in buyers_with_categories:
        # Get quota for this buyer's category
        category_id = buyer_profile.category_id if buyer_profile else None
        quota = category_quota_map.get(category_id, category_quota_map[None])
        
        # Get accepted meeting count (0 if no meetings)
        accepted_count = buyer_meeting_count_map.get(user.id, 0)
        
        # Log processing
        organization = buyer_profile.organization if buyer_profile else 'Unknown Organization'
        category_name = buyer_category.name if buyer_category else 'No Category'
        
        logging.info(f"Processing buyer: {user.username} (ID: {user.id}, Organization: {organization})")
        logging.info(f"Buyer {user.username}: Category = {category_name}, Allowed meeting quota = {quota}")
        logging.info(f"Buyer {user.username}: Current accepted meetings = {accepted_count}")
        
        # Decision logic
        if accepted_count < quota:
            remaining_slots = quota - accepted_count
            buyer_info = {
                'user_id': user.id,
                'username': user.username,
                'organization': organization,
                'category_id': category_id,
                'category_name': category_name,
                'current_accepted_meetings': accepted_count,
                'allowed_meeting_quota': quota,
                'remaining_slots': remaining_slots
            }
            available_buyers.append(buyer_info)
            logging.info(f"✅ ADDED to 'Available Buyers': {user.username} (Remaining slots: {remaining_slots})")
        else:
            logging.info(f"❌ EXCLUDED from available buyers: {user.username} (Quota full: {accepted_count}/{quota})")
    
    return available_buyers, total_buyers_found

def get_starting_point_stall_id(stall_number: str) -> Optional[int]:
    """Get stall inventory ID for the starting point stall number."""
    try:
        stall_inventory = StallInventory.query.filter_by(stall_number=stall_number).first()
        if stall_inventory:
            logging.info(f"Found starting point stall '{stall_number}' with ID: {stall_inventory.id}")
            return stall_inventory.id
        else:
            logging.warning(f"Starting point stall '{stall_number}' not found in stall_inventory")
            return None
    except Exception as e:
        logging.error(f"Error getting starting point stall ID for '{stall_number}': {str(e)}")
        return None

def get_seller_stall_numbers(seller_ids: List[int]) -> Dict[int, str]:
    """Get stall numbers for given seller IDs using correct relationship chain."""
    try:
        # Correct relationship: users → seller_profile → stalls (field stall_id) → stall_inventory
        seller_stalls = db.session.query(
            User.id.label('seller_user_id'),
            StallInventory.stall_number
        ).select_from(User)\
        .join(SellerProfile, User.id == SellerProfile.user_id)\
        .join(Stall, User.id == Stall.seller_id)\
        .join(StallInventory, Stall.stall_id == StallInventory.id)\
        .filter(
            User.id.in_(seller_ids),
            User.role == 'seller',
            Stall.stall_id.isnot(None)
        ).all()
        
        seller_stall_map = {}
        for seller_id, stall_number in seller_stalls:
            seller_stall_map[seller_id] = stall_number
        
        logging.info(f"Retrieved stall numbers for {len(seller_stall_map)} sellers using correct relationship")
        return seller_stall_map
        
    except Exception as e:
        logging.error(f"Error getting seller stall numbers: {str(e)}")
        return {}

def get_all_seller_stall_mappings() -> Dict[int, str]:
    """Get all seller to stall number mappings in one query for efficient lookup."""
    try:
        # Correct relationship: users → seller_profile → stalls (field stall_id) → stall_inventory
        seller_stalls = db.session.query(
            User.id.label('seller_user_id'),
            StallInventory.stall_number
        ).select_from(User)\
        .join(SellerProfile, User.id == SellerProfile.user_id)\
        .join(Stall, User.id == Stall.seller_id)\
        .join(StallInventory, Stall.stall_id == StallInventory.id)\
        .filter(
            User.role == 'seller',
            Stall.stall_id.isnot(None)
        ).all()
        
        seller_stall_map = {}
        for seller_id, stall_number in seller_stalls:
            seller_stall_map[seller_id] = stall_number
        
        logging.info(f"Retrieved stall mappings for {len(seller_stall_map)} sellers using correct relationship")
        return seller_stall_map
        
    except Exception as e:
        logging.error(f"Error getting all seller stall mappings: {str(e)}")
        return {}

def get_sellers_sorted_by_distance(seller_ids: List[int], origin_stall_id: int) -> List[Dict]:
    """Get sellers sorted by distance from origin stall."""
    try:
        # Get seller stall numbers first
        seller_stall_map = get_seller_stall_numbers(seller_ids)
        
        if not seller_stall_map:
            logging.warning("No seller stall mappings found")
            return []
        
        # Get stall inventory IDs for seller stalls
        stall_numbers = list(seller_stall_map.values())
        stall_inventory_items = StallInventory.query.filter(
            StallInventory.stall_number.in_(stall_numbers)
        ).all()
        
        stall_number_to_id = {item.stall_number: item.id for item in stall_inventory_items}
        
        # Get distances from origin to all seller stalls
        seller_stall_ids = [stall_number_to_id.get(stall_num) for stall_num in stall_numbers if stall_num in stall_number_to_id]
        
        distances = db.session.query(
            StallDistanceMatrix.destination_stall_id,
            StallDistanceMatrix.distance
        ).filter(
            StallDistanceMatrix.origin_stall_id == origin_stall_id,
            StallDistanceMatrix.destination_stall_id.in_(seller_stall_ids)
        ).all()
        
        # Create distance map
        distance_map = {dest_id: distance for dest_id, distance in distances}
        
        # Build result with seller info and distances
        sellers_with_distance = []
        for seller_id, stall_number in seller_stall_map.items():
            stall_id = stall_number_to_id.get(stall_number)
            distance = distance_map.get(stall_id, float('inf'))  # Use infinity if no distance found
            
            sellers_with_distance.append({
                'seller_id': seller_id,
                'stall_number': stall_number,
                'stall_id': stall_id,
                'distance': distance
            })
        
        # Sort by distance ascending
        sellers_with_distance.sort(key=lambda x: x['distance'])
        
        logging.info(f"Sorted {len(sellers_with_distance)} sellers by distance from origin stall ID {origin_stall_id}")
        for seller in sellers_with_distance:
            logging.info(f"  Seller {seller['seller_id']} at stall {seller['stall_number']}: distance {seller['distance']}")
        
        return sellers_with_distance
        
    except Exception as e:
        logging.error(f"Error sorting sellers by distance: {str(e)}")
        return []

def generate_buyer_time_slots_for_date(buyer_user_id: int, target_date) -> List[Dict]:
    """
    Generate time slots for a buyer on a specific date using system settings.
    This function creates time slots dynamically without storing them in the database.
    
    Args:
        buyer_user_id: Buyer's user ID
        target_date: Target date for generating slots
        
    Returns:
        List of time slot dictionaries with synthetic IDs
    """
    try:
        from scheduler_utils import (
            parse_time_from_string, parse_meeting_breaks, 
            create_datetime_from_date_time, add_minutes_to_time, 
            time_overlaps_with_breaks
        )
        
        logging.info(f"Generating time slots for buyer {buyer_user_id} on {target_date}")
        
        # Get system settings
        settings = get_system_settings()
        
        # Parse system settings
        meeting_duration = int(settings['meeting_duration'])
        meeting_interval = int(settings['meeting_interval'])
        day_start_time = parse_time_from_string(settings['day_start_time'])
        day_end_time = parse_time_from_string(settings['day_end_time'])
        meeting_breaks = parse_meeting_breaks(settings['meeting_breaks'])
        
        logging.debug(f"Settings: duration={meeting_duration}min, interval={meeting_interval}min, "
                     f"day={day_start_time}-{day_end_time}, breaks={len(meeting_breaks)}")
        
        # Generate time slots for the target date
        time_slots = []
        slot_id_counter = 1000000 + buyer_user_id * 1000  # Generate synthetic IDs
        
        meeting_start_time = day_start_time
        meeting_end_time = add_minutes_to_time(meeting_start_time, meeting_duration)
        
        # Generate slots until meeting_end_time >= day_end_time
        while meeting_end_time <= day_end_time:
            # Check if this time slot overlaps with any breaks
            if not time_overlaps_with_breaks(meeting_start_time, meeting_end_time, meeting_breaks):
                start_datetime = normalize_datetime(create_datetime_from_date_time(target_date, meeting_start_time))
                end_datetime = normalize_datetime(create_datetime_from_date_time(target_date, meeting_end_time))
                
                slot_info = {
                    'id': slot_id_counter,  # Synthetic ID
                    'user_id': buyer_user_id,
                    'start_time': start_datetime,
                    'end_time': end_datetime,
                    'is_available': True  # All generated slots are initially available
                }
                time_slots.append(slot_info)
                slot_id_counter += 1
                
                logging.debug(f"Generated slot: {start_datetime} - {end_datetime}")
            else:
                logging.debug(f"Skipped slot due to break overlap: {meeting_start_time} - {meeting_end_time}")
            
            # Move to next time slot
            meeting_start_time = add_minutes_to_time(meeting_end_time, meeting_interval)
            meeting_end_time = add_minutes_to_time(meeting_start_time, meeting_duration)
        
        logging.info(f"Generated {len(time_slots)} time slots for buyer {buyer_user_id} on {target_date}")
        return time_slots
        
    except Exception as e:
        logging.error(f"Error generating time slots for buyer {buyer_user_id} on {target_date}: {str(e)}")
        return []

def get_available_time_slots_for_date(user_id: int, target_date) -> List[Dict]:
    """Get available time slots for a user on a specific date."""
    try:
        from scheduler_utils import parse_time_from_string
        
        # Normalize target_date to ensure it's a date object
        if isinstance(target_date, datetime):
            target_date = target_date.date()
        elif isinstance(target_date, str):
            target_date = datetime.strptime(target_date, '%Y-%m-%d').date()
        
        # Get system settings for proper day boundaries
        settings = get_system_settings()
        day_start_time = parse_time_from_string(settings['day_start_time'])
        day_end_time = parse_time_from_string(settings['day_end_time'])
        
        # Create proper datetime range using system day boundaries
        start_datetime = datetime.combine(target_date, day_start_time)
        end_datetime = datetime.combine(target_date, day_end_time)
        
        logging.debug(f"Querying time slots for user {user_id} between {start_datetime} and {end_datetime}")
        
        time_slots = TimeSlot.query.filter(
            TimeSlot.user_id == user_id,
            TimeSlot.start_time >= start_datetime,
            TimeSlot.start_time <= end_datetime,
            TimeSlot.is_available == True
        ).order_by(TimeSlot.start_time).all()
        
        slots_list = []
        for slot in time_slots:
            slot_info = {
                'id': slot.id,
                'user_id': slot.user_id,
                'start_time': normalize_datetime(slot.start_time),
                'end_time': normalize_datetime(slot.end_time),
                'is_available': slot.is_available
            }
            slots_list.append(slot_info)
        
        logging.info(f"Found {len(slots_list)} available time slots for user {user_id} on {target_date} (between {day_start_time} and {day_end_time})")
        return slots_list
        
    except Exception as e:
        logging.error(f"Error getting available time slots for user {user_id} on {target_date}: {str(e)}")
        return []

def mark_time_slot_unavailable(user_id: int, time_slot_id: int, meeting_id: int) -> bool:
    """Mark a time slot as unavailable and assign meeting ID."""
    try:
        time_slot = TimeSlot.query.filter_by(
            id=time_slot_id,
            user_id=user_id
        ).first()
        
        if not time_slot:
            logging.error(f"Time slot {time_slot_id} not found for user {user_id}")
            return False
        
        if not time_slot.is_available:
            logging.warning(f"Time slot {time_slot_id} is already unavailable for user {user_id}")
            return False
        
        # Update the time slot
        time_slot.is_available = False
        time_slot.meeting_id = meeting_id
        
        db.session.commit()
        
        logging.info(f"Marked time slot {time_slot_id} as unavailable for user {user_id}, meeting {meeting_id}")
        return True
        
    except Exception as e:
        logging.error(f"Error marking time slot unavailable: {str(e)}")
        db.session.rollback()
        return False

def update_meetings_batch(meeting_allocations: List[Dict], preview_mode: bool = False) -> Dict[str, Any]:
    """
    Update multiple meeting records with scheduling information in a single transaction.
    
    Args:
        meeting_allocations: List of meeting allocation dictionaries with keys:
                           - meeting_id, start_time, end_time, seller_time_slot_id
        preview_mode: If True, log operations without executing
    
    Returns:
        Dictionary with batch update results
    """
    try:
        if preview_mode:
            logging.info(f"PREVIEW: Would update {len(meeting_allocations)} meetings in batch")
            for allocation in meeting_allocations:
                meeting_date = allocation['start_time'].date()
                meeting_time = allocation['start_time'].time()
                logging.info(f"PREVIEW: Would update meeting {allocation['meeting_id']} "
                           f"with date={meeting_date}, time={meeting_time}, "
                           f"time_slot_id={allocation['seller_time_slot_id']}")
            return {
                'success': True,
                'updated_count': len(meeting_allocations),
                'failed_count': 0,
                'preview_mode': True
            }
        
        updated_count = 0
        failed_updates = []
        
        # Process all updates in a single transaction
        for allocation in meeting_allocations:
            meeting_id = allocation['meeting_id']
            start_time = allocation['start_time']
            seller_time_slot_id = allocation['seller_time_slot_id']
            
            # Extract date and time from start_time
            meeting_date = start_time.date()
            meeting_time = start_time.time()
            
            # Find the meeting record
            meeting = Meeting.query.filter_by(id=meeting_id).first()
            
            if not meeting:
                failed_updates.append({
                    'meeting_id': meeting_id,
                    'error': f'Meeting {meeting_id} not found'
                })
                continue
            
            # Update the meeting fields
            meeting.meeting_date = meeting_date
            meeting.meeting_time = meeting_time
            meeting.time_slot_id = seller_time_slot_id
            
            updated_count += 1
            
            logging.info(f"Batched update: Meeting {meeting_id} → "
                        f"date={meeting_date}, time={meeting_time}, "
                        f"time_slot_id={seller_time_slot_id}")
        
        # Note: db.session.commit() will be called by the calling function
        
        logging.info(f"Batch meeting updates prepared: {updated_count} meetings updated, {len(failed_updates)} failed")
        
        return {
            'success': True,
            'updated_count': updated_count,
            'failed_count': len(failed_updates),
            'failed_updates': failed_updates,
            'preview_mode': False
        }
        
    except Exception as e:
        logging.error(f"Error in batch meeting update: {str(e)}")
        return {
            'success': False,
            'error': str(e),
            'updated_count': 0,
            'failed_count': len(meeting_allocations)
        }

def mark_time_slots_unavailable_batch(slot_updates: List[Dict], preview_mode: bool = False) -> Dict[str, Any]:
    """
    Mark multiple time slots as unavailable in a single transaction.
    
    Args:
        slot_updates: List of dicts with keys: user_id, time_slot_id, meeting_id
        preview_mode: If True, log operations without executing
    
    Returns:
        Dictionary with batch update results
    """
    try:
        if preview_mode:
            logging.info(f"PREVIEW: Would update {len(slot_updates)} time slots in batch")
            for update in slot_updates:
                logging.info(f"PREVIEW: Would mark user {update['user_id']} "
                           f"time slot {update['time_slot_id']} as unavailable "
                           f"for meeting {update['meeting_id']}")
            return {
                'success': True,
                'updated_count': len(slot_updates),
                'failed_count': 0,
                'preview_mode': True
            }
        
        updated_count = 0
        failed_updates = []
        
        # Process all updates in a single transaction
        for update in slot_updates:
            user_id = update['user_id']
            time_slot_id = update['time_slot_id']
            meeting_id = update['meeting_id']
            
            time_slot = TimeSlot.query.filter_by(
                id=time_slot_id,
                user_id=user_id
            ).first()
            
            if not time_slot:
                failed_updates.append({
                    'user_id': user_id,
                    'time_slot_id': time_slot_id,
                    'meeting_id': meeting_id,
                    'error': f'Time slot {time_slot_id} not found for user {user_id}'
                })
                continue
            
            if not time_slot.is_available:
                failed_updates.append({
                    'user_id': user_id,
                    'time_slot_id': time_slot_id,
                    'meeting_id': meeting_id,
                    'error': f'Time slot {time_slot_id} already unavailable for user {user_id}'
                })
                continue
            
            # Update the time slot
            time_slot.is_available = False
            time_slot.meeting_id = meeting_id
            updated_count += 1
            
            logging.info(f"Batched update: User {user_id} time slot {time_slot_id} → meeting {meeting_id}")
        
        # Commit all changes at once
        db.session.commit()
        
        logging.info(f"Batch commit completed: {updated_count} slots updated, {len(failed_updates)} failed")
        
        return {
            'success': True,
            'updated_count': updated_count,
            'failed_count': len(failed_updates),
            'failed_updates': failed_updates,
            'preview_mode': False
        }
        
    except Exception as e:
        logging.error(f"Error in batch time slot update: {str(e)}")
        db.session.rollback()
        return {
            'success': False,
            'error': str(e),
            'updated_count': 0,
            'failed_count': len(slot_updates)
        }

def schedule_meetings_for_buyer(buyer_id: int, accepted_meetings: List[Dict], 
                              available_sellers: List[Dict], starting_point: str,
                              target_date) -> Dict:
    """
    Schedule meetings for a buyer based on distance-optimized seller allocation.
    
    Args:
        buyer_id: Buyer profile ID
        accepted_meetings: List of all accepted meetings
        available_sellers: List of available sellers with quota info
        starting_point: Starting point stall number (e.g., 'G1')
        target_date: Target date for scheduling
    
    Returns:
        Dictionary with scheduling results
    """
    try:
        logging.info(f"=" * 60)
        logging.info(f"SCHEDULING MEETINGS FOR BUYER {buyer_id}")
        logging.info(f"=" * 60)
        
        # Step 1: Get buyer's user_id
        buyer_user_id = resolve_buyer_user_id(buyer_id)
        if not buyer_user_id:
            return {
                'success': False,
                'error': f'Buyer ID {buyer_id} not found'
            }
        
        # Step 2: Retrieve meetings for this buyer from accepted meetings
        buyer_meetings = [m for m in accepted_meetings if m['buyer_id'] == buyer_user_id]
        logging.info(f"Found {len(buyer_meetings)} accepted meetings for buyer {buyer_id} (user_id: {buyer_user_id})")
        
        if not buyer_meetings:
            logging.info(f"No accepted meetings found for buyer {buyer_id}")
            return {
                'success': True,
                'meetings_scheduled': 0,
                'message': 'No accepted meetings to schedule'
            }
        
        # Step 3: Extract seller IDs from meetings
        seller_ids = [m['seller_id'] for m in buyer_meetings]
        unique_seller_ids = list(set(seller_ids))
        logging.info(f"Meetings involve {len(unique_seller_ids)} unique sellers: {unique_seller_ids}")
        
        # Step 4: Get starting point stall ID
        origin_stall_id = get_starting_point_stall_id(starting_point)
        if not origin_stall_id:
            return {
                'success': False,
                'error': f'Starting point stall {starting_point} not found'
            }
        
        # Step 5: Sort sellers by distance from starting point
        sellers_by_distance = get_sellers_sorted_by_distance(unique_seller_ids, origin_stall_id)
        if not sellers_by_distance:
            return {
                'success': False,
                'error': 'Could not determine seller distances'
            }
        
        # Step 6: Get available time slots for buyer on target date
        buyer_time_slots = get_available_time_slots_for_date(buyer_user_id, target_date)
        if not buyer_time_slots:
            return {
                'success': False,
                'error': f'No available time slots for buyer on {target_date}'
            }
        
        # Step 7: Allocate meetings in distance order
        meeting_allocations = []
        slot_index = 0
        
        for seller_distance_info in sellers_by_distance:
            seller_id = seller_distance_info['seller_id']
            distance = seller_distance_info['distance']
            
            # Find meetings with this seller
            seller_meetings = [m for m in buyer_meetings if m['seller_id'] == seller_id]
            
            for meeting in seller_meetings:
                if slot_index >= len(buyer_time_slots):
                    logging.warning(f"No more time slots available for buyer {buyer_id}")
                    break
                
                # Get seller's available time slots for the same time
                buyer_slot = buyer_time_slots[slot_index]
                seller_time_slots = get_available_time_slots_for_date(seller_id, target_date)
                
                # Find matching time slot for seller
                matching_seller_slot = None
                for seller_slot in seller_time_slots:
                    if (seller_slot['start_time'] == buyer_slot['start_time'] and 
                        seller_slot['end_time'] == buyer_slot['end_time']):
                        matching_seller_slot = seller_slot
                        break
                
                if matching_seller_slot:
                    allocation = {
                        'meeting_id': meeting['meeting_id'],
                        'buyer_id': buyer_user_id,
                        'seller_id': seller_id,
                        'buyer_time_slot_id': buyer_slot['id'],
                        'seller_time_slot_id': matching_seller_slot['id'],
                        'start_time': buyer_slot['start_time'],
                        'end_time': buyer_slot['end_time'],
                        'distance': distance,
                        'sequence': slot_index + 1
                    }
                    meeting_allocations.append(allocation)
                    
                    logging.info(f"Allocated meeting {meeting['meeting_id']}: "
                               f"Buyer {buyer_id} ↔ Seller {seller_id} "
                               f"at {buyer_slot['start_time']} (distance: {distance}, sequence: {slot_index + 1})")
                    
                    slot_index += 1
                else:
                    logging.warning(f"No matching time slot found for seller {seller_id} at {buyer_slot['start_time']}")
        
        logging.info(f"Scheduled {len(meeting_allocations)} meetings for buyer {buyer_id}")
        
        return {
            'success': True,
            'buyer_id': buyer_id,
            'buyer_user_id': buyer_user_id,
            'meetings_scheduled': len(meeting_allocations),
            'meeting_allocations': meeting_allocations,
            'starting_point': starting_point,
            'target_date': target_date
        }
        
    except Exception as e:
        error_msg = f"Error scheduling meetings for buyer {buyer_id}: {str(e)}"
        logging.error(error_msg)
        return {
            'success': False,
            'error': error_msg
        }

def create_scheduled_meeting(allocation: Dict, preview_mode: bool = False) -> Dict[str, Any]:
    """
    Create a meeting record and update time slots based on allocation.
    
    Args:
        allocation: Meeting allocation dictionary
        preview_mode: If True, log operations without executing
    
    Returns:
        Result dictionary with success status
    """
    try:
        if preview_mode:
            logging.info(f"PREVIEW: Would create meeting {allocation['meeting_id']} "
                        f"between buyer {allocation['buyer_id']} and seller {allocation['seller_id']} "
                        f"at {allocation['start_time']}")
            logging.info(f"PREVIEW: Would mark time slots unavailable - "
                        f"buyer slot {allocation['buyer_time_slot_id']}, "
                        f"seller slot {allocation['seller_time_slot_id']}")
            return {
                'success': True,
                'preview': True,
                'meeting_id': allocation['meeting_id']
            }
        
        # Update time slots to mark them as unavailable
        buyer_slot_updated = mark_time_slot_unavailable(
            allocation['buyer_id'], 
            allocation['buyer_time_slot_id'], 
            allocation['meeting_id']
        )
        
        seller_slot_updated = mark_time_slot_unavailable(
            allocation['seller_id'], 
            allocation['seller_time_slot_id'], 
            allocation['meeting_id']
        )
        
        if not buyer_slot_updated or not seller_slot_updated:
            return {
                'success': False,
                'error': f'Failed to update time slots for meeting {allocation["meeting_id"]}'
            }
        
        logging.info(f"Successfully scheduled meeting {allocation['meeting_id']} "
                    f"between buyer {allocation['buyer_id']} and seller {allocation['seller_id']} "
                    f"at {allocation['start_time']}")
        
        return {
            'success': True,
            'meeting_id': allocation['meeting_id'],
            'buyer_slot_updated': buyer_slot_updated,
            'seller_slot_updated': seller_slot_updated
        }
        
    except Exception as e:
        error_msg = f"Error creating scheduled meeting: {str(e)}"
        logging.error(error_msg)
        return {
            'success': False,
            'error': error_msg
        }

def get_seller_stall_number(seller_user_id: int) -> Optional[str]:
    """Get stall number for a seller based on user_id using correct relationship chain."""
    try:
        # Correct relationship: users → seller_profile → stalls (field stall_id) → stall_inventory
        seller_stall_info = db.session.query(
            StallInventory.stall_number
        ).select_from(User)\
        .join(SellerProfile, User.id == SellerProfile.user_id)\
        .join(Stall, User.id == Stall.seller_id)\
        .join(StallInventory, Stall.stall_id == StallInventory.id)\
        .filter(
            User.id == seller_user_id,
            User.role == 'seller',
            Stall.stall_id.isnot(None)
        ).first()
        
        if seller_stall_info:
            stall_number = seller_stall_info.stall_number
            logging.debug(f"Found seller {seller_user_id} at stall {stall_number}")
            return stall_number
        else:
            logging.debug(f"No stall found for seller {seller_user_id}")
            return None
            
    except Exception as e:
        logging.error(f"Error getting stall number for seller {seller_user_id}: {str(e)}")
        return None

def get_seller_stall_id_from_user_id(seller_user_id: int) -> Optional[int]:
    """Get stall_inventory ID for a seller based on user_id using correct relationship chain."""
    try:
        # Correct relationship: users → seller_profile → stalls (field stall_id) → stall_inventory
        seller_stall_info = db.session.query(
            StallInventory.id,
            StallInventory.stall_number
        ).select_from(User)\
        .join(SellerProfile, User.id == SellerProfile.user_id)\
        .join(Stall, User.id == Stall.seller_id)\
        .join(StallInventory, Stall.stall_id == StallInventory.id)\
        .filter(
            User.id == seller_user_id,
            User.role == 'seller',
            Stall.stall_id.isnot(None)
        ).first()
        
        if seller_stall_info:
            stall_inventory_id = seller_stall_info.id
            stall_number = seller_stall_info.stall_number
            logging.debug(f"Found seller {seller_user_id} at stall {stall_number} (ID: {stall_inventory_id})")
            return stall_inventory_id
        else:
            logging.debug(f"No stall found for seller {seller_user_id}")
            return None
            
    except Exception as e:
        logging.error(f"Error getting stall ID for seller {seller_user_id}: {str(e)}")
        return None

def get_sellers_sorted_by_distance_from_origin(seller_user_ids: List[int], origin_stall_id: int, 
                                              seller_distance_cache: Optional[Dict[int, Dict[str, Any]]] = None) -> List[Dict]:
    """
    Get sellers sorted by distance from origin stall using pre-loaded seller distance cache.
    
    Args:
        seller_user_ids: List of seller user IDs
        origin_stall_id: Origin stall inventory ID (e.g., G1 = 314)
        seller_distance_cache: Pre-loaded seller-stall-distance cache (optional, falls back to DB queries)
    
    Returns:
        List of dictionaries with seller info and distances, sorted by distance ASC
    """
    try:
        logging.info(f"Sorting {len(seller_user_ids)} sellers by distance from origin stall ID {origin_stall_id}")
        
        # Get all seller stall mappings once for efficient lookup
        seller_stall_mappings = get_all_seller_stall_mappings()
        
        sellers_with_distance = []
        
        for seller_user_id in seller_user_ids:
            # Try to use cache first if available
            if seller_distance_cache and seller_user_id in seller_distance_cache:
                seller_info = seller_distance_cache[seller_user_id]
                seller_stall_id = seller_info['seller_stall_id']
                
                # Look up distance from origin to this seller's stall in the cache
                if origin_stall_id in seller_info['distance_matrix']:
                    distance_info = seller_info['distance_matrix'][origin_stall_id]
                    distance = distance_info['distance']
                    logging.info(f"Seller {seller_user_id}: stall_id={seller_stall_id}, distance={distance} (from cache)")
                else:
                    # Origin not found in this seller's distance matrix, use high value
                    distance = 999
                    logging.warning(f"Origin stall {origin_stall_id} not found in seller {seller_user_id} distance matrix, using distance=999")
                
                sellers_with_distance.append({
                    'seller_user_id': seller_user_id,
                    'seller_stall_id': seller_stall_id,
                    'distance': distance
                })
            else:
                # Fall back to database queries if cache not available
                logging.info(f"Seller {seller_user_id} not found in cache, falling back to database query")
                
                # Get seller's stall ID
                seller_stall_id = get_seller_stall_id_from_user_id(seller_user_id)
                
                if seller_stall_id:
                    # Get distance from origin to seller's stall
                    distance_row = StallDistanceMatrix.query.filter_by(
                        origin_stall_id=origin_stall_id,
                        destination_stall_id=seller_stall_id
                    ).first()
                    
                    if distance_row:
                        distance = distance_row.distance
                        logging.info(f"Seller {seller_user_id}: stall_id={seller_stall_id}, distance={distance} (from database)")
                    else:
                        # If no distance found, use a high value to put at end
                        distance = 999
                        logging.warning(f"No distance found for seller {seller_user_id} (stall_id={seller_stall_id}), using distance=999")
                    
                    sellers_with_distance.append({
                        'seller_user_id': seller_user_id,
                        'seller_stall_id': seller_stall_id,
                        'distance': distance
                    })
                else:
                    # If no stall found, use maximum distance
                    logging.warning(f"No stall found for seller {seller_user_id}, using distance=999")
                    sellers_with_distance.append({
                        'seller_user_id': seller_user_id,
                        'seller_stall_id': None,
                        'distance': 999
                    })
        
        # Sort by distance ascending
        sellers_with_distance.sort(key=lambda x: x['distance'])
        
        logging.info(f"Sellers sorted by distance from origin stall ID {origin_stall_id}:")
        for i, seller in enumerate(sellers_with_distance):
            stall_number = seller_stall_mappings.get(seller['seller_user_id'], 'NULL')
            logging.info(f"  {i+1}. Seller {seller['seller_user_id']} (stall={stall_number}): distance={seller['distance']}")
        
        return sellers_with_distance
        
    except Exception as e:
        logging.error(f"Error sorting sellers by distance: {str(e)}")
        return []

def execute_core_scheduling_logic_for_specific_buyer(buyer_id: int,
                                                   accepted_meetings: List[Dict], 
                                                   available_buyers: List[Dict],
                                                   available_sellers: List[Dict],
                                                   starting_point: str,
                                                   target_date,
                                                   preview_mode: bool = False) -> Dict[str, Any]:
    """
    Execute core scheduling logic for a specific buyer ID.
    
    Args:
        buyer_id: Specific buyer profile ID to process (from Excel file)
        accepted_meetings: List of all accepted meetings
        available_buyers: List of available buyers with quota info
        available_sellers: List of available sellers with quota info
        starting_point: Starting point stall number (e.g., 'G1')
        target_date: Target date for scheduling
        preview_mode: If True, log operations without executing
    
    Returns:
        Dictionary with scheduling results for the specific buyer
    """
    try:
        logging.info("=" * 80)
        logging.info(f"EXECUTING CORE SCHEDULING LOGIC FOR BUYER ID {buyer_id}")
        logging.info("=" * 80)
        
        # Convert buyer_id to user_id
        buyer_user_id = resolve_buyer_user_id(buyer_id)
        if not buyer_user_id:
            return {
                'success': False,
                'error': f'Buyer ID {buyer_id} not found'
            }
        
        logging.info(f"Processing SPECIFIC BUYER: (user_id: {buyer_user_id}, buyer_id: {buyer_id})")
        
        # Step (i): Retrieve list of meetings where buyer_id = meeting.buyer_id
        buyer_meetings = [meeting for meeting in accepted_meetings 
                         if meeting['buyer_id'] == buyer_user_id]
        
        if not buyer_meetings:
            logging.info(f"No accepted meetings found for buyer {buyer_user_id}")
            return {
                'success': True,
                'buyer_user_id': buyer_user_id,
                'meetings_scheduled': 0,
                'time_slots_updated': 0,
                'failed_updates': 0,
                'message': 'No accepted meetings to schedule'
            }
        
        logging.info(f"Step (i): Found {len(buyer_meetings)} accepted meetings for buyer {buyer_user_id}")
        
        # Step (ii): Retrieve all sellers for these meetings
        seller_user_ids = list(set([meeting['seller_id'] for meeting in buyer_meetings]))
        logging.info(f"Step (ii): Found {len(seller_user_ids)} unique sellers: {seller_user_ids}")
        
        # Step (iii): Get seller stall numbers (handled within distance sorting)
        logging.info(f"Step (iii): Getting seller stall information...")
        
        # Step (iv): Get starting point stall ID and sort sellers by distance
        origin_stall_id = get_starting_point_stall_id(starting_point)
        if not origin_stall_id:
            return {
                'success': False,
                'error': f'Starting point stall {starting_point} not found'
            }
        
        logging.info(f"Step (iv): Starting point {starting_point} has stall_id={origin_stall_id}")
        
        # Get seller stall IDs for distance sorting
        seller_stall_ids = []
        seller_to_stall_map = {}
        
        for seller_user_id in seller_user_ids:
            seller_stall_id = get_seller_stall_id_from_user_id(seller_user_id)
            if seller_stall_id:
                seller_stall_ids.append(seller_stall_id)
                seller_to_stall_map[seller_stall_id] = seller_user_id
        
        if not seller_stall_ids:
            return {
                'success': False,
                'error': 'No seller stalls found'
            }
        
        # Query StallDistanceMatrix directly with origin stall and sort by distance ascending
        distance_rows = db.session.query(
            StallDistanceMatrix.destination_stall_id,
            StallDistanceMatrix.distance
        ).filter(
            StallDistanceMatrix.origin_stall_id == origin_stall_id,
            StallDistanceMatrix.destination_stall_id.in_(seller_stall_ids)
        ).order_by(StallDistanceMatrix.distance.asc()).all()
        
        # Build sellers_by_distance list in distance order
        sellers_by_distance = []
        for dest_stall_id, distance in distance_rows:
            seller_user_id = seller_to_stall_map[dest_stall_id]
            sellers_by_distance.append({
                'seller_user_id': seller_user_id,
                'seller_stall_id': dest_stall_id,
                'distance': distance
            })
        
        if not sellers_by_distance:
            return {
                'success': False,
                'error': 'Could not sort sellers by distance'
            }
        
        # Step (v): Allocate meetings in distance order
        # Generate buyer's time slots for target date (dynamic generation) - INIT for this buyer
        buyer_time_slots = generate_buyer_time_slots_for_date(buyer_user_id, target_date)
        if not buyer_time_slots:
            return {
                'success': False,
                'error': f'No available time slots for buyer {buyer_user_id} on {target_date}'
            }
        
        logging.info(f"Generated {len(buyer_time_slots)} time slots for buyer {buyer_user_id} on {target_date}")
        
        logging.info(f"Step (v): Allocating meetings in distance order...")
        
        # Process meetings in distance order
        meeting_allocations = []
        slot_index = 0
        
        for seller_info in sellers_by_distance:
            seller_user_id = seller_info['seller_user_id']
            distance = seller_info['distance']
            
            # Find all meetings between this buyer and this seller
            seller_meetings = [meeting for meeting in buyer_meetings 
                             if meeting['seller_id'] == seller_user_id]
            
            logging.info(f"Processing seller {seller_user_id} (distance={distance}): {len(seller_meetings)} meetings")
            
            # Get seller's available time slots
            seller_time_slots = get_available_time_slots_for_date(seller_user_id, target_date)
            if not seller_time_slots:
                logging.warning(f"No available time slots for seller {seller_user_id} on {target_date}")
                continue
            
            # Allocate meetings for this seller
            for meeting in seller_meetings:
                if slot_index >= len(buyer_time_slots):
                    logging.warning(f"No more time slots available for buyer {buyer_id}")
                    break
                
                buyer_slot = buyer_time_slots[slot_index]
                
                # Find matching time slot for seller (same start and end time)
                matching_seller_slot = None
                for seller_slot in seller_time_slots:
                    if (normalize_datetime(seller_slot['start_time']) == normalize_datetime(buyer_slot['start_time']) and 
                        normalize_datetime(seller_slot['end_time']) == normalize_datetime(buyer_slot['end_time'])):
                        matching_seller_slot = seller_slot
                        break
                
                if matching_seller_slot:
                    allocation = {
                        'meeting_id': meeting['meeting_id'],
                        'buyer_user_id': buyer_user_id,
                        'seller_user_id': seller_user_id,
                        'buyer_time_slot_id': buyer_slot['id'],
                        'seller_time_slot_id': matching_seller_slot['id'],
                        'start_time': buyer_slot['start_time'],
                        'end_time': buyer_slot['end_time'],
                        'distance': distance,
                        'sequence': slot_index + 1
                    }
                    meeting_allocations.append(allocation)
                    
                    logging.info(f"Allocated meeting {meeting['meeting_id']}: "
                               f"Buyer {buyer_username} ↔ Seller {seller_user_id} "
                               f"at {buyer_slot['start_time']} (distance={distance}, seq={slot_index + 1})")
                    
                    slot_index += 1
                else:
                    logging.warning(f"No matching time slot found for seller {seller_id} at {buyer_slot['start_time']}")
        
        # Step (vi): Update time slots using batch commit approach
        logging.info(f"Step (vi): Preparing batch time slot updates for {len(meeting_allocations)} meetings...")
        
        # Collect all slot updates for batch processing
        slot_updates = []
        for allocation in meeting_allocations:
            slot_updates.append({
                'user_id': allocation['seller_user_id'],
                'time_slot_id': allocation['seller_time_slot_id'],
                'meeting_id': allocation['meeting_id']
            })
        
        # Execute batch update
        batch_result = mark_time_slots_unavailable_batch(slot_updates, preview_mode)
        
        if batch_result['success']:
            successful_updates = batch_result['updated_count']
            failed_updates = batch_result['failed_count']
            
            logging.info(f"Batch update completed: {successful_updates} successful, {failed_updates} failed")
            
            if batch_result.get('failed_updates'):
                for failed_update in batch_result['failed_updates']:
                    logging.error(f"Failed to update: {failed_update}")
        else:
            successful_updates = 0
            failed_updates = len(slot_updates)
            logging.error(f"Batch update failed: {batch_result.get('error', 'Unknown error')}")
        
        logging.info("=" * 80)
        logging.info(f"CORE SCHEDULING LOGIC COMPLETED FOR BUYER ID {buyer_id}")
        logging.info(f"Buyer: {buyer_username} (user_id: {buyer_user_id})")
        logging.info(f"Meetings scheduled: {len(meeting_allocations)}")
        logging.info(f"Time slots updated: {successful_updates}")
        logging.info(f"Failed updates: {failed_updates}")
        logging.info("=" * 80)
        
        return {
            'success': True,
            'buyer_id': buyer_id,
            'buyer_user_id': buyer_user_id,
            'buyer_username': buyer_username,
            'meetings_scheduled': len(meeting_allocations),
            'meeting_allocations': meeting_allocations,
            'time_slots_updated': successful_updates,
            'failed_updates': failed_updates,
            'starting_point': starting_point,
            'target_date': target_date,
            'preview_mode': preview_mode
        }
        
    except Exception as e:
        error_msg = f"Error executing core scheduling logic for buyer {buyer_id}: {str(e)}"
        logging.error(error_msg)
        return {
            'success': False,
            'error': error_msg
        }

def execute_core_scheduling_logic_second_buyer_onwards(buyer_id: int,
                                                      available_buyers: List[Dict],
                                                      available_sellers: List[Dict],
                                                      starting_point_stall_id: int,
                                                      target_date,
                                                      preview_mode: bool = False,
                                                      seller_distance_cache: Optional[Dict[int, Dict[str, Any]]] = None,
                                                      total_number_of_meeting_not_allocated_time_conflicts: Optional[List[int]] = None) -> Dict[str, Any]:
    """
    Execute core scheduling logic for second buyer onwards using dynamic starting point algorithm.
    
    Algorithm:
    Loop 1: Buyers (2 to n)
        (i)   Retrieve list of meetings from accepted_meetings where buyer_id = meeting.buyer_id
        (ii)  Retrieve all sellers for these meetings
        (iii) From (ii) above, get seller stall numbers
        (iv)  Init: relative_starting_point = starting_point_stall_id (pre-resolved)
        
        Loop 2: While there are unallocated sellers
            (v)   Identify closest seller based on relative starting point
            (vi)  Loop 3 on all sellers from (ii)
                  : Identify seller who has current time slot free
                  If free, allocate time slot
                  Once allocated, change relative_starting_point to stall of current seller
                  exit loop 3
                  
                  else if not allocated:
                  (note: there is no change to relative starting point)
                  get current slot = current slot++
            (vii) Continue loop 2 with remaining sellers till slot is found
        exit loop 2
        
        Commit all changes for current buyer and refetch data
    """
    try:
        logging.info("=" * 80)
        logging.info(f"EXECUTING CORE SCHEDULING LOGIC FOR BUYER ID {buyer_id} (Second Buyer Onwards)")
        logging.info("=" * 80)
        
        # Convert buyer_id to user_id and validate
        buyer_user_id = resolve_buyer_user_id(buyer_id)
        if not buyer_user_id:
            return {
                'success': False,
                'error': f'Buyer ID {buyer_user_id} not found in buyer_profiles table'
            }
        
        # Check if buyer exists in available_buyers cache (optimization check)
        buyer_found_in_cache = False
        if available_buyers and buyer_user_id in available_buyers:
            buyer_found_in_cache = True
            logging.info(f"Found buyer {buyer_user_id} in available_buyers cache")
        else:
            logging.info(f"Buyer {buyer_user_id} not found in available_buyers cache, checking database")
            
            # Only get buyer profile from database if not found in cache
            buyer_profile = BuyerProfile.query.filter_by(user_id=buyer_user_id).first()
            if not buyer_profile:
                error_msg = f'Buyer ID {buyer_id} not found in buyer_profiles'
                logging.error(error_msg)
                return {
                    'success': False,
                    'error': error_msg
                }
        
        logging.info(f"Processing SPECIFIC BUYER: (user_id: {buyer_user_id}, buyer_id: {buyer_id})")
        
        # Step (i): Retrieve list of meetings where buyer_id = meeting.buyer_id
        accepted_meetings = get_accepted_meetings()
        buyer_meetings = [meeting for meeting in accepted_meetings 
                         if meeting['buyer_id'] == buyer_user_id]
        
        if not buyer_meetings:
            logging.info(f"No accepted meetings found for buyer {buyer_user_id}")
            return {
                'success': True,
                'buyer_user_id': buyer_user_id,
                'meetings_scheduled': 0,
                'time_slots_updated': 0,
                'failed_updates': 0,
                'message': 'No accepted meetings to schedule'
            }
        
        logging.info(f"Step (i): Found {len(buyer_meetings)} accepted meetings for buyer {buyer_user_id}")
        
        # Step (ii): Retrieve all sellers for these meetings
        seller_user_ids = list(set([meeting['seller_id'] for meeting in buyer_meetings]))
        #logging.info(f"Step (ii): Found {len(seller_user_ids)} unique sellers: {seller_user_ids}")
        
        # Step (iii): Get seller stall numbers and build seller info
        seller_stall_map = {}
        for seller_user_id in seller_user_ids:
            stall_id = get_seller_stall_id_from_user_id(seller_user_id)
            if stall_id:
                seller_stall_map[seller_user_id] = stall_id
            else:
                logging.warning(f"No stall found for seller {seller_user_id}")
        
        if not seller_stall_map:
            return {
                'success': False,
                'error': 'No stalls found for any sellers'
            }
        
        #logging.info(f"Step (iii): Seller stall mappings: {seller_stall_map}")
        
        # Step (iv): Init relative_starting_point with pre-resolved starting point stall ID
        relative_starting_point = starting_point_stall_id
        logging.info(f"Step (iv): Initial relative starting point = {relative_starting_point}")
        
        # Generate buyer's time slots for target date (dynamic generation) - INIT for this buyer
        buyer_time_slots = generate_buyer_time_slots_for_date(buyer_user_id, target_date)
        if not buyer_time_slots:
            return {
                'success': False,
                'error': f'No available time slots for buyer {buyer_user_id} on {target_date}'
            }
        
        logging.info(f"Generated {len(buyer_time_slots)} time slots for buyer {buyer_user_id} on {target_date}")
        
        # Initialize loop variables
        remaining_sellers = list(seller_user_ids)
        current_time_slot_index = 0
        meeting_allocations = []
        pending_timeslot_updates = []
        
        # Initialize per-buyer time conflict counter
        number_of_meetings_not_allocated_time_conflict = 0
        
        #logging.info(f"Starting Loop 2: Processing {len(remaining_sellers)} sellers")
        
        # Loop 2: While there are unallocated sellers
        while remaining_sellers and current_time_slot_index < len(buyer_time_slots):
            #logging.info(f"Loop 2 - Iteration: {len(remaining_sellers)} sellers remaining, "
            #            f"time slot index: {current_time_slot_index}")
            
            buyer_time_slot = buyer_time_slots[current_time_slot_index]
            logging.info(f"Current buyer time slot: {buyer_time_slot['start_time']} - {buyer_time_slot['end_time']}")
            
            # Step (v): Sort remaining sellers by distance from current relative starting point
            # Get seller stall IDs for remaining sellers
            remaining_seller_stall_ids = []
            remaining_seller_to_stall_map = {}
            
            for seller_user_id in remaining_sellers:
                seller_stall_id = seller_stall_map.get(seller_user_id)
                if seller_stall_id:
                    remaining_seller_stall_ids.append(seller_stall_id)
                    remaining_seller_to_stall_map[seller_stall_id] = seller_user_id
            
            if not remaining_seller_stall_ids:
                logging.warning("No remaining seller stalls found")
                break
            
            # Query StallDistanceMatrix directly with relative starting point and sort by distance ascending
            distance_rows = db.session.query(
                StallDistanceMatrix.destination_stall_id,
                StallDistanceMatrix.distance
            ).filter(
                StallDistanceMatrix.origin_stall_id == relative_starting_point,
                StallDistanceMatrix.destination_stall_id.in_(remaining_seller_stall_ids)
            ).order_by(StallDistanceMatrix.distance.asc()).all()
            
            # Build sellers_by_distance list in distance order
            sellers_by_distance = []
            for dest_stall_id, distance in distance_rows:
                seller_user_id = remaining_seller_to_stall_map[dest_stall_id]
                sellers_by_distance.append({
                    'seller_user_id': seller_user_id,
                    'seller_stall_id': dest_stall_id,
                    'distance': distance
                })
            
            logging.info(f"Sellers sorted by distance from origin {relative_starting_point}:")
            #for i, seller in enumerate(sellers_by_distance):
            #    logging.info(f"  {i+1}. Seller {seller['seller_user_id']} "
            #               f"(stall {seller['seller_stall_id']}, distance {seller['distance']})")
            
            allocation_found = False
            
            # Step (vi): Loop 3 - Try to allocate closest available seller
            for seller_info in sellers_by_distance:
                seller_user_id = seller_info['seller_user_id']
                seller_stall_id = seller_info['seller_stall_id']
                distance = seller_info['distance']
                
                #logging.info(f"Loop 3: Trying seller {seller_user_id} (distance {distance})")
                
                # Get seller's available time slots for target date
                seller_time_slots = get_available_time_slots_for_date(seller_user_id, target_date)
                
                # Find matching time slot for seller (same start and end time)
                matching_seller_slot = None
                for seller_slot in seller_time_slots:
                    if (seller_slot['start_time'] == buyer_time_slot['start_time'] and 
                        seller_slot['end_time'] == buyer_time_slot['end_time']):
                        matching_seller_slot = seller_slot
                        break
                
                if matching_seller_slot:
                    # Found available slot - allocate it
                    
                    # Find the meeting between this buyer and seller
                    meeting_to_allocate = None
                    for meeting in buyer_meetings:
                        if meeting['seller_id'] == seller_user_id:
                            meeting_to_allocate = meeting
                            break
                    
                    if meeting_to_allocate:
                        allocation = {
                            'meeting_id': meeting_to_allocate['meeting_id'],
                            'buyer_user_id': buyer_user_id,
                            'seller_user_id': seller_user_id,
                            'buyer_time_slot_id': buyer_time_slot['id'],
                            'seller_time_slot_id': matching_seller_slot['id'],
                            'start_time': buyer_time_slot['start_time'],
                            'end_time': buyer_time_slot['end_time'],
                            'distance': distance,
                            'sequence': current_time_slot_index + 1
                        }
                        meeting_allocations.append(allocation)
                        
                        # Add to pending time slot updates
                        pending_timeslot_updates.append({
                            'user_id': seller_user_id,
                            'time_slot_id': matching_seller_slot['id'],
                            'meeting_id': meeting_to_allocate['meeting_id']
                        })
                        
                        logging.info(f"✅ ALLOCATED: Meeting {meeting_to_allocate['meeting_id']} - "
                                   f"Buyer {buyer_user_id} ↔ Seller {seller_user_id} "
                                   f"at {buyer_time_slot['start_time']} "
                                   f"(distance={distance}, seq={current_time_slot_index + 1})")
                        
                        # Remove seller from remaining list
                        remaining_sellers.remove(seller_user_id)
                        
                        # Move to next buyer slot with boundary check
                        if current_time_slot_index + 1 < len(buyer_time_slots):
                            current_time_slot_index += 1
                            logging.info(f"Moved to next buyer slot (index: {current_time_slot_index})")
                        else:
                            logging.info(f"Reached last buyer time slot (index: {current_time_slot_index})")
                        
                        # Update relative starting_point to current seller's stall
                        relative_starting_point = seller_stall_id
                        logging.info(f"Updated relative starting point to: {relative_starting_point}")
                        
                        allocation_found = True
                        break
                    else:
                        logging.warning(f"No meeting found between buyer {buyer_user_id} and seller {seller_user_id}")
                else:
                    logging.info(f"Seller {seller_user_id} not available at {buyer_time_slot['start_time']}")
            
            if not allocation_found:
                # No seller was available for current time slot, move to next slot
                
                # Log explicit slot start and end time
                slot_start_time = buyer_time_slot['start_time']
                slot_end_time = buyer_time_slot['end_time']
                logging.info(f"Time conflict - Slot: {slot_start_time} to {slot_end_time}")
                print(f"Time conflict - Slot: {slot_start_time} to {slot_end_time}")
                
                # Increment per-buyer time conflict counter
                number_of_meetings_not_allocated_time_conflict += 1
                
                # Increment global time conflict counter if provided
                if total_number_of_meeting_not_allocated_time_conflicts is not None:
                    total_number_of_meeting_not_allocated_time_conflicts[0] += 1
                
                logging.info(f"Time conflicts for this buyer: {number_of_meetings_not_allocated_time_conflict}")
                print(f"Time conflicts for this buyer: {number_of_meetings_not_allocated_time_conflict}")
                
                current_time_slot_index += 1
                logging.info(f"No allocation found for current slot, moving to next slot (index: {current_time_slot_index})")
            else:
                # Allocation found, continue with next iteration (same time slot index for next seller)
                pass
        
        # Step (vii): Continue loop 2 with remaining sellers till all are allocated
        
        # Commit all changes for current buyer
        if meeting_allocations and pending_timeslot_updates:
            logging.info(f"Committing {len(meeting_allocations)} meetings and {len(pending_timeslot_updates)} time slot updates for buyer {buyer_user_id}")
            
            try:
                # Update meeting records
                meeting_result = update_meetings_batch(meeting_allocations, preview_mode)
                
                # Update time slots
                timeslot_result = mark_time_slots_unavailable_batch(pending_timeslot_updates, preview_mode)
                
                # Single commit for both operations (only if not in preview mode)
                if not preview_mode and meeting_result['success'] and timeslot_result['success']:
                    db.session.commit()
                    logging.info("Single transaction commit completed for both meetings and time slots")
                
                if meeting_result['success'] and timeslot_result['success']:
                    successful_updates = timeslot_result['updated_count']
                    failed_updates = timeslot_result['failed_count']
                    
                    logging.info(f"Batch update completed: {successful_updates} time slots updated, {len(meeting_allocations)} meetings updated")
                    
                    if timeslot_result.get('failed_updates'):
                        for failed_update in timeslot_result['failed_updates']:
                            logging.error(f"Failed to update: {failed_update}")
                    
                    if meeting_result.get('failed_updates'):
                        for failed_update in meeting_result['failed_updates']:
                            logging.error(f"Failed to update meeting: {failed_update}")
                else:
                    successful_updates = 0
                    failed_updates = len(pending_timeslot_updates)
                    if not meeting_result['success']:
                        logging.error(f"Meeting batch update failed: {meeting_result.get('error', 'Unknown error')}")
                    if not timeslot_result['success']:
                        logging.error(f"Time slot batch update failed: {timeslot_result.get('error', 'Unknown error')}")
                        
            except Exception as e:
                if not preview_mode:
                    db.session.rollback()
                    logging.error(f"Transaction rolled back due to error: {str(e)}")
                successful_updates = 0
                failed_updates = len(pending_timeslot_updates)
                logging.error(f"Error in batch commit: {str(e)}")
        else:
            successful_updates = 0
            failed_updates = 0
            if not meeting_allocations:
                logging.info("No meeting allocations to commit")
            if not pending_timeslot_updates:
                logging.info("No time slot updates to commit")
        
        # Check if all sellers were allocated
        if remaining_sellers:
            logging.warning(f"Could not allocate {len(remaining_sellers)} sellers: {remaining_sellers}")
        
        # Log per-buyer time conflict summary
        logging.info(f"Time conflicts for buyer {buyer_user_id}: {number_of_meetings_not_allocated_time_conflict}")
        print(f"Time conflicts for buyer {buyer_user_id}: {number_of_meetings_not_allocated_time_conflict}")
        
        logging.info("=" * 80)
        logging.info(f"CORE SCHEDULING LOGIC COMPLETED FOR BUYER ID {buyer_id}")
        logging.info(f"Buyer: {buyer_user_id} (user_id: {buyer_user_id})")
        logging.info(f"Meetings scheduled: {len(meeting_allocations)}")
        logging.info(f"Time slots updated: {successful_updates}")
        logging.info(f"Failed updates: {failed_updates}")
        logging.info(f"Remaining unallocated sellers: {len(remaining_sellers)}")
        logging.info(f"Time conflicts for this buyer: {number_of_meetings_not_allocated_time_conflict}")
        logging.info("=" * 80)
        
        return {
            'success': True,
            'buyer_id': buyer_id,
            'buyer_user_id': buyer_user_id,
            'meetings_scheduled': len(meeting_allocations),
            'meeting_allocations': meeting_allocations,
            'time_slots_updated': successful_updates,
            'failed_updates': failed_updates,
            'remaining_unallocated_sellers': remaining_sellers,
            'starting_point_stall_id': starting_point_stall_id,
            'target_date': target_date,
            'preview_mode': preview_mode
        }
        
    except Exception as e:
        error_msg = f"Error executing core scheduling logic for buyer {buyer_id}: {str(e)}"
        logging.error(error_msg)
        return {
            'success': False,
            'error': error_msg
        }

def execute_core_scheduling_logic_first_buyer(accepted_meetings: List[Dict], 
                                             buyer_id: int,
                                             available_buyers: List[int],
                                             available_sellers: List[Dict],
                                             starting_point: str,
                                             target_date,
                                             preview_mode: bool = False,
                                             seller_distance_cache: Optional[Dict[int, Dict[str, Any]]] = None,
                                             total_number_of_meeting_not_allocated_time_conflicts: Optional[List[int]] = None) -> Dict[str, Any]:
    """
    Execute core scheduling logic for the first buyer using the buyer_id from Excel.
    
    Args:
        buyer_id: The user_id from the Excel file (not profile ID)
        accepted_meetings: List of all accepted meetings 
        available_buyers: List of user_ids from Excel file (for lookup only, not used for scheduling)
        available_sellers: List of available sellers with quota info
        starting_point: Starting point stall number (e.g., 'G1')
        target_date: Target date for scheduling
        preview_mode: If True, log operations without executing
        
    Returns:
        Dictionary with scheduling results
    """
    try:
        logging.info("=" * 80)
        logging.info(f"EXECUTING CORE SCHEDULING LOGIC FOR FIRST BUYER (ID: {buyer_id})")
        logging.info("=" * 80)
        
        # Use the buyer_id directly as user_id since it's coming from Excel
        buyer_user_id = buyer_id
        
        # Check if buyer exists in available_buyers cache (optimization check)
        buyer_found_in_cache = False
        if available_buyers and buyer_id in available_buyers:
            buyer_found_in_cache = True
            logging.info(f"Found buyer {buyer_id} in available_buyers cache")
            buyer_username = f"buyer_{buyer_user_id}"  # Use simple fallback
        else:
            logging.info(f"Buyer {buyer_id} not found in available_buyers cache, checking database")
            
            # Only get buyer profile from database if not found in cache
            buyer_profile = BuyerProfile.query.filter_by(user_id=buyer_user_id).first()
            if not buyer_profile:
                error_msg = f'Buyer ID {buyer_id} not found in buyer_profiles'
                logging.error(error_msg)
                return {
                    'success': False,
                    'error': error_msg
                }
            
        logging.info(f"Processing FIRST BUYER: (user_id: {buyer_user_id})")
        
        # Get accepted meetings where buyer_id matches, no need to check against available_buyers
        buyer_meetings = [meeting for meeting in accepted_meetings 
                         if meeting['buyer_id'] == buyer_user_id and meeting['status'] == MeetingStatus.ACCEPTED.value]
        
        if not buyer_meetings:
            logging.info(f"No accepted meetings found for buyer {buyer_username}")
            return {
                'success': True,
                'buyer_user_id': buyer_user_id,
                'buyer_username': buyer_username,
                'meetings_scheduled': 0,
                'message': 'No accepted meetings to schedule'
            }
        
        logging.info(f"Step (i): Found {len(buyer_meetings)} accepted meetings for buyer {buyer_username}")
        
        # Step (ii): Retrieve all sellers for these meetings
        seller_user_ids = list(set([meeting['seller_id'] for meeting in buyer_meetings]))
        logging.info(f"Step (ii): Found {len(seller_user_ids)} unique sellers: {seller_user_ids}")
        
        # Step (iii): Get seller stall numbers (handled within distance sorting)
        logging.info(f"Step (iii): Getting seller stall information...")
        
        # Step (iv): Get starting point stall ID and sort sellers by distance
        origin_stall_id = get_starting_point_stall_id(starting_point)
        if not origin_stall_id:
            return {
                'success': False,
                'error': f'Starting point stall {starting_point} not found'
            }
        
        logging.info(f"Step (iv): Starting point {starting_point} has stall_id={origin_stall_id}")
        
        sellers_by_distance = get_sellers_sorted_by_distance_from_origin(seller_user_ids, origin_stall_id)
        if not sellers_by_distance:
            return {
                'success': False,
                'error': 'Could not sort sellers by distance'
            }
        logging.info(f"Step (v): Allocating meetings in distance order...")
        
        # Generate buyer's time slots for target date (dynamic generation)
        buyer_time_slots = generate_buyer_time_slots_for_date(buyer_user_id, target_date)
        if not buyer_time_slots:
            return {
                'success': False,
                'error': f'No available time slots for buyer {buyer_username} on {target_date}'
            }
        
        logging.info(f"Generated {len(buyer_time_slots)} time slots for buyer {buyer_username} on {target_date}")
        
        # Process meetings in distance order
        meeting_allocations = []
        slot_index = 0
        
        for seller_info in sellers_by_distance:
            seller_user_id = seller_info['seller_user_id']
            distance = seller_info['distance']
            
            # Find all meetings between this buyer and this seller
            seller_meetings = [meeting for meeting in buyer_meetings 
                             if meeting['seller_id'] == seller_user_id]
            
            logging.info(f"Processing seller {seller_user_id} (distance={distance}): {len(seller_meetings)} meetings")
            
            # Get seller's available time slots
            seller_time_slots = get_available_time_slots_for_date(seller_user_id, target_date)
            if not seller_time_slots:
                logging.warning(f"No available time slots for seller {seller_user_id} on {target_date}")
                continue
            
            # Allocate meetings for this seller
            for meeting in seller_meetings:
                if slot_index >= len(buyer_time_slots):
                    logging.warning(f"No more time slots available for buyer {buyer_username}")
                    break
                
                buyer_slot = buyer_time_slots[slot_index]
                
                # Find matching time slot for seller (same start and end time)
                matching_seller_slot = None
                for seller_slot in seller_time_slots:
                    if (seller_slot['start_time'] == buyer_slot['start_time'] and 
                        seller_slot['end_time'] == buyer_slot['end_time']):
                        matching_seller_slot = seller_slot
                        break
                
                if matching_seller_slot:
                    allocation = {
                        'meeting_id': meeting['meeting_id'],
                        'buyer_id': buyer_user_id,  # Use buyer_id for consistency
                        'seller_id': seller_user_id,  # Use seller_id for consistency
                        'buyer_time_slot_id': buyer_slot['id'],
                        'seller_time_slot_id': matching_seller_slot['id'],
                        'start_time': buyer_slot['start_time'],
                        'end_time': buyer_slot['end_time'],
                        'distance': distance,
                        'sequence': slot_index + 1
                    }
                    meeting_allocations.append(allocation)
                    
                    logging.info(f"Allocated meeting {meeting['meeting_id']}: "
                               f"Buyer {buyer_username} ↔ Seller {seller_user_id} "
                               f"at {buyer_slot['start_time']} (distance={distance}, seq={slot_index + 1})")
                    
                    slot_index += 1
                else:
                    logging.warning(f"No matching time slot found for seller {seller_user_id} "
                                  f"at {buyer_slot['start_time']}")
        
        # Step (vi): Update meetings and time slots using batch operations
        logging.info(f"Step (vi): Updating {len(meeting_allocations)} meetings and time slots...")
        
        # Prepare batch updates
        pending_timeslot_updates = []
        for allocation in meeting_allocations:
            pending_timeslot_updates.append({
                'user_id': allocation['seller_id'],
                'time_slot_id': allocation['seller_time_slot_id'],
                'meeting_id': allocation['meeting_id']
            })
        
        # Commit all changes for first buyer
        if meeting_allocations and pending_timeslot_updates:
            logging.info(f"Committing {len(meeting_allocations)} meetings and {len(pending_timeslot_updates)} time slot updates for first buyer {buyer_username}")
            
            try:
                # Update meeting records
                meeting_result = update_meetings_batch(meeting_allocations, preview_mode)
                
                # Update time slots
                timeslot_result = mark_time_slots_unavailable_batch(pending_timeslot_updates, preview_mode)
                
                # Single commit for both operations (only if not in preview mode)
                if not preview_mode and meeting_result['success'] and timeslot_result['success']:
                    db.session.commit()
                    logging.info("Single transaction commit completed for both meetings and time slots")
                
                if meeting_result['success'] and timeslot_result['success']:
                    successful_updates = timeslot_result['updated_count']
                    failed_updates = timeslot_result['failed_count']
                    
                    logging.info(f"Batch update completed: {successful_updates} time slots updated, {len(meeting_allocations)} meetings updated")
                    
                    if timeslot_result.get('failed_updates'):
                        for failed_update in timeslot_result['failed_updates']:
                            logging.error(f"Failed to update: {failed_update}")
                    
                    if meeting_result.get('failed_updates'):
                        for failed_update in meeting_result['failed_updates']:
                            logging.error(f"Failed to update meeting: {failed_update}")
                else:
                    successful_updates = 0
                    failed_updates = len(pending_timeslot_updates)
                    if not meeting_result['success']:
                        logging.error(f"Meeting batch update failed: {meeting_result.get('error', 'Unknown error')}")
                    if not timeslot_result['success']:
                        logging.error(f"Time slot batch update failed: {timeslot_result.get('error', 'Unknown error')}")
                        
            except Exception as e:
                if not preview_mode:
                    db.session.rollback()
                    logging.error(f"Transaction rolled back due to error: {str(e)}")
                successful_updates = 0
                failed_updates = len(pending_timeslot_updates)
                logging.error(f"Error in batch commit: {str(e)}")
        else:
            successful_updates = 0
            failed_updates = 0
            if not meeting_allocations:
                logging.info("No meeting allocations to commit")
            if not pending_timeslot_updates:
                logging.info("No time slot updates to commit")
        
        logging.info("=" * 80)
        logging.info(f"CORE SCHEDULING LOGIC COMPLETED FOR FIRST BUYER")
        logging.info(f"Buyer: {buyer_username} (user_id: {buyer_user_id})")
        logging.info(f"Meetings scheduled: {len(meeting_allocations)}")
        logging.info(f"Time slots updated: {successful_updates}")
        logging.info(f"Failed updates: {failed_updates}")
        logging.info("=" * 80)
        
        return {
            'success': True,
            'buyer_user_id': buyer_user_id,
            'buyer_username': buyer_username,
            'meetings_scheduled': len(meeting_allocations),
            'meeting_allocations': meeting_allocations,
            'time_slots_updated': successful_updates,
            'failed_updates': failed_updates,
            'starting_point': starting_point,
            'target_date': target_date,
            'preview_mode': preview_mode
        }
        
    except Exception as e:
        error_msg = f"Error executing core scheduling logic for first buyer: {str(e)}"
        logging.error(error_msg)
        return {
            'success': False,
            'error': error_msg
        }
