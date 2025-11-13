;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_hypertensive_disorder_now)
(assert patient_has_diagnosis_of_congestive_heart_failure_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_diagnosis_of_coronary_arteriosclerosis_now (not patient_has_diagnosis_of_congestive_heart_failure_now)))
(assert (or (not patient_has_diagnosis_of_congestive_heart_failure_now) patient_has_finding_of_stented_coronary_artery_now patient_has_undergone_coronary_artery_bypass_graft_inthehistory))
(assert (or patient_has_diagnosis_of_coronary_arteriosclerosis_now patient_has_finding_of_stented_coronary_artery_now patient_has_undergone_coronary_artery_bypass_graft_inthehistory))
