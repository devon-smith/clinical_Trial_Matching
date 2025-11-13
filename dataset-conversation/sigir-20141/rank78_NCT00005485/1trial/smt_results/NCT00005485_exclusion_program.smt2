;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_institutionalized_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently institutionalized (e.g., residing in a hospital, nursing home, or correctional facility).","when_to_set_to_false":"Set to false if the patient is currently not institutionalized.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently institutionalized.","meaning":"Boolean indicating whether the patient is currently institutionalized."} ;; "institutionalized"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_institutionalized_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is institutionalized."
