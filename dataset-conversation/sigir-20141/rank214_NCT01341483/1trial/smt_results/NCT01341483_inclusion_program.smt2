;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_undergoing_coronary_angiography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing coronary angiography.","when_to_set_to_false":"Set to false if the patient is not currently undergoing coronary angiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing coronary angiography.","meaning":"Boolean indicating whether the patient is currently undergoing coronary angiography."} // "undergoing coronary angiography"
(declare-const patient_is_undergoing_coronary_angiography_now@@for_suspected_coronary_atherosclerotic_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing coronary angiography specifically for suspected coronary atherosclerotic disease.","when_to_set_to_false":"Set to false if the patient is currently undergoing coronary angiography but not for suspected coronary atherosclerotic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure is for suspected coronary atherosclerotic disease.","meaning":"Boolean indicating whether the coronary angiography is being performed for suspected coronary atherosclerotic disease."} // "undergoing coronary angiography for suspected coronary atherosclerotic disease"
(declare-const patient_is_undergoing_coronary_angiography_now@@for_known_coronary_atherosclerotic_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing coronary angiography specifically for known coronary atherosclerotic disease.","when_to_set_to_false":"Set to false if the patient is currently undergoing coronary angiography but not for known coronary atherosclerotic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure is for known coronary atherosclerotic disease.","meaning":"Boolean indicating whether the coronary angiography is being performed for known coronary atherosclerotic disease."} // "undergoing coronary angiography for known coronary atherosclerotic disease"
(declare-const patient_is_undergoing_peripheral_angiography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing peripheral angiography.","when_to_set_to_false":"Set to false if the patient is not currently undergoing peripheral angiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing peripheral angiography.","meaning":"Boolean indicating whether the patient is currently undergoing peripheral angiography."} // "undergoing peripheral angiography"
(declare-const patient_is_undergoing_peripheral_angiography_now@@for_suspected_peripheral_atherosclerotic_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing peripheral angiography specifically for suspected peripheral atherosclerotic disease.","when_to_set_to_false":"Set to false if the patient is currently undergoing peripheral angiography but not for suspected peripheral atherosclerotic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure is for suspected peripheral atherosclerotic disease.","meaning":"Boolean indicating whether the peripheral angiography is being performed for suspected peripheral atherosclerotic disease."} // "undergoing peripheral angiography for suspected peripheral atherosclerotic disease"
(declare-const patient_is_undergoing_peripheral_angiography_now@@for_known_peripheral_atherosclerotic_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing peripheral angiography specifically for known peripheral atherosclerotic disease.","when_to_set_to_false":"Set to false if the patient is currently undergoing peripheral angiography but not for known peripheral atherosclerotic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure is for known peripheral atherosclerotic disease.","meaning":"Boolean indicating whether the peripheral angiography is being performed for known peripheral atherosclerotic disease."} // "undergoing peripheral angiography for known peripheral atherosclerotic disease"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_is_undergoing_coronary_angiography_now@@for_suspected_coronary_atherosclerotic_disease
         patient_is_undergoing_coronary_angiography_now)
     :named REQ0_AUXILIARY0)) ;; "undergoing coronary angiography for suspected coronary atherosclerotic disease" implies "undergoing coronary angiography"

(assert
  (! (=> patient_is_undergoing_coronary_angiography_now@@for_known_coronary_atherosclerotic_disease
         patient_is_undergoing_coronary_angiography_now)
     :named REQ0_AUXILIARY1)) ;; "undergoing coronary angiography for known coronary atherosclerotic disease" implies "undergoing coronary angiography"

(assert
  (! (=> patient_is_undergoing_peripheral_angiography_now@@for_suspected_peripheral_atherosclerotic_disease
         patient_is_undergoing_peripheral_angiography_now)
     :named REQ0_AUXILIARY2)) ;; "undergoing peripheral angiography for suspected peripheral atherosclerotic disease" implies "undergoing peripheral angiography"

(assert
  (! (=> patient_is_undergoing_peripheral_angiography_now@@for_known_peripheral_atherosclerotic_disease
         patient_is_undergoing_peripheral_angiography_now)
     :named REQ0_AUXILIARY3)) ;; "undergoing peripheral angiography for known peripheral atherosclerotic disease" implies "undergoing peripheral angiography"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_is_undergoing_coronary_angiography_now@@for_suspected_coronary_atherosclerotic_disease
         patient_is_undergoing_peripheral_angiography_now@@for_suspected_peripheral_atherosclerotic_disease
         patient_is_undergoing_coronary_angiography_now@@for_known_coronary_atherosclerotic_disease
         patient_is_undergoing_peripheral_angiography_now@@for_known_peripheral_atherosclerotic_disease)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be ((undergoing coronary angiography for suspected coronary atherosclerotic disease) OR (undergoing peripheral angiography for suspected peripheral atherosclerotic disease) OR (undergoing coronary angiography for known coronary atherosclerotic disease) OR (undergoing peripheral angiography for known peripheral atherosclerotic disease))."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male (e.g., female or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is male as currently recorded."} // "male"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged greater than or equal to 35 years old AND aged less than or equal to 70 years old"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must be male.
(assert
  (! patient_sex_is_male_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male."

;; Component 1: To be included, the patient must be aged greater than or equal to 35 years old.
(assert
  (! (>= patient_age_value_recorded_now_in_years 35)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged greater than or equal to 35 years old."

;; Component 2: To be included, the patient must be aged less than or equal to 70 years old.
(assert
  (! (<= patient_age_value_recorded_now_in_years 70)
     :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged less than or equal to 70 years old."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_provided_written_informed_consent_before_any_study_related_procedures Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent before any study-related procedures are performed.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent before any study-related procedures are performed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent before any study-related procedures are performed.","meaning":"Boolean indicating whether the patient has provided written informed consent before any study-related procedures are performed."} // "the patient must provide written informed consent before any study-related procedures are performed."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_provided_written_informed_consent_before_any_study_related_procedures
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must provide written informed consent before any study-related procedures are performed."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_agrees_to_comply_with_study_procedures Bool) ;; {"when_to_set_to_true":"Set to true if the patient has agreed to comply with all study procedures.","when_to_set_to_false":"Set to false if the patient has not agreed to comply with all study procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has agreed to comply with all study procedures.","meaning":"Boolean indicating whether the patient agrees to comply with all study procedures."} // "the patient must agree to comply with study procedures"
(declare-const patient_agrees_to_comply_with_follow_up_for_entire_length_of_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has agreed to comply with follow-up for the entire length of the study.","when_to_set_to_false":"Set to false if the patient has not agreed to comply with follow-up for the entire length of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has agreed to comply with follow-up for the entire length of the study.","meaning":"Boolean indicating whether the patient agrees to comply with follow-up for the entire length of the study."} // "the patient must agree to comply with follow-up for the entire length of the study"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_agrees_to_comply_with_study_procedures
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must agree to comply with study procedures."

(assert
  (! patient_agrees_to_comply_with_follow_up_for_entire_length_of_study
     :named REQ3_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must agree to comply with follow-up for the entire length of the study."
