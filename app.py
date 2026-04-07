import os
import math
from flask import Flask, render_template, request, jsonify, session, send_from_directory
from flask_cors import CORS
from conversation_agent import ConversationalTrialAssistant
import sqlite3
from dotenv import load_dotenv
from typing import Dict, List, Optional, Tuple, Any
import json
import re
from llm_service import LLMService
from Matcher import TrialMatcher as MatcherService
from preference_scorer import PatientPreferences, parse_preferences_from_message
from eligibility_visualizer import EligibilityVisualizer
from concept_canonicalizer import ConceptCanonicalizer, _CONCEPT_HIERARCHY
from progressive_eligibility import ProgressiveEligibilityChecker
from condition_followups import (
    detect_condition, get_followup_questions, parse_answer,
    merge_followup_answers,
)

load_dotenv()

# Simple ZIP code to coordinates mapping for distance calculation
# In production, you'd use a geocoding API like Google Maps or OpenCage
ZIP_COORDINATES = {
    # California
    '94102': (37.7749, -122.4194),  # San Francisco
    '94103': (37.7749, -122.4194),
    '90001': (33.9425, -118.2551),  # Los Angeles
    '90210': (34.0901, -118.4065),  # Beverly Hills
    '92101': (32.7157, -117.1611),  # San Diego
    '95101': (37.3382, -121.8863),  # San Jose
    # New York
    '10001': (40.7484, -73.9967),   # New York City
    '10019': (40.7638, -73.9918),
    '11201': (40.6892, -73.9857),   # Brooklyn
    # Texas
    '77001': (29.7604, -95.3698),   # Houston
    '75201': (32.7767, -96.7970),   # Dallas
    '78201': (29.4241, -98.4936),   # San Antonio
    # Illinois
    '60601': (41.8781, -87.6298),   # Chicago
    '60602': (41.8819, -87.6278),
    # Massachusetts
    '02101': (42.3601, -71.0589),   # Boston
    '02139': (42.3736, -71.1097),   # Cambridge
    # Washington
    '98101': (47.6062, -122.3321),  # Seattle
    # Arizona
    '85001': (33.4484, -112.0740),  # Phoenix
    # Colorado
    '80201': (39.7392, -104.9903),  # Denver
    # Florida
    '33101': (25.7617, -80.1918),   # Miami
    '32801': (28.5383, -81.3792),   # Orlando
    # Pennsylvania
    '19101': (39.9526, -75.1652),   # Philadelphia
    # Default (center of US)
    'default': (39.8283, -98.5795)
}

# Major medical center locations (approximate)
MEDICAL_CENTERS = {
    'Stanford': (37.4419, -122.1430),
    'UCSF': (37.7631, -122.4586),
    'UCLA': (34.0689, -118.4452),
    'Mayo Clinic': (44.0225, -92.4669),
    'Johns Hopkins': (39.2908, -76.5927),
    'Mass General': (42.3626, -71.0686),
    'Cleveland Clinic': (41.5034, -81.6212),
    'MD Anderson': (29.7078, -95.3975),
    'Memorial Sloan': (40.7645, -73.9565),
    'Duke': (35.9940, -78.9426),
    'Default': (39.8283, -98.5795)
}

_STATUS_LABELS = {
    'RECRUITING': 'Recruiting',
    'ACTIVE_NOT_RECRUITING': 'Active, not recruiting',
    'ENROLLING_BY_INVITATION': 'Enrolling by invitation',
    'NOT_YET_RECRUITING': 'Not yet recruiting',
    'COMPLETED': 'Completed',
    'TERMINATED': 'Terminated',
    'WITHDRAWN': 'Withdrawn',
    'SUSPENDED': 'Suspended',
    'AVAILABLE': 'Available',
    'UNKNOWN': 'Unknown',
}


def _format_status(raw_status: str | None) -> str:
    """Convert API status enum to human-readable label."""
    if not raw_status:
        return 'Unknown'
    return _STATUS_LABELS.get(raw_status.upper(), raw_status)


def get_coordinates_from_location(location: str, zip_code: str = None) -> Tuple[float, float]:
    """Get coordinates from location string or ZIP code."""
    # Try ZIP code first
    if zip_code and zip_code in ZIP_COORDINATES:
        return ZIP_COORDINATES[zip_code]

    # Try to extract ZIP from location
    if location:
        zip_match = re.search(r'\b(\d{5})\b', location)
        if zip_match and zip_match.group(1) in ZIP_COORDINATES:
            return ZIP_COORDINATES[zip_match.group(1)]

        # Try city name matching
        location_lower = location.lower()
        city_mapping = {
            'san francisco': '94102',
            'los angeles': '90001',
            'new york': '10001',
            'chicago': '60601',
            'houston': '77001',
            'phoenix': '85001',
            'philadelphia': '19101',
            'san antonio': '78201',
            'san diego': '92101',
            'dallas': '75201',
            'san jose': '95101',
            'boston': '02101',
            'seattle': '98101',
            'denver': '80201',
            'miami': '33101',
            'orlando': '32801'
        }
        for city, zip_code in city_mapping.items():
            if city in location_lower:
                return ZIP_COORDINATES.get(zip_code, ZIP_COORDINATES['default'])

    return ZIP_COORDINATES['default']

def calculate_distance(lat1: float, lon1: float, lat2: float, lon2: float) -> float:
    """Calculate distance between two points using Haversine formula (returns miles)."""
    R = 3959  # Earth's radius in miles

    lat1_rad = math.radians(lat1)
    lat2_rad = math.radians(lat2)
    delta_lat = math.radians(lat2 - lat1)
    delta_lon = math.radians(lon2 - lon1)

    a = math.sin(delta_lat / 2) ** 2 + math.cos(lat1_rad) * math.cos(lat2_rad) * math.sin(delta_lon / 2) ** 2
    c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a))

    return round(R * c, 1)

def get_trial_distance(patient_location: str, patient_zip: str, trial_data: dict) -> float:
    """Calculate distance from patient to nearest trial facility using real coordinates."""
    patient_coords = get_coordinates_from_location(patient_location, patient_zip)
    nct_id = trial_data.get('nct_id', '')

    if nct_id:
        try:
            db_path = os.path.join(os.path.dirname(__file__), 'trial_data.sqlite')
            conn = sqlite3.connect(db_path)
            conn.row_factory = sqlite3.Row
            cursor = conn.cursor()
            cursor.execute(
                "SELECT latitude, longitude FROM trial_locations "
                "WHERE nct_id = ? AND latitude IS NOT NULL AND longitude IS NOT NULL",
                (nct_id,),
            )
            rows = cursor.fetchall()
            conn.close()

            if rows:
                distances = [
                    calculate_distance(
                        patient_coords[0], patient_coords[1],
                        row['latitude'], row['longitude'],
                    )
                    for row in rows
                ]
                return min(distances)
        except sqlite3.Error:
            pass

    # Fallback: text heuristic for trials without location data
    trial_text = ' '.join(
        str(trial_data.get(k, '') or '') for k in ('location', 'facility', 'title', 'brief_title', 'brief_summary')
    ).lower()

    for center_name, center_coords in MEDICAL_CENTERS.items():
        if center_name.lower() in trial_text:
            return calculate_distance(patient_coords[0], patient_coords[1], center_coords[0], center_coords[1])

    return 9999.0  # Unknown location — large distance signals to preference scorer


# --- Patient Attribute Mapping ---
# Maps simple conversation data to the criterion attribute format used in the database.
# This bridges the gap between user-friendly intake (age, gender, condition)
# and the structured criteria names (patient_age_value_recorded_now_in_years, etc.)

CONDITION_TO_CRITERIA = {
    'diabetes': [
        'patient_has_diagnosis_of_diabetes_mellitus_now',
        'patient_has_diagnosis_of_type_2_diabetes_mellitus_now',
    ],
    'type 1 diabetes': [
        'patient_has_diagnosis_of_diabetes_mellitus_now',
        'patient_has_diagnosis_of_type_1_diabetes_mellitus_now',
    ],
    'type 2 diabetes': [
        'patient_has_diagnosis_of_diabetes_mellitus_now',
        'patient_has_diagnosis_of_type_2_diabetes_mellitus_now',
    ],
    'cancer': [
        'patient_has_diagnosis_of_malignant_neoplastic_disease_now',
        'patient_has_finding_of_malignant_neoplastic_disease_now',
    ],
    'stomach cancer': [
        'patient_has_diagnosis_of_malignant_neoplastic_disease_now',
        'patient_has_finding_of_malignant_neoplastic_disease_now',
        'patient_has_finding_of_neoplasm_of_stomach_now',
        'patient_has_finding_of_disorder_of_stomach_now',
    ],
    'gastric cancer': [
        'patient_has_diagnosis_of_malignant_neoplastic_disease_now',
        'patient_has_finding_of_malignant_neoplastic_disease_now',
        'patient_has_finding_of_neoplasm_of_stomach_now',
        'patient_has_finding_of_disorder_of_stomach_now',
    ],
    'breast cancer': [
        'patient_has_diagnosis_of_malignant_neoplastic_disease_now',
        'patient_has_finding_of_malignant_neoplastic_disease_now',
        'patient_has_diagnosis_of_malignant_tumor_of_breast_now',
    ],
    'lung cancer': [
        'patient_has_diagnosis_of_malignant_neoplastic_disease_now',
        'patient_has_finding_of_malignant_neoplastic_disease_now',
        'patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now',
    ],
    'colon cancer': [
        'patient_has_diagnosis_of_malignant_neoplastic_disease_now',
        'patient_has_finding_of_malignant_neoplastic_disease_now',
        'patient_has_diagnosis_of_malignant_neoplasm_of_colon_now',
    ],
    'colorectal cancer': [
        'patient_has_diagnosis_of_malignant_neoplastic_disease_now',
        'patient_has_finding_of_malignant_neoplastic_disease_now',
        'patient_has_diagnosis_of_malignant_neoplasm_of_colon_now',
    ],
    'heart disease': [
        'patient_has_diagnosis_of_disorder_of_cardiovascular_system_now',
        'patient_has_finding_of_disorder_of_cardiovascular_system_now',
    ],
    'hypertension': [
        'patient_has_diagnosis_of_hypertensive_disorder_now',
        'patient_has_diagnosis_of_essential_hypertension_now',
    ],
    'copd': [
        'patient_has_diagnosis_of_chronic_obstructive_lung_disease_now',
    ],
    'asthma': [
        'patient_has_diagnosis_of_asthma_now',
    ],
    'arthritis': [
        'patient_has_diagnosis_of_arthritis_now',
        'patient_has_finding_of_joint_pain_now',
    ],
    'depression': [
        'patient_has_diagnosis_of_depressive_disorder_now',
        'patient_has_finding_of_mental_disorder_now',
    ],
    'obesity': [
        'patient_has_diagnosis_of_obesity_inthehistory',
    ],
    'dementia': [
        'patient_has_finding_of_dementia_now',
    ],
    'pneumonia': [
        'patient_has_finding_of_pneumonia_now',
    ],
}


def build_patient_attributes(patient_data: Dict[str, Any]) -> Dict[str, Any]:
    """
    Convert simple conversation patient data into the structured attribute
    format matching the database criteria names.

    Args:
        patient_data: Dict with keys like 'age', 'gender', 'condition'

    Returns:
        Dict with keys matching criteria attribute names
    """
    attrs: Dict[str, Any] = {}

    # Age mapping — pass numeric value for >= / <= comparisons
    age = patient_data.get('age')
    if age is not None:
        try:
            age_val = int(age)
            attrs['patient_age_value_recorded_now_in_years'] = age_val
            attrs['age'] = age_val
        except (ValueError, TypeError):
            pass

    # Gender mapping
    gender = str(patient_data.get('gender', '')).lower()
    if gender == 'male':
        attrs['patient_sex_is_male_now'] = True
        attrs['patient_sex_is_female_now'] = False
    elif gender == 'female':
        attrs['patient_sex_is_female_now'] = True
        attrs['patient_sex_is_male_now'] = False
    if gender:
        attrs['gender'] = gender

    # Condition mapping
    condition = str(patient_data.get('condition', '')).lower()
    for keyword, criteria_attrs in CONDITION_TO_CRITERIA.items():
        if keyword in condition:
            for attr_name in criteria_attrs:
                attrs[attr_name] = True

    # Pregnancy/breastfeeding — default to False if gender is male
    if gender == 'male':
        attrs['patient_is_pregnant_now'] = False
        attrs['patient_is_breastfeeding_now'] = False
        attrs['patient_is_lactating_now'] = False
        attrs['patient_has_childbearing_potential_now'] = False

    # Merge condition-specific follow-up answers into criteria attributes
    condition_details = patient_data.get('condition_details', {})
    category_id = patient_data.get('condition_category')
    criteria_map = patient_data.get('condition_criteria_map', {})

    if condition_details and criteria_map:
        # Dynamic followups: answers carry their criterion_types directly
        attrs = _merge_dynamic_answers(attrs, condition_details, criteria_map)
        # Pass through for the eligibility visualizer
        attrs['condition_details'] = condition_details
        attrs['condition_criteria_map'] = criteria_map
    elif condition_details and category_id:
        # Hardcoded fallback: use condition_followups module
        attrs = merge_followup_answers(attrs, category_id, condition_details)

    return attrs


# ---------------------------------------------------------------------------
# Categories of criteria safe to infer as absent (False) when the patient
# hasn't mentioned them.  Lab values / numeric measures are NOT included
# because we can't know their values without tests.
# ---------------------------------------------------------------------------

_INFERABLE_PREFIXES = [
    # Diagnoses — if unmentioned, patient likely doesn't have them
    "patient_has_diagnosis_of_",
    # Findings — symptoms/signs the patient would know about
    "patient_has_finding_of_",
    # Prior treatments — patient would have mentioned significant treatments
    "patient_has_undergone_",
    # Current treatments — patient would mention active treatments
    "patient_is_undergoing_",
    # Current medications — patient would mention medications they take
    "patient_is_taking_",
    # Allergies — patient would mention known allergies
    "patient_has_allergy_to_",
    # Exposures — e.g., tobacco, drug exposure
    "patient_is_exposed_to_",
    # Ability to undergo procedures — default to capable
    "patient_can_undergo_",
    # Future procedures
    "patient_will_undergo_",
    # Reproductive status (if not already set)
    "patient_is_pregnant_",
    "patient_is_breastfeeding_",
    "patient_is_lactating_",
    "patient_has_childbearing_",
    # Positive-check patterns
    "patients_",
]

# Prefixes that should NOT be defaulted (need actual measurements)
_NON_INFERABLE_PATTERNS = [
    "_value_recorded_",     # Lab values / measurements
    "_in_years",            # Age (already handled)
    "_in_months",
    "_in_days",
]


def infer_negative_defaults(
    patient_attrs: Dict[str, Any],
    trial_nct_ids: List[str],
    db_path: str = "trial_data.sqlite",
) -> Dict[str, Any]:
    """Infer negative (absent) defaults for criteria not already in patient_attrs.

    For criteria categories where absence is a reasonable default (diagnoses,
    findings, treatments, allergies, etc.), set to False if the patient hasn't
    mentioned them.  Lab values and numeric measurements are left as unknown.

    For "can_undergo" criteria, defaults to True (patient is capable) since
    these are inclusion requirements and we assume capability unless stated.

    Args:
        patient_attrs: Existing patient attributes dict.
        trial_nct_ids: NCT IDs of matched trials to check criteria for.
        db_path: Path to the SQLite database.

    Returns:
        Updated patient_attrs with inferred defaults added.
    """
    if not trial_nct_ids:
        return patient_attrs

    conn = sqlite3.connect(db_path)
    cur = conn.cursor()

    placeholders = ",".join("?" * len(trial_nct_ids))
    cur.execute(f"""
        SELECT DISTINCT criterion_type
        FROM criteria
        WHERE nct_id IN ({placeholders})
    """, trial_nct_ids)

    needed_criteria = [row[0] for row in cur.fetchall()]
    conn.close()

    for ct in needed_criteria:
        # Skip if we already have a value
        if ct in patient_attrs:
            continue

        # Skip non-inferable (lab values, numeric measurements)
        if any(pat in ct for pat in _NON_INFERABLE_PATTERNS):
            continue

        # Check if this criterion is in an inferable category
        is_inferable = any(ct.startswith(prefix) for prefix in _INFERABLE_PREFIXES)
        if not is_inferable:
            continue

        # Determine the default value based on criterion semantics
        if ct.startswith("patient_can_undergo_"):
            # "can_undergo" → assume patient is capable (True)
            patient_attrs[ct] = True
        elif "_is_normal_" in ct:
            # "is_normal" → assume healthy/normal function (True)
            patient_attrs[ct] = True
        elif "_is_abnormal_" in ct:
            # "is_abnormal" → assume NOT abnormal for healthy patient (False)
            patient_attrs[ct] = False
        elif ct.startswith("patients_") and "_is_positive_" in ct:
            # "patients_X_is_positive" — context-dependent:
            # Organ function checks → assume positive/normal (True)
            # Disease/pathogen markers → assume negative (False)
            if any(kw in ct for kw in (
                "function", "activity", "performance", "health",
                "competence", "swallow", "locomotion", "deglutition",
                "balance", "hydration", "hemostatic",
            )):
                patient_attrs[ct] = True
            else:
                patient_attrs[ct] = False
        else:
            # Default: patient doesn't have this condition/finding/treatment
            patient_attrs[ct] = False

    return patient_attrs


def _merge_dynamic_answers(
    attrs: Dict[str, Any],
    condition_details: Dict[str, Any],
    criteria_map: Dict[str, List[str]],
) -> Dict[str, Any]:
    """Merge dynamic follow-up answers directly into patient attributes.

    Each answer's attribute_key maps to a list of criterion_types via
    criteria_map. The answer value is translated to the appropriate
    attribute value for each criterion.
    """
    for attr_key, value in condition_details.items():
        criterion_types = criteria_map.get(attr_key, [])
        if not criterion_types:
            continue

        if isinstance(value, bool):
            # Boolean answer → set all associated criteria
            for ct in criterion_types:
                attrs[ct] = value
        elif isinstance(value, (int, float)):
            # Numeric answer → set all associated criteria
            for ct in criterion_types:
                attrs[ct] = value
        elif isinstance(value, str):
            # Text answer — try to extract meaning and set criteria
            _merge_text_answer(attrs, value, criterion_types, attr_key)

    return attrs


def _merge_text_answer(
    attrs: Dict[str, Any],
    text: str,
    criterion_types: List[str],
    attr_key: str,
) -> None:
    """Parse a free-text answer and set the associated criteria.

    For text answers, we check for positive/negative indicators and
    try to match keywords against the criterion names.
    """
    text_lower = text.lower().strip()

    # "I don't know" / uncertain answers — leave criteria as unknown
    uncertain_phrases = [
        "don't know", "dont know", "idk", "not sure", "unsure",
        "no idea", "no clue", "haven't been told", "havent been told",
    ]
    if any(phrase in text_lower for phrase in uncertain_phrases):
        return  # Leave criteria unset (unknown)

    # Check for explicit negatives
    negative_phrases = [
        "no", "none", "never", "n/a", "not", "don't", "dont",
        "haven't", "havent", "negative",
    ]
    positive_phrases = [
        "yes", "have", "had", "diagnosed", "positive", "currently",
        "taking", "receiving",
    ]

    is_negative = any(text_lower.startswith(p) or text_lower == p
                      for p in negative_phrases)
    is_positive = any(p in text_lower for p in positive_phrases)

    if is_negative and not is_positive:
        # Patient said no/none — set all criteria to False
        for ct in criterion_types:
            attrs[ct] = False
        return

    # For text answers about specific conditions/treatments,
    # try to match keywords from the answer against criterion names
    for ct in criterion_types:
        # Extract the medical entity from the criterion name
        ct_lower = ct.lower()

        # Check if any significant word from the answer appears in the criterion
        words = [w for w in text_lower.split() if len(w) > 3]
        matched = any(w in ct_lower for w in words)

        if matched or is_positive:
            attrs[ct] = True
        # If we can't determine, leave as unknown (don't set to False)



app = Flask(__name__,
    static_folder='static',
    static_url_path='/static',
    template_folder='templates'
)

app.secret_key = os.environ.get('SECRET_KEY', 'dev-secret-key')

is_production = os.environ.get('RENDER', '') == 'true'
allowed_origins = ["http://localhost:5001", "http://127.0.0.1:5001"]
if is_production:
    render_url = os.environ.get('RENDER_EXTERNAL_URL', '')
    if render_url:
        allowed_origins.append(render_url)

CORS(app, resources={
    r"/api/*": {
        "origins": allowed_origins,
        "methods": ["GET", "POST", "OPTIONS"],
        "allow_headers": ["Content-Type", "Authorization"],
        "supports_credentials": True
    }
})

app.config.update(
    SESSION_COOKIE_SECURE=is_production,
    SESSION_COOKIE_HTTPONLY=True,
    SESSION_COOKIE_SAMESITE='Lax',
)

# Add CSP headers
@app.after_request
def add_security_headers(response):
    # Allow unsafe-inline for development only
    csp = """
    default-src 'self';
    script-src 'self' 'unsafe-inline' 'unsafe-eval' https://cdn.tailwindcss.com;
    style-src 'self' 'unsafe-inline' https://cdn.tailwindcss.com;
    img-src 'self' data:;
    connect-src 'self' http://localhost:5001 http://127.0.0.1:5001;
    """
    response.headers['Content-Security-Policy'] = csp.replace('\n', ' ').strip()
    return response


@app.after_request
def after_request(response):
    response.headers.add('Access-Control-Allow-Credentials', 'true')
    response.headers.add('Access-Control-Allow-Headers', 'Content-Type,Authorization')
    response.headers.add('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,OPTIONS')
    return response

# Ensure the static files are served
@app.route('/static/<path:path>')
def serve_static(path):
    return send_from_directory('static', path)

# Database configuration
DB_PATH = os.getenv('DATABASE_URL', 'sqlite:///trial_data.sqlite').replace('sqlite:///', '')

class TrialMatcher:
    def __init__(self):
        self.db_path = DB_PATH
        self.conn = None
        self._connect()
    
    def _connect(self):
        """Establish a new database connection."""
        try:
            if self.conn:
                try:
                    self.conn.close()
                except Exception as close_error:
                    print(f"Error closing previous connection: {close_error}")
            
            print(f"Connecting to database at: {self.db_path}")
            print(f"File exists: {os.path.exists(self.db_path)}")
            print(f"File permissions: {oct(os.stat(self.db_path).st_mode & 0o777) if os.path.exists(self.db_path) else 'N/A'}")
            
            self.conn = sqlite3.connect(self.db_path)
            self.conn.row_factory = sqlite3.Row
            
            # Test the connection with a simple query
            cursor = self.conn.cursor()
            cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
            tables = cursor.fetchall()
            print(f"Connected to database. Found tables: {[t[0] for t in tables]}")
            
            # Check if the trials table exists and has data
            cursor.execute("SELECT COUNT(*) as count FROM trials;")
            count = cursor.fetchone()['count']
            print(f"Found {count} trials in the database")
            
            return True
            
        except Exception as e:
            print(f"\n--- DATABASE CONNECTION ERROR ---")
            print(f"Error type: {type(e).__name__}")
            print(f"Error message: {str(e)}")
            if hasattr(e, 'args') and e.args:
                print(f"Error details: {e.args}")
            print("--- END ERROR ---\n")
            raise
    
    def _execute_query(self, query, params=()):
        """Execute a query with error handling and automatic reconnection."""
        max_retries = 2
        last_error = None
        
        for attempt in range(max_retries):
            try:
                # Ensure we have a valid connection
                if not self.conn:
                    self._connect()
                    
                cursor = self.conn.cursor()
                
                # Log the query (without parameters for security)
                print(f"\n--- Executing query (attempt {attempt + 1}) ---")
                print(f"Query: {query.split('FROM')[0]}..." if len(query) > 100 else f"Query: {query}")
                print(f"Params: {params}")
                
                # Execute the query
                cursor.execute(query, params)
                
                # If it's a SELECT, fetch one row to check for errors
                if query.strip().upper().startswith('SELECT'):
                    try:
                        # Try to get column names to verify the query structure
                        columns = [desc[0] for desc in cursor.description] if cursor.description else []
                        print(f"Query successful. Columns: {columns}")
                    except Exception as e:
                        print(f"Note: Could not get column descriptions: {e}")
                
                return cursor
                
            except (sqlite3.OperationalError, sqlite3.InterfaceError, sqlite3.DatabaseError) as e:
                last_error = e
                print(f"\n--- QUERY ERROR (attempt {attempt + 1}) ---")
                print(f"Error type: {type(e).__name__}")
                print(f"Error message: {str(e)}")
                print(f"Query: {query[:200]}..." if len(query) > 200 else f"Query: {query}")
                print("--- END ERROR ---\n")
                
                if attempt == max_retries - 1:
                    print(f"Database query failed after {max_retries} attempts")
                    # Add more detailed error information for common issues
                    if "no such table" in str(e).lower():
                        print("\nERROR: The required database table is missing.")
                        print("Please make sure you've run the database setup script.")
                    raise
                    
                # Wait a bit before retrying
                import time
                time.sleep(0.5)
                
                # Reconnect and try again
                try:
                    self._connect()
                except Exception as connect_error:
                    print(f"Failed to reconnect to database: {connect_error}")
                    raise last_error
        
        # If we get here, all retries failed
        raise last_error or Exception("Unknown database error")
    
    def find_matching_trials(self, patient_data: Dict[str, Any]) -> List[Dict]:
        """Find trials that match the patient's profile."""
        print(f"\n--- find_matching_trials ---")
        print(f"Patient data: {patient_data}")
        
        try:
            test_query = "SELECT COUNT(*) as count FROM trials"
            cursor = self._execute_query(test_query)
            trial_count = cursor.fetchone()['count']
            print(f"Found {trial_count} trials in database")

            search_terms = patient_data.get('search_queries') or [patient_data.get('condition', '')]
            search_terms = [t for t in (search_terms or []) if isinstance(t, str) and t.strip()]
            if not search_terms:
                print("No search terms provided; returning empty list")
                return []

            all_trials: List[Dict] = []
            seen: set = set()

            # Build common filter clauses for age and gender
            common_clauses = ""
            common_params: List[Any] = []

            if 'age' in patient_data and patient_data['age']:
                try:
                    age = int(patient_data['age'])
                    common_clauses += " AND (c.criterion_type != 'age' OR (c.comparison = '>=' AND ? >= CAST(c.criterion_value AS INTEGER)) OR (c.comparison = '<=' AND ? <= CAST(c.criterion_value AS INTEGER)))"
                    common_params.extend([age, age])
                    print(f"Added age filter: {age}")
                except (ValueError, TypeError) as e:
                    print(f"Invalid age value: {patient_data['age']} - {e}")

            if 'gender' in patient_data and patient_data['gender']:
                gender = str(patient_data['gender']).lower()
                common_clauses += " AND (c.criterion_type != 'gender' OR LOWER(c.criterion_value) = ?)"
                common_params.append(gender)
                print(f"Added gender filter: {gender}")

            for term in search_terms[:5]:
                like = f"%{term.lower()}%"

                # Phase 1: Strict search — only match against the diseases column
                # This ensures trials that are actually ABOUT the condition rank first
                strict_query = """
                SELECT DISTINCT t.*
                FROM trials t
                LEFT JOIN criteria c ON t.nct_id = c.nct_id
                WHERE 1=1
                AND (t.status IN ('RECRUITING', 'ACTIVE_NOT_RECRUITING',
                     'ENROLLING_BY_INVITATION', 'NOT_YET_RECRUITING',
                     'AVAILABLE')
                     OR t.status IS NULL)
                """ + common_clauses + """
                AND LOWER(COALESCE(t.diseases,'')) LIKE ?
                GROUP BY t.nct_id
                ORDER BY t.phase DESC, t.enrollment DESC
                LIMIT 10
                """
                strict_params = list(common_params) + [like]

                print(f"Executing STRICT disease query for term: {term}")
                cursor = self._execute_query(strict_query, strict_params)
                strict_rows = cursor.fetchall()
                print(f"Term '{term}' strict disease match returned {len(strict_rows)} trials")

                for row in strict_rows:
                    d = dict(row)
                    if d['nct_id'] in seen:
                        continue
                    seen.add(d['nct_id'])
                    d['_disease_match'] = True
                    try:
                        d['explanation'] = llm_service.explain_trial_match(patient_data, d)
                    except Exception:
                        d['explanation'] = None
                    all_trials.append(d)

                # Phase 2: Broader fallback — title and summary only if strict
                # search returned fewer than 3 results
                if len(strict_rows) < 3:
                    broad_query = """
                    SELECT DISTINCT t.*
                    FROM trials t
                    LEFT JOIN criteria c ON t.nct_id = c.nct_id
                    WHERE 1=1
                    AND (t.status IN ('RECRUITING', 'ACTIVE_NOT_RECRUITING',
                         'ENROLLING_BY_INVITATION', 'NOT_YET_RECRUITING',
                         'AVAILABLE')
                         OR t.status IS NULL)
                    """ + common_clauses + """
                    AND (LOWER(t.title) LIKE ?
                         OR LOWER(t.brief_summary) LIKE ?)
                    GROUP BY t.nct_id
                    ORDER BY t.phase DESC, t.enrollment DESC
                    LIMIT 3
                    """
                    broad_params = list(common_params) + [like, like]

                    print(f"Executing BROAD fallback query for term: {term}")
                    cursor = self._execute_query(broad_query, broad_params)
                    broad_rows = cursor.fetchall()
                    print(f"Term '{term}' broad fallback returned {len(broad_rows)} trials")

                    for row in broad_rows:
                        d = dict(row)
                        if d['nct_id'] in seen:
                            continue
                        seen.add(d['nct_id'])
                        d['_disease_match'] = False
                        try:
                            d['explanation'] = llm_service.explain_trial_match(patient_data, d)
                        except Exception:
                            d['explanation'] = None
                        all_trials.append(d)

            print(f"Returning {len(all_trials)} unique trials")
            return all_trials
            
        except Exception as e:
            print(f"\n--- ERROR in find_matching_trials ---")
            print(f"Error type: {type(e).__name__}")
            print(f"Error message: {str(e)}")
            print(f"Patient data: {patient_data}")
            import traceback
            traceback.print_exc()
            print("--- End of error ---\n")
            
            # Try a fallback query if the main one fails
            try:
                print("Attempting fallback query...")
                cursor = self._execute_query("""
                    SELECT * FROM trials
                    WHERE brief_summary IS NOT NULL
                    AND (status IN ('RECRUITING', 'ACTIVE_NOT_RECRUITING',
                         'ENROLLING_BY_INVITATION', 'NOT_YET_RECRUITING',
                         'AVAILABLE')
                         OR status IS NULL)
                    ORDER BY RANDOM()
                    LIMIT 3
                """)
                trials = [dict(row) for row in cursor.fetchall()]
                print(f"Fallback query returned {len(trials)} trials")
                return trials
            except Exception as fallback_error:
                print(f"Fallback query also failed: {fallback_error}")
                raise Exception("Unable to retrieve clinical trials. The database may be unavailable or the query could not be processed.") from e
    
    def get_trial_details(self, nct_id: str) -> Optional[Dict]:
        """Get detailed information about a specific trial."""
        try:
            # Get trial details
            cursor = self._execute_query("SELECT * FROM trials WHERE nct_id = ?", (nct_id,))
            trial = cursor.fetchone()
            
            if trial:
                trial = dict(trial)
                # Get criteria
                cursor = self._execute_query("""
                    SELECT * FROM criteria 
                    WHERE nct_id = ?
                    ORDER BY is_inclusion DESC, criterion_type
                """, (nct_id,))
                trial['criteria'] = [dict(row) for row in cursor.fetchall()]
                return trial
            return None
            
        except Exception as e:
            print(f"Error in get_trial_details: {e}")
            raise

# Initialize LLM service
llm_service = LLMService()

# Initialize matcher (includes SMT evaluator + RAG index)
matcher = TrialMatcher()
scoring_matcher = MatcherService(DB_PATH)
eligibility_viz = EligibilityVisualizer(scoring_matcher.smt_matcher)
concept_canon = ConceptCanonicalizer(DB_PATH)
progressive_checker = ProgressiveEligibilityChecker(scoring_matcher.smt_matcher)
print(f"Matcher ready: {len(scoring_matcher.trials)} trials with SMT + RAG scoring.")

def process_user_message(message: str, session: dict) -> dict:
    """Process the user message and return an appropriate response."""
    # Convert message to lowercase for easier processing
    message = message.lower()
    
    # Initialize session if needed
    if 'patient_data' not in session:
        session['patient_data'] = {}
        session['awaiting_info'] = 'age'
        session['conversation_count'] = 0
        return {
            'text': "Hello! I'm your clinical trial assistant. To help you find suitable trials, I'll need some information. "
                   "Could you please tell me your age?"
        }
    
    # Get current state
    awaiting = session.get('awaiting_info')
    patient_data = session['patient_data']
    conversation_count = session.get('conversation_count', 0)
    
    # Universal intent handling
    if message in ['reset', 'start over', 'restart', 'new conversation']:
        session.clear()
        session['patient_data'] = {}
        session['awaiting_info'] = 'age'
        session['conversation_count'] = 0
        return {
            'text': "Okay, let's start over. What is your age?",
            'patient_data': {}
        }
    
    # Extract age from any message text (e.g., "I'm 45", "age 67")
    age_match = re.search(r"\b([1-9][0-9]{0,2})\b", message)
    if age_match:
        try:
            new_age = int(age_match.group(1))
            if 1 <= new_age <= 120:
                patient_data['age'] = new_age
                if not patient_data.get('gender'):
                    session['awaiting_info'] = 'gender'
                    return {
                        'text': "Got it. What is your gender? (male/female/other)",
                        'patient_data': patient_data
                    }
                if not patient_data.get('condition'):
                    session['awaiting_info'] = 'condition'
                    return {
                        'text': "Thanks. Please describe your condition or symptoms.",
                        'patient_data': patient_data
                    }
                session['awaiting_info'] = 'search_confirm'
                return {
                    'text': f"Updated your age to {new_age}. Would you like me to search for trials now? (yes/no)",
                    'patient_data': patient_data
                }
        except Exception:
            pass
    
    # Detect gender anywhere in the message when not explicitly awaiting gender
    if awaiting != 'gender' and any(g in message for g in ['male', 'female', 'other']):
        gender_value = 'male' if 'male' in message else ('female' if 'female' in message else 'other')
        patient_data['gender'] = gender_value
        if not patient_data.get('age'):
            session['awaiting_info'] = 'age'
            return {
                'text': "Thanks. What is your age?",
                'patient_data': patient_data
            }
        if not patient_data.get('condition'):
            session['awaiting_info'] = 'condition'
            return {
                'text': "Thanks. Please describe your condition or symptoms.",
                'patient_data': patient_data
            }
        session['awaiting_info'] = 'search_confirm'
        return {
            'text': f"Updated your gender to {gender_value}. Would you like me to search now? (yes/no)",
            'patient_data': patient_data
        }

    # Universal condition update: if user provides a condition/symptom phrase at any time
    # Trigger when the message contains letters, is not a simple greeting/thanks, and not a plain yes/no
    simple_affirm = {'yes','y','ok','sure'}
    simple_negative = {'no','n'}
    greetings = {'hi','hello','hey'}
    thanks_set = {'thanks','thank you'}
    has_letters = re.search(r"[a-z]", message) is not None
    if has_letters and message not in simple_affirm and message not in simple_negative and message not in greetings and message not in thanks_set and awaiting != 'condition':
        # Treat as a new condition description
        age = patient_data.get('age', 0)
        gender = patient_data.get('gender', 'unknown')
        try:
            analysis = llm_service.analyze_symptoms(message, age, gender)
            patient_data['condition'] = message
            patient_data['condition_analysis'] = analysis
            patient_data['search_queries'] = llm_service.generate_search_query(analysis)
            session['awaiting_info'] = 'search_confirm'
            return {
                'text': f"Updated condition to: {analysis.get('summary', message)}. Would you like me to search for clinical trials now? (yes/no)",
                'patient_data': patient_data
            }
        except Exception as e:
            print(f"Universal condition update failed: {e}")
            session['awaiting_info'] = 'condition'
            return {
                'text': "Please describe the condition you want to search for.",
                'patient_data': patient_data
            }

    # Process based on what we're waiting for
    if awaiting == 'age':
        try:
            age = int(message)
            if 18 <= age <= 120:
                patient_data['age'] = age
                session['awaiting_info'] = 'gender'
                return {
                    'text': "Great! What is your gender? (male/female/other)",
                    'patient_data': patient_data
                }
            else:
                return {
                    'text': "Please enter a valid age between 18 and 120.",
                    'patient_data': patient_data
                }
        except ValueError:
            return {
                'text': "Please enter your age as a number.",
                'patient_data': patient_data
            }
    
    elif awaiting == 'gender':
        if message in ['male', 'female', 'other']:
            patient_data['gender'] = message
            session['awaiting_info'] = 'condition'
            return {
                'text': "What medical condition are you looking to treat? Please describe your symptoms or condition in detail.",
                'patient_data': patient_data
            }
        else:
            return {
                'text': "Please specify your gender as 'male', 'female', or 'other'.",
                'patient_data': patient_data
            }
    
    elif awaiting == 'condition':
        # Use LLM to analyze the condition description
        age = patient_data.get('age', 0)
        gender = patient_data.get('gender', 'unknown')
        
        try:
            condition_analysis = llm_service.analyze_symptoms(message, age, gender)
            patient_data['condition'] = message
            patient_data['condition_analysis'] = condition_analysis
            patient_data['search_queries'] = llm_service.generate_search_query(condition_analysis)
            
            # Ask clarifying questions if needed
            if condition_analysis.get('needs_clarification'):
                session['awaiting_info'] = 'condition_clarify'
                return {
                    'text': f"I understand you're experiencing {condition_analysis['symptoms']}. "
                           f"{condition_analysis['clarification_question']}",
                    'patient_data': patient_data
                }
            else:
                session['awaiting_info'] = 'search_confirm'
                return {
                    'text': f"I understand you're looking for trials related to {condition_analysis['summary']}. "
                           "Would you like me to search for clinical trials for you? (yes/no)",
                    'patient_data': patient_data
                }
        except Exception as e:
            print(f"Error in LLM analysis: {e}")
            # Fallback to basic analysis
            condition_analysis = analyze_condition(message)
            patient_data['condition'] = message
            patient_data['condition_analysis'] = condition_analysis
            
            if condition_analysis.get('needs_clarification'):
                session['awaiting_info'] = 'condition_clarify'
                return {
                    'text': f"I understand you're experiencing {condition_analysis['symptoms']}. "
                           f"{condition_analysis['clarification_question']}",
                    'patient_data': patient_data
                }
            else:
                session['awaiting_info'] = 'search_confirm'
                return {
                    'text': f"I understand you're looking for trials related to {condition_analysis['summary']}. "
                           "Would you like me to search for clinical trials for you? (yes/no)",
                    'patient_data': patient_data
                }
    
    elif awaiting == 'condition_clarify':
        # Process the clarification
        patient_data['condition_clarification'] = message
        
        # Update condition analysis
        condition_analysis = patient_data.get('condition_analysis', {})
        condition_analysis['clarification'] = message
        condition_analysis['needs_clarification'] = False
        condition_analysis['summary'] = f"{condition_analysis.get('symptoms', '')} with {message}"
        
        session['awaiting_info'] = 'search_confirm'
        return {
            'text': f"Thank you for the clarification. I understand you're looking for trials related to {condition_analysis['summary']}. "
                   "Would you like me to search for clinical trials for you? (yes/no)",
            'patient_data': patient_data
        }
    
    elif awaiting == 'search_confirm':
        affirmative = ['yes', 'y', 'sure', 'ok']
        negative = ['no', 'n']
        if message in affirmative:
            try:
                # Find matching trials (now supports LLM-generated queries)
                trials = matcher.find_matching_trials(patient_data)
                session['awaiting_info'] = 'done'
                session['conversation_count'] = conversation_count + 1
                if trials:
                    return {
                        'action': 'show_trials',
                        'trials': trials,
                        'text': f"I found {len(trials)} clinical trials that might be relevant to your condition:",
                        'patient_data': patient_data
                    }
                else:
                    return {
                        'text': f"I couldn't find any matching clinical trials for '{patient_data.get('condition', 'your condition')}'. "
                               "You can provide different wording (e.g., 'migraine', 'left-sided headache').",
                        'patient_data': patient_data
                    }
            except Exception as e:
                print(f"Error finding trials: {e}")
                return {
                    'text': "I'm having trouble accessing the trial database. Please try again later.",
                    'patient_data': patient_data
                }
        elif message in negative:
            # Offer to change condition, do not repeat age/gender
            session['awaiting_info'] = 'condition'
            session['conversation_count'] = conversation_count + 1
            return {
                'text': "No problem. Please describe a different condition you want to search for.",
                'patient_data': patient_data
            }
        else:
            # Treat any other input here as a NEW condition phrase
            new_condition = message.strip()
            if new_condition:
                age = patient_data.get('age', 0)
                gender = patient_data.get('gender', 'unknown')
                try:
                    analysis = llm_service.analyze_symptoms(new_condition, age, gender)
                    patient_data['condition'] = new_condition
                    patient_data['condition_analysis'] = analysis
                    patient_data['search_queries'] = llm_service.generate_search_query(analysis)
                    session['awaiting_info'] = 'search_confirm'
                    return {
                        'text': f"Updated condition to: {analysis.get('summary', new_condition)}. "
                                "Would you like me to search for clinical trials now? (yes/no)",
                        'patient_data': patient_data
                    }
                except Exception as e:
                    print(f"Error analyzing new condition in search_confirm: {e}")
                    session['awaiting_info'] = 'condition'
                    return {
                        'text': "Please describe the condition you want to search for.",
                        'patient_data': patient_data
                    }
            # Fallback
            session['awaiting_info'] = 'condition'
            return {
                'text': "Please describe the condition you want to search for.",
                'patient_data': patient_data
            }
    
    # Default response if we're not in a specific state
    if any(word in message for word in ['hi', 'hello', 'hey']):
        # Check if we have existing patient data
        if patient_data and 'age' in patient_data:
            return {
                'text': f"Hello again! I remember you're {patient_data.get('age')} years old and {patient_data.get('gender')}. "
                       "Would you like to search for more clinical trials? (yes/no)",
                'patient_data': patient_data
            }
        else:
            # Reset the conversation
            session.clear()
            session['patient_data'] = {}
            session['awaiting_info'] = 'age'
            session['conversation_count'] = 0
            return {
                'text': "Hello! I'm here to help you find clinical trials. Let's get started. What is your age?",
                'patient_data': {}
            }
    
    elif any(word in message for word in ['thanks', 'thank you']):
        return {
            'text': "You're welcome! Is there anything else I can help you with?",
            'patient_data': patient_data
        }
    
    else:
        # If we're in 'done' state, allow new searches
        if awaiting == 'done':
            if 'different' in message or 'new' in message or 'another' in message:
                session['awaiting_info'] = 'condition'
                return {
                    'text': f"Sure! What other condition would you like to search for?",
                    'patient_data': patient_data
                }
        
        # If we don't know what to do, prefer asking for missing info instead of looping
        if awaiting == 'condition':
            return {
                'text': "Please describe the condition or symptoms you want to search for.",
                'patient_data': patient_data
            }
        if patient_data and any(patient_data.values()):
            return {
                'text': f"I have your information (age: {patient_data.get('age', 'unknown')}, "
                       f"gender: {patient_data.get('gender', 'unknown')}, "
                       f"condition: {patient_data.get('condition', 'unknown')}). "
                       "Would you like me to search for trials with this information? (yes/no)",
                'patient_data': patient_data
            }
        else:
            # Start over
            session.clear()
            session['patient_data'] = {}
            session['awaiting_info'] = 'age'
            session['conversation_count'] = 0
            return {
                'text': "I'm here to help you find clinical trials. To get started, I'll need some information. What is your age?",
                'patient_data': {}
            }

def analyze_condition(message: str) -> dict:
    """Analyze the user's condition description and determine if clarification is needed."""
    # Simple keyword-based analysis
    chest_pain_keywords = ['chest', 'heart', 'pain', 'hurts', 'tightness', 'pressure']
    head_pain_keywords = ['head', 'headache', 'migraine', 'pain']
    fever_keywords = ['fever', 'temperature', 'hot', 'feverish']
    stomach_keywords = ['stomach', 'abdomen', 'belly', 'nausea', 'vomit']
    
    symptoms = []
    needs_clarification = False
    clarification_question = ""
    
    # Check for chest pain
    if any(word in message for word in chest_pain_keywords):
        symptoms.append("chest pain")
        needs_clarification = True
        clarification_question = "Can you tell me more about the chest pain? Is it sharp, dull, constant, or does it come and go?"
    
    # Check for headache
    elif any(word in message for word in head_pain_keywords):
        symptoms.append("headache")
        needs_clarification = True
        clarification_question = "Can you describe the headache? Is it sharp, dull, on one side, or all over?"
    
    # Check for fever
    elif any(word in message for word in fever_keywords):
        symptoms.append("fever")
        needs_clarification = True
        clarification_question = "Do you know your temperature? How long have you had the fever?"
    
    # Check for stomach issues
    elif any(word in message for word in stomach_keywords):
        symptoms.append("stomach issues")
        needs_clarification = True
        clarification_question = "Can you describe the stomach issue? Is it pain, nausea, or something else?"
    
    # If no specific symptoms found, use the whole message
    if not symptoms:
        symptoms.append(message)
    
    return {
        'symptoms': ', '.join(symptoms) if symptoms else message,
        'needs_clarification': needs_clarification,
        'clarification_question': clarification_question,
        'summary': message if not needs_clarification else f"{', '.join(symptoms)}"
    }

@app.route('/')
def index():
    """Render the main chat interface."""
    # Clear session on page load to start fresh conversation
    session.clear()
    session['patient_data'] = {}
    session['assistant'] = {
        'conversation_state': 'intake',
        'patient_data': {
            'age': None,
            'gender': None,
            'location': None,
            'zip_code': None,
            'conditions': [],
            'symptoms': '',
            'primary_condition': None,
            'preferences': None,
            'condition_details': {},
            'condition_category': None,
            'condition_criteria_map': {},
        }
    }
    return render_template('index.html')

# In app.py, update the chat endpoint
@app.route('/api/chat', methods=['POST'])
def chat():
    try:
        data = request.get_json()
        user_message = data.get('message', '').strip()

        # Initialize conversation assistant if not exists
        if 'assistant' not in session:
            session['assistant'] = {
                'conversation_state': 'intake',
                'patient_data': {
                    'age': None,
                    'gender': None,
                    'location': None,
                    'zip_code': None,
                    'conditions': [],
                    'symptoms': '',
                    'primary_condition': None,
                    'preferences': None,
                    'condition_details': {},
                    'condition_category': None,
                    'condition_criteria_map': {},
                }
            }

        # Handle client-side session restore
        if user_message == '/restore':
            profile = data.get('profile', {})
            demos = profile.get('demographics', {})
            pd = session['assistant']['patient_data']
            if demos.get('age'):
                pd['age'] = demos['age']
            if demos.get('gender'):
                pd['gender'] = demos['gender']
            if demos.get('location'):
                pd['location'] = demos['location']
                import re as _re
                m = _re.search(r'\b(\d{5})\b', str(demos['location']))
                if m:
                    pd['zip_code'] = m.group(1)
            if profile.get('condition'):
                pd['conditions'] = [profile['condition']]
                pd['primary_condition'] = profile['condition']
            if profile.get('conditionDetails'):
                pd['condition_details'] = profile['conditionDetails']
            if profile.get('conditionCategory'):
                pd['condition_category'] = profile['conditionCategory']
            session['assistant']['conversation_state'] = 'ready_to_search'
            session.modified = True
            return jsonify({'status': 'restored'})

        # Get or create conversation assistant
        assistant = ConversationalTrialAssistant()
        assistant.conversation_state = session['assistant']['conversation_state']
        assistant.patient_data = session['assistant']['patient_data']
        assistant._pending_followups = session['assistant'].get('pending_followups', [])
        assistant._use_dynamic_followups = session['assistant'].get('use_dynamic_followups', False)

        # Process the message
        response, done = assistant.process_response(user_message)

        # Update session (persist followup state across requests)
        session['assistant'] = {
            'conversation_state': assistant.conversation_state,
            'patient_data': assistant.patient_data,
            'pending_followups': assistant._pending_followups,
            'use_dynamic_followups': assistant._use_dynamic_followups,
        }
        session.modified = True

        # Check if we're ready to search for trials
        if assistant.conversation_state == 'ready_to_search':
            # Search for matching trials
            patient_data = assistant.patient_data
            primary_condition = patient_data.get('primary_condition') or (patient_data.get('conditions', [None])[0] if patient_data.get('conditions') else None)

            # Build search data for the matcher
            search_data = {
                'age': patient_data.get('age'),
                'gender': patient_data.get('gender'),
                'condition': primary_condition,
                'search_queries': [primary_condition] if primary_condition else []
            }

            # Add symptoms to search queries if available
            if patient_data.get('symptoms'):
                search_data['search_queries'].append(patient_data.get('symptoms'))

            # Add all conditions to search queries
            for cond in patient_data.get('conditions', []):
                if cond and cond not in search_data['search_queries']:
                    search_data['search_queries'].append(cond)

            # Use LLM to extract medical concepts from symptoms
            symptom_analysis = None
            if patient_data.get('symptoms') and patient_data.get('age'):
                try:
                    symptom_analysis = llm_service.analyze_symptoms(
                        patient_data['symptoms'],
                        int(patient_data['age']),
                        patient_data.get('gender', ''),
                    )
                    # Add LLM-extracted keywords to search queries
                    for kw in symptom_analysis.get('medical_keywords', []):
                        if kw and kw not in search_data['search_queries']:
                            search_data['search_queries'].append(kw)
                    for cond in symptom_analysis.get('primary_conditions', []):
                        if cond and cond not in search_data['search_queries']:
                            search_data['search_queries'].append(cond)
                except Exception as llm_err:
                    print(f"LLM symptom analysis failed (non-fatal): {llm_err}")

            # Expand search queries using concept tree — capped to prevent over-expansion
            expanded_terms = set(t.lower() for t in search_data.get('search_queries', []) if t)
            concept_set = set()  # canonical concept IDs for relevance scoring
            try:
                # Only expand the first 3 user terms (primary condition + symptoms)
                for term in list(search_data.get('search_queries', []))[:3]:
                    exp = concept_canon.canonicalize_query(term)
                    if exp.query_success and exp.canonical_match:
                        cid = exp.canonical_match.concept.concept_id
                        concept_set.add(cid)
                        # Add the canonical name itself as a search term
                        canon_name = exp.canonical_match.concept.canonical_name.lower()
                        if canon_name not in expanded_terms:
                            expanded_terms.add(canon_name)
                            search_data['search_queries'].append(canon_name)
                        # Add parent concept as a broader search term
                        parent_id = exp.canonical_match.concept.parent
                        if parent_id:
                            concept_set.add(parent_id)
                            parent_name = parent_id.replace('_', ' ')
                            if parent_name not in expanded_terms:
                                expanded_terms.add(parent_name)
                                search_data['search_queries'].append(parent_name)
                        # Add only direct children (max 3) — not all descendants
                        for child in exp.included_concepts[:3]:
                            concept_set.add(child.concept.concept_id)
                        # Add short keyword forms for SQL LIKE matching
                        for word in cid.split('_'):
                            if len(word) > 4 and word not in expanded_terms:
                                expanded_terms.add(word)
                                search_data['search_queries'].append(word)
            except Exception as exp_err:
                print(f"Concept expansion failed (non-fatal): {exp_err}")

            search_data['concept_set'] = concept_set
            # Cap search queries to avoid excessive SQL queries
            search_data['search_queries'] = search_data['search_queries'][:8]

            trials = matcher.find_matching_trials(search_data)

            # Include condition follow-up details for eligibility matching
            search_data['condition_details'] = patient_data.get('condition_details', {})
            search_data['condition_category'] = patient_data.get('condition_category')
            search_data['condition_criteria_map'] = patient_data.get('condition_criteria_map', {})

            # Build structured patient attributes for SMT evaluation
            patient_attrs = build_patient_attributes(search_data)

            # Infer negative defaults for criteria the patient hasn't mentioned.
            # This resolves "Unknown" status for conditions/treatments that the
            # patient would know about and would have mentioned if they had them.
            trial_nct_ids = [t.get('nct_id', '') for t in trials[:10]]
            patient_attrs = infer_negative_defaults(patient_attrs, trial_nct_ids)

            # Build rich condition text for RAG scoring
            rag_parts = [primary_condition, patient_data.get('symptoms', '')]
            if symptom_analysis:
                rag_parts.extend(symptom_analysis.get('medical_keywords', []))
                if symptom_analysis.get('summary'):
                    rag_parts.append(symptom_analysis['summary'])
            condition_text = ' '.join(filter(None, rag_parts))

            # Get patient location for distance calculation
            patient_location = patient_data.get('location', '')
            patient_zip = patient_data.get('zip_code', '')

            # Build patient preferences for scoring
            raw_prefs = patient_data.get('preferences')
            patient_preferences = None
            if raw_prefs is not None:
                if isinstance(raw_prefs, PatientPreferences):
                    patient_preferences = raw_prefs
                elif isinstance(raw_prefs, dict):
                    patient_preferences = PatientPreferences(
                        travel_willingness=raw_prefs.get('travel_willingness'),
                        risk_tolerance=raw_prefs.get('risk_tolerance'),
                        schedule_flexibility=raw_prefs.get('schedule_flexibility'),
                        acceptable_modalities=(
                            frozenset(raw_prefs['acceptable_modalities'])
                            if raw_prefs.get('acceptable_modalities') else None
                        ),
                    )

            # Filter out trials with zero concept overlap before scoring
            if concept_set:
                filtered_trials = []
                for trial in trials:
                    trial_diseases = (trial.get('diseases') or '').lower()
                    trial_title = (trial.get('title') or trial.get('brief_title') or '').lower()
                    trial_text = trial_diseases + ' ' + trial_title
                    # Check if any concept from the expansion appears in the trial
                    has_overlap = any(
                        cid.replace('_', ' ') in trial_text or cid.replace('_', '') in trial_text.replace(' ', '')
                        for cid in concept_set
                    )
                    # Also allow trials that matched on disease column in retrieval
                    if has_overlap or trial.get('_disease_match'):
                        filtered_trials.append(trial)
                if filtered_trials:
                    trials = filtered_trials
                    print(f"Concept filter: {len(trials)} trials remain after filtering")

            # Format trials with real scoring from SMT + RAG + preferences
            formatted_trials = []
            for trial in trials[:10]:  # Limit to top 10
                nct_id = trial.get('nct_id', '')

                # Calculate distance from patient to trial
                distance = get_trial_distance(patient_location, patient_zip, trial)

                # Compute real eligibility score via unified Matcher
                try:
                    scoring = scoring_matcher.score_trial(
                        patient_attrs, condition_text, nct_id,
                        concept_set=concept_set,
                        preferences=patient_preferences,
                        distance=distance,
                    )
                except Exception as score_err:
                    print(f"Scoring error for {nct_id}: {score_err}")
                    scoring = {
                        'match_score': 50,
                        'hard_met': 0, 'hard_total': 1,
                        'soft_met': 0, 'soft_total': 1,
                        'eligibility_status': 'review_needed',
                        'rag_score': 0.0,
                        'criteria_details': [],
                    }

                # Generate patient-friendly summary for top 5 trials
                plain_summary = ''
                if len(formatted_trials) < 5:
                    try:
                        plain_summary = llm_service.generate_plain_summary(trial)
                    except Exception:
                        plain_summary = ''

                # Generate eligibility visualization breakdown
                viz_data = {}
                try:
                    viz_breakdown = eligibility_viz.get_breakdown(patient_attrs, nct_id)
                    viz_data = eligibility_viz.to_dict(viz_breakdown)
                except Exception as viz_err:
                    print(f"Eligibility viz error for {nct_id}: {viz_err}")

                trial_source = scoring.get('source', trial.get('source', 'sigir'))

                formatted_trials.append({
                    'nct_id': nct_id,
                    'title': trial.get('brief_title') or trial.get('title', 'Clinical Trial'),
                    'brief_summary': trial.get('brief_summary', ''),
                    'plain_summary': plain_summary,
                    'phase': trial.get('phase', ''),
                    'enrollment': trial.get('enrollment', ''),
                    'drugs': trial.get('drugs', ''),
                    'status': _format_status(trial.get('status')),
                    'distance': distance,
                    'location': trial.get('location', ''),
                    'source': 'clinicaltrials.gov' if trial_source == 'ctgov_api' else 'sigir',
                    # Real scoring data
                    'match_score': scoring['match_score'],
                    'hard_met': scoring['hard_met'],
                    'hard_total': scoring['hard_total'],
                    'soft_met': scoring['soft_met'],
                    'soft_total': scoring['soft_total'],
                    'eligibility_status': scoring['eligibility_status'],
                    'rag_score': scoring['rag_score'],
                    'criteria_details': scoring['criteria_details'],
                    'preference_score': scoring.get('preference_score'),
                    'preference_breakdown': scoring.get('preference_breakdown', {}),
                    # Eligibility visualization data
                    'eligibility_breakdown': viz_data,
                })

            # Sort by match score (highest first), API trials win ties
            formatted_trials.sort(
                key=lambda x: (
                    x.get('match_score', 0),
                    1 if x.get('source') == 'clinicaltrials.gov' else 0,
                ),
                reverse=True,
            )

            # Generate concept expansion audit for the search terms
            concept_audit = []
            search_terms = search_data.get('search_queries', [])
            if primary_condition:
                search_terms = [primary_condition] + [
                    t for t in search_terms if t != primary_condition
                ]
            for term in search_terms[:3]:
                try:
                    expansion = concept_canon.canonicalize_query(term)
                    concept_audit.append(
                        concept_canon.expansion_to_dict(expansion)
                    )
                except Exception:
                    pass

            # Get last-updated timestamp for data freshness display
            data_last_updated = None
            try:
                db_path = os.path.join(os.path.dirname(__file__), 'trial_data.sqlite')
                _conn = sqlite3.connect(db_path)
                _row = _conn.execute(
                    "SELECT MAX(last_updated) FROM trials WHERE last_updated IS NOT NULL"
                ).fetchone()
                if _row and _row[0]:
                    data_last_updated = _row[0]
                _conn.close()
            except Exception:
                pass

            return jsonify({
                'status': 'complete',
                'response': response if response else '',
                'trials': formatted_trials,
                'patient_location': patient_location,
                'conversation_state': assistant.conversation_state,
                'concept_audit': concept_audit,
                'patient_summary': {
                    'age': patient_data.get('age'),
                    'gender': patient_data.get('gender'),
                    'location': patient_data.get('location'),
                    'condition': primary_condition,
                    'symptoms': patient_data.get('symptoms'),
                },
                'data_last_updated': data_last_updated,
                'condition_followups': get_followup_questions(primary_condition) if primary_condition else [],
            })

        # For non-search responses, include condition follow-ups when detected
        condition_fups = []
        detected_condition = assistant.patient_data.get('primary_condition') or (
            assistant.patient_data.get('conditions', [None])[0]
            if assistant.patient_data.get('conditions') else None
        )
        if detected_condition:
            condition_fups = get_followup_questions(detected_condition)

        result = {
            'status': 'continue',
            'response': response if response else '',
            'conversation_state': assistant.conversation_state,
            'condition_followups': condition_fups,
        }

        # Include server-driven quick-reply buttons when available
        if assistant.quick_replies:
            result['quick_replies'] = assistant.quick_replies

        return jsonify(result)

    except Exception as e:
        print(f"Error in chat endpoint: {str(e)}")
        import traceback
        traceback.print_exc()
        return jsonify({
            'status': 'continue',
            'response': "I'm having trouble processing that right now. Could you try again?"
        }), 500

@app.route('/api/trials/<nct_id>')
def get_trial(nct_id: str):
    """Get detailed information about a specific trial."""
    trial = matcher.get_trial_details(nct_id)
    if trial:
        return jsonify({
            'success': True,
            'trial': trial
        })
    return jsonify({'success': False, 'error': 'Trial not found'}), 404

@app.route('/api/trials')
def list_trials():
    """List all available trials (for demo purposes)."""
    cursor = matcher.conn.cursor()
    cursor.execute("SELECT nct_id, brief_title, brief_summary FROM trials LIMIT 20")
    trials = [dict(row) for row in cursor.fetchall()]
    return jsonify({'trials': trials})

# ============ Concept Canonicalization API ============

@app.route('/api/concepts/expand', methods=['POST'])
def concept_expand():
    """
    Show the concept expansion tree for a search term.

    Accepts JSON: { "query": "appendicitis" }
    Returns the canonical concept matched, included/excluded children,
    related concepts, and trial terms matched.
    """
    data = request.get_json() or {}
    query = data.get('query', '').strip()
    if not query:
        return jsonify({'error': 'query is required'}), 400

    expansion = concept_canon.canonicalize_query(query)
    result = concept_canon.expansion_to_dict(expansion)
    result['tree_display'] = concept_canon.build_tree_display(expansion)
    return jsonify({'success': True, 'expansion': result})


@app.route('/api/concepts/search-mapping', methods=['POST'])
def concept_search_mapping():
    """
    Show the full transparency mapping for a user search query.

    Returns what canonical concepts were mapped, what trial terms
    would be matched, and what was considered but rejected.
    """
    data = request.get_json() or {}
    query = data.get('query', '').strip()
    if not query:
        return jsonify({'error': 'query is required'}), 400

    expansion = concept_canon.canonicalize_query(query)
    result = concept_canon.expansion_to_dict(expansion)

    # Add search-specific info: what DB criteria would actually be searched
    if expansion.query_success and expansion.canonical_match:
        concept_id = expansion.canonical_match.concept.concept_id
        # Build the set of criteria attributes that would be searched
        searched_attrs = []
        for key in concept_canon._db_concepts:
            if concept_id in key:
                searched_attrs.append(f"patient_has_diagnosis_of_{key}_now")

        hierarchy = _CONCEPT_HIERARCHY.get(concept_id, {})
        for child_id in hierarchy.get("children", []):
            for key in concept_canon._db_concepts:
                if child_id in key:
                    searched_attrs.append(f"patient_has_diagnosis_of_{key}_now")

        result['searched_criteria_attributes'] = searched_attrs

    return jsonify({'success': True, 'mapping': result})


# ============ Eligibility Visualization API ============

@app.route('/api/eligibility/breakdown', methods=['POST'])
def eligibility_breakdown():
    """
    Get a structured eligibility breakdown for a patient-trial pair.

    Accepts JSON body with:
      - patient_profile: dict with age, sex, condition, prior_treatments, lab values, etc.
      - nct_id: trial identifier

    Returns structured checklist with eligible/ineligible/unknown per criterion,
    ineligibility explanations with unsat core, and clarifying questions.
    """
    data = request.get_json()
    if not data:
        return jsonify({'error': 'Request body required'}), 400

    patient_profile = data.get('patient_profile', {})
    nct_id = data.get('nct_id', '')

    if not nct_id:
        return jsonify({'error': 'nct_id is required'}), 400

    # Build patient attributes from the profile
    patient_attrs = build_patient_attributes(patient_profile)

    # Merge any extra attributes provided directly (lab values, etc.)
    for key, value in patient_profile.items():
        if key not in ('age', 'gender', 'sex', 'condition', 'location', 'zip_code'):
            patient_attrs[key] = value

    breakdown = eligibility_viz.get_breakdown(patient_attrs, nct_id)
    result = eligibility_viz.to_dict(breakdown)

    return jsonify({'success': True, 'breakdown': result})


@app.route('/api/eligibility/explain/<nct_id>', methods=['POST'])
def eligibility_explain(nct_id: str):
    """
    Get a plain-language ineligibility explanation for a patient-trial pair.

    Returns the unsat core in both formal constraint representation
    and patient-readable form.
    """
    data = request.get_json() or {}
    patient_profile = data.get('patient_profile', {})

    patient_attrs = build_patient_attributes(patient_profile)
    for key, value in patient_profile.items():
        if key not in ('age', 'gender', 'sex', 'condition', 'location', 'zip_code'):
            patient_attrs[key] = value

    breakdown = eligibility_viz.get_breakdown(patient_attrs, nct_id)
    result = eligibility_viz.to_dict(breakdown)

    return jsonify({
        'success': True,
        'nct_id': nct_id,
        'overall_status': result['overall_status'],
        'ineligibility_explanation': result['ineligibility_explanation'],
        'unsat_core': result['unsat_core'],
        'failed_criteria': [
            c for c in result['criteria'] if c['status'] == 'ineligible'
        ],
    })


@app.route('/api/eligibility/questions/<nct_id>', methods=['POST'])
def eligibility_questions(nct_id: str):
    """
    Get clarifying questions for criteria where the patient's eligibility
    status is 'unknown' (not enough information to determine).
    """
    data = request.get_json() or {}
    patient_profile = data.get('patient_profile', {})

    patient_attrs = build_patient_attributes(patient_profile)
    for key, value in patient_profile.items():
        if key not in ('age', 'gender', 'sex', 'condition', 'location', 'zip_code'):
            patient_attrs[key] = value

    breakdown = eligibility_viz.get_breakdown(patient_attrs, nct_id)
    result = eligibility_viz.to_dict(breakdown)

    return jsonify({
        'success': True,
        'nct_id': nct_id,
        'unknown_count': result['unknown_count'],
        'clarifying_questions': result['clarifying_questions'],
    })


# ============ Progressive Eligibility API ============

@app.route('/api/eligibility/progressive/start', methods=['POST'])
def progressive_start():
    """
    Start a progressive eligibility check for a patient-trial pair.

    Evaluates known criteria, then returns prioritized questions for
    unknown ones. If a hard exclusion is hit, remaining questions are skipped.

    Accepts JSON: { "patient_profile": {...}, "nct_id": "NCT..." }
    """
    data = request.get_json() or {}
    patient_profile = data.get('patient_profile', {})
    nct_id = data.get('nct_id', '')

    if not nct_id:
        return jsonify({'error': 'nct_id is required'}), 400

    patient_attrs = build_patient_attributes(patient_profile)
    for key, value in patient_profile.items():
        if key not in ('age', 'gender', 'sex', 'condition', 'location', 'zip_code'):
            patient_attrs[key] = value

    state = progressive_checker.start_check(patient_attrs, nct_id)
    result = progressive_checker.state_to_dict(state)

    # Store state in session for multi-turn flow
    session['progressive_state'] = {
        'nct_id': nct_id,
        'patient_attrs': patient_attrs,
        'answered': {},
    }

    return jsonify({'success': True, 'state': result})


@app.route('/api/eligibility/progressive/answer', methods=['POST'])
def progressive_answer():
    """
    Process a patient's answer to a clarifying question and return
    the updated eligibility state.

    Accepts JSON: { "attribute": "...", "answer": "..." }
    """
    data = request.get_json() or {}
    attribute = data.get('attribute', '')
    answer = data.get('answer')

    if not attribute:
        return jsonify({'error': 'attribute is required'}), 400

    prog_state = session.get('progressive_state')
    if not prog_state:
        return jsonify({'error': 'No progressive check in progress'}), 400

    nct_id = prog_state['nct_id']
    patient_attrs = prog_state['patient_attrs']

    # Add the new answer to patient attributes
    from progressive_eligibility import ProgressiveEligibilityChecker
    parsed = ProgressiveEligibilityChecker._parse_answer(answer)
    patient_attrs[attribute] = parsed
    prog_state['answered'][attribute] = parsed

    # Re-evaluate with updated attributes
    state = progressive_checker.start_check(patient_attrs, nct_id)
    result = progressive_checker.state_to_dict(state)

    # Update session
    prog_state['patient_attrs'] = patient_attrs
    session['progressive_state'] = prog_state
    session.modified = True

    return jsonify({'success': True, 'state': result})


# ============ Condition Follow-up Questions API ============

@app.route('/api/condition/followups', methods=['POST'])
def condition_followups_api():
    """Get follow-up questions for a detected condition."""
    data = request.get_json() or {}
    condition = data.get('condition', '')

    if not condition:
        return jsonify({'error': 'No condition provided'}), 400

    questions = get_followup_questions(condition)
    category = detect_condition(condition)

    return jsonify({
        'condition': condition,
        'category': category.category_id if category else None,
        'category_display': category.display_name if category else None,
        'questions': questions,
    })


@app.route('/api/condition/followups/answer', methods=['POST'])
def condition_followup_answer():
    """Parse a follow-up answer and merge into patient attributes."""
    data = request.get_json() or {}
    answer = data.get('answer', '')
    attribute = data.get('attribute', '')
    category_id = data.get('category_id', '')
    followup = data.get('followup', {})

    if not answer or not attribute:
        return jsonify({'error': 'Missing answer or attribute'}), 400

    # Parse the answer
    attr, value = parse_answer(answer, followup or {'attribute': attribute, 'value_type': 'text'})

    # Merge into session patient attributes
    patient_attrs = session.get('patient_attrs', {})
    answers = {attr: value}
    patient_attrs = merge_followup_answers(patient_attrs, category_id, answers)
    session['patient_attrs'] = patient_attrs
    session.modified = True

    return jsonify({
        'success': True,
        'attribute': attr,
        'parsed_value': value,
        'patient_attrs_updated': list(patient_attrs.keys()),
    })


# ============ Clinician Dashboard API ============

@app.route('/api/clinician/patients')
def clinician_patients():
    """List SIGIR patients with summary info for the clinician dashboard."""
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    cursor = conn.cursor()

    cursor.execute("SELECT patient_id, note, created_at FROM patients ORDER BY patient_id")
    rows = cursor.fetchall()

    patients = []
    for row in rows:
        pid = row['patient_id']
        note = row['note'] or ''

        # Count attributes and rankings
        cursor.execute(
            "SELECT COUNT(*) FROM patient_attributes WHERE patient_id = ?", (pid,)
        )
        attr_count = cursor.fetchone()[0]

        cursor.execute(
            "SELECT COUNT(*) FROM patient_trial_rankings WHERE patient_id = ?", (pid,)
        )
        ranking_count = cursor.fetchone()[0]

        # Extract basic demographics from the note
        age_match = re.search(r'(\d{1,3})-year-old', note)
        gender_match = re.search(r'(male|female|man|woman)', note, re.IGNORECASE)

        patients.append({
            'id': pid,
            'note_excerpt': note[:200] + ('...' if len(note) > 200 else ''),
            'age': int(age_match.group(1)) if age_match else None,
            'sex': gender_match.group(1).capitalize() if gender_match else None,
            'attribute_count': attr_count,
            'ranked_trials': ranking_count,
            'status': 'pending',
        })

    conn.close()
    return jsonify({'patients': patients})


@app.route('/api/clinician/patient/<patient_id>/evaluations')
def clinician_patient_evaluations(patient_id: str):
    """Get detailed trial evaluations for a specific SIGIR patient."""
    try:
        patient_attrs = scoring_matcher.load_patient_attributes(patient_id)
    except ValueError:
        return jsonify({'error': f'Patient {patient_id} not found'}), 404

    # Get the patient note for RAG scoring
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    cursor = conn.cursor()
    cursor.execute("SELECT note FROM patients WHERE patient_id = ?", (patient_id,))
    row = cursor.fetchone()
    patient_note = row['note'] if row else ''

    # Get ranked trials for this patient
    cursor.execute(
        """
        SELECT ptr.nct_id, ptr.rank, t.title, t.brief_summary, t.phase, t.status
        FROM patient_trial_rankings ptr
        JOIN trials t ON t.nct_id = ptr.nct_id
        WHERE ptr.patient_id = ?
        ORDER BY COALESCE(ptr.rank, 9999)
        LIMIT 20
        """,
        (patient_id,),
    )
    ranked_trials = cursor.fetchall()
    conn.close()

    evaluations = []
    for trial_row in ranked_trials:
        nct_id = trial_row['nct_id']
        try:
            scoring = scoring_matcher.score_trial(
                patient_attrs, patient_note, nct_id, use_llm_judge=False
            )
        except Exception:
            scoring = {
                'match_score': 0, 'hard_met': 0, 'hard_total': 0,
                'soft_met': 0, 'soft_total': 0,
                'eligibility_status': 'review_needed',
                'rag_score': 0.0, 'criteria_details': [],
            }

        evaluations.append({
            'nct_id': nct_id,
            'gold_rank': trial_row['rank'],
            'title': trial_row['title'],
            'phase': trial_row['phase'],
            'status': trial_row['status'],
            'match_score': scoring['match_score'],
            'hard_met': scoring['hard_met'],
            'hard_total': scoring['hard_total'],
            'soft_met': scoring['soft_met'],
            'soft_total': scoring['soft_total'],
            'eligibility_status': scoring['eligibility_status'],
            'criteria_details': scoring['criteria_details'],
        })

    return jsonify({
        'patient_id': patient_id,
        'note': patient_note,
        'attribute_count': len(patient_attrs),
        'evaluations': evaluations,
    })


if __name__ == '__main__':
    os.makedirs('templates', exist_ok=True)
    debug = not is_production
    port = int(os.environ.get('PORT', 5001))
    app.run(debug=debug, port=port, host='0.0.0.0')
