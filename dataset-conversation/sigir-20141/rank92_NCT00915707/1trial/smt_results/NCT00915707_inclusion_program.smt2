;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_normal_weight_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has normal body weight as a clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have normal body weight as a clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has normal body weight.","meaning":"Boolean indicating whether the patient currently has normal body weight."}  ;; "To be included, the patient must have normal body weight."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_normal_weight_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have normal body weight."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patients_health_status_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered to have a positive health status (i.e., has 'health').","when_to_set_to_false":"Set to false if the patient is currently not considered to have a positive health status (i.e., does not have 'health').","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive health status.","meaning":"Boolean indicating whether the patient currently has a positive health status."}  ;; "To be included, the patient must have health."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patients_health_status_is_positive_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have health."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patients_duration_of_sleep_is_normal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sleep duration is normal at the present time.","when_to_set_to_false":"Set to false if the patient's sleep duration is not normal at the present time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's sleep duration is normal at the present time.","meaning":"Boolean indicating whether the patient's sleep duration is normal now."}  ;; "To be included, the patient must have normal sleep duration."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patients_duration_of_sleep_is_normal_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have normal sleep duration."
