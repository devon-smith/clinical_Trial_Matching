;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_diagnosis_of_hypertensive_disorder_inthehistory patient_has_finding_of_chronic_kidney_disease_inthehistory))
(assert (or patient_has_diagnosis_of_hypertensive_disorder_inthehistory (not patient_has_finding_of_renal_impairment_inthehistory)))
(assert (or patient_has_diagnosis_of_hypertensive_disorder_inthehistory patient_has_finding_of_renal_impairment_inthehistory))
(assert (or (not patient_has_finding_of_renal_impairment_inthehistory) patient_has_finding_of_chronic_kidney_disease_inthehistory))
(assert (or patient_has_finding_of_renal_impairment_inthehistory patient_has_finding_of_chronic_kidney_disease_inthehistory))
