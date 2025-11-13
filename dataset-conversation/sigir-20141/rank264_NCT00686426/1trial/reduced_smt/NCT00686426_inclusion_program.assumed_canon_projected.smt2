;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_is_pregnant_now))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 25.0))
(assert (<= patient_age_value_recorded_now_in_years 50.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_contraception_now patient_is_pregnant_now))
(assert (or (not patient_sex_is_female_now) patient_is_pregnant_now))
(assert (or patient_sex_is_female_now (not patient_has_childbearing_potential_now)))
(assert (or patient_has_finding_of_contraception_now (not patient_sex_is_female_now)))
