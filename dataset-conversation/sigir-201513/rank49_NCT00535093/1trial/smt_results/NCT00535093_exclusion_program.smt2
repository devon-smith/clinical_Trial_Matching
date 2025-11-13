;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_antibiotic_therapy_inthepast7days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone antibiotic therapy at any time within the past seven days.","when_to_set_to_false":"Set to false if the patient has not undergone antibiotic therapy within the past seven days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone antibiotic therapy within the past seven days.","meaning":"Boolean indicating whether the patient has undergone antibiotic therapy within the past seven days."} ;; "antibiotic treatment within the preceding seven days"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_undergone_antibiotic_therapy_inthepast7days)
:named REQ0_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has received antibiotic treatment within the preceding seven days."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_provided_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided informed consent.","when_to_set_to_false":"Set to false if the patient has not provided informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided informed consent.","meaning":"Boolean indicating whether the patient has provided informed consent."} ;; "the patient does NOT provide informed consent"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_provided_informed_consent)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient does NOT provide informed consent."
