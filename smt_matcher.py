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
        Soft constraints are preferred but not required (e.g., "patient should have had an X-ray").
        """
        conn = self._connect()
        cursor = conn.cursor()
        
        # Get all trials
        cursor.execute("""
            SELECT DISTINCT nct_id, title, brief_summary
            FROM trials
        """)
        
        for row in cursor.fetchall():
            nct_id = row['nct_id']
            self.trials[nct_id] = TrialCriteria(nct_id)
        
        # Load inclusion/exclusion criteria with hard/soft constraint information
        cursor.execute("""
            SELECT 
                c.nct_id, 
                c.criterion_type as attribute, 
                c.criterion_value as value, 
                c.value_type,
                c.comparison as operator, 
                c.is_inclusion,
                c.source as description,
                COALESCE(c.hard_constraint, 1) as hard_constraint  -- Default to hard constraint if not specified
            FROM criteria c
        """)
        
        for row in cursor.fetchall():
            try:
                value_type = ValueType[row['value_type'].upper()] if row['value_type'] else ValueType.UNKNOWN
                constraint = Constraint(
                    attribute=row['attribute'],
                    operator=row['operator'] or '==',
                    value=row['value'],
                    value_type=value_type,
                    description=row['description'] or '',
                    is_inclusion=bool(row['is_inclusion']),
                    hard_constraint=bool(row.get('hard_constraint', True))  # Default to True for backward compatibility
                )
                self.trials[row['nct_id']].add_constraint(constraint)
            except Exception as e:
                print(f"Error loading constraint for {row['nct_id']}: {e}")
        
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
        
        Args:
            patient_attrs: Dictionary of patient attributes
            nct_id: The NCT ID of the trial to evaluate against
            
        Returns:
            Dictionary containing:
            - status: 'PASS', 'FAIL', or 'MISSING'
            - missing_attrs: List of missing attributes
            - constraints: List of all constraints with their status
            - failed_constraints: List of failed hard constraints
            - soft_constraints_met: List of soft constraints that were met
            - soft_constraints_unmet: List of soft constraints that were not met
        """
        # Store patient_attrs as an instance variable for _is_constraint_satisfied
        self.patient_attrs = patient_attrs
        
        if nct_id not in self.trials:
            return {
                'status': 'MISSING',
                'missing_attrs': ['trial_definition'],
                'constraints': [],
                'failed_constraints': [],
                'soft_constraints_met': [],
                'soft_constraints_unmet': []
            }
            
        trial = self.trials[nct_id]
        
        # Create patient variables
        patient_vars = self.create_patient_variables(patient_attrs)
        
        # Separate hard and soft constraints
        hard_constraints = trial.get_hard_constraints()
        soft_constraints = trial.get_soft_constraints()
        
        # Check hard constraints
        missing = set()
        failed_hard = []
        
        for constraint in hard_constraints:
            if constraint.attribute not in patient_attrs:
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
                failed_hard.append({
                    'attribute': constraint.attribute,
                    'operator': constraint.operator,
                    'value': constraint.value,
                    'description': constraint.description,
                    'is_inclusion': constraint.is_inclusion,
                    'reason': 'Condition not met'
                })
        
        # If any hard constraints failed, return failure
        if missing or failed_hard:
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
        
        # If we get here, hard constraints are satisfied
        # Now check soft constraints
        soft_met = []
        soft_unmet = []
        
        for constraint in soft_constraints:
            if constraint.attribute not in patient_attrs:
                soft_unmet.append({
                    'attribute': constraint.attribute,
                    'operator': constraint.operator,
                    'value': constraint.value,
                    'description': constraint.description,
                    'is_inclusion': constraint.is_inclusion,
                    'reason': 'Missing attribute'
                })
                continue
                
            # Check if the constraint is satisfied
            if self._is_constraint_satisfied(constraint):
                soft_met.append({
                    'attribute': constraint.attribute,
                    'operator': constraint.operator,
                    'value': constraint.value,
                    'description': constraint.description,
                    'is_inclusion': constraint.is_inclusion
                })
            else:
                soft_unmet.append({
                    'attribute': constraint.attribute,
                    'operator': constraint.operator,
                    'value': constraint.value,
                    'description': constraint.description,
                    'is_inclusion': constraint.is_inclusion,
                    'reason': 'Condition not met'
                })
        
        # Combine all constraints with their status
        all_constraints = []
        for c in hard_constraints:
            all_constraints.append({
                **c.__dict__,
                'met': True,  # If we got here, all hard constraints are met
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
    
        # Check inclusion constraints
        for constraint in trial.inclusion_criteria:
            if all_constraints or not self._is_constraint_satisfied(constraint):
                failed.append({
                    'attribute': constraint.attribute,
                    'operator': constraint.operator,
                    'value': constraint.value,
                    'is_inclusion': True,
                    'description': constraint.description
                })
        
        # Check exclusion constraints
        for constraint in trial.exclusion_criteria:
            if all_constraints or self._is_constraint_satisfied(constraint):
                failed.append({
                    'attribute': constraint.attribute,
                    'operator': constraint.operator,
                    'value': constraint.value,
                    'is_inclusion': False,
                    'description': constraint.description
                })
        
        return failed
    
    def _is_constraint_satisfied(self, constraint: Constraint) -> bool:
        """Check if a single constraint is satisfied in the current model."""
        # Get the patient's value for this attribute
        if constraint.attribute not in self.patient_attrs:
            return False
            
        patient_value = self.patient_attrs[constraint.attribute]
        constraint_value = constraint.value
        
        # Handle different comparison operators
        try:
            if constraint.operator == '==':
                return patient_value == constraint_value
            elif constraint.operator == '!=':
                return patient_value != constraint_value
            elif constraint.operator == '>':
                return patient_value > constraint_value
            elif constraint.operator == '>=':
                return patient_value >= constraint_value
            elif constraint.operator == '<':
                return patient_value < constraint_value
            elif constraint.operator == '<=':
                return patient_value <= constraint_value
            else:
                # Default to equality check for unknown operators
                return patient_value == constraint_value
        except (TypeError, ValueError):
            # If there's a type mismatch during comparison, consider it not satisfied
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
