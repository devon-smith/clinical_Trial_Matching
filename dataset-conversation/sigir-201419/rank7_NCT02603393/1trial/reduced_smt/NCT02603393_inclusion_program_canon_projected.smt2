;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_sex_is_male_now patient_sex_is_female_now))
(assert (or patient_sex_is_male_now (>= patient_age_value_recorded_now_in_years 40.0)))
(assert (or patient_has_finding_of_ex_smoker_now patient_has_finding_of_smoker_now))
