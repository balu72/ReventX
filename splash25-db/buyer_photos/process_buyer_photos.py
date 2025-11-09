#!/usr/bin/env python3
"""
Buyer Photo Processing Script

This script processes the buyer Excel file to:
1. Create a new Excel file with comments column
2. Validate each buyer against the database
3. Check for profile photos in NextCloud
4. Upload photos to correct directory structure
5. Update buyer_profiles table with image paths

Author: Generated for Splash25 Project
Date: 2025-01-08
"""

import os
import sys
import pandas as pd
import psycopg2
from datetime import datetime
from dotenv import load_dotenv
from nc_py_api import Nextcloud
import logging
import time
import re

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('buyer_photo_processing.log'),
        logging.StreamHandler(sys.stdout)
    ]
)
logger = logging.getLogger(__name__)

class BuyerPhotoProcessor:
    def __init__(self):
        """Initialize the processor with database and NextCloud connections."""
        self.db_connection = None
        self.nc_client = None
        self.input_file = "All_buyers_unique_id_mapping_PROD.xlsx"
        self.output_file = "All_buyers_unique_id_mapping_PROD_comments.xlsx"
        
        # Load environment variables
        load_dotenv()
        
        # Database configuration (as specified)
        self.db_config = {
            'host': 'localhost',
            'port': '5555',
            'database': 'muddyboo_splash25_core_db',
            'user': 'muddyboo_splash25user',
            'password': 'splash25password'
        }
        
        # NextCloud configuration from .env
        self.nc_config = {
            'url': os.getenv('EXTERNAL_STORAGE_URL', 'https://mbcloud.muddyboots.in/MBCloud/'),
            'user': os.getenv('EXTERNAL_STORAGE_USER', 'splash25'),
            'password': os.getenv('EXTERNAL_STORAGE_PASSWORD', 'splash25@123$')
        }
        
        logger.info("BuyerPhotoProcessor initialized")

    def connect_database(self):
        """Connect to the PostgreSQL database."""
        try:
            logger.info("Connecting to database...")
            self.db_connection = psycopg2.connect(
                host=self.db_config['host'],
                port=self.db_config['port'],
                database=self.db_config['database'],
                user=self.db_config['user'],
                password=self.db_config['password']
            )
            logger.info("Database connection successful")
            return True
        except Exception as e:
            logger.error(f"Database connection failed: {str(e)}")
            return False

    def connect_nextcloud(self):
        """Connect to NextCloud."""
        try:
            logger.info("Connecting to NextCloud...")
            self.nc_client = Nextcloud(
                nextcloud_url=self.nc_config['url'],
                nc_auth_user=self.nc_config['user'],
                nc_auth_pass=self.nc_config['password']
            )
            # Test connection (simple test that doesn't require admin privileges)
            try:
                # Try to list files in root directory - this should work with regular user
                self.nc_client.files.listdir("/")
                logger.info("NextCloud connection successful")
                return True
            except Exception as file_error:
                # If we can't list root, try a simple API call that doesn't need admin
                self.nc_client.users.get_current_user()
                logger.info("NextCloud connection successful (limited file access)")
                return True
        except Exception as e:
            logger.error(f"NextCloud connection failed: {str(e)}")
            return False

    def load_excel_file(self):
        """Load the input Excel file and create output file with comments column."""
        try:
            logger.info(f"Loading Excel file: {self.input_file}")
            
            if not os.path.exists(self.input_file):
                logger.error(f"Input file not found: {self.input_file}")
                return None
            
            # Read the Excel file
            df = pd.read_excel(self.input_file)
            
            # Verify required columns exist
            required_columns = ['WTO Number', 'Username', 'User ID', 'Unique ID']
            missing_columns = [col for col in required_columns if col not in df.columns]
            
            if missing_columns:
                logger.error(f"Missing required columns: {missing_columns}")
                return None
            
            # Add comments column
            df['Comments'] = ''
            
            logger.info(f"Excel file loaded successfully. Found {len(df)} rows")
            return df
            
        except Exception as e:
            logger.error(f"Error loading Excel file: {str(e)}")
            return None

    def check_user_in_database(self, user_id, username):
        """Check if user exists in database and validate username."""
        try:
            if self.db_connection is None:
                logger.error("Database connection is None")
                return False
            
            # Trim and validate input values
            if pd.isna(user_id) or pd.isna(username):
                logger.warning(f"Invalid data: user_id={user_id}, username={username}")
                return False
            
            # Convert and trim values
            try:
                trimmed_user_id = int(str(user_id).strip())
                excel_username_stripped = str(username).strip()
            except (ValueError, TypeError) as e:
                logger.warning(f"Data conversion error: user_id={user_id}, username={username}, error={e}")
                return False
                
            cursor = self.db_connection.cursor()
            # Modified query to select username and id by user_id only
            query = "SELECT username, id FROM users WHERE id = %s"
            cursor.execute(query, (trimmed_user_id,))
            result = cursor.fetchone()
            
            if result:
                db_username, db_id = result
                # Compare usernames with only leading/trailing whitespace removal
                db_username_stripped = db_username.strip()
                
                # Since all values are lowercase, direct comparison
                username_match = excel_username_stripped == db_username_stripped
                cursor.close()
                
                if not username_match:
                    # Log warning for username mismatch
                    logger.warning(f"User ID {user_id} found but username mismatch: Excel='{excel_username_stripped}' vs DB='{db_username_stripped}'")
                    return "username_mismatch"  # Return special indicator
                
                return True  # User found and username matches
            else:
                cursor.close()
                return False  # User not found
                
        except Exception as e:
            logger.error(f"Database query error for user {user_id}/{username}: {str(e)}")
            return False

    def check_profile_image_pattern(self, user_id, profile_image):
        """Check if profile_image is already in the correct directory structure."""
        try:
            if profile_image is None:
                return False
            
            # Check if it starts with the correct path and ends with .jpg
            expected_prefix = f"/Photos/buyer_{user_id}/profile/"
            expected_suffix = ".jpg"
            
            return profile_image.startswith(expected_prefix) and profile_image.endswith(expected_suffix)
            
        except Exception as e:
            logger.error(f"Error checking profile image pattern for user {user_id}: {str(e)}")
            return False

    def check_buyer_profile_exists(self, user_id):
        """Check if buyer profile exists for the given user_id and return profile_image value."""
        try:
            if self.db_connection is None:
                logger.error("Database connection is None")
                return False, None
            
            # Trim and validate input values
            if pd.isna(user_id):
                logger.warning(f"Invalid user_id: {user_id}")
                return False, None
            
            # Convert and trim values
            try:
                trimmed_user_id = int(str(user_id).strip())
            except (ValueError, TypeError) as e:
                logger.warning(f"Data conversion error for user_id: {user_id}, error={e}")
                return False, None
                
            cursor = self.db_connection.cursor()
            query = "SELECT profile_image FROM buyer_profiles WHERE user_id = %s"
            cursor.execute(query, (trimmed_user_id,))
            result = cursor.fetchone()
            cursor.close()
            
            if result is not None:
                return True, result[0]  # Return exists=True and profile_image value
            else:
                return False, None  # Return exists=False and None
                
        except Exception as e:
            logger.error(f"Database query error for buyer profile user_id {user_id}: {str(e)}")
            return False, None

    def check_file_in_nextcloud(self, unique_id):
        """Check if file exists in NextCloud with multiple extensions."""
        try:
            if self.nc_client is None:
                logger.error("NextCloud client is None")
                return False, f"{unique_id}.jpg", ".jpg"
                
            dirpath = "/Photos/buyer"
            
            # Check for common image extensions
            extensions = ['.jpg', '.jpeg', '.png', '.gif', '.bmp']
            
            for ext in extensions:
                filename = f"{unique_id}{ext}"
                # Use nc.files.find with correct syntax
                results = self.nc_client.files.find(["eq", "name", filename], path=dirpath)
                
                if len(results) > 0:
                    return True, filename, ext
            
            # If no file found with any extension, return default
            return False, f"{unique_id}.jpg", ".jpg"
            
        except Exception as e:
            logger.error(f"NextCloud file search error for {unique_id}: {str(e)}")
            return False, f"{unique_id}.jpg", ".jpg"

    def ensure_directory_exists(self, user_id):
        """Ensure the directory structure exists for the buyer."""
        try:
            if self.nc_client is None:
                logger.error("NextCloud client is None")
                return False
            
            # Check and create /Photos/buyer_{user_id}
            buyer_dir = f"/Photos/buyer_{user_id}"
            try:
                self.nc_client.files.listdir(buyer_dir)
                logger.info(f"Directory exists: {buyer_dir}")
            except Exception:
                # Directory doesn't exist, create it
                try:
                    self.nc_client.files.mkdir(buyer_dir)
                    logger.info(f"Created directory: {buyer_dir}")
                except Exception as e:
                    logger.error(f"Failed to create directory {buyer_dir} for user {user_id}: {str(e)}")
                    return False
            
            # Check and create /Photos/buyer_{user_id}/profile
            profile_dir = f"/Photos/buyer_{user_id}/profile"
            try:
                self.nc_client.files.listdir(profile_dir)
                logger.info(f"Directory exists: {profile_dir}")
            except Exception:
                # Directory doesn't exist, create it
                try:
                    self.nc_client.files.mkdir(profile_dir)
                    logger.info(f"Created directory: {profile_dir}")
                except Exception as e:
                    logger.error(f"Failed to create directory {profile_dir} for user {user_id}: {str(e)}")
                    return False
            
            return True
            
        except Exception as e:
            logger.error(f"Error ensuring directory exists for user {user_id}: {str(e)}")
            return False

    def upload_buyer_photo(self, source_file, destination_file, user_id, filename):
        """Upload buyer photo to the correct location."""
        try:
            if self.nc_client is None:
                logger.error("NextCloud client is None")
                return False
            
            logger.info(f"Copying file for user {user_id}: {source_file} → {destination_file}")
            # Use copy instead of move due to permissions restrictions
            self.nc_client.files.copy(source_file, destination_file, overwrite=True)
            logger.info(f"Successfully copied photo for user {user_id} to {destination_file}")
            return True
            
        except Exception as e:
            logger.error(f"Failed to copy photo for user {user_id}: {str(e)}")
            return False

    def update_buyer_profile_image(self, user_id, destination_file):
        """Update buyer profile image in database with retry logic."""
        for attempt in range(3):
            try:
                if self.db_connection is None:
                    logger.error("Database connection is None")
                    return False
                
                cursor = self.db_connection.cursor()
                query = "UPDATE buyer_profiles SET profile_image = %s WHERE user_id = %s"
                cursor.execute(query, (destination_file, user_id))
                self.db_connection.commit()
                cursor.close()
                
                logger.info(f"Successfully updated buyer_profiles for user {user_id} with image path: {destination_file}")
                return True
                
            except Exception as e:
                if attempt < 2:  # Not last attempt
                    logger.warning(f"Database update attempt {attempt + 1} failed for user {user_id}: {str(e)}. Retrying...")
                    time.sleep(0.1)  # 100ms timeout
                    continue
                else:
                    logger.error(f"Database update failed for user {user_id} after 3 attempts: {str(e)}")
                    return False
        
        return False

    def process_row(self, row_index, row_data):
        """Process a single row of data."""
        try:
            wto_number = row_data['WTO Number']
            username = row_data['Username']
            user_id = row_data['User ID']
            unique_id = row_data['Unique ID']
            
            logger.info(f"Processing {wto_number} - User ID: {user_id}, Username: {username}")
            
            comments = []  # List to accumulate comments
            
            # Step 1: Check user in database
            user_check_result = self.check_user_in_database(user_id, username)
            
            if user_check_result == False:
                comments.append("User / Buyer Not Found")
                logger.info(f"  → User not found in database")
                # Stop processing - no user found
            else:
                # User found (either exact match or username mismatch)
                if user_check_result == "username_mismatch":
                    comments.append("User id found in users table, user name does not match")
                    logger.info(f"  → User found but username mismatch")
                else:
                    logger.info(f"  → User found in database")
                
                # Step 2: Check buyer profile (continue regardless of username mismatch)
                buyer_profile_exists, profile_image_value = self.check_buyer_profile_exists(user_id)
                
                if not buyer_profile_exists:
                    comments.append("User found but buyer profile not found")
                    logger.info(f"  → Buyer profile not found for user_id: {user_id}")
                    # Stop processing - no buyer profile
                else:
                    logger.info(f"  → Buyer profile found for user_id: {user_id}")
                    
                    # Step 2A: Check profile_image value and decide whether to process
                    if profile_image_value is None:
                        # Profile image is NULL - proceed with upload
                        logger.info(f"  → Profile image is NULL, proceeding with upload")
                        should_process = True
                        processing_reason = "Profile image NULL, processing upload"
                    else:
                        # Profile image has a value - check if it matches expected pattern
                        if self.check_profile_image_pattern(user_id, profile_image_value):
                            # Profile image already correctly set - skip this buyer
                            logger.info(f"  → Profile image already correctly set: {profile_image_value}, skipping")
                            comments.append("Profile image already correctly set, skipping")
                            should_process = False
                        else:
                            # Profile image has incorrect format - proceed with upload
                            logger.info(f"  → Profile image has incorrect format: {profile_image_value}, proceeding with upload")
                            should_process = True
                            processing_reason = "Profile image incorrect format, processing upload"
                    
                    if should_process:
                        # Step 3: Check file in NextCloud (proceed regardless of username mismatch)
                        file_exists, filename, file_extension = self.check_file_in_nextcloud(unique_id)
                        
                        if file_exists:
                            logger.info(f"  → File found: {filename}")
                            
                            # Step 4: Ensure directory structure exists
                            if not self.ensure_directory_exists(user_id):
                                comments.append(f"{processing_reason} | File found: {filename} | Directory creation failed")
                                logger.error(f"  → Directory creation failed for user {user_id}")
                            else:
                                # Step 5: Upload file
                                source_file = f"/Photos/buyer/{filename}"
                                destination_file = f"/Photos/buyer_{user_id}/profile/buyer_{user_id}{file_extension}"
                                
                                if self.upload_buyer_photo(source_file, destination_file, user_id, filename):
                                    # Step 6: Update database
                                    if self.update_buyer_profile_image(user_id, destination_file):
                                        comments.append(f"{processing_reason} | File found: {filename} | Upload successful to {destination_file} | Database updated")
                                        logger.info(f"  → Upload and database update successful for user {user_id}")
                                    else:
                                        comments.append(f"{processing_reason} | File found: {filename} | Upload successful to {destination_file} | Database update failed")
                                        logger.error(f"  → Database update failed for user {user_id}")
                                else:
                                    comments.append(f"{processing_reason} | File found: {filename} | Upload failed")
                                    logger.error(f"  → Upload failed for user {user_id}")
                        else:
                            comments.append(f"{processing_reason} | File not found")
                            logger.info(f"  → File not found: {filename}")
            
            # Join all comments with separator
            return " | ".join(comments)
            
        except Exception as e:
            logger.error(f"Error processing row {row_index}: {str(e)}")
            return f"Error processing row: {str(e)}"

    def process_all_rows(self, df):
        """Process all rows in the DataFrame."""
        total_rows = len(df)
        logger.info(f"Starting to process {total_rows} rows")
        
        for index, row in df.iterrows():
            # Show progress
            progress = ((index + 1) / total_rows) * 100
            print(f"Processing row {index + 1}/{total_rows} ({progress:.1f}%)")
            
            # Process the row
            comment = self.process_row(index, row)
            df.at[index, 'Comments'] = comment
        
        logger.info("All rows processed successfully")
        return df

    def save_excel_file(self, df):
        """Save the processed DataFrame to Excel file."""
        try:
            logger.info(f"Saving results to: {self.output_file}")
            df.to_excel(self.output_file, index=False)
            logger.info("Excel file saved successfully")
            return True
        except Exception as e:
            logger.error(f"Error saving Excel file: {str(e)}")
            return False

    def generate_summary(self, df):
        """Generate processing summary."""
        total_rows = len(df)
        user_not_found = len(df[df['Comments'] == 'User / Buyer Not Found'])
        username_mismatch = len(df[df['Comments'].str.contains('user name does not match', na=False)])
        buyer_profile_not_found = len(df[df['Comments'].str.contains('buyer profile not found', na=False)])
        
        # New profile image checks
        buyers_skipped_correct_image = len(df[df['Comments'] == 'Profile image already correctly set, skipping'])
        buyers_null_profile_image = len(df[df['Comments'].str.contains('Profile image NULL, processing upload', na=False)])
        buyers_incorrect_profile_image = len(df[df['Comments'].str.contains('Profile image incorrect format, processing upload', na=False)])
        
        file_found = len(df[df['Comments'].str.contains('File found:', na=False)])
        file_not_found = len(df[df['Comments'].str.contains('File not found', na=False)])
        upload_successful = len(df[df['Comments'].str.contains('Upload successful', na=False)])
        database_updated = len(df[df['Comments'].str.contains('Database updated', na=False)])
        directory_creation_failed = len(df[df['Comments'].str.contains('Directory creation failed', na=False)])
        upload_failed = len(df[df['Comments'].str.contains('Upload failed', na=False)])
        database_update_failed = len(df[df['Comments'].str.contains('Database update failed', na=False)])
        errors = len(df[df['Comments'].str.contains('Error processing', na=False)])
        
        summary = f"""
=== PROCESSING SUMMARY ===
Total rows processed: {total_rows}
Users not found in database: {user_not_found}
Users found but username mismatch: {username_mismatch}
Users found but buyer profiles missing: {buyer_profile_not_found}

Profile Image Analysis:
- Buyers skipped (correct profile image): {buyers_skipped_correct_image}
- Buyers processed (NULL profile image): {buyers_null_profile_image}
- Buyers processed (incorrect profile image): {buyers_incorrect_profile_image}

File Processing:
- Files found in NextCloud: {file_found}
- Files not found: {file_not_found}
- Directory creation failed: {directory_creation_failed}
- Upload successful: {upload_successful}
- Upload failed: {upload_failed}
- Database updated: {database_updated}
- Database update failed: {database_update_failed}
- Processing errors: {errors}
        """
        
        logger.info(summary)
        print(summary)

    def cleanup(self):
        """Clean up connections."""
        if self.db_connection:
            self.db_connection.close()
            logger.info("Database connection closed")

    def run(self):
        """Main execution method."""
        try:
            logger.info("=== Starting Buyer Photo Processing ===")
            
            # Step 1: Connect to database
            if not self.connect_database():
                logger.error("Failed to connect to database. Stopping.")
                return False
            
            # Step 2: Connect to NextCloud
            if not self.connect_nextcloud():
                logger.error("Failed to connect to NextCloud. Stopping.")
                return False
            
            # Step 3: Load Excel file
            df = self.load_excel_file()
            if df is None:
                logger.error("Failed to load Excel file. Stopping.")
                return False
            
            # Step 4: Process all rows
            processed_df = self.process_all_rows(df)
            
            # Step 5: Save results
            if not self.save_excel_file(processed_df):
                logger.error("Failed to save Excel file.")
                return False
            
            # Step 6: Generate summary
            self.generate_summary(processed_df)
            
            logger.info("=== Processing completed successfully ===")
            return True
            
        except Exception as e:
            logger.error(f"Unexpected error during processing: {str(e)}")
            return False
        finally:
            self.cleanup()


def main():
    """Main function."""
    processor = BuyerPhotoProcessor()
    success = processor.run()
    
    if success:
        print("\n✅ Processing completed successfully!")
        print(f"📄 Output file: {processor.output_file}")
        print(f"📋 Log file: buyer_photo_processing.log")
    else:
        print("\n❌ Processing failed. Check the log file for details.")
        sys.exit(1)


if __name__ == "__main__":
    main()
