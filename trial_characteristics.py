"""
Heuristics and prompt templates for trial-level characteristics.

The SIGIR dataset already captures eligibility in SMT/SQL. This module defines
additional descriptors (modality, risk, logistics, benefit focus, support
services) that we persist to TrialDB so patient preferences can influence
ranking and conversation flows.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Dict, Iterable, List, Optional


@dataclass(frozen=True)
class CharacteristicTemplate:
    key: str
    value_type: str
    prompt: str
    options: Optional[List[str]] = None
    description: Optional[str] = None


CHARACTERISTIC_TEMPLATES: Dict[str, CharacteristicTemplate] = {
    "intervention_modality": CharacteristicTemplate(
        key="intervention_modality",
        value_type="categorical",
        options=["Drug", "Device", "Surgery", "Behavioral", "Radiation", "Diagnostic", "Supportive", "Other"],
        description="What is the dominant modality the patient will experience?",
        prompt=(
            "Given the trial synopsis, classify the dominant clinician-delivered modality "
            "as one of: {options}. Consider mentions of medications, implants, surgery, "
            "behavioral coaching, imaging, radiation, or supportive services."
        ),
    ),
    "risk_profile": CharacteristicTemplate(
        key="risk_profile",
        value_type="categorical",
        options=["Exploratory", "Moderate", "Established", "Unknown"],
        description="Overall risk envelope communicated to patients.",
        prompt=(
            "Using the trial phase, intervention maturity, and target condition severity, "
            "label the participant risk profile as Exploratory (Phase 1 / novel first-in-human), "
            "Moderate (Phase 2 / combination), Established (Phase 3-4 standard-of-care adjunct), "
            "or Unknown when insufficient evidence exists."
        ),
    ),
    "logistics_profile": CharacteristicTemplate(
        key="logistics_profile",
        value_type="text",
        description="How intensive are site visits, monitoring, or travel expectations?",
        prompt=(
            "Summarize the logistical burden for the participant (visit frequency, expected duration, "
            "need for hospitalization) in <=20 words based on enrollment size and study description."
        ),
    ),
    "benefit_focus": CharacteristicTemplate(
        key="benefit_focus",
        value_type="text",
        description="Plain-language framing of what the trial hopes to improve.",
        prompt=(
            "Describe in <=15 words what clinical benefit this trial aims to deliver, referencing "
            "target diseases, symptom relief, or survival outcomes."
        ),
    ),
    "support_services": CharacteristicTemplate(
        key="support_services",
        value_type="text",
        description="Ancillary services offered (e.g., counseling, rehab, travel aid).",
        prompt=(
            "List any supportive services promised in the protocol (counseling, rehab, travel, nutrition). "
            "If none are mentioned, return 'None stated'."
        ),
    ),
}


def _lower_list(values: Iterable[str]) -> List[str]:
    return [value.lower().strip() for value in values if value]


def _classify_modality(metadata: Dict) -> str:
    meta = metadata.get("contextual", {}).get("metadata", {})
    drugs = _lower_list(meta.get("drugs_list") or [])
    summary = ((meta.get("brief_summary") or "") + " " + (metadata.get("contextual", {}).get("text") or "")).lower()

    if drugs:
        return "Drug"
    if any(keyword in summary for keyword in ["radiation", "radiotherapy"]):
        return "Radiation"
    if any(keyword in summary for keyword in ["device", "implant", "catheter", "stent"]):
        return "Device"
    if any(keyword in summary for keyword in ["surgery", "surgical", "operativ"]):
        return "Surgery"
    if any(keyword in summary for keyword in ["behavioral", "counseling", "therapy", "training", "exercise"]):
        return "Behavioral"
    if any(keyword in summary for keyword in ["imaging", "diagnostic", "screening"]):
        return "Diagnostic"
    return "Other"


def _risk_profile(metadata: Dict) -> str:
    phase = (metadata.get("contextual", {}).get("metadata", {}).get("phase") or "").lower()
    if "phase 1" in phase:
        return "Exploratory"
    if "phase 2" in phase:
        return "Moderate"
    if any(label in phase for label in ["phase 3", "phase 4", "phase iii", "phase iv"]):
        return "Established"
    if "phase" not in phase and phase:
        return "Moderate"
    return "Unknown"


def _logistics_profile(metadata: Dict) -> str:
    meta = metadata.get("contextual", {}).get("metadata", {})
    enrollment = meta.get("enrollment")
    try:
        enrolled = float(enrollment)
    except (TypeError, ValueError):
        enrolled = None

    if enrolled and enrolled >= 1000:
        base = "Large multi-center study; expect frequent visits"
    elif enrolled and enrolled >= 200:
        base = "Regional study with regular clinic visits"
    elif enrolled and enrolled > 0:
        base = "Single-site or pilot with limited participants"
    else:
        base = "Logistics not specified"

    if any(term in (meta.get("brief_summary") or "").lower() for term in ["inpatient", "hospitalized"]):
        base += ", includes inpatient stays"
    return base


def _benefit_focus(metadata: Dict) -> str:
    diseases = metadata.get("contextual", {}).get("metadata", {}).get("diseases_list") or []
    if diseases:
        targets = ", ".join(diseases[:2])
        return f"Aims to improve outcomes for {targets}"
    text = metadata.get("contextual", {}).get("metadata", {}).get("brief_summary") or ""
    if text:
        return text.split(".")[0][:120]
    return "Benefit focus not stated"


def _support_services(metadata: Dict) -> str:
    text = (metadata.get("contextual", {}).get("metadata", {}).get("brief_summary") or "").lower()
    services = []
    if "counsel" in text or "support" in text:
        services.append("Counseling/support")
    if "rehab" in text or "rehabilitation" in text:
        services.append("Rehabilitation")
    if "travel" in text:
        services.append("Travel assistance")
    if "nutrition" in text or "diet" in text:
        services.append("Nutrition guidance")
    if not services:
        return "None stated"
    return ", ".join(services)


def derive_structured_characteristics(metadata: Dict) -> List[Dict]:
    """
    Produce heuristic characteristic rows ready to persist in TrialDB.
    """
    derived = [
        {
            "characteristic_key": "intervention_modality",
            "characteristic_value": _classify_modality(metadata),
            "value_type": "categorical",
            "confidence": 0.85,
            "source": "heuristic:metadata_text",
        },
        {
            "characteristic_key": "risk_profile",
            "characteristic_value": _risk_profile(metadata),
            "value_type": "categorical",
            "confidence": 0.8,
            "source": "heuristic:phase",
        },
        {
            "characteristic_key": "logistics_profile",
            "characteristic_value": _logistics_profile(metadata),
            "value_type": "text",
            "confidence": 0.6,
            "source": "heuristic:enrollment_summary",
        },
        {
            "characteristic_key": "benefit_focus",
            "characteristic_value": _benefit_focus(metadata),
            "value_type": "text",
            "confidence": 0.7,
            "source": "metadata.brief_summary",
        },
        {
            "characteristic_key": "support_services",
            "characteristic_value": _support_services(metadata),
            "value_type": "text",
            "confidence": 0.5,
            "source": "metadata.brief_summary",
        },
    ]
    return derived


__all__ = ["CHARACTERISTIC_TEMPLATES", "CharacteristicTemplate", "derive_structured_characteristics"]
