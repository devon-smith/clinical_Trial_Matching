;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_electroencephalogram_abnormal_inthehistory)
(assert patient_has_finding_of_epileptic_seizures_clonic_inthehistory)
(assert patient_has_finding_of_seizure_inthehistory)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_developmental_regression_inthehistory patient_has_finding_of_developmental_delay_inthehistory))
