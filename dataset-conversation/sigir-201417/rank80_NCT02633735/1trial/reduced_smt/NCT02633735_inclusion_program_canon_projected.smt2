;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_abdominal_pain_now)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 5.0))
(assert (<= patient_age_value_recorded_now_in_years 20.0))
