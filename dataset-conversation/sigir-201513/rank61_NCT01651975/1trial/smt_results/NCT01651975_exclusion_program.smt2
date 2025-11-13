;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "younger than eighteen years of age"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 18))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is younger than eighteen years of age."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_pregnant_now)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_prisoner_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a prisoner.","when_to_set_to_false":"Set to false if the patient is currently not a prisoner.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a prisoner.","meaning":"Boolean indicating whether the patient is currently a prisoner."} ;; "the patient is a prisoner"
(declare-const patient_is_institutionalized_individual_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently an institutionalized individual.","when_to_set_to_false":"Set to false if the patient is currently not an institutionalized individual.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an institutionalized individual.","meaning":"Boolean indicating whether the patient is currently an institutionalized individual."} ;; "the patient is an institutionalized individual"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_prisoner_now)
:named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is a prisoner."

(assert
(! (not patient_is_institutionalized_individual_now)
:named REQ2_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is an institutionalized individual."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_impaired_cognition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of impaired cognition (cognitive disability).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of impaired cognition (cognitive disability).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has impaired cognition (cognitive disability).","meaning":"Boolean indicating whether the patient currently has impaired cognition (cognitive disability)."} ;; "cognitive disability"

(declare-const patient_has_finding_of_impaired_cognition_now@@precludes_ability_to_provide_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's impaired cognition precludes the ability to provide informed consent.","when_to_set_to_false":"Set to false if the patient's impaired cognition does not preclude the ability to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether impaired cognition precludes the ability to provide informed consent.","meaning":"Boolean indicating whether the patient's impaired cognition precludes the ability to provide informed consent."} ;; "precludes the ability to provide informed consent"

(declare-const patient_has_finding_of_impaired_cognition_now@@precludes_ability_to_complete_comprehensive_swallow_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's impaired cognition precludes the ability to complete a comprehensive swallow study.","when_to_set_to_false":"Set to false if the patient's impaired cognition does not preclude the ability to complete a comprehensive swallow study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether impaired cognition precludes the ability to complete a comprehensive swallow study.","meaning":"Boolean indicating whether the patient's impaired cognition precludes the ability to complete a comprehensive swallow study."} ;; "precludes the ability to complete a comprehensive swallow study"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_impaired_cognition_now@@precludes_ability_to_provide_informed_consent
      patient_has_finding_of_impaired_cognition_now)
:named REQ3_AUXILIARY0)) ;; "precludes the ability to provide informed consent"

(assert
(! (=> patient_has_finding_of_impaired_cognition_now@@precludes_ability_to_complete_comprehensive_swallow_study
      patient_has_finding_of_impaired_cognition_now)
:named REQ3_AUXILIARY1)) ;; "precludes the ability to complete a comprehensive swallow study"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_impaired_cognition_now@@precludes_ability_to_provide_informed_consent)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a cognitive disability that precludes the ability to provide informed consent."

(assert
(! (not patient_has_finding_of_impaired_cognition_now@@precludes_ability_to_complete_comprehensive_swallow_study)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a cognitive disability that precludes the ability to complete a comprehensive swallow study."
