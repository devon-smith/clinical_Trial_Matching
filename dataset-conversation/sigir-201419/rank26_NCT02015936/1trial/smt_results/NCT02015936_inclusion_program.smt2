;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (cancer)."}

(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@stage_iii Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (cancer) and the cancer is stage III.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of malignant neoplastic disease (cancer) and the cancer is not stage III.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cancer is stage III.","meaning":"Boolean indicating whether the patient's current diagnosis of malignant neoplastic disease (cancer) is stage III."}

(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@stage_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (cancer) and the cancer is stage IV.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of malignant neoplastic disease (cancer) and the cancer is not stage IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cancer is stage IV.","meaning":"Boolean indicating whether the patient's current diagnosis of malignant neoplastic disease (cancer) is stage IV."}

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@stage_iii
         patient_has_diagnosis_of_malignant_neoplastic_disease_now)
     :named REQ0_AUXILIARY0)) ;; "stage III cancer" implies "cancer"

(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@stage_iv
         patient_has_diagnosis_of_malignant_neoplastic_disease_now)
     :named REQ0_AUXILIARY1)) ;; "stage IV cancer" implies "cancer"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_has_diagnosis_of_malignant_neoplastic_disease_now@@stage_iii
         patient_has_diagnosis_of_malignant_neoplastic_disease_now@@stage_iv)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (a diagnosis of stage III cancer OR a diagnosis of stage IV cancer)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_able_to_understand_english_language_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to understand the English language.","when_to_set_to_false":"Set to false if the patient is currently not able to understand the English language.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to understand the English language.","meaning":"Boolean indicating whether the patient is currently able to understand the English language."} ;; "To be included, the patient must be able to understand the English language."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_is_able_to_understand_english_language_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be able to understand the English language."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_kps_karnofsky_performance_status_score_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured Karnofsky Performance Status score (percent) if a current measurement is available.","when_to_set_to_null":"Set to null if no current KPS score is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current Karnofsky Performance Status score in percent."} ;; "Karnofsky Performance Status score"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= patient_kps_karnofsky_performance_status_score_value_recorded_now_withunit_percent 60.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (Karnofsky Performance Status score ≥ 60 % (Karnofsky Performance Status score is a measure of the patient's ability to carry out daily activities))."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_fatigue_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of fatigue.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of fatigue.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of fatigue.","meaning":"Boolean indicating whether the patient currently has fatigue."} ;; "fatigue"
(declare-const patient_target_symptom_count_now Real) ;; {"when_to_set_to_value":"Set to the number of target symptoms the patient currently has, as determined by clinical assessment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many target symptoms the patient currently has.","meaning":"Numeric value representing the count of target symptoms present in the patient now."} ;; "at least two other target symptoms"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: To be included, the patient must have (fatigue OR at least two other target symptoms).
(assert
  (! (or patient_has_finding_of_fatigue_now
         (>= patient_target_symptom_count_now 2))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (fatigue OR at least two other target symptoms)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_been_cleared_by_provider_to_engage_in_physical_activity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been cleared by their provider to engage in physical activity now.","when_to_set_to_false":"Set to false if the patient has not been cleared by their provider to engage in physical activity now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been cleared by their provider to engage in physical activity now.","meaning":"Boolean indicating whether the patient has been cleared by their provider to engage in physical activity now."} ;; "To be included, the patient must have been cleared by the provider of the patient to (engage in low intensity physical activity OR engage in moderate intensity physical activity)."
(declare-const patient_has_been_cleared_by_provider_to_engage_in_physical_activity_now@@low_intensity Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been cleared by their provider to engage in low intensity physical activity now.","when_to_set_to_false":"Set to false if the patient has been cleared by their provider to engage in physical activity now, but not of low intensity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been cleared by their provider to engage in low intensity physical activity now.","meaning":"Boolean indicating whether the patient has been cleared by their provider to engage in low intensity physical activity now."} ;; "cleared by provider to engage in low intensity physical activity"
(declare-const patient_has_been_cleared_by_provider_to_engage_in_physical_activity_now@@moderate_intensity Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been cleared by their provider to engage in moderate intensity physical activity now.","when_to_set_to_false":"Set to false if the patient has been cleared by their provider to engage in physical activity now, but not of moderate intensity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been cleared by their provider to engage in moderate intensity physical activity now.","meaning":"Boolean indicating whether the patient has been cleared by their provider to engage in moderate intensity physical activity now."} ;; "cleared by provider to engage in moderate intensity physical activity"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_been_cleared_by_provider_to_engage_in_physical_activity_now@@low_intensity
         patient_has_been_cleared_by_provider_to_engage_in_physical_activity_now)
     :named REQ4_AUXILIARY0)) ;; "cleared by provider to engage in low intensity physical activity" implies "cleared by provider to engage in physical activity"

(assert
  (! (=> patient_has_been_cleared_by_provider_to_engage_in_physical_activity_now@@moderate_intensity
         patient_has_been_cleared_by_provider_to_engage_in_physical_activity_now)
     :named REQ4_AUXILIARY1)) ;; "cleared by provider to engage in moderate intensity physical activity" implies "cleared by provider to engage in physical activity"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Patient must have been cleared by provider to engage in low OR moderate intensity physical activity
(assert
  (! (or patient_has_been_cleared_by_provider_to_engage_in_physical_activity_now@@low_intensity
         patient_has_been_cleared_by_provider_to_engage_in_physical_activity_now@@moderate_intensity)
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have been cleared by the provider of the patient to (engage in low intensity physical activity OR engage in moderate intensity physical activity)."
