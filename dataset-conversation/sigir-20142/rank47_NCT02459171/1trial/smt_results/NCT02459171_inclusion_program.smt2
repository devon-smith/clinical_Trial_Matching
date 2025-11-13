;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_exposed_to_poultry_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to poultry.","when_to_set_to_false":"Set to false if the patient is currently not exposed to poultry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to poultry.","meaning":"Boolean indicating whether the patient is currently exposed to poultry."}  // "poultry-exposed individual"
(declare-const patient_is_exposed_to_poultry_now@@located_in_household Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to poultry and the poultry is located in the patient's household.","when_to_set_to_false":"Set to false if the patient is currently exposed to poultry but the poultry is not located in the patient's household.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the poultry is located in the patient's household.","meaning":"Boolean indicating whether the patient is currently exposed to poultry and the poultry is located in the patient's household."}  // "with poultry in the household"
(declare-const patient_has_signed_consent_form_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed a consent form at the current time.","when_to_set_to_false":"Set to false if the patient has not signed a consent form at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed a consent form at the current time.","meaning":"Boolean indicating whether the patient has signed a consent form at the current time."}  // "signing a consent form"
(declare-const patient_has_signed_assent_form_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed an assent form at the current time.","when_to_set_to_false":"Set to false if the patient has not signed an assent form at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed an assent form at the current time.","meaning":"Boolean indicating whether the patient has signed an assent form at the current time."}  // "signing an assent form"
(declare-const patient_has_signed_assent_form_now@@as_appropriate_for_age Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed an assent form at the current time and the signing is appropriate for the patient's age.","when_to_set_to_false":"Set to false if the patient has signed an assent form at the current time but the signing is not appropriate for the patient's age.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the signing of the assent form is appropriate for the patient's age.","meaning":"Boolean indicating whether the patient has signed an assent form at the current time and the signing is appropriate for the patient's age."}  // "signing an assent form as appropriate for age"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  // "as appropriate for age"
(declare-const patient_has_completed_study_questionnaire_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has completed the study questionnaire at the current time.","when_to_set_to_false":"Set to false if the patient has not completed the study questionnaire at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has completed the study questionnaire at the current time.","meaning":"Boolean indicating whether the patient has completed the study questionnaire at the current time."}  // "completing the study questionnaire"
(declare-const patient_permits_withdrawal_of_blood_sample_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient permits the withdrawal of a blood sample at the current time.","when_to_set_to_false":"Set to false if the patient does not permit the withdrawal of a blood sample at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient permits the withdrawal of a blood sample at the current time.","meaning":"Boolean indicating whether the patient permits the withdrawal of a blood sample at the current time."}  // "permitting the withdrawal of a blood sample"
(declare-const patient_permits_withdrawal_of_nasal_wash_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient permits the withdrawal of a nasal wash at the current time.","when_to_set_to_false":"Set to false if the patient does not permit the withdrawal of a nasal wash at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient permits the withdrawal of a nasal wash at the current time.","meaning":"Boolean indicating whether the patient permits the withdrawal of a nasal wash at the current time."}  // "permitting the withdrawal of a nasal wash"
(declare-const patient_permits_withdrawal_of_nasal_swab_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient permits the withdrawal of a nasal swab at the current time.","when_to_set_to_false":"Set to false if the patient does not permit the withdrawal of a nasal swab at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient permits the withdrawal of a nasal swab at the current time.","meaning":"Boolean indicating whether the patient permits the withdrawal of a nasal swab at the current time."}  // "permitting the withdrawal of a nasal swab"
(declare-const patient_permits_withdrawal_of_throat_swab_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient permits the withdrawal of a throat swab at the current time.","when_to_set_to_false":"Set to false if the patient does not permit the withdrawal of a throat swab at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient permits the withdrawal of a throat swab at the current time.","meaning":"Boolean indicating whether the patient permits the withdrawal of a throat swab at the current time."}  // "permitting the withdrawal of a throat swab"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_is_exposed_to_poultry_now@@located_in_household
         patient_is_exposed_to_poultry_now)
     :named REQ0_AUXILIARY0)) ;; "with poultry in the household"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_signed_assent_form_now@@as_appropriate_for_age
         patient_has_signed_assent_form_now)
     :named REQ0_AUXILIARY1)) ;; "signing an assent form as appropriate for age"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: poultry-exposed individual with poultry in the household
(assert
  (! patient_is_exposed_to_poultry_now@@located_in_household
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "poultry-exposed individual with poultry in the household"

;; Component 1: willing to participate by signing a consent form or signing an assent form as appropriate for age
(assert
  (! (or patient_has_signed_consent_form_now
         patient_has_signed_assent_form_now@@as_appropriate_for_age)
     :named REQ0_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "signing a consent form or signing an assent form as appropriate for age"

;; Component 2: willing to complete the study questionnaire
(assert
  (! patient_has_completed_study_questionnaire_now
     :named REQ0_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "completing the study questionnaire"

;; Component 3: permitting the withdrawal of a blood sample
(assert
  (! patient_permits_withdrawal_of_blood_sample_now
     :named REQ0_COMPONENT3_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "permitting the withdrawal of a blood sample"

;; Component 4: permitting the withdrawal of a nasal wash
(assert
  (! patient_permits_withdrawal_of_nasal_wash_now
     :named REQ0_COMPONENT4_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "permitting the withdrawal of a nasal wash"

;; Component 5: permitting the withdrawal of a nasal swab
(assert
  (! patient_permits_withdrawal_of_nasal_swab_now
     :named REQ0_COMPONENT5_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "permitting the withdrawal of a nasal swab"

;; Component 6: permitting the withdrawal of a throat swab
(assert
  (! patient_permits_withdrawal_of_throat_swab_now
     :named REQ0_COMPONENT6_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "permitting the withdrawal of a throat swab"
