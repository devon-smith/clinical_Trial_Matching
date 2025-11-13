;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_non_cardiac_chest_pain_inthehistory)
(assert patient_has_symptoms_of_chest_pain_now)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))
(assert (<= patient_age_value_recorded_now_in_years 80.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_undergone_cardiovascular_stress_testing_inthehistory_outcome_is_negative patient_has_undergone_coronary_angiography_inthehistory_outcome_is_negative))
