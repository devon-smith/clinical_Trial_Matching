;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_impaired_cognition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cognitive impairment.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cognitive impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cognitive impairment.","meaning":"Boolean indicating whether the patient currently has cognitive impairment."} ;; "cognitive impairment"

(declare-const patient_has_finding_of_impaired_cognition_now@@impacts_ability_to_follow_instructions Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current cognitive impairment impacts their ability to follow instructions.","when_to_set_to_false":"Set to false if the patient's current cognitive impairment does not impact their ability to follow instructions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cognitive impairment impacts their ability to follow instructions.","meaning":"Boolean indicating whether the patient's current cognitive impairment impacts their ability to follow instructions."} ;; "cognitive impairment that would impact the ability of the patient to follow instructions"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_impaired_cognition_now@@impacts_ability_to_follow_instructions
      patient_has_finding_of_impaired_cognition_now)
:named REQ0_AUXILIARY0)) ;; "cognitive impairment that would impact the ability of the patient to follow instructions"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_impaired_cognition_now@@impacts_ability_to_follow_instructions)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cognitive impairment that would impact the ability of the patient to follow instructions."
