# Buyer Photo Processing Script

This script processes the buyer Excel file to validate users against the database and check for profile photos in NextCloud.

## Prerequisites

1. **Python Environment**: Ensure you're in the virtual environment with required packages installed
2. **Database**: PostgreSQL database `muddyboo_splash25_core_db` running on `localhost:5555`
3. **NextCloud**: Access to NextCloud instance with credentials in `.env` file
4. **Excel File**: `All_buyers_unique_id_mapping_PROD.xlsx` in the same directory

## Required Packages

All packages are listed in `requirements.txt`:
- psycopg2-binary>=2.9.5
- pandas>=1.5.0
- openpyxl>=3.0.10
- python-dotenv>=0.20.0
- nc-py-api>=0.20.2

## Configuration

The script uses the following configuration:

### Database Connection
- Host: localhost
- Port: 5555
- Database: muddyboo_splash25_core_db
- User: muddyboo_splash25user
- Password: splash25password

### NextCloud Configuration (from .env file)
- EXTERNAL_STORAGE_URL=https://mbcloud.muddyboots.in/MBCloud/
- EXTERNAL_STORAGE_USER=splash25
- EXTERNAL_STORAGE_PASSWORD=splash25@123$

## Usage

1. **Navigate to the script directory:**
   ```bash
   cd /web/splash25/splash25/splash25-db/migration_data/splash25-migration-files/
   ```

2. **Ensure virtual environment is activated:**
   ```bash
   source bin/activate  # or activate the virtual environment
   ```

3. **Run the script:**
   ```bash
   python process_buyer_photos.py
   ```

## What the Script Does

1. **Connects to Database**: Validates connection to PostgreSQL database
2. **Connects to NextCloud**: Validates connection to NextCloud instance
3. **Loads Excel File**: Reads `All_buyers_unique_id_mapping_PROD.xlsx`
4. **Processes Each Row**: For each of the 449 buyers:
   - Checks if user exists in database (users table: id + username)
   - If user found, searches for `{Unique_ID}.jpg` in `/Photos/buyer` directory
   - Updates comments column with results
5. **Saves Results**: Creates `All_buyers_unique_id_mapping_PROD_comments.xlsx`
6. **Generates Summary**: Shows processing statistics

## Output File

The script creates `All_buyers_unique_id_mapping_PROD_comments.xlsx` with these columns:
- WTO Number
- Username  
- User ID
- Unique ID
- **Comments** (new column)

## Comment Types

The Comments column will contain one of:
- `"User / Buyer Not Found"` - User doesn't exist in database
- `"File found: {UUID}.jpg. Final upload path will be '/Photos/buyer_{User_ID}/profile/buyer_{User_ID}_timestamp.jpg'"` - Both user and file exist
- `"User found but file not found"` - User exists but no photo file

## Progress Tracking

The script shows real-time progress:
```
Processing row 1/449 (0.2%)
Processing row 2/449 (0.4%)
...
```

## Logging

The script creates a detailed log file: `buyer_photo_processing.log`

## Error Handling

- **Database connection failure**: Script stops immediately
- **NextCloud connection failure**: Script stops immediately  
- **Individual row errors**: Logged but processing continues
- **File not found**: Handled gracefully

## Example Output

```
=== PROCESSING SUMMARY ===
Total rows processed: 449
Users not found in database: 25
Files found in NextCloud: 380
Users found but files missing: 44
Processing errors: 0
=========================
```

## Troubleshooting

1. **Database Connection Issues**:
   - Verify PostgreSQL is running on localhost:5555
   - Check database name and credentials
   - Ensure users table exists with id and username columns

2. **NextCloud Connection Issues**:
   - Verify .env file has correct NextCloud credentials
   - Test NextCloud URL accessibility
   - Check network connectivity

3. **Excel File Issues**:
   - Ensure `All_buyers_unique_id_mapping_PROD.xlsx` exists in current directory
   - Verify file has required columns: WTO Number, Username, User ID, Unique ID

4. **Permission Issues**:
   - Ensure script has read/write permissions in current directory
   - Check virtual environment activation

## Files Created

After successful execution:
- `All_buyers_unique_id_mapping_PROD_comments.xlsx` - Main output file
- `buyer_photo_processing.log` - Detailed processing log
