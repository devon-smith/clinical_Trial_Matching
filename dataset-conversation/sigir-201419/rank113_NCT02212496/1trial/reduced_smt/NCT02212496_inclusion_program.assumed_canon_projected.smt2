;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_embolic_infarction_now)
(assert patient_has_finding_of_stroke_of_uncertain_pathology_now)
(assert patient_has_undergone_12_lead_ecg_inthehistory)
(assert patient_has_undergone_magnetic_resonance_imaging_mri_of_vessels_inthehistory)
(assert patient_has_undergone_mri_of_brain_and_brain_stem_inthehistory)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_undergone_transthoracic_ultrasonography_of_heart_with_contrast_inthehistory patient_has_undergone_transesophageal_echocardiography_with_contrast_inthehistory patient_has_undergone_transcranial_doppler_ultrasonography_inthehistory))
