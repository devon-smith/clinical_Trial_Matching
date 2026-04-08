"""
Refresh the trial database: update statuses and pull new trials.
Designed to be idempotent and cron-friendly.

Usage:
    python refresh_trials.py                  # Full refresh (statuses + new trials)
    python refresh_trials.py --status-only    # Only update statuses
    python refresh_trials.py --new-only       # Only pull new trials
    python refresh_trials.py --dry-run        # Show what would happen

Cron example (daily at 3am):
    0 3 * * * cd /path/to/project && /path/to/venv/bin/python refresh_trials.py >> /var/log/trial_refresh.log 2>&1
"""

from __future__ import annotations

import argparse
import logging
import sqlite3
import time
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Dict, List, Optional

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s  %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S",
)
log = logging.getLogger(__name__)

DB_PATH = Path(__file__).with_name("trial_data.sqlite")

# Import shared infrastructure from ingest_clinicaltrials
from ingest_clinicaltrials import (
    DEFAULT_CONDITIONS,
    PAGE_SIZE,
    REQUEST_DELAY,
    _api_get,
    _parse_study,
    _ensure_schema as _ensure_ingest_schema,
    upsert_trial,
    fetch_studies,
    _safe_get,
)


# ---------------------------------------------------------------------------
# Schema — add last_updated column
# ---------------------------------------------------------------------------

def _ensure_refresh_schema(conn: sqlite3.Connection) -> None:
    """Ensure the last_updated column and refresh metadata table exist."""
    _ensure_ingest_schema(conn)

    cursor = conn.cursor()

    # Add last_updated to trials if not present
    existing = {row[1] for row in cursor.execute("PRAGMA table_info(trials)").fetchall()}
    if "last_updated" not in existing:
        cursor.execute("ALTER TABLE trials ADD COLUMN last_updated TEXT")
        log.info("Added last_updated column to trials table")

    # Metadata table for tracking refresh runs
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS refresh_log (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            run_at TEXT NOT NULL,
            statuses_checked INTEGER DEFAULT 0,
            statuses_changed INTEGER DEFAULT 0,
            new_trials_added INTEGER DEFAULT 0,
            duration_seconds REAL DEFAULT 0,
            notes TEXT
        )
    """)

    conn.commit()


# ---------------------------------------------------------------------------
# Status refresh
# ---------------------------------------------------------------------------

def refresh_statuses(conn: sqlite3.Connection, dry_run: bool = False) -> Dict[str, int]:
    """Check current status of all API-sourced trials via the API."""
    cursor = conn.cursor()

    # Collect trials from both the legacy trials table and ct_gov_trials
    trials: Dict[str, str] = {}
    ct_gov_ncts: set = set()

    cursor.execute(
        "SELECT nct_id, status FROM trials WHERE source = 'ctgov_api'"
    )
    for row in cursor.fetchall():
        trials[row[0]] = row[1]

    try:
        cursor.execute("SELECT nct_id, status FROM ct_gov_trials")
        for row in cursor.fetchall():
            trials[row[0]] = row[1]
            ct_gov_ncts.add(row[0])
    except Exception:
        pass  # table may not exist

    if not trials:
        log.info("No API-sourced trials to refresh.")
        return {"checked": 0, "changed": 0, "changes": []}

    nct_ids = list(trials.keys())
    checked = 0
    changed = 0
    changes: List[Dict[str, str]] = []
    now = datetime.now(timezone.utc).isoformat()

    log.info("Checking statuses for %d trials...", len(nct_ids))

    for i in range(0, len(nct_ids), PAGE_SIZE):
        batch = nct_ids[i:i + PAGE_SIZE]
        nct_filter = " OR ".join(f"AREA[NCTId]{nid}" for nid in batch)

        try:
            data = _api_get({"query.term": nct_filter, "pageSize": PAGE_SIZE})
        except Exception as exc:
            log.warning("Batch %d-%d error: %s", i, i + len(batch), exc)
            continue

        for study in data.get("studies", []):
            proto = study.get("protocolSection", {})
            nct = _safe_get(proto, "identificationModule", "nctId")
            new_status = _safe_get(proto, "statusModule", "overallStatus")

            if not nct or not new_status:
                continue

            checked += 1
            old_status = trials.get(nct)

            if old_status != new_status:
                changes.append({
                    "nct_id": nct,
                    "old_status": old_status or "unknown",
                    "new_status": new_status,
                })
                if not dry_run:
                    # Update in whichever table the trial lives
                    if nct in ct_gov_ncts:
                        cursor.execute(
                            "UPDATE ct_gov_trials SET status = ?, last_updated = ? WHERE nct_id = ?",
                            (new_status, now, nct),
                        )
                    else:
                        cursor.execute(
                            "UPDATE trials SET status = ?, last_updated = ? WHERE nct_id = ?",
                            (new_status, now, nct),
                        )
                changed += 1

        # Update last_updated for all checked trials (even if status unchanged)
        if not dry_run:
            for nid in batch:
                if nid in ct_gov_ncts:
                    cursor.execute(
                        "UPDATE ct_gov_trials SET last_updated = ? WHERE nct_id = ? AND last_updated IS NULL",
                        (now, nid),
                    )
                else:
                    cursor.execute(
                        "UPDATE trials SET last_updated = ? WHERE nct_id = ? AND last_updated IS NULL",
                        (now, nid),
                    )

        log.info("  Checked %d/%d...", min(i + len(batch), len(nct_ids)), len(nct_ids))
        time.sleep(REQUEST_DELAY)

    if not dry_run:
        conn.commit()

    return {"checked": checked, "changed": changed, "changes": changes}


# ---------------------------------------------------------------------------
# New trial ingestion
# ---------------------------------------------------------------------------

def pull_new_trials(
    conn: sqlite3.Connection,
    conditions: List[str],
    max_per_condition: int = 100,
    dry_run: bool = False,
) -> Dict[str, int]:
    """Pull new recruiting trials that aren't already in the database."""
    cursor = conn.cursor()

    # Get all existing NCT IDs for dedup (both tables)
    existing_ncts: set = set()
    cursor.execute("SELECT nct_id FROM trials")
    existing_ncts.update(row[0] for row in cursor.fetchall())
    try:
        cursor.execute("SELECT nct_id FROM ct_gov_trials")
        existing_ncts.update(row[0] for row in cursor.fetchall())
    except Exception:
        pass

    stats = {"fetched": 0, "new": 0, "skipped": 0}
    now = datetime.now(timezone.utc).isoformat()
    seen: set = set()

    log.info("Pulling new trials for %d conditions...", len(conditions))

    for idx, condition in enumerate(conditions, 1):
        log.info("  [%d/%d] %s", idx, len(conditions), condition)

        records = fetch_studies(condition=condition, max_results=max_per_condition)
        stats["fetched"] += len(records)

        batch_new = 0
        for record in records:
            if record.nct_id in existing_ncts or record.nct_id in seen:
                stats["skipped"] += 1
                continue
            seen.add(record.nct_id)

            if dry_run:
                stats["new"] += 1
                batch_new += 1
            else:
                # upsert_trial now writes to ct_gov_trials with last_updated
                upsert_trial(conn, record)
                stats["new"] += 1
                batch_new += 1

        if batch_new > 0:
            log.info("    -> %d new trials", batch_new)

        if not dry_run and idx % 5 == 0:
            conn.commit()

    if not dry_run:
        conn.commit()

    return stats


# ---------------------------------------------------------------------------
# Log the run
# ---------------------------------------------------------------------------

def log_refresh_run(
    conn: sqlite3.Connection,
    statuses_checked: int,
    statuses_changed: int,
    new_trials: int,
    duration: float,
    notes: str = "",
) -> None:
    """Record this refresh run in the refresh_log table."""
    now = datetime.now(timezone.utc).isoformat()
    conn.execute("""
        INSERT INTO refresh_log (run_at, statuses_checked, statuses_changed,
                                 new_trials_added, duration_seconds, notes)
        VALUES (?, ?, ?, ?, ?, ?)
    """, (now, statuses_checked, statuses_changed, new_trials, duration, notes))
    conn.commit()


# ---------------------------------------------------------------------------
# Summary
# ---------------------------------------------------------------------------

def print_summary(conn: sqlite3.Connection) -> None:
    """Print database summary after refresh."""
    cursor = conn.cursor()

    sigir_total = cursor.execute("SELECT COUNT(*) FROM trials").fetchone()[0]
    ct_gov_total = 0
    ct_gov_recruiting = 0
    ct_gov_locations = 0
    try:
        ct_gov_total = cursor.execute(
            "SELECT COUNT(*) FROM ct_gov_trials"
        ).fetchone()[0]
        ct_gov_recruiting = cursor.execute(
            "SELECT COUNT(*) FROM ct_gov_trials WHERE status = 'RECRUITING'"
        ).fetchone()[0]
        ct_gov_locations = cursor.execute(
            "SELECT COUNT(*) FROM ct_gov_locations"
        ).fetchone()[0]
    except Exception:
        pass

    sigir_locations = cursor.execute(
        "SELECT COUNT(*) FROM trial_locations"
    ).fetchone()[0]

    # Last update time from both tables
    timestamps = []
    try:
        row = cursor.execute(
            "SELECT MAX(last_updated) FROM trials WHERE last_updated IS NOT NULL"
        ).fetchone()
        if row and row[0]:
            timestamps.append(row[0])
    except Exception:
        pass
    try:
        row = cursor.execute(
            "SELECT MAX(last_updated) FROM ct_gov_trials WHERE last_updated IS NOT NULL"
        ).fetchone()
        if row and row[0]:
            timestamps.append(row[0])
    except Exception:
        pass
    last_updated = max(timestamps) if timestamps else "never"

    log.info("")
    log.info("Database summary:")
    log.info("  SIGIR trials:     %d", sigir_total)
    log.info("  ct_gov_trials:    %d (%d recruiting)", ct_gov_total, ct_gov_recruiting)
    log.info("  Locations:        %d (SIGIR) + %d (ct_gov)", sigir_locations, ct_gov_locations)
    log.info("  Last updated:     %s", last_updated)


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def main() -> None:
    parser = argparse.ArgumentParser(
        description="Refresh trial database — update statuses and pull new trials",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""Examples:
  python refresh_trials.py                   # Full refresh
  python refresh_trials.py --status-only     # Only update statuses
  python refresh_trials.py --new-only        # Only pull new trials
  python refresh_trials.py --dry-run         # Preview changes
""",
    )
    parser.add_argument("--status-only", action="store_true",
                        help="Only update existing trial statuses")
    parser.add_argument("--new-only", action="store_true",
                        help="Only pull new trials")
    parser.add_argument("--dry-run", action="store_true",
                        help="Show what would change without writing")
    parser.add_argument("--max-per-condition", type=int, default=100,
                        help="Max new trials per condition (default: 100)")
    parser.add_argument("--db", type=Path, default=DB_PATH,
                        help="Path to SQLite database")
    args = parser.parse_args()

    start = time.time()

    conn = sqlite3.connect(args.db)
    conn.execute("PRAGMA journal_mode=WAL")
    _ensure_refresh_schema(conn)

    if args.dry_run:
        log.info("=== DRY RUN — no changes will be written ===")

    status_result = {"checked": 0, "changed": 0, "changes": []}
    new_result = {"fetched": 0, "new": 0, "skipped": 0}

    # Step 1: Update statuses (unless --new-only)
    if not args.new_only:
        log.info("Step 1: Refreshing trial statuses...")
        status_result = refresh_statuses(conn, dry_run=args.dry_run)

        if status_result["changes"]:
            log.info("")
            log.info("Status changes:")
            for ch in status_result["changes"]:
                log.info("  %s: %s → %s", ch["nct_id"], ch["old_status"], ch["new_status"])

    # Step 2: Pull new trials (unless --status-only)
    if not args.status_only:
        log.info("")
        log.info("Step 2: Pulling new trials...")
        new_result = pull_new_trials(
            conn,
            conditions=DEFAULT_CONDITIONS,
            max_per_condition=args.max_per_condition,
            dry_run=args.dry_run,
        )

    duration = time.time() - start

    # Log the run (unless dry-run)
    if not args.dry_run:
        log_refresh_run(
            conn,
            statuses_checked=status_result["checked"],
            statuses_changed=status_result["changed"],
            new_trials=new_result["new"],
            duration=duration,
            notes="dry_run" if args.dry_run else "",
        )

    # Summary
    log.info("")
    log.info("=" * 55)
    log.info("Refresh complete in %.1fs%s", duration,
             " (DRY RUN)" if args.dry_run else "")
    log.info("  Statuses checked:  %d", status_result["checked"])
    log.info("  Statuses changed:  %d", status_result["changed"])
    log.info("  New trials added:  %d", new_result["new"])

    if not args.dry_run:
        print_summary(conn)

    conn.close()


if __name__ == "__main__":
    main()
