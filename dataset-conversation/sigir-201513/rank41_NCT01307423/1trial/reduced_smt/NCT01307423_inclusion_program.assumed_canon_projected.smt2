;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_psoriatic_arthritis_now)
(assert patient_is_undergoing_therapeutic_procedure_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_sex_is_female_now) (not patient_has_childbearing_potential_now) (not patient_is_pregnant_now)))
