;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patients_tobacco_smoking_consumption_is_positive_now))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 20.0))
(assert (<= patient_age_value_recorded_now_in_years 65.0))
