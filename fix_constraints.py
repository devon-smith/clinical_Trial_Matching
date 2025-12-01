import sqlite3

def update_hard_constraints():
    """Update the database to mark inclusion criteria as hard constraints."""
    conn = sqlite3.connect('trial_data.sqlite')
    cursor = conn.cursor()
    
    # Count before update
    cursor.execute("SELECT COUNT(*) FROM criteria WHERE hard_constraint = 1")
    before = cursor.fetchone()[0]
    
    # Update inclusion criteria to be hard constraints
    cursor.execute("""
        UPDATE criteria 
        SET hard_constraint = 1 
        WHERE is_inclusion = 1 AND (hard_constraint = 0 OR hard_constraint IS NULL)
    """)
    
    # Count after update
    cursor.execute("SELECT COUNT(*) FROM criteria WHERE hard_constraint = 1")
    after = cursor.fetchone()[0]
    
    conn.commit()
    conn.close()
    
    print(f"Updated {after - before} criteria to be hard constraints")
    print(f"Total hard constraints: {after}")

if __name__ == "__main__":
    update_hard_constraints()