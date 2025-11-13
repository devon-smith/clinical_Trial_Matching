;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_head_injury_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a head injury.","when_to_set_to_false":"Set to false if the patient currently does not have a head injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a head injury.","meaning":"Boolean indicating whether the patient currently has a head injury."} ;; "the patient has a head injury"
(declare-const patient_has_finding_of_minor_head_injury_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a minor head injury.","when_to_set_to_false":"Set to false if the patient currently does not have a minor head injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a minor head injury.","meaning":"Boolean indicating whether the patient currently has a minor head injury."} ;; "the patient has a minor head injury"
(declare-const patient_has_finding_of_traumatic_brain_injury_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a traumatic brain injury.","when_to_set_to_false":"Set to false if the patient currently does not have a traumatic brain injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a traumatic brain injury.","meaning":"Boolean indicating whether the patient currently has a traumatic brain injury."} ;; "the patient has a traumatic brain injury"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_head_injury_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a head injury."

(assert
(! (not patient_has_finding_of_minor_head_injury_now)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a minor head injury."

(assert
(! (not patient_has_finding_of_traumatic_brain_injury_now)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a traumatic brain injury."
