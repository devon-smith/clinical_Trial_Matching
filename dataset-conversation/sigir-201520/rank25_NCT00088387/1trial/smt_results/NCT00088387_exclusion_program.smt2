;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_meets_any_exclusion_criteria Bool) ;; {"when_to_set_to_true": "Set to true if the patient meets any exclusion criterion specified elsewhere in the protocol.", "when_to_set_to_false": "Set to false if the patient does not meet any exclusion criterion specified elsewhere in the protocol.", "when_to_set_to_null": "Set to null if it is unknown whether the patient meets any exclusion criterion.", "meaning": "Indicates whether the patient meets any exclusion criterion."} ;; "A patient is excluded if the patient meets any of the following."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_meets_any_exclusion_criteria)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient meets any of the following."
