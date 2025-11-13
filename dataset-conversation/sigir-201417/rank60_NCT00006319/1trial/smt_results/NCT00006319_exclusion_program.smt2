;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_able_to_provide_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to provide informed consent.","when_to_set_to_false":"Set to false if the patient is currently unable to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to provide informed consent.","meaning":"Boolean indicating whether the patient is currently able to provide informed consent."} ;; "the patient is unable to provide informed consent"
(declare-const parent_is_able_to_provide_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the parent of the patient is currently able to provide informed consent.","when_to_set_to_false":"Set to false if the parent of the patient is currently unable to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the parent of the patient is currently able to provide informed consent.","meaning":"Boolean indicating whether the parent of the patient is currently able to provide informed consent."} ;; "the parent of the patient is unable to provide informed consent"
(declare-const guardian_is_able_to_provide_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the guardian of the patient is currently able to provide informed consent.","when_to_set_to_false":"Set to false if the guardian of the patient is currently unable to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the guardian of the patient is currently able to provide informed consent.","meaning":"Boolean indicating whether the guardian of the patient is currently able to provide informed consent."} ;; "the guardian of the patient is unable to provide informed consent"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (or (not patient_is_able_to_provide_informed_consent_now)
              (not parent_is_able_to_provide_informed_consent_now)
              (not guardian_is_able_to_provide_informed_consent_now)))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is unable to provide informed consent) OR (the parent of the patient is unable to provide informed consent) OR (the guardian of the patient is unable to provide informed consent)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_human_immunodeficiency_virus_infection_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with human immunodeficiency virus infection at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with human immunodeficiency virus infection at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of human immunodeficiency virus infection in their history."} ;; "infected with human immunodeficiency virus"
(declare-const patient_has_diagnosis_of_human_immunodeficiency_virus_infection_inthehistory@@temporalcontext_before_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of human immunodeficiency virus infection occurred before enrollment.","when_to_set_to_false":"Set to false if the patient's diagnosis of human immunodeficiency virus infection did not occur before enrollment (e.g., occurred at or after enrollment).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis occurred before enrollment.","meaning":"Boolean indicating whether the patient's diagnosis of human immunodeficiency virus infection occurred before enrollment."} ;; "before enrollment"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_human_immunodeficiency_virus_infection_inthehistory@@temporalcontext_before_enrollment
      patient_has_diagnosis_of_human_immunodeficiency_virus_infection_inthehistory)
:named REQ1_AUXILIARY0)) ;; "infected with human immunodeficiency virus before enrollment"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_human_immunodeficiency_virus_infection_inthehistory@@temporalcontext_before_enrollment)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is infected with human immunodeficiency virus before enrollment."
