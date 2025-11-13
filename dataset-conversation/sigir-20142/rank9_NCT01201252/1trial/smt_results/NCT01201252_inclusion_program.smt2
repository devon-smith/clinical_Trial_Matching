;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female, other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} // "be male"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male, other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} // "be female"
(declare-const patient_age_value_recorded_at_time_of_admission_to_study_hospital_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's age in years at the time of admission to the study hospital if it is known and documented.","when_to_set_to_null":"Set to null if the patient's age in years at the time of admission to the study hospital is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's age in years at the time of admission to the study hospital."} // "be less than 5 years of age at the time of admission to the study hospital for acute gastroenteritis"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must (be male OR be female)."

(assert
  (! (< patient_age_value_recorded_at_time_of_admission_to_study_hospital_in_years 5)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be less than 5 years of age at the time of admission to the study hospital for acute gastroenteritis."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const written_informed_consent_obtained_from_parent Bool) ;; {"when_to_set_to_true":"Set to true if written informed consent has been obtained from the parent of the patient.","when_to_set_to_false":"Set to false if written informed consent has not been obtained from the parent of the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether written informed consent has been obtained from the parent of the patient.","meaning":"Boolean indicating whether written informed consent has been obtained from the parent of the patient."} // "written informed consent obtained from the parent of the patient"
(declare-const written_informed_consent_obtained_from_guardian Bool) ;; {"when_to_set_to_true":"Set to true if written informed consent has been obtained from the guardian of the patient.","when_to_set_to_false":"Set to false if written informed consent has not been obtained from the guardian of the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether written informed consent has been obtained from the guardian of the patient.","meaning":"Boolean indicating whether written informed consent has been obtained from the guardian of the patient."} // "written informed consent obtained from the guardian of the patient"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (or written_informed_consent_obtained_from_parent
         written_informed_consent_obtained_from_guardian)
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have (written informed consent obtained from the parent of the patient OR written informed consent obtained from the guardian of the patient)"
