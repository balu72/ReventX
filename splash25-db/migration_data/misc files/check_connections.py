#!/usr/bin/env python3
import psycopg2

# Configuration variables
DB_USER = "splash25user"
DB_PASSWORD = "splash25password"
DB_HOST = "localhost"
DB_PORT = "5432"
DB_NAME = "splash25_migration_test_db"

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
    
    # Query active connections
    cursor.execute("""
        SELECT pid, usename, application_name, client_addr, backend_start, state, query 
        FROM pg_stat_activity 
        WHERE datname = %s
    """, (DB_NAME,))
    
    rows = cursor.fetchall()
    
    print(f"Found {len(rows)} active connections to {DB_NAME}:")
    for row in rows:
        print(f"PID: {row[0]}, User: {row[1]}, App: {row[2]}, State: {row[5]}")
        print(f"Query: {row[6]}")
        print("-" * 80)
    
    # Close the connection
    cursor.close()
    conn.close()
    
except Exception as e:
    print(f"Error: {e}")
