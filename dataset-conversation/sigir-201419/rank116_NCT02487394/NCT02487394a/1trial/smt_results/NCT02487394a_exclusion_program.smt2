;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_respiratory_illness_other_than_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a respiratory illness and the illness is not asthma.","when_to_set_to_false":"Set to false if the patient currently does not have any respiratory illness, or only has asthma and no other respiratory illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a respiratory illness other than asthma.","meaning":"Boolean indicating whether the patient currently has a respiratory illness other than asthma."} ;; "The patient is excluded if the patient has respiratory illness other than asthma."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_respiratory_illness_other_than_asthma_now)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has respiratory illness other than asthma."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_chronic_infectious_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chronic infectious disease.","when_to_set_to_false":"Set to false if the patient currently does not have a chronic infectious disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a chronic infectious disease.","meaning":"Boolean indicating whether the patient currently has a chronic infectious disease."} ;; "chronic infectious process"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_chronic_infectious_disease_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic infectious process."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any illness (not otherwise specified and not covered by other reusable variables).","when_to_set_to_false":"Set to false if the patient currently does not have any illness (not otherwise specified and not covered by other reusable variables).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any illness (not otherwise specified and not covered by other reusable variables).","meaning":"Boolean indicating whether the patient currently has any illness (not otherwise specified)."} ;; "illness"
(declare-const patient_has_finding_of_significant_other_medical_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a significant other medical illness (not otherwise specified and not covered by other declared variables) that is considered clinically significant.","when_to_set_to_false":"Set to false if the patient currently does not have any significant other medical illness (not otherwise specified and not covered by other declared variables) or if present illnesses are not considered significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a significant other medical illness (not otherwise specified and not covered by other declared variables).","meaning":"Boolean indicating whether the patient currently has a significant other medical illness (not otherwise specified and not covered by other declared variables) that is considered clinically significant."} ;; "significant other medical illness"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_significant_other_medical_illness_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant other medical illness."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_able_to_provide_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to provide consent.","when_to_set_to_false":"Set to false if the patient is currently unable to provide consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to provide consent.","meaning":"Boolean indicating whether the patient is currently able to provide consent."} ;; "The patient is excluded if the patient is unable to provide consent."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_able_to_provide_consent_now)
:named REQ3_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to provide consent."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if there is documented evidence that the patient is currently pregnant.","when_to_set_to_false":"Set to false if there is documented evidence that the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient has (pregnancy)"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_pregnant_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has (pregnancy)."
