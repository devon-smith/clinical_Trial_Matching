;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_hyperlipidemia_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_diagnosis_of_hyperlipidemia_now) (not patient_has_undergone_lipid_lowering_therapy_inthehistory)))
(assert (or (not patient_has_diagnosis_of_hyperlipidemia_now) patient_has_undergone_lipid_lowering_therapy_inthehistory))
