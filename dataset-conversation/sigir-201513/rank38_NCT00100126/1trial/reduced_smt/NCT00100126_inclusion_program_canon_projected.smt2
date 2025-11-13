;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_diagnosis_of_acute_tonsillitis_now patient_has_diagnosis_of_pharyngitis_now))
(assert (or (not patient_sex_is_female_now) (not patient_is_lactating_now)))
