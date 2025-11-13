;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_meets_all_criteria_of_all_comers_design_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently meets all criteria specified by the all-comers design.","when_to_set_to_false":"Set to false if the patient currently does not meet all criteria specified by the all-comers design.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently meets all criteria specified by the all-comers design.","meaning":"Boolean indicating whether the patient currently meets all criteria specified by the all-comers design."} ;; "The patient is excluded if the patient does NOT meet all criteria specified by the all-comers design."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_meets_all_criteria_of_all_comers_design_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient does NOT meet all criteria specified by the all-comers design."
