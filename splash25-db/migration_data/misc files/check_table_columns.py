#!/usr/bin/env python3
import psycopg2

# Configuration variables
DB_USER = "splash25user"
DB_PASSWORD = "splash25password"
DB_HOST = "localhost"
DB_PORT = "5432"
DB_NAME = "splash25_migration_test_db"
TABLE_NAME = "buyer_demographic"

try:
    # Connect to the database
    conn = psycopg2.connect(
        user=DB_USER,
        password=DB_PASSWORD,
        host=DB_HOST,
        port=DB_PORT,
        database=DB_NAME
    )
    cursor = conn.cursor()
    
    # Query table columns
    cursor.execute(f"""
        SELECT column_name 
        FROM information_schema.columns 
        WHERE table_name = '{TABLE_NAME}' 
        ORDER BY ordinal_position
    """)
    
    columns = [row[0] for row in cursor.fetchall()]
    
    print(f"Columns in {TABLE_NAME} table:")
    for col in columns:
        print(f"- {col}")
    
    # Close the connection
    cursor.close()
    conn.close()
    
except Exception as e:
    print(f"Error: {e}")
