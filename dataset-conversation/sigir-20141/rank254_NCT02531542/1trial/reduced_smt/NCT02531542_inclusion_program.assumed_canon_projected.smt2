;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_dyspnea_now)
(assert patient_has_undergone_electrocardiographic_procedure_now)
(assert patient_has_finding_of_sinus_rhythm_now)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 75.0))
