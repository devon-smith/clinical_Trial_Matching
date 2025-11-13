;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_bacterial_infectious_disease_now)
(assert patient_has_finding_of_hyperemic_nasal_mucosa_now)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 0.0))
