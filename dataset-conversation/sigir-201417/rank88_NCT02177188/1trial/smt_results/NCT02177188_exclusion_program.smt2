;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "younger than eighteen years old"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 18))
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is younger than eighteen years old."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_taking_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not taking any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any drug or medicament.","meaning":"Boolean indicating whether the patient is currently taking any drug or medicament."} ;; "the patient is taking any drug"
(declare-const patient_has_diagnosis_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease diagnosed.","when_to_set_to_false":"Set to false if the patient currently does not have any disease diagnosed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease diagnosed.","meaning":"Boolean indicating whether the patient currently has any disease diagnosed."} ;; "the patient has any disease"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT be taking any drug OR have any disease
(assert
(! (not (or patient_is_taking_drug_or_medicament_now
            patient_has_diagnosis_of_disease_now))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is taking any drug) OR (the patient has any disease)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_taken_autonomic_agent_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any autonomic agent (drug with action on the autonomic nervous system) during the previous twenty-four hours.","when_to_set_to_false":"Set to false if the patient has not taken any autonomic agent (drug with action on the autonomic nervous system) during the previous twenty-four hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any autonomic agent (drug with action on the autonomic nervous system) during the previous twenty-four hours.","meaning":"Boolean indicating whether the patient has taken any autonomic agent (drug with action on the autonomic nervous system) during the previous twenty-four hours."} ;; "drug with action on the autonomic nervous system during the previous twenty-four hours"
(declare-const patient_is_exposed_to_autonomic_agent_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any autonomic agent (substance with action on the autonomic nervous system) during the previous twenty-four hours.","when_to_set_to_false":"Set to false if the patient has not been exposed to any autonomic agent (substance with action on the autonomic nervous system) during the previous twenty-four hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any autonomic agent (substance with action on the autonomic nervous system) during the previous twenty-four hours.","meaning":"Boolean indicating whether the patient has been exposed to any autonomic agent (substance with action on the autonomic nervous system) during the previous twenty-four hours."} ;; "substance with action on the autonomic nervous system during the previous twenty-four hours"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_taken_autonomic_agent_inthepast24hours)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has taken any drug with action on the autonomic nervous system during the previous twenty-four hours."

(assert
(! (not patient_is_exposed_to_autonomic_agent_inthepast24hours)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has taken any substance with action on the autonomic nervous system during the previous twenty-four hours."
