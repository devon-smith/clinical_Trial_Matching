;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_clinical_signs_of_raised_intracranial_pressure_now))
(assert (not patient_has_suspicion_of_raised_intracranial_pressure_now))
(assert (not patient_has_finding_of_sepsis_syndrome_now))
(assert (not patient_has_finding_of_shock_now))
(assert (not patient_is_undergoing_emergency_operation_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_can_undergo_transthoracic_echocardiography_now patient_can_undergo_transesophageal_echocardiography_now))
