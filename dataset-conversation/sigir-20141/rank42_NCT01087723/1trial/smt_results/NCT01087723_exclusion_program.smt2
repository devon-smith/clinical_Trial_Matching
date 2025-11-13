;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_excluded Bool) ;; {"when_to_set_to_true":"Set to true if at least one exclusion criterion is satisfied for the patient.","when_to_set_to_false":"Set to false if none of the exclusion criteria are satisfied for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether any exclusion criterion is satisfied for the patient.","meaning":"Boolean indicating whether the patient is excluded from the study based on satisfaction of at least one exclusion criterion."} ;; "Boolean variable indicating whether the patient is excluded from the study based on satisfaction of at least one exclusion criterion."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_excluded)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if at least one of the following criteria is satisfied for the patient."
