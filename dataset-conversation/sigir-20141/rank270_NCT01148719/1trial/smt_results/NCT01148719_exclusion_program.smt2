;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_inthepast1years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of chronic obstructive pulmonary disease made within the past 1 year.","when_to_set_to_false":"Set to false if the patient does not have a diagnosis of chronic obstructive pulmonary disease made within the past 1 year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a diagnosis of chronic obstructive pulmonary disease made within the past 1 year.","meaning":"Boolean indicating whether the patient has a diagnosis of chronic obstructive pulmonary disease made within the past 1 year."} ;; "chronic obstructive pulmonary disease (diagnosed by spirometry performed within the last 1 year)"

(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_inthepast1years@@diagnosed_by_spirometry Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of chronic obstructive pulmonary disease within the past 1 year was made by spirometry.","when_to_set_to_false":"Set to false if the patient's diagnosis of chronic obstructive pulmonary disease within the past 1 year was not made by spirometry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether spirometry was used to diagnose chronic obstructive pulmonary disease within the past 1 year.","meaning":"Boolean indicating whether the patient's diagnosis of chronic obstructive pulmonary disease within the past 1 year was made by spirometry."} ;; "diagnosed by spirometry performed within the last 1 year"

(declare-const patient_has_diagnosis_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of heart failure.","meaning":"Boolean indicating whether the patient currently has a diagnosis of heart failure."} ;; "confirmed heart failure"

(declare-const patient_has_diagnosis_of_heart_failure_now@@diagnosed_by_echocardiography Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of heart failure was made by echocardiography.","when_to_set_to_false":"Set to false if the patient's current diagnosis of heart failure was not made by echocardiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether echocardiography was used to diagnose heart failure.","meaning":"Boolean indicating whether the patient's current diagnosis of heart failure was made by echocardiography."} ;; "diagnosed by echocardiography"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable for COPD
(assert
(! (=> patient_has_diagnosis_of_chronic_obstructive_lung_disease_inthepast1years@@diagnosed_by_spirometry
      patient_has_diagnosis_of_chronic_obstructive_lung_disease_inthepast1years)
:named REQ0_AUXILIARY0)) ;; "diagnosed by spirometry performed within the last 1 year"

;; Qualifier variable implies corresponding stem variable for heart failure
(assert
(! (=> patient_has_diagnosis_of_heart_failure_now@@diagnosed_by_echocardiography
      patient_has_diagnosis_of_heart_failure_now)
:named REQ0_AUXILIARY1)) ;; "diagnosed by echocardiography"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have BOTH confirmed COPD (diagnosed by spirometry within 1 year) AND confirmed heart failure (diagnosed by echocardiography)
(assert
(! (not (and patient_has_diagnosis_of_chronic_obstructive_lung_disease_inthepast1years@@diagnosed_by_spirometry
             patient_has_diagnosis_of_heart_failure_now@@diagnosed_by_echocardiography))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has confirmed chronic obstructive pulmonary disease (diagnosed by spirometry performed within the last 1 year)) AND (the patient has confirmed heart failure (diagnosed by echocardiography))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_able_to_sign_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to sign informed consent.","when_to_set_to_false":"Set to false if the patient is currently unable to sign informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to sign informed consent.","meaning":"Boolean indicating whether the patient is currently able to sign informed consent."} ;; "the patient is unable to sign informed consent"
(declare-const patient_is_willing_to_sign_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently willing to sign informed consent.","when_to_set_to_false":"Set to false if the patient is currently unwilling to sign informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently willing to sign informed consent.","meaning":"Boolean indicating whether the patient is currently willing to sign informed consent."} ;; "the patient is unwilling to sign informed consent"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (not patient_is_able_to_sign_informed_consent_now))
    :named REQ1_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to sign informed consent."

(assert
(! (not (not patient_is_willing_to_sign_informed_consent_now))
    :named REQ1_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unwilling to sign informed consent."
