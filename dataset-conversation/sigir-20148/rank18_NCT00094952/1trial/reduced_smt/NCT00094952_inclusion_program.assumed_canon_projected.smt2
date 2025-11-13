;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_educated_to_high_school_level_now)
(assert patient_has_undergone_evaluation_of_psychiatric_state_of_patient_now_outcome_is_normal)
(assert patient_has_undergone_medical_assessment_now_outcome_is_normal)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 60.0))
(assert (<= patient_age_value_recorded_now_in_years 80.0))
