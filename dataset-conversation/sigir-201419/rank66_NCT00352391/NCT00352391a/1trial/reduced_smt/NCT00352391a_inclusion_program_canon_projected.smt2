;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_undergone_complete_excision_inthehistory)
(assert patient_has_undergone_surgical_procedure_inthehistory)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_smoker_now patient_has_finding_of_ex_smoker_now))
