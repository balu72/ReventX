#!/usr/bin/env python3
import psycopg2

# Configuration variables
DB_USER = "splash25user"
DB_PASSWORD = "splash25password"
DB_HOST = "localhost"
DB_PORT = "5432"
DB_NAME = "splash25_migration_test_db"

try:
    # First connect to postgres database to terminate connections to our target database
    conn = psycopg2.connect(
        user=DB_USER,
        password=DB_PASSWORD,
        host=DB_HOST,
        port=DB_PORT,
        database="postgres"  # Connect to postgres database
    )
    conn.autocommit = True  # Set autocommit to True
    cursor = conn.cursor()
    
    # Query active connections to our target database
    cursor.execute("""
        SELECT pid, usename, application_name, client_addr, state, query 
        FROM pg_stat_activity 
        WHERE datname = %s AND pid <> pg_backend_pid()
    """, (DB_NAME,))
    
    rows = cursor.fetchall()
    
    print(f"Found {len(rows)} active connections to {DB_NAME}:")
    for row in rows:
        pid = row[0]
        print(f"Terminating connection: PID: {pid}, User: {row[1]}, App: {row[2]}, State: {row[4]}")
        
        # Terminate the connection
        cursor.execute("SELECT pg_terminate_backend(%s)", (pid,))
    
    print("All connections terminated.")
    
    # Close the connection
    cursor.close()
    conn.close()
    
except Exception as e:
    print(f"Error: {e}")
