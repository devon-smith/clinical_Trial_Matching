"""One-time script to enrich trials with real status and location data from ClinicalTrials.gov v2 API."""
import sqlite3
import time
from pathlib import Path

import requests

API_BASE = "https://clinicaltrials.gov/api/v2/studies"
FIELDS = "protocolSection.statusModule.overallStatus|protocolSection.contactsLocationsModule.locations"
REQUEST_DELAY = 0.3  # seconds between API calls
BATCH_SIZE = 50


def fetch_study(nct_id: str) -> dict | None:
    """Fetch a single study from ClinicalTrials.gov v2 API."""
    url = f"{API_BASE}/{nct_id}"
    try:
        resp = requests.get(url, params={"fields": FIELDS}, timeout=15)
        if resp.status_code == 404:
            return None
        resp.raise_for_status()
        return resp.json()
    except requests.RequestException as e:
        print(f"  API error for {nct_id}: {e}")
        return None


def extract_status(study: dict) -> str:
    """Extract overall status from API response."""
    try:
        return study["protocolSection"]["statusModule"]["overallStatus"]
    except (KeyError, TypeError):
        return "Unknown"


def extract_locations(study: dict) -> list[dict]:
    """Extract facility locations with coordinates from API response."""
    locations = []
    try:
        facilities = (
            study.get("protocolSection", {})
            .get("contactsLocationsModule", {})
            .get("locations", [])
        )
    except (AttributeError, TypeError):
        return locations

    for facility in facilities or []:
        geo = facility.get("geoPoint", {}) or {}
        locations.append({
            "facility_name": facility.get("facility"),
            "city": facility.get("city"),
            "state": facility.get("state"),
            "country": facility.get("country"),
            "zip": facility.get("zip"),
            "latitude": geo.get("lat"),
            "longitude": geo.get("lon"),
        })
    return locations


def enrich():
    db_path = Path(__file__).parent / "trial_data.sqlite"
    if not db_path.exists():
        print(f"Error: Database not found at {db_path}")
        return

    conn = sqlite3.connect(str(db_path))
    conn.row_factory = sqlite3.Row
    cursor = conn.cursor()

    # Verify trial_locations table exists
    cursor.execute(
        "SELECT name FROM sqlite_master WHERE type='table' AND name='trial_locations'"
    )
    if not cursor.fetchone():
        print("Error: trial_locations table does not exist. Run migration first:")
        print("  python migrations/0002_add_trial_locations.py")
        conn.close()
        return

    # Get all NCT IDs
    cursor.execute("SELECT nct_id FROM trials")
    nct_ids = [row["nct_id"] for row in cursor.fetchall()]
    total = len(nct_ids)
    print(f"Found {total} trials to enrich")

    stats = {"status_updated": 0, "locations_added": 0, "api_errors": 0, "not_found": 0}

    for i, nct_id in enumerate(nct_ids):
        study = fetch_study(nct_id)

        if study is None:
            stats["not_found"] += 1
            cursor.execute("UPDATE trials SET status = ? WHERE nct_id = ?", ("Unknown", nct_id))
        else:
            # Update status
            status = extract_status(study)
            cursor.execute("UPDATE trials SET status = ? WHERE nct_id = ?", (status, nct_id))
            stats["status_updated"] += 1

            # Insert locations (delete first for idempotency)
            cursor.execute("DELETE FROM trial_locations WHERE nct_id = ?", (nct_id,))
            locations = extract_locations(study)
            for loc in locations:
                cursor.execute(
                    """INSERT INTO trial_locations
                       (nct_id, facility_name, city, state, country, zip, latitude, longitude)
                       VALUES (?, ?, ?, ?, ?, ?, ?, ?)""",
                    (
                        nct_id,
                        loc["facility_name"],
                        loc["city"],
                        loc["state"],
                        loc["country"],
                        loc["zip"],
                        loc["latitude"],
                        loc["longitude"],
                    ),
                )
                stats["locations_added"] += 1

        # Batch commit and progress
        if (i + 1) % BATCH_SIZE == 0 or (i + 1) == total:
            conn.commit()
            print(f"  Enriched {i + 1}/{total} trials...")

        time.sleep(REQUEST_DELAY)

    conn.close()

    print(f"\nDone! Summary:")
    print(f"  Status updated: {stats['status_updated']}")
    print(f"  Locations added: {stats['locations_added']}")
    print(f"  Not found (404): {stats['not_found']}")


if __name__ == "__main__":
    enrich()
