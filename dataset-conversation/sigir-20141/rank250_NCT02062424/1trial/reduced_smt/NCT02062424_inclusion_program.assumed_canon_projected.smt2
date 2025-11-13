;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patients_risk_factor_is_positive_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_sex_is_female_now patient_sex_is_male_now patient_has_finding_of_overweight_now patient_has_finding_of_obese_now patient_has_finding_of_behavior_showing_reduced_motor_activity_now))
