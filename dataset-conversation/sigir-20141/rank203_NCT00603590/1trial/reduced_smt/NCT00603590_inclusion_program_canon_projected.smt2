;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_sex_is_male_now)
(assert patient_has_finding_of_male_now)
(assert patient_has_finding_of_female_now)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 50.0))
(assert (<= patient_age_value_recorded_now_in_years 80.0))
(assert (>= patient_age_value_recorded_now_in_years 55.0))
