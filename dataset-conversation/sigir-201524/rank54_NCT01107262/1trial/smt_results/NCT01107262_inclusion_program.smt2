;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (age ≥ 18 years)."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_is_willing_to_participate_by_signing_consent_form Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to participate by signing a consent form.","when_to_set_to_false":"Set to false if the patient is not willing to participate by signing a consent form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to participate by signing a consent form.","meaning":"Boolean indicating whether the patient is willing to participate by signing a consent form."} // "be willing to participate by signing a consent form"
(declare-const patient_is_willing_to_participate_by_completing_study_questionnaire Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to participate by completing a study questionnaire.","when_to_set_to_false":"Set to false if the patient is not willing to participate by completing a study questionnaire.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to participate by completing a study questionnaire.","meaning":"Boolean indicating whether the patient is willing to participate by completing a study questionnaire."} // "be willing to participate by completing a study questionnaire"
(declare-const patient_can_undergo_collection_of_blood_specimen_for_laboratory_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able and willing to provide a blood specimen for laboratory collection.","when_to_set_to_false":"Set to false if the patient is currently unable or unwilling to provide a blood specimen for laboratory collection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able and willing to provide a blood specimen for laboratory collection now.","meaning":"Boolean indicating whether the patient is currently able and willing to provide a blood specimen for laboratory collection."} // "be willing to participate by providing a blood sample"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Patient must be willing to participate by signing a consent form
(assert
  (! patient_is_willing_to_participate_by_signing_consent_form
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "be willing to participate by signing a consent form"

;; Component 1: Patient must be willing to participate by completing a study questionnaire
(assert
  (! patient_is_willing_to_participate_by_completing_study_questionnaire
     :named REQ1_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "be willing to participate by completing a study questionnaire"

;; Component 2: Patient must be willing to participate by providing a blood sample
(assert
  (! patient_can_undergo_collection_of_blood_specimen_for_laboratory_now
     :named REQ1_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "be willing to participate by providing a blood sample"
