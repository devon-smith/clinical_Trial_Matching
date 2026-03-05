"""Migration to add trial_locations table for real facility coordinates."""
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

        # Check if table already exists
        cursor.execute(
            "SELECT name FROM sqlite_master WHERE type='table' AND name='trial_locations'"
        )
        if cursor.fetchone():
            print("trial_locations table already exists")
            return True

        cursor.execute("""
            CREATE TABLE trial_locations (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                nct_id TEXT NOT NULL,
                facility_name TEXT,
                city TEXT,
                state TEXT,
                country TEXT,
                zip TEXT,
                latitude REAL,
                longitude REAL,
                FOREIGN KEY(nct_id) REFERENCES trials(nct_id)
            )
        """)
        cursor.execute(
            "CREATE INDEX idx_trial_locations_nct ON trial_locations(nct_id)"
        )
        conn.commit()
        print("Successfully created trial_locations table")
        return True

    except sqlite3.Error as e:
        print(f"Database error: {e}")
        return False
    finally:
        if conn:
            conn.close()


if __name__ == "__main__":
    migrate()
