;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_oropharyngeal_dysphagia_now)
(assert (not patient_has_finding_of_injury_of_head_inthehistory))
(assert (not patient_has_finding_of_injury_of_neck_inthehistory))
(assert (not patient_has_undergone_operation_on_neck_inthehistory))
(assert (not patient_has_undergone_operative_procedure_on_head_inthehistory))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_disorder_of_nervous_system_now (not patient_has_finding_of_parkinson_s_disease_now)))
