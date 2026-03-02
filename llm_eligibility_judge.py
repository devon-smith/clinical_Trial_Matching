"""
LLM-based eligibility judge for clinical trial criteria.

Uses GPT-4 with chain-of-thought reasoning to evaluate whether a patient
meets specific trial eligibility criteria — particularly for criteria that
simple rule-based matching cannot resolve.
"""

from __future__ import annotations

import json
import os
from dataclasses import dataclass
from typing import Any, Dict, List, Optional

from dotenv import load_dotenv
from openai import AzureOpenAI

load_dotenv()


@dataclass(frozen=True)
class CriterionJudgment:
    """Immutable result of evaluating a single eligibility criterion."""

    criterion: str
    status: str  # "MET", "NOT_MET", "UNCLEAR"
    confidence: float  # 0.0 - 1.0
    evidence: str
    reasoning: str


def _humanize_criterion(criterion_type: str) -> str:
    """Convert a criterion_type like 'patient_has_diagnosis_of_diabetes_mellitus_now'
    into a readable sentence: 'Patient has diagnosis of diabetes mellitus (current)'."""
    text = criterion_type.replace("_", " ")
    # Replace temporal suffixes with parenthetical
    for suffix, label in [
        ("now", "(current)"),
        ("inthehistory", "(in medical history)"),
        ("inthepast6months", "(in past 6 months)"),
        ("inthepast12months", "(in past 12 months)"),
        ("inthepast3months", "(in past 3 months)"),
    ]:
        if text.endswith(suffix):
            text = text[: -len(suffix)].strip() + f" {label}"
            break
    # Clean up measurement units
    text = text.replace("withunit ", "with unit ")
    return text.strip()


SYSTEM_PROMPT = """\
You are a clinical trial eligibility expert. Given a patient description and a \
list of eligibility criteria, determine whether each criterion is MET, NOT_MET, \
or UNCLEAR based on the available patient information.

Rules:
- MET: The patient clearly satisfies this criterion based on provided information.
- NOT_MET: The patient clearly does NOT satisfy this criterion.
- UNCLEAR: There is not enough information to determine the criterion status.
- Use chain-of-thought reasoning for each criterion.
- Be conservative: only mark MET or NOT_MET when the evidence is clear.
- For boolean criteria like "patient has diagnosis of X", check if the patient \
  description mentions the condition, treatment, or related information.

Respond with a JSON array. Each element must have:
{
  "criterion": "<the criterion name>",
  "status": "MET" | "NOT_MET" | "UNCLEAR",
  "confidence": <0.0 to 1.0>,
  "evidence": "<what patient data supports this judgment>",
  "reasoning": "<step-by-step reasoning>"
}
"""


class LLMEligibilityJudge:
    """Evaluates clinical trial eligibility criteria using GPT-4."""

    def __init__(self, client: Optional[AzureOpenAI] = None):
        if client:
            self._client = client
        else:
            self._client = AzureOpenAI(
                api_key=os.getenv("AZURE_OPENAI_API_KEY"),
                api_version=os.getenv(
                    "AZURE_OPENAI_API_VERSION", "2024-02-15-preview"
                ),
                azure_endpoint=os.getenv("AZURE_OPENAI_ENDPOINT", ""),
            )
        self._model = os.getenv("AZURE_OPENAI_DEPLOYMENT_NAME", "gpt-4.1")
        self._cache: Dict[str, List[CriterionJudgment]] = {}

    def evaluate_criteria(
        self,
        patient_description: str,
        criteria: List[Dict[str, Any]],
        *,
        use_cache: bool = True,
    ) -> List[CriterionJudgment]:
        """
        Evaluate a batch of eligibility criteria against a patient description.

        Args:
            patient_description: Free-text description of the patient.
            criteria: List of criterion dicts with at least 'attribute' and
                      'is_inclusion' keys.
            use_cache: Whether to use cached results.

        Returns:
            List of CriterionJudgment for each criterion.
        """
        if not criteria or not patient_description.strip():
            return [
                CriterionJudgment(
                    criterion=c.get("attribute", "unknown"),
                    status="UNCLEAR",
                    confidence=0.0,
                    evidence="No patient information provided",
                    reasoning="Cannot evaluate without patient data",
                )
                for c in criteria
            ]

        cache_key = self._make_cache_key(patient_description, criteria)
        if use_cache and cache_key in self._cache:
            return self._cache[cache_key]

        # Build the user prompt
        criteria_lines = []
        for i, c in enumerate(criteria, 1):
            attr = c.get("attribute", "")
            human_readable = _humanize_criterion(attr)
            is_inclusion = c.get("is_inclusion", True)
            kind = "INCLUSION" if is_inclusion else "EXCLUSION"
            criteria_lines.append(f"{i}. [{kind}] {human_readable}")

        user_prompt = (
            f"## Patient Description\n{patient_description}\n\n"
            f"## Eligibility Criteria to Evaluate\n"
            + "\n".join(criteria_lines)
        )

        try:
            response = self._client.chat.completions.create(
                model=self._model,
                messages=[
                    {"role": "system", "content": SYSTEM_PROMPT},
                    {"role": "user", "content": user_prompt},
                ],
                temperature=0.1,
                max_tokens=2000,
                response_format={"type": "json_object"},
            )

            raw = response.choices[0].message.content or "[]"
            judgments = self._parse_response(raw, criteria)
        except Exception as e:
            print(f"LLM eligibility judge error: {e}")
            judgments = [
                CriterionJudgment(
                    criterion=c.get("attribute", "unknown"),
                    status="UNCLEAR",
                    confidence=0.0,
                    evidence="LLM evaluation failed",
                    reasoning=str(e),
                )
                for c in criteria
            ]

        if use_cache:
            self._cache[cache_key] = judgments
        return judgments

    def evaluate_single(
        self,
        patient_description: str,
        criterion: Dict[str, Any],
    ) -> CriterionJudgment:
        """Evaluate a single criterion. Convenience wrapper around evaluate_criteria."""
        results = self.evaluate_criteria(patient_description, [criterion])
        return results[0] if results else CriterionJudgment(
            criterion=criterion.get("attribute", "unknown"),
            status="UNCLEAR",
            confidence=0.0,
            evidence="",
            reasoning="No result returned",
        )

    def _parse_response(
        self,
        raw_json: str,
        criteria: List[Dict[str, Any]],
    ) -> List[CriterionJudgment]:
        """Parse the LLM JSON response into CriterionJudgment objects."""
        try:
            parsed = json.loads(raw_json)
            # Handle both {"results": [...]} and bare [...]
            items = parsed if isinstance(parsed, list) else parsed.get("results", [])
        except json.JSONDecodeError:
            return [
                CriterionJudgment(
                    criterion=c.get("attribute", "unknown"),
                    status="UNCLEAR",
                    confidence=0.0,
                    evidence="Failed to parse LLM response",
                    reasoning=raw_json[:200],
                )
                for c in criteria
            ]

        judgments: list[CriterionJudgment] = []
        for i, c in enumerate(criteria):
            item = items[i] if i < len(items) else {}
            status = item.get("status", "UNCLEAR").upper()
            if status not in ("MET", "NOT_MET", "UNCLEAR"):
                status = "UNCLEAR"
            confidence = max(0.0, min(1.0, float(item.get("confidence", 0.0))))
            judgments.append(
                CriterionJudgment(
                    criterion=c.get("attribute", "unknown"),
                    status=status,
                    confidence=confidence,
                    evidence=item.get("evidence", ""),
                    reasoning=item.get("reasoning", ""),
                )
            )
        return judgments

    @staticmethod
    def _make_cache_key(
        patient_description: str, criteria: List[Dict[str, Any]]
    ) -> str:
        criteria_key = "|".join(c.get("attribute", "") for c in criteria)
        return f"{hash(patient_description)}:{hash(criteria_key)}"


__all__ = ["LLMEligibilityJudge", "CriterionJudgment"]
