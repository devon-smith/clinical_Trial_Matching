;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_preoperative_state_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in the preoperative state.","when_to_set_to_false":"Set to false if the patient is currently not in the preoperative state.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in the preoperative state.","meaning":"Boolean indicating whether the patient is currently in the preoperative state."} ;; "preoperative state"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_preoperative_state_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is in the preoperative state."
