;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_impossibility_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has impossibility to give informed consent.","when_to_set_to_false":"Set to false if the patient currently does not have impossibility to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has impossibility to give informed consent.","meaning":"Boolean indicating whether the patient currently has impossibility to give informed consent."} ;; "The patient is excluded if the patient has impossibility to give informed consent."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_impossibility_to_give_informed_consent_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has impossibility to give informed consent."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_refuses_to_participate Bool) ;; {"when_to_set_to_true":"Set to true if the patient has explicitly refused to participate.","when_to_set_to_false":"Set to false if the patient has not refused to participate (i.e., has agreed or has not expressed refusal).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient refused to participate.","meaning":"Boolean indicating whether the patient refuses to participate."} ;; "The patient is excluded if the patient refuses to participate."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_refuses_to_participate)
:named REQ1_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient refuses to participate."
