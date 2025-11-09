"""
Scheduler Matching Module

This module contains the matching logic for pairing sellers with buyers
and creating meeting entries. Includes support for preview mode.
"""

import logging
import json
from datetime import datetime
from typing import Dict, List, Set, Optional, Any, Tuple
from scheduler_models import db, Meeting, MeetingStatus, SellerProfile, BuyerProfile

def normalize_interests(interests_data) -> Set[str]:
    """
    Handle both JSON array and string formats, return normalized set of interests.
    
    Args:
        interests_data: Can be JSON array, comma-separated string, or None
        
    Returns:
        Set of normalized (lowercase, stripped) interest keywords
    """
    if not interests_data:
        return set()
    
    interests = set()
    
    try:
        # Handle JSON array format (from buyer_profiles.interests)
        if isinstance(interests_data, list):
            for item in interests_data:
                if isinstance(item, str) and item.strip():
                    interests.add(item.strip().lower())
        
        # Handle string format (from seller_profiles.target_market)
        elif isinstance(interests_data, str):
            # Split by comma and normalize each item
            for item in interests_data.split(','):
                if item.strip():
                    interests.add(item.strip().lower())
        
        # Handle dict format (in case interests is stored as JSON object)
        elif isinstance(interests_data, dict):
            # If it's a dict, try to extract values or keys
            for key, value in interests_data.items():
                if isinstance(value, str) and value.strip():
                    interests.add(value.strip().lower())
                elif isinstance(key, str) and key.strip():
                    interests.add(key.strip().lower())
    
    except Exception as e:
        logging.warning(f"Error normalizing interests data '{interests_data}': {str(e)}")
        return set()
    
    logging.debug(f"Normalized interests: {interests_data} -> {interests}")
    return interests

def calculate_exact_match(seller_target_market: str, buyer_interests) -> bool:
    """
    Check for exact case-insensitive matches between seller target market and buyer interests.
    
    Args:
        seller_target_market: Comma-separated string of seller's target markets
        buyer_interests: JSON array or string of buyer's interests
        
    Returns:
        True if all seller target markets are found in buyer interests
    """
    seller_markets = normalize_interests(seller_target_market)
    buyer_interest_set = normalize_interests(buyer_interests)
    
    if not seller_markets:
        logging.debug("Seller has no target markets defined")
        return False
    
    if not buyer_interest_set:
        logging.debug("Buyer has no interests defined")
        return False
    
    # Check if all seller markets are present in buyer interests
    exact_match = seller_markets.issubset(buyer_interest_set)
    
    logging.debug(f"Exact match check: seller_markets={seller_markets}, buyer_interests={buyer_interest_set}, match={exact_match}")
    return exact_match

def calculate_partial_match_score(seller_target_market: str, buyer_interests) -> int:
    """
    Count overlapping keywords between seller target market and buyer interests.
    
    Args:
        seller_target_market: Comma-separated string of seller's target markets
        buyer_interests: JSON array or string of buyer's interests
        
    Returns:
        Number of matching keywords (0 if no matches)
    """
    seller_markets = normalize_interests(seller_target_market)
    buyer_interest_set = normalize_interests(buyer_interests)
    
    if not seller_markets or not buyer_interest_set:
        return 0
    
    # Count intersection
    matching_keywords = seller_markets.intersection(buyer_interest_set)
    match_score = len(matching_keywords)
    
    logging.debug(f"Partial match: seller_markets={seller_markets}, buyer_interests={buyer_interest_set}, "
                 f"matches={matching_keywords}, score={match_score}")
    return match_score

def find_best_buyer_match(seller_info: Dict, available_buyers: List[Dict]) -> Optional[Dict]:
    """
    Find the best matching buyer for a seller using exact then partial matching.
    
    Args:
        seller_info: Dictionary containing seller information including target_market
        available_buyers: List of available buyer dictionaries with interests
        
    Returns:
        Best matching buyer dict or None if no matches found
    """
    seller_target_market = seller_info.get('target_market', '')
    seller_name = seller_info.get('username', 'Unknown')
    
    logging.info(f"Finding best buyer match for seller: {seller_name} with target market: '{seller_target_market}'")
    
    if not seller_target_market:
        logging.warning(f"Seller {seller_name} has no target market defined")
        return None
    
    if not available_buyers:
        logging.warning(f"No available buyers to match with seller {seller_name}")
        return None
    
    # Phase 1: Look for exact matches
    exact_matches = []
    for buyer in available_buyers:
        buyer_interests = buyer.get('interests', [])
        buyer_name = buyer.get('username', 'Unknown')
        
        if calculate_exact_match(seller_target_market, buyer_interests):
            exact_matches.append(buyer)
            logging.info(f"✅ EXACT MATCH found: Seller {seller_name} <-> Buyer {buyer_name}")
    
    if exact_matches:
        # Return first exact match (could be enhanced with additional criteria)
        best_match = exact_matches[0]
        logging.info(f"Selected exact match: Seller {seller_name} <-> Buyer {best_match.get('username', 'Unknown')}")
        return best_match
    
    # Phase 2: Look for partial matches
    partial_matches = []
    for buyer in available_buyers:
        buyer_interests = buyer.get('interests', [])
        buyer_name = buyer.get('username', 'Unknown')
        
        match_score = calculate_partial_match_score(seller_target_market, buyer_interests)
        if match_score > 0:
            partial_matches.append({
                'buyer': buyer,
                'score': match_score
            })
            logging.info(f"🔶 PARTIAL MATCH found: Seller {seller_name} <-> Buyer {buyer_name} (score: {match_score})")
    
    if partial_matches:
        # Sort by score (highest first) and return the best match
        partial_matches.sort(key=lambda x: x['score'], reverse=True)
        best_match = partial_matches[0]['buyer']
        best_score = partial_matches[0]['score']
        logging.info(f"Selected best partial match: Seller {seller_name} <-> Buyer {best_match.get('username', 'Unknown')} (score: {best_score})")
        return best_match
    
    # No matches found
    logging.info(f"❌ NO MATCHES found for seller {seller_name}")
    return None

def find_exact_matches(seller_info: Dict, available_buyers: List[Dict]) -> List[Dict]:
    """
    Find all buyers with exact matches to seller's target market.
    
    Args:
        seller_info: Dictionary containing seller information including target_market
        available_buyers: List of available buyer dictionaries with interests
        
    Returns:
        List of buyer dictionaries that have exact matches
    """
    seller_target_market = seller_info.get('target_market', '')
    seller_name = seller_info.get('username', 'Unknown')
    
    if not seller_target_market:
        return []
    
    exact_matches = []
    for buyer in available_buyers:
        buyer_interests = buyer.get('interests', [])
        buyer_name = buyer.get('username', 'Unknown')
        
        if calculate_exact_match(seller_target_market, buyer_interests):
            exact_matches.append(buyer)
            logging.debug(f"✅ EXACT MATCH: Seller {seller_name} <-> Buyer {buyer_name}")
    
    logging.info(f"Found {len(exact_matches)} exact matches for seller {seller_name}")
    return exact_matches

def find_partial_matches_sorted(seller_info: Dict, available_buyers: List[Dict]) -> List[Dict]:
    """
    Find all buyers with partial matches, sorted by score (highest first).
    
    Args:
        seller_info: Dictionary containing seller information including target_market
        available_buyers: List of available buyer dictionaries with interests
        
    Returns:
        List of buyer dictionaries sorted by match score (descending)
    """
    seller_target_market = seller_info.get('target_market', '')
    seller_name = seller_info.get('username', 'Unknown')
    
    if not seller_target_market:
        return []
    
    partial_matches = []
    for buyer in available_buyers:
        buyer_interests = buyer.get('interests', [])
        buyer_name = buyer.get('username', 'Unknown')
        
        match_score = calculate_partial_match_score(seller_target_market, buyer_interests)
        if match_score > 0:
            # Add score to buyer dict for sorting
            buyer_with_score = buyer.copy()
            buyer_with_score['match_score'] = match_score
            partial_matches.append(buyer_with_score)
            logging.debug(f"🔶 PARTIAL MATCH: Seller {seller_name} <-> Buyer {buyer_name} (score: {match_score})")
    
    # Sort by score (highest first)
    partial_matches.sort(key=lambda x: x['match_score'], reverse=True)
    
    logging.info(f"Found {len(partial_matches)} partial matches for seller {seller_name}")
    return partial_matches

def update_buyer_slots(buyer: Dict, available_buyers: List[Dict]) -> bool:
    """
    Update buyer's remaining slots and remove from available list if slots reach 0.
    
    Args:
        buyer: Buyer dictionary to update
        available_buyers: List to potentially remove buyer from
        
    Returns:
        True if buyer still has slots available, False if removed
    """
    buyer['remaining_slots'] -= 1
    buyer_name = buyer.get('username', 'Unknown')
    
    logging.info(f"Buyer {buyer_name}: remaining slots reduced to {buyer['remaining_slots']}")
    
    if buyer['remaining_slots'] <= 0:
        if buyer in available_buyers:
            available_buyers.remove(buyer)
        logging.info(f"🚫 Buyer {buyer_name} removed from available pool (no remaining slots)")
        return False
    
    return True

def create_meeting_entry(buyer_id: int, seller_id: int, preview_mode: bool = False) -> Dict[str, Any]:
    """
    Create a meeting entry or log SQL in preview mode.
    Includes duplicate check to prevent creating meetings that already exist.
    
    Args:
        buyer_id: ID of the buyer
        seller_id: ID of the seller  
        preview_mode: If True, only log SQL without executing
    
    Returns:
        dict: {'success': bool, 'message': str, 'meeting_id': int or None}
    """
    try:
        # Check if meeting already exists between this buyer and seller
        existing_meeting = Meeting.query.filter_by(
            buyer_id=buyer_id, 
            seller_id=seller_id
        ).first()
        
        if existing_meeting:
            # Check if existing meeting is ACCEPTED or PENDING
            if existing_meeting.status in [MeetingStatus.ACCEPTED, MeetingStatus.PENDING]:
                warning_msg = f'Active meeting already exists between buyer {buyer_id} and seller {seller_id} (Meeting ID: {existing_meeting.id}, Status: {existing_meeting.status.value})'
                logging.warning(warning_msg)
                return {
                    'success': False,
                    'message': warning_msg,
                    'meeting_id': existing_meeting.id,
                    'duplicate_found': True,
                    'existing_status': existing_meeting.status.value
                }
            else:
                # Meeting exists but is not ACCEPTED or PENDING (e.g., CANCELLED, REJECTED)
                # Update the existing meeting status to ACCEPTED
                old_status = existing_meeting.status.value
                existing_meeting.status = MeetingStatus.ACCEPTED
                existing_meeting.created_at = datetime.utcnow()  # Update timestamp
                
                if not preview_mode:
                    db.session.commit()
                    logging.info(f"NORMAL MODE: Updated existing meeting ID {existing_meeting.id} from {old_status} to ACCEPTED between buyer {buyer_id} and seller {seller_id}")
                else:
                    update_sql = (
                        f"UPDATE meetings SET status = 'ACCEPTED', created_at = '{datetime.utcnow().isoformat()}' "
                        f"WHERE id = {existing_meeting.id}"
                    )
                    logging.info(f"PREVIEW MODE: Would update existing meeting: {update_sql}")
                
                return {
                    'success': True,
                    'message': f'Updated existing meeting from {old_status} to ACCEPTED between buyer {buyer_id} and seller {seller_id}',
                    'meeting_id': existing_meeting.id,
                    'updated_existing': True,
                    'previous_status': old_status,
                    'sql_preview': update_sql if preview_mode else None
                }
        
        current_time = datetime.utcnow()
        
        if preview_mode:
            # Generate SQL statements for preview (including duplicate check)
            check_sql = (
                f"SELECT id FROM meetings WHERE buyer_id = {buyer_id} AND seller_id = {seller_id} LIMIT 1"
            )
            insert_sql = (
                f"INSERT INTO meetings (buyer_id, seller_id, status, created_at) "
                f"VALUES ({buyer_id}, {seller_id}, 'ACCEPTED', '{current_time.isoformat()}')"
            )
            
            logging.info(f"PREVIEW MODE: Would check for duplicates: {check_sql}")
            logging.info(f"PREVIEW MODE: Would execute SQL: {insert_sql}")
            
            return {
                'success': True,
                'message': f'Preview mode: Meeting would be created between buyer {buyer_id} and seller {seller_id} (no duplicates found)',
                'meeting_id': None,
                'sql_preview': insert_sql,
                'duplicate_check_sql': check_sql
            }
        else:
            # Create actual meeting entry
            new_meeting = Meeting()
            new_meeting.buyer_id = buyer_id
            new_meeting.seller_id = seller_id
            new_meeting.status = MeetingStatus.ACCEPTED
            new_meeting.created_at = current_time
            
            db.session.add(new_meeting)
            db.session.commit()
            
            logging.info(f"NORMAL MODE: Successfully created meeting ID {new_meeting.id} between buyer {buyer_id} and seller {seller_id}")
            
            return {
                'success': True,
                'message': f'Meeting created successfully between buyer {buyer_id} and seller {seller_id}',
                'meeting_id': new_meeting.id
            }
            
    except Exception as e:
        error_msg = f"Error creating meeting between buyer {buyer_id} and seller {seller_id}: {str(e)}"
        logging.error(error_msg)
        
        if not preview_mode:
            db.session.rollback()
        
        return {
            'success': False,
            'message': error_msg,
            'meeting_id': None
        }
