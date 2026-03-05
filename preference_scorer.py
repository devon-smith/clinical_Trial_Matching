"""
Patient preference scoring for clinical trial ranking.

Addresses TrialGPT's stated limitation of excluding geographic and practical
factors. Scores trials against patient-expressed preferences (travel, risk
tolerance, schedule flexibility, treatment modality) using trial characteristics
already in the database.

Preference scores are blended with the existing eligibility score at an 82/18
ratio — enough to meaningfully rerank similarly-eligible trials without
overriding medical eligibility.
"""

from __future__ import annotations

import json
import math
from dataclasses import dataclass
from typing import Any, Dict, FrozenSet, Optional, Tuple


# --- Constants ---

TRAVEL_DISTANCE_MAP: Dict[int, float] = {
    1: 15.0,   # Local only
    2: 30.0,   # Nearby
    3: 60.0,   # Regional
    4: 100.0,  # Statewide
    5: 200.0,  # Anywhere
}

RISK_LEVEL_MAP: Dict[str, float] = {
    "Exploratory": 3.0,
    "Moderate": 2.0,
    "Established": 1.0,
    "Unknown": 2.5,
}

RISK_CEILING_MAP: Dict[int, float] = {
    1: 1.0,
    2: 1.5,
    3: 2.0,
    4: 2.5,
    5: 3.0,
}

RELATED_MODALITIES: Dict[str, FrozenSet[str]] = {
    "Drug": frozenset({"Supportive"}),
    "Surgery": frozenset({"Device"}),
    "Device": frozenset({"Surgery"}),
    "Behavioral": frozenset({"Supportive"}),
    "Radiation": frozenset({"Drug"}),
    "Diagnostic": frozenset(),
    "Supportive": frozenset({"Behavioral", "Drug"}),
    "Other": frozenset(),
}

DIMENSION_WEIGHTS: Dict[str, float] = {
    "travel": 0.35,
    "risk": 0.30,
    "schedule": 0.20,
    "treatment": 0.15,
}

SIGMOID_K = 0.08  # Steepness for travel sigmoid

ALL_MODALITIES = frozenset(
    {"Drug", "Device", "Surgery", "Behavioral", "Radiation", "Diagnostic", "Supportive", "Other"}
)


# --- Data classes ---

@dataclass(frozen=True)
class PatientPreferences:
    travel_willingness: Optional[int] = None       # 1-5
    risk_tolerance: Optional[int] = None           # 1-5
    schedule_flexibility: Optional[int] = None     # 1-5
    acceptable_modalities: Optional[FrozenSet[str]] = None  # subset of ALL_MODALITIES, None = no preference


# --- Per-dimension scoring functions ---

def score_travel(willingness: int, distance_miles: float) -> float:
    """Sigmoid decay around the patient's max acceptable distance."""
    d_max = TRAVEL_DISTANCE_MAP.get(willingness, 60.0)
    return 1.0 / (1.0 + math.exp(SIGMOID_K * (distance_miles - d_max)))


def score_risk(tolerance: int, risk_profile: str) -> float:
    """Asymmetric ordinal match: risk-tolerant patients aren't penalized for safe trials."""
    trial_risk = RISK_LEVEL_MAP.get(risk_profile, 2.5)
    ceiling = RISK_CEILING_MAP.get(tolerance, 2.0)
    overage = max(0.0, trial_risk - ceiling)
    return max(0.0, 1.0 - overage / 2.0)


def score_schedule(flexibility: int, logistics_text: str) -> float:
    """Linear gap between trial burden and patient flexibility."""
    burden = _classify_logistics_burden(logistics_text)
    gap = burden - flexibility
    return max(0.0, min(1.0, 1.0 - gap / 4.0))


def score_treatment(acceptable: FrozenSet[str], trial_modality: str) -> float:
    """Categorical match with soft falloff for related modalities."""
    if trial_modality in acceptable:
        return 1.0
    related = RELATED_MODALITIES.get(trial_modality, frozenset())
    if acceptable & related:
        return 0.6
    if trial_modality == "Other":
        return 0.3
    return 0.2


# --- Aggregation ---

def score_preferences(
    preferences: PatientPreferences,
    trial_characteristics: Dict[str, str],
    distance: Optional[float] = None,
) -> Dict[str, Any]:
    """
    Compute weighted preference score from active dimensions.

    Returns dict with:
      - preference_score: float 0-1
      - breakdown: {dimension: {score, status, detail}}
    """
    sub_scores: Dict[str, Tuple[float, str, str]] = {}

    if preferences.travel_willingness is not None and distance is not None:
        s = score_travel(preferences.travel_willingness, distance)
        d_max = TRAVEL_DISTANCE_MAP[preferences.travel_willingness]
        status, detail = _explain_score(
            s,
            good=f"Within your {d_max:.0f}-mile preference ({distance:.0f} mi)",
            neutral=f"Near your {d_max:.0f}-mile limit ({distance:.0f} mi)",
            poor=f"Beyond your {d_max:.0f}-mile preference ({distance:.0f} mi)",
        )
        sub_scores["travel"] = (s, status, detail)

    if preferences.risk_tolerance is not None:
        risk_profile = trial_characteristics.get("risk_profile", "Unknown")
        s = score_risk(preferences.risk_tolerance, risk_profile)
        status, detail = _explain_score(
            s,
            good=f"{risk_profile} trial matches your comfort level",
            neutral=f"{risk_profile} trial is near your comfort boundary",
            poor=f"{risk_profile} trial may be more experimental than you prefer",
        )
        sub_scores["risk"] = (s, status, detail)

    if preferences.schedule_flexibility is not None:
        logistics = trial_characteristics.get("logistics_profile", "")
        s = score_schedule(preferences.schedule_flexibility, logistics)
        burden = _classify_logistics_burden(logistics)
        burden_label = {1: "light", 2: "moderate", 3: "frequent", 4: "intensive"}.get(burden, "moderate")
        status, detail = _explain_score(
            s,
            good=f"{burden_label.capitalize()} visit schedule fits your availability",
            neutral=f"{burden_label.capitalize()} visit schedule may require some adjustment",
            poor=f"{burden_label.capitalize()} visit schedule may be difficult for your availability",
        )
        sub_scores["schedule"] = (s, status, detail)

    if preferences.acceptable_modalities is not None:
        modality = trial_characteristics.get("intervention_modality", "Other")
        s = score_treatment(preferences.acceptable_modalities, modality)
        match_word = "matches" if s >= 0.9 else ("is related to" if s >= 0.5 else "differs from")
        status, detail = _explain_score(
            s,
            good=f"{modality} treatment matches your preference",
            neutral=f"{modality} treatment is related to your preference",
            poor=f"{modality} treatment differs from your preference",
        )
        sub_scores["treatment"] = (s, status, detail)

    # Weighted aggregation over active dimensions
    if not sub_scores:
        return {
            "preference_score": 0.5,
            "breakdown": {},
        }

    total_weight = sum(DIMENSION_WEIGHTS[dim] for dim in sub_scores)
    weighted_sum = sum(
        DIMENSION_WEIGHTS[dim] * score_val
        for dim, (score_val, _, _) in sub_scores.items()
    )
    preference_score = weighted_sum / total_weight

    breakdown = {
        dim: {"score": round(score_val, 3), "status": status, "detail": detail}
        for dim, (score_val, status, detail) in sub_scores.items()
    }

    return {
        "preference_score": round(preference_score, 4),
        "breakdown": breakdown,
    }


# --- Parsing ---

def parse_preferences_from_message(message: str) -> PatientPreferences:
    """Parse JSON preference payload from frontend chat message."""
    try:
        data = json.loads(message)
    except (json.JSONDecodeError, TypeError):
        return PatientPreferences()

    travel = _clamp_likert(data.get("travel"))
    risk = _clamp_likert(data.get("risk"))
    schedule = _clamp_likert(data.get("schedule"))

    modalities_raw = data.get("modalities")
    modalities = None
    if isinstance(modalities_raw, list) and modalities_raw:
        valid = frozenset(m for m in modalities_raw if m in ALL_MODALITIES)
        if valid:
            modalities = valid

    return PatientPreferences(
        travel_willingness=travel,
        risk_tolerance=risk,
        schedule_flexibility=schedule,
        acceptable_modalities=modalities,
    )


# --- Helpers ---

def _classify_logistics_burden(text: str) -> int:
    """Classify logistics text into burden level 1-4."""
    lower = text.lower()
    if "inpatient" in lower or "intensive" in lower:
        return 4
    if "frequent" in lower or "large multi-center" in lower:
        return 3
    if "single-site" in lower or "pilot" in lower or "limited" in lower:
        return 1
    return 2  # moderate default


def _explain_score(
    score: float,
    good: str,
    neutral: str,
    poor: str,
) -> Tuple[str, str]:
    """Return (status, detail) based on score thresholds."""
    if score >= 0.7:
        return ("good", good)
    if score >= 0.4:
        return ("neutral", neutral)
    return ("poor", poor)


def _clamp_likert(value: Any) -> Optional[int]:
    """Clamp a value to 1-5 Likert scale, or return None."""
    if value is None:
        return None
    try:
        v = int(value)
        return max(1, min(5, v))
    except (ValueError, TypeError):
        return None
