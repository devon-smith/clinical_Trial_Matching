;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_acute_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of acute myocardial infarction.","meaning":"Boolean indicating whether the patient currently has acute myocardial infarction."} // "To be included, the patient must have acute myocardial infarction."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_acute_myocardial_infarction_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have acute myocardial infarction."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_acute_coronary_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute coronary syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute coronary syndrome.","meaning":"Boolean indicating whether the patient currently has acute coronary syndrome."} // "To be included, the patient must have acute coronary syndrome."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_acute_coronary_syndrome_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have acute coronary syndrome."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_preinfarction_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of unstable angina (preinfarction syndrome).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of unstable angina (preinfarction syndrome).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has unstable angina (preinfarction syndrome).","meaning":"Boolean indicating whether the patient currently has unstable angina (preinfarction syndrome)."} // "To be included, the patient must have unstable angina."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_preinfarction_syndrome_now
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have unstable angina."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient is currently female."} // "To be included, the patient must be male or female."
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient is documented as not male at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient is currently male."} // "To be included, the patient must be male or female."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (or patient_sex_is_female_now
         patient_sex_is_male_now)
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male or female."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_ethnicity_value_recorded Real) ;; {"when_to_set_to_value":"Set to the categorical value that represents the patient's ethnicity as documented in the medical record (e.g., Hispanic or Latino, Not Hispanic or Latino, etc.).","when_to_set_to_null":"Set to null if the patient's ethnicity is unknown, not documented, or cannot be determined.","meaning":"The categorical value representing the patient's ethnicity as recorded in the medical record."} // "To be included, the patient must be of any race or ethnicity."
(declare-const patient_race_value_recorded Real) ;; {"when_to_set_to_value":"Set to the categorical value that represents the patient's race as documented in the medical record (e.g., White, Black or African American, Asian, etc.).","when_to_set_to_null":"Set to null if the patient's race is unknown, not documented, or cannot be determined.","meaning":"The categorical value representing the patient's race as recorded in the medical record."} // "To be included, the patient must be of any race or ethnicity."

;; ===================== Constraint Assertions (REQ 4) =====================
;; The requirement is always satisfiable for any patient, regardless of race or ethnicity.
(assert
  (! true
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be of any race or ethnicity."
