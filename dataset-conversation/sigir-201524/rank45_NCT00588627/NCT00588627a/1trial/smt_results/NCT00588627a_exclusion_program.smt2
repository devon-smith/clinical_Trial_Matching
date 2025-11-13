;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_subject_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a subject (e.g., enrolled or participating in a study or trial).","when_to_set_to_false":"Set to false if the patient is currently not a subject (e.g., not enrolled or not participating in a study or trial).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a subject.","meaning":"Boolean indicating whether the patient is currently a subject (e.g., enrolled or participating in a study or trial)."}

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_subject_now)
:named REQ0_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is a subject."
