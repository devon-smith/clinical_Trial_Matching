;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_is_pregnant_now))
(assert (not patient_has_finding_of_left_ventricular_cardiac_dysfunction_now))
(assert (not patient_has_finding_of_acute_coronary_syndrome_now))
(assert (not patient_has_finding_of_new_onset_angina_now))
(assert (not patient_has_finding_of_progressive_angina_now))
(assert (not patient_has_finding_of_hemodynamic_instability_now))
(assert (not patient_has_finding_of_acute_st_segment_elevation_myocardial_infarction_now))
(assert (not patient_has_diagnosis_of_myocardial_infarction_inthehistory))
(assert (not patient_has_undergone_percutaneous_coronary_intervention_inthehistory))
(assert (not patient_has_undergone_coronary_artery_bypass_graft_inthehistory))
(assert (not patient_has_finding_of_persistent_atrial_fibrillation_now))
(assert (not patient_has_diagnosis_of_asthma_now))
(assert (not patient_has_finding_of_congenital_heart_disease_now))
(assert (not patient_has_finding_of_cardiomyopathy_now))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 30.0))
(assert (<= patient_age_value_recorded_now_in_years 75.0))
