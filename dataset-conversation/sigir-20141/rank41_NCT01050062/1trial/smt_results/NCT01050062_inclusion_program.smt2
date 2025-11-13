;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypertensive disorder (hypertension)."}
(declare-const patient_has_ever_taken_micombi_tablets Bool) ;; {"when_to_set_to_true":"Set to true if there is evidence that the patient has ever taken Micombi Tablets at any point in their lifetime.","when_to_set_to_false":"Set to false if there is evidence that the patient has never taken Micombi Tablets at any point in their lifetime.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken Micombi Tablets.","meaning":"Boolean indicating whether the patient has ever taken Micombi Tablets at any point in their lifetime."}

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Patient must have hypertension
(assert
  (! patient_has_diagnosis_of_hypertensive_disorder_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have hypertension."

;; Component 1: Patient must not have ever taken Micombi Tablets
(assert
  (! (not patient_has_ever_taken_micombi_tablets)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must not have ever taken Micombi Tablets."
