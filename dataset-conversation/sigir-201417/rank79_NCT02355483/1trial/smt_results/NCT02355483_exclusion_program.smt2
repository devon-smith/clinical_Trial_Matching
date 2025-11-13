;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_pain_provoked_by_trauma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pain provoked by trauma.","when_to_set_to_false":"Set to false if the patient currently does not have pain provoked by trauma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pain provoked by trauma.","meaning":"Boolean indicating whether the patient currently has pain provoked by trauma."} ;; "traumatic pain"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_pain_provoked_by_trauma_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has traumatic pain."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const symptom_duration_value_recorded_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days corresponding to the total duration of the patient's symptoms.","when_to_set_to_null":"Set to null if the duration of symptoms is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total duration of the patient's symptoms in days."} ;; "symptom duration > 7 days"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (> symptom_duration_value_recorded_in_days 7))
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has symptom duration > 7 days."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_able_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to give informed consent.","when_to_set_to_false":"Set to false if the patient is currently unable to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to give informed consent.","meaning":"Boolean indicating whether the patient is currently able to give informed consent."} ;; "The patient is excluded if the patient is unable to give informed consent."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_able_to_give_informed_consent_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to give informed consent."
