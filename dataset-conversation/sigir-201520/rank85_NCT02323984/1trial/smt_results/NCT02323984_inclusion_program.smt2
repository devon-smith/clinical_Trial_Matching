;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is male at the current time."} // "must be male"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."} // "must be female"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "must be between 30 years of age and 80 years of age"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male or female."

(assert
  (! (and (>= patient_age_value_recorded_now_in_years 30)
          (<= patient_age_value_recorded_now_in_years 80))
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be between 30 years of age and 80 years of age."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_american_society_of_anesthesiologists_physical_status_class_1_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has American Society of Anesthesiologists physical status class I.","when_to_set_to_false":"Set to false if the patient currently does not have American Society of Anesthesiologists physical status class I.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has American Society of Anesthesiologists physical status class I.","meaning":"Boolean indicating whether the patient currently has American Society of Anesthesiologists physical status class I."} // "American Society of Anesthesiologists physical status class I"
(declare-const patient_has_finding_of_american_society_of_anesthesiologists_physical_status_class_2_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has American Society of Anesthesiologists physical status class II.","when_to_set_to_false":"Set to false if the patient currently does not have American Society of Anesthesiologists physical status class II.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has American Society of Anesthesiologists physical status class II.","meaning":"Boolean indicating whether the patient currently has American Society of Anesthesiologists physical status class II."} // "American Society of Anesthesiologists physical status class II"
(declare-const patient_has_finding_of_american_society_of_anesthesiologists_physical_status_class_3_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has American Society of Anesthesiologists physical status class III.","when_to_set_to_false":"Set to false if the patient currently does not have American Society of Anesthesiologists physical status class III.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has American Society of Anesthesiologists physical status class III.","meaning":"Boolean indicating whether the patient currently has American Society of Anesthesiologists physical status class III."} // "American Society of Anesthesiologists physical status class III"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have American Society of Anesthesiologists physical status class I or II or III.
(assert
  (! (or patient_has_finding_of_american_society_of_anesthesiologists_physical_status_class_1_now
         patient_has_finding_of_american_society_of_anesthesiologists_physical_status_class_2_now
         patient_has_finding_of_american_society_of_anesthesiologists_physical_status_class_3_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have American Society of Anesthesiologists physical status class I or have American Society of Anesthesiologists physical status class II or have American Society of Anesthesiologists physical status class III."

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_is_capable_of_providing_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently capable of providing consent.","when_to_set_to_false":"Set to false if the patient is currently not capable of providing consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently capable of providing consent.","meaning":"Boolean indicating whether the patient is currently capable of providing consent."} // "the patient must be capable of providing consent"
(declare-const patient_is_willing_to_provide_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently willing to provide consent.","when_to_set_to_false":"Set to false if the patient is currently not willing to provide consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently willing to provide consent.","meaning":"Boolean indicating whether the patient is currently willing to provide consent."} // "the patient must be willing to provide consent"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: The patient must be capable of providing consent.
(assert
  (! patient_is_capable_of_providing_consent_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be capable of providing consent."

;; Component 1: The patient must be willing to provide consent.
(assert
  (! patient_is_willing_to_provide_consent_now
     :named REQ2_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be willing to provide consent."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_literacy_in_english_language Bool) ;; {"when_to_set_to_true":"Set to true if the patient has literacy in the English language.","when_to_set_to_false":"Set to false if the patient does not have literacy in the English language.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has literacy in the English language.","meaning":"Boolean indicating whether the patient has literacy in the English language."} // "the patient must have literacy in English language"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_literacy_in_english_language
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must have literacy in English language"
