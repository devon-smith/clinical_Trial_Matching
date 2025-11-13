;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_obesity_now Bool) ;; "To be included, the patient must have obesity." {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of obesity.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has obesity.","meaning":"Boolean indicating whether the patient currently has obesity."}

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_obesity_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_ischemic_heart_disease_now Bool) ;; "To be included, the patient must have ischemic heart disease." {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of ischemic heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of ischemic heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of ischemic heart disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of ischemic heart disease."}

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_diagnosis_of_ischemic_heart_disease_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have ischemic heart disease."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_signed_informed_consent Bool) ;; "To be included, the patient must have signed informed consent." {"when_to_set_to_true":"Set to true if the patient has signed informed consent.","when_to_set_to_false":"Set to false if the patient has not signed informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed informed consent.","meaning":"Boolean indicating whether the patient has signed informed consent."}

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_signed_informed_consent
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have signed informed consent."
