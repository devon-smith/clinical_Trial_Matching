;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_diagnosis_of_cocaine_dependence_inthehistory patient_has_diagnosis_of_alcohol_dependence_inthehistory))
(assert (or patient_has_diagnosis_of_cocaine_dependence_inthehistory (not patient_has_diagnosis_of_psychoactive_substance_dependence_inthehistory)))
