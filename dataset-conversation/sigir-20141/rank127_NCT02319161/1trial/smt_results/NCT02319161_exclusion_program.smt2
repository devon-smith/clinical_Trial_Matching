;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_file_can_be_reached_now Bool) ;; {"when_to_set_to_true":"Set to true if the file of the patient can be reached at the current time.","when_to_set_to_false":"Set to false if the file of the patient cannot be reached at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the file of the patient can be reached at the current time.","meaning":"Boolean indicating whether the file of the patient can be reached at the current time."} ;; "the file of the patient cannot be reached"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (not patient_file_can_be_reached_now))
:named REQ0_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the file of the patient cannot be reached."
