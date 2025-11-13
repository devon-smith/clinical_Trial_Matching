;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone percutaneous coronary intervention at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone percutaneous coronary intervention in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone percutaneous coronary intervention in their history.","meaning":"Boolean indicating whether the patient has undergone percutaneous coronary intervention at any time in their history."} // "percutaneous coronary intervention"
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@is_primary Bool) ;; {"when_to_set_to_true":"Set to true if the percutaneous coronary intervention undergone by the patient was a primary PCI.","when_to_set_to_false":"Set to false if the percutaneous coronary intervention was not a primary PCI.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the PCI was primary.","meaning":"Boolean indicating whether the PCI was primary."} // "primary percutaneous coronary intervention"
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@for_acute_st_segment_elevation_myocardial_infarction Bool) ;; {"when_to_set_to_true":"Set to true if the percutaneous coronary intervention was performed specifically for acute ST segment elevation myocardial infarction.","when_to_set_to_false":"Set to false if the percutaneous coronary intervention was not performed for acute ST segment elevation myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the PCI was performed for acute ST segment elevation myocardial infarction.","meaning":"Boolean indicating whether the PCI was performed for acute ST segment elevation myocardial infarction."} // "for acute ST elevation myocardial infarction"
(declare-const patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of acute ST segment elevation myocardial infarction in their history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of acute ST segment elevation myocardial infarction in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of acute ST segment elevation myocardial infarction in their history.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of acute ST segment elevation myocardial infarction in their history."} // "acute ST elevation myocardial infarction"
(declare-const number_of_lesions_in_culprit_artery_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of lesions present in the culprit artery at the current time, as determined by angiography or other relevant diagnostic procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many lesions are present in the culprit artery at the current time.","meaning":"Numeric value representing the number of lesions present in the culprit artery at the current time, measured as a count."} // "the number of lesions in the culprit artery > 1"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@is_primary
         patient_has_undergone_percutaneous_coronary_intervention_inthehistory)
     :named REQ0_AUXILIARY0)) ;; "primary percutaneous coronary intervention"

(assert
  (! (=> patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@for_acute_st_segment_elevation_myocardial_infarction
         patient_has_undergone_percutaneous_coronary_intervention_inthehistory)
     :named REQ0_AUXILIARY1)) ;; "percutaneous coronary intervention for acute ST elevation myocardial infarction"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Must have undergone primary PCI for acute STEMI
(assert
  (! (and patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@is_primary
          patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@for_acute_st_segment_elevation_myocardial_infarction)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "undergone primary percutaneous coronary intervention for acute ST elevation myocardial infarction"

;; Component 1: Must have >1 lesion in the culprit artery
(assert
  (! (> number_of_lesions_in_culprit_artery_value_recorded_now_withunit_count 1)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "number of lesions in the culprit artery > 1"
