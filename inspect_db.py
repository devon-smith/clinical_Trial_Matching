import sqlite3
from pathlib import Path

def inspect_database(db_path: str):
    """Inspect the database schema and print table information."""
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    
    # Get list of tables
    cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
    tables = cursor.fetchall()
    
    print("\n=== Database Schema ===")
    for table in tables:
        table_name = table[0]
        print(f"\nTable: {table_name}")
        print("-" * (len(table_name) + 8))
        
        # Get column info
        cursor.execute(f"PRAGMA table_info({table_name});")
        columns = cursor.fetchall()
        
        # Print column names and types
        for col in columns:
            print(f"  {col[1]} ({col[2]})")
    
    conn.close()

if __name__ == "__main__":
    db_path = "trial_data.sqlite"
    if not Path(db_path).exists():
        print(f"Error: Database file '{db_path}' not found.")
        print("Please make sure to run setup_database.py --reset and load_trial_data.py first.")
    else:
        inspect_database(db_path)
