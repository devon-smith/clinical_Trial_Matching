;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_alzheimer_s_disease_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_is_exposed_to_rivastigmine_now patient_is_exposed_to_donepezil_now patient_is_exposed_to_galantamine_now))
