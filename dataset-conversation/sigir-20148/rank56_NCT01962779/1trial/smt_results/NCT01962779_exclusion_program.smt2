;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_disorder_of_brain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any disorder of the brain.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of any disorder of the brain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of any disorder of the brain.","meaning":"Boolean indicating whether the patient currently has a diagnosis of any disorder of the brain."} ;; "diagnosis of any brain disease"

(declare-const patient_has_finding_of_brain_damage_on_magnetic_resonance_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of brain damage on MRI.","when_to_set_to_false":"Set to false if the patient currently does not have evidence of brain damage on MRI.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of brain damage on MRI.","meaning":"Boolean indicating whether the patient currently has evidence of brain damage on MRI."} ;; "magnetic resonance imaging evidence of brain damage"

(declare-const patient_has_finding_of_cerebral_trauma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cerebral trauma.","when_to_set_to_false":"Set to false if the patient currently does not have cerebral trauma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cerebral trauma.","meaning":"Boolean indicating whether the patient currently has cerebral trauma."} ;; "brain trauma"

(declare-const patient_has_finding_of_cerebral_trauma_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cerebral trauma is significant.","when_to_set_to_false":"Set to false if the patient's cerebral trauma is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the trauma is significant.","meaning":"Boolean indicating whether the patient's cerebral trauma is significant."} ;; "significant brain trauma"

(declare-const patient_has_finding_of_hydrocephalus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hydrocephalus.","when_to_set_to_false":"Set to false if the patient currently does not have hydrocephalus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hydrocephalus.","meaning":"Boolean indicating whether the patient currently has hydrocephalus."} ;; "hydrocephalus"

(declare-const patient_has_finding_of_seizure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has seizures.","when_to_set_to_false":"Set to false if the patient currently does not have seizures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has seizures.","meaning":"Boolean indicating whether the patient currently has seizures."} ;; "seizures"

(declare-const patient_has_finding_of_intellectual_disability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has intellectual disability.","when_to_set_to_false":"Set to false if the patient currently does not have intellectual disability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has intellectual disability.","meaning":"Boolean indicating whether the patient currently has intellectual disability."} ;; "mental retardation"

(declare-const patient_has_finding_of_disorder_of_nervous_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the nervous system.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the nervous system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the nervous system.","meaning":"Boolean indicating whether the patient currently has a disorder of the nervous system."} ;; "neurological disorder"

(declare-const patient_has_finding_of_disorder_of_nervous_system_now@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient's disorder of the nervous system is serious.","when_to_set_to_false":"Set to false if the patient's disorder of the nervous system is not serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder is serious.","meaning":"Boolean indicating whether the patient's disorder of the nervous system is serious."} ;; "serious neurological disorder"

(declare-const patient_has_finding_of_parkinson_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has Parkinson's disease.","when_to_set_to_false":"Set to false if the patient currently does not have Parkinson's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Parkinson's disease.","meaning":"Boolean indicating whether the patient currently has Parkinson's disease."} ;; "Parkinson's disease"

(declare-const patient_has_finding_of_movement_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a movement disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a movement disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a movement disorder.","meaning":"Boolean indicating whether the patient currently has a movement disorder."} ;; "movement disorder"

(declare-const patient_has_finding_of_traumatic_and_or_non_traumatic_brain_injury_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has traumatic and/or non-traumatic brain injury.","when_to_set_to_false":"Set to false if the patient currently does not have traumatic and/or non-traumatic brain injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has traumatic and/or non-traumatic brain injury.","meaning":"Boolean indicating whether the patient currently has traumatic and/or non-traumatic brain injury."} ;; "brain damage"

(declare-const patient_has_finding_of_traumatic_and_or_non_traumatic_brain_injury_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's traumatic and/or non-traumatic brain injury is significant.","when_to_set_to_false":"Set to false if the patient's traumatic and/or non-traumatic brain injury is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the injury is significant.","meaning":"Boolean indicating whether the patient's traumatic and/or non-traumatic brain injury is significant."} ;; "significant brain damage"

(declare-const patient_has_finding_of_silent_cerebral_infarct_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has silent cerebral infarcts.","when_to_set_to_false":"Set to false if the patient currently does not have silent cerebral infarcts.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has silent cerebral infarcts.","meaning":"Boolean indicating whether the patient currently has silent cerebral infarcts."} ;; "silent cerebral infarcts"

(declare-const patient_has_finding_of_silent_cortical_infarct_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has silent cortical infarcts.","when_to_set_to_false":"Set to false if the patient currently does not have silent cortical infarcts.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has silent cortical infarcts.","meaning":"Boolean indicating whether the patient currently has silent cortical infarcts."} ;; "silent cortical infarcts"

(declare-const patient_has_finding_of_white_matter_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has white matter disease.","when_to_set_to_false":"Set to false if the patient currently does not have white matter disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has white matter disease.","meaning":"Boolean indicating whether the patient currently has white matter disease."} ;; "white matter lesions"

(declare-const patient_has_undergone_magnetic_resonance_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone magnetic resonance imaging (MRI) now.","when_to_set_to_false":"Set to false if the patient has not undergone magnetic resonance imaging (MRI) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone magnetic resonance imaging (MRI) now.","meaning":"Boolean indicating whether the patient has undergone magnetic resonance imaging (MRI) now."} ;; "magnetic resonance imaging"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples for MRI evidence of brain damage
(assert
(! (=> (or patient_has_finding_of_traumatic_and_or_non_traumatic_brain_injury_now@@significant
          patient_has_finding_of_cerebral_trauma_now@@significant
          patient_has_finding_of_hydrocephalus_now
          patient_has_finding_of_seizure_now
          patient_has_finding_of_intellectual_disability_now
          patient_has_finding_of_disorder_of_nervous_system_now@@serious)
    patient_has_finding_of_brain_damage_on_magnetic_resonance_imaging_now)
:named REQ0_AUXILIARY0)) ;; "magnetic resonance imaging evidence of brain damage with non-exhaustive examples (significant brain trauma, hydrocephalus, seizures, mental retardation, other serious neurological disorder...)"

;; Non-exhaustive examples for serious neurological disorder
(assert
(! (=> (or patient_has_finding_of_parkinson_s_disease_now
          patient_has_finding_of_movement_disorder_now)
    patient_has_finding_of_disorder_of_nervous_system_now@@serious)
:named REQ0_AUXILIARY1)) ;; "other serious neurological disorder with non-exhaustive examples (Parkinson's disease, other movement disorder)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_cerebral_trauma_now@@significant
    patient_has_finding_of_cerebral_trauma_now)
:named REQ0_AUXILIARY2)) ;; "significant brain trauma"

(assert
(! (=> patient_has_finding_of_traumatic_and_or_non_traumatic_brain_injury_now@@significant
    patient_has_finding_of_traumatic_and_or_non_traumatic_brain_injury_now)
:named REQ0_AUXILIARY3)) ;; "significant brain damage"

(assert
(! (=> patient_has_finding_of_disorder_of_nervous_system_now@@serious
    patient_has_finding_of_disorder_of_nervous_system_now)
:named REQ0_AUXILIARY4)) ;; "serious neurological disorder"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_disorder_of_brain_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of any brain disease."

(assert
(! (not patient_has_finding_of_brain_damage_on_magnetic_resonance_imaging_now)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has magnetic resonance imaging evidence of brain damage..."

(assert
(! (not patient_has_finding_of_silent_cortical_infarct_now)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has silent cortical infarcts."

;; ===================== Note on exclusions =====================
;; Subcortical infarcts and white matter lesions are NOT exclusion criteria.
;; No assertion is made for patient_has_finding_of_white_matter_disease_now.

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_neoplasm_of_brain_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with neoplasm of the brain (brain tumor) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with neoplasm of the brain (brain tumor) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with neoplasm of the brain (brain tumor).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of neoplasm of the brain (brain tumor) in their history."} ;; "brain tumor"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_neoplasm_of_brain_inthehistory)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of brain tumor."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_radiation_therapy_inthepast3years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone radiation therapy anywhere in the body within the past three years.","when_to_set_to_false":"Set to false if the patient has not undergone radiation therapy anywhere in the body within the past three years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone radiation therapy anywhere in the body within the past three years.","meaning":"Boolean indicating whether the patient has undergone radiation therapy anywhere in the body within the past three years."} ;; "any radiation therapy anywhere in the body in the past three years"
(declare-const patient_has_undergone_chemotherapy_inthepast3years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone chemotherapy anywhere in the body within the past three years.","when_to_set_to_false":"Set to false if the patient has not undergone chemotherapy anywhere in the body within the past three years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone chemotherapy anywhere in the body within the past three years.","meaning":"Boolean indicating whether the patient has undergone chemotherapy anywhere in the body within the past three years."} ;; "any chemotherapy anywhere in the body in the past three years"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_undergone_radiation_therapy_inthepast3years)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had any radiation therapy anywhere in the body in the past three years."

(assert
(! (not patient_has_undergone_chemotherapy_inthepast3years)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had any chemotherapy anywhere in the body in the past three years."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_alcoholism_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of alcoholism at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of alcoholism at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of alcoholism.","meaning":"Boolean indicating whether the patient has a history of alcoholism at any time in the past."} ;; "alcoholism"
(declare-const patient_has_finding_of_alcoholism_inthehistory@@significant_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of alcoholism is considered significant.","when_to_set_to_false":"Set to false if the patient's history of alcoholism is not considered significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of alcoholism is significant.","meaning":"Boolean indicating whether the patient's history of alcoholism is significant."} ;; "significant history of alcoholism"
(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of drug abuse at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of drug abuse at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of drug abuse.","meaning":"Boolean indicating whether the patient has a history of drug abuse at any time in the past."} ;; "drug abuse"
(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthehistory@@significant_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of drug abuse is considered significant.","when_to_set_to_false":"Set to false if the patient's history of drug abuse is not considered significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of drug abuse is significant.","meaning":"Boolean indicating whether the patient's history of drug abuse is significant."} ;; "significant history of drug abuse"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable for alcoholism
(assert
(! (=> patient_has_finding_of_alcoholism_inthehistory@@significant_history
       patient_has_finding_of_alcoholism_inthehistory)
   :named REQ3_AUXILIARY0)) ;; "significant history of alcoholism"

;; Qualifier variable implies corresponding stem variable for drug abuse
(assert
(! (=> patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthehistory@@significant_history
       patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthehistory)
   :named REQ3_AUXILIARY1)) ;; "significant history of drug abuse"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_alcoholism_inthehistory@@significant_history)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a significant history of alcoholism."

(assert
(! (not patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthehistory@@significant_history)
   :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a significant history of drug abuse."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_mental_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with any mental disorder (psychiatric illness) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with any mental disorder (psychiatric illness) at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with any mental disorder (psychiatric illness).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of any mental disorder (psychiatric illness) in their history."} ;; "psychiatric illness"

(declare-const patient_has_diagnosis_of_schizophrenia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with schizophrenia at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with schizophrenia at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with schizophrenia.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of schizophrenia in their history."} ;; "schizophrenia"

(declare-const patient_has_diagnosis_of_mania_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with mania at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with mania at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with mania.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of mania in their history."} ;; "mania"

(declare-const patient_has_diagnosis_of_posttraumatic_stress_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with posttraumatic stress disorder at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with posttraumatic stress disorder at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with posttraumatic stress disorder.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of posttraumatic stress disorder in their history."} ;; "posttraumatic stress disorder"

(declare-const patient_has_diagnosis_of_depressive_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with depressive disorder (major depression) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with depressive disorder (major depression) at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with depressive disorder (major depression).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of depressive disorder (major depression) in their history."} ;; "major depression"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_schizophrenia_inthehistory
           patient_has_diagnosis_of_mania_inthehistory
           patient_has_diagnosis_of_posttraumatic_stress_disorder_inthehistory
           patient_has_diagnosis_of_depressive_disorder_inthehistory)
        patient_has_diagnosis_of_mental_disorder_inthehistory)
   :named REQ4_AUXILIARY0)) ;; "with non-exhaustive examples (schizophrenia, mania, posttraumatic stress disorder, lifelong history of major depression)."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_mental_disorder_inthehistory)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of psychiatric illness with non-exhaustive examples (schizophrenia, mania, posttraumatic stress disorder, lifelong history of major depression)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_ham_d_hamilton_rating_scale_for_depression_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's Hamilton Depression Scale score is recorded now.","when_to_set_to_null":"Set to null if no such score is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's Hamilton Depression Scale score recorded now."} ;; "Hamilton Depression Scale score > sixteen"

(declare-const patient_has_history_of_lifelong_depressive_episodes Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of lifelong depressive episodes.","when_to_set_to_false":"Set to false if the patient does not have a documented history of lifelong depressive episodes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of lifelong depressive episodes.","meaning":"Boolean indicating whether the patient has a history of lifelong depressive episodes."} ;; "history of lifelong depressive episodes"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not (and
            (> patient_ham_d_hamilton_rating_scale_for_depression_score_value_recorded_now_withunit_score 16)
            patient_has_history_of_lifelong_depressive_episodes))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a Hamilton Depression Scale score > sixteen) AND (the patient has a history of lifelong depressive episodes))."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a cardiac condition (heart disease).","when_to_set_to_false":"Set to false if the patient currently does not have a cardiac condition (heart disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a cardiac condition (heart disease).","meaning":"Boolean indicating whether the patient currently has a cardiac condition (heart disease) now."} ;; "cardiac condition"
(declare-const patient_has_finding_of_heart_disease_now@@clinically_relevant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current cardiac condition (heart disease) is clinically relevant.","when_to_set_to_false":"Set to false if the patient's current cardiac condition (heart disease) is not clinically relevant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current cardiac condition (heart disease) is clinically relevant.","meaning":"Boolean indicating whether the patient's current cardiac condition (heart disease) is clinically relevant."} ;; "clinically relevant cardiac condition"
(declare-const patient_has_finding_of_heart_disease_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current cardiac condition (heart disease) is uncontrolled.","when_to_set_to_false":"Set to false if the patient's current cardiac condition (heart disease) is controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current cardiac condition (heart disease) is uncontrolled.","meaning":"Boolean indicating whether the patient's current cardiac condition (heart disease) is uncontrolled."} ;; "uncontrolled cardiac condition"

(declare-const patient_has_finding_of_disorder_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a pulmonary condition (disorder of lung).","when_to_set_to_false":"Set to false if the patient currently does not have a pulmonary condition (disorder of lung).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a pulmonary condition (disorder of lung).","meaning":"Boolean indicating whether the patient currently has a pulmonary condition (disorder of lung) now."} ;; "pulmonary condition"
(declare-const patient_has_finding_of_disorder_of_lung_now@@clinically_relevant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pulmonary condition (disorder of lung) is clinically relevant.","when_to_set_to_false":"Set to false if the patient's current pulmonary condition (disorder of lung) is not clinically relevant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pulmonary condition (disorder of lung) is clinically relevant.","meaning":"Boolean indicating whether the patient's current pulmonary condition (disorder of lung) is clinically relevant."} ;; "clinically relevant pulmonary condition"
(declare-const patient_has_finding_of_disorder_of_lung_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pulmonary condition (disorder of lung) is uncontrolled.","when_to_set_to_false":"Set to false if the patient's current pulmonary condition (disorder of lung) is controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pulmonary condition (disorder of lung) is uncontrolled.","meaning":"Boolean indicating whether the patient's current pulmonary condition (disorder of lung) is uncontrolled."} ;; "uncontrolled pulmonary condition"

(declare-const patient_has_finding_of_hypothyroidism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hypothyroid condition (hypothyroidism).","when_to_set_to_false":"Set to false if the patient currently does not have a hypothyroid condition (hypothyroidism).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hypothyroid condition (hypothyroidism).","meaning":"Boolean indicating whether the patient currently has a hypothyroid condition (hypothyroidism) now."} ;; "hypothyroid condition"
(declare-const patient_has_finding_of_hypothyroidism_now@@clinically_relevant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hypothyroid condition (hypothyroidism) is clinically relevant.","when_to_set_to_false":"Set to false if the patient's current hypothyroid condition (hypothyroidism) is not clinically relevant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hypothyroid condition (hypothyroidism) is clinically relevant.","meaning":"Boolean indicating whether the patient's current hypothyroid condition (hypothyroidism) is clinically relevant."} ;; "clinically relevant hypothyroid condition"
(declare-const patient_has_finding_of_hypothyroidism_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hypothyroid condition (hypothyroidism) is uncontrolled.","when_to_set_to_false":"Set to false if the patient's current hypothyroid condition (hypothyroidism) is controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hypothyroid condition (hypothyroidism) is uncontrolled.","meaning":"Boolean indicating whether the patient's current hypothyroid condition (hypothyroidism) is uncontrolled."} ;; "uncontrolled hypothyroid condition"

(declare-const patient_has_finding_of_hematological_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hematological condition.","when_to_set_to_false":"Set to false if the patient currently does not have a hematological condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hematological condition.","meaning":"Boolean indicating whether the patient currently has a hematological condition now."} ;; "hematological condition"
(declare-const patient_has_finding_of_hematological_condition_now@@clinically_relevant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hematological condition is clinically relevant.","when_to_set_to_false":"Set to false if the patient's current hematological condition is not clinically relevant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hematological condition is clinically relevant.","meaning":"Boolean indicating whether the patient's current hematological condition is clinically relevant."} ;; "clinically relevant hematological condition"
(declare-const patient_has_finding_of_hematological_condition_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hematological condition is uncontrolled.","when_to_set_to_false":"Set to false if the patient's current hematological condition is controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hematological condition is uncontrolled.","meaning":"Boolean indicating whether the patient's current hematological condition is uncontrolled."} ;; "uncontrolled hematological condition"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_heart_disease_now@@clinically_relevant
      patient_has_finding_of_heart_disease_now)
:named REQ6_AUXILIARY0)) ;; "clinically relevant cardiac condition"

(assert
(! (=> patient_has_finding_of_heart_disease_now@@uncontrolled
      patient_has_finding_of_heart_disease_now)
:named REQ6_AUXILIARY1)) ;; "uncontrolled cardiac condition"

(assert
(! (=> patient_has_finding_of_disorder_of_lung_now@@clinically_relevant
      patient_has_finding_of_disorder_of_lung_now)
:named REQ6_AUXILIARY2)) ;; "clinically relevant pulmonary condition"

(assert
(! (=> patient_has_finding_of_disorder_of_lung_now@@uncontrolled
      patient_has_finding_of_disorder_of_lung_now)
:named REQ6_AUXILIARY3)) ;; "uncontrolled pulmonary condition"

(assert
(! (=> patient_has_finding_of_hypothyroidism_now@@clinically_relevant
      patient_has_finding_of_hypothyroidism_now)
:named REQ6_AUXILIARY4)) ;; "clinically relevant hypothyroid condition"

(assert
(! (=> patient_has_finding_of_hypothyroidism_now@@uncontrolled
      patient_has_finding_of_hypothyroidism_now)
:named REQ6_AUXILIARY5)) ;; "uncontrolled hypothyroid condition"

(assert
(! (=> patient_has_finding_of_hematological_condition_now@@clinically_relevant
      patient_has_finding_of_hematological_condition_now)
:named REQ6_AUXILIARY6)) ;; "clinically relevant hematological condition"

(assert
(! (=> patient_has_finding_of_hematological_condition_now@@uncontrolled
      patient_has_finding_of_hematological_condition_now)
:named REQ6_AUXILIARY7)) ;; "uncontrolled hematological condition"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (and patient_has_finding_of_heart_disease_now@@clinically_relevant
             patient_has_finding_of_heart_disease_now@@uncontrolled))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of clinically relevant AND uncontrolled cardiac condition."

(assert
(! (not (and patient_has_finding_of_disorder_of_lung_now@@clinically_relevant
             patient_has_finding_of_disorder_of_lung_now@@uncontrolled))
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of clinically relevant AND uncontrolled pulmonary condition."

(assert
(! (not (and patient_has_finding_of_hypothyroidism_now@@clinically_relevant
             patient_has_finding_of_hypothyroidism_now@@uncontrolled))
:named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of clinically relevant AND uncontrolled hypothyroid condition."

(assert
(! (not (and patient_has_finding_of_hematological_condition_now@@clinically_relevant
             patient_has_finding_of_hematological_condition_now@@uncontrolled))
:named REQ6_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of clinically relevant AND uncontrolled hematological condition."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_physical_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a physical impairment.","when_to_set_to_false":"Set to false if the patient currently does not have a physical impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a physical impairment.","meaning":"Boolean indicating whether the patient currently has a physical impairment."} ;; "physical impairment"
(declare-const patient_has_finding_of_physical_impairment_now@@of_such_severity_as_to_adversely_affect_validity_of_psychological_testing Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current physical impairment is of such severity as to adversely affect the validity of psychological testing.","when_to_set_to_false":"Set to false if the patient's current physical impairment is not of such severity as to adversely affect the validity of psychological testing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current physical impairment is of such severity as to adversely affect the validity of psychological testing.","meaning":"Boolean indicating whether the patient's current physical impairment is of such severity as to adversely affect the validity of psychological testing."} ;; "physical impairment of such severity as to adversely affect the validity of psychological testing"
(declare-const patient_is_undergoing_psychologic_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing psychological testing.","when_to_set_to_false":"Set to false if the patient is currently not undergoing psychological testing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing psychological testing.","meaning":"Boolean indicating whether the patient is currently undergoing psychological testing."} ;; "psychological testing"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_physical_impairment_now@@of_such_severity_as_to_adversely_affect_validity_of_psychological_testing
      patient_has_finding_of_physical_impairment_now)
:named REQ7_AUXILIARY0)) ;; "physical impairment of such severity as to adversely affect the validity of psychological testing"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_physical_impairment_now@@of_such_severity_as_to_adversely_affect_validity_of_psychological_testing)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a physical impairment of such severity as to adversely affect the validity of psychological testing."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_hostile_behavior_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exhibiting hostile behavior.","when_to_set_to_false":"Set to false if the patient is currently not exhibiting hostile behavior.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exhibiting hostile behavior.","meaning":"Boolean indicating whether the patient is currently exhibiting hostile behavior."} ;; "hostile"
(declare-const patient_refuses_to_cooperate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently refusing to cooperate.","when_to_set_to_false":"Set to false if the patient is currently not refusing to cooperate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently refusing to cooperate.","meaning":"Boolean indicating whether the patient is currently refusing to cooperate."} ;; "refuses to cooperate"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (or patient_has_finding_of_hostile_behavior_now
            patient_refuses_to_cooperate_now))
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is hostile OR the patient refuses to cooperate."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_prosthetic_device_that_constitutes_hazard_for_magnetic_resonance_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any prosthetic device that constitutes a hazard for magnetic resonance imaging.","when_to_set_to_false":"Set to false if the patient currently does not have any prosthetic device that constitutes a hazard for magnetic resonance imaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any prosthetic device that constitutes a hazard for magnetic resonance imaging.","meaning":"Boolean indicating whether the patient currently has any prosthetic device that constitutes a hazard for magnetic resonance imaging."} ;; "any prosthetic device that constitutes a hazard for magnetic resonance imaging"

(declare-const patient_has_pacemaker_that_constitutes_hazard_for_magnetic_resonance_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a pacemaker that constitutes a hazard for magnetic resonance imaging.","when_to_set_to_false":"Set to false if the patient currently does not have a pacemaker that constitutes a hazard for magnetic resonance imaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a pacemaker that constitutes a hazard for magnetic resonance imaging.","meaning":"Boolean indicating whether the patient currently has a pacemaker that constitutes a hazard for magnetic resonance imaging."} ;; "pacemaker that constitutes a hazard for magnetic resonance imaging"

(declare-const patient_has_surgical_clip_that_constitutes_hazard_for_magnetic_resonance_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a surgical clip that constitutes a hazard for magnetic resonance imaging.","when_to_set_to_false":"Set to false if the patient currently does not have a surgical clip that constitutes a hazard for magnetic resonance imaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a surgical clip that constitutes a hazard for magnetic resonance imaging.","meaning":"Boolean indicating whether the patient currently has a surgical clip that constitutes a hazard for magnetic resonance imaging."} ;; "surgical clip that constitutes a hazard for magnetic resonance imaging"

(declare-const patient_is_undergoing_magnetic_resonance_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing magnetic resonance imaging.","when_to_set_to_false":"Set to false if the patient is currently not undergoing magnetic resonance imaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing magnetic resonance imaging.","meaning":"Boolean indicating whether the patient is currently undergoing magnetic resonance imaging."} ;; "magnetic resonance imaging"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_pacemaker_that_constitutes_hazard_for_magnetic_resonance_imaging_now
           patient_has_surgical_clip_that_constitutes_hazard_for_magnetic_resonance_imaging_now)
       patient_has_prosthetic_device_that_constitutes_hazard_for_magnetic_resonance_imaging_now)
:named REQ9_AUXILIARY0)) ;; "with non-exhaustive examples (pacemaker, surgical clip)"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_prosthetic_device_that_constitutes_hazard_for_magnetic_resonance_imaging_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any prosthetic device with non-exhaustive examples (pacemaker, surgical clip) that constitutes a hazard for magnetic resonance imaging."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const first_degree_family_member_has_diagnosis_of_dementia_ever Bool) ;; {"when_to_set_to_true":"Set to true if at least one first-degree family member of the patient has ever been diagnosed with dementia.","when_to_set_to_false":"Set to false if no first-degree family member of the patient has ever been diagnosed with dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether any first-degree family member of the patient has ever been diagnosed with dementia.","meaning":"Boolean indicating whether at least one first-degree family member of the patient has ever been diagnosed with dementia."} ;; "at least one first-degree family member with dementia"

(declare-const first_degree_family_member_has_diagnosis_of_dementia_ever@@onset_age_value_recorded_in_years Real) ;; {"when_to_set_to_value":"Set to the age in years at which the first-degree family member was diagnosed with dementia, if known.","when_to_set_to_null":"Set to null if the age at onset of dementia for the first-degree family member is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the age in years at which the first-degree family member was diagnosed with dementia."} ;; "onset age < 65 years for first-degree family member with dementia"

(declare-const patient_has_diagnosis_of_presenile_dementia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the index patient has ever been diagnosed with presenile dementia (early onset dementia) at any point in their history.","when_to_set_to_false":"Set to false if the index patient has never been diagnosed with presenile dementia (early onset dementia) at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the index patient has ever been diagnosed with presenile dementia (early onset dementia).","meaning":"Boolean indicating whether the index patient has ever been diagnosed with presenile dementia (early onset dementia) at any point in their history."} ;; "early onset dementia in patient"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not (and first_degree_family_member_has_diagnosis_of_dementia_ever
             (< first_degree_family_member_has_diagnosis_of_dementia_ever@@onset_age_value_recorded_in_years 65)))
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has at least one first-degree family member with early onset dementia (onset age < 65 years)."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking or exposed to any drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not taking or exposed to any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking or exposed to any drug or medicament.","meaning":"Boolean indicating whether the patient is currently exposed to any drug or medicament."} ;; "medication"
(declare-const patient_is_exposed_to_drug_or_medicament_now@@adversely_affecting_cognition Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient is currently exposed to is known to adversely affect cognition.","when_to_set_to_false":"Set to false if the drug or medicament the patient is currently exposed to does not adversely affect cognition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament adversely affects cognition.","meaning":"Boolean indicating whether the drug or medicament the patient is currently exposed to adversely affects cognition."} ;; "medication adversely affecting cognition"
(declare-const patient_is_exposed_to_antidepressant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking or exposed to any antidepressant.","when_to_set_to_false":"Set to false if the patient is currently not taking or exposed to any antidepressant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking or exposed to any antidepressant.","meaning":"Boolean indicating whether the patient is currently exposed to any antidepressant."} ;; "antidepressant"
(declare-const patient_is_exposed_to_antidepressant_now@@has_anticholinergic_properties Bool) ;; {"when_to_set_to_true":"Set to true if the antidepressant the patient is currently exposed to has anticholinergic properties.","when_to_set_to_false":"Set to false if the antidepressant the patient is currently exposed to does not have anticholinergic properties.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antidepressant has anticholinergic properties.","meaning":"Boolean indicating whether the antidepressant the patient is currently exposed to has anticholinergic properties."} ;; "antidepressant with anticholinergic properties"
(declare-const patient_is_taking_opioid_receptor_agonist_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any opioid receptor agonist containing product (narcotic analgesic).","when_to_set_to_false":"Set to false if the patient is currently not taking any opioid receptor agonist containing product (narcotic analgesic).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any opioid receptor agonist containing product (narcotic analgesic).","meaning":"Boolean indicating whether the patient is currently taking any opioid receptor agonist containing product (narcotic analgesic)."} ;; "narcotic analgesic"
(declare-const patient_is_taking_opioid_receptor_agonist_containing_product_now@@regular_use_frequency_greater_than_2_doses_per_week Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any opioid receptor agonist containing product (narcotic analgesic) regularly at a frequency greater than 2 doses per week.","when_to_set_to_false":"Set to false if the patient is currently taking any opioid receptor agonist containing product (narcotic analgesic) at a frequency of 2 doses per week or less, or not regularly.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is taking any opioid receptor agonist containing product (narcotic analgesic) regularly at a frequency greater than 2 doses per week.","meaning":"Boolean indicating whether the patient is currently taking any opioid receptor agonist containing product (narcotic analgesic) regularly at a frequency greater than 2 doses per week."} ;; "regular use of narcotic analgesic (use frequency > 2 doses per week)"
(declare-const patient_is_exposed_to_anti_psychotic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking or exposed to any anti-psychotic agent (neuroleptic).","when_to_set_to_false":"Set to false if the patient is currently not taking or exposed to any anti-psychotic agent (neuroleptic).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking or exposed to any anti-psychotic agent (neuroleptic).","meaning":"Boolean indicating whether the patient is currently exposed to any anti-psychotic agent (neuroleptic)."} ;; "neuroleptic"
(declare-const patient_is_exposed_to_anti_psychotic_agent_now@@has_anticholinergic_properties Bool) ;; {"when_to_set_to_true":"Set to true if the anti-psychotic agent (neuroleptic) the patient is currently exposed to has anticholinergic properties.","when_to_set_to_false":"Set to false if the anti-psychotic agent (neuroleptic) the patient is currently exposed to does not have anticholinergic properties.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the anti-psychotic agent (neuroleptic) has anticholinergic properties.","meaning":"Boolean indicating whether the anti-psychotic agent (neuroleptic) the patient is currently exposed to has anticholinergic properties."} ;; "neuroleptic with anticholinergic properties"
(declare-const patient_is_exposed_to_drug_or_medicament_now@@has_central_nervous_system_anticholinergic_activity Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient is currently exposed to has central nervous system anticholinergic activity.","when_to_set_to_false":"Set to false if the drug or medicament the patient is currently exposed to does not have central nervous system anticholinergic activity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament has central nervous system anticholinergic activity.","meaning":"Boolean indicating whether the drug or medicament the patient is currently exposed to has central nervous system anticholinergic activity."} ;; "other medication with central nervous system anticholinergic activity"
(declare-const patient_is_exposed_to_antiparkinsonian_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking or exposed to any antiparkinsonian agent.","when_to_set_to_false":"Set to false if the patient is currently not taking or exposed to any antiparkinsonian agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking or exposed to any antiparkinsonian agent.","meaning":"Boolean indicating whether the patient is currently exposed to any antiparkinsonian agent."} ;; "antiparkinsonian medication"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_is_exposed_to_antidepressant_now@@has_anticholinergic_properties
           patient_is_taking_opioid_receptor_agonist_containing_product_now@@regular_use_frequency_greater_than_2_doses_per_week
           patient_is_exposed_to_anti_psychotic_agent_now@@has_anticholinergic_properties
           patient_is_exposed_to_drug_or_medicament_now@@has_central_nervous_system_anticholinergic_activity
           patient_is_exposed_to_antiparkinsonian_agent_now)
    patient_is_exposed_to_drug_or_medicament_now@@adversely_affecting_cognition)
:named REQ11_AUXILIARY0)) ;; "with non-exhaustive examples ((antidepressant with anticholinergic properties) OR (regular use of narcotic analgesic (use frequency > 2 doses per week)) OR (neuroleptic with anticholinergic properties) OR (other medication with central nervous system anticholinergic activity) OR (antiparkinsonian medication))."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_antidepressant_now@@has_anticholinergic_properties
      patient_is_exposed_to_antidepressant_now)
:named REQ11_AUXILIARY1)) ;; "antidepressant with anticholinergic properties"

(assert
(! (=> patient_is_taking_opioid_receptor_agonist_containing_product_now@@regular_use_frequency_greater_than_2_doses_per_week
      patient_is_taking_opioid_receptor_agonist_containing_product_now)
:named REQ11_AUXILIARY2)) ;; "regular use of narcotic analgesic (use frequency > 2 doses per week)"

(assert
(! (=> patient_is_exposed_to_anti_psychotic_agent_now@@has_anticholinergic_properties
      patient_is_exposed_to_anti_psychotic_agent_now)
:named REQ11_AUXILIARY3)) ;; "neuroleptic with anticholinergic properties"

(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@has_central_nervous_system_anticholinergic_activity
      patient_is_exposed_to_drug_or_medicament_now)
:named REQ11_AUXILIARY4)) ;; "other medication with central nervous system anticholinergic activity"

;; Qualifier variable for umbrella term implies stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@adversely_affecting_cognition
      patient_is_exposed_to_drug_or_medicament_now)
:named REQ11_AUXILIARY5)) ;; "medication adversely affecting cognition"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_is_exposed_to_drug_or_medicament_now@@adversely_affecting_cognition)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking at least one medication adversely affecting cognition with non-exhaustive examples..."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const number_of_physician_ordered_or_off_label_memory_enhancing_medications_taken_at_baseline Real) ;; {"when_to_set_to_value":"Set to the number of physician-ordered or off-label memory enhancing medications the patient is taking at baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many physician-ordered or off-label memory enhancing medications the patient is taking at baseline.","meaning":"Numeric value indicating the number of physician-ordered or off-label memory enhancing medications the patient is taking at baseline."} ;; "at least one physician-ordered or off-label memory enhancing medication at baseline"
(declare-const patient_is_exposed_to_acetylcholinesterase_inhibitor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking or otherwise exposed to an acetylcholinesterase inhibitor.","when_to_set_to_false":"Set to false if the patient is currently not taking or exposed to an acetylcholinesterase inhibitor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to an acetylcholinesterase inhibitor.","meaning":"Boolean indicating whether the patient is currently exposed to an acetylcholinesterase inhibitor."} ;; "cholinesterase inhibitor"
(declare-const patient_is_exposed_to_ginkgo_biloba_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking or otherwise exposed to ginkgo biloba.","when_to_set_to_false":"Set to false if the patient is currently not taking or exposed to ginkgo biloba.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to ginkgo biloba.","meaning":"Boolean indicating whether the patient is currently exposed to ginkgo biloba."} ;; "ginkgo biloba"
(declare-const patient_is_exposed_to_memantine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking or otherwise exposed to memantine.","when_to_set_to_false":"Set to false if the patient is currently not taking or exposed to memantine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to memantine.","meaning":"Boolean indicating whether the patient is currently exposed to memantine."} ;; "memantine"
(declare-const patient_is_exposed_to_vitamin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking or otherwise exposed to vitamins.","when_to_set_to_false":"Set to false if the patient is currently not taking or exposed to vitamins.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to vitamins.","meaning":"Boolean indicating whether the patient is currently exposed to vitamins."} ;; "vitamins"
(declare-const patient_is_exposed_to_vitamin_now@@used_as_over_the_counter_memory_enhancing_or_memory_protecting_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to vitamins and these vitamins are being used as over-the-counter memory enhancing or memory protecting medication.","when_to_set_to_false":"Set to false if the patient is currently exposed to vitamins but they are not being used as over-the-counter memory enhancing or memory protecting medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the vitamins are being used as over-the-counter memory enhancing or memory protecting medication.","meaning":"Boolean indicating that the patient's current exposure to vitamins is specifically for over-the-counter memory enhancing or memory protecting purposes."} ;; "vitamins used as over-the-counter memory enhancing or memory protecting medication"
(declare-const patient_is_taking_cognitive_enhancing_medication_at_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the patient is taking at least one cognitive enhancing medication at baseline.","when_to_set_to_false":"Set to false if the patient is not taking any cognitive enhancing medication at baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is taking any cognitive enhancing medication at baseline.","meaning":"Boolean indicating whether the patient is taking at least one cognitive enhancing medication at baseline."} ;; "other cognitive enhancing medication at baseline"
(declare-const patient_is_taking_memory_enhancing_medication_at_baseline@@physician_ordered_or_off_label Bool) ;; {"when_to_set_to_true":"Set to true if the patient is taking at least one physician-ordered or off-label memory enhancing medication at baseline.","when_to_set_to_false":"Set to false if the patient is not taking any physician-ordered or off-label memory enhancing medication at baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is taking any physician-ordered or off-label memory enhancing medication at baseline.","meaning":"Boolean indicating whether the patient is taking at least one physician-ordered or off-label memory enhancing medication at baseline."} ;; "physician-ordered or off-label memory enhancing medication at baseline"
(declare-const patient_is_taking_memory_protecting_medication_at_baseline@@over_the_counter Bool) ;; {"when_to_set_to_true":"Set to true if the patient is taking only over-the-counter memory enhancing or memory protecting medication at baseline.","when_to_set_to_false":"Set to false if the patient is taking any non-over-the-counter memory enhancing or memory protecting medication at baseline, or is not taking any such medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is taking only over-the-counter memory enhancing or memory protecting medication at baseline.","meaning":"Boolean indicating whether the patient is taking only over-the-counter memory enhancing or memory protecting medication at baseline."} ;; "only over-the-counter memory enhancing or memory protecting medication at baseline"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Non-exhaustive examples for physician-ordered/off-label memory enhancing medication
(assert
(! (=> (or patient_is_exposed_to_acetylcholinesterase_inhibitor_now
           patient_is_exposed_to_memantine_now)
       patient_is_taking_memory_enhancing_medication_at_baseline@@physician_ordered_or_off_label)
:named REQ12_AUXILIARY0)) ;; "with non-exhaustive examples (cholinesterase inhibitor, memantine)"

;; Non-exhaustive examples for over-the-counter memory enhancing/protecting medication
(assert
(! (=> (or patient_is_exposed_to_ginkgo_biloba_now
           patient_is_exposed_to_vitamin_now@@used_as_over_the_counter_memory_enhancing_or_memory_protecting_medication)
       patient_is_taking_memory_protecting_medication_at_baseline@@over_the_counter)
:named REQ12_AUXILIARY1)) ;; "with non-exhaustive examples (ginkgo biloba, vitamins)"

;; Physician-ordered/off-label memory enhancing medication at baseline is true if at least one is taken
(assert
(! (= patient_is_taking_memory_enhancing_medication_at_baseline@@physician_ordered_or_off_label
      (> number_of_physician_ordered_or_off_label_memory_enhancing_medications_taken_at_baseline 0))
:named REQ12_AUXILIARY2)) ;; "at least one physician-ordered or off-label memory enhancing medication at baseline"

;; ===================== Constraint Assertions (REQ 12) =====================
;; Exclusion: patient is excluded if, at baseline, taking at least one physician-ordered or off-label memory enhancing medication OR other cognitive enhancing medication
;; but NOT excluded if only taking over-the-counter memory enhancing or memory protecting medication
(assert
(! (not (or patient_is_taking_memory_enhancing_medication_at_baseline@@physician_ordered_or_off_label
            patient_is_taking_cognitive_enhancing_medication_at_baseline))
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if, at baseline, the patient is taking at least one physician-ordered or off-label memory enhancing medication or other cognitive enhancing medication..."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_significant_physical_change_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a significant physical change.","when_to_set_to_false":"Set to false if the patient currently does not have a significant physical change.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a significant physical change.","meaning":"Boolean indicating whether the patient currently has a significant physical change."} ;; "significant physical change"
(declare-const patient_has_significant_physical_change_now@@may_affect_magnetic_resonance_imaging_blood_flow_measures Bool) ;; {"when_to_set_to_true":"Set to true if the patient's significant physical change may affect magnetic resonance imaging blood flow measures.","when_to_set_to_false":"Set to false if the patient's significant physical change does not affect magnetic resonance imaging blood flow measures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's significant physical change may affect magnetic resonance imaging blood flow measures.","meaning":"Boolean indicating whether the patient's significant physical change may affect MRI blood flow measures."} ;; "significant physical change ... that may affect the magnetic resonance imaging blood flow measures"
(declare-const patient_has_undergone_amputation_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone amputation at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone amputation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone amputation.","meaning":"Boolean indicating whether the patient has undergone amputation in the past."} ;; "amputation"
(declare-const patient_has_undergone_amputation_inthehistory@@may_affect_magnetic_resonance_imaging_blood_flow_measures Bool) ;; {"when_to_set_to_true":"Set to true if the patient's amputation may affect magnetic resonance imaging blood flow measures.","when_to_set_to_false":"Set to false if the patient's amputation does not affect magnetic resonance imaging blood flow measures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's amputation may affect magnetic resonance imaging blood flow measures.","meaning":"Boolean indicating whether the patient's amputation may affect MRI blood flow measures."} ;; "amputation ... that may affect the magnetic resonance imaging blood flow measures"
(declare-const patient_has_finding_of_absence_of_sensation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of absence of sensation (loss of sensory input).","when_to_set_to_false":"Set to false if the patient currently does not have a finding of absence of sensation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of absence of sensation.","meaning":"Boolean indicating whether the patient currently has a finding of absence of sensation (loss of sensory input)."} ;; "loss of sensory input"
(declare-const patient_has_finding_of_absence_of_sensation_now@@may_affect_magnetic_resonance_imaging_blood_flow_measures Bool) ;; {"when_to_set_to_true":"Set to true if the patient's absence of sensation may affect magnetic resonance imaging blood flow measures.","when_to_set_to_false":"Set to false if the patient's absence of sensation does not affect magnetic resonance imaging blood flow measures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's absence of sensation may affect magnetic resonance imaging blood flow measures.","meaning":"Boolean indicating whether the patient's absence of sensation may affect MRI blood flow measures."} ;; "loss of sensory input ... that may affect the magnetic resonance imaging blood flow measures"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_undergone_amputation_inthehistory@@may_affect_magnetic_resonance_imaging_blood_flow_measures
           patient_has_finding_of_absence_of_sensation_now@@may_affect_magnetic_resonance_imaging_blood_flow_measures)
    patient_has_significant_physical_change_now@@may_affect_magnetic_resonance_imaging_blood_flow_measures)
:named REQ13_AUXILIARY0)) ;; "with non-exhaustive examples (amputation, loss of sensory input) that may affect the magnetic resonance imaging blood flow measures."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_significant_physical_change_now@@may_affect_magnetic_resonance_imaging_blood_flow_measures
      patient_has_significant_physical_change_now)
:named REQ13_AUXILIARY1)) ;; "significant physical change ... that may affect the magnetic resonance imaging blood flow measures"

(assert
(! (=> patient_has_undergone_amputation_inthehistory@@may_affect_magnetic_resonance_imaging_blood_flow_measures
      patient_has_undergone_amputation_inthehistory)
:named REQ13_AUXILIARY2)) ;; "amputation ... that may affect the magnetic resonance imaging blood flow measures"

(assert
(! (=> patient_has_finding_of_absence_of_sensation_now@@may_affect_magnetic_resonance_imaging_blood_flow_measures
      patient_has_finding_of_absence_of_sensation_now)
:named REQ13_AUXILIARY3)) ;; "loss of sensory input ... that may affect the magnetic resonance imaging blood flow measures"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_significant_physical_change_now@@may_affect_magnetic_resonance_imaging_blood_flow_measures)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant physical change with non-exhaustive examples (amputation, loss of sensory input) that may affect the magnetic resonance imaging blood flow measures."
