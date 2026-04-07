"""
Ingest actively recruiting trials from ClinicalTrials.gov API v2
into the existing SQLite schema.

Usage:
    python ingest_ctgov.py                    # Ingest top-20 conditions
    python ingest_ctgov.py --conditions "breast cancer,diabetes"
    python ingest_ctgov.py --refresh          # Update status of existing trials
    python ingest_ctgov.py --max-per-condition 50
"""

from __future__ import annotations

import argparse
import json
import sqlite3
import time
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any, Dict, List, Optional, Sequence

import requests

# ---------------------------------------------------------------------------
# Config
# ---------------------------------------------------------------------------

DB_PATH = Path(__file__).with_name("trial_data.sqlite")
API_BASE = "https://clinicaltrials.gov/api/v2/studies"
PAGE_SIZE = 50  # max allowed by API
REQUEST_DELAY = 0.35  # stay well under rate limit

# Top-20 condition categories for the initial focused pull
DEFAULT_CONDITIONS: List[str] = [
    "breast cancer",
    "lung cancer",
    "prostate cancer",
    "colorectal cancer",
    "type 2 diabetes",
    "type 1 diabetes",
    "hypertension",
    "heart failure",
    "asthma",
    "COPD",
    "depression",
    "anxiety",
    "rheumatoid arthritis",
    "Alzheimer disease",
    "Parkinson disease",
    "multiple sclerosis",
    "chronic kidney disease",
    "hepatitis C",
    "HIV",
    "obesity",
]


# ---------------------------------------------------------------------------
# Data classes
# ---------------------------------------------------------------------------

@dataclass(frozen=True)
class TrialLocation:
    facility: str
    city: str
    state: str
    country: str
    zip_code: str
    latitude: Optional[float]
    longitude: Optional[float]
    contact_name: Optional[str]
    contact_email: Optional[str]
    contact_phone: Optional[str]


@dataclass(frozen=True)
class TrialRecord:
    nct_id: str
    title: str
    brief_summary: str
    detailed_description: str
    phase: str
    status: str
    conditions: List[str]
    interventions: List[str]
    enrollment: Optional[int]
    start_date: Optional[str]
    completion_date: Optional[str]
    eligibility_text: str
    min_age: Optional[str]
    max_age: Optional[str]
    sex: Optional[str]
    contact_name: Optional[str]
    contact_email: Optional[str]
    contact_phone: Optional[str]
    locations: List[TrialLocation] = field(default_factory=list)
    metadata_json: str = ""


# ---------------------------------------------------------------------------
# API fetching
# ---------------------------------------------------------------------------

def _safe_get(d: Dict, *keys: str, default: Any = None) -> Any:
    """Nested dict traversal that returns default on any missing key."""
    current = d
    for k in keys:
        if not isinstance(current, dict):
            return default
        current = current.get(k)
        if current is None:
            return default
    return current


def _parse_study(study: Dict) -> Optional[TrialRecord]:
    """Parse a single study JSON object into a TrialRecord."""
    proto = study.get("protocolSection", {})

    nct_id = _safe_get(proto, "identificationModule", "nctId")
    if not nct_id:
        return None

    title = (
        _safe_get(proto, "identificationModule", "briefTitle", default="")
        or _safe_get(proto, "identificationModule", "officialTitle", default="")
    )

    # Status
    status = _safe_get(proto, "statusModule", "overallStatus", default="")

    # Phase
    phases_raw = _safe_get(proto, "designModule", "phases", default=[])
    phase = ", ".join(phases_raw) if phases_raw else ""
    # Clean up: "PHASE2" -> "Phase 2"
    phase = phase.replace("PHASE", "Phase ").replace("  ", " ").strip()

    # Description
    brief_summary = _safe_get(proto, "descriptionModule", "briefSummary", default="")
    detailed_desc = _safe_get(proto, "descriptionModule", "detailedDescription", default="")

    # Conditions & interventions
    conditions = _safe_get(proto, "conditionsModule", "conditions", default=[])
    interventions_raw = _safe_get(proto, "armsInterventionsModule", "interventions", default=[])
    interventions = [
        f"{i.get('type', '')}: {i.get('name', '')}" for i in interventions_raw
    ]

    # Enrollment
    enrollment = _safe_get(proto, "designModule", "enrollmentInfo", "count")

    # Dates
    start_date = _safe_get(proto, "statusModule", "startDateStruct", "date")
    completion_date = _safe_get(proto, "statusModule", "completionDateStruct", "date")

    # Eligibility
    elig_mod = proto.get("eligibilityModule", {})
    eligibility_text = elig_mod.get("eligibilityCriteria", "")
    min_age = elig_mod.get("minimumAge")
    max_age = elig_mod.get("maximumAge")
    sex = elig_mod.get("sex")

    # Contacts
    contacts_mod = proto.get("contactsLocationsModule", {})
    central = contacts_mod.get("centralContacts", [])
    contact_name = central[0].get("name") if central else None
    contact_email = central[0].get("email") if central else None
    contact_phone = central[0].get("phone") if central else None

    # Locations
    locations = []
    for loc in contacts_mod.get("locations", []):
        geo = loc.get("geoPoint", {})
        loc_contacts = loc.get("contacts", [])
        locations.append(TrialLocation(
            facility=loc.get("facility", ""),
            city=loc.get("city", ""),
            state=loc.get("state", ""),
            country=loc.get("country", ""),
            zip_code=loc.get("zip", ""),
            latitude=geo.get("lat"),
            longitude=geo.get("lon"),
            contact_name=loc_contacts[0].get("name") if loc_contacts else None,
            contact_email=loc_contacts[0].get("email") if loc_contacts else None,
            contact_phone=loc_contacts[0].get("phone") if loc_contacts else None,
        ))

    return TrialRecord(
        nct_id=nct_id,
        title=title,
        brief_summary=brief_summary,
        detailed_description=detailed_desc,
        phase=phase,
        status=status,
        conditions=conditions,
        interventions=interventions,
        enrollment=enrollment,
        start_date=start_date,
        completion_date=completion_date,
        eligibility_text=eligibility_text,
        min_age=min_age,
        max_age=max_age,
        sex=sex,
        contact_name=contact_name,
        contact_email=contact_email,
        contact_phone=contact_phone,
        locations=locations,
        metadata_json=json.dumps(study, default=str),
    )


def fetch_studies(
    condition: str,
    max_results: int = 100,
    status_filter: str = "RECRUITING",
) -> List[TrialRecord]:
    """Fetch recruiting studies for a condition from ClinicalTrials.gov API v2."""
    records: List[TrialRecord] = []
    next_token: Optional[str] = None
    fetched = 0

    while fetched < max_results:
        params: Dict[str, Any] = {
            "query.cond": condition,
            "filter.overallStatus": status_filter,
            "pageSize": min(PAGE_SIZE, max_results - fetched),
            "countTotal": "true",
        }
        if next_token:
            params["pageToken"] = next_token

        try:
            resp = requests.get(API_BASE, params=params, timeout=30)
            resp.raise_for_status()
            data = resp.json()
        except requests.RequestException as e:
            print(f"  API error for '{condition}': {e}")
            break

        studies = data.get("studies", [])
        if not studies:
            break

        for study in studies:
            record = _parse_study(study)
            if record:
                records.append(record)

        fetched += len(studies)
        next_token = data.get("nextPageToken")
        if not next_token:
            break

        time.sleep(REQUEST_DELAY)

    return records


# ---------------------------------------------------------------------------
# Database operations
# ---------------------------------------------------------------------------

def _ensure_schema(conn: sqlite3.Connection) -> None:
    """Ensure the trial_locations table and extra columns exist."""
    cursor = conn.cursor()

    cursor.execute("""
        CREATE TABLE IF NOT EXISTS trial_locations (
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

    cursor.execute("""
        CREATE INDEX IF NOT EXISTS idx_trial_locations_nct
        ON trial_locations(nct_id)
    """)

    # Add columns that may not exist yet
    existing_cols = {
        row[1] for row in cursor.execute("PRAGMA table_info(trials)").fetchall()
    }
    new_cols = {
        "detailed_description": "TEXT",
        "eligibility_text": "TEXT",
        "min_age": "TEXT",
        "max_age": "TEXT",
        "sex": "TEXT",
        "start_date": "TEXT",
        "completion_date": "TEXT",
        "contact_name": "TEXT",
        "contact_email": "TEXT",
        "contact_phone": "TEXT",
        "source": "TEXT",
    }
    for col, typedef in new_cols.items():
        if col not in existing_cols:
            cursor.execute(f"ALTER TABLE trials ADD COLUMN {col} {typedef}")

    conn.commit()


def upsert_trial(conn: sqlite3.Connection, trial: TrialRecord) -> bool:
    """Insert or update a trial. Returns True if new, False if updated."""
    cursor = conn.cursor()

    cursor.execute("SELECT nct_id FROM trials WHERE nct_id = ?", (trial.nct_id,))
    exists = cursor.fetchone() is not None

    drugs = ", ".join(trial.interventions) if trial.interventions else ""
    diseases = ", ".join(trial.conditions) if trial.conditions else ""

    cursor.execute("""
        INSERT INTO trials (
            nct_id, title, phase, status, enrollment, brief_summary,
            drugs, diseases, metadata_json, detailed_description,
            eligibility_text, min_age, max_age, sex,
            start_date, completion_date,
            contact_name, contact_email, contact_phone, source
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'ctgov_api')
        ON CONFLICT(nct_id) DO UPDATE SET
            title=excluded.title, phase=excluded.phase, status=excluded.status,
            enrollment=excluded.enrollment, brief_summary=excluded.brief_summary,
            drugs=excluded.drugs, diseases=excluded.diseases,
            metadata_json=excluded.metadata_json,
            detailed_description=excluded.detailed_description,
            eligibility_text=excluded.eligibility_text,
            min_age=excluded.min_age, max_age=excluded.max_age, sex=excluded.sex,
            start_date=excluded.start_date, completion_date=excluded.completion_date,
            contact_name=excluded.contact_name, contact_email=excluded.contact_email,
            contact_phone=excluded.contact_phone, source='ctgov_api'
    """, (
        trial.nct_id, trial.title, trial.phase, trial.status,
        trial.enrollment, trial.brief_summary, drugs, diseases,
        trial.metadata_json, trial.detailed_description,
        trial.eligibility_text, trial.min_age, trial.max_age, trial.sex,
        trial.start_date, trial.completion_date,
        trial.contact_name, trial.contact_email, trial.contact_phone,
    ))

    # Upsert locations
    cursor.execute("DELETE FROM trial_locations WHERE nct_id = ?", (trial.nct_id,))
    for loc in trial.locations:
        cursor.execute("""
            INSERT INTO trial_locations
            (nct_id, facility_name, city, state, country, zip, latitude, longitude)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        """, (
            trial.nct_id, loc.facility, loc.city, loc.state,
            loc.country, loc.zip_code, loc.latitude, loc.longitude,
        ))

    # Store eligibility text as a characteristic for RAG retrieval
    cursor.execute("""
        INSERT INTO trial_characteristics
        (nct_id, characteristic_key, characteristic_value, value_type, confidence, source)
        VALUES (?, 'inclusion_text', ?, 'text', 1.0, 'ctgov_api')
        ON CONFLICT DO NOTHING
    """, (trial.nct_id, trial.eligibility_text))

    return not exists


def refresh_statuses(conn: sqlite3.Connection) -> Dict[str, int]:
    """Re-fetch status for all API-sourced trials. Returns counts."""
    cursor = conn.cursor()
    cursor.execute(
        "SELECT nct_id FROM trials WHERE source = 'ctgov_api'"
    )
    nct_ids = [row[0] for row in cursor.fetchall()]

    if not nct_ids:
        print("No API-sourced trials to refresh.")
        return {"checked": 0, "updated": 0}

    updated = 0
    checked = 0

    # Batch in groups of 50
    for i in range(0, len(nct_ids), PAGE_SIZE):
        batch = nct_ids[i:i + PAGE_SIZE]
        nct_filter = " OR ".join(f"AREA[NCTId]{nid}" for nid in batch)

        try:
            resp = requests.get(API_BASE, params={
                "query.term": nct_filter,
                "pageSize": PAGE_SIZE,
            }, timeout=30)
            resp.raise_for_status()
            data = resp.json()
        except requests.RequestException as e:
            print(f"  Refresh batch error: {e}")
            continue

        for study in data.get("studies", []):
            proto = study.get("protocolSection", {})
            nct = _safe_get(proto, "identificationModule", "nctId")
            new_status = _safe_get(proto, "statusModule", "overallStatus")
            if nct and new_status:
                cursor.execute(
                    "UPDATE trials SET status = ? WHERE nct_id = ? AND status != ?",
                    (new_status, nct, new_status),
                )
                if cursor.rowcount > 0:
                    updated += 1
            checked += 1

        time.sleep(REQUEST_DELAY)

    conn.commit()
    return {"checked": checked, "updated": updated}


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

def ingest(
    conditions: Sequence[str],
    max_per_condition: int = 100,
    db_path: Path = DB_PATH,
) -> Dict[str, int]:
    """Ingest recruiting trials for the given conditions."""
    conn = sqlite3.connect(db_path)
    conn.execute("PRAGMA journal_mode=WAL")
    _ensure_schema(conn)

    stats = {"new": 0, "updated": 0, "skipped": 0, "total_fetched": 0}
    seen_ncts: set = set()

    for condition in conditions:
        print(f"\nFetching: {condition} (max {max_per_condition})...")
        records = fetch_studies(condition, max_results=max_per_condition)
        print(f"  Retrieved {len(records)} studies")
        stats["total_fetched"] += len(records)

        for record in records:
            if record.nct_id in seen_ncts:
                stats["skipped"] += 1
                continue
            seen_ncts.add(record.nct_id)

            is_new = upsert_trial(conn, record)
            if is_new:
                stats["new"] += 1
            else:
                stats["updated"] += 1

        conn.commit()

    conn.close()
    return stats


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Ingest trials from ClinicalTrials.gov API v2"
    )
    parser.add_argument(
        "--conditions",
        type=str,
        default=None,
        help="Comma-separated list of conditions (default: top 20)",
    )
    parser.add_argument(
        "--max-per-condition",
        type=int,
        default=100,
        help="Max trials per condition (default: 100)",
    )
    parser.add_argument(
        "--refresh",
        action="store_true",
        help="Only refresh status of existing API-sourced trials",
    )
    parser.add_argument(
        "--db",
        type=Path,
        default=DB_PATH,
        help="Path to SQLite database",
    )
    args = parser.parse_args()

    if args.refresh:
        print("Refreshing trial statuses...")
        conn = sqlite3.connect(args.db)
        _ensure_schema(conn)
        result = refresh_statuses(conn)
        conn.close()
        print(f"\nRefresh complete: {result['checked']} checked, {result['updated']} updated")
        return

    conditions = (
        [c.strip() for c in args.conditions.split(",")]
        if args.conditions
        else DEFAULT_CONDITIONS
    )

    print(f"Ingesting trials for {len(conditions)} conditions...")
    print(f"Database: {args.db}")
    print(f"Max per condition: {args.max_per_condition}")

    stats = ingest(
        conditions=conditions,
        max_per_condition=args.max_per_condition,
        db_path=args.db,
    )

    print(f"\n{'='*50}")
    print(f"Ingestion complete!")
    print(f"  Total fetched:  {stats['total_fetched']}")
    print(f"  New trials:     {stats['new']}")
    print(f"  Updated:        {stats['updated']}")
    print(f"  Skipped (dupe): {stats['skipped']}")

    # Show final count
    conn = sqlite3.connect(args.db)
    count = conn.execute("SELECT COUNT(*) FROM trials").fetchone()[0]
    api_count = conn.execute(
        "SELECT COUNT(*) FROM trials WHERE source = 'ctgov_api'"
    ).fetchone()[0]
    conn.close()
    print(f"  Total in DB:    {count} ({api_count} from API, {count - api_count} from SIGIR)")


if __name__ == "__main__":
    main()
