;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_can_undergo_oral_antibiotic_therapy_now)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_months 6.0))
(assert (<= patient_age_value_recorded_now_in_years 12.0))
