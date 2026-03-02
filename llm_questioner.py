"""
LLM-backed question generation for patient attribute elicitation.

This module wraps optional OpenAI access. When API credentials or the SDK
are unavailable (e.g., offline sandbox), it falls back to a deterministic
template so the rest of the system keeps functioning.
"""

from __future__ import annotations

import os
from dataclasses import dataclass
from typing import Dict, Optional

from dotenv import load_dotenv

load_dotenv()


def sanitize_attribute(attribute: str) -> str:
    text = attribute.replace("patient_", "")
    text = text.replace("_", " ")
    return text.strip()


@dataclass
class LLMConfig:
    model: str = "gpt-4o-mini"
    temperature: float = 0.3
    max_tokens: int = 120


class LLMQuestionGenerator:
    def __init__(
        self,
        api_key: Optional[str] = None,
        config: Optional[LLMConfig] = None,
        client: Optional[object] = None,
    ):
        self.api_key = api_key or os.getenv("AZURE_OPENAI_API_KEY")
        self.config = config or LLMConfig()
        self._client = client
        self._setup_client()

    def _setup_client(self) -> None:
        if self._client or not self.api_key:
            return
        try:
            from openai import AzureOpenAI
        except Exception:
            self._client = None
            return
        try:
            self._client = AzureOpenAI(
                api_key=self.api_key,
                api_version=os.getenv("AZURE_OPENAI_API_VERSION", "2024-02-15-preview"),
                azure_endpoint=os.getenv("AZURE_OPENAI_ENDPOINT", ""),
            )
            self.config.model = os.getenv("AZURE_OPENAI_DEPLOYMENT_NAME", "gpt-4.1")
        except Exception:
            self._client = None

    @property
    def available(self) -> bool:
        return self._client is not None

    def generate_question(
        self,
        attribute: str,
        trial_summary: str,
        context: Optional[Dict[str, str]] = None,
    ) -> str:
        context = context or {}
        if not self.available:
            return self.fallback_question(attribute, trial_summary)

        prompt = self._build_prompt(attribute, trial_summary, context)
        try:
            response = self._client.chat.completions.create(
                model=self.config.model,
                temperature=self.config.temperature,
                max_tokens=self.config.max_tokens,
                messages=[
                    {
                        "role": "system",
                        "content": "You are a clinical trial coordinator asking concise follow-up questions to patients.",
                    },
                    {"role": "user", "content": prompt},
                ],
            )
            text = response.choices[0].message.content.strip()
            return text or self.fallback_question(attribute, trial_summary)
        except Exception:
            return self.fallback_question(attribute, trial_summary)

    def fallback_question(self, attribute: str, trial_summary: str) -> str:
        attr_text = sanitize_attribute(attribute)
        return f"For {trial_summary}, can you confirm whether the patient {attr_text}?"

    def _build_prompt(self, attribute: str, trial_summary: str, context: Dict[str, str]) -> str:
        attr_text = sanitize_attribute(attribute)
        patient_note = context.get("patient_note", "")[:500]
        preferences = context.get("preferences", "")
        return (
            f"Trial summary: {trial_summary}\n"
            f"Needed attribute: {attr_text}\n"
            f"Patient note (optional): {patient_note}\n"
            f"Known preferences: {preferences}\n"
            "Ask the patient a short, polite yes/no question to capture this attribute while respecting stated preferences. "
            "Frame it in plain language and avoid medical jargon when possible."
        )


__all__ = ["LLMQuestionGenerator", "LLMConfig"]
