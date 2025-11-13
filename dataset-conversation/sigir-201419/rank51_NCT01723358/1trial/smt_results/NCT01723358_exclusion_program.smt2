;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_neurodegenerative_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a neurodegenerative condition.","when_to_set_to_false":"Set to false if the patient currently does not have a neurodegenerative condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a neurodegenerative condition.","meaning":"Boolean indicating whether the patient currently has a neurodegenerative condition."} ;; "neurodegenerative condition"

(declare-const patient_has_finding_of_neurodegenerative_condition_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's neurodegenerative condition is known (confirmed diagnosis).","when_to_set_to_false":"Set to false if the patient's neurodegenerative condition is not known (not confirmed diagnosis).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's neurodegenerative condition is known.","meaning":"Boolean indicating whether the patient's neurodegenerative condition is known (confirmed diagnosis)."} ;; "known neurodegenerative condition"

(declare-const patient_has_finding_of_neurodegenerative_condition_now@@suspected Bool) ;; {"when_to_set_to_true":"Set to true if the patient's neurodegenerative condition is suspected (not confirmed diagnosis).","when_to_set_to_false":"Set to false if the patient's neurodegenerative condition is not suspected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's neurodegenerative condition is suspected.","meaning":"Boolean indicating whether the patient's neurodegenerative condition is suspected (not confirmed diagnosis)."} ;; "suspected neurodegenerative condition"

(declare-const patient_has_finding_of_peripheral_neuromuscular_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a peripheral neuromuscular condition.","when_to_set_to_false":"Set to false if the patient currently does not have a peripheral neuromuscular condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a peripheral neuromuscular condition.","meaning":"Boolean indicating whether the patient currently has a peripheral neuromuscular condition."} ;; "peripheral neuromuscular condition"

(declare-const patient_has_finding_of_medical_condition_that_is_contraindication_for_neuromuscular_electrical_stimulation_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a medical condition that is a contraindication for neuromuscular electrical stimulation treatment.","when_to_set_to_false":"Set to false if the patient currently does not have a medical condition that is a contraindication for neuromuscular electrical stimulation treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a medical condition that is a contraindication for neuromuscular electrical stimulation treatment.","meaning":"Boolean indicating whether the patient currently has a medical condition that is a contraindication for neuromuscular electrical stimulation treatment."} ;; "medical condition that is a contraindication for neuromuscular electrical stimulation treatment"

(declare-const patient_has_finding_of_medical_condition_that_is_contraindication_for_neuromuscular_electrical_stimulation_treatment_now@@located_in_neck_region Bool) ;; {"when_to_set_to_true":"Set to true if the contraindication for neuromuscular electrical stimulation treatment is located in the neck region.","when_to_set_to_false":"Set to false if the contraindication for neuromuscular electrical stimulation treatment is not located in the neck region.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the contraindication for neuromuscular electrical stimulation treatment is located in the neck region.","meaning":"Boolean indicating whether the contraindication for neuromuscular electrical stimulation treatment is located in the neck region."} ;; "contraindication for neuromuscular electrical stimulation treatment located in neck region"

(declare-const patient_has_finding_of_neoplasm_of_neck_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of neoplasm (tumour) in the neck region.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of neoplasm (tumour) in the neck region.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a neoplasm (tumour) in the neck region.","meaning":"Boolean indicating whether the patient currently has a neoplasm (tumour) of the neck."} ;; "tumour in the neck region"

(declare-const patient_has_finding_of_soft_tissue_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of soft tissue infection.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of soft tissue infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a soft tissue infection.","meaning":"Boolean indicating whether the patient currently has a soft tissue infection."} ;; "soft tissue infection"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_neurodegenerative_condition_now@@known
      patient_has_finding_of_neurodegenerative_condition_now)
:named REQ0_AUXILIARY0)) ;; "known neurodegenerative condition"

(assert
(! (=> patient_has_finding_of_neurodegenerative_condition_now@@suspected
      patient_has_finding_of_neurodegenerative_condition_now)
:named REQ0_AUXILIARY1)) ;; "suspected neurodegenerative condition"

(assert
(! (=> patient_has_finding_of_medical_condition_that_is_contraindication_for_neuromuscular_electrical_stimulation_treatment_now@@located_in_neck_region
      patient_has_finding_of_medical_condition_that_is_contraindication_for_neuromuscular_electrical_stimulation_treatment_now)
:named REQ0_AUXILIARY2)) ;; "contraindication for neuromuscular electrical stimulation treatment located in neck region"

;; Non-exhaustive examples imply umbrella term for contraindication
(assert
(! (=> (or patient_has_finding_of_neoplasm_of_neck_now
           (and patient_has_finding_of_soft_tissue_infection_now
                patient_has_finding_of_medical_condition_that_is_contraindication_for_neuromuscular_electrical_stimulation_treatment_now@@located_in_neck_region))
      patient_has_finding_of_medical_condition_that_is_contraindication_for_neuromuscular_electrical_stimulation_treatment_now)
:named REQ0_AUXILIARY3)) ;; "with non-exhaustive examples ((a tumour in the neck region) OR (a neck soft tissue infection))"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_neurodegenerative_condition_now@@known)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known neurodegenerative condition."

(assert
(! (not patient_has_finding_of_neurodegenerative_condition_now@@suspected)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a suspected neurodegenerative condition."

(assert
(! (not patient_has_finding_of_peripheral_neuromuscular_condition_now)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a peripheral neuromuscular condition."

(assert
(! (not patient_has_finding_of_medical_condition_that_is_contraindication_for_neuromuscular_electrical_stimulation_treatment_now)
:named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a medical condition that is a contraindication for neuromuscular electrical stimulation treatment with non-exhaustive examples ((a tumour in the neck region) OR (a neck soft tissue infection))."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_neurodegenerative_condition_now)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a neurodegenerative disorder."
