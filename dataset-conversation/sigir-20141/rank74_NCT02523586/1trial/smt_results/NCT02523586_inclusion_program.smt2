;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "age ≥ 18 years AND age ≤ 70 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be age ≥ 18 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be age ≥ 18 years."

;; Component 1: To be included, the patient must be age ≤ 70 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 70)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be age ≤ 70 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female as currently recorded."}  ;; "female volunteer"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is male as currently recorded."}  ;; "male volunteer"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (or patient_sex_is_female_now
         patient_sex_is_male_now)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (a male volunteer OR a female volunteer)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_asa_physical_status_i_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ASA physical status I.","when_to_set_to_false":"Set to false if the patient currently does not have ASA physical status I.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ASA physical status I.","meaning":"Boolean indicating whether the patient currently has ASA physical status I."}  ;; "American Society of Anesthesiologists physical status I"
(declare-const patient_has_asa_physical_status_ii_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ASA physical status II.","when_to_set_to_false":"Set to false if the patient currently does not have ASA physical status II.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ASA physical status II.","meaning":"Boolean indicating whether the patient currently has ASA physical status II."}  ;; "American Society of Anesthesiologists physical status II"
(declare-const patient_has_asa_physical_status_iii_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ASA physical status III.","when_to_set_to_false":"Set to false if the patient currently does not have ASA physical status III.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ASA physical status III.","meaning":"Boolean indicating whether the patient currently has ASA physical status III."}  ;; "American Society of Anesthesiologists physical status III"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (or patient_has_asa_physical_status_i_now
         patient_has_asa_physical_status_ii_now
         patient_has_asa_physical_status_iii_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (American Society of Anesthesiologists physical status I OR American Society of Anesthesiologists physical status II OR American Society of Anesthesiologists physical status III)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_capable_of_providing_written_informed_consent_in_english_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently capable of providing written informed consent in English.","when_to_set_to_false":"Set to false if the patient is currently not capable of providing written informed consent in English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently capable of providing written informed consent in English.","meaning":"Boolean indicating whether the patient is currently capable of providing written informed consent in English."}  ;; "capable of providing written informed consent in English"
(declare-const patient_is_willing_to_provide_written_informed_consent_in_english_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently willing to provide written informed consent in English.","when_to_set_to_false":"Set to false if the patient is currently not willing to provide written informed consent in English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently willing to provide written informed consent in English.","meaning":"Boolean indicating whether the patient is currently willing to provide written informed consent in English."}  ;; "willing to provide written informed consent in English"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_is_capable_of_providing_written_informed_consent_in_english_now
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "capable of providing written informed consent in English"

(assert
  (! patient_is_willing_to_provide_written_informed_consent_in_english_now
     :named REQ3_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "willing to provide written informed consent in English"
