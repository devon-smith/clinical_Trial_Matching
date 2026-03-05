"""Tests for patient preference scoring."""

import json
import math

import pytest

from preference_scorer import (
    PatientPreferences,
    score_travel,
    score_risk,
    score_schedule,
    score_treatment,
    score_preferences,
    parse_preferences_from_message,
)


class TestScoreTravel:
    def test_well_within_range(self):
        # 10 miles with 60-mile preference → near 1.0
        assert score_travel(3, 10.0) > 0.95

    def test_at_max_distance(self):
        # Exactly at d_max → sigmoid midpoint ≈ 0.5
        assert abs(score_travel(3, 60.0) - 0.5) < 0.01

    def test_far_beyond_range(self):
        # 200 miles with 15-mile local preference → near 0.0
        assert score_travel(1, 200.0) < 0.01

    def test_monotonically_decreasing(self):
        scores = [score_travel(3, d) for d in [10, 30, 60, 90, 120]]
        for i in range(len(scores) - 1):
            assert scores[i] > scores[i + 1]


class TestScoreRisk:
    def test_conservative_with_established(self):
        assert score_risk(1, "Established") == 1.0

    def test_conservative_with_exploratory(self):
        # Big gap: tolerance ceiling 1.0, trial risk 3.0 → penalized
        assert score_risk(1, "Exploratory") == 0.0

    def test_tolerant_with_established(self):
        # Risk-tolerant patients aren't penalized for safe trials
        assert score_risk(5, "Established") == 1.0

    def test_moderate_with_moderate(self):
        assert score_risk(3, "Moderate") == 1.0

    def test_unknown_profile(self):
        # Unknown treated as 2.5, moderate tolerance ceiling 2.0
        s = score_risk(3, "Unknown")
        assert 0.5 < s <= 1.0


class TestScoreSchedule:
    def test_flexible_with_any_burden(self):
        assert score_schedule(5, "Large multi-center frequent visits") >= 0.75

    def test_limited_with_intensive(self):
        assert score_schedule(1, "inpatient intensive monitoring") < 0.5

    def test_moderate_with_pilot(self):
        assert score_schedule(3, "Single-site or pilot") == 1.0

    def test_default_text(self):
        # Unknown text defaults to burden 2
        assert score_schedule(3, "something unrecognized") == 1.0


class TestScoreTreatment:
    def test_exact_match(self):
        assert score_treatment(frozenset({"Drug"}), "Drug") == 1.0

    def test_related_modality(self):
        # Surgery and Device are related
        assert score_treatment(frozenset({"Device"}), "Surgery") == 0.6

    def test_unrelated(self):
        assert score_treatment(frozenset({"Behavioral"}), "Radiation") == 0.2

    def test_other_modality(self):
        assert score_treatment(frozenset({"Drug"}), "Other") == 0.3


class TestScorePreferences:
    def test_all_dimensions(self):
        prefs = PatientPreferences(
            travel_willingness=3,
            risk_tolerance=3,
            schedule_flexibility=3,
            acceptable_modalities=frozenset({"Drug"}),
        )
        result = score_preferences(
            prefs,
            {"risk_profile": "Moderate", "logistics_profile": "Regional study", "intervention_modality": "Drug"},
            distance=30.0,
        )
        assert 0.0 <= result["preference_score"] <= 1.0
        assert len(result["breakdown"]) == 4

    def test_no_preferences(self):
        result = score_preferences(PatientPreferences(), {}, distance=50.0)
        assert result["preference_score"] == 0.5
        assert result["breakdown"] == {}

    def test_partial_preferences(self):
        prefs = PatientPreferences(travel_willingness=1)
        result = score_preferences(prefs, {}, distance=10.0)
        assert "travel" in result["breakdown"]
        assert len(result["breakdown"]) == 1

    def test_no_distance_skips_travel(self):
        prefs = PatientPreferences(travel_willingness=3, risk_tolerance=3)
        result = score_preferences(prefs, {"risk_profile": "Established"}, distance=None)
        assert "travel" not in result["breakdown"]
        assert "risk" in result["breakdown"]

    def test_breakdown_has_status_and_detail(self):
        prefs = PatientPreferences(risk_tolerance=1)
        result = score_preferences(prefs, {"risk_profile": "Exploratory"})
        breakdown = result["breakdown"]["risk"]
        assert breakdown["status"] == "poor"
        assert "detail" in breakdown
        assert isinstance(breakdown["score"], float)


class TestParsePreferences:
    def test_valid_json(self):
        msg = json.dumps({"travel": 2, "risk": 4, "schedule": 3, "modalities": ["Drug", "Behavioral"]})
        prefs = parse_preferences_from_message(msg)
        assert prefs.travel_willingness == 2
        assert prefs.risk_tolerance == 4
        assert prefs.schedule_flexibility == 3
        assert prefs.acceptable_modalities == frozenset({"Drug", "Behavioral"})

    def test_invalid_json(self):
        prefs = parse_preferences_from_message("skip")
        assert prefs == PatientPreferences()

    def test_clamps_out_of_range(self):
        msg = json.dumps({"travel": 10, "risk": -1})
        prefs = parse_preferences_from_message(msg)
        assert prefs.travel_willingness == 5
        assert prefs.risk_tolerance == 1

    def test_empty_modalities(self):
        msg = json.dumps({"modalities": []})
        prefs = parse_preferences_from_message(msg)
        assert prefs.acceptable_modalities is None

    def test_invalid_modalities_filtered(self):
        msg = json.dumps({"modalities": ["Drug", "FakeModality"]})
        prefs = parse_preferences_from_message(msg)
        assert prefs.acceptable_modalities == frozenset({"Drug"})
