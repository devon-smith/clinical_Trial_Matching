;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_malignant_essential_hypertension_now))
(assert (not patient_has_diagnosis_of_renal_failure_syndrome_now))
(assert (not patient_has_diagnosis_of_terminal_illness_now))
(assert (not patient_has_finding_of_secondary_hypertension_now))
(assert (not patient_has_diagnosis_of_gout_now))
(assert (not patient_has_finding_of_unable_to_stand_up_now))
(assert (not patient_has_finding_of_unable_to_walk_now))
(assert (not patient_has_undergone_clinical_drug_trial_inthepast1months))
(assert (not patient_has_finding_of_alcohol_abuse_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_is_taking_digoxin_now patient_has_finding_of_congestive_heart_failure_now))
(assert (or patient_has_diagnosis_of_renal_failure_syndrome_now patient_is_taking_digoxin_now))
(assert (or patient_has_diagnosis_of_renal_failure_syndrome_now patient_has_finding_of_congestive_heart_failure_now))
