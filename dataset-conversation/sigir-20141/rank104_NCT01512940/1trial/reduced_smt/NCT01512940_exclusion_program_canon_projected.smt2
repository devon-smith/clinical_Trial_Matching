;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_diagnosis_of_autoimmune_connective_tissue_disorder_inthehistory))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_childbearing_potential_now) (not patient_is_pregnant_now)))
(assert (or (not patient_has_childbearing_potential_now) (not patient_is_pregnant_inthefuture)))
(assert (or (not patient_has_childbearing_potential_now) (not patient_is_lactating_now)))
(assert (or (not patient_has_childbearing_potential_now) (not patient_is_lactating_inthefuture)))
