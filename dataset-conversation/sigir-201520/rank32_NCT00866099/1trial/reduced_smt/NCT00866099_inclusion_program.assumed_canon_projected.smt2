;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_dementia_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_memory_impairment_now patient_has_finding_of_impaired_cognition_now))
