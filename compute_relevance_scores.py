"""
Compute trial relevance scores and store them in the database.
Runs at ingestion time and as a backfill for existing trials.

Usage:
    python compute_relevance_scores.py              # Backfill all trials
    python compute_relevance_scores.py --trial NCT123  # Single trial
"""

from __future__ import annotations

import argparse
import logging
import re
import sqlite3
from pathlib import Path
from typing import Dict, List, Optional, Tuple

logging.basicConfig(level=logging.INFO, format="%(asctime)s  %(message)s", datefmt="%H:%M:%S")
log = logging.getLogger(__name__)

DB_PATH = Path(__file__).with_name("trial_data.sqlite")

# Intervention types that indicate a treatment trial
_TREATMENT_INTERVENTIONS = {"DRUG", "DEVICE", "PROCEDURE", "BIOLOGICAL", "RADIATION", "COMBINATION_PRODUCT"}
_LIFESTYLE_INTERVENTIONS = {"BEHAVIORAL", "DIETARY_SUPPLEMENT"}
_OBSERVATIONAL_INTERVENTIONS = {"OTHER", "DIAGNOSTIC_TEST"}


def _parse_intervention_type(drugs_field: str) -> str:
    """Classify the trial's intervention from the drugs/interventions text."""
    if not drugs_field:
        return "none"
    upper = drugs_field.upper()
    if any(t in upper for t in ("DRUG:", "BIOLOGICAL:", "RADIATION:", "DEVICE:", "PROCEDURE:", "COMBINATION")):
        return "treatment"
    if any(t in upper for t in ("BEHAVIORAL:", "DIETARY")):
        return "lifestyle"
    if any(t in upper for t in ("OTHER:", "DIAGNOSTIC")):
        return "observational"
    # Has some text but can't classify — assume treatment if it mentions drug-like terms
    if any(w in upper for w in ("THERAPY", "INHIBITOR", "ANTIBODY", "VACCINE", "INFUSION")):
        return "treatment"
    return "observational"


def compute_relevance(
    patient_condition: str,
    trial_diseases: str,
    trial_title: str,
    trial_drugs: str,
) -> Dict[str, float]:
    """Compute the four relevance components for a trial-condition pair.

    Returns dict with component scores and the final trial_relevance.
    """
    condition_lower = patient_condition.lower().strip() if patient_condition else ""

    # --- (a) Condition count ---
    diseases_list = [d.strip() for d in (trial_diseases or "").split(",") if d.strip()]
    n = len(diseases_list)
    if n <= 1:
        condition_count_score = 1.0
    elif n <= 3:
        condition_count_score = 0.7
    else:
        condition_count_score = 0.3

    # --- (b) Condition position ---
    condition_position_score = 0.0
    if condition_lower and diseases_list:
        for i, disease in enumerate(diseases_list):
            if condition_lower in disease.lower() or disease.lower() in condition_lower:
                if i == 0:
                    condition_position_score = 1.0
                elif i <= 2:
                    condition_position_score = 0.6
                else:
                    condition_position_score = 0.2
                break
        # Check for partial keyword matches (e.g., "brain" in "Brain Neoplasms")
        if condition_position_score == 0.0:
            cond_words = set(condition_lower.split())
            for i, disease in enumerate(diseases_list):
                disease_words = set(disease.lower().split())
                if cond_words & disease_words:
                    if i == 0:
                        condition_position_score = 0.8
                    elif i <= 2:
                        condition_position_score = 0.5
                    else:
                        condition_position_score = 0.15
                    break

    # --- (c) Intervention relevance ---
    intervention_type = _parse_intervention_type(trial_drugs or "")
    intervention_scores = {
        "treatment": 1.0,
        "lifestyle": 0.7,
        "observational": 0.3,
        "none": 0.1,
    }
    intervention_score = intervention_scores.get(intervention_type, 0.3)

    # --- (d) Title match ---
    title_lower = (trial_title or "").lower()
    if condition_lower and condition_lower in title_lower:
        title_match_score = 1.0
    elif condition_lower:
        # Check individual words
        cond_words = set(condition_lower.split())
        title_words = set(title_lower.split())
        overlap = cond_words & title_words - {"of", "the", "and", "for", "in", "a", "an"}
        if overlap and len(overlap) >= len(cond_words) * 0.5:
            title_match_score = 0.8
        elif overlap:
            title_match_score = 0.5
        else:
            title_match_score = 0.3
    else:
        title_match_score = 0.5

    # Weighted average
    trial_relevance = (
        0.20 * condition_count_score
        + 0.30 * condition_position_score
        + 0.25 * intervention_score
        + 0.25 * title_match_score
    )

    return {
        "condition_count_score": round(condition_count_score, 3),
        "condition_position_score": round(condition_position_score, 3),
        "intervention_score": round(intervention_score, 3),
        "title_match_score": round(title_match_score, 3),
        "trial_relevance": round(trial_relevance, 3),
    }


def _ensure_columns(conn: sqlite3.Connection, table: str) -> None:
    """Add trial_relevance column if it doesn't exist."""
    existing = {row[1] for row in conn.execute(f"PRAGMA table_info({table})").fetchall()}
    if "trial_relevance" not in existing:
        conn.execute(f"ALTER TABLE {table} ADD COLUMN trial_relevance REAL")
        log.info("Added trial_relevance column to %s", table)
        conn.commit()


def backfill_table(
    conn: sqlite3.Connection,
    table: str,
    condition_col: str = "diseases",
    nct_filter: Optional[str] = None,
) -> int:
    """Compute and store relevance scores for all trials in a table.

    Since we don't know the patient's condition at ingestion time, we compute
    a "self-relevance" score: how focused is this trial on its OWN primary condition?
    This measures trial quality/specificity, not patient match.
    """
    _ensure_columns(conn, table)
    cursor = conn.cursor()

    if nct_filter:
        cursor.execute(
            f"SELECT nct_id, {condition_col}, title, drugs FROM {table} WHERE nct_id = ?",
            (nct_filter,),
        )
    else:
        cursor.execute(f"SELECT nct_id, {condition_col}, title, drugs FROM {table}")

    rows = cursor.fetchall()
    updated = 0

    for row in rows:
        nct_id, diseases, title, drugs = row
        # Use the FIRST listed disease as the "condition" for self-relevance
        first_disease = ""
        if diseases:
            parts = [d.strip() for d in diseases.split(",") if d.strip()]
            first_disease = parts[0] if parts else ""

        scores = compute_relevance(first_disease, diseases, title, drugs)

        cursor.execute(
            f"UPDATE {table} SET trial_relevance = ? WHERE nct_id = ?",
            (scores["trial_relevance"], nct_id),
        )
        updated += 1

    conn.commit()
    return updated


def main() -> None:
    parser = argparse.ArgumentParser(description="Compute trial relevance scores")
    parser.add_argument("--trial", type=str, help="Single NCT ID to compute")
    parser.add_argument("--db", type=Path, default=DB_PATH)
    args = parser.parse_args()

    conn = sqlite3.connect(args.db)

    # Backfill SIGIR trials table
    log.info("Computing relevance scores for SIGIR trials...")
    n1 = backfill_table(conn, "trials", nct_filter=args.trial)
    log.info("  Updated %d trials", n1)

    # Backfill ct_gov_trials table
    try:
        conn.execute("SELECT 1 FROM ct_gov_trials LIMIT 1")
        log.info("Computing relevance scores for ct_gov_trials...")
        n2 = backfill_table(conn, "ct_gov_trials", nct_filter=args.trial)
        log.info("  Updated %d trials", n2)
    except Exception:
        log.info("No ct_gov_trials table found — skipping")

    conn.close()
    log.info("Done.")


if __name__ == "__main__":
    main()
