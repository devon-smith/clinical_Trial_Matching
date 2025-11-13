;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_significant_neurological_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any significant neurological disease, regardless of specific diagnosis.","when_to_set_to_false":"Set to false if the patient currently does not have any significant neurological disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any significant neurological disease.","meaning":"Boolean indicating whether the patient currently has any significant neurological disease."} ;; "any significant neurological disease"

(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Alzheimer's disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Alzheimer's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Alzheimer's disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Alzheimer's disease."} ;; "Alzheimer's disease"

(declare-const patient_has_diagnosis_of_parkinson_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Parkinson's disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Parkinson's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Parkinson's disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Parkinson's disease."} ;; "Parkinson's disease"

(declare-const patient_has_diagnosis_of_vascular_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of vascular dementia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of vascular dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of vascular dementia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of vascular dementia."} ;; "vascular dementia"

(declare-const patient_has_diagnosis_of_huntington_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Huntington's disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Huntington's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Huntington's disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Huntington's disease."} ;; "Huntington's disease"

(declare-const patient_has_diagnosis_of_pick_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Pick's disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Pick's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Pick's disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Pick's disease."} ;; "Pick's disease"

(declare-const patient_has_diagnosis_of_lewy_body_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Lewy body dementia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Lewy body dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Lewy body dementia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Lewy body dementia."} ;; "Lewy body dementia"

(declare-const patient_has_diagnosis_of_frontotemporal_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of frontotemporal dementia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of frontotemporal dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of frontotemporal dementia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of frontotemporal dementia."} ;; "frontotemporal dementia"

(declare-const patient_has_diagnosis_of_normal_pressure_hydrocephalus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of normal pressure hydrocephalus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of normal pressure hydrocephalus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of normal pressure hydrocephalus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of normal pressure hydrocephalus."} ;; "normal pressure hydrocephalus"

(declare-const patient_has_diagnosis_of_brain_tumor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of brain tumor.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of brain tumor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of brain tumor.","meaning":"Boolean indicating whether the patient currently has a diagnosis of brain tumor."} ;; "brain tumor"

(declare-const patient_has_diagnosis_of_progressive_supranuclear_palsy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of progressive supranuclear palsy.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of progressive supranuclear palsy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of progressive supranuclear palsy.","meaning":"Boolean indicating whether the patient currently has a diagnosis of progressive supranuclear palsy."} ;; "progressive supranuclear palsy"

(declare-const patient_has_diagnosis_of_progressive_supranuclear_palsy_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of progressive supranuclear palsy and the disease is significant.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of progressive supranuclear palsy but the disease is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the progressive supranuclear palsy is significant.","meaning":"Boolean indicating whether the patient's progressive supranuclear palsy is significant."} ;; "progressive supranuclear palsy and the disease is significant"

(declare-const patient_has_diagnosis_of_seizure_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of seizure disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of seizure disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of seizure disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of seizure disorder."} ;; "seizure disorder"

(declare-const patient_has_diagnosis_of_seizure_disorder_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of seizure disorder and the disorder is significant.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of seizure disorder but the disorder is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the seizure disorder is significant.","meaning":"Boolean indicating whether the patient's seizure disorder is significant."} ;; "seizure disorder and the disorder is significant"

(declare-const patient_has_diagnosis_of_multiple_sclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of multiple sclerosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of multiple sclerosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of multiple sclerosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of multiple sclerosis."} ;; "multiple sclerosis"

(declare-const patient_has_diagnosis_of_multiple_sclerosis_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of multiple sclerosis and the disease is significant.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of multiple sclerosis but the disease is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the multiple sclerosis is significant.","meaning":"Boolean indicating whether the patient's multiple sclerosis is significant."} ;; "multiple sclerosis and the disease is significant"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_alzheimer_s_disease_now
          patient_has_diagnosis_of_parkinson_s_disease_now
          patient_has_diagnosis_of_vascular_dementia_now
          patient_has_diagnosis_of_huntington_s_disease_now
          patient_has_diagnosis_of_pick_s_disease_now
          patient_has_diagnosis_of_lewy_body_dementia_now
          patient_has_diagnosis_of_frontotemporal_dementia_now
          patient_has_diagnosis_of_normal_pressure_hydrocephalus_now
          patient_has_diagnosis_of_brain_tumor_now
          patient_has_diagnosis_of_progressive_supranuclear_palsy_now@@significant
          patient_has_diagnosis_of_seizure_disorder_now@@significant
          patient_has_diagnosis_of_multiple_sclerosis_now@@significant)
    patient_has_significant_neurological_disease_now)
:named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples ((Alzheimer's disease) OR (Parkinson's disease) OR (vascular dementia) OR (Huntington's disease) OR (Pick's disease) OR (Lewy body dementia) OR (frontotemporal dementia) OR (normal pressure hydrocephalus) OR (brain tumor) OR (progressive supranuclear palsy) OR (seizure disorder) OR (multiple sclerosis))."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_progressive_supranuclear_palsy_now@@significant
      patient_has_diagnosis_of_progressive_supranuclear_palsy_now)
:named REQ0_AUXILIARY1)) ;; "progressive supranuclear palsy and the disease is significant"

(assert
(! (=> patient_has_diagnosis_of_seizure_disorder_now@@significant
      patient_has_diagnosis_of_seizure_disorder_now)
:named REQ0_AUXILIARY2)) ;; "seizure disorder and the disorder is significant"

(assert
(! (=> patient_has_diagnosis_of_multiple_sclerosis_now@@significant
      patient_has_diagnosis_of_multiple_sclerosis_now)
:named REQ0_AUXILIARY3)) ;; "multiple sclerosis and the disease is significant"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_significant_neurological_disease_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any significant neurological disease with non-exhaustive examples ((Alzheimer's disease) OR (Parkinson's disease) OR (vascular dementia) OR (Huntington's disease) OR (Pick's disease) OR (Lewy body dementia) OR (frontotemporal dementia) OR (normal pressure hydrocephalus) OR (brain tumor) OR (progressive supranuclear palsy) OR (seizure disorder) OR (multiple sclerosis))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_significant_systemic_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any significant systemic illness.","when_to_set_to_false":"Set to false if the patient currently does not have any significant systemic illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any significant systemic illness.","meaning":"Boolean indicating whether the patient currently has any significant systemic illness."} ;; "any significant systemic illness"
(declare-const patient_has_finding_of_patient_s_condition_unstable_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any unstable medical condition.","when_to_set_to_false":"Set to false if the patient currently does not have any unstable medical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any unstable medical condition.","meaning":"Boolean indicating whether the patient currently has any unstable medical condition."} ;; "any unstable medical condition"
(declare-const patient_has_finding_of_diabetic_poor_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has poorly controlled (uncontrolled) diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have poorly controlled (uncontrolled) diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has poorly controlled (uncontrolled) diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has poorly controlled (uncontrolled) diabetes mellitus."} ;; "uncontrolled diabetes mellitus"
(declare-const patient_has_finding_of_hypothyroidism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypothyroidism.","when_to_set_to_false":"Set to false if the patient currently does not have hypothyroidism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypothyroidism.","meaning":"Boolean indicating whether the patient currently has hypothyroidism."} ;; "hypothyroidism"
(declare-const patient_has_finding_of_hypothyroidism_now@@uncorrected Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypothyroidism and the condition is uncorrected.","when_to_set_to_false":"Set to false if the patient currently has hypothyroidism and the condition is corrected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypothyroidism is uncorrected.","meaning":"Boolean indicating whether the patient's hypothyroidism is uncorrected."} ;; "uncorrected hypothyroidism"
(declare-const patient_has_finding_of_hyperthyroidism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hyperthyroidism.","when_to_set_to_false":"Set to false if the patient currently does not have hyperthyroidism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hyperthyroidism.","meaning":"Boolean indicating whether the patient currently has hyperthyroidism."} ;; "hyperthyroidism"
(declare-const patient_has_finding_of_hyperthyroidism_now@@uncorrected Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hyperthyroidism and the condition is uncorrected.","when_to_set_to_false":"Set to false if the patient currently has hyperthyroidism and the condition is corrected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hyperthyroidism is uncorrected.","meaning":"Boolean indicating whether the patient's hyperthyroidism is uncorrected."} ;; "uncorrected hyperthyroidism"
(declare-const patient_has_finding_of_widespread_metastatic_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has systemic cancer (widespread metastatic malignant neoplastic disease).","when_to_set_to_false":"Set to false if the patient currently does not have systemic cancer (widespread metastatic malignant neoplastic disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has systemic cancer (widespread metastatic malignant neoplastic disease).","meaning":"Boolean indicating whether the patient currently has systemic cancer (widespread metastatic malignant neoplastic disease)."} ;; "systemic cancer"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella terms
(assert
(! (=> (or patient_has_finding_of_diabetic_poor_control_now
           patient_has_finding_of_hypothyroidism_now@@uncorrected
           patient_has_finding_of_hyperthyroidism_now@@uncorrected
           patient_has_finding_of_widespread_metastatic_malignant_neoplastic_disease_now)
        (or patient_has_finding_of_significant_systemic_illness_now
            patient_has_finding_of_patient_s_condition_unstable_now))
   :named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples ((uncontrolled diabetes mellitus) OR (uncorrected hypothyroidism) OR (uncorrected hyperthyroidism) OR (systemic cancer))."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_hypothyroidism_now@@uncorrected
       patient_has_finding_of_hypothyroidism_now)
   :named REQ1_AUXILIARY1)) ;; "uncorrected hypothyroidism"

(assert
(! (=> patient_has_finding_of_hyperthyroidism_now@@uncorrected
       patient_has_finding_of_hyperthyroidism_now)
   :named REQ1_AUXILIARY2)) ;; "uncorrected hyperthyroidism"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (or patient_has_finding_of_significant_systemic_illness_now
            patient_has_finding_of_patient_s_condition_unstable_now))
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has (any significant systemic illness) OR (any unstable medical condition) with non-exhaustive examples ((uncontrolled diabetes mellitus) OR (uncorrected hypothyroidism) OR (uncorrected hyperthyroidism) OR (systemic cancer))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_schizophrenia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with schizophrenia at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with schizophrenia at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with schizophrenia.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of schizophrenia in their history."} ;; "the patient has a history of schizophrenia"
(declare-const patient_has_diagnosis_of_psychosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with psychosis at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with psychosis at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with psychosis.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of psychosis in their history."} ;; "the patient has a history of psychosis"
(declare-const patient_has_diagnosis_of_alcohol_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with alcohol abuse at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with alcohol abuse at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with alcohol abuse.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of alcohol abuse in their history."} ;; "the patient has a history of alcohol abuse"
(declare-const patient_has_diagnosis_of_substance_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with substance abuse at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with substance abuse at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with substance abuse.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of substance abuse in their history."} ;; "the patient has a history of substance abuse"
(declare-const patient_has_diagnosis_of_alcohol_dependence_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been diagnosed with alcohol dependence within the past six months.","when_to_set_to_false":"Set to false if the patient has not been diagnosed with alcohol dependence within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been diagnosed with alcohol dependence within the past six months.","meaning":"Boolean indicating whether the patient has had a diagnosis of alcohol dependence within the past six months."} ;; "the patient has a history of alcohol dependence within the past six months"
(declare-const patient_has_diagnosis_of_psychoactive_substance_dependence_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been diagnosed with psychoactive substance dependence within the past six months.","when_to_set_to_false":"Set to false if the patient has not been diagnosed with psychoactive substance dependence within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been diagnosed with psychoactive substance dependence within the past six months.","meaning":"Boolean indicating whether the patient has had a diagnosis of psychoactive substance dependence within the past six months."} ;; "the patient has a history of substance dependence within the past six months"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (or patient_has_diagnosis_of_schizophrenia_inthehistory
            patient_has_diagnosis_of_psychosis_inthehistory
            patient_has_diagnosis_of_alcohol_abuse_inthehistory
            patient_has_diagnosis_of_substance_abuse_inthehistory
            patient_has_diagnosis_of_alcohol_dependence_inthepast6months
            patient_has_diagnosis_of_psychoactive_substance_dependence_inthepast6months))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a history of schizophrenia) OR (the patient has a history of psychosis) OR (the patient has a history of alcohol abuse) OR (the patient has a history of substance abuse) OR (the patient has a history of alcohol dependence within the past six months) OR (the patient has a history of substance dependence within the past six months))."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_decreased_liver_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has impairment of liver function.","when_to_set_to_false":"Set to false if the patient currently does not have impairment of liver function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has impairment of liver function.","meaning":"Boolean indicating whether the patient currently has impairment of liver function."} ;; "impairment of liver function"
(declare-const patient_has_finding_of_decreased_liver_function_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's impairment of liver function is clinically significant.","when_to_set_to_false":"Set to false if the patient's impairment of liver function is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the impairment of liver function is clinically significant.","meaning":"Boolean indicating whether the patient's impairment of liver function is clinically significant."} ;; "clinically significant impairment of liver function"
(declare-const patient_has_finding_of_renal_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has impairment of renal function.","when_to_set_to_false":"Set to false if the patient currently does not have impairment of renal function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has impairment of renal function.","meaning":"Boolean indicating whether the patient currently has impairment of renal function."} ;; "impairment of renal function"
(declare-const patient_has_finding_of_renal_impairment_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's impairment of renal function is clinically significant.","when_to_set_to_false":"Set to false if the patient's impairment of renal function is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the impairment of renal function is clinically significant.","meaning":"Boolean indicating whether the patient's impairment of renal function is clinically significant."} ;; "clinically significant impairment of renal function"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_decreased_liver_function_now@@clinically_significant
      patient_has_finding_of_decreased_liver_function_now)
   :named REQ3_AUXILIARY0)) ;; "clinically significant impairment of liver function"

(assert
(! (=> patient_has_finding_of_renal_impairment_now@@clinically_significant
      patient_has_finding_of_renal_impairment_now)
   :named REQ3_AUXILIARY1)) ;; "clinically significant impairment of renal function"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (or patient_has_finding_of_decreased_liver_function_now@@clinically_significant
            patient_has_finding_of_renal_impairment_now@@clinically_significant))
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has clinically significant impairment of liver function) OR (the patient has clinically significant impairment of renal function))."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_significant_cerebrovascular_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has significant cerebrovascular disease.","when_to_set_to_false":"Set to false if the patient currently does not have significant cerebrovascular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has significant cerebrovascular disease.","meaning":"Boolean indicating whether the patient currently has significant cerebrovascular disease."} ;; "significant cerebrovascular disease"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_significant_cerebrovascular_disease_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant cerebrovascular disease."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_reduced_visual_acuity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of reduced visual acuity.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of reduced visual acuity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has reduced visual acuity.","meaning":"Boolean indicating whether the patient currently has reduced visual acuity."} ;; "impairment of visual acuity"
(declare-const patient_has_finding_of_reduced_visual_acuity_now@@sufficient_to_interfere_with_completion_of_study_procedures Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has reduced visual acuity and the impairment is sufficient to interfere with completion of study procedures.","when_to_set_to_false":"Set to false if the patient currently has reduced visual acuity but the impairment is not sufficient to interfere with completion of study procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the impairment is sufficient to interfere with completion of study procedures.","meaning":"Boolean indicating whether the patient's reduced visual acuity is sufficient to interfere with completion of study procedures."} ;; "impairment of visual acuity sufficient to interfere with completion of study procedures"
(declare-const patient_has_finding_of_reduced_auditory_acuity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has reduced auditory acuity.","when_to_set_to_false":"Set to false if the patient currently does not have reduced auditory acuity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has reduced auditory acuity.","meaning":"Boolean indicating whether the patient currently has reduced auditory acuity."} ;; "impairment of auditory acuity"
(declare-const patient_has_finding_of_reduced_auditory_acuity_now@@sufficient_to_interfere_with_completion_of_study_procedures Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has reduced auditory acuity and the impairment is sufficient to interfere with completion of study procedures.","when_to_set_to_false":"Set to false if the patient currently has reduced auditory acuity but the impairment is not sufficient to interfere with completion of study procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the impairment is sufficient to interfere with completion of study procedures.","meaning":"Boolean indicating whether the patient's reduced auditory acuity is sufficient to interfere with completion of study procedures."} ;; "impairment of auditory acuity sufficient to interfere with completion of study procedures"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_reduced_visual_acuity_now@@sufficient_to_interfere_with_completion_of_study_procedures
      patient_has_finding_of_reduced_visual_acuity_now)
:named REQ5_AUXILIARY0)) ;; "impairment of visual acuity sufficient to interfere with completion of study procedures"

(assert
(! (=> patient_has_finding_of_reduced_auditory_acuity_now@@sufficient_to_interfere_with_completion_of_study_procedures
      patient_has_finding_of_reduced_auditory_acuity_now)
:named REQ5_AUXILIARY1)) ;; "impairment of auditory acuity sufficient to interfere with completion of study procedures"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (or patient_has_finding_of_reduced_visual_acuity_now@@sufficient_to_interfere_with_completion_of_study_procedures
            patient_has_finding_of_reduced_auditory_acuity_now@@sufficient_to_interfere_with_completion_of_study_procedures))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has impairment of visual acuity sufficient to interfere with completion of study procedures) OR (the patient has impairment of auditory acuity sufficient to interfere with completion of study procedures))."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_education_level_value_recorded_in_years Real) ;; {"when_to_set_to_value":"Set to the number of years of education completed by the patient, as documented or reported.","when_to_set_to_null":"Set to null if the number of years of education completed by the patient is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's total years of education completed."} ;; "education level less than ten years"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not (< patient_education_level_value_recorded_in_years 10))
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an education level less than ten years."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_torsades_de_pointes_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding or history of risk factors for Torsades de Pointes.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding or history of risk factors for Torsades de Pointes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding or history of risk factors for Torsades de Pointes.","meaning":"Boolean indicating whether the patient has ever had a clinical finding or history of risk factors for Torsades de Pointes."} ;; "the patient has a history of risk factors for Torsades de Pointes"

(declare-const patient_is_taking_drugs_known_to_prolong_qt_interval_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any drugs known to prolong the QT interval.","when_to_set_to_false":"Set to false if the patient is not currently taking any drugs known to prolong the QT interval.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any drugs known to prolong the QT interval.","meaning":"Boolean indicating whether the patient is currently taking any drugs known to prolong the QT interval."} ;; "the patient is taking drugs known to prolong the QT interval"

(declare-const patients_qt_interval_feature_is_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's QT interval is currently abnormal (prolonged).","when_to_set_to_false":"Set to false if the patient's QT interval is currently normal (not prolonged).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's QT interval is currently abnormal (prolonged).","meaning":"Boolean indicating whether the patient's QT interval is currently abnormal (prolonged)."} ;; "QT interval is currently abnormal (prolonged)"

(declare-const patients_qt_interval_feature_is_abnormal_now@@due_to_drugs_known_to_prolong_qt_interval Bool) ;; {"when_to_set_to_true":"Set to true if the patient's QT interval is currently abnormal (prolonged) and this abnormality is specifically due to the patient taking drugs known to prolong the QT interval.","when_to_set_to_false":"Set to false if the patient's QT interval is currently abnormal (prolonged) but not due to drugs known to prolong the QT interval, or if the patient is not taking such drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's QT interval abnormality is due to drugs known to prolong the QT interval.","meaning":"Boolean indicating whether the patient's QT interval abnormality is specifically due to drugs known to prolong the QT interval."} ;; "QT interval abnormality is specifically due to drugs known to prolong the QT interval"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patients_qt_interval_feature_is_abnormal_now@@due_to_drugs_known_to_prolong_qt_interval
       patients_qt_interval_feature_is_abnormal_now)
   :named REQ7_AUXILIARY0)) ;; "QT interval abnormality is specifically due to drugs known to prolong the QT interval" ⇒ "QT interval is currently abnormal (prolonged)"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (or patient_has_finding_of_torsades_de_pointes_inthehistory
            patient_is_taking_drugs_known_to_prolong_qt_interval_now))
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a history of risk factors for Torsades de Pointes) OR (the patient is taking drugs known to prolong the QT interval))."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_number_of_positron_emission_tomography_scans_in_the_past_1_years Real) ;; {"when_to_set_to_value":"Set to the number of positron emission tomography (PET) scans the patient has undergone within the past one year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many positron emission tomography (PET) scans the patient has undergone within the past one year.","meaning":"Numeric value representing the number of positron emission tomography (PET) scans the patient has undergone within the past one year."} ;; "two or more positron emission tomography scans within the past one year"

(declare-const patient_has_undergone_positron_emission_tomography_inthepast1years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone at least one positron emission tomography (PET) scan within the past one year.","when_to_set_to_false":"Set to false if the patient has not undergone any positron emission tomography (PET) scan within the past one year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone positron emission tomography (PET) within the past one year.","meaning":"Boolean indicating whether the patient has undergone positron emission tomography (PET) within the past one year."} ;; "positron emission tomography scans within the past one year"

(declare-const patient_has_significant_exposure_to_radiation_ever Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had significant exposure to radiation.","when_to_set_to_false":"Set to false if the patient has never had significant exposure to radiation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had significant exposure to radiation.","meaning":"Boolean indicating whether the patient has ever had significant exposure to radiation."} ;; "other significant exposure to radiation"

(declare-const patient_has_received_radiation_therapy_ever Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received radiation therapy.","when_to_set_to_false":"Set to false if the patient has never received radiation therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received radiation therapy.","meaning":"Boolean indicating whether the patient has ever received radiation therapy as an example of significant exposure to radiation."} ;; "radiation therapy (non-exhaustive example of significant exposure to radiation)"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Non-exhaustive example: radiation therapy implies significant exposure to radiation
(assert
(! (=> patient_has_received_radiation_therapy_ever
      patient_has_significant_exposure_to_radiation_ever)
    :named REQ8_AUXILIARY0)) ;; "with non-exhaustive examples (radiation therapy)"

;; If patient has undergone any PET scan in the past 1 year, the count must be >= 1
(assert
(! (=> patient_has_undergone_positron_emission_tomography_inthepast1years
      (>= patient_number_of_positron_emission_tomography_scans_in_the_past_1_years 1))
    :named REQ8_AUXILIARY1)) ;; "positron emission tomography scans within the past one year"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion: patient must NOT have (two or more PET scans in past 1 year) OR (other significant exposure to radiation)
(assert
(! (not (or (>= patient_number_of_positron_emission_tomography_scans_in_the_past_1_years 2)
            patient_has_significant_exposure_to_radiation_ever))
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has had two or more positron emission tomography scans within the past one year) OR (the patient has had other significant exposure to radiation with non-exhaustive examples (radiation therapy)))."
