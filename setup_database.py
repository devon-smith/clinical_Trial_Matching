import argparse
import sqlite3
from pathlib import Path
from typing import Iterable

DB_PATH = Path(__file__).with_name("trial_data.sqlite")


def ensure_column(cursor: sqlite3.Cursor, table: str, column: str, definition: str) -> None:
    """Add a column to a table if it does not already exist."""
    cursor.execute(f"PRAGMA table_info({table})")
    existing = {row[1] for row in cursor.fetchall()}
    if column not in existing:
        cursor.execute(f"ALTER TABLE {table} ADD COLUMN {definition}")


def drop_tables(cursor: sqlite3.Cursor, tables: Iterable[str]) -> None:
    """Drop tables if they already exist."""
    for table in tables:
        cursor.execute(f"DROP TABLE IF EXISTS {table}")


def create_core_tables(cursor: sqlite3.Cursor) -> None:
    """Create the base TrialDB schema with support for the SIGIR dataset."""
    cursor.execute(
        """
        CREATE TABLE IF NOT EXISTS trials (
            nct_id TEXT PRIMARY KEY,
            title TEXT,
            phase TEXT,
            status TEXT,
            enrollment INTEGER,
            brief_summary TEXT,
            drugs TEXT,
            diseases TEXT,
            metadata_json TEXT
        )
        """
    )

    cursor.execute(
        """
        CREATE TABLE IF NOT EXISTS criteria (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nct_id TEXT NOT NULL,
            criterion_type TEXT NOT NULL,
            criterion_value TEXT,
            value_type TEXT DEFAULT 'string',
            comparison TEXT DEFAULT 'equals',
            source TEXT,
            is_inclusion BOOLEAN NOT NULL,
            FOREIGN KEY(nct_id) REFERENCES trials(nct_id)
        )
        """
    )

    cursor.execute(
        """
        CREATE TABLE IF NOT EXISTS trial_characteristics (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nct_id TEXT NOT NULL,
            characteristic_key TEXT NOT NULL,
            characteristic_value TEXT,
            value_type TEXT,
            confidence REAL,
            source TEXT,
            FOREIGN KEY(nct_id) REFERENCES trials(nct_id)
        )
        """
    )

    cursor.execute(
        """
        CREATE TABLE IF NOT EXISTS patients (
            patient_id TEXT PRIMARY KEY,
            note TEXT,
            dataset_path TEXT,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
        """
    )

    cursor.execute(
        """
        CREATE TABLE IF NOT EXISTS patient_attributes (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            patient_id TEXT NOT NULL,
            attribute_name TEXT NOT NULL,
            value TEXT,
            value_type TEXT,
            extracted_value INTEGER,
            start_time REAL,
            end_time REAL,
            template TEXT,
            concept_id TEXT,
            fact_id TEXT,
            source TEXT,
            FOREIGN KEY(patient_id) REFERENCES patients(patient_id)
        )
        """
    )

    cursor.execute(
        """
        CREATE TABLE IF NOT EXISTS patient_trial_rankings (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            patient_id TEXT NOT NULL,
            nct_id TEXT NOT NULL,
            rank INTEGER,
            dataset_path TEXT,
            metrics_json TEXT,
            UNIQUE(patient_id, nct_id),
            FOREIGN KEY(patient_id) REFERENCES patients(patient_id),
            FOREIGN KEY(nct_id) REFERENCES trials(nct_id)
        )
        """
    )


def add_missing_columns(cursor: sqlite3.Cursor) -> None:
    """Ensure backwards-compatible upgrades when the tables already exist."""
    ensure_column(cursor, "trials", "enrollment", "INTEGER")
    ensure_column(cursor, "trials", "brief_summary", "TEXT")
    ensure_column(cursor, "trials", "drugs", "TEXT")
    ensure_column(cursor, "trials", "diseases", "TEXT")
    ensure_column(cursor, "trials", "metadata_json", "TEXT")

    ensure_column(cursor, "criteria", "value_type", "TEXT DEFAULT 'string'")
    ensure_column(cursor, "criteria", "comparison", "TEXT DEFAULT 'equals'")
    ensure_column(cursor, "criteria", "source", "TEXT")

    ensure_column(cursor, "trial_characteristics", "value_type", "TEXT")
    ensure_column(cursor, "trial_characteristics", "confidence", "REAL")
    ensure_column(cursor, "trial_characteristics", "source", "TEXT")


def setup_database(reset: bool = False, db_path: Path = DB_PATH) -> None:
    """Create or upgrade the TrialDB schema."""
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    cursor.execute("PRAGMA foreign_keys = ON;")

    if reset:
        drop_tables(
            cursor,
            [
                "patient_trial_rankings",
                "patient_attributes",
                "patients",
                "trial_characteristics",
                "criteria",
                "trials",
            ],
        )

    create_core_tables(cursor)
    add_missing_columns(cursor)

    conn.commit()
    conn.close()
    print(f"Database ready at {db_path}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Initialize the TrialDB schema.")
    parser.add_argument(
        "--reset",
        action="store_true",
        help="Drop existing tables before creating them (destructive).",
    )
    parser.add_argument(
        "--db",
        type=Path,
        default=DB_PATH,
        help="Path to the SQLite database file.",
    )
    args = parser.parse_args()
    setup_database(reset=args.reset, db_path=args.db)
