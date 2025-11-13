;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_months 2.0))
(assert (<= patient_age_value_recorded_now_in_months 59.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not (>= patient_age_value_recorded_now_in_months 12.0)) (>= patient_age_value_recorded_now_in_months 12.0)))
