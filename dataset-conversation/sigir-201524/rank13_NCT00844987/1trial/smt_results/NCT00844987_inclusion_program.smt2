;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chest pain.","meaning":"Boolean indicating whether the patient currently has chest pain now."}  ;; "To be included, the patient must have typical chest pain."
(declare-const patient_has_finding_of_chest_pain_now@@typical Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current chest pain is typical.","when_to_set_to_false":"Set to false if the patient's current chest pain is not typical.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current chest pain is typical.","meaning":"Boolean indicating whether the patient's current chest pain is typical."}  ;; "To be included, the patient must have typical chest pain."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies the stem variable (if chest pain is typical, chest pain must be present)
(assert
  (! (=> patient_has_finding_of_chest_pain_now@@typical
         patient_has_finding_of_chest_pain_now)
     :named REQ0_AUXILIARY0)) ;; "To be included, the patient must have typical chest pain."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_chest_pain_now@@typical
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have typical chest pain."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_st_segment_elevation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of ST segment elevation.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of ST segment elevation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of ST segment elevation.","meaning":"Boolean indicating whether the patient currently has ST segment elevation."}  ;; "ST segment elevation in electrocardiogram"
(declare-const patient_has_finding_of_st_segment_elevation_now@@detected_in_electrocardiogram Bool) ;; {"when_to_set_to_true":"Set to true if the patient's ST segment elevation is detected in an electrocardiogram.","when_to_set_to_false":"Set to false if the patient's ST segment elevation is not detected in an electrocardiogram.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ST segment elevation is detected in an electrocardiogram.","meaning":"Boolean indicating whether the patient's ST segment elevation is detected in an electrocardiogram."}  ;; "ST segment elevation in electrocardiogram"
(declare-const patient_has_finding_of_st_segment_depression_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of ST segment depression.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of ST segment depression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of ST segment depression.","meaning":"Boolean indicating whether the patient currently has ST segment depression."}  ;; "ST segment depression in electrocardiogram"
(declare-const patient_has_finding_of_st_segment_depression_now@@detected_in_electrocardiogram Bool) ;; {"when_to_set_to_true":"Set to true if the patient's ST segment depression is detected in an electrocardiogram.","when_to_set_to_false":"Set to false if the patient's ST segment depression is not detected in an electrocardiogram.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ST segment depression is detected in an electrocardiogram.","meaning":"Boolean indicating whether the patient's ST segment depression is detected in an electrocardiogram."}  ;; "ST segment depression in electrocardiogram"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_st_segment_elevation_now@@detected_in_electrocardiogram
         patient_has_finding_of_st_segment_elevation_now)
     :named REQ1_AUXILIARY0)) ;; "ST segment elevation in electrocardiogram"

(assert
  (! (=> patient_has_finding_of_st_segment_depression_now@@detected_in_electrocardiogram
         patient_has_finding_of_st_segment_depression_now)
     :named REQ1_AUXILIARY1)) ;; "ST segment depression in electrocardiogram"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have (ST segment elevation in electrocardiogram OR ST segment depression in electrocardiogram).
(assert
  (! (or patient_has_finding_of_st_segment_elevation_now@@detected_in_electrocardiogram
         patient_has_finding_of_st_segment_depression_now@@detected_in_electrocardiogram)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (ST segment elevation in electrocardiogram OR ST segment depression in electrocardiogram)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_undergone_coronary_angiography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone coronary angiography now.","when_to_set_to_false":"Set to false if the patient has not undergone coronary angiography now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone coronary angiography now.","meaning":"Boolean indicating whether the patient has undergone coronary angiography now."}  ;; "coronary angiography"
(declare-const patient_has_undergone_coronary_angiography_now@@indication_present Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone coronary angiography now and there is a clinical indication for the procedure.","when_to_set_to_false":"Set to false if the patient has undergone coronary angiography now but there is no clinical indication for the procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is a clinical indication for the procedure.","meaning":"Boolean indicating whether the patient has undergone coronary angiography now and there is a clinical indication for the procedure."}  ;; "indication for coronary angiography"
(declare-const patient_has_undergone_percutaneous_coronary_intervention_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone percutaneous coronary intervention now.","when_to_set_to_false":"Set to false if the patient has not undergone percutaneous coronary intervention now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone percutaneous coronary intervention now.","meaning":"Boolean indicating whether the patient has undergone percutaneous coronary intervention now."}  ;; "percutaneous coronary intervention"
(declare-const patient_has_undergone_percutaneous_coronary_intervention_now@@performed_if_necessary Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone percutaneous coronary intervention now and the procedure was performed only if necessary.","when_to_set_to_false":"Set to false if the patient has undergone percutaneous coronary intervention now but the procedure was not performed only if necessary.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure was performed only if necessary.","meaning":"Boolean indicating whether the patient has undergone percutaneous coronary intervention now and the procedure was performed only if necessary."}  ;; "if necessary, with percutaneous coronary intervention"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for indication implies the patient underwent coronary angiography
(assert
  (! (=> patient_has_undergone_coronary_angiography_now@@indication_present
         patient_has_undergone_coronary_angiography_now)
     :named REQ2_AUXILIARY0)) ;; "indication for coronary angiography"

;; Qualifier variable for 'performed if necessary' implies the patient underwent PCI
(assert
  (! (=> patient_has_undergone_percutaneous_coronary_intervention_now@@performed_if_necessary
         patient_has_undergone_percutaneous_coronary_intervention_now)
     :named REQ2_AUXILIARY1)) ;; "if necessary, with percutaneous coronary intervention"

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must have an indication for coronary angiography; if necessary, with percutaneous coronary intervention.
(assert
  (! (and patient_has_undergone_coronary_angiography_now@@indication_present
          (or (not patient_has_undergone_percutaneous_coronary_intervention_now)
              patient_has_undergone_percutaneous_coronary_intervention_now@@performed_if_necessary))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have an indication for coronary angiography; if necessary, with percutaneous coronary intervention."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_signed_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed informed consent.","when_to_set_to_false":"Set to false if the patient has not signed informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed informed consent.","meaning":"Boolean indicating whether the patient has signed informed consent."}  ;; "To be included, the patient must have signed informed consent."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_signed_informed_consent
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have signed informed consent."
