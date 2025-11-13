;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_left_bundle_branch_block_now))
(assert (not patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory))
(assert (not patient_has_undergone_coronary_artery_bypass_graft_inthehistory))
(assert (not patient_has_diagnosis_of_myocardial_infarction_inthehistory))
(assert (not patient_has_undergone_percutaneous_coronary_intervention_inthehistory))
(assert (not patient_has_finding_of_renal_impairment_now))
(assert (not patient_has_finding_of_hemodynamic_instability_now))
(assert (not patient_has_finding_of_patient_s_condition_unstable_now))
(assert (not patient_is_pregnant_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_renal_impairment_now (not patient_has_finding_of_ekg_myocardial_ischemia_now)))
(assert (or patient_has_finding_of_hemodynamic_instability_now (not patient_has_finding_of_ekg_myocardial_ischemia_now)))
(assert (or patient_has_finding_of_patient_s_condition_unstable_now (not patient_has_finding_of_ekg_myocardial_ischemia_now)))
(assert (or patient_has_finding_of_renal_impairment_now patient_has_finding_of_ekg_myocardial_ischemia_now))
(assert (or patient_has_finding_of_hemodynamic_instability_now patient_has_finding_of_ekg_myocardial_ischemia_now))
(assert (or patient_has_finding_of_patient_s_condition_unstable_now patient_has_finding_of_ekg_myocardial_ischemia_now))
(assert (or (not patient_has_childbearing_potential_now) (not patient_has_undergone_hysterectomy_inthehistory)))
(assert (or (not patient_has_childbearing_potential_now) (not patient_has_undergone_ligation_of_fallopian_tube_inthehistory)))
(assert (or (not patient_has_childbearing_potential_now) (not patient_will_undergo_computerized_axial_tomography_inthefuture)))
(assert (or patient_will_undergo_computerized_axial_tomography_inthefuture (not patient_has_finding_of_ekg_myocardial_ischemia_now)))
(assert (or patient_will_undergo_computerized_axial_tomography_inthefuture patient_has_finding_of_ekg_myocardial_ischemia_now))
(assert (or patient_will_undergo_computerized_axial_tomography_inthefuture patient_has_finding_of_renal_impairment_now))
(assert (or patient_will_undergo_computerized_axial_tomography_inthefuture patient_has_finding_of_hemodynamic_instability_now))
(assert (or patient_will_undergo_computerized_axial_tomography_inthefuture patient_has_finding_of_patient_s_condition_unstable_now))
(assert (or patient_has_undergone_hysterectomy_inthehistory patient_has_undergone_ligation_of_fallopian_tube_inthehistory patient_has_childbearing_potential_now))
