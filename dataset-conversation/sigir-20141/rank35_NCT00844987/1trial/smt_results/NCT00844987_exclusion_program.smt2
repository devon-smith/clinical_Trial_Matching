;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of myocardial infarction at any time in the past (known history).","when_to_set_to_false":"Set to false if the patient has no documented diagnosis of myocardial infarction in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of myocardial infarction.","meaning":"Boolean indicating whether the patient has a known past history of myocardial infarction."} ;; "has a known past history of myocardial infarction"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_diagnosis_of_myocardial_infarction_inthehistory)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known past history of myocardial infarction."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_signed_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed informed consent.","when_to_set_to_false":"Set to false if the patient has not signed informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed informed consent.","meaning":"Boolean indicating whether the patient has signed informed consent."} ;; "has NOT signed informed consent"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_signed_informed_consent)
:named REQ1_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has NOT signed informed consent."
