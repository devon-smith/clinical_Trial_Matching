"""
SMT-based matcher for clinical trial eligibility criteria.

This module provides a Z3-based SMT solver implementation for evaluating
clinical trial eligibility criteria with support for complex logical constraints.
"""

from dataclasses import dataclass, field
from enum import Enum, auto
from pathlib import Path
from typing import Dict, List, Optional, Union, Any, Set
import json
import re
import sqlite3
from z3 import (
    Solver, Int, Real, Bool, String, 
    And, Or, Not, Implies, 
    IntVal, RealVal, StringVal,
    is_int, is_real, is_bool, is_string,
    sat, unsat, unknown, 
    ArithRef, BoolRef, 
    parse_smt2_string
)

# Type aliases
Z3Expr = Union[ArithRef, BoolRef, Any]  # Using Any for String-like types

class ValueType(Enum):
    INTEGER = auto()
    FLOAT = auto()
    BOOLEAN = auto()
    STRING = auto()
    UNKNOWN = auto()

@dataclass
class Constraint:
    """
    Represents a single constraint in the eligibility criteria.
    
    Attributes:
        attribute: The patient attribute this constraint applies to
        operator: The comparison operator (e.g., '==', '>=', '<', etc.)
        value: The value to compare against
        value_type: The type of the value (INT, FLOAT, BOOL, STR, etc.)
        description: Human-readable description of the constraint
        is_inclusion: Whether this is an inclusion (True) or exclusion (False) criterion
        hard_constraint: Whether this is a hard constraint (must be satisfied) or soft (preferred but not required)
    """
    attribute: str
    operator: str
    value: Any
    value_type: ValueType
    description: str = ""
    is_inclusion: bool = True  # True for inclusion, False for exclusion
    hard_constraint: bool = True  # True for hard constraints, False for soft constraints
    
    def to_z3(self, patient_vars: Dict[str, Z3Expr]) -> Optional[BoolRef]:
        """Convert this constraint to a Z3 expression."""
        if self.attribute not in patient_vars:
            return None
            
        var = patient_vars[self.attribute]
        val = self._to_z3_value()
        
        if val is None:
            return None
            
        # Handle different operators
        if self.operator == "==":
            return var == val
        elif self.operator == "!=":
            return var != val
        elif self.operator == "<":
            return var < val
        elif self.operator == "<=":
            return var <= val
        elif self.operator == ">":
            return var > val
        elif self.operator == ">=":
            return var >= val
        elif self.operator == "in":
            if isinstance(val, list):
                return Or([var == v for v in val])
            return var == val
        return None
    
    def _to_z3_value(self) -> Optional[Union[int, float, bool, str, List[Any]]]:
        """Convert the constraint value to a Z3-compatible value."""
        if self.value_type == ValueType.INTEGER:
            return int(self.value) if self.value is not None else None
        elif self.value_type == ValueType.FLOAT:
            return float(self.value) if self.value is not None else None
        elif self.value_type == ValueType.BOOLEAN:
            return bool(self.value) if self.value is not None else None
        elif self.value_type == ValueType.STRING:
            return str(self.value) if self.value is not None else None
        return None

@dataclass
class TrialCriteria:
    """
    Represents all constraints for a single clinical trial, including both
    hard and soft constraints.
    """
    nct_id: str
    constraints: List[Constraint] = field(default_factory=list)
    
    def add_constraint(self, constraint: Constraint) -> None:
        """Add a constraint to this trial's criteria."""
        self.constraints.append(constraint)
    
    def get_hard_constraints(self) -> List[Constraint]:
        """Get all hard constraints (must be satisfied)."""
        return [c for c in self.constraints if c.hard_constraint]
    
    def get_soft_constraints(self) -> List[Constraint]:
        """Get all soft constraints (preferred but not required)."""
        return [c for c in self.constraints if not c.hard_constraint]
    
    def to_z3(self, patient_vars: Dict[str, Z3Expr]) -> BoolRef:
        """Convert all criteria to a single Z3 expression."""
        # Only hard constraints are used in the base Z3 expression
        hard_constraints = self.get_hard_constraints()
        inclusion_exprs = []
        for c in hard_constraints:
            if c.is_inclusion:  # Only include inclusion criteria in the base expression
                expr = c.to_z3(patient_vars)
                if expr is not None:
                    inclusion_exprs.append(expr)
        
        # No exclusion criteria should be satisfied
        exclusion_exprs = []
        for c in self.exclusion_criteria:
            expr = c.to_z3(patient_vars)
            if expr is not None:
                exclusion_exprs.append(Not(expr))
        
        # Combine all constraints
        all_constraints = inclusion_exprs + exclusion_exprs
        return And(all_constraints) if all_constraints else Bool(True)

class SMTMatcher:
    """SMT-based matcher for clinical trial eligibility criteria."""
    
    def __init__(self, db_path: Union[str, Path]):
        """Initialize with path to the SQLite database."""
        self.db_path = str(db_path)
        self.solver = Solver()
        self.patient_vars: Dict[str, Z3Expr] = {}
        self.trials: Dict[str, TrialCriteria] = {}
        self._load_trials()
    
    def _connect(self) -> sqlite3.Connection:
        """Create a database connection."""
        conn = sqlite3.connect(self.db_path)
        conn.row_factory = sqlite3.Row
        return conn
    
    def _load_trials(self) -> None:
        """
        Load trial criteria from the database, including hard and soft constraints.
        
        Hard constraints are requirements that must be met for eligibility.
        Soft constraints are preferred but not required.
        """
        conn = self._connect()
        cursor = conn.cursor()
        
        # Debug: Count trials and criteria before loading
        cursor.execute("SELECT COUNT(*) FROM trials")
        trial_count = cursor.fetchone()[0]
        cursor.execute("SELECT COUNT(*) FROM criteria")
        criteria_count = cursor.fetchone()[0]
        print(f"Loading {trial_count} trials and {criteria_count} criteria...")
    
        # 1. First, load all trials
        cursor.execute("""
            SELECT nct_id, title, brief_summary
            FROM trials
        """)
    
        trials_data = cursor.fetchall()
        print(f"Loaded {len(trials_data)} trials")
    
        # 2. Then load all criteria
        cursor.execute("""
            SELECT 
                nct_id, 
                criterion_type as attribute, 
                criterion_value as value, 
                value_type,
                comparison as operator, 
                is_inclusion,
                source as description,
                COALESCE(hard_constraint, 1) as hard_constraint
            FROM criteria
        """)
    
        criteria_data = cursor.fetchall()
        print(f"Loaded {len(criteria_data)} criteria")
    
        # 3. Group criteria by trial
        criteria_by_trial = {}
        for c in criteria_data:
            criteria_by_trial.setdefault(c['nct_id'], []).append(c)
    
        # 4. Create TrialCriteria objects with their constraints
        for trial_row in trials_data:
            nct_id = trial_row['nct_id']
            trial = TrialCriteria(nct_id)
            trial.title = trial_row['title']
            trial.description = trial_row['brief_summary'] if 'brief_summary' in trial_row else ''
        
            # Add constraints if any
            if nct_id in criteria_by_trial:
                for c in criteria_by_trial[nct_id]:
                    # In the _load_trials method, update the constraint creation part:
                    try:
                        value_type = ValueType[c['value_type'].upper()] if c['value_type'] else ValueType.UNKNOWN
                        constraint = Constraint(
                            attribute=c['attribute'],
                            operator=c['operator'] or '==',
                            value=c['value'],
                            value_type=value_type,
                            description=c['description'] if 'description' in c and c['description'] else '',
                            is_inclusion=bool(c['is_inclusion']),
                            hard_constraint=bool(c['hard_constraint'])
                        )
                        trial.add_constraint(constraint)
                    except Exception as e:
                        print(f"Error adding constraint to trial {nct_id}: {e}")
                        print(f"Constraint data: {dict(c)}")  # This will show all available fields
        
            self.trials[nct_id] = trial
    
        # 5. Debug: Print sample of loaded data
        print("\n=== Sample of Loaded Trials ===")
        for nct_id, trial in list(self.trials.items())[:3]:  # Show first 3 trials
            constraints = getattr(trial, 'constraints', [])
            print(f"\nTrial: {trial.title} ({nct_id})")
            print(f"Constraints: {len(constraints)} total")
            for i, c in enumerate(constraints[:3], 1):  # Show first 3 constraints
                print(f"  {i}. {c.attribute} {c.operator} {c.value} "
                  f"(Incl: {c.is_inclusion}, Hard: {c.hard_constraint})")
    
        conn.close()
    
    def create_patient_variables(self, patient_attrs: Dict[str, Any]) -> Dict[str, Z3Expr]:
        """Create Z3 variables for patient attributes."""
        vars = {}
        for attr, value in patient_attrs.items():
            if isinstance(value, bool):
                vars[attr] = Bool(attr)
            elif isinstance(value, int):
                vars[attr] = Int(attr)
            elif isinstance(value, float):
                vars[attr] = Real(attr)
            elif isinstance(value, str):
                vars[attr] = String(attr)
            else:
                # Default to string for unknown types
                vars[attr] = String(attr)
        return vars
    
    def evaluate_trial(self, patient_attrs: Dict[str, Any], nct_id: str) -> Dict[str, Any]:
        """
        Evaluate a patient against a specific trial's criteria.
        """
        # Debug: Print trial and patient info
        print(f"\n=== Evaluating trial {nct_id} ===")
        print("Patient attributes:", patient_attrs)
    
        self.patient_attrs = patient_attrs
    
        if nct_id not in self.trials:
            print(f"❌ Trial {nct_id} not found in database")
            return {
                'status': 'MISSING',
                'missing_attrs': ['trial_definition'],
                'constraints': [],
                'failed_constraints': [],
                'soft_constraints_met': [],
                'soft_constraints_unmet': []
            }
                    
        trial = self.trials[nct_id]
        print(f"Found trial with {len(trial.get_hard_constraints())} hard and {len(trial.get_soft_constraints())} soft constraints")
    
        # Initialize variables
        hard_constraints = trial.get_hard_constraints()
        soft_constraints = trial.get_soft_constraints()
        missing = set()
        failed_hard = []
        soft_met = []  # Initialize soft_met
        soft_unmet = []  # Initialize soft_unmet
    
        # Check hard constraints
        for constraint in hard_constraints:
            if constraint.attribute not in patient_attrs:
                print(f"  ❌ Missing attribute: {constraint.attribute}")
                missing.add(constraint.attribute)
                failed_hard.append({
                    'attribute': constraint.attribute,
                    'operator': constraint.operator,
                    'value': constraint.value,
                    'description': constraint.description,
                    'is_inclusion': constraint.is_inclusion,
                    'reason': 'Missing attribute'
                })
            elif not self._is_constraint_satisfied(constraint):
                print(f"  ❌ Failed hard constraint: {constraint.attribute} {constraint.operator} {constraint.value}")
                failed_hard.append({
                    'attribute': constraint.attribute,
                    'operator': constraint.operator,
                    'value': constraint.value,
                    'description': constraint.description,
                    'is_inclusion': constraint.is_inclusion,
                    'reason': 'Condition not met'
                })
            else:
                print(f"  ✅ Passed hard constraint: {constraint.attribute} {constraint.operator} {constraint.value}")
    
        # Check soft constraints
        for constraint in soft_constraints:
            if constraint.attribute not in patient_attrs:
                print(f"  ⚠️ Missing attribute for soft constraint: {constraint.attribute}")
                soft_unmet.append({
                    'attribute': constraint.attribute,
                    'operator': constraint.operator,
                    'value': constraint.value,
                    'description': constraint.description,
                    'is_inclusion': constraint.is_inclusion,
                    'reason': 'Missing attribute'
                })
                continue 
            
            if self._is_constraint_satisfied(constraint):
                print(f"  ✅ Met soft constraint: {constraint.attribute} {constraint.operator} {constraint.value}")
                soft_met.append({
                    'attribute': constraint.attribute,
                    'operator': constraint.operator,
                    'value': constraint.value,
                    'description': constraint.description,
                    'is_inclusion': constraint.is_inclusion
                })
            else:
                print(f"  ⚠️ Unmet soft constraint: {constraint.attribute} {constraint.operator} {constraint.value}")
                soft_unmet.append({
                    'attribute': constraint.attribute,
                    'operator': constraint.operator,
                    'value': constraint.value,
                    'description': constraint.description,
                    'is_inclusion': constraint.is_inclusion,
                    'reason': 'Condition not met'
                })
    
        if missing or failed_hard:
            print(f"❌ Trial {nct_id} FAILED: {len(failed_hard)} hard constraints failed")
            return {
                'status': 'FAIL',
                'missing_attrs': list(missing),
                'constraints': [{
                **c.__dict__,
                'met': c.attribute not in missing and 
                      not any(f['attribute'] == c.attribute and 
                            f['operator'] == c.operator and 
                            f['value'] == c.value 
                            for f in failed_hard),
                'hard_constraint': c in hard_constraints
            } for c in hard_constraints + soft_constraints],
            'failed_constraints': failed_hard,
            'soft_constraints_met': [],
            'soft_constraints_unmet': []
        }
        else:
            print(f"✅ Trial {nct_id} PASSED hard constraints")
            print(f"   Soft constraints: {len(soft_met)} met, {len(soft_unmet)} unmet")
        
        all_constraints = []
        for c in hard_constraints:
            all_constraints.append({
                **c.__dict__,
                'met': True,    
                'hard_constraint': True
            })
        
        for c in soft_constraints:
            all_constraints.append({
                **c.__dict__,
                'met': any(m['attribute'] == c.attribute and 
                          m['operator'] == c.operator and 
                          m['value'] == c.value 
                          for m in soft_met),
                'hard_constraint': False
            })
        
        return {
            'status': 'PASS',
            'missing_attrs': [],
            'constraints': all_constraints,
            'failed_constraints': [],
            'soft_constraints_met': soft_met,
            'soft_constraints_unmet': soft_unmet
        }
    
    def _is_constraint_satisfied(self, constraint: Constraint) -> bool:
        """Check if a single constraint is satisfied."""
        # Debug: Print constraint being checked
        print(f"\nChecking constraint: {constraint.attribute} {constraint.operator} {constraint.value}")
    
        # Get the patient's value for this attribute
        # Map complex criteria names to simpler patient attributes
        attr_map = {
            'patient_has_diagnosis_of_obesity_inthehistory': 'obesity',
            'patient_has_diagnosis_of_hypertension': 'hypertension',
            'patient_age_value_recorded_now_in_years': 'age',
        # Add more mappings as needed
        }
    
        # Use the mapped attribute name if available, otherwise use the original
        attr_name = attr_map.get(constraint.attribute, constraint.attribute)
    
        if attr_name not in self.patient_attrs:
            print(f"  ❌ Missing patient attribute: {attr_name}")
            return False
        
        patient_value = self.patient_attrs[attr_name]
        constraint_value = constraint.value.lower() if isinstance(constraint.value, str) else constraint.value
    
        # Debug: Print values being compared
        print(f"  Patient value: {patient_value} (type: {type(patient_value)})")
        print(f"  Constraint value: {constraint_value} (type: {type(constraint_value)})")
    
        try:
            # Handle different comparison operators
            if constraint.operator == 'equals':
                # Convert both to string and compare case-insensitive for string values
                if isinstance(patient_value, str) and isinstance(constraint_value, str):
                    return patient_value.lower() == constraint_value.lower()
                return patient_value == constraint_value
            elif constraint.operator == '>':
                return float(patient_value) > float(constraint_value)
            elif constraint.operator == '>=':
                return float(patient_value) >= float(constraint_value)
            elif constraint.operator == '<':
                return float(patient_value) < float(constraint_value)
            elif constraint.operator == '<=':
                return float(patient_value) <= float(constraint_value)
            else:
                print(f"  ⚠️ Unknown operator: {constraint.operator}")
                return False
        except (ValueError, TypeError) as e:
            print(f"  ⚠️ Error comparing values: {e}")
            return False

    def evaluate_all_trials(self, patient_attrs: Dict[str, Any]) -> Dict[str, Dict[str, Any]]:
        """Evaluate the patient against all trials."""
        results = {}
        for nct_id in self.trials:
            results[nct_id] = self.evaluate_trial(patient_attrs, nct_id)
        return results

# Example usage
if __name__ == "__main__":
    # Example patient data
    patient = {
        'age': 45,
        'gender': 'Male',
        'has_cancer': False,
        'has_hypertension': True,
        'blood_pressure': 130.0
    }
    
    # Initialize the matcher
    matcher = SMTMatcher("trial_data.sqlite")
    
    # Evaluate a specific trial
    result = matcher.evaluate_trial(patient, "NCT12345678")
    print(f"Trial NCT12345678: {result['status']}")
    
    # Evaluate all trials
    all_results = matcher.evaluate_all_trials(patient)
    print(f"\nResults for all trials:")
    for nct_id, result in all_results.items():
        print(f"{nct_id}: {result['status']}")
