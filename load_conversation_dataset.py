import json
import sqlite3
from pathlib import Path
from typing import Dict, List, Optional, Set, Tuple
import re
from datetime import datetime

# Database configuration
DB_PATH = Path(__file__).parent / "trial_data.sqlite"
DATASET_ROOT = Path(__file__).parent / "dataset-conversation"

# Database schema setup
SCHEMA = """
CREATE TABLE IF NOT EXISTS trials (
    nct_id TEXT PRIMARY KEY,
    title TEXT,
    brief_summary TEXT,
    detailed_description TEXT,
    phase TEXT,
    enrollment INTEGER,
    study_type TEXT,
    source TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS criteria (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nct_id TEXT,
    criterion_type TEXT,
    criterion_value TEXT,
    value_type TEXT,
    comparison TEXT,
    is_inclusion BOOLEAN,
    hard_constraint BOOLEAN DEFAULT 1,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (nct_id) REFERENCES trials(nct_id)
);

CREATE TABLE IF NOT EXISTS patients (
    patient_id TEXT PRIMARY KEY,
    note TEXT,
    dataset_path TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

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
);
"""

def setup_database():
    """Initialize the database with the required schema."""
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()
    
    # Enable foreign keys
    cursor.execute("PRAGMA foreign_keys = ON")
    
    # Check if tables exist and create them if they don't
    cursor.execute("""
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
    )""")
    
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS criteria (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nct_id TEXT NOT NULL,
        criterion_type TEXT NOT NULL,
        criterion_value TEXT,
        value_type TEXT DEFAULT 'string',
        comparison TEXT DEFAULT 'equals',
        source TEXT,
        is_inclusion BOOLEAN NOT NULL,
        hard_constraint BOOLEAN DEFAULT 1,
        FOREIGN KEY(nct_id) REFERENCES trials(nct_id)
    )""")
    
    # Commit changes
    conn.commit()
    conn.close()

def extract_patient_attributes(patient_text: str) -> List[Dict]:
    """Extract structured attributes from patient text."""
    attributes = []
    
    # Extract age
    age_match = re.search(r'(\d+)-year-old', patient_text)
    if age_match:
        age = int(age_match.group(1))
        attributes.append({
            'name': 'age',
            'value': age,
            'type': 'integer',
            'extracted_value': age
        })
    
    # Extract gender
    gender_match = re.search(r'\b(man|woman|male|female)\b', patient_text, re.IGNORECASE)
    if gender_match:
        gender = gender_match.group(1).lower()
        gender = 'female' if gender in ['woman', 'female'] else 'male'
        attributes.append({
            'name': 'gender',
            'value': gender,
            'type': 'categorical'
        })
    
    # Extract conditions (simplified example)
    conditions = []
    condition_keywords = [
        ('hypertension', '401.9'),
        ('obesity', '278.00'),
        ('diabetes', '250.00'),
        ('hypercholesterolemia', '272.0'),
        ('heart disease', '429.9'),
        ('depression', '311'),
        ('psychosis', '298.9'),
        ('pregnancy', 'V22.2')
    ]
    
    for condition, icd_code in condition_keywords:
        if re.search(r'\b' + re.escape(condition) + r'\b', patient_text, re.IGNORECASE):
            attributes.append({
                'name': 'condition',
                'value': condition,
                'type': 'categorical',
                'concept_id': f'ICD-10:{icd_code}'
            })
    
    return attributes

def parse_criteria(text: str, is_inclusion: bool = True) -> List[Dict]:
    """Parse eligibility criteria text into structured constraints."""
    constraints = []
    
    # Simple parsing of age criteria (example)
    age_match = re.search(r'Age\s*([<>]=?|==?|!=)\s*(\d+)', text, re.IGNORECASE)
    if age_match:
        operator = age_match.group(1)
        value = age_match.group(2)
        constraints.append({
            'criterion_type': 'age',
            'criterion_value': value,
            'value_type': 'integer',
            'comparison': operator,
            'is_inclusion': is_inclusion,
            'hard_constraint': True
        })
    
    # BMI criteria
    bmi_match = re.search(r'BMI\s*([<>]=?|==?|!=)\s*(\d+(?:\.\d+)?)', text, re.IGNORECASE)
    if bmi_match:
        operator = bmi_match.group(1)
        value = bmi_match.group(2)
        constraints.append({
            'criterion_type': 'bmi',
            'criterion_value': value,
            'value_type': 'float',
            'comparison': operator,
            'is_inclusion': is_inclusion,
            'hard_constraint': True
        })
    
    # Pregnancy status
    if re.search(r'\bpregnant\b', text, re.IGNORECASE):
        constraints.append({
            'criterion_type': 'pregnancy_status',
            'criterion_value': 'not_pregnant',
            'value_type': 'boolean',
            'comparison': 'equals',
            'is_inclusion': is_inclusion,
            'hard_constraint': True
        })
    
    # If no specific criteria were found, add the whole text as a custom criterion
    if not constraints:
        constraints.append({
            'criterion_type': 'custom',
            'criterion_value': text.strip(),
            'value_type': 'text',
            'comparison': 'contains',
            'is_inclusion': is_inclusion,
            'hard_constraint': False  # Make custom criteria soft constraints
        })
    
    return constraints

def process_trial(trial_dir: Path) -> Tuple[Dict, List[Dict]]:
    """Process a single trial directory and return trial data and criteria."""
    meta_path = trial_dir / "1trial/metainfojson/metainfo.json"
    if not meta_path.exists():
        return None, []
    
    with open(meta_path, 'r') as f:
        meta = json.load(f)
    
    # Safely convert enrollment to int, handling both string and float values
    enrollment = meta['contextual'].get('metadata', {}).get('enrollment', '0')
    try:
        enrollment = int(float(str(enrollment).strip() or '0'))
    except (ValueError, TypeError):
        enrollment = 0
    
    # Get drugs and diseases from metadata
    drugs = meta['contextual'].get('metadata', {}).get('drugs', '')
    diseases = meta['contextual'].get('metadata', {}).get('diseases', '')
    
    # Create metadata JSON
    metadata = {
        'brief_summary': meta['contextual'].get('metadata', {}).get('brief_summary', ''),
        'detailed_description': meta['contextual'].get('text', ''),
        'inclusion_criteria': meta['contextual'].get('metadata', {}).get('inclusion_criteria', ''),
        'exclusion_criteria': meta['contextual'].get('metadata', {}).get('exclusion_criteria', '')
    }
    
    trial_data = {
        'nct_id': meta['trial_id'],
        'title': meta['contextual'].get('title', ''),
        'phase': meta['contextual'].get('metadata', {}).get('phase', ''),
        'status': 'Unknown',  # Default status
        'enrollment': enrollment,
        'brief_summary': meta['contextual'].get('metadata', {}).get('brief_summary', ''),
        'drugs': drugs,
        'diseases': diseases,
        'metadata_json': json.dumps(metadata)
    }
    
    # Parse inclusion and exclusion criteria
    criteria = []
    nct_id = meta['trial_id']
    
    # Process inclusion criteria
    inclusion_text = meta['contextual'].get('metadata', {}).get('inclusion_criteria', '')
    if inclusion_text:
        inclusion_criteria = parse_criteria(inclusion_text, is_inclusion=True)
        for criterion in inclusion_criteria:
            criterion['nct_id'] = nct_id  # Ensure nct_id is set
        criteria.extend(inclusion_criteria)
    
    # Process exclusion criteria
    exclusion_text = meta['contextual'].get('metadata', {}).get('exclusion_criteria', '')
    if exclusion_text:
        exclusion_criteria = parse_criteria(exclusion_text, is_inclusion=False)
        for criterion in exclusion_criteria:
            criterion['nct_id'] = nct_id  # Ensure nct_id is set
        criteria.extend(exclusion_criteria)
    
    return trial_data, criteria

def process_patient(patient_dir: Path) -> Tuple[Dict, List[Dict]]:
    """Process a single patient directory and return patient data and attributes."""
    note_path = patient_dir / "0patient_note/patient_note.json"
    if not note_path.exists():
        return None, []
    
    with open(note_path, 'r') as f:
        note = json.load(f)
    
    patient_id = note.get('_id', '')
    if not patient_id:
        return None, []
    
    patient_data = {
        'patient_id': patient_id,
        'note': note.get('text', ''),
        'dataset_path': str(patient_dir)
    }
    
    # Extract structured attributes from patient text
    attributes = extract_patient_attributes(note.get('text', ''))
    
    return patient_data, attributes

def save_to_database(trials_data: List[Dict], criteria_data: List[Dict], 
                   patients_data: List[Dict], attributes_data: List[Dict]):
    """Save processed data to the database."""
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()
    
    try:
        # Insert trials
        cursor.executemany(
            """
            INSERT OR REPLACE INTO trials 
            (nct_id, title, phase, status, enrollment, brief_summary, drugs, diseases, metadata_json)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
            """,
            [(t['nct_id'], t['title'], t['phase'], t['status'], 
              t['enrollment'], t['brief_summary'], t['drugs'], 
              t['diseases'], t['metadata_json']) 
             for t in trials_data]
        )
        
        # Insert criteria
        cursor.executemany(
            """
            INSERT INTO criteria 
            (nct_id, criterion_type, criterion_value, value_type, 
             comparison, is_inclusion, hard_constraint, source)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)
            """,
            [(c['nct_id'], 
              c.get('criterion_type', 'custom'), 
              str(c.get('criterion_value', '')),
              c.get('value_type', 'string'),
              c.get('comparison', 'equals'),
              1 if c.get('is_inclusion', True) else 0,
              1 if c.get('hard_constraint', True) else 0,
              'SIGIR-2014-1')
             for c in criteria_data]
        )
        
        # Insert patients
        cursor.executemany(
            """
            INSERT OR REPLACE INTO patients (patient_id, note, dataset_path)
            VALUES (?, ?, ?)
            """,
            [(p['patient_id'], p.get('note', ''), p.get('dataset_path', 'SIGIR-2014-1')) 
             for p in patients_data]
        )
        
        # Insert patient attributes
        cursor.executemany(
            """
            INSERT INTO patient_attributes 
            (patient_id, attribute_name, value, value_type, source)
            VALUES (?, ?, ?, ?, ?)
            """,
            [(a['patient_id'], a['name'], str(a['value']), a['type'], 'SIGIR-2014-1')
             for a in attributes_data]
        )
        
        conn.commit()
        print(f"Inserted {len(trials_data)} trials, {len(criteria_data)} criteria, "
              f"{len(patients_data)} patients, and {len(attributes_data)} attributes")
        
    except Exception as e:
        conn.rollback()
        print(f"Error saving to database: {e}")
        raise
    finally:
        conn.close()

def process_dataset():
    """Process the entire dataset and load it into the database."""
    setup_database()
    
    all_trials = []
    all_criteria = []
    processed_trials = set()  # Track processed trials to avoid duplicates
    
    # Process each patient-trial pair
    for sigir_dir in DATASET_ROOT.glob('sigir-*'):
        print(f"Processing directory: {sigir_dir.name}")
        
        # Find all trial directories
        trial_dirs = list(sigir_dir.glob('rank*_NCT*'))
        
        for trial_dir in trial_dirs:
            # Extract NCT ID from directory name
            nct_id = trial_dir.name.split('_')[-1]
            
            # Skip if we've already processed this trial
            if nct_id in processed_trials:
                continue
                
            processed_trials.add(nct_id)
            
            try:
                # Process trial
                trial_data, criteria = process_trial(trial_dir)
                if trial_data:
                    all_trials.append(trial_data)
                    all_criteria.extend(criteria)
                    
                    # Print progress
                    if len(all_trials) % 10 == 0:
                        print(f"Processed {len(all_trials)} trials...")
            except Exception as e:
                print(f"Error processing trial {trial_dir}: {str(e)}")
                continue
    
    # Save to database in batches
    batch_size = 50
    for i in range(0, len(all_trials), batch_size):
        batch_trials = all_trials[i:i+batch_size]
        batch_nct_ids = {t['nct_id'] for t in batch_trials}
        
        # Filter criteria to only include those matching the current batch of trials
        batch_criteria = [c for c in all_criteria 
                         if c.get('nct_id') in batch_nct_ids]
        
        save_to_database(batch_trials, batch_criteria, [], [])
        print(f"Saved batch {i//batch_size + 1}/{(len(all_trials)-1)//batch_size + 1}")
        
        # Free up memory
        del batch_trials
        del batch_criteria
        del batch_nct_ids
    
    print(f"Dataset processing complete! Processed {len(all_trials)} trials and {len(all_criteria)} criteria.")

if __name__ == "__main__":
    process_dataset()
