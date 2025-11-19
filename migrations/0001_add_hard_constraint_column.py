"""Migration to add hard_constraint column to criteria table."""
import sqlite3
from pathlib import Path

def migrate():
    db_path = Path(__file__).parent.parent / "trial_data.sqlite"
    
    if not db_path.exists():
        print(f"Error: Database file not found at {db_path}")
        return False
    
    try:
        conn = sqlite3.connect(str(db_path))
        cursor = conn.cursor()
        
        # Check if the column already exists
        cursor.execute("PRAGMA table_info(criteria)")
        columns = [col[1] for col in cursor.fetchall()]
        
        if 'hard_constraint' not in columns:
            # Add the new column with a default of True (for backward compatibility)
            cursor.execute("""
                ALTER TABLE criteria 
                ADD COLUMN hard_constraint BOOLEAN DEFAULT 1
            """)
            conn.commit()
            print("Successfully added hard_constraint column to criteria table")
            return True
        else:
            print("hard_constraint column already exists in criteria table")
            return True
            
    except sqlite3.Error as e:
        print(f"Database error: {e}")
        return False
    finally:
        if conn:
            conn.close()

if __name__ == "__main__":
    migrate()
