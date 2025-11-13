;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_provided_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided informed consent.","when_to_set_to_false":"Set to false if the patient has not provided informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided informed consent.","meaning":"Boolean indicating whether the patient has provided informed consent."} // "To be included, the patient must provide informed consent."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_provided_informed_consent
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must provide informed consent."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged 18 years or more"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} // "the patient must be female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} // "the patient must be male"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must be male or female and aged 18 years or more.
(assert
  (! (and (or patient_sex_is_male_now patient_sex_is_female_now)
          (>= patient_age_value_recorded_now_in_years 18))
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male or female and aged 18 years or more."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has malignant neoplastic disease (cancer).","when_to_set_to_false":"Set to false if the patient currently does not have malignant neoplastic disease (cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient currently has malignant neoplastic disease (cancer)."} // "cancer disease"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now@@ongoing Bool) ;; {"when_to_set_to_true":"Set to true if the patient's malignant neoplastic disease (cancer) is ongoing (active, not resolved) at the present time.","when_to_set_to_false":"Set to false if the patient's malignant neoplastic disease (cancer) is not ongoing (resolved, in remission, or inactive) at the present time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's malignant neoplastic disease (cancer) is ongoing at the present time.","meaning":"Boolean indicating whether the patient's malignant neoplastic disease (cancer) is ongoing (active) at the present time."} // "ongoing cancer disease"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies the stem variable (if ongoing, then must have cancer)
(assert
  (! (=> patient_has_finding_of_malignant_neoplastic_disease_now@@ongoing
         patient_has_finding_of_malignant_neoplastic_disease_now)
     :named REQ2_AUXILIARY0)) ;; "ongoing cancer disease" implies "cancer disease"

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must have ongoing cancer disease
(assert
  (! patient_has_finding_of_malignant_neoplastic_disease_now@@ongoing
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have ongoing cancer disease."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_thromboembolism_of_vein_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of venous thromboembolism.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of venous thromboembolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of venous thromboembolism.","meaning":"Boolean indicating whether the patient currently has a diagnosis of venous thromboembolism."} // "venous thromboembolism"
(declare-const patient_has_diagnosis_of_thromboembolism_of_vein_recently Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of venous thromboembolism that is considered recent according to clinical documentation or study protocol.","when_to_set_to_false":"Set to false if the patient does not have a recent diagnosis of venous thromboembolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a recent diagnosis of venous thromboembolism.","meaning":"Boolean indicating whether the patient has a recent diagnosis of venous thromboembolism."} // "recent diagnosis of venous thromboembolism"
(declare-const time_since_most_recent_diagnosis_of_thromboembolism_of_vein_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days since the patient's most recent diagnosis of venous thromboembolism.","when_to_set_to_null":"Set to null if the date of the most recent diagnosis of venous thromboembolism is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of days since the patient's most recent diagnosis of venous thromboembolism."} // "recent diagnosis of venous thromboembolism"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable for "recent" diagnosis implies diagnosis now
(assert
  (! (=> patient_has_diagnosis_of_thromboembolism_of_vein_recently
         patient_has_diagnosis_of_thromboembolism_of_vein_now)
     :named REQ3_AUXILIARY0)) ;; "recent diagnosis of venous thromboembolism" implies "diagnosis of venous thromboembolism"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_diagnosis_of_thromboembolism_of_vein_recently
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a recent diagnosis of venous thromboembolism."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_undergone_low_molecular_weight_heparin_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone low molecular weight heparin therapy at any time in the past (prior to now).","when_to_set_to_false":"Set to false if the patient has never undergone low molecular weight heparin therapy at any time in the past (prior to now).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone low molecular weight heparin therapy in the past.","meaning":"Boolean indicating whether the patient has ever undergone low molecular weight heparin therapy in the past."} // "treatment with low molecular weight heparin"
(declare-const patient_has_undergone_low_molecular_weight_heparin_therapy_inthehistory@@temporalcontext_before_entry_into_the_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's low molecular weight heparin therapy occurred before entry into the study.","when_to_set_to_false":"Set to false if the patient's low molecular weight heparin therapy did not occur before entry into the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's low molecular weight heparin therapy occurred before entry into the study.","meaning":"Boolean indicating whether the patient's low molecular weight heparin therapy occurred before entry into the study."} // "before entry into the study"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_undergone_low_molecular_weight_heparin_therapy_inthehistory@@temporalcontext_before_entry_into_the_study
         patient_has_undergone_low_molecular_weight_heparin_therapy_inthehistory)
     :named REQ4_AUXILIARY0)) ;; "before entry into the study" is a subset of "ever undergone low molecular weight heparin therapy"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_undergone_low_molecular_weight_heparin_therapy_inthehistory@@temporalcontext_before_entry_into_the_study
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have received treatment with low molecular weight heparin before entry into the study"
