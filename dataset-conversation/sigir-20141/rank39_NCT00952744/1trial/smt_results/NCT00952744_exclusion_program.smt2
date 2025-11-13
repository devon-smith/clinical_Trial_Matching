;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_unable_to_provide_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to provide consent.","when_to_set_to_false":"Set to false if the patient is currently able to provide consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to provide consent.","meaning":"Boolean indicating whether the patient is currently unable to provide consent."} ;; "the patient is unable to provide consent"
(declare-const patient_is_unable_to_understand_consent_form_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to understand the consent form.","when_to_set_to_false":"Set to false if the patient is currently able to understand the consent form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to understand the consent form.","meaning":"Boolean indicating whether the patient is currently unable to understand the consent form."} ;; "the patient is unable to understand the consent form"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_unable_to_provide_consent_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to provide consent."

(assert
(! (not patient_is_unable_to_understand_consent_form_now)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to understand the consent form."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_acute_coronary_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acute coronary syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute coronary syndrome.","meaning":"Boolean indicating whether the patient currently has acute coronary syndrome."} ;; "acute coronary syndrome"
(declare-const patient_has_finding_of_crushing_injury_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a crushing injury.","when_to_set_to_false":"Set to false if the patient currently does not have a crushing injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a crushing injury.","meaning":"Boolean indicating whether the patient currently has a crushing injury."} ;; "crush injury"
(declare-const patient_has_finding_of_penetrating_wound_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a penetrating wound.","when_to_set_to_false":"Set to false if the patient currently does not have a penetrating wound.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a penetrating wound.","meaning":"Boolean indicating whether the patient currently has a penetrating wound."} ;; "penetrating wound"
(declare-const patient_has_symptoms_of_acute_coronary_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of acute coronary syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of acute coronary syndrome.","meaning":"Boolean indicating whether the patient currently has symptoms of acute coronary syndrome."} ;; "acute coronary syndrome"
(declare-const patient_has_symptoms_of_acute_coronary_syndrome_now_clearly_not_result_of_acute_coronary_syndrome Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms that are clearly not the result of acute coronary syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms that are clearly not the result of acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current symptoms are clearly not the result of acute coronary syndrome.","meaning":"Boolean indicating whether the patient currently has symptoms that are clearly not the result of acute coronary syndrome."} ;; "acute coronary syndrome symptoms are clearly not the result of acute coronary syndrome"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_penetrating_wound_now
          patient_has_finding_of_crushing_injury_now)
patient_has_symptoms_of_acute_coronary_syndrome_now_clearly_not_result_of_acute_coronary_syndrome)
:named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples (penetrating wound, crush injury)"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_symptoms_of_acute_coronary_syndrome_now_clearly_not_result_of_acute_coronary_syndrome)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient's acute coronary syndrome symptoms are clearly not the result of acute coronary syndrome with non-exhaustive examples (penetrating wound, crush injury)."
