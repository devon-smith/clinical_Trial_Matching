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

SYSTEM_PROMPT = """You are a friendly and empathetic clinical trial coordinator helping patients find suitable clinical trials. Your role is to:

1. Ask clear, compassionate questions to understand if a patient might qualify for a trial
2. Use warm, professional language that puts patients at ease
3. Explain medical terms in simple, everyday language
4. Show understanding and empathy for the patient's situation
5. Keep questions concise and focused on one piece of information at a time

Example of your tone:
- "I'd love to help you explore this trial option. Could you tell me..."
- "To make sure we find the best match for you, may I ask..."
- "I understand this can be overwhelming. Let's take it one step at a time..."
"""

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
        self.api_key = api_key or os.getenv("OPENAI_API_KEY")
        self.config = config or LLMConfig()
        self._client = client
        self._setup_client()

    def _setup_client(self) -> None:
        if self._client or not self.api_key:
            return
        try:
            from openai import OpenAI
        except Exception:
            self._client = None
            return
        try:
            self._client = OpenAI(api_key=self.api_key)
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
            response = self._client.responses.create(
                model=self.config.model,
                temperature=self.config.temperature,
                max_output_tokens=self.config.max_tokens,
                input=[
                    {
                        "role": "system",
                        "content": SYSTEM_PROMPT,
                    },
                    {"role": "user", "content": prompt},
                ],
            )
            text = response.output[0].content[0].text.strip()
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
        
        return f"""I need to ask the patient about: {attr_text}

    Trial Details:
    {trial_summary}

    Patient Context:
    {"Patient note: " + patient_note if patient_note else "No additional patient notes available."}
    {"Patient preferences: " + preferences if preferences else "No specific preferences mentioned."}

    Please generate a single, natural-sounding question to ask the patient about this attribute. The question should:
    - Be warm and empathetic
    - Use simple, non-medical language when possible
    - Be concise (1 sentence if possible)
    - Be phrased as a yes/no question when appropriate
    - Acknowledge any relevant patient preferences
    - Avoid medical jargon unless necessary

    Example good questions:
    - "I see you mentioned [preference]. Would you be open to [related aspect]?"
    - "To help find the best match, could you tell me if [attribute in plain language]?"
    - "I understand this might be personal, but could you share if [attribute] applies to you?"

    Please generate the question now:"""


__all__ = ["LLMQuestionGenerator", "LLMConfig"]
