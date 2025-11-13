;; ===================== Declarations for the inclusion criteria (REQ 0) =====================
(declare-const patient_has_finding_of_ischemic_stroke_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of ischemic stroke.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of ischemic stroke.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of ischemic stroke.","meaning":"Boolean indicating whether the patient currently has ischemic stroke."}  ;; "To be included, the patient must have acute ischemic stroke."
(declare-const patient_has_finding_of_ischemic_stroke_now@@temporalcontext_within_7_days_from_symptom_onset Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ischemic stroke and presented within 7 days from symptom onset.","when_to_set_to_false":"Set to false if the patient currently has ischemic stroke but did not present within 7 days from symptom onset.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient presented within 7 days from symptom onset.","meaning":"Boolean indicating whether the patient currently has ischemic stroke and presented within 7 days from symptom onset."}  ;; "To be included, the patient must have presented within 7 days from symptom onset."
(declare-const patient_symptom_onset_to_presentation_time_value_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days between the patient's symptom onset and presentation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined when the patient's symptom onset and presentation occurred.","meaning":"Numeric value representing the time in days from symptom onset to presentation."}  ;; "To be included, the patient must have presented within 7 days from symptom onset."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies the stem variable (if patient presented within 7 days from symptom onset with ischemic stroke, then patient has ischemic stroke)
(assert
  (! (=> patient_has_finding_of_ischemic_stroke_now@@temporalcontext_within_7_days_from_symptom_onset
         patient_has_finding_of_ischemic_stroke_now)
     :named REQ0_AUXILIARY0)) ;; "To be included, the patient must have (acute ischemic stroke) AND (have presented within 7 days from symptom onset)."

;; Definition: patient_has_finding_of_ischemic_stroke_now@@temporalcontext_within_7_days_from_symptom_onset is true iff patient has ischemic stroke AND presented within 7 days from symptom onset
(assert
  (! (= patient_has_finding_of_ischemic_stroke_now@@temporalcontext_within_7_days_from_symptom_onset
        (and patient_has_finding_of_ischemic_stroke_now
             (<= patient_symptom_onset_to_presentation_time_value_in_days 7.0)))
     :named REQ0_AUXILIARY1)) ;; "To be included, the patient must have presented within 7 days from symptom onset."

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Patient must have acute ischemic stroke
(assert
  (! patient_has_finding_of_ischemic_stroke_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have acute ischemic stroke."

;; Component 1: Patient must have presented within 7 days from symptom onset (with ischemic stroke)
(assert
  (! patient_has_finding_of_ischemic_stroke_now@@temporalcontext_within_7_days_from_symptom_onset
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have presented within 7 days from symptom onset."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_embolic_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of embolic infarction.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of embolic infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of embolic infarction.","meaning":"Boolean indicating whether the patient currently has embolic infarction."}  ;; "To be included, the patient must have embolic infarction outside the perforator territory as revealed by diffusion-weighted imaging."
(declare-const patient_has_finding_of_embolic_infarction_now@@located_outside_perforator_territory Bool) ;; {"when_to_set_to_true":"Set to true if the patient's embolic infarction is located outside the perforator territory.","when_to_set_to_false":"Set to false if the patient's embolic infarction is not located outside the perforator territory.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's embolic infarction is located outside the perforator territory.","meaning":"Boolean indicating whether the patient's embolic infarction is located outside the perforator territory."}  ;; "To be included, the patient must have embolic infarction outside the perforator territory as revealed by diffusion-weighted imaging."
(declare-const patient_has_finding_of_embolic_infarction_now@@revealed_by_diffusion_weighted_imaging Bool) ;; {"when_to_set_to_true":"Set to true if the patient's embolic infarction is revealed by diffusion-weighted imaging.","when_to_set_to_false":"Set to false if the patient's embolic infarction is not revealed by diffusion-weighted imaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's embolic infarction is revealed by diffusion-weighted imaging.","meaning":"Boolean indicating whether the patient's embolic infarction is revealed by diffusion-weighted imaging."}  ;; "To be included, the patient must have embolic infarction outside the perforator territory as revealed by diffusion-weighted imaging."

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_embolic_infarction_now@@located_outside_perforator_territory
         patient_has_finding_of_embolic_infarction_now)
     :named REQ1_AUXILIARY0)) ;; "outside the perforator territory" is a qualifier of embolic infarction

(assert
  (! (=> patient_has_finding_of_embolic_infarction_now@@revealed_by_diffusion_weighted_imaging
         patient_has_finding_of_embolic_infarction_now)
     :named REQ1_AUXILIARY1)) ;; "revealed by diffusion-weighted imaging" is a qualifier of embolic infarction

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Patient must have embolic infarction outside perforator territory as revealed by diffusion-weighted imaging
(assert
  (! (and patient_has_finding_of_embolic_infarction_now@@located_outside_perforator_territory
          patient_has_finding_of_embolic_infarction_now@@revealed_by_diffusion_weighted_imaging)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have embolic infarction outside the perforator territory as revealed by diffusion-weighted imaging."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_stroke_of_uncertain_pathology_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a stroke and the cause remains undetermined (uncertain pathology).","when_to_set_to_false":"Set to false if the patient currently has a stroke and the cause is determined, or if the patient does not have a stroke of uncertain pathology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a stroke of uncertain pathology.","meaning":"Boolean indicating whether the patient currently has a stroke of uncertain pathology (undetermined cause of stroke)."} ;; "undetermined cause of stroke"
(declare-const patient_has_finding_of_stroke_of_uncertain_pathology_now@@persists_despite_initial_evaluation_including_electrocardiogram_and_brain_imaging_upon_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient's stroke of uncertain pathology persists despite initial evaluation including electrocardiogram and brain imaging upon admission.","when_to_set_to_false":"Set to false if the patient's stroke of uncertain pathology does not persist after such evaluation, or if the evaluation was not performed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the uncertainty persists despite the specified evaluation.","meaning":"Boolean indicating whether the patient's stroke of uncertain pathology persists despite initial evaluation including electrocardiogram and brain imaging upon admission."} ;; "undetermined cause of stroke despite initial evaluation (including electrocardiogram AND brain imaging upon admission)"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_stroke_of_uncertain_pathology_now@@persists_despite_initial_evaluation_including_electrocardiogram_and_brain_imaging_upon_admission
         patient_has_finding_of_stroke_of_uncertain_pathology_now)
     :named REQ2_AUXILIARY0)) ;; "undetermined cause of stroke despite initial evaluation (including electrocardiogram AND brain imaging upon admission)"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_stroke_of_uncertain_pathology_now@@persists_despite_initial_evaluation_including_electrocardiogram_and_brain_imaging_upon_admission
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have an undetermined cause of stroke despite initial evaluation (including electrocardiogram AND brain imaging upon admission)."

;; ===================== Declarations for the inclusion criterion (REQ 3) =====================
(declare-const patient_has_undergone_mri_of_brain_and_brain_stem_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone MRI of the brain and brain stem at any point in their history.","when_to_set_to_false":"Set to false if the patient has never undergone MRI of the brain and brain stem at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone MRI of the brain and brain stem.","meaning":"Boolean indicating whether the patient has ever undergone MRI of the brain and brain stem at any point in their history."} ;; "brain magnetic resonance imaging"
(declare-const patient_has_undergone_magnetic_resonance_imaging_mri_of_vessels_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone magnetic resonance angiography (MRI of vessels) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never undergone magnetic resonance angiography (MRI of vessels) at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone magnetic resonance angiography (MRI of vessels).","meaning":"Boolean indicating whether the patient has ever undergone magnetic resonance angiography (MRI of vessels) at any point in their history."} ;; "magnetic resonance angiography"
(declare-const patient_has_undergone_cardiac_workups_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone cardiac work-ups at any point in their history.","when_to_set_to_false":"Set to false if the patient has never undergone cardiac work-ups at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone cardiac work-ups.","meaning":"Boolean indicating whether the patient has ever undergone cardiac work-ups at any point in their history."} ;; "cardiac work-ups"
(declare-const patient_has_undergone_12_lead_ecg_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone 12-lead electrocardiography at any point in their history.","when_to_set_to_false":"Set to false if the patient has never undergone 12-lead electrocardiography at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone 12-lead electrocardiography.","meaning":"Boolean indicating whether the patient has ever undergone 12-lead electrocardiography at any point in their history."} ;; "12-lead electrocardiography"
(declare-const patient_has_undergone_transthoracic_ultrasonography_of_heart_with_contrast_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone transthoracic echocardiography with injection of agitated saline at any point in their history.","when_to_set_to_false":"Set to false if the patient has never undergone transthoracic echocardiography with injection of agitated saline at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone transthoracic echocardiography with injection of agitated saline.","meaning":"Boolean indicating whether the patient has ever undergone transthoracic echocardiography with injection of agitated saline at any point in their history."} ;; "transthoracic echocardiography with injection of agitated saline"
(declare-const patient_has_undergone_transesophageal_echocardiography_with_contrast_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone transesophageal echocardiography with injection of agitated saline at any point in their history.","when_to_set_to_false":"Set to false if the patient has never undergone transesophageal echocardiography with injection of agitated saline at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone transesophageal echocardiography with injection of agitated saline.","meaning":"Boolean indicating whether the patient has ever undergone transesophageal echocardiography with injection of agitated saline at any point in their history."} ;; "transesophageal echocardiography with injection of agitated saline"
(declare-const patient_has_undergone_transcranial_doppler_ultrasonography_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone transcranial Doppler ultrasonography at any point in their history.","when_to_set_to_false":"Set to false if the patient has never undergone transcranial Doppler ultrasonography at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone transcranial Doppler ultrasonography.","meaning":"Boolean indicating whether the patient has ever undergone transcranial Doppler ultrasonography at any point in their history."} ;; "transcranial Doppler monitoring"
(declare-const patient_has_undergone_holter_extended_electrocardiographic_recording_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone Holter extended electrocardiographic recording at any point in their history.","when_to_set_to_false":"Set to false if the patient has never undergone Holter extended electrocardiographic recording at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone Holter extended electrocardiographic recording.","meaning":"Boolean indicating whether the patient has ever undergone Holter extended electrocardiographic recording at any point in their history."} ;; "Holter monitoring"
(declare-const patient_has_undergone_telemonitoring_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone telemonitoring at any point in their history.","when_to_set_to_false":"Set to false if the patient has never undergone telemonitoring at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone telemonitoring.","meaning":"Boolean indicating whether the patient has ever undergone telemonitoring at any point in their history."} ;; "telemonitoring"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; No auxiliary assertions are needed for this requirement, as all relationships are direct and explicit.

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: "To be included, the patient must have undergone brain magnetic resonance imaging and magnetic resonance angiography."
(assert
  (! (and patient_has_undergone_mri_of_brain_and_brain_stem_inthehistory
          patient_has_undergone_magnetic_resonance_imaging_mri_of_vessels_inthehistory)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have undergone brain magnetic resonance imaging and magnetic resonance angiography."

;; Component 1: "To be included, the patient must have undergone cardiac work-ups including 12-lead electrocardiography, transthoracic echocardiography with injection of agitated saline or transesophageal echocardiography with injection of agitated saline or agitated saline transcranial Doppler monitoring, and 24-hour Holter monitoring or telemonitoring."
(assert
  (! (and
        patient_has_undergone_12_lead_ecg_inthehistory
        (or patient_has_undergone_transthoracic_ultrasonography_of_heart_with_contrast_inthehistory
            patient_has_undergone_transesophageal_echocardiography_with_contrast_inthehistory
            patient_has_undergone_transcranial_doppler_ultrasonography_inthehistory)
        (or patient_has_undergone_holter_extended_electrocardiographic_recording_inthehistory
            patient_has_undergone_telemonitoring_inthehistory))
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have undergone cardiac work-ups including 12-lead electrocardiography, transthoracic echocardiography with injection of agitated saline or transesophageal echocardiography with injection of agitated saline or agitated saline transcranial Doppler monitoring, and 24-hour Holter monitoring or telemonitoring."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_provided_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided informed consent.","when_to_set_to_false":"Set to false if the patient has not provided informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided informed consent.","meaning":"Boolean indicating whether the patient has provided informed consent."}  ;; "To be included, the patient must have provided informed consent."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_provided_informed_consent
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have provided informed consent."
