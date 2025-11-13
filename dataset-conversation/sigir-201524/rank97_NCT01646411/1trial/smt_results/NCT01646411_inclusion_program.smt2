;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_acute_infectious_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute infectious disease (acute infection).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute infectious disease (acute infection).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute infectious disease (acute infection).","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute infectious disease (acute infection)."}

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_acute_infectious_disease_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a current acute infection."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged 18-70"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged 18 or older."

(assert
  (! (<= patient_age_value_recorded_now_in_years 70)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged 70 or younger."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} // "To be included, the patient must be male or female."
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} // "To be included, the patient must be male or female."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (or patient_sex_is_female_now
         patient_sex_is_male_now)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male or female."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_race_value_recorded_now String) ;; {"when_to_set_to_value":"Set to the patient's race value as recorded in the medical record at the current time.","when_to_set_to_null":"Set to null if the patient's race is unknown, not documented, or cannot be determined.","meaning":"String or coded value representing the patient's race as recorded now."} // "To be included, the patient must be of any race."

;; ===================== Constraint Assertions (REQ 3) =====================
;; No restriction on race; always satisfiable for any value (including null)
(assert
  (! true
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be of any race."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_active_symptoms_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms that are active and present.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms that are active and present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms that are active and present.","meaning":"Boolean indicating whether the patient currently has symptoms that are active and present."} // "To be included, the patient must have currently active symptoms."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_active_symptoms_now
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have currently active symptoms."
