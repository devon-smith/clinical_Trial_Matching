;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_traumatic_and_or_non_traumatic_brain_injury_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of traumatic and/or non-traumatic brain injury.","when_to_set_to_false":"Set to false if the patient does not have a documented history of traumatic and/or non-traumatic brain injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of traumatic and/or non-traumatic brain injury.","meaning":"Boolean indicating whether the patient has a history of traumatic and/or non-traumatic brain injury."} ;; "brain damage (past history)"

(declare-const patient_has_finding_of_cerebral_trauma_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of cerebral trauma.","when_to_set_to_false":"Set to false if the patient does not have a documented history of cerebral trauma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of cerebral trauma.","meaning":"Boolean indicating whether the patient has a history of cerebral trauma."} ;; "significant brain trauma (past history)"

(declare-const patient_has_finding_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of cerebrovascular accident (stroke).","when_to_set_to_false":"Set to false if the patient does not have a documented history of cerebrovascular accident (stroke).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of cerebrovascular accident (stroke).","meaning":"Boolean indicating whether the patient has a history of cerebrovascular accident (stroke)."} ;; "brain stroke (past history)"

(declare-const patient_has_finding_of_hydrocephalus_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hydrocephalus.","when_to_set_to_false":"Set to false if the patient does not have a documented history of hydrocephalus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hydrocephalus.","meaning":"Boolean indicating whether the patient has a history of hydrocephalus."} ;; "brain hydrocephalus (past history)"

(declare-const patient_has_finding_of_lacunar_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of lacunar infarction.","when_to_set_to_false":"Set to false if the patient does not have a documented history of lacunar infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of lacunar infarction.","meaning":"Boolean indicating whether the patient has a history of lacunar infarction."} ;; "brain lacunar infarcts (past history)"

(declare-const patient_has_finding_of_seizure_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of seizure disorder.","when_to_set_to_false":"Set to false if the patient does not have a documented history of seizure disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of seizure disorder.","meaning":"Boolean indicating whether the patient has a history of seizure disorder."} ;; "brain seizures (past history)"

(declare-const patient_has_finding_of_mental_retardation_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of mental retardation.","when_to_set_to_false":"Set to false if the patient does not have a documented history of mental retardation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of mental retardation.","meaning":"Boolean indicating whether the patient has a history of mental retardation."} ;; "mental retardation (past history)"

(declare-const patient_has_finding_of_disorder_of_nervous_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of disorder of the nervous system.","when_to_set_to_false":"Set to false if the patient does not have a documented history of disorder of the nervous system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of disorder of the nervous system.","meaning":"Boolean indicating whether the patient has a history of disorder of the nervous system."} ;; "serious neurological disorder (past history)"

(declare-const patient_has_finding_of_disorder_of_nervous_system_inthehistory@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of disorder of the nervous system is considered serious.","when_to_set_to_false":"Set to false if the patient's history of disorder of the nervous system is not considered serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder of the nervous system is serious.","meaning":"Boolean indicating whether the patient's history of disorder of the nervous system is serious."} ;; "serious neurological disorder (past history)"

(declare-const patient_has_undergone_magnetic_resonance_imaging_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone magnetic resonance imaging.","when_to_set_to_false":"Set to false if the patient has never undergone magnetic resonance imaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone magnetic resonance imaging.","meaning":"Boolean indicating whether the patient has ever undergone magnetic resonance imaging."} ;; "magnetic resonance imaging evidence"

(declare-const patient_has_magnetic_resonance_imaging_evidence_of_mental_retardation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has magnetic resonance imaging evidence of mental retardation.","when_to_set_to_false":"Set to false if the patient does not have magnetic resonance imaging evidence of mental retardation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has magnetic resonance imaging evidence of mental retardation.","meaning":"Boolean indicating whether the patient has magnetic resonance imaging evidence of mental retardation."} ;; "magnetic resonance imaging evidence of mental retardation"

;; ===================== Additional declarations for MRI evidence of other brain damage types =====================
(declare-const patient_has_magnetic_resonance_imaging_evidence_of_cerebral_trauma Bool) ;; {"when_to_set_to_true":"Set to true if the patient has MRI evidence of cerebral trauma.","when_to_set_to_false":"Set to false if the patient does not have MRI evidence of cerebral trauma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has MRI evidence of cerebral trauma.","meaning":"Boolean indicating whether the patient has MRI evidence of cerebral trauma."} ;; "magnetic resonance imaging evidence of significant brain trauma"

(declare-const patient_has_magnetic_resonance_imaging_evidence_of_cerebrovascular_accident Bool) ;; {"when_to_set_to_true":"Set to true if the patient has MRI evidence of cerebrovascular accident (stroke).","when_to_set_to_false":"Set to false if the patient does not have MRI evidence of cerebrovascular accident (stroke).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has MRI evidence of cerebrovascular accident (stroke).","meaning":"Boolean indicating whether the patient has MRI evidence of cerebrovascular accident (stroke)."} ;; "magnetic resonance imaging evidence of brain stroke"

(declare-const patient_has_magnetic_resonance_imaging_evidence_of_hydrocephalus Bool) ;; {"when_to_set_to_true":"Set to true if the patient has MRI evidence of hydrocephalus.","when_to_set_to_false":"Set to false if the patient does not have MRI evidence of hydrocephalus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has MRI evidence of hydrocephalus.","meaning":"Boolean indicating whether the patient has MRI evidence of hydrocephalus."} ;; "magnetic resonance imaging evidence of brain hydrocephalus"

(declare-const patient_has_magnetic_resonance_imaging_evidence_of_lacunar_infarction Bool) ;; {"when_to_set_to_true":"Set to true if the patient has MRI evidence of lacunar infarction.","when_to_set_to_false":"Set to false if the patient does not have MRI evidence of lacunar infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has MRI evidence of lacunar infarction.","meaning":"Boolean indicating whether the patient has MRI evidence of lacunar infarction."} ;; "magnetic resonance imaging evidence of brain lacunar infarcts"

(declare-const patient_has_magnetic_resonance_imaging_evidence_of_seizure_disorder Bool) ;; {"when_to_set_to_true":"Set to true if the patient has MRI evidence of seizure disorder.","when_to_set_to_false":"Set to false if the patient does not have MRI evidence of seizure disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has MRI evidence of seizure disorder.","meaning":"Boolean indicating whether the patient has MRI evidence of seizure disorder."} ;; "magnetic resonance imaging evidence of brain seizures"

(declare-const patient_has_magnetic_resonance_imaging_evidence_of_disorder_of_nervous_system Bool) ;; {"when_to_set_to_true":"Set to true if the patient has MRI evidence of disorder of the nervous system.","when_to_set_to_false":"Set to false if the patient does not have MRI evidence of disorder of the nervous system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has MRI evidence of disorder of the nervous system.","meaning":"Boolean indicating whether the patient has MRI evidence of disorder of the nervous system."} ;; "magnetic resonance imaging evidence of serious neurological disorder"

(declare-const patient_has_magnetic_resonance_imaging_evidence_of_disorder_of_nervous_system@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient's MRI evidence of disorder of the nervous system is considered serious.","when_to_set_to_false":"Set to false if the patient's MRI evidence of disorder of the nervous system is not considered serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder of the nervous system is serious on MRI.","meaning":"Boolean indicating whether the patient's MRI evidence of disorder of the nervous system is serious."} ;; "magnetic resonance imaging evidence of serious neurological disorder"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples imply umbrella term (past history)
(assert
(! (=> (or patient_has_finding_of_cerebral_trauma_inthehistory
           patient_has_finding_of_cerebrovascular_accident_inthehistory
           patient_has_finding_of_hydrocephalus_inthehistory
           patient_has_finding_of_lacunar_infarction_inthehistory
           patient_has_finding_of_seizure_disorder_inthehistory
           patient_has_finding_of_mental_retardation_inthehistory
           patient_has_finding_of_disorder_of_nervous_system_inthehistory@@serious)
        patient_has_finding_of_traumatic_and_or_non_traumatic_brain_injury_inthehistory)
:named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples (significant brain trauma, brain stroke, brain hydrocephalus, brain lacunar infarcts, brain seizures, mental retardation, serious neurological disorder) (past history)"

;; Qualifier variables imply corresponding stem variables (past history)
(assert
(! (=> patient_has_finding_of_disorder_of_nervous_system_inthehistory@@serious
       patient_has_finding_of_disorder_of_nervous_system_inthehistory)
:named REQ0_AUXILIARY1)) ;; "serious neurological disorder (past history)"

;; Non-exhaustive examples imply umbrella term (MRI evidence)
(assert
(! (=> (or patient_has_magnetic_resonance_imaging_evidence_of_cerebral_trauma
           patient_has_magnetic_resonance_imaging_evidence_of_cerebrovascular_accident
           patient_has_magnetic_resonance_imaging_evidence_of_hydrocephalus
           patient_has_magnetic_resonance_imaging_evidence_of_lacunar_infarction
           patient_has_magnetic_resonance_imaging_evidence_of_seizure_disorder
           patient_has_magnetic_resonance_imaging_evidence_of_mental_retardation
           patient_has_magnetic_resonance_imaging_evidence_of_disorder_of_nervous_system@@serious)
        patient_has_undergone_magnetic_resonance_imaging_inthehistory)
:named REQ0_AUXILIARY2)) ;; "with non-exhaustive examples (significant brain trauma, brain stroke, brain hydrocephalus, brain lacunar infarcts, brain seizures, mental retardation, serious neurological disorder) (MRI evidence)"

;; Qualifier variables imply corresponding stem variables (MRI evidence)
(assert
(! (=> patient_has_magnetic_resonance_imaging_evidence_of_disorder_of_nervous_system@@serious
       patient_has_magnetic_resonance_imaging_evidence_of_disorder_of_nervous_system)
:named REQ0_AUXILIARY3)) ;; "serious neurological disorder (MRI evidence)"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have past history of brain damage
(assert
(! (not patient_has_finding_of_traumatic_and_or_non_traumatic_brain_injury_inthehistory)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a past history of brain damage..."

;; Exclusion: patient must NOT have MRI evidence of brain damage
(assert
(! (not patient_has_undergone_magnetic_resonance_imaging_inthehistory)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has magnetic resonance imaging evidence of brain damage..."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_alcoholism_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of alcoholism at any point in their medical history.","when_to_set_to_false":"Set to false if the patient does not have a documented history of alcoholism at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of alcoholism.","meaning":"Boolean indicating whether the patient has a history of alcoholism."} ;; "alcoholism"
(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of drug misuse behavior (drug abuse) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient does not have a documented history of drug misuse behavior (drug abuse) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of drug misuse behavior (drug abuse).","meaning":"Boolean indicating whether the patient has a history of drug misuse behavior (drug abuse)."} ;; "drug abuse"
(declare-const patient_has_finding_of_significant_history_of_alcoholism_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented significant history of alcoholism at any point in their medical history.","when_to_set_to_false":"Set to false if the patient does not have a documented significant history of alcoholism at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a significant history of alcoholism.","meaning":"Boolean indicating whether the patient has a significant history of alcoholism."} ;; "significant history of alcoholism"
(declare-const patient_has_finding_of_significant_history_of_drug_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented significant history of drug abuse at any point in their medical history.","when_to_set_to_false":"Set to false if the patient does not have a documented significant history of drug abuse at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a significant history of drug abuse.","meaning":"Boolean indicating whether the patient has a significant history of drug abuse."} ;; "significant history of drug abuse"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Significant history of alcoholism implies history of alcoholism
(assert
(! (=> patient_has_finding_of_significant_history_of_alcoholism_inthehistory
      patient_has_finding_of_alcoholism_inthehistory)
    :named REQ1_AUXILIARY0)) ;; "significant history of alcoholism"

;; Significant history of drug abuse implies history of drug misuse behavior
(assert
(! (=> patient_has_finding_of_significant_history_of_drug_abuse_inthehistory
      patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthehistory)
    :named REQ1_AUXILIARY1)) ;; "significant history of drug abuse"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_significant_history_of_alcoholism_inthehistory)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a significant history of alcoholism."

(assert
(! (not patient_has_finding_of_significant_history_of_drug_abuse_inthehistory)
    :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a significant history of drug abuse."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_depressive_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with depressive disorder at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with depressive disorder at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with depressive disorder.","meaning":"Boolean indicating whether the patient has ever been diagnosed with depressive disorder in their medical history."} ;; "depression"
(declare-const patient_has_diagnosis_of_mania_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with mania at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with mania at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with mania.","meaning":"Boolean indicating whether the patient has ever been diagnosed with mania in their medical history."} ;; "mania"
(declare-const patient_has_diagnosis_of_posttraumatic_stress_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with posttraumatic stress disorder at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with posttraumatic stress disorder at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with posttraumatic stress disorder.","meaning":"Boolean indicating whether the patient has ever been diagnosed with posttraumatic stress disorder in their medical history."} ;; "post-traumatic stress disorder"
(declare-const patient_has_diagnosis_of_schizophrenia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with schizophrenia at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with schizophrenia at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with schizophrenia.","meaning":"Boolean indicating whether the patient has ever been diagnosed with schizophrenia in their medical history."} ;; "schizophrenia"
(declare-const patient_has_history_of_psychiatric_illness Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of any psychiatric illness, regardless of specific diagnosis.","when_to_set_to_false":"Set to false if the patient has no documented history of any psychiatric illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of any psychiatric illness.","meaning":"Boolean indicating whether the patient has a history of any psychiatric illness, including but not limited to schizophrenia, mania, post-traumatic stress disorder, or depression."} ;; "history of psychiatric illness"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_schizophrenia_inthehistory
           patient_has_diagnosis_of_mania_inthehistory
           patient_has_diagnosis_of_posttraumatic_stress_disorder_inthehistory
           patient_has_diagnosis_of_depressive_disorder_inthehistory)
        patient_has_history_of_psychiatric_illness)
   :named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples (schizophrenia, mania, post-traumatic stress disorder, depression)."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_history_of_psychiatric_illness)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of psychiatric illness with non-exhaustive examples (schizophrenia, mania, post-traumatic stress disorder, depression)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_focal_neurological_signs_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any focal neurological signs.","when_to_set_to_false":"Set to false if the patient currently does not have any focal neurological signs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any focal neurological signs.","meaning":"Boolean indicating whether the patient currently has any focal neurological signs."} ;; "the patient has any focal neurological signs"
(declare-const patient_has_finding_of_neuropathology_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has significant neuropathology.","when_to_set_to_false":"Set to false if the patient currently does not have significant neuropathology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has significant neuropathology.","meaning":"Boolean indicating whether the patient currently has significant neuropathology."} ;; "the patient has significant neuropathology"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_has_finding_of_focal_neurological_signs_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any focal neurological signs."

(assert
  (! (not patient_has_finding_of_neuropathology_now@@significant)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant neuropathology."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const modified_hachinski_ischemia_scale_score_value_recorded_most_recent_withunit_points Real) ;; {"when_to_set_to_value":"Set to the most recently recorded numeric value of the Modified Hachinski Ischemia Scale score in points.","when_to_set_to_null":"Set to null if the Modified Hachinski Ischemia Scale score is not available, not documented, or cannot be determined.","meaning":"Numeric value representing the most recent Modified Hachinski Ischemia Scale score in points."} ;; "score on the Modified Hachinski Ischemia Scale that is greater than or equal to four (score ≥ 4)"
(declare-const patient_has_finding_of_cerebrovascular_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of cerebrovascular disease.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of cerebrovascular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cerebrovascular disease.","meaning":"Boolean indicating whether the patient currently has cerebrovascular disease."} ;; "indicative of cerebrovascular disease"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; The requirement states that a score ≥ 4 is indicative of cerebrovascular disease
(assert
(! (=> (>= modified_hachinski_ischemia_scale_score_value_recorded_most_recent_withunit_points 4)
       patient_has_finding_of_cerebrovascular_disease_now)
   :named REQ4_AUXILIARY0)) ;; "score ≥ 4 is indicative of cerebrovascular disease"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (>= modified_hachinski_ischemia_scale_score_value_recorded_most_recent_withunit_points 4))
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a score on the Modified Hachinski Ischemia Scale that is greater than or equal to four (score ≥ 4), indicative of cerebrovascular disease."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_ham_d_hamilton_rating_scale_for_depression_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured total score if a numeric measurement of the Hamilton Depression Scale score recorded now is available.","when_to_set_to_null":"Set to null if no such score measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current total score on the Hamilton Depression Scale."} ;; "total score on the Hamilton Depression Scale that is greater than or equal to sixteen (total score ≥ 16)."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (>= patient_ham_d_hamilton_rating_scale_for_depression_score_value_recorded_now_withunit_score 16))
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a total score on the Hamilton Depression Scale that is greater than or equal to sixteen (total score ≥ 16)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hypertensive disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a hypertensive disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hypertensive disorder.","meaning":"Boolean indicating whether the patient currently has a hypertensive disorder."} ;; "hypertension"
(declare-const patient_has_finding_of_hypertensive_disorder_now@@clinically_relevant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypertensive disorder is clinically relevant.","when_to_set_to_false":"Set to false if the patient's hypertensive disorder is not clinically relevant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypertensive disorder is clinically relevant.","meaning":"Boolean indicating whether the patient's hypertensive disorder is clinically relevant."} ;; "clinically relevant hypertension"
(declare-const patient_has_finding_of_hypertensive_disorder_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypertensive disorder is uncontrolled.","when_to_set_to_false":"Set to false if the patient's hypertensive disorder is controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypertensive disorder is uncontrolled.","meaning":"Boolean indicating whether the patient's hypertensive disorder is uncontrolled."} ;; "uncontrolled hypertension"

(declare-const patient_has_finding_of_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have a heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a heart disease.","meaning":"Boolean indicating whether the patient currently has a heart disease."} ;; "cardiac condition"
(declare-const patient_has_finding_of_heart_disease_now@@clinically_relevant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's heart disease is clinically relevant.","when_to_set_to_false":"Set to false if the patient's heart disease is not clinically relevant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's heart disease is clinically relevant.","meaning":"Boolean indicating whether the patient's heart disease is clinically relevant."} ;; "clinically relevant cardiac condition"
(declare-const patient_has_finding_of_heart_disease_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's heart disease is uncontrolled.","when_to_set_to_false":"Set to false if the patient's heart disease is controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's heart disease is uncontrolled.","meaning":"Boolean indicating whether the patient's heart disease is uncontrolled."} ;; "uncontrolled cardiac condition"

(declare-const patient_has_finding_of_disorder_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of lung.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of lung.","meaning":"Boolean indicating whether the patient currently has a disorder of lung."} ;; "pulmonary condition"
(declare-const patient_has_finding_of_disorder_of_lung_now@@clinically_relevant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's disorder of lung is clinically relevant.","when_to_set_to_false":"Set to false if the patient's disorder of lung is not clinically relevant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's disorder of lung is clinically relevant.","meaning":"Boolean indicating whether the patient's disorder of lung is clinically relevant."} ;; "clinically relevant pulmonary condition"
(declare-const patient_has_finding_of_disorder_of_lung_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's disorder of lung is uncontrolled.","when_to_set_to_false":"Set to false if the patient's disorder of lung is controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's disorder of lung is uncontrolled.","meaning":"Boolean indicating whether the patient's disorder of lung is uncontrolled."} ;; "uncontrolled pulmonary condition"

(declare-const patient_has_finding_of_vascular_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a vascular disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a vascular disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a vascular disorder.","meaning":"Boolean indicating whether the patient currently has a vascular disorder."} ;; "vascular condition"
(declare-const patient_has_finding_of_vascular_disorder_now@@clinically_relevant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's vascular disorder is clinically relevant.","when_to_set_to_false":"Set to false if the patient's vascular disorder is not clinically relevant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's vascular disorder is clinically relevant.","meaning":"Boolean indicating whether the patient's vascular disorder is clinically relevant."} ;; "clinically relevant vascular condition"
(declare-const patient_has_finding_of_vascular_disorder_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's vascular disorder is uncontrolled.","when_to_set_to_false":"Set to false if the patient's vascular disorder is controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's vascular disorder is uncontrolled.","meaning":"Boolean indicating whether the patient's vascular disorder is uncontrolled."} ;; "uncontrolled vascular condition"

(declare-const patient_has_finding_of_metabolic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a metabolic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a metabolic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a metabolic disease.","meaning":"Boolean indicating whether the patient currently has a metabolic disease."} ;; "metabolic condition"
(declare-const patient_has_finding_of_metabolic_disease_now@@clinically_relevant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's metabolic disease is clinically relevant.","when_to_set_to_false":"Set to false if the patient's metabolic disease is not clinically relevant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's metabolic disease is clinically relevant.","meaning":"Boolean indicating whether the patient's metabolic disease is clinically relevant."} ;; "clinically relevant metabolic condition"
(declare-const patient_has_finding_of_metabolic_disease_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's metabolic disease is uncontrolled.","when_to_set_to_false":"Set to false if the patient's metabolic disease is controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's metabolic disease is uncontrolled.","meaning":"Boolean indicating whether the patient's metabolic disease is uncontrolled."} ;; "uncontrolled metabolic condition"

(declare-const patient_has_finding_of_hematologic_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hematologic condition.","when_to_set_to_false":"Set to false if the patient currently does not have a hematologic condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hematologic condition.","meaning":"Boolean indicating whether the patient currently has a hematologic condition."} ;; "hematologic condition"
(declare-const patient_has_finding_of_hematologic_condition_now@@clinically_relevant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hematologic condition is clinically relevant.","when_to_set_to_false":"Set to false if the patient's hematologic condition is not clinically relevant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hematologic condition is clinically relevant.","meaning":"Boolean indicating whether the patient's hematologic condition is clinically relevant."} ;; "clinically relevant hematologic condition"
(declare-const patient_has_finding_of_hematologic_condition_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hematologic condition is uncontrolled.","when_to_set_to_false":"Set to false if the patient's hematologic condition is controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hematologic condition is uncontrolled.","meaning":"Boolean indicating whether the patient's hematologic condition is uncontrolled."} ;; "uncontrolled hematologic condition"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_hypertensive_disorder_now@@clinically_relevant
     patient_has_finding_of_hypertensive_disorder_now)
:named REQ6_AUXILIARY0)) ;; "clinically relevant hypertension"

(assert
(! (=> patient_has_finding_of_hypertensive_disorder_now@@uncontrolled
     patient_has_finding_of_hypertensive_disorder_now)
:named REQ6_AUXILIARY1)) ;; "uncontrolled hypertension"

(assert
(! (=> patient_has_finding_of_heart_disease_now@@clinically_relevant
     patient_has_finding_of_heart_disease_now)
:named REQ6_AUXILIARY2)) ;; "clinically relevant cardiac condition"

(assert
(! (=> patient_has_finding_of_heart_disease_now@@uncontrolled
     patient_has_finding_of_heart_disease_now)
:named REQ6_AUXILIARY3)) ;; "uncontrolled cardiac condition"

(assert
(! (=> patient_has_finding_of_disorder_of_lung_now@@clinically_relevant
     patient_has_finding_of_disorder_of_lung_now)
:named REQ6_AUXILIARY4)) ;; "clinically relevant pulmonary condition"

(assert
(! (=> patient_has_finding_of_disorder_of_lung_now@@uncontrolled
     patient_has_finding_of_disorder_of_lung_now)
:named REQ6_AUXILIARY5)) ;; "uncontrolled pulmonary condition"

(assert
(! (=> patient_has_finding_of_vascular_disorder_now@@clinically_relevant
     patient_has_finding_of_vascular_disorder_now)
:named REQ6_AUXILIARY6)) ;; "clinically relevant vascular condition"

(assert
(! (=> patient_has_finding_of_vascular_disorder_now@@uncontrolled
     patient_has_finding_of_vascular_disorder_now)
:named REQ6_AUXILIARY7)) ;; "uncontrolled vascular condition"

(assert
(! (=> patient_has_finding_of_metabolic_disease_now@@clinically_relevant
     patient_has_finding_of_metabolic_disease_now)
:named REQ6_AUXILIARY8)) ;; "clinically relevant metabolic condition"

(assert
(! (=> patient_has_finding_of_metabolic_disease_now@@uncontrolled
     patient_has_finding_of_metabolic_disease_now)
:named REQ6_AUXILIARY9)) ;; "uncontrolled metabolic condition"

(assert
(! (=> patient_has_finding_of_hematologic_condition_now@@clinically_relevant
     patient_has_finding_of_hematologic_condition_now)
:named REQ6_AUXILIARY10)) ;; "clinically relevant hematologic condition"

(assert
(! (=> patient_has_finding_of_hematologic_condition_now@@uncontrolled
     patient_has_finding_of_hematologic_condition_now)
:named REQ6_AUXILIARY11)) ;; "uncontrolled hematologic condition"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (and patient_has_finding_of_hypertensive_disorder_now@@clinically_relevant
             patient_has_finding_of_hypertensive_disorder_now@@uncontrolled))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of clinically relevant AND uncontrolled hypertension."

(assert
(! (not (and patient_has_finding_of_heart_disease_now@@clinically_relevant
             patient_has_finding_of_heart_disease_now@@uncontrolled))
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of clinically relevant AND uncontrolled cardiac condition."

(assert
(! (not (and patient_has_finding_of_disorder_of_lung_now@@clinically_relevant
             patient_has_finding_of_disorder_of_lung_now@@uncontrolled))
:named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of clinically relevant AND uncontrolled pulmonary condition."

(assert
(! (not (and patient_has_finding_of_vascular_disorder_now@@clinically_relevant
             patient_has_finding_of_vascular_disorder_now@@uncontrolled))
:named REQ6_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of clinically relevant AND uncontrolled vascular condition."

(assert
(! (not (and patient_has_finding_of_metabolic_disease_now@@clinically_relevant
             patient_has_finding_of_metabolic_disease_now@@uncontrolled))
:named REQ6_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of clinically relevant AND uncontrolled metabolic condition."

(assert
(! (not (and patient_has_finding_of_hematologic_condition_now@@clinically_relevant
             patient_has_finding_of_hematologic_condition_now@@uncontrolled))
:named REQ6_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of clinically relevant AND uncontrolled hematologic condition."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a physical impairment.","when_to_set_to_false":"Set to false if the patient currently does not have a physical impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a physical impairment.","meaning":"Boolean indicating whether the patient currently has a physical impairment."} ;; "physical impairment"

(declare-const patient_has_finding_of_impairment_now@@severity_adversely_affects_validity_of_psychological_testing Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current physical impairment is of such severity that it adversely affects the validity of psychological testing.","when_to_set_to_false":"Set to false if the patient's current physical impairment does not adversely affect the validity of psychological testing due to severity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of the physical impairment adversely affects the validity of psychological testing.","meaning":"Boolean indicating whether the severity of the patient's current physical impairment adversely affects the validity of psychological testing."} ;; "of such severity as to adversely affect the validity of psychological testing"

(declare-const patient_is_undergoing_psychologic_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing psychological testing.","when_to_set_to_false":"Set to false if the patient is currently not undergoing psychological testing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing psychological testing.","meaning":"Boolean indicating whether the patient is currently undergoing psychological testing."} ;; "psychological testing"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_impairment_now@@severity_adversely_affects_validity_of_psychological_testing
      patient_has_finding_of_impairment_now)
:named REQ7_AUXILIARY0)) ;; "physical impairment of such severity as to adversely affect the validity of psychological testing"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_impairment_now@@severity_adversely_affects_validity_of_psychological_testing)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a physical impairment of such severity as to adversely affect the validity of psychological testing."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_hostile_behavior_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently demonstrates hostile behavior.","when_to_set_to_false":"Set to false if the patient currently does not demonstrate hostile behavior.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently demonstrates hostile behavior.","meaning":"Boolean indicating whether the patient currently demonstrates hostile behavior."} ;; "hostility"
(declare-const patient_has_finding_of_refusal_to_cooperate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently demonstrates refusal to cooperate.","when_to_set_to_false":"Set to false if the patient currently does not demonstrate refusal to cooperate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently demonstrates refusal to cooperate.","meaning":"Boolean indicating whether the patient currently demonstrates refusal to cooperate."} ;; "refusal to cooperate"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (not patient_has_finding_of_hostile_behavior_now)
     :named REQ8_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient demonstrates hostility."
(assert
  (! (not patient_has_finding_of_refusal_to_cooperate_now)
     :named REQ8_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient demonstrates refusal to cooperate."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_prosthetic_device_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any prosthetic device.","when_to_set_to_false":"Set to false if the patient currently does not have any prosthetic device.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any prosthetic device.","meaning":"Boolean indicating whether the patient currently has any prosthetic device."} ;; "any prosthetic device"
(declare-const patient_has_prosthetic_device_now@@could_be_affected_by_magnetic_field_employed_during_magnetic_resonance_imaging Bool) ;; {"when_to_set_to_true":"Set to true if the prosthetic device the patient currently has could be affected by the magnetic field employed during magnetic resonance imaging.","when_to_set_to_false":"Set to false if the prosthetic device the patient currently has could not be affected by the magnetic field employed during magnetic resonance imaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the prosthetic device the patient currently has could be affected by the magnetic field employed during magnetic resonance imaging.","meaning":"Boolean indicating whether the prosthetic device the patient currently has could be affected by the magnetic field employed during magnetic resonance imaging."} ;; "prosthetic device ... that could be affected by the magnetic field employed during magnetic resonance imaging"
(declare-const patient_is_undergoing_magnetic_resonance_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing magnetic resonance imaging (MRI).","when_to_set_to_false":"Set to false if the patient is currently not undergoing magnetic resonance imaging (MRI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing magnetic resonance imaging (MRI).","meaning":"Boolean indicating whether the patient is currently undergoing magnetic resonance imaging (MRI)."} ;; "magnetic resonance imaging"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_prosthetic_device_now@@could_be_affected_by_magnetic_field_employed_during_magnetic_resonance_imaging
      patient_has_prosthetic_device_now)
:named REQ9_AUXILIARY0)) ;; "prosthetic device ... that could be affected by the magnetic field employed during magnetic resonance imaging"

;; Non-exhaustive examples imply umbrella subclass (pacemaker, surgical clip are examples)
(declare-const patient_has_pacemaker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a pacemaker.","when_to_set_to_false":"Set to false if the patient currently does not have a pacemaker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a pacemaker.","meaning":"Boolean indicating whether the patient currently has a pacemaker."} ;; "pacemaker"
(declare-const patient_has_surgical_clip_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a surgical clip.","when_to_set_to_false":"Set to false if the patient currently does not have a surgical clip.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a surgical clip.","meaning":"Boolean indicating whether the patient currently has a surgical clip."} ;; "surgical clip"

(assert
(! (=> (or patient_has_pacemaker_now
           patient_has_surgical_clip_now)
      patient_has_prosthetic_device_now@@could_be_affected_by_magnetic_field_employed_during_magnetic_resonance_imaging)
:named REQ9_AUXILIARY1)) ;; "with non-exhaustive examples (pacemaker, surgical clip)"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_prosthetic_device_now@@could_be_affected_by_magnetic_field_employed_during_magnetic_resonance_imaging)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any prosthetic device ... that could be affected by the magnetic field employed during magnetic resonance imaging."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_diagnosis_of_presenile_dementia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with presenile dementia (early onset dementia) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with presenile dementia (early onset dementia) at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with presenile dementia (early onset dementia).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of presenile dementia (early onset dementia) in their history."} ;; "early onset dementia"
(declare-const patient_has_history_of_familial_early_onset_dementia Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of familial early onset dementia.","when_to_set_to_false":"Set to false if the patient does not have a documented history of familial early onset dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of familial early onset dementia.","meaning":"Boolean indicating whether the patient has a history of familial early onset dementia."} ;; "history of familial early onset dementia"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_history_of_familial_early_onset_dementia)
    :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of familial early onset dementia."
