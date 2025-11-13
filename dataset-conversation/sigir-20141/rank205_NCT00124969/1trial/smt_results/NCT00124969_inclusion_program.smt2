;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_end_stage_renal_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of end-stage renal disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of end-stage renal disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of end-stage renal disease.","meaning":"Boolean indicating whether the patient currently has end-stage renal disease."} // "To be included, the patient must have end-stage renal disease."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_end_stage_renal_disease_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have end-stage renal disease."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_undergoing_hemodialysis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving hemodialysis treatment.","when_to_set_to_false":"Set to false if the patient is not currently receiving hemodialysis treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving hemodialysis treatment.","meaning":"Boolean indicating whether the patient is currently undergoing hemodialysis treatment."} // "To be included, the patient must be receiving hemodialysis treatment."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_is_undergoing_hemodialysis_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be receiving hemodialysis treatment."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypertensive disorder (hypertension)."} // "To be included, the patient must have hypertension."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_diagnosis_of_hypertensive_disorder_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have hypertension."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_provided_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent.","meaning":"Boolean indicating whether the patient has provided written informed consent."} // "To be included, the patient must provide written informed consent."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_provided_written_informed_consent
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must provide written informed consent."
