import argparse
import json
import sqlite3
from pathlib import Path
from typing import Dict, List, Optional, Set

from trial_characteristics import derive_structured_characteristics

DB_PATH = Path(__file__).with_name("trial_data.sqlite")
DATASET_ROOT = Path(__file__).with_name("dataset-conversation")


def read_json(path: Path) -> Dict:
    with path.open() as handle:
        return json.load(handle)


def read_jsonl(path: Path) -> List[Dict]:
    records: List[Dict] = []
    if not path.exists():
        return records
    with path.open() as handle:
        for line in handle:
            line = line.strip()
            if not line:
                continue
            records.append(json.loads(line))
    return records


def trunc_tables(cursor: sqlite3.Cursor) -> None:
    """Clear tables so fresh dataset ingestion does not duplicate rows."""
    for table in (
        "patient_trial_rankings",
        "patient_attributes",
        "patients",
        "trial_characteristics",
        "criteria",
        "trials",
    ):
        cursor.execute(f"DELETE FROM {table}")


def parse_rank(dir_name: str) -> Optional[int]:
    """Extract the integer rank from `rank{num}_NCT...` folders."""
    if not dir_name.startswith("rank"):
        return None
    prefix = dir_name.split("_", 1)[0]
    try:
        return int(prefix.replace("rank", ""))
    except ValueError:
        return None


def extract_nct_id(dir_name: str) -> Optional[str]:
    """Extract the NCT identifier from folder names."""
    if "_NCT" not in dir_name:
        return None
    return dir_name.split("_", 1)[1]


def format_joined(value) -> str:
    """Convert list-like metadata items into a consistent, comma-delimited string."""
    if value is None:
        return ""
    if isinstance(value, list):
        return ", ".join(str(item).strip() for item in value)
    if isinstance(value, str):
        return value.strip()
    return str(value)


def safe_int(value) -> Optional[int]:
    try:
        if value in (None, ""):
            return None
        return int(float(value))
    except (ValueError, TypeError):
        return None


def ingest_patient(cursor: sqlite3.Cursor, patient_id: str, sample_trial: Path) -> None:
    note_path = sample_trial / "0patient_note" / "patient_note.json"
    note_data = read_json(note_path) if note_path.exists() else {"text": ""}

    cursor.execute(
        """
        INSERT INTO patients (patient_id, note, dataset_path)
        VALUES (?, ?, ?)
        ON CONFLICT(patient_id) DO UPDATE SET
            note=excluded.note,
            dataset_path=excluded.dataset_path
        """,
        (patient_id, note_data.get("text", ""), str(sample_trial.parent)),
    )

    canonical_records = read_jsonl(sample_trial / "0patient_coded_results" / "canonical.jsonl")
    demo_records = read_jsonl(sample_trial / "0patient_coded_results" / "demographics.jsonl")
    attribute_rows = []
    for source, records in (("canonical", canonical_records), ("demographics", demo_records)):
        for record in records:
            extracted_value = record.get("extracted_value")
            if isinstance(extracted_value, bool):
                extracted_flag = 1 if extracted_value else 0
            else:
                extracted_flag = None
            attribute_rows.append(
                (
                    patient_id,
                    record.get("entity_variable_name"),
                    json.dumps(record.get("extracted_value")),
                    record.get("type"),
                    extracted_flag,
                    record.get("start_time_in_hours"),
                    record.get("end_time_in_hours"),
                    record.get("template"),
                    record.get("conceptId") or record.get("concept_id"),
                    record.get("fact_id"),
                    source,
                )
            )

    cursor.execute("DELETE FROM patient_attributes WHERE patient_id = ?", (patient_id,))
    cursor.executemany(
        """
        INSERT INTO patient_attributes (
            patient_id,
            attribute_name,
            value,
            value_type,
            extracted_value,
            start_time,
            end_time,
            template,
            concept_id,
            fact_id,
            source
        )
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        """,
        attribute_rows,
    )


def ingest_trial(cursor: sqlite3.Cursor, trial_dir: Path, processed_trials: Set[str]) -> Optional[str]:
    trial_id = extract_nct_id(trial_dir.name)
    if not trial_id:
        return None
    if trial_id in processed_trials:
        return trial_id

    meta_path = trial_dir / "1trial" / "metainfojson" / "metainfo.json"
    if not meta_path.exists():
        return None
    metadata = read_json(meta_path)
    contextual = metadata.get("contextual", {})
    meta = contextual.get("metadata", {})

    title = contextual.get("title") or meta.get("brief_title") or trial_id
    phase = meta.get("phase")
    status = meta.get("overall_status") or meta.get("study_type")
    summary = meta.get("brief_summary") or contextual.get("text")
    enrollment = safe_int(meta.get("enrollment"))
    drugs_list = meta.get("drugs_list") or []
    diseases_list = meta.get("diseases_list") or []

    cursor.execute(
        """
        INSERT INTO trials (
            nct_id,
            title,
            phase,
            status,
            enrollment,
            brief_summary,
            drugs,
            diseases,
            metadata_json
        )
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
        ON CONFLICT(nct_id) DO UPDATE SET
            title=excluded.title,
            phase=excluded.phase,
            status=excluded.status,
            enrollment=excluded.enrollment,
            brief_summary=excluded.brief_summary,
            drugs=excluded.drugs,
            diseases=excluded.diseases,
            metadata_json=excluded.metadata_json
        """,
        (
            trial_id,
            title,
            phase,
            status,
            enrollment,
            summary,
            format_joined(drugs_list),
            format_joined(diseases_list),
            json.dumps(metadata),
        ),
    )

    cursor.execute("DELETE FROM trial_characteristics WHERE nct_id = ?", (trial_id,))
    structured_chars = derive_structured_characteristics(metadata)
    text_chars = [
        {
            "characteristic_key": "inclusion_text",
            "characteristic_value": meta.get("inclusion_criteria"),
            "value_type": "text",
            "confidence": 1.0,
            "source": "metadata.inclusion_criteria",
        },
        {
            "characteristic_key": "exclusion_text",
            "characteristic_value": meta.get("exclusion_criteria"),
            "value_type": "text",
            "confidence": 1.0,
            "source": "metadata.exclusion_criteria",
        },
        {
            "characteristic_key": "drugs_list",
            "characteristic_value": json.dumps(drugs_list) if drugs_list else None,
            "value_type": "json",
            "confidence": 1.0,
            "source": "metadata.drugs_list",
        },
        {
            "characteristic_key": "diseases_list",
            "characteristic_value": json.dumps(diseases_list) if diseases_list else None,
            "value_type": "json",
            "confidence": 1.0,
            "source": "metadata.diseases_list",
        },
    ]
    all_characteristics = [row for row in structured_chars + text_chars if row.get("characteristic_value")]
    cursor.executemany(
        """
        INSERT INTO trial_characteristics (
            nct_id,
            characteristic_key,
            characteristic_value,
            value_type,
            confidence,
            source
        )
        VALUES (?, ?, ?, ?, ?, ?)
        """,
        [
            (
                trial_id,
                row["characteristic_key"],
                row["characteristic_value"],
                row.get("value_type"),
                row.get("confidence"),
                row.get("source"),
            )
            for row in all_characteristics
        ],
    )

    include_path = (
        trial_dir / "1trial" / "minified_canon" / f"{trial_id}_inclusion_canonical_variables_entity_variable_names.json"
    )
    exclude_path = (
        trial_dir / "1trial" / "minified_canon" / f"{trial_id}_exclusion_canonical_variables_entity_variable_names.json"
    )
    cursor.execute("DELETE FROM criteria WHERE nct_id = ?", (trial_id,))
    for path, is_inclusion in ((include_path, True), (exclude_path, False)):
        if not path.exists():
            continue
        variables = read_json(path)
        if not isinstance(variables, list):
            continue
        rows = [
            (
                trial_id,
                variable,
                "true",
                "bool",
                "equals",
                path.name,
                1 if is_inclusion else 0,
            )
            for variable in variables
        ]
        cursor.executemany(
            """
            INSERT INTO criteria (
                nct_id,
                criterion_type,
                criterion_value,
                value_type,
                comparison,
                source,
                is_inclusion
            )
            VALUES (?, ?, ?, ?, ?, ?, ?)
            """,
            rows,
        )

    processed_trials.add(trial_id)
    return trial_id


def ingest_patient_trial_link(cursor: sqlite3.Cursor, patient_id: str, trial_dir: Path, nct_id: Optional[str]) -> None:
    if not nct_id:
        return
    metrics_path = trial_dir / "metrics.json"
    metrics = read_json(metrics_path) if metrics_path.exists() else {}
    rank = parse_rank(trial_dir.name)

    cursor.execute(
        """
        INSERT INTO patient_trial_rankings (
            patient_id,
            nct_id,
            rank,
            dataset_path,
            metrics_json
        )
        VALUES (?, ?, ?, ?, ?)
        ON CONFLICT(patient_id, nct_id) DO UPDATE SET
            rank=excluded.rank,
            dataset_path=excluded.dataset_path,
            metrics_json=excluded.metrics_json
        """,
        (patient_id, nct_id, rank, str(trial_dir), json.dumps(metrics)),
    )


def populate_from_dataset(dataset_root: Path, db_path: Path, append: bool = False) -> None:
    if not dataset_root.exists():
        raise FileNotFoundError(f"Dataset folder not found: {dataset_root}")

    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    cursor.execute("PRAGMA foreign_keys = ON;")

    if not append:
        trunc_tables(cursor)

    processed_trials: Set[str] = set()
    patients_processed = 0

    for patient_dir in sorted(dataset_root.iterdir()):
        if not patient_dir.is_dir():
            continue
        trial_dirs = sorted(
            [child for child in patient_dir.iterdir() if child.is_dir() and child.name.startswith("rank")]
        )
        if not trial_dirs:
            continue
        patients_processed += 1
        ingest_patient(cursor, patient_dir.name, trial_dirs[0])

        for trial_dir in trial_dirs:
            nct_id = ingest_trial(cursor, trial_dir, processed_trials)
            ingest_patient_trial_link(cursor, patient_dir.name, trial_dir, nct_id)

    conn.commit()
    conn.close()
    print(
        f"Ingested {patients_processed} patients, {len(processed_trials)} unique trials from {dataset_root.name}"
    )


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Populate TrialDB from the SIGIR conversation dataset.")
    parser.add_argument(
        "--dataset",
        type=Path,
        default=DATASET_ROOT,
        help="Path to the dataset-conversation directory.",
    )
    parser.add_argument(
        "--db",
        type=Path,
        default=DB_PATH,
        help="SQLite database file to populate.",
    )
    parser.add_argument(
        "--append",
        action="store_true",
        help="Append to existing rows instead of truncating the TrialDB tables.",
    )
    args = parser.parse_args()
    populate_from_dataset(args.dataset, args.db, append=args.append)
