;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_completed_study_3133k1_3000 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has completed study 3133K1-3000.","when_to_set_to_false":"Set to false if the patient has not completed study 3133K1-3000.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has completed study 3133K1-3000.","meaning":"Boolean indicating whether the patient has completed study 3133K1-3000."}  ;; "To be included, the patient must have completed study 3133K1-3000."
(declare-const patient_has_undergone_magnetic_resonance_imaging_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone magnetic resonance imaging at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone magnetic resonance imaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone magnetic resonance imaging.","meaning":"Boolean indicating whether the patient has undergone magnetic resonance imaging at any time in the past."}  ;; "have a brain magnetic resonance imaging scan consistent with the diagnosis of Alzheimer Disease"
(declare-const patient_has_undergone_magnetic_resonance_imaging_inthehistory@@anatomical_site_brain Bool) ;; {"when_to_set_to_true":"Set to true if the magnetic resonance imaging performed was of the brain.","when_to_set_to_false":"Set to false if the magnetic resonance imaging performed was not of the brain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the magnetic resonance imaging was of the brain.","meaning":"Boolean indicating whether the magnetic resonance imaging was of the brain."}  ;; "brain magnetic resonance imaging"
(declare-const patient_has_undergone_magnetic_resonance_imaging_inthehistory@@consistent_with_diagnosis_of_alzheimer_disease Bool) ;; {"when_to_set_to_true":"Set to true if the findings of the brain magnetic resonance imaging are consistent with the diagnosis of Alzheimer Disease.","when_to_set_to_false":"Set to false if the findings of the brain magnetic resonance imaging are not consistent with the diagnosis of Alzheimer Disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the findings are consistent with Alzheimer Disease.","meaning":"Boolean indicating whether the findings of the brain magnetic resonance imaging are consistent with the diagnosis of Alzheimer Disease."}  ;; "magnetic resonance imaging scan consistent with the diagnosis of Alzheimer Disease"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable for anatomical site implies the patient has had MRI
(assert
  (! (=> patient_has_undergone_magnetic_resonance_imaging_inthehistory@@anatomical_site_brain
         patient_has_undergone_magnetic_resonance_imaging_inthehistory)
     :named REQ0_AUXILIARY0)) ;; "brain magnetic resonance imaging"

;; Qualifier variable for consistency with Alzheimer Disease implies the patient has had MRI
(assert
  (! (=> patient_has_undergone_magnetic_resonance_imaging_inthehistory@@consistent_with_diagnosis_of_alzheimer_disease
         patient_has_undergone_magnetic_resonance_imaging_inthehistory)
     :named REQ0_AUXILIARY1)) ;; "magnetic resonance imaging scan consistent with the diagnosis of Alzheimer Disease"

;; Both qualifiers together imply the patient has had a brain MRI
(assert
  (! (=> (and patient_has_undergone_magnetic_resonance_imaging_inthehistory@@anatomical_site_brain
              patient_has_undergone_magnetic_resonance_imaging_inthehistory@@consistent_with_diagnosis_of_alzheimer_disease)
         patient_has_undergone_magnetic_resonance_imaging_inthehistory)
     :named REQ0_AUXILIARY2)) ;; "brain magnetic resonance imaging scan consistent with the diagnosis of Alzheimer Disease"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: patient must have completed study 3133K1-3000
(assert
  (! patient_has_completed_study_3133k1_3000
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have completed study 3133K1-3000."

;; Component 1: patient must have a brain MRI scan consistent with Alzheimer Disease
(assert
  (! (and patient_has_undergone_magnetic_resonance_imaging_inthehistory@@anatomical_site_brain
          patient_has_undergone_magnetic_resonance_imaging_inthehistory@@consistent_with_diagnosis_of_alzheimer_disease)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a brain magnetic resonance imaging scan consistent with the diagnosis of Alzheimer Disease."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_mini_mental_state_examination_score_value_recorded_now_withunit_none Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's Mini-Mental Status Examination score is recorded at screening.","when_to_set_to_null":"Set to null if the score is not recorded at screening or is indeterminate.","meaning":"Numeric value representing the patient's Mini-Mental Status Examination score recorded at screening."}  ;; "Mini-Mental Status Examination score greater than or equal to 10 at screening"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_mini_mental_state_examination_score_value_recorded_now_withunit_none 10)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "Mini-Mental Status Examination score greater than or equal to 10 at screening"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_caregiver_able_to_attend_all_clinic_visits_with_patient Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a caregiver who is able to attend all clinic visits with the patient.","when_to_set_to_false":"Set to false if the patient does not have a caregiver who is able to attend all clinic visits with the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a caregiver who is able to attend all clinic visits with the patient.","meaning":"Boolean indicating whether the patient has a caregiver who is able to attend all clinic visits with the patient."}  ;; "To be included, the patient must have a caregiver who is able to attend all clinic visits with the patient."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_caregiver_able_to_attend_all_clinic_visits_with_patient
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have a caregiver who is able to attend all clinic visits with the patient."
