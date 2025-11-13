;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_septic_shock_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_shock_now (not patient_has_finding_of_low_blood_pressure_now)))
