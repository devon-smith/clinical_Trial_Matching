"""
Ingest actively recruiting trials from ClinicalTrials.gov API v2
into dedicated ct_gov_trials / ct_gov_locations tables.

Usage:
    python ingest_clinicaltrials.py                         # Top-20 conditions
    python ingest_clinicaltrials.py --condition "liver cancer"
    python ingest_clinicaltrials.py --condition "breast cancer,COPD"
    python ingest_clinicaltrials.py --all-recruiting         # All recruiting (~50k+)
    python ingest_clinicaltrials.py --refresh                # Update statuses only
    python ingest_clinicaltrials.py --max-per-condition 200
"""

from __future__ import annotations

import argparse
import json
import logging
import sqlite3
import time
from dataclasses import dataclass
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Dict, List, Optional, Sequence, Tuple

import requests

# ---------------------------------------------------------------------------
# Logging
# ---------------------------------------------------------------------------

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s  %(message)s",
    datefmt="%H:%M:%S",
)
log = logging.getLogger(__name__)

# ---------------------------------------------------------------------------
# Config
# ---------------------------------------------------------------------------

DB_PATH = Path(__file__).with_name("trial_data.sqlite")
API_BASE = "https://clinicaltrials.gov/api/v2/studies"
PAGE_SIZE = 100        # API v2 max
REQUEST_DELAY = 0.3    # seconds between requests
MAX_RETRIES = 5        # for 429 / transient errors
RETRY_BACKOFF = 2.0    # exponential backoff base

# Top-20 condition categories for focused initial pull
DEFAULT_CONDITIONS: List[str] = [
    "cancer",
    "diabetes",
    "heart failure",
    "arthritis",
    "depression",
    "COPD",
    "asthma",
    "Alzheimer's",
    "Parkinson's",
    "breast cancer",
    "lung cancer",
    "liver cancer",
    "kidney disease",
    "HIV",
    "multiple sclerosis",
    "epilepsy",
    "stroke",
    "obesity",
    "migraine",
    "chronic pain",
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
    official_title: str
    brief_summary: str
    detailed_description: str
    phase: str
    status: str
    conditions: Tuple[str, ...]
    interventions: Tuple[str, ...]
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
    locations: Tuple[TrialLocation, ...] = ()
    metadata_json: str = ""


# ---------------------------------------------------------------------------
# API layer
# ---------------------------------------------------------------------------

def _safe_get(d: Any, *keys: str, default: Any = None) -> Any:
    """Nested dict lookup returning *default* on any missing key."""
    current = d
    for k in keys:
        if not isinstance(current, dict):
            return default
        current = current.get(k)
        if current is None:
            return default
    return current


def _api_get(params: Dict[str, Any]) -> Dict[str, Any]:
    """GET with retry + exponential backoff on 429 / transient errors."""
    for attempt in range(1, MAX_RETRIES + 1):
        try:
            resp = requests.get(API_BASE, params=params, timeout=30)
            if resp.status_code == 429:
                wait = RETRY_BACKOFF ** attempt
                log.warning(
                    "Rate-limited (429). Waiting %.1fs "
                    "(attempt %d/%d)...",
                    wait, attempt, MAX_RETRIES,
                )
                time.sleep(wait)
                continue
            resp.raise_for_status()
            return resp.json()
        except requests.ConnectionError as exc:
            wait = RETRY_BACKOFF ** attempt
            log.warning(
                "Connection error: %s. Retrying in %.1fs (%d/%d)...",
                exc, wait, attempt, MAX_RETRIES,
            )
            time.sleep(wait)
        except requests.Timeout:
            wait = RETRY_BACKOFF ** attempt
            log.warning(
                "Timeout. Retrying in %.1fs (%d/%d)...",
                wait, attempt, MAX_RETRIES,
            )
            time.sleep(wait)
        except requests.HTTPError:
            if resp.status_code >= 500:
                wait = RETRY_BACKOFF ** attempt
                log.warning(
                    "Server error %d. Retrying in %.1fs (%d/%d)...",
                    resp.status_code, wait, attempt, MAX_RETRIES,
                )
                time.sleep(wait)
            else:
                raise
    raise RuntimeError(
        f"API request failed after {MAX_RETRIES} retries"
    )


def _parse_study(study: Dict) -> Optional[TrialRecord]:
    """Parse a single API study object into a TrialRecord."""
    proto = study.get("protocolSection", {})

    nct_id = _safe_get(proto, "identificationModule", "nctId")
    if not nct_id:
        return None

    brief_title = _safe_get(
        proto, "identificationModule", "briefTitle", default=""
    )
    official_title = _safe_get(
        proto, "identificationModule", "officialTitle", default=""
    )
    title = brief_title or official_title

    status = _safe_get(
        proto, "statusModule", "overallStatus", default=""
    )

    # Phase — "PHASE2" -> "Phase 2"
    phases_raw = _safe_get(
        proto, "designModule", "phases", default=[]
    )
    phase = ", ".join(phases_raw) if phases_raw else ""
    phase = (
        phase.replace("PHASE", "Phase ").replace("  ", " ").strip()
    )

    brief_summary = _safe_get(
        proto, "descriptionModule", "briefSummary", default=""
    )
    detailed_desc = _safe_get(
        proto, "descriptionModule", "detailedDescription", default=""
    )

    conditions = tuple(
        _safe_get(proto, "conditionsModule", "conditions", default=[])
    )

    interventions_raw = _safe_get(
        proto, "armsInterventionsModule", "interventions", default=[]
    )
    interventions = tuple(
        f"{i.get('type', '')}: {i.get('name', '')}"
        for i in interventions_raw
    )

    enrollment = _safe_get(
        proto, "designModule", "enrollmentInfo", "count"
    )

    start_date = _safe_get(
        proto, "statusModule", "startDateStruct", "date"
    )
    completion_date = _safe_get(
        proto, "statusModule", "completionDateStruct", "date"
    )

    elig_mod = proto.get("eligibilityModule", {})
    eligibility_text = elig_mod.get("eligibilityCriteria", "")
    min_age = elig_mod.get("minimumAge")
    max_age = elig_mod.get("maximumAge")
    sex = elig_mod.get("sex")

    contacts_mod = proto.get("contactsLocationsModule", {})
    central = contacts_mod.get("centralContacts", [])
    contact_name = central[0].get("name") if central else None
    contact_email = central[0].get("email") if central else None
    contact_phone = central[0].get("phone") if central else None

    locations: List[TrialLocation] = []
    for loc in contacts_mod.get("locations", []):
        geo = loc.get("geoPoint") or {}
        loc_contacts = loc.get("contacts", [])
        locations.append(TrialLocation(
            facility=loc.get("facility", ""),
            city=loc.get("city", ""),
            state=loc.get("state", ""),
            country=loc.get("country", ""),
            zip_code=loc.get("zip", ""),
            latitude=geo.get("lat"),
            longitude=geo.get("lon"),
            contact_name=(
                loc_contacts[0].get("name") if loc_contacts else None
            ),
            contact_email=(
                loc_contacts[0].get("email") if loc_contacts else None
            ),
            contact_phone=(
                loc_contacts[0].get("phone") if loc_contacts else None
            ),
        ))

    return TrialRecord(
        nct_id=nct_id,
        title=title,
        official_title=official_title,
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
        locations=tuple(locations),
        metadata_json=json.dumps(study, default=str),
    )


def fetch_studies(
    *,
    condition: Optional[str] = None,
    max_results: Optional[int] = None,
    status_filter: str = "RECRUITING",
) -> List[TrialRecord]:
    """Fetch studies from ClinicalTrials.gov API v2 with pagination.

    Args:
        condition: Condition search term. None for all recruiting.
        max_results: Cap on number of studies. None for unlimited.
        status_filter: overallStatus filter value.
    """
    records: List[TrialRecord] = []
    next_token: Optional[str] = None
    total_available: Optional[int] = None

    while True:
        if max_results is not None and len(records) >= max_results:
            break

        page_size = PAGE_SIZE
        if max_results is not None:
            page_size = min(PAGE_SIZE, max_results - len(records))

        params: Dict[str, Any] = {
            "filter.overallStatus": status_filter,
            "pageSize": page_size,
            "countTotal": "true",
        }
        if condition:
            params["query.cond"] = condition
        if next_token:
            params["pageToken"] = next_token

        data = _api_get(params)

        if total_available is None:
            total_available = data.get("totalCount", "?")

        studies = data.get("studies", [])
        if not studies:
            break

        for study in studies:
            record = _parse_study(study)
            if record:
                records.append(record)

        cap_label = (
            f"/{max_results}" if max_results else f"/{total_available}"
        )
        log.info(
            "  Fetched %d%s trials%s",
            len(records), cap_label,
            f" for '{condition}'" if condition else "",
        )

        next_token = data.get("nextPageToken")
        if not next_token:
            break

        time.sleep(REQUEST_DELAY)

    return records


# ---------------------------------------------------------------------------
# Database — ct_gov_trials & ct_gov_locations
# ---------------------------------------------------------------------------

def _ensure_schema(conn: sqlite3.Connection) -> None:
    """Create ct_gov_trials and ct_gov_locations tables."""
    cursor = conn.cursor()

    cursor.execute("""
        CREATE TABLE IF NOT EXISTS ct_gov_trials (
            nct_id TEXT PRIMARY KEY,
            title TEXT,
            official_title TEXT,
            phase TEXT,
            status TEXT,
            enrollment INTEGER,
            brief_summary TEXT,
            detailed_description TEXT,
            drugs TEXT,
            diseases TEXT,
            eligibility_text TEXT,
            min_age TEXT,
            max_age TEXT,
            sex TEXT,
            start_date TEXT,
            completion_date TEXT,
            contact_name TEXT,
            contact_email TEXT,
            contact_phone TEXT,
            metadata_json TEXT,
            last_updated TEXT,
            created_at TEXT DEFAULT (datetime('now'))
        )
    """)

    cursor.execute("""
        CREATE TABLE IF NOT EXISTS ct_gov_locations (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nct_id TEXT NOT NULL,
            facility_name TEXT,
            city TEXT,
            state TEXT,
            country TEXT,
            zip TEXT,
            latitude REAL,
            longitude REAL,
            contact_name TEXT,
            contact_email TEXT,
            contact_phone TEXT,
            FOREIGN KEY(nct_id) REFERENCES ct_gov_trials(nct_id)
        )
    """)

    cursor.execute(
        "CREATE INDEX IF NOT EXISTS idx_ct_gov_locations_nct "
        "ON ct_gov_locations(nct_id)"
    )
    cursor.execute(
        "CREATE INDEX IF NOT EXISTS idx_ct_gov_trials_status "
        "ON ct_gov_trials(status)"
    )
    cursor.execute(
        "CREATE INDEX IF NOT EXISTS idx_ct_gov_trials_diseases "
        "ON ct_gov_trials(diseases)"
    )

    conn.commit()


def upsert_trial(conn: sqlite3.Connection, trial: TrialRecord) -> bool:
    """Insert or update a trial in ct_gov_trials. Returns True if new."""
    cursor = conn.cursor()

    cursor.execute(
        "SELECT 1 FROM ct_gov_trials WHERE nct_id = ?", (trial.nct_id,)
    )
    is_new = cursor.fetchone() is None

    drugs = ", ".join(trial.interventions) if trial.interventions else ""
    diseases = ", ".join(trial.conditions) if trial.conditions else ""
    now = datetime.now(timezone.utc).isoformat()

    cursor.execute("""
        INSERT INTO ct_gov_trials (
            nct_id, title, official_title, phase, status,
            enrollment, brief_summary, detailed_description,
            drugs, diseases, eligibility_text,
            min_age, max_age, sex,
            start_date, completion_date,
            contact_name, contact_email, contact_phone,
            metadata_json, last_updated
        ) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
        ON CONFLICT(nct_id) DO UPDATE SET
            title=excluded.title,
            official_title=excluded.official_title,
            phase=excluded.phase,
            status=excluded.status,
            enrollment=excluded.enrollment,
            brief_summary=excluded.brief_summary,
            detailed_description=excluded.detailed_description,
            drugs=excluded.drugs,
            diseases=excluded.diseases,
            eligibility_text=excluded.eligibility_text,
            min_age=excluded.min_age,
            max_age=excluded.max_age,
            sex=excluded.sex,
            start_date=excluded.start_date,
            completion_date=excluded.completion_date,
            contact_name=excluded.contact_name,
            contact_email=excluded.contact_email,
            contact_phone=excluded.contact_phone,
            metadata_json=excluded.metadata_json,
            last_updated=excluded.last_updated
    """, (
        trial.nct_id, trial.title, trial.official_title,
        trial.phase, trial.status,
        trial.enrollment, trial.brief_summary,
        trial.detailed_description,
        drugs, diseases, trial.eligibility_text,
        trial.min_age, trial.max_age, trial.sex,
        trial.start_date, trial.completion_date,
        trial.contact_name, trial.contact_email, trial.contact_phone,
        trial.metadata_json, now,
    ))

    # Replace locations
    cursor.execute(
        "DELETE FROM ct_gov_locations WHERE nct_id = ?",
        (trial.nct_id,),
    )
    for loc in trial.locations:
        cursor.execute("""
            INSERT INTO ct_gov_locations
            (nct_id, facility_name, city, state, country, zip,
             latitude, longitude,
             contact_name, contact_email, contact_phone)
            VALUES (?,?,?,?,?,?,?,?,?,?,?)
        """, (
            trial.nct_id, loc.facility, loc.city, loc.state,
            loc.country, loc.zip_code,
            loc.latitude, loc.longitude,
            loc.contact_name, loc.contact_email, loc.contact_phone,
        ))

    return is_new


def refresh_statuses(conn: sqlite3.Connection) -> Dict[str, int]:
    """Re-fetch status for every trial in ct_gov_trials."""
    cursor = conn.cursor()
    nct_ids = [
        row[0] for row in
        cursor.execute("SELECT nct_id FROM ct_gov_trials").fetchall()
    ]
    if not nct_ids:
        log.info("No ct_gov trials to refresh.")
        return {"checked": 0, "updated": 0}

    updated = 0
    checked = 0
    now = datetime.now(timezone.utc).isoformat()

    for i in range(0, len(nct_ids), PAGE_SIZE):
        batch = nct_ids[i:i + PAGE_SIZE]
        nct_filter = " OR ".join(
            f"AREA[NCTId]{nid}" for nid in batch
        )

        try:
            data = _api_get({
                "query.term": nct_filter,
                "pageSize": PAGE_SIZE,
            })
        except Exception as exc:
            log.warning("Refresh batch error: %s", exc)
            continue

        for study in data.get("studies", []):
            proto = study.get("protocolSection", {})
            nct = _safe_get(proto, "identificationModule", "nctId")
            new_status = _safe_get(
                proto, "statusModule", "overallStatus"
            )
            if nct and new_status:
                cursor.execute(
                    "UPDATE ct_gov_trials "
                    "SET status = ?, last_updated = ? "
                    "WHERE nct_id = ? AND status != ?",
                    (new_status, now, nct, new_status),
                )
                if cursor.rowcount > 0:
                    updated += 1
            checked += 1

        log.info(
            "  Refreshed %d/%d...", checked, len(nct_ids)
        )
        time.sleep(REQUEST_DELAY)

    conn.commit()
    return {"checked": checked, "updated": updated}


# ---------------------------------------------------------------------------
# Orchestration
# ---------------------------------------------------------------------------

def ingest(
    conditions: Sequence[str],
    max_per_condition: int = 100,
    db_path: Path = DB_PATH,
) -> Dict[str, int]:
    """Ingest recruiting trials for a list of conditions."""
    conn = sqlite3.connect(db_path)
    conn.execute("PRAGMA journal_mode=WAL")
    _ensure_schema(conn)

    stats = {
        "new": 0, "updated": 0, "skipped": 0, "total_fetched": 0,
    }
    seen_ncts: set = set()

    for idx, condition in enumerate(conditions, 1):
        log.info(
            "[%d/%d] Fetching: %s (max %d)...",
            idx, len(conditions), condition, max_per_condition,
        )

        records = fetch_studies(
            condition=condition, max_results=max_per_condition,
        )
        stats["total_fetched"] += len(records)

        batch_new = 0
        for record in records:
            if record.nct_id in seen_ncts:
                stats["skipped"] += 1
                continue
            seen_ncts.add(record.nct_id)

            if upsert_trial(conn, record):
                stats["new"] += 1
                batch_new += 1
            else:
                stats["updated"] += 1

        conn.commit()
        log.info(
            "  -> %d new, %d total unique so far",
            batch_new, len(seen_ncts),
        )

    conn.close()
    return stats


def ingest_all_recruiting(
    db_path: Path = DB_PATH,
    max_results: Optional[int] = None,
) -> Dict[str, int]:
    """Ingest ALL actively recruiting trials (no condition filter)."""
    conn = sqlite3.connect(db_path)
    conn.execute("PRAGMA journal_mode=WAL")
    _ensure_schema(conn)

    log.info("Fetching ALL recruiting trials (this may take a while)...")
    records = fetch_studies(max_results=max_results)
    log.info("Total fetched from API: %d", len(records))

    stats = {"new": 0, "updated": 0, "total_fetched": len(records)}
    for record in records:
        if upsert_trial(conn, record):
            stats["new"] += 1
        else:
            stats["updated"] += 1

        # Commit every 500 to avoid holding too much in WAL
        if (stats["new"] + stats["updated"]) % 500 == 0:
            conn.commit()
            log.info(
                "  Stored %d trials...",
                stats["new"] + stats["updated"],
            )

    conn.commit()
    conn.close()
    return stats


def _print_summary(stats: Dict[str, int], db_path: Path) -> None:
    """Print final ingestion summary."""
    conn = sqlite3.connect(db_path)
    total = conn.execute(
        "SELECT COUNT(*) FROM ct_gov_trials"
    ).fetchone()[0]
    loc_count = conn.execute(
        "SELECT COUNT(*) FROM ct_gov_locations"
    ).fetchone()[0]

    # Also show SIGIR trial count if available
    sigir_count = 0
    try:
        sigir_count = conn.execute(
            "SELECT COUNT(*) FROM trials"
        ).fetchone()[0]
    except Exception:
        pass

    conn.close()

    log.info("")
    log.info("=" * 50)
    log.info("Ingestion complete!")
    log.info("  Total fetched:     %d", stats["total_fetched"])
    log.info("  New trials:        %d", stats["new"])
    log.info("  Updated:           %d", stats["updated"])
    log.info("  Skipped (dupes):   %d", stats.get("skipped", 0))
    log.info("  ──────────────────────────")
    log.info("  ct_gov_trials:     %d", total)
    log.info("  ct_gov_locations:  %d", loc_count)
    if sigir_count:
        log.info("  SIGIR trials:      %d", sigir_count)


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def main() -> None:
    parser = argparse.ArgumentParser(
        description="Ingest trials from ClinicalTrials.gov API v2",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""Examples:
  python ingest_clinicaltrials.py                          # Top-20 conditions
  python ingest_clinicaltrials.py --condition "liver cancer"
  python ingest_clinicaltrials.py --condition "COPD,asthma"
  python ingest_clinicaltrials.py --all-recruiting
  python ingest_clinicaltrials.py --refresh
""",
    )
    parser.add_argument(
        "--condition",
        type=str,
        default=None,
        help="Comma-separated condition(s) to search for",
    )
    parser.add_argument(
        "--all-recruiting",
        action="store_true",
        help="Pull ALL actively recruiting trials (~50k+)",
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
        help="Only refresh status of existing ct_gov trials",
    )
    parser.add_argument(
        "--db",
        type=Path,
        default=DB_PATH,
        help="Path to SQLite database",
    )
    args = parser.parse_args()

    if args.refresh:
        log.info("Refreshing trial statuses...")
        conn = sqlite3.connect(args.db)
        _ensure_schema(conn)
        result = refresh_statuses(conn)
        conn.close()
        log.info(
            "Refresh complete: %d checked, %d updated",
            result["checked"], result["updated"],
        )
        return

    if args.all_recruiting:
        stats = ingest_all_recruiting(db_path=args.db)
        _print_summary(stats, args.db)
        return

    conditions = (
        [c.strip() for c in args.condition.split(",")]
        if args.condition
        else DEFAULT_CONDITIONS
    )

    log.info(
        "Ingesting trials for %d condition(s)...", len(conditions)
    )
    log.info("Database: %s", args.db)
    log.info("Max per condition: %d", args.max_per_condition)

    stats = ingest(
        conditions=conditions,
        max_per_condition=args.max_per_condition,
        db_path=args.db,
    )
    _print_summary(stats, args.db)


if __name__ == "__main__":
    main()
