;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_epilepsy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of epilepsy.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of epilepsy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of epilepsy.","meaning":"Boolean indicating whether the patient currently has a diagnosis of epilepsy."} ;; "epilepsy"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_epilepsy_now)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has epilepsy."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of kidney disease (renal disease).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of kidney disease (renal disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has kidney disease (renal disease).","meaning":"Boolean indicating whether the patient currently has kidney disease (renal disease)."} ;; "renal disease"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_kidney_disease_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has renal disease."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus."} ;; "diabetes"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_diabetes_mellitus_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diabetes."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_abnormal_liver_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of abnormal liver function.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of abnormal liver function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abnormal liver function.","meaning":"Boolean indicating whether the patient currently has abnormal liver function."} ;; "abnormal liver function"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_abnormal_liver_function_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has abnormal liver function."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_disorder_of_cardiovascular_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the cardiovascular system.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the cardiovascular system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the cardiovascular system.","meaning":"Boolean indicating whether the patient currently has a disorder of the cardiovascular system."} ;; "cardiovascular disease"
(declare-const patient_has_finding_of_disorder_of_cardiovascular_system_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder of the cardiovascular system is severe.","when_to_set_to_false":"Set to false if the patient's current disorder of the cardiovascular system is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disorder of the cardiovascular system is severe.","meaning":"Boolean indicating whether the patient's current disorder of the cardiovascular system is severe."} ;; "severe cardiovascular disease"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_of_cardiovascular_system_now@@severity_severe
      patient_has_finding_of_disorder_of_cardiovascular_system_now)
:named REQ4_AUXILIARY0)) ;; "severe cardiovascular disease" implies "cardiovascular disease"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_disorder_of_cardiovascular_system_now@@severity_severe)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe cardiovascular disease."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_malignant_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has malignant hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have malignant hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has malignant hypertension.","meaning":"Boolean indicating whether the patient currently has malignant hypertension."} ;; "malignant hypertension"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_malignant_hypertension_now)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has malignant hypertension."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patients_systolic_blood_pressure_value_recorded_at_baseline_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the value of the patient's systolic blood pressure measured at baseline, in mmHg.","when_to_set_to_null":"Set to null if the patient's systolic blood pressure at baseline is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's systolic blood pressure at baseline, in mmHg."} ;; "baseline systolic blood pressure greater than 140 millimeters of mercury"
(declare-const patients_diastolic_blood_pressure_value_recorded_at_baseline_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the value of the patient's diastolic blood pressure measured at baseline, in mmHg.","when_to_set_to_null":"Set to null if the patient's diastolic blood pressure at baseline is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's diastolic blood pressure at baseline, in mmHg."} ;; "baseline diastolic blood pressure greater than 90 millimeters of mercury"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not (> patients_systolic_blood_pressure_value_recorded_at_baseline_withunit_mmhg 140))
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a baseline systolic blood pressure greater than 140 millimeters of mercury."

(assert
  (! (not (> patients_diastolic_blood_pressure_value_recorded_at_baseline_withunit_mmhg 90))
     :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a baseline diastolic blood pressure greater than 90 millimeters of mercury."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_diagnosis_of_schizophrenia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with schizophrenia at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with schizophrenia at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with schizophrenia.","meaning":"Boolean indicating whether the patient has ever been diagnosed with schizophrenia."} ;; "the patient has a personal history of schizophrenia"
(declare-const patient_has_diagnosis_of_bipolar_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with bipolar affective disorder at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with bipolar affective disorder at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with bipolar affective disorder.","meaning":"Boolean indicating whether the patient has ever been diagnosed with bipolar affective disorder."} ;; "the patient has a personal history of bipolar affective disorder"
(declare-const patient_has_diagnosis_of_delusional_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with delusional disorder at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with delusional disorder at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with delusional disorder.","meaning":"Boolean indicating whether the patient has ever been diagnosed with delusional disorder."} ;; "the patient has a personal history of delusional disorder"
(declare-const patient_has_diagnosis_of_schizoaffective_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with schizoaffective disorder at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with schizoaffective disorder at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with schizoaffective disorder.","meaning":"Boolean indicating whether the patient has ever been diagnosed with schizoaffective disorder."} ;; "the patient has a personal history of schizoaffective disorder"
(declare-const patient_has_diagnosis_of_other_psychotic_spectrum_illness_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with any other psychotic spectrum illness at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with any other psychotic spectrum illness at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with any other psychotic spectrum illness.","meaning":"Boolean indicating whether the patient has ever been diagnosed with any other psychotic spectrum illness."} ;; "the patient has a personal history of other psychotic spectrum illness"
(declare-const immediate_family_member_has_diagnosis_of_schizophrenia_ever Bool) ;; {"when_to_set_to_true":"Set to true if any immediate family member of the patient has ever been diagnosed with schizophrenia.","when_to_set_to_false":"Set to false if no immediate family member of the patient has ever been diagnosed with schizophrenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether any immediate family member of the patient has ever been diagnosed with schizophrenia.","meaning":"Boolean indicating whether any immediate family member of the patient has ever been diagnosed with schizophrenia."} ;; "immediate family members of the patient have schizophrenia"
(declare-const immediate_family_member_has_diagnosis_of_bipolar_affective_disorder_ever Bool) ;; {"when_to_set_to_true":"Set to true if any immediate family member of the patient has ever been diagnosed with bipolar affective disorder.","when_to_set_to_false":"Set to false if no immediate family member of the patient has ever been diagnosed with bipolar affective disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether any immediate family member of the patient has ever been diagnosed with bipolar affective disorder.","meaning":"Boolean indicating whether any immediate family member of the patient has ever been diagnosed with bipolar affective disorder."} ;; "immediate family members of the patient have bipolar affective disorder"
(declare-const immediate_family_member_has_diagnosis_of_delusional_disorder_ever Bool) ;; {"when_to_set_to_true":"Set to true if any immediate family member of the patient has ever been diagnosed with delusional disorder.","when_to_set_to_false":"Set to false if no immediate family member of the patient has ever been diagnosed with delusional disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether any immediate family member of the patient has ever been diagnosed with delusional disorder.","meaning":"Boolean indicating whether any immediate family member of the patient has ever been diagnosed with delusional disorder."} ;; "immediate family members of the patient have delusional disorder"
(declare-const immediate_family_member_has_diagnosis_of_schizoaffective_disorder_ever Bool) ;; {"when_to_set_to_true":"Set to true if any immediate family member of the patient has ever been diagnosed with schizoaffective disorder.","when_to_set_to_false":"Set to false if no immediate family member of the patient has ever been diagnosed with schizoaffective disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether any immediate family member of the patient has ever been diagnosed with schizoaffective disorder.","meaning":"Boolean indicating whether any immediate family member of the patient has ever been diagnosed with schizoaffective disorder."} ;; "immediate family members of the patient have schizoaffective disorder"
(declare-const immediate_family_member_has_diagnosis_of_other_psychotic_spectrum_illness_ever Bool) ;; {"when_to_set_to_true":"Set to true if any immediate family member of the patient has ever been diagnosed with any other psychotic spectrum illness.","when_to_set_to_false":"Set to false if no immediate family member of the patient has ever been diagnosed with any other psychotic spectrum illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether any immediate family member of the patient has ever been diagnosed with any other psychotic spectrum illness.","meaning":"Boolean indicating whether any immediate family member of the patient has ever been diagnosed with any other psychotic spectrum illness."} ;; "immediate family members of the patient have other psychotic spectrum illness"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_diagnosis_of_schizophrenia_inthehistory)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a personal history of schizophrenia."

(assert
(! (not patient_has_diagnosis_of_bipolar_disorder_inthehistory)
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a personal history of bipolar affective disorder."

(assert
(! (not patient_has_diagnosis_of_delusional_disorder_inthehistory)
:named REQ7_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a personal history of delusional disorder."

(assert
(! (not patient_has_diagnosis_of_schizoaffective_disorder_inthehistory)
:named REQ7_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a personal history of schizoaffective disorder."

(assert
(! (not patient_has_diagnosis_of_other_psychotic_spectrum_illness_inthehistory)
:named REQ7_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a personal history of other psychotic spectrum illness."

(assert
(! (not immediate_family_member_has_diagnosis_of_schizophrenia_ever)
:named REQ7_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if immediate family members of the patient have schizophrenia."

(assert
(! (not immediate_family_member_has_diagnosis_of_bipolar_affective_disorder_ever)
:named REQ7_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if immediate family members of the patient have bipolar affective disorder."

(assert
(! (not immediate_family_member_has_diagnosis_of_delusional_disorder_ever)
:named REQ7_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if immediate family members of the patient have delusional disorder."

(assert
(! (not immediate_family_member_has_diagnosis_of_schizoaffective_disorder_ever)
:named REQ7_COMPONENT8_OTHER_REQUIREMENTS)) ;; "The patient is excluded if immediate family members of the patient have schizoaffective disorder."

(assert
(! (not immediate_family_member_has_diagnosis_of_other_psychotic_spectrum_illness_ever)
:named REQ7_COMPONENT9_OTHER_REQUIREMENTS)) ;; "The patient is excluded if immediate family members of the patient have other psychotic spectrum illness."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_diagnosis_of_psychoactive_substance_use_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of psychoactive substance use disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of psychoactive substance use disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of psychoactive substance use disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of psychoactive substance use disorder."} ;; "substance use disorder"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_diagnosis_of_psychoactive_substance_use_disorder_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current substance use disorder."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_contraindication_to_anticonvulsant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a medication contraindication to anticonvulsant (anti-seizure) medications.","when_to_set_to_false":"Set to false if the patient currently does not have a medication contraindication to anticonvulsant (anti-seizure) medications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a medication contraindication to anticonvulsant (anti-seizure) medications.","meaning":"Boolean indicating whether the patient currently has a medication contraindication to anticonvulsant (anti-seizure) medications."} ;; "the patient has medication contraindications to anti-seizure medications"
(declare-const patient_has_contraindication_to_insulin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a medication contraindication to insulin.","when_to_set_to_false":"Set to false if the patient currently does not have a medication contraindication to insulin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a medication contraindication to insulin.","meaning":"Boolean indicating whether the patient currently has a medication contraindication to insulin."} ;; "the patient has medication contraindications to insulin"
(declare-const patient_has_contraindication_to_oral_hypoglycemic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a medication contraindication to oral hypoglycemic agents.","when_to_set_to_false":"Set to false if the patient currently does not have a medication contraindication to oral hypoglycemic agents.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a medication contraindication to oral hypoglycemic agents.","meaning":"Boolean indicating whether the patient currently has a medication contraindication to oral hypoglycemic agents."} ;; "the patient has medication contraindications to oral hypoglycemic agents"
(declare-const patient_has_contraindication_to_clonidine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a medication contraindication to clonidine.","when_to_set_to_false":"Set to false if the patient currently does not have a medication contraindication to clonidine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a medication contraindication to clonidine.","meaning":"Boolean indicating whether the patient currently has a medication contraindication to clonidine."} ;; "the patient has medication contraindications to clonidine"
(declare-const patient_has_contraindication_to_methyldopa_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a medication contraindication to methyldopa-containing products.","when_to_set_to_false":"Set to false if the patient currently does not have a medication contraindication to methyldopa-containing products.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a medication contraindication to methyldopa-containing products.","meaning":"Boolean indicating whether the patient currently has a medication contraindication to methyldopa-containing products."} ;; "the patient has medication contraindications to methyldopa"
(declare-const patient_has_contraindication_to_cardiovascular_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a medication contraindication to cardiovascular agents.","when_to_set_to_false":"Set to false if the patient currently does not have a medication contraindication to cardiovascular agents.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a medication contraindication to cardiovascular agents.","meaning":"Boolean indicating whether the patient currently has a medication contraindication to cardiovascular agents."} ;; "the patient has medication contraindications to cardiovascular medications"
(declare-const patient_has_contraindication_to_anti_psychotic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a medication contraindication to first generation anti-psychotic agents.","when_to_set_to_false":"Set to false if the patient currently does not have a medication contraindication to first generation anti-psychotic agents.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a medication contraindication to first generation anti-psychotic agents.","meaning":"Boolean indicating whether the patient currently has a medication contraindication to first generation anti-psychotic agents."} ;; "the patient has medication contraindications to first generation antipsychotic medications"
(declare-const patient_has_contraindication_to_second_generation_antipsychotic_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a medication contraindication to second generation antipsychotic medications.","when_to_set_to_false":"Set to false if the patient currently does not have a medication contraindication to second generation antipsychotic medications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a medication contraindication to second generation antipsychotic medications.","meaning":"Boolean indicating whether the patient currently has a medication contraindication to second generation antipsychotic medications."} ;; "the patient has medication contraindications to second generation antipsychotic medications"
(declare-const patient_has_contraindication_to_antidepressant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a medication contraindication to antidepressant medications.","when_to_set_to_false":"Set to false if the patient currently does not have a medication contraindication to antidepressant medications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a medication contraindication to antidepressant medications.","meaning":"Boolean indicating whether the patient currently has a medication contraindication to antidepressant medications."} ;; "the patient has medication contraindications to antidepressant medications"
(declare-const patient_has_contraindication_to_mood_stabilizer_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a medication contraindication to mood stabilizer medications.","when_to_set_to_false":"Set to false if the patient currently does not have a medication contraindication to mood stabilizer medications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a medication contraindication to mood stabilizer medications.","meaning":"Boolean indicating whether the patient currently has a medication contraindication to mood stabilizer medications."} ;; "the patient has medication contraindications to mood stabilizer medications"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not (or patient_has_contraindication_to_anticonvulsant_now
            patient_has_contraindication_to_insulin_now
            patient_has_contraindication_to_oral_hypoglycemic_agent_now
            patient_has_contraindication_to_clonidine_now
            patient_has_contraindication_to_methyldopa_containing_product_now
            patient_has_contraindication_to_cardiovascular_agent_now
            patient_has_contraindication_to_anti_psychotic_agent_now
            patient_has_contraindication_to_second_generation_antipsychotic_medication_now
            patient_has_contraindication_to_antidepressant_now
            patient_has_contraindication_to_mood_stabilizer_medication_now))
   :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has medication contraindications to anti-seizure medications) OR (the patient has medication contraindications to insulin) OR (the patient has medication contraindications to oral hypoglycemic agents) OR (the patient has medication contraindications to clonidine) OR (the patient has medication contraindications to methyldopa) OR (the patient has medication contraindications to cardiovascular medications) OR (the patient has medication contraindications to first generation antipsychotic medications) OR (the patient has medication contraindications to second generation antipsychotic medications) OR (the patient has medication contraindications to antidepressant medications) OR (the patient has medication contraindications to mood stabilizer medications))."
