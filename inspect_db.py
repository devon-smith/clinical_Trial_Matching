import sqlite3
from pathlib import Path
from pprint import pprint

def inspect_database(db_path: str):
    """Inspect the database schema and print table information."""
    conn = sqlite3.connect(db_path)
    conn.row_factory = sqlite3.Row  # Enable column access by name
    cursor = conn.cursor()
    
    # 1. Check table structure
    print("\n=== Database Schema ===")
    cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
    tables = [t[0] for t in cursor.fetchall()]
    print("Tables in database:", ", ".join(tables))
    
    # 2. Check trials and criteria counts
    print("\n=== Record Counts ===")
    cursor.execute("SELECT COUNT(*) as count FROM trials")
    print(f"Trials: {cursor.fetchone()['count']}")
    
    cursor.execute("SELECT COUNT(*) as count FROM criteria")
    print(f"Criteria: {cursor.fetchone()['count']}")
    
    # 3. Check sample criteria
    print("\n=== Sample Criteria ===")
    cursor.execute("""
    SELECT c.*, t.title, 
           CASE WHEN c.hard_constraint IS NULL THEN 1 ELSE c.hard_constraint END as hard_constraint_fixed
    FROM criteria c
    LEFT JOIN trials t ON c.nct_id = t.nct_id
    LIMIT 5
    """)
    sample_criteria = cursor.fetchall()

    if not sample_criteria:
        print("No criteria found in the database!")
    else:
        print("\nFirst 5 criteria:")
        for i, row in enumerate(sample_criteria, 1):
            print(f"\n{i}. Trial: {row['title']} ({row['nct_id']})")
            print(f"   Type: {row['criterion_type']}")
            print(f"   Value: {row['criterion_value']}")
            print(f"   Comparison: {row['comparison']}")
            print(f"   Inclusion: {bool(row['is_inclusion'])}")
            print(f"   Hard Constraint: {bool(row['hard_constraint_fixed'])}")
    
    # 4. Check criteria distribution
    print("\n=== Criteria Distribution ===")
    cursor.execute("""
        SELECT 
            COUNT(*) as total_criteria,
            COUNT(DISTINCT nct_id) as trials_with_criteria,
            AVG(CASE WHEN is_inclusion = 1 THEN 1 ELSE 0 END) * 100 as pct_inclusion,
            AVG(CASE WHEN hard_constraint = 1 OR hard_constraint IS NULL THEN 1 ELSE 0 END) * 100 as pct_hard
        FROM criteria
    """)
    stats = cursor.fetchone()
    print(f"Total criteria: {stats['total_criteria']}")
    print(f"Trials with criteria: {stats['trials_with_criteria']}")
    print(f"Percentage inclusion criteria: {stats['pct_inclusion']:.1f}%")
    print(f"Percentage hard constraints: {stats['pct_hard']:.1f}%")
    
    # 5. Check trials without criteria
    cursor.execute("""
        SELECT t.nct_id, t.title 
        FROM trials t
        LEFT JOIN criteria c ON t.nct_id = c.nct_id
        WHERE c.nct_id IS NULL
        LIMIT 5
    """)
    no_criteria = cursor.fetchall()
    if no_criteria:
        print("\n=== Trials Without Criteria ===")
        print(f"Found {len(no_criteria)} trials without any criteria")
        for row in no_criteria[:5]:  # Show first 5
            print(f"- {row['nct_id']}: {row['title']}")
    
    conn.close()

if __name__ == "__main__":
    db_path = "trial_data.sqlite"
    if not Path(db_path).exists():
        print(f"Error: Database file '{db_path}' not found.")
        print("Please make sure to run setup_database.py --reset and load_trial_data.py first.")
    else:
        inspect_database(db_path)