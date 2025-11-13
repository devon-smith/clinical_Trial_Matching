;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_secondary_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of secondary hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of secondary hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of secondary hypertension.","meaning":"Boolean indicating whether the patient currently has a diagnosis of secondary hypertension."} ;; "secondary hypertension"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_secondary_hypertension_now)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has secondary hypertension."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_receiving_hypertension_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving medication for hypertension.","when_to_set_to_false":"Set to false if the patient is currently not receiving medication for hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving medication for hypertension.","meaning":"Boolean indicating whether the patient is currently receiving medication for hypertension."} ;; "receiving hypertension medication"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (not patient_is_receiving_hypertension_medication_now))
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is NOT receiving hypertension medication."
