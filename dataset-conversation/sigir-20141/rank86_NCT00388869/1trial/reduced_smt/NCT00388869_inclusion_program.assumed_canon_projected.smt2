;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_is_undergoing_ct_of_abdomen_now)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 30.0))
(assert (<= patient_age_value_recorded_now_in_years 100.0))
