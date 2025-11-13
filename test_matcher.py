import unittest
from pathlib import Path

from Matcher import DEFAULT_DB_PATH, TrialMatcher


class TrialMatcherTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        if not Path(DEFAULT_DB_PATH).exists():
            raise unittest.SkipTest(
                "trial_data.sqlite not found. Run setup_database.py --reset and load_trial_data.py first."
            )
        cls.matcher = TrialMatcher()

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
