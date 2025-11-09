#!/usr/bin/env python3
"""
Database Schema Export Script for Splash25

This script:
1. Connects to the postgres database splash25_core_db
2. Exports the entire DB schema only (no data)
3. Ensures objects are altered only if they exist
4. Ensures types/enums are dropped only if they exist
5. Saves the SQL file under /web/splash25/splash25/splash25-db/new-init-scripts
"""

import os
import sys
import subprocess
import datetime

# Configuration variables
DB_USER = "splash25user"
DB_PASSWORD = "splash25password"
DB_HOST = "localhost"
DB_PORT = "5432"
DB_NAME = "splash25_core_db"
OUTPUT_DIR = "/web/splash25/splash25/splash25-db/new-init-scripts"
OUTPUT_FILE = f"schema_export_{datetime.datetime.now().strftime('%Y%m%d_%H%M%S')}.sql"
OUTPUT_PATH = os.path.join(OUTPUT_DIR, OUTPUT_FILE)

# Ensure output directory exists
os.makedirs(OUTPUT_DIR, exist_ok=True)

# Build the pg_dump command
# --schema-only: Only dump the schema, no data
# --if-exists: Add IF EXISTS to DROP commands
# --clean: Clean (drop) database objects before recreating
# --no-owner: Don't output commands to set ownership of objects
# --no-privileges: Don't include privileges (GRANT/REVOKE)
pg_dump_cmd = [
    "pg_dump",
    "--host", DB_HOST,
    "--port", DB_PORT,
    "--username", DB_USER,
    "--dbname", DB_NAME,
    "--schema-only",
    "--if-exists",
    "--clean",
    "--no-owner",
    "--no-privileges"
]

# Set PGPASSWORD environment variable to avoid password prompt
os.environ["PGPASSWORD"] = DB_PASSWORD

try:
    # Execute pg_dump and redirect output to file
    with open(OUTPUT_PATH, 'w') as f:
        # Add header comment to the SQL file
        f.write("-- Schema export from splash25_core_db\n")
        f.write(f"-- Generated on {datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
        f.write("-- This script contains only schema definitions (no data)\n")
        f.write("-- Objects are altered only if they exist\n")
        f.write("-- Types and enums are dropped only if they exist\n\n")
        
        # Execute pg_dump and write output to file
        process = subprocess.Popen(pg_dump_cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        stdout, stderr = process.communicate()
        
        if process.returncode != 0:
            print(f"Error executing pg_dump: {stderr.decode()}")
            sys.exit(1)
        
        # Write pg_dump output to file
        f.write(stdout.decode())
        
        # Add custom handling for types and enums
        f.write("\n-- Ensure types and enums are dropped only if they exist\n")
        f.write("DO $$\n")
        f.write("DECLARE\n")
        f.write("    type_rec RECORD;\n")
        f.write("BEGIN\n")
        f.write("    FOR type_rec IN SELECT typname FROM pg_type WHERE typtype = 'e' LOOP\n")
        f.write("        EXECUTE format('DROP TYPE IF EXISTS %I CASCADE', type_rec.typname);\n")
        f.write("    END LOOP;\n")
        f.write("END$$;\n")
    
    print(f"Schema export completed successfully. Output saved to: {OUTPUT_PATH}")
    
except Exception as e:
    print(f"Error: {e}")
    sys.exit(1)
