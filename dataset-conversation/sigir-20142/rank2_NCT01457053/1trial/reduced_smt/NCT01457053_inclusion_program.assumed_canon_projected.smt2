;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_decompensated_cardiac_failure_now)
(assert patient_has_finding_of_hypervolemia_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_pleural_effusion_now (not patient_has_finding_of_hypervolemia_now)))
(assert (or patient_has_finding_of_pulmonary_edema_now (not patient_has_finding_of_hypervolemia_now)))
(assert (or (not patient_has_finding_of_hypervolemia_now) patient_is_undergoing_hospital_admission_now))
(assert (or patient_has_finding_of_pulmonary_edema_now patient_has_finding_of_pleural_effusion_now))
(assert (or patient_has_finding_of_pleural_effusion_now patient_is_undergoing_hospital_admission_now))
(assert (or patient_has_finding_of_pulmonary_edema_now patient_is_undergoing_hospital_admission_now))
