"""
Parse ct_gov_trials eligibility text into structured criteria
for the SMT matcher.

Extracts:
  - Age (from API min_age/max_age fields + text patterns)
  - Sex (from API sex field)
  - ECOG/KPS performance status
  - Lab values (hemoglobin, ANC, platelets, creatinine, eGFR, bilirubin)
  - Binary criteria (pregnancy, diagnosis, prior treatment, infection)
  - Free-text criteria (for LLM evaluation at match time)

Usage:
    python parse_ct_gov_eligibility.py --all
    python parse_ct_gov_eligibility.py --trial NCT12345678
"""

from __future__ import annotations

import argparse
import logging
import re
import sqlite3
import time
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, List, Optional, Tuple

logging.basicConfig(level=logging.INFO, format="%(asctime)s  %(message)s", datefmt="%H:%M:%S")
log = logging.getLogger(__name__)

DB_PATH = Path(__file__).with_name("trial_data.sqlite")
SOURCE_TAG = "ct_gov_parsed"


# ---------------------------------------------------------------------------
# Parsed criterion
# ---------------------------------------------------------------------------

@dataclass
class ParsedCriterion:
    nct_id: str
    criterion_type: str
    criterion_value: str
    value_type: str        # bool, int, float, text
    comparison: str        # ==, >=, <=, >, <, text_match
    is_inclusion: bool
    hard_constraint: bool


# ---------------------------------------------------------------------------
# Age / sex from API fields
# ---------------------------------------------------------------------------

def _parse_api_age(min_age: Optional[str], max_age: Optional[str]) -> List[ParsedCriterion]:
    """Parse min_age/max_age strings like '18 Years' into criteria."""
    results = []
    for field_val, op in [(min_age, ">="), (max_age, "<=")]:
        if not field_val:
            continue
        m = re.match(r"(\d+)\s*(years?|months?)?", field_val, re.I)
        if m:
            val = int(m.group(1))
            unit = (m.group(2) or "years").lower()
            if "month" in unit:
                val = max(1, val // 12)  # convert months to years
            results.append(ParsedCriterion(
                nct_id="", criterion_type="patient_age_value_recorded_now_in_years",
                criterion_value=str(val), value_type="int", comparison=op,
                is_inclusion=True, hard_constraint=True,
            ))
    return results


def _parse_api_sex(sex: Optional[str]) -> List[ParsedCriterion]:
    """Parse sex field like 'FEMALE', 'MALE', 'ALL'."""
    if not sex or sex.upper() == "ALL":
        return []
    if sex.upper() == "FEMALE":
        return [ParsedCriterion(
            nct_id="", criterion_type="patient_sex_is_male_now",
            criterion_value="false", value_type="bool", comparison="equals",
            is_inclusion=True, hard_constraint=True,
        )]
    if sex.upper() == "MALE":
        return [ParsedCriterion(
            nct_id="", criterion_type="patient_sex_is_male_now",
            criterion_value="true", value_type="bool", comparison="equals",
            is_inclusion=True, hard_constraint=True,
        )]
    return []


# ---------------------------------------------------------------------------
# Regex patterns for numeric criteria
# ---------------------------------------------------------------------------

_NUMERIC_PATTERNS: List[Tuple[re.Pattern, str, str]] = [
    # ECOG performance status (various formats)
    (re.compile(r"(?:ECOG|Eastern\s+Cooperative[^)]*\))\s*(?:performance\s+status\s*)?(?:of\s+|:?\s*)(\d)\s*[-–]\s*(\d)", re.I),
     "patient_ecog_performance_status_value_recorded_now", "<="),
    (re.compile(r"ECOG\s*(?:\([^)]*\))?\s*(?:performance\s+status\s*)?(?:of\s+|:?\s*)(?:≤|<=)\s*(\d)", re.I),
     "patient_ecog_performance_status_value_recorded_now", "<="),
    (re.compile(r"performance\s+status\s+(?:of\s+)?(\d)\s*[-–]\s*(\d)", re.I),
     "patient_ecog_performance_status_value_recorded_now", "<="),

    # KPS / Karnofsky
    (re.compile(r"(?:KPS|Karnofsky)\s*(?:performance\s+status\s*)?(?:≥|>=|of at least|at least)\s*(\d+)", re.I),
     "patient_karnofsky_performance_status_value_recorded_now", ">="),

    # WHO performance status
    (re.compile(r"WHO\s+performance\s+status\s+(?:of\s+)?(\d)\s*[-–]\s*(\d)", re.I),
     "patient_ecog_performance_status_value_recorded_now", "<="),

    # eGFR / creatinine clearance
    (re.compile(r"(?:eGFR|GFR|creatinine\s+clearance(?:\s+rate)?)\s*(?:≥|>=|>|of at least)\s*(\d+)", re.I),
     "patient_glomerular_filtration_rate_value_recorded_now", ">="),

    # Hemoglobin
    (re.compile(r"[Hh](?:ae)?moglobin\s*(?:\(Hb\))?\s*[:.]?\s*(?:≥|>=)\s*([\d.]+)\s*(?:g/[dD]L)?", re.I),
     "patient_hemoglobin_value_recorded_now", ">="),

    # ANC / absolute neutrophil count
    (re.compile(r"(?:absolute\s+)?neutrophil\s+count\s*(?:ANC)?\s*(?:≥|>=)\s*([\d.,]+)", re.I),
     "patient_absolute_neutrophil_count_value_recorded_now", ">="),

    # Platelet count
    (re.compile(r"[Pp]latelet\s+count\s*(?:≥|>=)\s*([\d.,]+)", re.I),
     "patient_platelet_count_value_recorded_now", ">="),

    # Bilirubin
    (re.compile(r"(?:total\s+)?[Bb]ilirubin\s*(?:≤|<=)\s*([\d.]+)\s*(?:×|x|times)?\s*(?:ULN)?", re.I),
     "patient_serum_bilirubin_value_recorded_now", "<="),

    # ALT/AST
    (re.compile(r"(?:ALT|AST|alanine|aspartate)\s*(?:and\s+(?:ALT|AST))?\s*(?:≤|<=|<)\s*([\d.]+)\s*(?:×|x|times)?\s*(?:ULN)?", re.I),
     "patient_liver_enzyme_value_recorded_now", "<="),
]


def _extract_numeric_criteria(text: str) -> List[Tuple[str, str, str]]:
    """Extract numeric criteria from eligibility text.

    Returns list of (criterion_type, value, comparison).
    """
    results = []
    for pattern, attr, default_op in _NUMERIC_PATTERNS:
        m = pattern.search(text)
        if m:
            groups = m.groups()
            if len(groups) >= 2 and groups[1]:
                # Range pattern like "0-2" → use the max value with <=
                val = groups[1]
                op = "<="
            else:
                val = groups[0]
                op = default_op
            # Clean up value (remove commas, etc.)
            val = val.replace(",", "").strip()
            try:
                float(val)  # validate it's a number
                results.append((attr, val, op))
            except ValueError:
                pass
    return results


# ---------------------------------------------------------------------------
# Binary criteria patterns
# ---------------------------------------------------------------------------

_PREGNANCY_PATTERNS = [
    re.compile(r"(?:pregnant|pregnancy|breastfeeding|lactating|nursing)", re.I),
]

_INFECTION_PATTERNS = [
    re.compile(r"active\s+(?:systemic\s+)?infection", re.I),
    re.compile(r"infection\s+requiring\s+(?:IV|intravenous)\s+antibiotics", re.I),
]

_DIAGNOSIS_PATTERNS = [
    re.compile(r"(?:histologically|pathologically|cytologically)\s+(?:confirmed|proven|documented)\s+(.+?)(?:\.|$|\n)", re.I),
]

_PRIOR_TREATMENT_PATTERNS = [
    re.compile(r"(?:prior|previous)\s+(?:treatment|therapy)\s+with\s+(.+?)(?:\.|$|\n)", re.I),
    re.compile(r"(?:prior|previous)\s+(.+?)\s+(?:therapy|treatment|chemotherapy|radiotherapy)", re.I),
]


def _extract_binary_criteria(
    inclusion_lines: List[str],
    exclusion_lines: List[str],
) -> List[Tuple[str, str, bool, bool]]:
    """Extract binary criteria from split inclusion/exclusion lines.

    Returns list of (criterion_type, value, is_inclusion, hard_constraint).
    """
    results = []

    # Pregnancy (usually in exclusions)
    for line in exclusion_lines:
        for pat in _PREGNANCY_PATTERNS:
            if pat.search(line):
                results.append(("patient_is_pregnant_now", "false", False, True))
                break

    # Active infection (usually in exclusions)
    for line in exclusion_lines:
        for pat in _INFECTION_PATTERNS:
            if pat.search(line):
                results.append(("patient_has_active_infection_now", "false", False, True))
                break

    # Confirmed diagnosis (in inclusions)
    for line in inclusion_lines:
        for pat in _DIAGNOSIS_PATTERNS:
            m = pat.search(line)
            if m:
                disease = m.group(1).strip().rstrip('.,;')
                # Normalize to criterion format
                disease_key = re.sub(r'[^a-z0-9\s]', '', disease.lower())
                disease_key = disease_key.replace(' ', '_')[:80]
                if disease_key and len(disease_key) > 3:
                    results.append((
                        f"patient_has_diagnosis_of_{disease_key}_now",
                        "true", True, True,
                    ))
                break

    # Prior treatment (check both inclusion and exclusion)
    for line in exclusion_lines:
        for pat in _PRIOR_TREATMENT_PATTERNS:
            m = pat.search(line)
            if m:
                treatment = m.group(1).strip().rstrip('.,;')
                treatment_key = re.sub(r'[^a-z0-9\s]', '', treatment.lower())
                treatment_key = treatment_key.replace(' ', '_')[:60]
                if treatment_key and len(treatment_key) > 3:
                    results.append((
                        f"patient_has_treatment_of_{treatment_key}_inthehistory",
                        "false", False, True,
                    ))
                break

    return results


# ---------------------------------------------------------------------------
# Free-text criteria (for LLM evaluation)
# ---------------------------------------------------------------------------

_SKIP_FREE_TEXT = [
    "informed consent", "written consent", "willing to comply",
    "capable of co-operating", "agree to", "must agree",
    "lifestyle restrictions", "follow up", "follow-up",
    "donate eggs", "donate sperm", "contraception",
    "condom", "childbearing potential",
]


def _should_skip_free_text(line: str) -> bool:
    """Skip administrative/procedural criteria that aren't medically relevant."""
    lower = line.lower()
    return any(skip in lower for skip in _SKIP_FREE_TEXT) or len(line) < 10


def _extract_free_text_criteria(
    inclusion_lines: List[str],
    exclusion_lines: List[str],
    already_extracted: set,
) -> List[Tuple[str, str, bool]]:
    """Extract remaining criteria as free text for LLM evaluation.

    Returns list of (text, is_inclusion, hard_constraint).
    Only includes criteria not already captured by numeric/binary parsers.
    """
    results = []

    for line in inclusion_lines:
        if _should_skip_free_text(line):
            continue
        # Check if this line was already captured
        lower = line.lower()
        if any(ext in lower for ext in already_extracted):
            continue
        results.append((line.strip(), True, False))

    for line in exclusion_lines:
        if _should_skip_free_text(line):
            continue
        lower = line.lower()
        if any(ext in lower for ext in already_extracted):
            continue
        results.append((line.strip(), False, True))

    return results


# ---------------------------------------------------------------------------
# Text splitting
# ---------------------------------------------------------------------------

def _split_inclusion_exclusion(text: str) -> Tuple[List[str], List[str]]:
    """Split eligibility text into inclusion and exclusion line lists."""
    # Normalize whitespace
    text = text.replace('\r\n', '\n').replace('\r', '\n')

    # Find section headers
    incl_match = re.search(r'(?:^|\n)\s*(?:Key\s+)?Inclusion\s+Criteria\s*:?\s*', text, re.I)
    excl_match = re.search(r'(?:^|\n)\s*(?:Key\s+)?Exclusion\s+Criteria\s*:?\s*', text, re.I)

    if incl_match and excl_match:
        incl_start = incl_match.end()
        excl_start = excl_match.end()
        if incl_start < excl_start:
            incl_text = text[incl_start:excl_match.start()]
            excl_text = text[excl_start:]
        else:
            excl_text = text[excl_start:incl_match.start()]
            incl_text = text[incl_start:]
    elif incl_match:
        incl_text = text[incl_match.end():]
        excl_text = ""
    elif excl_match:
        incl_text = text[:excl_match.start()]
        excl_text = text[excl_match.end():]
    else:
        # No headers — treat everything as inclusion
        incl_text = text
        excl_text = ""

    def _to_lines(block: str) -> List[str]:
        lines = []
        for line in re.split(r'\n(?:\s*[\*\-•]\s*|\s*\d+\.\s*|\n)', block):
            cleaned = line.strip().strip('*-•').strip()
            if cleaned and len(cleaned) > 5:
                lines.append(cleaned)
        return lines

    return _to_lines(incl_text), _to_lines(excl_text)


# ---------------------------------------------------------------------------
# Main parser
# ---------------------------------------------------------------------------

def parse_trial(
    nct_id: str,
    eligibility_text: str,
    min_age: Optional[str],
    max_age: Optional[str],
    sex: Optional[str],
) -> List[ParsedCriterion]:
    """Parse a single trial's eligibility into structured criteria."""
    criteria: List[ParsedCriterion] = []

    # 1. Age from API fields (most reliable)
    for c in _parse_api_age(min_age, max_age):
        c.nct_id = nct_id
        criteria.append(c)

    # 2. Sex from API field
    for c in _parse_api_sex(sex):
        c.nct_id = nct_id
        criteria.append(c)

    if not eligibility_text:
        return criteria

    # 3. Split into inclusion/exclusion sections
    incl_lines, excl_lines = _split_inclusion_exclusion(eligibility_text)

    # 4. Numeric criteria from text
    already_captured: set = set()
    for attr, val, op in _extract_numeric_criteria(eligibility_text):
        # Skip age if already from API
        if "age" in attr and any(c.criterion_type == attr for c in criteria):
            continue
        criteria.append(ParsedCriterion(
            nct_id=nct_id, criterion_type=attr,
            criterion_value=val, value_type="int", comparison=op,
            is_inclusion=True, hard_constraint=True,
        ))
        # Track what we extracted for free-text dedup
        already_captured.add(attr.split("_value_")[0].replace("patient_", "").replace("_", " "))

    # 5. Binary criteria from text
    for attr, val, is_incl, hard in _extract_binary_criteria(incl_lines, excl_lines):
        criteria.append(ParsedCriterion(
            nct_id=nct_id, criterion_type=attr,
            criterion_value=val, value_type="bool", comparison="equals",
            is_inclusion=is_incl, hard_constraint=hard,
        ))
        already_captured.add(attr.replace("patient_", "").replace("_now", "").replace("_", " ")[:20])

    # 6. Free-text criteria (capped at 8 most important)
    free_text = _extract_free_text_criteria(incl_lines, excl_lines, already_captured)
    for i, (text, is_incl, hard) in enumerate(free_text[:8]):
        tag = "inclusion" if is_incl else "exclusion"
        criteria.append(ParsedCriterion(
            nct_id=nct_id,
            criterion_type=f"free_text_{tag}_{i}",
            criterion_value=text[:200],  # cap length
            value_type="text",
            comparison="text_match",
            is_inclusion=is_incl,
            hard_constraint=hard,
        ))

    return criteria


# ---------------------------------------------------------------------------
# Database storage
# ---------------------------------------------------------------------------

def store_criteria(conn: sqlite3.Connection, criteria: List[ParsedCriterion]) -> int:
    """Store parsed criteria in the criteria table. Returns count stored."""
    if not criteria:
        return 0

    cursor = conn.cursor()
    nct_id = criteria[0].nct_id

    # Clear existing parsed criteria for this trial
    cursor.execute(
        "DELETE FROM criteria WHERE nct_id = ? AND source = ?",
        (nct_id, SOURCE_TAG),
    )

    for c in criteria:
        cursor.execute("""
            INSERT INTO criteria
            (nct_id, criterion_type, criterion_value, value_type, comparison,
             source, is_inclusion, hard_constraint)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        """, (
            c.nct_id, c.criterion_type, c.criterion_value, c.value_type,
            c.comparison, SOURCE_TAG, c.is_inclusion, c.hard_constraint,
        ))

    return len(criteria)


# ---------------------------------------------------------------------------
# Batch processing
# ---------------------------------------------------------------------------

def process_all(conn: sqlite3.Connection, limit: Optional[int] = None) -> Dict[str, int]:
    """Parse all ct_gov_trials that haven't been parsed yet."""
    cursor = conn.cursor()

    query = """
        SELECT t.nct_id, t.eligibility_text, t.min_age, t.max_age, t.sex
        FROM ct_gov_trials t
        WHERE t.eligibility_text IS NOT NULL AND t.eligibility_text != ''
        AND t.nct_id NOT IN (
            SELECT DISTINCT nct_id FROM criteria WHERE source = ?
        )
    """
    params = [SOURCE_TAG]
    if limit:
        query += " LIMIT ?"
        params.append(limit)

    cursor.execute(query, params)
    rows = cursor.fetchall()

    stats = {"processed": 0, "total_criteria": 0, "skipped": 0}

    for i, row in enumerate(rows, 1):
        nct_id, elig_text, min_age, max_age, sex = row
        criteria = parse_trial(nct_id, elig_text, min_age, max_age, sex)

        if criteria:
            count = store_criteria(conn, criteria)
            stats["total_criteria"] += count
            stats["processed"] += 1
            if i % 20 == 0:
                conn.commit()
                log.info("  Processed %d/%d trials (%d criteria so far)...",
                         i, len(rows), stats["total_criteria"])
        else:
            stats["skipped"] += 1

    conn.commit()
    return stats


def process_single(conn: sqlite3.Connection, nct_id: str) -> List[ParsedCriterion]:
    """Parse a single trial and show results."""
    cursor = conn.cursor()
    cursor.execute(
        "SELECT eligibility_text, min_age, max_age, sex FROM ct_gov_trials WHERE nct_id = ?",
        (nct_id,),
    )
    row = cursor.fetchone()
    if not row:
        log.error("Trial %s not found in ct_gov_trials", nct_id)
        return []

    elig_text, min_age, max_age, sex = row
    criteria = parse_trial(nct_id, elig_text, min_age, max_age, sex)
    store_criteria(conn, criteria)
    conn.commit()
    return criteria


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def main() -> None:
    parser = argparse.ArgumentParser(
        description="Parse ct_gov eligibility text into structured criteria"
    )
    parser.add_argument("--trial", type=str, help="Parse a single trial NCT ID")
    parser.add_argument("--all", action="store_true", help="Parse all unparsed ct_gov trials")
    parser.add_argument("--force", action="store_true", help="Re-parse already-parsed trials")
    parser.add_argument("--limit", type=int, help="Limit number of trials to process")
    parser.add_argument("--db", type=Path, default=DB_PATH)
    args = parser.parse_args()

    conn = sqlite3.connect(args.db)
    conn.execute("PRAGMA journal_mode=WAL")

    if args.trial:
        log.info("Parsing %s...", args.trial)
        criteria = process_single(conn, args.trial)
        log.info("Extracted %d criteria:", len(criteria))
        for c in criteria:
            tag = "INCL" if c.is_inclusion else "EXCL"
            hard = "HARD" if c.hard_constraint else "SOFT"
            log.info("  [%s|%s] %s %s %s (%s)",
                     tag, hard, c.criterion_type, c.comparison, c.criterion_value, c.value_type)

    elif args.all:
        if args.force:
            conn.execute(f"DELETE FROM criteria WHERE source = '{SOURCE_TAG}'")
            conn.commit()
            log.info("Cleared existing parsed criteria")

        log.info("Parsing all ct_gov trials...")
        stats = process_all(conn, limit=args.limit)
        log.info("")
        log.info("Done!")
        log.info("  Trials processed:  %d", stats["processed"])
        log.info("  Trials skipped:    %d", stats["skipped"])
        log.info("  Total criteria:    %d", stats["total_criteria"])
        log.info("  Avg per trial:     %.1f",
                 stats["total_criteria"] / max(stats["processed"], 1))
    else:
        parser.print_help()

    conn.close()


if __name__ == "__main__":
    main()
