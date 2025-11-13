;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_sepsis_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_is_undergoing_intravenous_antibiotic_therapy_now) patient_has_finding_of_sepsis_now))
(assert (or (not patient_has_childbearing_potential_now) (not patient_is_pregnant_now)))
