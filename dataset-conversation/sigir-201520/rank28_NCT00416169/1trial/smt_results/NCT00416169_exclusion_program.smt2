;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_degenerative_brain_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a neurodegenerative disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a neurodegenerative disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a neurodegenerative disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a neurodegenerative disorder."} ;; "neurodegenerative disorder"

(declare-const patient_has_diagnosis_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of dementia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of dementia."} ;; "dementia"

(declare-const patient_has_diagnosis_of_dementia_now@@caused_by_another_cause Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current dementia is caused by another cause.","when_to_set_to_false":"Set to false if the patient's current dementia is not caused by another cause.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current dementia is caused by another cause.","meaning":"Boolean indicating whether the patient's current dementia is caused by another cause."} ;; "another cause of dementia"

(declare-const patient_has_diagnosis_of_impaired_cognition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cognitive impairment.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cognitive impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cognitive impairment.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cognitive impairment."} ;; "cognitive impairment"

(declare-const patient_has_diagnosis_of_impaired_cognition_now@@resulting_from_acute_cerebral_injury Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current cognitive impairment is resulting from acute cerebral injury.","when_to_set_to_false":"Set to false if the patient's current cognitive impairment is not resulting from acute cerebral injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current cognitive impairment is resulting from acute cerebral injury.","meaning":"Boolean indicating whether the patient's current cognitive impairment is resulting from acute cerebral injury."} ;; "cognitive impairment resulting from acute cerebral injury"

(declare-const patient_has_diagnosis_of_impaired_cognition_now@@resulting_from_cerebrovascular_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current cognitive impairment is resulting from cerebrovascular disease.","when_to_set_to_false":"Set to false if the patient's current cognitive impairment is not resulting from cerebrovascular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current cognitive impairment is resulting from cerebrovascular disease.","meaning":"Boolean indicating whether the patient's current cognitive impairment is resulting from cerebrovascular disease."} ;; "cognitive impairment resulting from cerebrovascular disease"

(declare-const patient_has_diagnosis_of_impaired_cognition_now@@resulting_from_hypoxic_cerebral_damage Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current cognitive impairment is resulting from hypoxic cerebral damage.","when_to_set_to_false":"Set to false if the patient's current cognitive impairment is not resulting from hypoxic cerebral damage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current cognitive impairment is resulting from hypoxic cerebral damage.","meaning":"Boolean indicating whether the patient's current cognitive impairment is resulting from hypoxic cerebral damage."} ;; "cognitive impairment resulting from hypoxic cerebral damage"

(declare-const patient_has_diagnosis_of_impaired_cognition_now@@resulting_from_vitamin_deficiency_state Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current cognitive impairment is resulting from vitamin deficiency state.","when_to_set_to_false":"Set to false if the patient's current cognitive impairment is not resulting from vitamin deficiency state.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current cognitive impairment is resulting from vitamin deficiency state.","meaning":"Boolean indicating whether the patient's current cognitive impairment is resulting from vitamin deficiency state."} ;; "cognitive impairment resulting from vitamin deficiency state"

(declare-const patient_has_diagnosis_of_impaired_cognition_now@@resulting_from_infection Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current cognitive impairment is resulting from infection.","when_to_set_to_false":"Set to false if the patient's current cognitive impairment is not resulting from infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current cognitive impairment is resulting from infection.","meaning":"Boolean indicating whether the patient's current cognitive impairment is resulting from infection."} ;; "cognitive impairment resulting from infection"

(declare-const patient_has_diagnosis_of_impaired_cognition_now@@resulting_from_cerebral_neoplasia Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current cognitive impairment is resulting from cerebral neoplasia.","when_to_set_to_false":"Set to false if the patient's current cognitive impairment is not resulting from cerebral neoplasia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current cognitive impairment is resulting from cerebral neoplasia.","meaning":"Boolean indicating whether the patient's current cognitive impairment is resulting from cerebral neoplasia."} ;; "cognitive impairment resulting from cerebral neoplasia"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable: "another cause of dementia"
(assert
(! (=> patient_has_diagnosis_of_dementia_now@@caused_by_another_cause
       patient_has_diagnosis_of_dementia_now)
   :named REQ0_AUXILIARY0)) ;; "The patient has another cause of dementia."

;; Qualifier variable implies corresponding stem variable: "cognitive impairment resulting from acute cerebral injury"
(assert
(! (=> patient_has_diagnosis_of_impaired_cognition_now@@resulting_from_acute_cerebral_injury
       patient_has_diagnosis_of_impaired_cognition_now)
   :named REQ0_AUXILIARY1)) ;; "cognitive impairment resulting from acute cerebral injury"

;; Qualifier variable implies corresponding stem variable: "cognitive impairment resulting from cerebrovascular disease"
(assert
(! (=> patient_has_diagnosis_of_impaired_cognition_now@@resulting_from_cerebrovascular_disease
       patient_has_diagnosis_of_impaired_cognition_now)
   :named REQ0_AUXILIARY2)) ;; "cognitive impairment resulting from cerebrovascular disease"

;; Qualifier variable implies corresponding stem variable: "cognitive impairment resulting from hypoxic cerebral damage"
(assert
(! (=> patient_has_diagnosis_of_impaired_cognition_now@@resulting_from_hypoxic_cerebral_damage
       patient_has_diagnosis_of_impaired_cognition_now)
   :named REQ0_AUXILIARY3)) ;; "cognitive impairment resulting from hypoxic cerebral damage"

;; Qualifier variable implies corresponding stem variable: "cognitive impairment resulting from vitamin deficiency state"
(assert
(! (=> patient_has_diagnosis_of_impaired_cognition_now@@resulting_from_vitamin_deficiency_state
       patient_has_diagnosis_of_impaired_cognition_now)
   :named REQ0_AUXILIARY4)) ;; "cognitive impairment resulting from vitamin deficiency state"

;; Qualifier variable implies corresponding stem variable: "cognitive impairment resulting from infection"
(assert
(! (=> patient_has_diagnosis_of_impaired_cognition_now@@resulting_from_infection
       patient_has_diagnosis_of_impaired_cognition_now)
   :named REQ0_AUXILIARY5)) ;; "cognitive impairment resulting from infection"

;; Qualifier variable implies corresponding stem variable: "cognitive impairment resulting from cerebral neoplasia"
(assert
(! (=> patient_has_diagnosis_of_impaired_cognition_now@@resulting_from_cerebral_neoplasia
       patient_has_diagnosis_of_impaired_cognition_now)
   :named REQ0_AUXILIARY6)) ;; "cognitive impairment resulting from cerebral neoplasia"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have a neurodegenerative disorder
(assert
(! (not patient_has_diagnosis_of_degenerative_brain_disorder_now)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a neurodegenerative disorder."

;; Exclusion: patient must NOT have dementia caused by another cause
(assert
(! (not patient_has_diagnosis_of_dementia_now@@caused_by_another_cause)
   :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has another cause of dementia."

;; Exclusion: patient must NOT have cognitive impairment resulting from acute cerebral injury
(assert
(! (not patient_has_diagnosis_of_impaired_cognition_now@@resulting_from_acute_cerebral_injury)
   :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cognitive impairment resulting from acute cerebral injury."

;; Exclusion: patient must NOT have cognitive impairment resulting from cerebrovascular disease
(assert
(! (not patient_has_diagnosis_of_impaired_cognition_now@@resulting_from_cerebrovascular_disease)
   :named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cognitive impairment resulting from cerebrovascular disease."

;; Exclusion: patient must NOT have cognitive impairment resulting from hypoxic cerebral damage
(assert
(! (not patient_has_diagnosis_of_impaired_cognition_now@@resulting_from_hypoxic_cerebral_damage)
   :named REQ0_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cognitive impairment resulting from hypoxic cerebral damage."

;; Exclusion: patient must NOT have cognitive impairment resulting from vitamin deficiency state
(assert
(! (not patient_has_diagnosis_of_impaired_cognition_now@@resulting_from_vitamin_deficiency_state)
   :named REQ0_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cognitive impairment resulting from vitamin deficiency state."

;; Exclusion: patient must NOT have cognitive impairment resulting from infection
(assert
(! (not patient_has_diagnosis_of_impaired_cognition_now@@resulting_from_infection)
   :named REQ0_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cognitive impairment resulting from infection."

;; Exclusion: patient must NOT have cognitive impairment resulting from cerebral neoplasia
(assert
(! (not patient_has_diagnosis_of_impaired_cognition_now@@resulting_from_cerebral_neoplasia)
   :named REQ0_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cognitive impairment resulting from cerebral neoplasia."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_primary_memory_disturbance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a primary memory disturbance.","when_to_set_to_false":"Set to false if the patient currently does not have a primary memory disturbance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a primary memory disturbance.","meaning":"Boolean indicating whether the patient currently has a primary memory disturbance."} ;; "primary memory disturbance"

(declare-const patient_has_finding_of_amnestic_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of amnestic disorder.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of amnestic disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of amnestic disorder.","meaning":"Boolean indicating whether the patient currently has an amnestic disorder."} ;; "amnestic syndrome"

(declare-const patient_has_finding_of_amnestic_disorder_now@@more_compatible_with_alzheimers_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current amnestic disorder is more compatible with Alzheimer's disease.","when_to_set_to_false":"Set to false if the patient's current amnestic disorder is not more compatible with Alzheimer's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current amnestic disorder is more compatible with Alzheimer's disease.","meaning":"Boolean indicating whether the patient's current amnestic disorder is more compatible with Alzheimer's disease."} ;; "amnestic syndrome more compatible with Alzheimer's disease"

(declare-const patient_has_finding_of_amnestic_disorder_now@@more_compatible_with_another_primary_degenerative_dementia Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current amnestic disorder is more compatible with another primary degenerative dementia.","when_to_set_to_false":"Set to false if the patient's current amnestic disorder is not more compatible with another primary degenerative dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current amnestic disorder is more compatible with another primary degenerative dementia.","meaning":"Boolean indicating whether the patient's current amnestic disorder is more compatible with another primary degenerative dementia."} ;; "amnestic syndrome more compatible with another primary degenerative dementia"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_amnestic_disorder_now@@more_compatible_with_alzheimers_disease
      patient_has_finding_of_amnestic_disorder_now)
:named REQ1_AUXILIARY0)) ;; "amnestic syndrome more compatible with Alzheimer's disease"

(assert
(! (=> patient_has_finding_of_amnestic_disorder_now@@more_compatible_with_another_primary_degenerative_dementia
      patient_has_finding_of_amnestic_disorder_now)
:named REQ1_AUXILIARY1)) ;; "amnestic syndrome more compatible with another primary degenerative dementia"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_primary_memory_disturbance_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a primary memory disturbance."

(assert
(! (not patient_has_finding_of_amnestic_disorder_now@@more_compatible_with_alzheimers_disease)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an amnestic syndrome more compatible with Alzheimer's disease."

(assert
(! (not patient_has_finding_of_amnestic_disorder_now@@more_compatible_with_another_primary_degenerative_dementia)
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an amnestic syndrome more compatible with another primary degenerative dementia."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_epilepsy_control_poor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of poorly controlled (uncontrolled) epilepsy.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of poorly controlled (uncontrolled) epilepsy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has poorly controlled (uncontrolled) epilepsy.","meaning":"Boolean indicating whether the patient currently has poorly controlled (uncontrolled) epilepsy."} ;; "uncontrolled epilepsy"
(declare-const patient_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of psychiatric disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of psychiatric disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has psychiatric disease.","meaning":"Boolean indicating whether the patient currently has psychiatric disease."} ;; "psychiatric disease"
(declare-const patient_has_finding_of_mental_disorder_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a psychiatric disease and the disease is clinically significant.","when_to_set_to_false":"Set to false if the patient currently has a psychiatric disease but it is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the psychiatric disease is clinically significant.","meaning":"Boolean indicating whether the patient's current psychiatric disease is clinically significant."} ;; "clinically significant psychiatric disease"
(declare-const patient_has_finding_of_disorder_of_cardiovascular_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cardiovascular disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cardiovascular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cardiovascular disease.","meaning":"Boolean indicating whether the patient currently has cardiovascular disease."} ;; "cardiovascular disease"
(declare-const patient_has_finding_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of liver disease (hepatic disturbance).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of liver disease (hepatic disturbance).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has liver disease (hepatic disturbance).","meaning":"Boolean indicating whether the patient currently has liver disease (hepatic disturbance)."} ;; "hepatic disturbance"
(declare-const patient_has_finding_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of kidney disease (renal disturbance).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of kidney disease (renal disturbance).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has kidney disease (renal disturbance).","meaning":"Boolean indicating whether the patient currently has kidney disease (renal disturbance)."} ;; "renal disturbance"
(declare-const patient_has_finding_of_disorder_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of lung disorder (pulmonary disturbance).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of lung disorder (pulmonary disturbance).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has lung disorder (pulmonary disturbance).","meaning":"Boolean indicating whether the patient currently has lung disorder (pulmonary disturbance)."} ;; "pulmonary disturbance"
(declare-const patient_has_finding_of_metabolic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of metabolic disease (metabolic disturbance).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of metabolic disease (metabolic disturbance).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has metabolic disease (metabolic disturbance).","meaning":"Boolean indicating whether the patient currently has metabolic disease (metabolic disturbance)."} ;; "metabolic disturbance"
(declare-const patient_has_finding_of_endocrine_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of endocrine disturbance.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of endocrine disturbance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has endocrine disturbance.","meaning":"Boolean indicating whether the patient currently has endocrine disturbance."} ;; "endocrine disturbance"
(declare-const patient_has_finding_of_peptic_ulcer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of peptic ulcer.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of peptic ulcer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has peptic ulcer.","meaning":"Boolean indicating whether the patient currently has peptic ulcer."} ;; "peptic ulcer"
(declare-const patient_has_finding_of_peptic_ulcer_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a peptic ulcer and the ulcer is active.","when_to_set_to_false":"Set to false if the patient currently has a peptic ulcer but it is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the peptic ulcer is active.","meaning":"Boolean indicating whether the patient's current peptic ulcer is active."} ;; "active peptic ulcer"
(declare-const patient_has_finding_of_urinary_outflow_obstruction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of urinary outflow obstruction.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of urinary outflow obstruction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has urinary outflow obstruction.","meaning":"Boolean indicating whether the patient currently has urinary outflow obstruction."} ;; "urinary outflow obstruction"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable for psychiatric disease
(assert
(! (=> patient_has_finding_of_mental_disorder_now@@clinically_significant
      patient_has_finding_of_mental_disorder_now)
    :named REQ2_AUXILIARY0)) ;; "clinically significant psychiatric disease"

;; Qualifier variable implies corresponding stem variable for peptic ulcer
(assert
(! (=> patient_has_finding_of_peptic_ulcer_now@@active
      patient_has_finding_of_peptic_ulcer_now)
    :named REQ2_AUXILIARY1)) ;; "active peptic ulcer"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_epilepsy_control_poor_now)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled epilepsy."

(assert
(! (not patient_has_finding_of_mental_disorder_now@@clinically_significant)
    :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically significant psychiatric disease."

(assert
(! (not patient_has_finding_of_disorder_of_cardiovascular_system_now)
    :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cardiovascular disease."

(assert
(! (not patient_has_finding_of_disease_of_liver_now)
    :named REQ2_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hepatic disturbance."

(assert
(! (not patient_has_finding_of_kidney_disease_now)
    :named REQ2_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has renal disturbance."

(assert
(! (not patient_has_finding_of_disorder_of_lung_now)
    :named REQ2_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pulmonary disturbance."

(assert
(! (not patient_has_finding_of_metabolic_disease_now)
    :named REQ2_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has metabolic disturbance."

(assert
(! (not patient_has_finding_of_endocrine_disease_now)
    :named REQ2_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has endocrine disturbance."

(assert
(! (not patient_has_finding_of_peptic_ulcer_now@@active)
    :named REQ2_COMPONENT8_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active peptic ulcer."

(assert
(! (not patient_has_finding_of_urinary_outflow_obstruction_now)
    :named REQ2_COMPONENT9_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has urinary outflow obstruction."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_using_agent_used_for_treatment_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using any agent that is used for the treatment of dementia.","when_to_set_to_false":"Set to false if the patient is currently not using any agent that is used for the treatment of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using any agent that is used for the treatment of dementia.","meaning":"Boolean indicating whether the patient is currently using any agent that is used for the treatment of dementia."} ;; "the patient uses any agent used for the treatment of dementia"
(declare-const patient_is_using_agent_used_for_treatment_of_cognitive_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using any agent that is used for the treatment of cognitive impairment.","when_to_set_to_false":"Set to false if the patient is currently not using any agent that is used for the treatment of cognitive impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using any agent that is used for the treatment of cognitive impairment.","meaning":"Boolean indicating whether the patient is currently using any agent that is used for the treatment of cognitive impairment."} ;; "the patient uses any agent used for the treatment of cognitive impairment"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_using_agent_used_for_treatment_of_dementia_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses any agent used for the treatment of dementia."

(assert
(! (not patient_is_using_agent_used_for_treatment_of_cognitive_impairment_now)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses any agent used for the treatment of cognitive impairment."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_allergy_to_drug_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of allergy to a drug.","when_to_set_to_false":"Set to false if the patient has never had a documented history of allergy to a drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of allergy to a drug.","meaning":"Boolean indicating whether the patient has ever had a history of allergy to a drug."} ;; "drug allergy"
(declare-const patient_has_finding_of_allergy_to_drug_inthehistory@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of drug allergy was severe.","when_to_set_to_false":"Set to false if the patient's history of drug allergy was not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of drug allergy was severe.","meaning":"Boolean indicating whether the patient's history of drug allergy was severe."} ;; "severe drug allergy"
(declare-const patient_has_finding_of_hypersensitivity_to_cholinesterase_inhibitor_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of hypersensitivity to cholinesterase inhibitors.","when_to_set_to_false":"Set to false if the patient has never had a documented history of hypersensitivity to cholinesterase inhibitors.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of hypersensitivity to cholinesterase inhibitors.","meaning":"Boolean indicating whether the patient has ever had a history of hypersensitivity to cholinesterase inhibitors."} ;; "hypersensitivity to cholinesterase inhibitors"
(declare-const patient_has_finding_of_hypersensitivity_to_choline_agonist_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of hypersensitivity to choline agonists.","when_to_set_to_false":"Set to false if the patient has never had a documented history of hypersensitivity to choline agonists.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of hypersensitivity to choline agonists.","meaning":"Boolean indicating whether the patient has ever had a history of hypersensitivity to choline agonists."} ;; "hypersensitivity to choline agonists"
(declare-const patient_has_finding_of_hypersensitivity_to_similar_agent_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of hypersensitivity to similar agents.","when_to_set_to_false":"Set to false if the patient has never had a documented history of hypersensitivity to similar agents.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of hypersensitivity to similar agents.","meaning":"Boolean indicating whether the patient has ever had a history of hypersensitivity to similar agents."} ;; "hypersensitivity to similar agents"
(declare-const patient_has_finding_of_hypersensitivity_to_bromide_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of hypersensitivity to bromide.","when_to_set_to_false":"Set to false if the patient has never had a documented history of hypersensitivity to bromide.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of hypersensitivity to bromide.","meaning":"Boolean indicating whether the patient has ever had a history of hypersensitivity to bromide."} ;; "hypersensitivity to bromide"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_allergy_to_drug_inthehistory@@severe
       patient_has_finding_of_allergy_to_drug_inthehistory)
   :named REQ4_AUXILIARY0)) ;; "severe drug allergy" implies "drug allergy"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_allergy_to_drug_inthehistory@@severe)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of severe drug allergy."

(assert
(! (not patient_has_finding_of_hypersensitivity_to_cholinesterase_inhibitor_inthehistory)
   :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to cholinesterase inhibitors."

(assert
(! (not patient_has_finding_of_hypersensitivity_to_choline_agonist_inthehistory)
   :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to choline agonists."

(assert
(! (not patient_has_finding_of_hypersensitivity_to_similar_agent_inthehistory)
   :named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to similar agents."

(assert
(! (not patient_has_finding_of_hypersensitivity_to_bromide_inthehistory)
   :named REQ4_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to bromide."
