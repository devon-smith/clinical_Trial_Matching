;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_provided_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided informed consent.","when_to_set_to_false":"Set to false if the patient has not provided informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided informed consent.","meaning":"Boolean indicating whether the patient has provided informed consent."} ;; "patient has provided informed consent"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_provided_informed_consent)
:named REQ0_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient does NOT provide informed consent."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as confirmed by clinical assessment or documentation.","when_to_set_to_false":"Set to false if the patient is currently confirmed not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_homeless_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently homeless.","when_to_set_to_false":"Set to false if the patient is currently not homeless.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently homeless.","meaning":"Boolean indicating whether the patient is currently homeless."} ;; "homeless"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_homeless_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is homeless."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_social_assurance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has social assurance.","when_to_set_to_false":"Set to false if the patient currently does not have social assurance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has social assurance.","meaning":"Boolean indicating whether the patient currently has social assurance."} ;; "the patient does NOT have social assurance"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_social_assurance_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient does NOT have social assurance."
