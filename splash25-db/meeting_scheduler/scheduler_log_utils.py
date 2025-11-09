"""
Scheduler Logging Utilities Module

This module contains logging setup and related utility functions that can be
shared across different scheduler scripts.
"""

import logging
import sys
from datetime import datetime
from typing import Dict, Any, List, Optional

def determine_log_level(args) -> int:
    """Determine the appropriate logging level based on arguments."""
    # If verbose is specified, it overrides --logging and sets to DEBUG
    if hasattr(args, 'verbose') and args.verbose:
        return logging.DEBUG
    
    # Otherwise, use --logging parameter if available
    if hasattr(args, 'logging'):
        log_level_map = {
            'i': logging.INFO, 'info': logging.INFO, 'INFO': logging.INFO,
            'e': logging.ERROR, 'error': logging.ERROR, 'ERROR': logging.ERROR,
            'w': logging.WARNING, 'warn': logging.WARNING, 'WARN': logging.WARNING,
            'd': logging.DEBUG, 'debug': logging.DEBUG, 'DEBUG': logging.DEBUG
        }
        return log_level_map.get(args.logging, logging.INFO)
    
    # Default to INFO if no logging arguments found
    return logging.INFO

def setup_logging(args, log_file_prefix: str = "scheduler") -> str:
    """
    Setup logging configuration with file and console handlers.
    
    Args:
        args: Parsed command line arguments
        log_file_prefix: Prefix for the log file name (e.g., "automatic_slot_filler", "meeting_scheduler")
    
    Returns:
        str: The generated log filename
    """
    # Generate timestamped log filename
    timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
    log_filename = f"{log_file_prefix}_log_{timestamp}.log"
    
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

def log_execution_start(args, user_confirmed: bool, log_filename: str, script_name: str):
    """
    Log the start of execution with all parameters.
    
    Args:
        args: Parsed command line arguments
        user_confirmed: Whether user confirmed execution
        log_filename: Name of the log file
        script_name: Name of the script being executed
    """
    logging.info("=" * 60)
    logging.info(f"{script_name} Session Started")
    logging.info(f"Command: {' '.join(sys.argv)}")
    
    # Log parsed arguments (convert args to dict)
    args_dict = vars(args)
    logging.info(f"Arguments: {args_dict}")
    logging.info(f"Validation: PASSED - All arguments valid")
    logging.info(f"User Confirmation: {'YES' if user_confirmed else 'NO'} - User {'approved' if user_confirmed else 'declined'} execution")
    logging.info(f"Log file: {log_filename}")
    logging.info("=" * 60)
    
    if user_confirmed:
        logging.info("Starting operations execution...")

def display_help_and_exit(script_name: str, description: str, examples: List[str], 
                         required_args: List[Dict[str, Any]], optional_args: List[Dict[str, Any]]):
    """
    Display help information and exit when no arguments are provided.
    
    Args:
        script_name: Name of the script
        description: Description of the script
        examples: List of example commands
        required_args: List of required argument definitions
        optional_args: List of optional argument definitions
    """
    import argparse
    
    parser = argparse.ArgumentParser(
        description=description,
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=f"""
Examples:
{chr(10).join(f'  {example}' for example in examples)}

For more information, see the documentation.
        """
    )
    
    # Add required arguments
    for arg in required_args:
        parser.add_argument(arg['flags'], **arg['kwargs'])
    
    # Add optional arguments
    for arg in optional_args:
        parser.add_argument(arg['flags'], **arg['kwargs'])
    
    print(f"🚀 {script_name} - Help")
    print("=" * (len(script_name) + 10))
    print(f"\n{description}")
    parser.print_help()
    sys.exit(0)

def validate_common_arguments(args) -> List[str]:
    """
    Validate common arguments that appear in multiple scripts.
    
    Args:
        args: Parsed command line arguments
    
    Returns:
        List of validation error messages
    """
    errors = []
    
    # Validate logging level if present
    if hasattr(args, 'logging') and args.logging:
        valid_levels = ['i', 'info', 'INFO', 'e', 'error', 'ERROR', 
                       'w', 'warn', 'WARN', 'd', 'debug', 'DEBUG']
        if args.logging not in valid_levels:
            errors.append(f"Invalid logging level: {args.logging}. Valid options: {', '.join(valid_levels)}")
    
    return errors

def get_user_confirmation(message: str, default_no: bool = True) -> bool:
    """
    Get user confirmation with a custom message.
    
    Args:
        message: The confirmation message to display
        default_no: If True, default to 'No' when user just presses Enter
    
    Returns:
        bool: True if user confirmed, False otherwise
    """
    print(message, end='')
    response = input().strip().lower()
    
    if not response:  # Empty response
        return not default_no
    
    confirmed = response in ['y', 'yes']
    return confirmed

def format_operation_summary(operation_name: str, success: bool, details: Optional[Dict[str, Any]] = None) -> str:
    """
    Format a standardized operation summary message.
    
    Args:
        operation_name: Name of the operation
        success: Whether the operation was successful
        details: Optional dictionary of details to include
    
    Returns:
        Formatted summary string
    """
    if success:
        summary = f"✅ {operation_name} completed successfully!"
        if details:
            for key, value in details.items():
                summary += f"\n   • {key}: {value}"
    else:
        summary = f"❌ {operation_name} failed!"
        if details and 'error' in details:
            summary += f"\n   • Error: {details['error']}"
    
    return summary

def display_argument_summary(args, validation_errors: List[str], log_filename: str, 
                           script_name: str, operations: List[str]) -> bool:
    """
    Display summary of parsed arguments and validation results.
    
    Args:
        args: Parsed command line arguments
        validation_errors: List of validation error messages
        log_filename: Name of the log file
        script_name: Name of the script
        operations: List of operations to be executed
    
    Returns:
        bool: True if validation passed, False otherwise
    """
    print(f"🔍 {script_name} - Argument Analysis")
    print("=" * (len(script_name) + 25))
    
    # Command summary
    print(f"\n📋 Command Summary:")
    print(f"   Command: {' '.join(sys.argv)}")
    
    # Parsed arguments
    print(f"\n📊 Parsed Arguments:")
    args_dict = vars(args)
    for key, value in args_dict.items():
        if value is not None and value is not False:
            if isinstance(value, bool) and value:
                print(f"   • {key}: ✅ Enabled")
            else:
                print(f"   • {key}: {value}")
    
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
        print("   ✅ No conflicts detected")
        
        # Operations to execute
        if operations:
            print(f"\n📋 Operations to Execute:")
            for i, operation in enumerate(operations, 1):
                print(f"   {i}. {operation}")
        
        # Special modes
        if hasattr(args, 'preview') and args.preview:
            print("   • Use preview mode (no database changes)")
        if hasattr(args, 'verbose') and args.verbose:
            print("   • Use verbose logging throughout")
        
        return True

def check_slot_filler_log_files() -> Dict[str, Any]:
    """Check if automatic_slot_filler.py has been executed by looking for log files."""
    import glob
    
    log_pattern = "automatic_slot_filler_log_*.log"
    log_files = glob.glob(log_pattern)
    
    return {
        'log_files_found': len(log_files) > 0,
        'log_files': log_files,
        'count': len(log_files)
    }
