;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_meets_any_exclusion_criteria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently meets at least one of the 15 exclusion criteria.","when_to_set_to_false":"Set to false if the patient currently does not meet any of the 15 exclusion criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently meets any of the 15 exclusion criteria.","meaning":"Boolean indicating whether the patient currently meets any of the 15 exclusion criteria specified for the study."} ;; "the patient meets any of the following 15 criteria."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_meets_any_exclusion_criteria_now)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient meets any of the following 15 criteria."
