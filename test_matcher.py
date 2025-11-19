import unittest
import tempfile
import json
from pathlib import Path
from typing import Dict, Any

from Matcher import DEFAULT_DB_PATH, TrialMatcher


class BaseMatcherTests:
    """Base test class with common test cases for both matchers."""
    matcher: TrialMatcher
    
    def test_load_patient_attributes(self):
        """Test loading patient attributes from the database."""
        attrs = self.matcher.load_patient_attributes("sigir-20141")
        self.assertIsInstance(attrs, dict)
        self.assertIn("patient_age_value_recorded_in_years", attrs)
        self.assertIn("patient_sex_is_female", attrs)
        self.assertIsInstance(attrs["patient_sex_is_female"], bool)

    def test_evaluate_known_trial(self):
        """Test evaluating a patient against a known trial."""
        attrs = self.matcher.load_patient_attributes("sigir-20141")
        status, missing = self.matcher.evaluate_trial(attrs, "NCT00133328")
        self.assertIn(status, {"PASS", "MISSING", "FAIL"})
        self.assertIsInstance(missing, list)

    def test_evaluate_patient_helper(self):
        """Test the evaluate_patient convenience method."""
        results = self.matcher.evaluate_patient("sigir-20141")
        self.assertIsInstance(results, dict)
        self.assertGreater(len(results), 0)
        for status in results.values():
            self.assertIn(status[0], {"PASS", "MISSING", "FAIL"})

    def test_rag_rank_patient(self):
        """Test the RAG-based patient ranking."""
        scores = self.matcher.rag_rank_patient("sigir-20141", top_n=5)
        self.assertIsInstance(scores, list)
        if scores:
            nct_id, score = scores[0]
            self.assertIsInstance(nct_id, str)
            self.assertIsInstance(score, float)
            self.assertGreaterEqual(score, 0)
            self.assertLessEqual(score, 1.0)

    def test_detailed_evaluation(self):
        """Test the detailed evaluation method."""
        attrs = self.matcher.load_patient_attributes("sigir-20141")
        result = self.matcher.get_detailed_evaluation(attrs, "NCT00133328")
        self.assertIn("status", result)
        self.assertIn("missing_attrs", result)
        self.assertIn("constraints", result)
        self.assertIn(result["status"], ["PASS", "MISSING", "FAIL"])
        self.assertIsInstance(result["missing_attrs"], list)
        self.assertIsInstance(result["constraints"], list)


class SMTMatcherTests(BaseMatcherTests, unittest.TestCase):
    """Test the SMT-based matcher implementation."""
    
    @classmethod
    def setUpClass(cls) -> None:
        if not Path(DEFAULT_DB_PATH).exists():
            raise unittest.SkipTest(
                "trial_data.sqlite not found. Run setup_database.py --reset and load_trial_data.py first."
            )
        cls.matcher = TrialMatcher(use_smt=True)
    
    def test_complex_constraints(self):
        """Test evaluation with complex constraints."""
        # Create a test patient
        patient = {
            "age": 45,
            "has_diabetes": True,
            "has_hypertension": True,
            "hba1c": 7.5,
            "bmi": 28.5
        }
        
        # This is a mock test - in a real scenario, you'd have actual trial data
        # The test verifies the matcher can handle the evaluation without errors
        results = {}
        for nct_id in self.matcher.trials:
            status, _ = self.matcher.evaluate_trial(patient, nct_id)
            results[nct_id] = status
        
        # Just verify we got some results
        self.assertGreater(len(results), 0)


class LegacyMatcherTests(BaseMatcherTests, unittest.TestCase):
    """Test the legacy rule-based matcher implementation."""
    
    @classmethod
    def setUpClass(cls) -> None:
        if not Path(DEFAULT_DB_PATH).exists():
            raise unittest.SkipTest(
                "trial_data.sqlite not found. Run setup_database.py --reset and load_trial_data.py first."
            )
        cls.matcher = TrialMatcher(use_smt=False)


class MatcherConsistencyTests(unittest.TestCase):
    """Test consistency between SMT and legacy matchers."""
    
    @classmethod
    def setUpClass(cls) -> None:
        if not Path(DEFAULT_DB_PATH).exists():
            raise unittest.SkipTest(
                "trial_data.sqlite not found. Run setup_database.py --reset and load_trial_data.py first."
            )
        cls.smt_matcher = TrialMatcher(use_smt=True)
        cls.legacy_matcher = TrialMatcher(use_smt=False)
    
    def test_consistent_results(self):
        """Test that both matchers produce consistent results for simple cases."""
        # Test with a few sample patients
        test_patients = [
            {"patient_age_value_recorded_in_years": 45, "patient_sex_is_female": True},
            {"patient_age_value_recorded_in_years": 65, "patient_sex_is_female": False},
            # Add more test cases as needed
        ]
        
        for patient in test_patients:
            smt_results = {}
            legacy_results = {}
            
            # Test a subset of trials for efficiency
            trial_ids = list(self.smt_matcher.trials.keys())[:10]  # First 10 trials
            
            for nct_id in trial_ids:
                smt_status, _ = self.smt_matcher.evaluate_trial(patient, nct_id)
                legacy_status, _ = self.legacy_matcher.evaluate_trial(patient, nct_id)
                smt_results[nct_id] = smt_status
                legacy_results[nct_id] = legacy_status
                
                # The SMT matcher should be at least as permissive as the legacy matcher
                # (it might find more matches due to better constraint handling)
                self.assertTrue(
                    smt_status == legacy_status or (smt_status == "PASS" and legacy_status != "PASS"),
                    f"Inconsistent results for trial {nct_id}: SMT={smt_status}, Legacy={legacy_status}"
                )


class TestEdgeCases(unittest.TestCase):
    """Test edge cases and error handling."""
    
    def setUp(self):
        self.matcher = TrialMatcher()
    
    def test_missing_patient(self):
        """Test behavior with non-existent patient ID."""
        with self.assertRaises(Exception):
            self.matcher.load_patient_attributes("non_existent_patient")
    
    def test_missing_trial(self):
        """Test behavior with non-existent trial ID."""
        attrs = self.matcher.load_patient_attributes("sigir-20141")
        status, missing = self.matcher.evaluate_trial(attrs, "NON_EXISTENT_TRIAL")
        self.assertEqual(status, "MISSING")
        self.assertIn("trial_definition", missing)
    
    def test_empty_patient(self):
        """Test behavior with empty patient attributes."""
        status, missing = self.matcher.evaluate_trial({}, "NCT00133328")
        self.assertEqual(status, "MISSING")
        self.assertGreater(len(missing), 0)

    def test_load_patient_attributes(self):
        attrs = self.matcher.load_patient_attributes("sigir-20141")
        self.assertIn("patient_age_value_recorded_in_years", attrs)
        self.assertTrue(attrs["patient_sex_is_female"])

    def test_evaluate_known_trial(self):
        attrs = self.matcher.load_patient_attributes("sigir-20141")
        status, missing = self.matcher.evaluate_trial(attrs, "NCT00133328")
        self.assertIn(status, {"PASS", "MISSING", "FAIL"})
        self.assertIsInstance(missing, list)

    def test_evaluate_patient_helper(self):
        results = self.matcher.evaluate_patient("sigir-20141")
        self.assertIn("NCT00133328", results)

    def test_rag_rank_patient(self):
        scores = self.matcher.rag_rank_patient("sigir-20141", top_n=5)
        self.assertIsInstance(scores, list)
        if scores:
            nct_id, score = scores[0]
            self.assertIsInstance(nct_id, str)
            self.assertGreaterEqual(score, 0)


if __name__ == "__main__":
    unittest.main()
