;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_congestive_heart_failure_inthehistory))
(assert (not patient_has_finding_of_left_ventricular_cardiac_dysfunction_inthehistory))
(assert (not patient_has_finding_of_pulmonary_edema_now))
(assert (not patient_has_undergone_coronary_artery_bypass_graft_inthehistory))
(assert (not patient_has_finding_of_myocardial_infarction_inthehistory))
(assert (not patient_has_diagnosis_of_cerebrovascular_accident_inthehistory))
(assert (not patient_can_undergo_coronary_artery_bypass_graft_now))
(assert (not patient_has_finding_of_renal_insufficiency_now))
(assert (not patient_has_undergone_clinical_trial_inthepast6months))
(assert (not patient_is_undergoing_clinical_trial_now))
(assert (not patient_is_pregnant_now))
(assert (not patient_is_lactating_now))
(assert (not patients_lactation_is_positive_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_renal_insufficiency_now (not patient_has_finding_of_cardiogenic_shock_now)))
(assert (or (not patient_can_undergo_coronary_angiography_now) (not patient_can_undergo_magnetic_resonance_imaging_now) (not patient_can_undergo_percutaneous_coronary_intervention_now)))
(assert (or (not patient_has_finding_of_cardiogenic_shock_now) (not patient_has_finding_of_low_blood_pressure_now) (not patient_has_finding_of_poor_peripheral_circulation_now)))
