"""
Scheduler Utilities Module

This module contains pure utility functions used by the meeting scheduler.
Focuses on date/time parsing, calculations, and other non-database operations.
"""

import json
import logging
from datetime import datetime, timedelta, time, date, timezone
from typing import Dict, List, Tuple, Optional, Any

def parse_date_from_iso(iso_date_string: str) -> Tuple[date, str]:
    """Parse ISO date string, convert to IST, and return date object and DD/MM/YYYY format."""
    try:
        # Parse the ISO datetime string
        if iso_date_string.endswith('Z'):
            # UTC timezone
            dt = datetime.fromisoformat(iso_date_string.replace('Z', '+00:00'))
        elif '+' in iso_date_string or iso_date_string.count('-') > 2:
            # Already has timezone info
            dt = datetime.fromisoformat(iso_date_string)
        else:
            # Assume UTC if no timezone info
            dt = datetime.fromisoformat(iso_date_string).replace(tzinfo=timezone.utc)
        
        # Convert to IST (UTC+5:30)
        ist_timezone = timezone(timedelta(hours=5, minutes=30))
        ist_dt = dt.astimezone(ist_timezone)
        
        # Extract date part
        parsed_date = ist_dt.date()
        
        # Format as DD/MM/YYYY
        formatted_date = parsed_date.strftime('%d/%m/%Y')
        
        return parsed_date, formatted_date
        
    except (ValueError, TypeError) as e:
        raise Exception(f"Invalid date format '{iso_date_string}': {str(e)}")

def parse_time_from_string(time_string: str) -> time:
    """Parse time string to time object with HH:MM:SS format."""
    try:
        if 'AM' in time_string.upper() or 'PM' in time_string.upper():
            clean_time = time_string.strip().upper()
            time_obj = datetime.strptime(clean_time, '%I:%M %p').time()
        else:
            if ':' in time_string:
                parts = time_string.split(':')
                if len(parts) == 2:
                    time_obj = datetime.strptime(time_string, '%H:%M').time()
                elif len(parts) == 3:
                    time_obj = datetime.strptime(time_string, '%H:%M:%S').time()
                else:
                    raise ValueError("Invalid time format")
            else:
                raise ValueError("Invalid time format")
                
        return time_obj
        
    except (ValueError, TypeError) as e:
        raise Exception(f"Invalid time format '{time_string}': {str(e)}")

def parse_meeting_breaks(breaks_json: str) -> List[Dict[str, time]]:
    """Parse meeting breaks JSON and extract start/end times."""
    try:
        breaks_data = json.loads(breaks_json)
        
        if not isinstance(breaks_data, list):
            logging.warning("Meeting breaks is not a list, treating as empty")
            return []
            
        parsed_breaks = []
        
        for break_item in breaks_data:
            if not isinstance(break_item, dict):
                continue
                
            start_time_str = break_item.get('startTime')
            end_time_str = break_item.get('endTime')
            
            if start_time_str and end_time_str:
                try:
                    start_time = parse_time_from_string(start_time_str)
                    end_time = parse_time_from_string(end_time_str)
                    
                    parsed_breaks.append({
                        'start_time': start_time,
                        'end_time': end_time,
                        'label': break_item.get('label', 'Break')
                    })
                    
                except Exception as e:
                    logging.warning(f"Failed to parse break time '{start_time_str}' - '{end_time_str}': {str(e)}")
                    continue
        
        logging.info(f"Parsed {len(parsed_breaks)} meeting breaks")
        return parsed_breaks
        
    except (json.JSONDecodeError, TypeError) as e:
        logging.warning(f"Failed to parse meeting breaks JSON: {str(e)}")
        return []


def create_datetime_from_date_time(date_obj: date, time_obj: time) -> datetime:
    """Combine date and time objects into datetime object."""
    return datetime.combine(date_obj, time_obj)

def add_minutes_to_time(time_obj: time, minutes: int) -> time:
    """Add minutes to a time object."""
    dummy_date = date.today()
    dt = datetime.combine(dummy_date, time_obj)
    dt += timedelta(minutes=minutes)
    return dt.time()

def time_overlaps_with_breaks(start_time: time, end_time: time, breaks: List[Dict[str, time]]) -> bool:
    """Check if a time slot overlaps with any meeting breaks."""
    for break_period in breaks:
        break_start = break_period['start_time']
        break_end = break_period['end_time']
        
        if start_time < break_end and end_time > break_start:
            logging.debug(f"Time slot {start_time}-{end_time} overlaps with break {break_start}-{break_end}")
            return True
    
    return False

def normalize_datetime(dt):
    """
    Normalize datetime by removing microseconds and ensuring consistent format.
    This ensures datetime comparisons work correctly between generated and database times.
    
    Args:
        dt: datetime object or None
        
    Returns:
        datetime object with microseconds set to 0, or None if input is None
    """
    if dt is None:
        return None
    return dt.replace(microsecond=0)

def validate_excel_columns(df, required_columns: List[str]) -> Dict[str, Any]:
    """Validate that required Excel columns exist."""
    available_columns = df.columns.tolist()
    missing_columns = []
    
    for col in required_columns:
        if col not in available_columns:
            missing_columns.append(col)
    
    return {
        'success': len(missing_columns) == 0,
        'missing_columns': missing_columns,
        'available_columns': available_columns,
        'required_columns': required_columns
    }

def map_excel_columns(df, column_mapping: Dict[str, str]) -> Any:
    """Map Excel column names to internal field names."""
    # Create a copy to avoid modifying original
    mapped_df = df.copy()
    
    # Rename columns based on mapping
    rename_dict = {}
    for excel_col, internal_field in column_mapping.items():
        if excel_col in mapped_df.columns:
            rename_dict[excel_col] = internal_field
    
    mapped_df = mapped_df.rename(columns=rename_dict)
    
    logging.info("Excel column mapping applied:")
    for excel_col, internal_field in rename_dict.items():
        logging.info(f"  '{excel_col}' → {internal_field}")
    
    return mapped_df

def validate_buyer_ids_in_dataframe(df) -> Dict[str, Any]:
    """Validate user IDs in DataFrame and return validation results."""
    if 'user_id' not in df.columns:
        return {
            'success': False,
            'error': 'user_id column not found in mapped data',
            'valid_buyers': [],
            'invalid_buyers': [],
            'total_buyers': 0
        }
    
    user_ids = df['user_id'].dropna().unique()
    valid_buyers = []
    invalid_buyers = []
    
    for user_id in user_ids:
        try:
            user_id_int = int(user_id)
            valid_buyers.append(user_id_int)
        except (ValueError, TypeError):
            invalid_buyers.append(user_id)
    
    return {
        'success': len(invalid_buyers) == 0,
        'valid_buyers': valid_buyers,
        'invalid_buyers': invalid_buyers,
        'total_buyers': len(user_ids),
        'buyer_ids_list': valid_buyers
    }

def get_prerequisite_confirmation_message(log_files_found: bool, log_files: List[str]) -> str:
    """Generate prerequisite confirmation message based on log file detection."""
    if log_files_found:
        latest_log = max(log_files) if log_files else "unknown"
        return f"""
🔍 Checking Prerequisites...
✅ Found {len(log_files)} automatic_slot_filler log file(s).
   Latest: {latest_log}

However, please confirm that you have successfully run automatic_slot_filler.py
to populate time slots before proceeding with meeting scheduling.

Have you run automatic_slot_filler.py and populated time slots? (y/N): """
    else:
        return f"""
🔍 Checking Prerequisites...
⚠️  No automatic_slot_filler log files found in current directory.
⚠️  This script requires that automatic_slot_filler.py has been executed first.

The automatic_slot_filler.py script must be run to populate time slots
before meetings can be scheduled from Excel files.

Have you already run automatic_slot_filler.py to populate time slots? (y/N): """

def get_operation_confirmation_message(input_file: str, preview_mode: bool) -> str:
    """Generate operation confirmation message."""
    if preview_mode:
        return f"""
📋 Ready to process Excel file: {input_file}
⚠️  This will validate and process meeting data from the Excel file.
🔍 PREVIEW MODE: No database changes will be made - operations will be logged only.

Do you want to proceed with PREVIEW mode (no database changes)? (y/N): """
    else:
        return f"""
📋 Ready to process Excel file: {input_file}
⚠️  This will schedule meetings based on the Excel data.
⚠️  Database changes will be made to create meeting records.

Do you want to proceed with these operations? (y/N): """

def format_validation_errors(validation_result: Dict[str, Any]) -> str:
    """Format validation errors for display."""
    if validation_result['success']:
        return ""
    
    error_msg = "❌ Excel file validation failed:\n"
    
    if 'missing_columns' in validation_result and validation_result['missing_columns']:
        error_msg += f"   • Missing required columns: {', '.join(validation_result['missing_columns'])}\n"
        error_msg += f"   • Available columns: {', '.join(validation_result['available_columns'])}\n"
    
    if 'invalid_buyers' in validation_result and validation_result['invalid_buyers']:
        error_msg += f"   • Invalid buyer IDs: {', '.join(map(str, validation_result['invalid_buyers']))}\n"
    
    if 'error' in validation_result:
        error_msg += f"   • {validation_result['error']}\n"
    
    return error_msg

def format_processing_summary(results: Dict[str, Any]) -> str:
    """Format processing results summary for display."""
    if not results.get('success', False):
        return f"❌ Processing failed: {results.get('error', 'Unknown error')}"
    
    summary = "✅ Excel file processing completed successfully!\n"
    
    if 'rows_processed' in results:
        summary += f"   • Rows processed: {results['rows_processed']}\n"
    
    if 'valid_buyers' in results:
        summary += f"   • Valid buyer IDs: {results['valid_buyers']}\n"
    
    if 'meetings_created' in results:
        summary += f"   • Meetings created: {results['meetings_created']}\n"
    
    if 'preview_mode' in results and results['preview_mode']:
        summary += "   🔍 PREVIEW MODE: No actual database changes made\n"
    
    return summary

def validate_and_parse_date(date_string: str, system_settings: Dict[str, Any]) -> Tuple[date, str]:
    """
    Validate and parse date string with event date range validation.
    
    Args:
        date_string: Date in supported formats (DD/MM/YYYY, DD/MM/YY, DD-MM-YYYY, DD-MM-YY, YYYYMMDD)
        system_settings: System settings containing event_start_date and event_end_date
    
    Returns:
        Tuple of (date_object, "DD/MM/YYYY" formatted string)
    
    Raises:
        ValueError: If date format is invalid or date is outside event range
    """
    
    # Step 1: Parse the input date string
    formats_to_try = [
        ('%d/%m/%Y', 'DD/MM/YYYY'),    # 15/01/2025
        ('%d/%m/%y', 'DD/MM/YY'),      # 15/01/25  
        ('%d-%m-%Y', 'DD-MM-YYYY'),    # 15-01-2025
        ('%d-%m-%y', 'DD-MM-YY'),      # 15-01-25
        ('%Y%m%d', 'YYYYMMDD'),        # 20250115
    ]
    
    parsed_date = None
    for format_str, format_name in formats_to_try:
        try:
            parsed_date = datetime.strptime(date_string, format_str).date()
            break
        except ValueError:
            continue
    
    if parsed_date is None:
        raise ValueError(f"Invalid date format '{date_string}'. Supported formats: DD/MM/YYYY, DD/MM/YY, DD-MM-YYYY, DD-MM-YY, YYYYMMDD")
    
    # Step 2: Parse event start and end dates from system settings (convert to IST)
    try:
        event_start_date, _ = parse_date_from_iso(system_settings['event_start_date'])
        event_end_date, _ = parse_date_from_iso(system_settings['event_end_date'])
    except Exception as e:
        raise ValueError(f"Error parsing event dates from system settings: {str(e)}")
    
    # Step 3: Validate date is within event range
    if parsed_date < event_start_date:
        raise ValueError(f"Date {parsed_date.strftime('%d/%m/%Y')} is before event start date {event_start_date.strftime('%d/%m/%Y')}")
    
    if parsed_date > event_end_date:
        raise ValueError(f"Date {parsed_date.strftime('%d/%m/%Y')} is after event end date {event_end_date.strftime('%d/%m/%Y')}")
    
    # Step 4: Return validated date and formatted string
    formatted_date = parsed_date.strftime('%d/%m/%Y')
    logging.info(f"Date validation successful: {date_string} → {formatted_date} (within event range {event_start_date.strftime('%d/%m/%Y')} to {event_end_date.strftime('%d/%m/%Y')})")
    return parsed_date, formatted_date

def get_operation_confirmation_message_with_date(input_file: str, target_date: str, preview_mode: bool) -> str:
    """Generate operation confirmation message with date information."""
    event_info = f"Target Date: {target_date}"
    
    if preview_mode:
        return f"""
📋 Ready to process Excel file: {input_file}
📅 {event_info}
⚠️  This will validate and process meeting data for the specified date.
🔍 PREVIEW MODE: No database changes will be made - operations will be logged only.

Do you want to proceed with PREVIEW mode (no database changes)? (y/N): """
    else:
        return f"""
📋 Ready to process Excel file: {input_file}
📅 {event_info}
⚠️  This will schedule meetings for the specified date only.
⚠️  Database changes will be made to create meeting records.

Do you want to proceed with these operations? (y/N): """
