"""Tests for hard and soft constraint handling in the SMT matcher."""
import unittest
import sys
from pathlib import Path
from typing import Dict, Any

# Add parent directory to path to allow imports
sys.path.append(str(Path(__file__).parent.absolute()))

from Matcher import TrialMatcher
from smt_matcher import TrialCriteria, Constraint, ValueType

class TestHardSoftConstraints(unittest.TestCase):
    """Test cases for hard and soft constraint handling."""
    
    @classmethod
    def setUpClass(cls):
        """Set up test data and matcher instance."""
        db_path = Path("trial_data.sqlite")
        if not db_path.exists():
            raise unittest.SkipTest("Test database not found. Please run setup_database.py first.")
        
        # Create a test matcher with SMT enabled
        cls.matcher = TrialMatcher(use_smt=True)
        
    def test_hard_constraint_failure(self):
        """Test that hard constraint failures result in trial failure."""
        # Create a test trial with a hard constraint
        nct_id = "TEST-HARD-001"
        print(f"\nTesting hard constraint failure for trial {nct_id}")
        
        # Clear any existing test trials
        if hasattr(self, 'matcher') and hasattr(self.matcher, 'smt_matcher'):
            self.matcher.smt_matcher.trials = {}
        
        # Create a test trial with a hard constraint
        trial = TrialCriteria(nct_id)
        constraint = Constraint(
            attribute="has_cancer",
            operator="==",
            value=True,
            value_type=ValueType.BOOLEAN,
            is_inclusion=True,
            hard_constraint=True,
            description="Patient must have cancer (hard constraint)"
        )
        trial.add_constraint(constraint)
        
        # Add the trial to the matcher
        if hasattr(self, 'matcher') and hasattr(self.matcher, 'smt_matcher'):
            self.matcher.smt_matcher.trials[nct_id] = trial
            
            # Test with a patient who doesn't meet the hard constraint
            patient = {"has_cancer": False}
            print(f"Patient data: {patient}")
            
            # Get detailed evaluation
            details = self.matcher.get_detailed_evaluation(patient, nct_id)
            print(f"Evaluation details: {details}")
            
            # Check the status
            status = details.get('status', 'UNKNOWN')
            print(f"Trial status: {status}")
            
            # Check if the hard constraint is in the failed constraints
            failed_constraints = details.get('failed_constraints', [])
            print(f"Failed constraints: {failed_constraints}")
            
            self.assertEqual(status, 'FAIL', "Trial should fail due to unmet hard constraint")
            self.assertTrue(
                any(c.get('attribute') == 'has_cancer' for c in failed_constraints),
                "Failed constraints should include 'has_cancer'"
            )
        else:
            self.fail("Matcher or SMT matcher not properly initialized")
    
    def test_soft_constraint_met(self):
        """Test that soft constraints don't cause failure when not met."""
        nct_id = "TEST-SOFT-001"
        print(f"\nTesting soft constraint handling for trial {nct_id}")
        
        # Clear any existing test trials
        if hasattr(self, 'matcher') and hasattr(self.matcher, 'smt_matcher'):
            self.matcher.smt_matcher.trials = {}
        
        # Create a test trial with both hard and soft constraints
        trial = TrialCriteria(nct_id)
        
        # Add hard constraint
        hard_constraint = Constraint(
            attribute="has_cancer",
            operator="==",
            value=True,
            value_type=ValueType.BOOLEAN,
            is_inclusion=True,
            hard_constraint=True,
            description="Patient must have cancer (hard constraint)"
        )
        trial.add_constraint(hard_constraint)
        
        # Add soft constraint
        soft_constraint = Constraint(
            attribute="has_imaging",
            operator="==",
            value=True,
            value_type=ValueType.BOOLEAN,
            is_inclusion=True,
            hard_constraint=False,
            description="CT or MRI preferred but not required (soft constraint)"
        )
        trial.add_constraint(soft_constraint)
        
        # Add the trial to the matcher
        if hasattr(self, 'matcher') and hasattr(self.matcher, 'smt_matcher'):
            self.matcher.smt_matcher.trials[nct_id] = trial
            
            # Test with a patient who meets the hard constraint but not the soft one
            patient = {"has_cancer": True, "has_imaging": False}
            print(f"Patient data: {patient}")
            
            # Get detailed evaluation
            details = self.matcher.get_detailed_evaluation(patient, nct_id)
            print(f"Evaluation details: {details}")
            
            # Check the status
            status = details.get('status', 'UNKNOWN')
            print(f"Trial status: {status}")
            
            # Check soft constraints
            soft_constraints_unmet = details.get('soft_constraints_unmet', [])
            print(f"Unmet soft constraints: {soft_constraints_unmet}")
            
            self.assertEqual(status, 'PASS', "Trial should pass with unmet soft constraint")
            self.assertEqual(
                len(soft_constraints_unmet), 1,
                "Should have exactly one unmet soft constraint"
            )
            if soft_constraints_unmet:
                self.assertEqual(
                    soft_constraints_unmet[0].get('attribute'), 'has_imaging',
                    "The unmet constraint should be for 'has_imaging'"
                )
        else:
            self.fail("Matcher or SMT matcher not properly initialized")
    
    def setUp(self):
        """Set up test fixtures before each test method."""
        # Initialize a fresh matcher for each test
        self.matcher = TrialMatcher(use_smt=True)
        
        # Clear any existing test trials
        if hasattr(self.matcher, 'smt_matcher'):
            self.matcher.smt_matcher.trials = {}
    
    def tearDown(self):
        """Clean up after each test method."""
        if hasattr(self, 'matcher') and hasattr(self.matcher, 'smt_matcher'):
            # Print the final state of the matcher for debugging
            print("\nFinal matcher state:")
            print(f"Number of trials: {len(self.matcher.smt_matcher.trials)}")
            for nct_id, trial in self.matcher.smt_matcher.trials.items():
                print(f"\nTrial {nct_id}:")
                for i, constraint in enumerate(trial.constraints, 1):
                    print(f"  Constraint {i}:")
                    print(f"    Attribute: {constraint.attribute}")
                    print(f"    Operator: {constraint.operator}")
                    print(f"    Value: {constraint.value}")
                    print(f"    Hard constraint: {constraint.hard_constraint}")
                    print(f"    Description: {constraint.description}")
        
        # Clean up
        if hasattr(self, 'matcher'):
            del self.matcher

if __name__ == '__main__':
    unittest.main(verbosity=2)
