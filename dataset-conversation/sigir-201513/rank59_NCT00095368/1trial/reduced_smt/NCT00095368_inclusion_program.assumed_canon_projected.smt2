;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patients_streptococcus_pyogenes_antigen_is_positive_now)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 12.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_is_pregnant_now) (not patient_sex_is_female_now)))
