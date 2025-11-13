;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of hypertensive disorder (hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of hypertensive disorder (hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of hypertensive disorder (hypertension)."} // "a clinical diagnosis of hypertension"
(declare-const patient_has_diagnosis_of_ischemic_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of ischemic heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of ischemic heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of ischemic heart disease.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of ischemic heart disease."} // "a clinical diagnosis of ischemic heart disease"
(declare-const patient_has_diagnosis_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of congestive heart failure.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of congestive heart failure."} // "a clinical diagnosis of congestive heart failure"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_hypertensive_disorder_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a clinical diagnosis of hypertension."

(assert
  (! patient_has_diagnosis_of_ischemic_heart_disease_now
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a clinical diagnosis of ischemic heart disease."

(assert
  (! patient_has_diagnosis_of_congestive_heart_failure_now
     :named REQ0_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a clinical diagnosis of congestive heart failure."
