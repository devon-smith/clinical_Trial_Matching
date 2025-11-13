;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_patient_immunocompromised_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has immunocompromised status.","when_to_set_to_false":"Set to false if the patient currently does not have immunocompromised status.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has immunocompromised status.","meaning":"Boolean indicating whether the patient currently has immunocompromised status."} ;; "immunocompromised status"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_patient_immunocompromised_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has immunocompromised status."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_undergoing_chemotherapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is actively undergoing chemotherapy treatment at the time of eligibility assessment.","when_to_set_to_false":"Set to false if the patient is not actively undergoing chemotherapy treatment at the time of eligibility assessment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing chemotherapy treatment.","meaning":"Boolean indicating whether the patient is currently undergoing chemotherapy treatment."} ;; "chemotherapy treatment"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_undergoing_chemotherapy_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is under chemotherapy treatment."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_undergoing_administration_of_steroid_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing administration of steroids (i.e., is under steroids treatment) at the time of eligibility assessment.","when_to_set_to_false":"Set to false if the patient is not currently undergoing administration of steroids at the time of eligibility assessment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing administration of steroids.","meaning":"Boolean indicating whether the patient is currently undergoing administration of steroids (steroids treatment) now."} ;; "steroids treatment"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_undergoing_administration_of_steroid_now)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is under steroids treatment."
