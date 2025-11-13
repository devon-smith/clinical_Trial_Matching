;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 35.0))
(assert (<= patient_age_value_recorded_now_in_years 75.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_sex_is_male_now patient_sex_is_female_now))
(assert (or patient_has_finding_of_angina_class_ii_now patient_has_finding_of_angina_class_iii_now patient_has_finding_of_angina_class_iv_now))
