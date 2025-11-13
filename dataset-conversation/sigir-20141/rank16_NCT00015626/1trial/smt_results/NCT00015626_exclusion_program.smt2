;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_patient_status_determination_critical_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently critically ill.","when_to_set_to_false":"Set to false if the patient is currently not critically ill.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently critically ill.","meaning":"Boolean indicating whether the patient is currently critically ill."} ;; "critically ill"
(declare-const patient_has_finding_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congestive heart failure.","meaning":"Boolean indicating whether the patient currently has congestive heart failure."} ;; "congestive heart failure"
(declare-const patient_has_finding_of_renal_insufficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has renal insufficiency.","when_to_set_to_false":"Set to false if the patient currently does not have renal insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal insufficiency.","meaning":"Boolean indicating whether the patient currently has renal insufficiency."} ;; "renal insufficiency"
(declare-const patient_has_finding_of_hepatic_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatic (liver) failure/insufficiency.","when_to_set_to_false":"Set to false if the patient currently does not have hepatic (liver) failure/insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatic (liver) failure/insufficiency.","meaning":"Boolean indicating whether the patient currently has hepatic (liver) failure/insufficiency."} ;; "liver insufficiency"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_finding_of_patient_status_determination_critical_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is critically ill."

(assert
  (! (not patient_has_finding_of_congestive_heart_failure_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has congestive heart failure."

(assert
  (! (not patient_has_finding_of_renal_insufficiency_now)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has renal insufficiency."

(assert
  (! (not patient_has_finding_of_hepatic_failure_now)
     :named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has liver insufficiency."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_inability_to_give_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has inability to give consent.","when_to_set_to_false":"Set to false if the patient currently does not have inability to give consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has inability to give consent.","meaning":"Boolean indicating whether the patient currently has inability to give consent."} ;; "The patient is excluded if the patient has inability to give consent."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_has_inability_to_give_consent_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has inability to give consent."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_history_of_poor_compliance_with_physicians_recommendations Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of poor compliance with physician's recommendations.","when_to_set_to_false":"Set to false if the patient does not have a documented history of poor compliance with physician's recommendations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of poor compliance with physician's recommendations.","meaning":"Boolean indicating whether the patient has a history of poor compliance with physician's recommendations."} ;; "history of poor compliance with physician's recommendations"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_history_of_poor_compliance_with_physicians_recommendations)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has history of poor compliance with physician's recommendations."
