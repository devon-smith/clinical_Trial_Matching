import unittest
from pathlib import Path

from Matcher import DEFAULT_DB_PATH
from conversation_agent import ConversationalTrialAssistant
from trial_characteristics import CHARACTERISTIC_TEMPLATES


class StubQuestionGenerator:
    def generate_question(self, attribute, trial_summary, context=None):
        return f"{trial_summary}: need info about {attribute}"


class ConversationAgentTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        if not Path(DEFAULT_DB_PATH).exists():
            raise unittest.SkipTest(
                "trial_data.sqlite not initialized. Run setup_database.py --reset and load_trial_data.py first."
            )
        cls.agent = ConversationalTrialAssistant(question_generator=StubQuestionGenerator())

    def test_templates_have_prompts(self):
        for template in CHARACTERISTIC_TEMPLATES.values():
            self.assertTrue(template.prompt)

    def test_rank_missing_attributes_not_empty(self):
        patient_attrs = self.agent.matcher.load_patient_attributes("sigir-20141")
        trials = self.agent.get_ranked_trials("sigir-20141", limit=5)
        ranked = self.agent.rank_missing_attributes(patient_attrs, trials)
        self.assertIsInstance(ranked, list)
        self.assertTrue(ranked)

    def test_conduct_session_with_scripted_answers(self):
        responses = iter(["yes", "no", ""])

        def provider(_prompt: str) -> str:
            return next(responses, "")

        updated_attrs = self.agent.conduct_session(
            "sigir-20141",
            max_questions=2,
            answer_provider=provider,
            verbose=False,
        )
        self.assertIsInstance(updated_attrs, dict)

    def test_preference_rejection_updates_state(self):
        responses = iter(["I don't want surgery for now"])

        def provider(_prompt: str) -> str:
            return next(responses, "")

        self.agent.conduct_session(
            "sigir-20141",
            max_questions=1,
            answer_provider=provider,
            verbose=False,
        )
        self.assertIsNotNone(self.agent.last_preferences)
        self.assertIn("Surgery", self.agent.last_preferences.excluded_modalities)


if __name__ == "__main__":
    unittest.main()
