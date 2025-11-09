# Accommodation Allocation Script

This Python script parses an Excel file containing accommodation data and allocates accommodations to buyers using the Splash25 backend API endpoint.

## Features

- **Excel File Parsing**: Reads accommodation data from Excel files with proper field mapping
- **Authentication**: Handles admin login and JWT token management
- **Field Mapping**: Maps Excel columns to database fields for multiple tables
- **Data Validation**: Validates all required fields before API calls
- **Preview Mode**: Test the script without making actual database changes
- **Comprehensive Logging**: Detailed logs with timestamps and progress tracking
- **Error Handling**: Robust error handling with detailed error messages
- **Progress Tracking**: Shows processing progress and final summary

## Requirements

- Python 3.7+
- Required packages (install with `pip install -r requirements.txt`):
  - pandas>=1.5.0
  - requests>=2.28.0
  - openpyxl>=3.0.0
  - python-dotenv>=1.0.0

## Installation

1. Install Python dependencies:
```bash
pip install -r requirements.txt
```

2. Set up environment variables (optional):
```bash
# Copy the example environment file
cp .env.example .env

# Edit .env with your actual credentials
nano .env
```

3. Ensure the Excel file is accessible and has the correct format.

## Excel File Format

The script expects an Excel file with a sheet named "Master" containing the following columns:

### Required Columns:
- **Buyer User ID**: The user ID from the users table
- **Name**: Buyer name (for logging)
- **Host Property Id**: ID of the host property
- **Travel Plan id**: ID of the travel plan
- **Room Type**: Room type (Single/Double/Triple)
- **Arrival date/time**: Arrival date and time

### Optional Columns:
- **WTO**: WTO identification number (for logging)
- **Arr Special request**: Special accommodation requests

## Field Mappings

The script maps Excel columns to database fields as follows:

### 1. Users Table
- `Buyer User ID` → `users.id`

### 2. Buyer Profiles Table
- `Buyer User ID` → `buyer_profiles.user_id`
- `Name` → `buyer_profiles.name`

### 3. Host Properties Table
- `Host Property Id` → `host_properties.property_id`

### 4. Travel Plans Table
- `Travel Plan id` → `travel_plans.id`
- `Buyer User ID` → `travel_plans.user_id`

### 5. Accommodations Table (New Entries)
- `Travel Plan id` → `accommodations.travel_plan_id`
- `Buyer User ID` → `accommodations.buyer_id`
- `Arrival date/time` → `accommodations.check_in_datetime` (with +2 hours)
- `Room Type` → `accommodations.room_type` (Single→single, Double→shared, Triple→shared)
- `Arr Special request` → `accommodations.special_notes`
- Fixed: `check_out_datetime` = "2025-07-14T10:00:00"

## Usage

### Using Command Line Arguments
```bash
python accommodation_allocation_script.py "Hotel Accommodation 0907.xlsx" --admin-user admin_user --admin-password admin_password
```

### Using Environment Variables (.env file)
```bash
# Set up .env file with credentials
echo "ADMIN_USER=your_admin_username" > .env
echo "ADMIN_PASSWORD=your_admin_password" >> .env
echo "BASE_URL=http://localhost:5000" >> .env

# Run script using .env credentials
python accommodation_allocation_script.py "Hotel Accommodation 0907.xlsx"
```

### Preview Mode (No Database Changes)
```bash
python accommodation_allocation_script.py "Hotel Accommodation 0907.xlsx" --preview
```

### Custom Backend URL
```bash
python accommodation_allocation_script.py "Hotel Accommodation 0907.xlsx" --base-url http://api.splash25.com
```

### Custom Log File
```bash
python accommodation_allocation_script.py "Hotel Accommodation 0907.xlsx" --log-file custom_log.log
```

### Mixed Usage (Command Line + Environment Variables)
```bash
# Use .env for credentials, override base URL via command line
python accommodation_allocation_script.py "Hotel Accommodation 0907.xlsx" --base-url http://production.api.com
```

## Command Line Arguments

### Required Arguments:
- `excel_file`: Path to the Excel file
- `admin_user`: Admin username for authentication
- `admin_password`: Admin password for authentication

### Optional Arguments:
- `--base-url`: Base URL of the backend API (default: http://localhost:5000)
- `--preview`: Preview mode - no actual API calls, just validation and logging
- `--log-file`: Custom log file path (default: accommodation_allocation_YYYYMMDD_HHMMSS.log)

## API Endpoint

The script calls the following backend endpoint:
```
POST /api/admin/buyers/{buyer_id}/allocate-accommodation
```

### Payload Structure:
```json
{
    "host_property_id": 123,
    "room_type": "single",
    "check_in_datetime": "2025-06-25T17:00:00",
    "check_out_datetime": "2025-07-14T10:00:00",
    "special_notes": "Special requests"
}
```

## Data Processing Logic

1. **Authentication**: Login with admin credentials and store JWT token
2. **Excel Loading**: Load Excel file and validate required columns
3. **Row Processing**: For each row:
   - Extract and validate data for each table
   - Convert room types (Single→single, Double→shared)
   - Add 2 hours to arrival time for check-in
   - Set fixed checkout time (2025-07-14T10:00:00)
   - Build API payload
   - Make API call (unless in preview mode)
4. **Logging**: Log all operations with detailed information
5. **Summary**: Generate final processing summary

## Logging

The script creates detailed logs including:
- Processing start/end times
- Row-by-row processing status
- API call results
- Error messages with context
- Final summary statistics

Log files are created with timestamp: `accommodation_allocation_YYYYMMDD_HHMMSS.log`

## Error Handling

The script handles various error scenarios:
- Missing or invalid Excel files
- Missing required columns
- Invalid data formats
- Authentication failures
- API call failures
- Network connectivity issues

## Preview Mode

Use `--preview` flag to:
- Validate Excel file structure
- Test data processing logic
- Check field mappings
- Verify authentication (skipped in preview)
- Generate logs without making API calls

## Exit Codes

- `0`: Success (all rows processed successfully)
- `1`: Failure (one or more rows failed or script error)

## Example Output

```
============================================================
ACCOMMODATION ALLOCATION SUMMARY
============================================================
Total rows in Excel file: 150
Rows processed: 150
Successful allocations: 145
Failed allocations: 3
Skipped rows: 2
Preview mode: No

Failed rows:
  - Buyer ID 123: API error: Buyer already has accommodation allocated
  - Buyer ID 456: Host properties validation: Host Property ID is required
  - Buyer ID 789: API error: Host property with ID 999 not found

Skipped rows:
  - Empty Buyer ID
  - Empty Buyer ID
============================================================
```

## Troubleshooting

### Common Issues:

1. **Authentication Failed**
   - Verify admin username and password
   - Check backend URL is correct
   - Ensure backend is running

2. **Excel File Errors**
   - Verify file path is correct
   - Ensure sheet named "Master" exists
   - Check all required columns are present

3. **API Errors**
   - Check buyer IDs exist in database
   - Verify host property IDs are valid
   - Ensure travel plans exist for buyers

4. **Data Format Errors**
   - Check date/time formats in Excel
   - Verify room types are "Single" or "Double"
   - Ensure numeric fields contain valid numbers

### Debug Mode:
Add debug logging by modifying the script to set logging level to DEBUG:
```python
logging.basicConfig(level=logging.DEBUG, ...)
```

## Support

For issues or questions:
1. Check the log file for detailed error messages
2. Use preview mode to test without making changes
3. Verify Excel file format matches requirements
4. Test with a small subset of data first
