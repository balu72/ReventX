#!/usr/bin/env python3
"""
Script to generate SQL statements for importing stall inventory data from Excel.

This script:
1. Reads the floorplan_stalls.xlsx file
2. Maps the Excel data to stall_inventory table fields
3. Generates SQL INSERT statements
4. Saves the statements to a SQL file
"""

import os
import pandas as pd
from datetime import datetime

# File paths
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
EXCEL_FILE = os.path.join(SCRIPT_DIR, "floorplan_stalls.xlsx")
SQL_OUTPUT_FILE = os.path.join(SCRIPT_DIR, f"import_stall_inventory_{datetime.now().strftime('%Y%m%d_%H%M%S')}.sql")

# Stall type mapping
STALL_TYPE_MAPPING = {
    "S": 1,   # Standard Stall
    "SC": 2,  # Standard Corner
    "P": 3,   # Premium Stall
    "PC": 4,  # Premium Corner
    "Tbl": 5  # Tablespace
}

def read_excel_data():
    """Read data from Excel file"""
    try:
        # Read only the first three columns (A, B, C)
        df = pd.read_excel(EXCEL_FILE, usecols=[0, 1, 2])
        print(f"Successfully read {len(df)} records from {EXCEL_FILE}")
        return df
    except Exception as e:
        print(f"Error reading Excel file: {e}")
        return None

def generate_sql_statements(df):
    """Generate SQL INSERT statements from DataFrame"""
    if df is None or df.empty:
        print("No data to process")
        return None
    
    # Get column names from the first row
    columns = df.columns.tolist()
    stall_name_col = columns[0]  # First column (A) - Stall Name
    type_col = columns[1]        # Second column (B) - Type
    available_col = columns[2]   # Third column (C) - Available
    
    # Start building SQL content
    sql_content = f"""-- Stall Inventory Import Script
-- Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}

BEGIN;

-- Clear existing data (commented out for safety)
-- TRUNCATE TABLE stall_inventory RESTART IDENTITY CASCADE;

-- Insert stall inventory data
INSERT INTO stall_inventory (stall_number, stall_type_id, allow_seller_selection, is_allocated, created_at, updated_at)
VALUES
"""
    
    # Process each row starting from the second row (skip header)
    values_list = []
    for _, row in df.iloc[1:].iterrows():
        stall_name = str(row[stall_name_col]).strip()
        stall_type = str(row[type_col]).strip()
        available = str(row[available_col]).strip()
        
        # Skip rows with empty stall names
        if not stall_name or pd.isna(stall_name) or stall_name == "nan":
            continue
        
        # Map stall type to stall_type_id
        stall_type_id = STALL_TYPE_MAPPING.get(stall_type)
        if stall_type_id is None:
            print(f"Warning: Unknown stall type '{stall_type}' for stall '{stall_name}'. Skipping.")
            continue
        
        # Map available to is_allocated (Y = True)
        is_allocated = "TRUE" if available == "Y" else "FALSE"
        
        # Create SQL value string
        value_str = f"('{stall_name}', {stall_type_id}, TRUE, {is_allocated}, NOW(), NOW())"
        values_list.append(value_str)
    
    # Add values to SQL content
    if values_list:
        sql_content += ",\n".join(values_list) + ";\n\nCOMMIT;\n"
        return sql_content
    else:
        print("No valid data to insert")
        return None

def save_sql_file(sql_content):
    """Save SQL content to file"""
    if sql_content:
        try:
            with open(SQL_OUTPUT_FILE, 'w') as f:
                f.write(sql_content)
            print(f"SQL file generated successfully: {SQL_OUTPUT_FILE}")
            return True
        except Exception as e:
            print(f"Error saving SQL file: {e}")
    return False

def main():
    """Main function"""
    print(f"Reading Excel file: {EXCEL_FILE}")
    df = read_excel_data()
    
    print("Generating SQL statements...")
    sql_content = generate_sql_statements(df)
    
    if sql_content:
        print(f"Saving SQL to file: {SQL_OUTPUT_FILE}")
        save_sql_file(sql_content)
    else:
        print("Failed to generate SQL content")

if __name__ == "__main__":
    main()
