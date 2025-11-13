;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_meets_at_least_one_exclusion_criterion_not_listed_in_provided_text Bool) ;; {"when_to_set_to_true":"Set to true if the patient meets at least one exclusion criterion that is not listed in the provided text.","when_to_set_to_false":"Set to false if the patient does not meet any exclusion criterion not listed in the provided text.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient meets any exclusion criterion not listed in the provided text.","meaning":"Boolean indicating whether the patient meets at least one exclusion criterion not listed in the provided text."} ;; "meets at least one criterion NOT listed in the provided text"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_meets_at_least_one_exclusion_criterion_not_listed_in_provided_text)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient meets at least one criterion NOT listed in the provided text."
