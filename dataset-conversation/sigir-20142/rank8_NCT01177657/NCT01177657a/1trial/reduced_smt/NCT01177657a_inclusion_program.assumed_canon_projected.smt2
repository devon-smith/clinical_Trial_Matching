;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_gastroenteritis_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_undergone_identification_of_rotavirus_antigen_in_feces_now_outcome_is_positive patient_has_undergone_identification_of_rotavirus_antigen_in_feces_inthepast48hours_outcome_is_positive))
