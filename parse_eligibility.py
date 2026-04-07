"""
Parse free-text eligibility criteria from ClinicalTrials.gov trials into
structured constraints compatible with the SMT matcher.

Usage:
    python parse_eligibility.py --trial NCT12345678    # Parse one trial
    python parse_eligibility.py --batch                 # Parse all unparsed API trials
    python parse_eligibility.py --batch --limit 50      # Parse up to 50
    python parse_eligibility.py --batch --force          # Re-parse already-parsed trials
"""

from __future__ import annotations

import argparse
import json
import logging
import os
import re
import sqlite3
import time
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple

from dotenv import load_dotenv

load_dotenv()

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s  %(message)s",
    datefmt="%H:%M:%S",
)
log = logging.getLogger(__name__)

DB_PATH = Path(__file__).with_name("trial_data.sqlite")
REQUEST_DELAY = 0.5  # seconds between LLM calls


# ---------------------------------------------------------------------------
# Data model
# ---------------------------------------------------------------------------

@dataclass(frozen=True)
class LabRequirement:
    name: str
    operator: str  # >=, <=, >, <, ==, range
    value: float
    value_max: Optional[float] = None  # for range


@dataclass(frozen=True)
class ParsedEligibility:
    nct_id: str
    age_min: Optional[int] = None
    age_max: Optional[int] = None
    sex: Optional[str] = None  # "all", "male", "female"
    required_conditions: Tuple[str, ...] = ()
    excluded_conditions: Tuple[str, ...] = ()
    required_treatments: Tuple[str, ...] = ()
    excluded_treatments: Tuple[str, ...] = ()
    lab_requirements: Tuple[LabRequirement, ...] = ()
    other_inclusion: Tuple[str, ...] = ()
    other_exclusion: Tuple[str, ...] = ()
    parse_success: bool = True
    parse_error: str = ""


# ---------------------------------------------------------------------------
# Rule-based pre-extraction (fast, no LLM needed)
# ---------------------------------------------------------------------------

def _extract_age_range(text: str) -> Tuple[Optional[int], Optional[int]]:
    """Extract age min/max from eligibility text using regex."""
    age_min, age_max = None, None

    # "18 years and older" / "≥18 years" / "at least 18 years"
    m = re.search(r'(?:≥|>=|at least|minimum)\s*(\d{1,3})\s*years?', text, re.I)
    if m:
        age_min = int(m.group(1))

    # "18 years to 65 years" / "18-65 years"
    m = re.search(r'(\d{1,3})\s*(?:years?)?\s*(?:to|-)\s*(\d{1,3})\s*years?', text, re.I)
    if m:
        age_min = int(m.group(1))
        age_max = int(m.group(2))

    # "65 years and younger" / "≤65"
    m = re.search(r'(?:≤|<=|no older than|maximum|up to)\s*(\d{1,3})\s*years?', text, re.I)
    if m:
        age_max = int(m.group(1))

    # "18 years old" without other context → min age
    if age_min is None:
        m = re.search(r'(\d{1,3})\s*years?\s*(?:of age|old)', text, re.I)
        if m:
            val = int(m.group(1))
            if 10 <= val <= 100:
                age_min = val

    return age_min, age_max


def _extract_sex(text: str) -> Optional[str]:
    """Extract sex requirement from eligibility text."""
    lower = text.lower()
    if 'male only' in lower or 'men only' in lower:
        return 'male'
    if 'female only' in lower or 'women only' in lower:
        return 'female'
    return 'all'


# ---------------------------------------------------------------------------
# LLM-based extraction
# ---------------------------------------------------------------------------

_EXTRACTION_PROMPT = """You are a clinical trial eligibility parser. Extract structured criteria from the following eligibility text.

Return ONLY valid JSON with these keys (use empty lists [] when not applicable, null when unknown):
{{
  "age_min": <integer or null>,
  "age_max": <integer or null>,
  "sex": <"all" | "male" | "female">,
  "required_conditions": ["condition1", "condition2"],
  "excluded_conditions": ["condition1"],
  "required_treatments": ["treatment1"],
  "excluded_treatments": ["treatment1"],
  "lab_requirements": [
    {{"name": "ECOG performance status", "operator": "<=", "value": 1}},
    {{"name": "eGFR", "operator": ">=", "value": 30}}
  ],
  "other_inclusion": ["criterion text that doesn't fit above categories"],
  "other_exclusion": ["criterion text that doesn't fit above categories"]
}}

Rules:
- For age: extract numeric values only. "18 years and older" → age_min: 18
- For conditions: use standard medical terminology. Include the primary condition the trial is studying.
- For lab_requirements: only extract criteria with explicit numeric thresholds.
- For other_inclusion/other_exclusion: include criteria that don't fit neatly into the other categories.
- Keep entries concise (under 20 words each).
- Do NOT invent criteria not stated in the text.

Eligibility text:
\"\"\"
{eligibility_text}
\"\"\"
"""


def _call_llm(eligibility_text: str) -> Optional[Dict[str, Any]]:
    """Call Azure OpenAI to parse eligibility text into structured JSON."""
    try:
        from openai import AzureOpenAI
    except ImportError:
        log.warning("openai package not installed — using rule-based extraction only")
        return None

    api_key = os.getenv("AZURE_OPENAI_API_KEY")
    endpoint = os.getenv("AZURE_OPENAI_ENDPOINT")
    if not api_key or not endpoint:
        log.warning("Azure OpenAI credentials not configured — using rule-based extraction only")
        return None

    client = AzureOpenAI(
        api_key=api_key,
        api_version=os.getenv("AZURE_OPENAI_API_VERSION", "2024-02-15-preview"),
        azure_endpoint=endpoint,
    )
    deployment = os.getenv("AZURE_OPENAI_DEPLOYMENT_NAME", "gpt-4.1")

    prompt = _EXTRACTION_PROMPT.format(eligibility_text=eligibility_text[:3000])

    try:
        resp = client.chat.completions.create(
            model=deployment,
            messages=[
                {"role": "system", "content": "You extract structured clinical trial eligibility criteria. Return only valid JSON."},
                {"role": "user", "content": prompt},
            ],
            max_tokens=800,
            temperature=0.1,
        )
        raw = resp.choices[0].message.content.strip()
        # Strip markdown code fences if present
        if raw.startswith("```"):
            raw = re.sub(r'^```\w*\n?', '', raw)
            raw = re.sub(r'\n?```$', '', raw)
        return json.loads(raw)
    except json.JSONDecodeError as exc:
        log.warning("LLM returned invalid JSON: %s", exc)
        return None
    except Exception as exc:
        log.warning("LLM call failed: %s", exc)
        return None


# ---------------------------------------------------------------------------
# Parsing orchestrator
# ---------------------------------------------------------------------------

def parse_eligibility(nct_id: str, eligibility_text: str) -> ParsedEligibility:
    """Parse eligibility text into structured criteria using rules + LLM."""
    if not eligibility_text or not eligibility_text.strip():
        return ParsedEligibility(
            nct_id=nct_id,
            parse_success=False,
            parse_error="No eligibility text available",
        )

    # Step 1: Rule-based extraction for age and sex (fast, reliable)
    rule_age_min, rule_age_max = _extract_age_range(eligibility_text)
    rule_sex = _extract_sex(eligibility_text)

    # Step 2: LLM extraction for complex criteria
    llm_data = _call_llm(eligibility_text)

    if llm_data is None:
        # LLM unavailable — return what rules extracted
        return ParsedEligibility(
            nct_id=nct_id,
            age_min=rule_age_min,
            age_max=rule_age_max,
            sex=rule_sex,
            other_inclusion=("See full eligibility text",),
            parse_success=True,
            parse_error="LLM unavailable — partial extraction only",
        )

    # Step 3: Merge — prefer rule-based for age (more reliable), LLM for everything else
    age_min = rule_age_min or llm_data.get('age_min')
    age_max = rule_age_max or llm_data.get('age_max')
    sex = rule_sex if rule_sex != 'all' else (llm_data.get('sex') or 'all')

    # Parse lab requirements
    lab_reqs = []
    for lab in llm_data.get('lab_requirements', []):
        if isinstance(lab, dict) and 'name' in lab and 'value' in lab:
            try:
                lab_reqs.append(LabRequirement(
                    name=str(lab['name']),
                    operator=str(lab.get('operator', '<=')),
                    value=float(lab['value']),
                    value_max=float(lab['value_max']) if lab.get('value_max') else None,
                ))
            except (ValueError, TypeError):
                pass

    return ParsedEligibility(
        nct_id=nct_id,
        age_min=int(age_min) if age_min else None,
        age_max=int(age_max) if age_max else None,
        sex=str(sex).lower() if sex else 'all',
        required_conditions=tuple(str(c) for c in llm_data.get('required_conditions', [])),
        excluded_conditions=tuple(str(c) for c in llm_data.get('excluded_conditions', [])),
        required_treatments=tuple(str(t) for t in llm_data.get('required_treatments', [])),
        excluded_treatments=tuple(str(t) for t in llm_data.get('excluded_treatments', [])),
        lab_requirements=tuple(lab_reqs),
        other_inclusion=tuple(str(c) for c in llm_data.get('other_inclusion', [])),
        other_exclusion=tuple(str(c) for c in llm_data.get('other_exclusion', [])),
        parse_success=True,
    )


# ---------------------------------------------------------------------------
# Database operations
# ---------------------------------------------------------------------------

def _condition_to_criterion_type(condition: str) -> str:
    """Convert a condition name to the SIGIR-style criterion_type format."""
    normalized = condition.lower().strip()
    normalized = re.sub(r'[^a-z0-9\s]', '', normalized)
    normalized = normalized.replace(' ', '_')
    return f"patient_has_diagnosis_of_{normalized}_now"


def _treatment_to_criterion_type(treatment: str) -> str:
    """Convert a treatment name to criterion_type format."""
    normalized = treatment.lower().strip()
    normalized = re.sub(r'[^a-z0-9\s]', '', normalized)
    normalized = normalized.replace(' ', '_')
    return f"patient_has_treatment_of_{normalized}_inthehistory"


def _lab_to_criterion_type(lab: LabRequirement) -> str:
    """Convert a lab requirement to criterion_type format."""
    normalized = lab.name.lower().strip()
    normalized = re.sub(r'[^a-z0-9\s]', '', normalized)
    normalized = normalized.replace(' ', '_')
    return f"patient_{normalized}_value_recorded_now"


def store_parsed_criteria(
    conn: sqlite3.Connection,
    parsed: ParsedEligibility,
) -> int:
    """Store parsed eligibility as structured criteria rows. Returns count of rows inserted."""
    cursor = conn.cursor()

    # Clear existing parsed criteria for this trial (to allow re-parsing)
    cursor.execute(
        "DELETE FROM criteria WHERE nct_id = ? AND source = 'parsed_eligibility'",
        (parsed.nct_id,),
    )

    rows_inserted = 0

    def _insert(criterion_type: str, value: str, value_type: str,
                comparison: str, is_inclusion: bool, hard: bool) -> None:
        nonlocal rows_inserted
        cursor.execute("""
            INSERT INTO criteria
            (nct_id, criterion_type, criterion_value, value_type, comparison,
             source, is_inclusion, hard_constraint)
            VALUES (?, ?, ?, ?, ?, 'parsed_eligibility', ?, ?)
        """, (parsed.nct_id, criterion_type, value, value_type,
              comparison, is_inclusion, hard))
        rows_inserted += 1

    # Age constraints
    if parsed.age_min is not None:
        _insert(
            "patient_age_value_recorded_now_in_years",
            str(parsed.age_min), "int", ">=", True, True,
        )
    if parsed.age_max is not None:
        _insert(
            "patient_age_value_recorded_now_in_years",
            str(parsed.age_max), "int", "<=", True, True,
        )

    # Sex constraint
    if parsed.sex and parsed.sex != 'all':
        _insert(
            "patient_sex_is_male_now",
            "true" if parsed.sex == 'male' else "false",
            "bool", "equals", True, True,
        )

    # Required conditions (inclusion)
    for condition in parsed.required_conditions:
        _insert(
            _condition_to_criterion_type(condition),
            "true", "bool", "equals", True, True,
        )

    # Excluded conditions (exclusion)
    for condition in parsed.excluded_conditions:
        _insert(
            _condition_to_criterion_type(condition),
            "false", "bool", "equals", False, True,
        )

    # Required treatments
    for treatment in parsed.required_treatments:
        _insert(
            _treatment_to_criterion_type(treatment),
            "true", "bool", "equals", True, False,
        )

    # Excluded treatments
    for treatment in parsed.excluded_treatments:
        _insert(
            _treatment_to_criterion_type(treatment),
            "false", "bool", "equals", False, True,
        )

    # Lab requirements
    for lab in parsed.lab_requirements:
        _insert(
            _lab_to_criterion_type(lab),
            str(lab.value), "int", lab.operator, True, True,
        )

    # Other inclusion criteria (free text — for LLM evaluation at match time)
    for text in parsed.other_inclusion:
        _insert(
            f"other_inclusion_{rows_inserted}",
            text, "text", "text_match", True, False,
        )

    # Other exclusion criteria (free text)
    for text in parsed.other_exclusion:
        _insert(
            f"other_exclusion_{rows_inserted}",
            text, "text", "text_match", False, True,
        )

    return rows_inserted


# ---------------------------------------------------------------------------
# Batch processing
# ---------------------------------------------------------------------------

def get_unparsed_trials(
    conn: sqlite3.Connection,
    force: bool = False,
    limit: Optional[int] = None,
) -> List[Tuple[str, str]]:
    """Get trials that need eligibility parsing."""
    cursor = conn.cursor()

    if force:
        query = """
            SELECT nct_id, eligibility_text FROM trials
            WHERE source = 'ctgov_api'
              AND eligibility_text IS NOT NULL
              AND eligibility_text != ''
        """
    else:
        query = """
            SELECT t.nct_id, t.eligibility_text FROM trials t
            WHERE t.source = 'ctgov_api'
              AND t.eligibility_text IS NOT NULL
              AND t.eligibility_text != ''
              AND t.nct_id NOT IN (
                  SELECT DISTINCT nct_id FROM criteria
                  WHERE source = 'parsed_eligibility'
              )
        """

    if limit:
        query += f" LIMIT {limit}"

    cursor.execute(query)
    return [(row[0], row[1]) for row in cursor.fetchall()]


def process_trial(
    conn: sqlite3.Connection,
    nct_id: str,
    eligibility_text: str,
) -> ParsedEligibility:
    """Parse and store criteria for a single trial."""
    parsed = parse_eligibility(nct_id, eligibility_text)

    if parsed.parse_success:
        count = store_parsed_criteria(conn, parsed)
        log.info("  %s: %d criteria extracted", nct_id, count)
    else:
        log.warning("  %s: parse failed — %s", nct_id, parsed.parse_error)

    return parsed


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def main() -> None:
    parser = argparse.ArgumentParser(
        description="Parse eligibility text into structured criteria",
    )
    parser.add_argument(
        "--trial", type=str, default=None,
        help="Parse a single trial by NCT ID",
    )
    parser.add_argument(
        "--batch", action="store_true",
        help="Parse all unparsed API-sourced trials",
    )
    parser.add_argument(
        "--force", action="store_true",
        help="Re-parse trials that already have parsed criteria",
    )
    parser.add_argument(
        "--limit", type=int, default=None,
        help="Max number of trials to process in batch mode",
    )
    parser.add_argument(
        "--db", type=Path, default=DB_PATH,
        help="Path to SQLite database",
    )
    args = parser.parse_args()

    conn = sqlite3.connect(args.db)
    conn.execute("PRAGMA journal_mode=WAL")

    if args.trial:
        cursor = conn.cursor()
        cursor.execute(
            "SELECT eligibility_text FROM trials WHERE nct_id = ?",
            (args.trial,),
        )
        row = cursor.fetchone()
        if not row:
            log.error("Trial %s not found in database", args.trial)
            conn.close()
            return

        log.info("Parsing eligibility for %s...", args.trial)
        parsed = process_trial(conn, args.trial, row[0] or "")
        conn.commit()

        # Print the parsed result
        log.info("")
        log.info("Parsed result:")
        log.info("  Age: %s - %s", parsed.age_min, parsed.age_max)
        log.info("  Sex: %s", parsed.sex)
        log.info("  Required conditions: %s", parsed.required_conditions)
        log.info("  Excluded conditions: %s", parsed.excluded_conditions)
        log.info("  Required treatments: %s", parsed.required_treatments)
        log.info("  Excluded treatments: %s", parsed.excluded_treatments)
        log.info("  Lab requirements: %s",
                 [(l.name, l.operator, l.value) for l in parsed.lab_requirements])
        log.info("  Other inclusion: %s", parsed.other_inclusion)
        log.info("  Other exclusion: %s", parsed.other_exclusion)

    elif args.batch:
        trials = get_unparsed_trials(conn, force=args.force, limit=args.limit)
        log.info("Found %d trials to parse", len(trials))

        stats = {"success": 0, "failed": 0, "total_criteria": 0}

        for idx, (nct_id, elig_text) in enumerate(trials, 1):
            log.info("[%d/%d] %s", idx, len(trials), nct_id)
            parsed = process_trial(conn, nct_id, elig_text)

            if parsed.parse_success:
                stats["success"] += 1
            else:
                stats["failed"] += 1

            # Commit every 10 trials
            if idx % 10 == 0:
                conn.commit()

            time.sleep(REQUEST_DELAY)

        conn.commit()

        # Count total parsed criteria
        cursor = conn.cursor()
        cursor.execute(
            "SELECT COUNT(*) FROM criteria WHERE source = 'parsed_eligibility'"
        )
        stats["total_criteria"] = cursor.fetchone()[0]

        log.info("")
        log.info("=" * 50)
        log.info("Batch parsing complete!")
        log.info("  Processed: %d", len(trials))
        log.info("  Success:   %d", stats["success"])
        log.info("  Failed:    %d", stats["failed"])
        log.info("  Total parsed criteria in DB: %d", stats["total_criteria"])

    else:
        parser.print_help()

    conn.close()


if __name__ == "__main__":
    main()
