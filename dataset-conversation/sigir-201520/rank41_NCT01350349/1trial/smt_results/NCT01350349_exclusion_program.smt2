;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_high_suicide_risk_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of high suicide risk.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of high suicide risk.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has high suicide risk.","meaning":"Boolean indicating whether the patient currently has high suicide risk."} ;; "high suicide risk"

(declare-const patient_has_finding_of_suicidal_intent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of suicidal intent.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of suicidal intent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has suicidal intent.","meaning":"Boolean indicating whether the patient currently has suicidal intent."} ;; "suicide intent"

(declare-const patient_has_finding_of_planning_suicide_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of a suicide plan.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of a suicide plan.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a suicide plan.","meaning":"Boolean indicating whether the patient currently has a suicide plan."} ;; "suicide plan"

(declare-const patient_has_finding_of_planning_suicide_now@@plan_to_attempt_suicide_in_the_near_future Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a suicide plan and that plan is specifically to attempt suicide in the near future.","when_to_set_to_false":"Set to false if the patient currently has a suicide plan but it is not specifically to attempt suicide in the near future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the suicide plan is specifically to attempt suicide in the near future.","meaning":"Boolean indicating whether the patient's current suicide plan is specifically to attempt suicide in the near future."} ;; "suicide plan to attempt suicide in the near future"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition: high suicide risk = suicide intent OR suicide plan to attempt suicide in the near future
(assert
(! (= patient_has_finding_of_high_suicide_risk_now
     (or patient_has_finding_of_suicidal_intent_now
         patient_has_finding_of_planning_suicide_now@@plan_to_attempt_suicide_in_the_near_future))
:named REQ0_AUXILIARY0)) ;; "high suicide risk, defined as (suicide intent) OR (suicide plan to attempt suicide in the near future)"

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_planning_suicide_now@@plan_to_attempt_suicide_in_the_near_future
       patient_has_finding_of_planning_suicide_now)
:named REQ0_AUXILIARY1)) ;; "suicide plan to attempt suicide in the near future" implies "suicide plan"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_high_suicide_risk_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has high suicide risk, defined as (suicide intent) OR (suicide plan to attempt suicide in the near future)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mental disorder (psychiatric disorder).","when_to_set_to_false":"Set to false if the patient currently does not have a mental disorder (psychiatric disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a mental disorder (psychiatric disorder).","meaning":"Boolean indicating whether the patient currently has a mental disorder (psychiatric disorder) now."} ;; "psychiatric disorder"
(declare-const patient_has_finding_of_mental_disorder_now@@axis_i_disorder Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current mental disorder (psychiatric disorder) is classified as Axis I.","when_to_set_to_false":"Set to false if the patient's current mental disorder (psychiatric disorder) is not classified as Axis I.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current mental disorder (psychiatric disorder) is classified as Axis I.","meaning":"Boolean indicating whether the patient's current mental disorder (psychiatric disorder) is classified as Axis I."} ;; "Axis I psychiatric disorder"
(declare-const patient_has_finding_of_substance_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has substance abuse.","when_to_set_to_false":"Set to false if the patient currently does not have substance abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has substance abuse.","meaning":"Boolean indicating whether the patient currently has substance abuse now."} ;; "substance abuse"
(declare-const patient_has_finding_of_substance_abuse_now@@excluding_unipolar_major_depression_and_non_psychotic_depression Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current substance abuse is present and does not include unipolar major depression or non-psychotic depression.","when_to_set_to_false":"Set to false if the patient's current substance abuse is absent or only consists of unipolar major depression or non-psychotic depression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current substance abuse excludes unipolar major depression and non-psychotic depression.","meaning":"Boolean indicating whether the patient's current substance abuse excludes unipolar major depression and non-psychotic depression."} ;; "substance abuse other than unipolar major depression or non-psychotic depression"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable for Axis I psychiatric disorder
(assert
(! (=> patient_has_finding_of_mental_disorder_now@@axis_i_disorder
      patient_has_finding_of_mental_disorder_now)
:named REQ1_AUXILIARY0)) ;; "Axis I psychiatric disorder"

;; Qualifier variable implies corresponding stem variable for substance abuse
(assert
(! (=> patient_has_finding_of_substance_abuse_now@@excluding_unipolar_major_depression_and_non_psychotic_depression
      patient_has_finding_of_substance_abuse_now)
:named REQ1_AUXILIARY1)) ;; "substance abuse other than unipolar major depression or non-psychotic depression"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have Axis I psychiatric disorder other than unipolar major depression or non-psychotic depression
(assert
(! (not patient_has_finding_of_mental_disorder_now@@axis_i_disorder)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an Axis I psychiatric disorder other than unipolar major depression or non-psychotic depression."

;; Exclusion: patient must NOT have substance abuse other than unipolar major depression or non-psychotic depression
(assert
(! (not patient_has_finding_of_substance_abuse_now@@excluding_unipolar_major_depression_and_non_psychotic_depression)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has substance abuse other than unipolar major depression or non-psychotic depression."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_axis_ii_diagnosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an Axis II diagnosis.","when_to_set_to_false":"Set to false if the patient currently does not have an Axis II diagnosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an Axis II diagnosis.","meaning":"Boolean indicating whether the patient currently has an Axis II diagnosis."} ;; "Axis II diagnosis"

(declare-const patient_has_diagnosis_of_axis_ii_diagnosis_now@@of_antisocial_personality_disorder Bool) ;; {"when_to_set_to_true":"Set to true if the patient's Axis II diagnosis is specifically antisocial personality disorder.","when_to_set_to_false":"Set to false if the patient's Axis II diagnosis is not antisocial personality disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the Axis II diagnosis is antisocial personality disorder.","meaning":"Boolean indicating whether the patient's Axis II diagnosis is specifically antisocial personality disorder."} ;; "Axis II diagnosis of antisocial personality disorder"

(declare-const patient_has_diagnosis_of_axis_ii_diagnosis_now@@determined_by_structured_clinical_interview_for_dsm_iv_personality_disorder_section_using_dsm_iv_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's Axis II diagnosis of antisocial personality disorder was determined by the Structured Clinical Interview for DSM-IV personality disorder section using DSM-IV criteria.","when_to_set_to_false":"Set to false if the patient's Axis II diagnosis of antisocial personality disorder was not determined by this method.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether this method was used to determine the Axis II diagnosis of antisocial personality disorder.","meaning":"Boolean indicating whether the patient's Axis II diagnosis of antisocial personality disorder was determined by the Structured Clinical Interview for DSM-IV personality disorder section using DSM-IV criteria."} ;; "as determined by the Structured Clinical Interview for DSM-IV personality disorder section (using DSM-IV criteria)"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for antisocial personality disorder implies Axis II diagnosis
(assert
(! (=> patient_has_diagnosis_of_axis_ii_diagnosis_now@@of_antisocial_personality_disorder
       patient_has_diagnosis_of_axis_ii_diagnosis_now)
   :named REQ2_AUXILIARY0)) ;; "Axis II diagnosis of antisocial personality disorder"

;; Qualifier variable for diagnosis determined by SCID implies Axis II diagnosis of antisocial personality disorder
(assert
(! (=> patient_has_diagnosis_of_axis_ii_diagnosis_now@@determined_by_structured_clinical_interview_for_dsm_iv_personality_disorder_section_using_dsm_iv_criteria
       patient_has_diagnosis_of_axis_ii_diagnosis_now@@of_antisocial_personality_disorder)
   :named REQ2_AUXILIARY1)) ;; "as determined by the Structured Clinical Interview for DSM-IV personality disorder section (using DSM-IV criteria)"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_axis_ii_diagnosis_now@@determined_by_structured_clinical_interview_for_dsm_iv_personality_disorder_section_using_dsm_iv_criteria)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an Axis II diagnosis of antisocial personality disorder as determined by the Structured Clinical Interview for DSM-IV personality disorder section (using DSM-IV criteria)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const dementia_rating_scale_total_score_value_recorded_now_withunit_points Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's Dementia Rating Scale Total Score recorded now, in points.","when_to_set_to_null":"Set to null if the Dementia Rating Scale Total Score is unknown, not documented, or cannot be determined for the patient now.","meaning":"Numeric value of the patient's Dementia Rating Scale Total Score recorded now, in points."} ;; "Dementia Rating Scale Total Score less than or equal to 90"

(declare-const patient_has_finding_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of dementia.","meaning":"Boolean indicating whether the patient currently has dementia now."} ;; "dementia"

(declare-const patient_has_finding_of_dementia_now@@severity_moderate Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dementia and the severity is moderate.","when_to_set_to_false":"Set to false if the patient currently has dementia but the severity is not moderate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of dementia is moderate.","meaning":"Boolean indicating whether the patient currently has dementia of moderate severity."} ;; "moderate dementia"

(declare-const patient_has_finding_of_dementia_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dementia and the severity is severe.","when_to_set_to_false":"Set to false if the patient currently has dementia but the severity is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of dementia is severe.","meaning":"Boolean indicating whether the patient currently has dementia of severe severity."} ;; "severe dementia"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_dementia_now@@severity_moderate
       patient_has_finding_of_dementia_now)
   :named REQ3_AUXILIARY0)) ;; "moderate dementia"

(assert
(! (=> patient_has_finding_of_dementia_now@@severity_severe
       patient_has_finding_of_dementia_now)
   :named REQ3_AUXILIARY1)) ;; "severe dementia"

;; Definition: severe dementia = Dementia Rating Scale Total Score ≤ 90
(assert
(! (= patient_has_finding_of_dementia_now@@severity_severe
      (and patient_has_finding_of_dementia_now
           (<= dementia_rating_scale_total_score_value_recorded_now_withunit_points 90)))
   :named REQ3_AUXILIARY2)) ;; "severe dementia, defined as Dementia Rating Scale Total Score less than or equal to 90"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT have moderate dementia
(assert
(! (not patient_has_finding_of_dementia_now@@severity_moderate)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has moderate dementia."

;; Exclusion: patient must NOT have severe dementia (as defined above)
(assert
(! (not patient_has_finding_of_dementia_now@@severity_severe)
   :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe dementia, defined as Dementia Rating Scale Total Score less than or equal to 90."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================

(declare-const patient_has_finding_of_acute_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute medical illness.","when_to_set_to_false":"Set to false if the patient currently does not have an acute medical illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acute medical illness.","meaning":"Boolean indicating whether the patient currently has an acute medical illness."} ;; "acute medical illness"

(declare-const patient_has_finding_of_severe_medical_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a severe medical illness.","when_to_set_to_false":"Set to false if the patient currently does not have a severe medical illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a severe medical illness.","meaning":"Boolean indicating whether the patient currently has a severe medical illness."} ;; "severe medical illness"

(declare-const patient_has_finding_of_delirium_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has delirium.","when_to_set_to_false":"Set to false if the patient currently does not have delirium.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has delirium.","meaning":"Boolean indicating whether the patient currently has delirium."} ;; "delirium"

(declare-const patient_has_finding_of_secondary_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has metastatic cancer (secondary malignant neoplastic disease).","when_to_set_to_false":"Set to false if the patient currently does not have metastatic cancer (secondary malignant neoplastic disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has metastatic cancer (secondary malignant neoplastic disease).","meaning":"Boolean indicating whether the patient currently has metastatic cancer (secondary malignant neoplastic disease)."} ;; "metastatic cancer"

(declare-const patient_has_finding_of_decompensated_cardiac_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has decompensated cardiac failure.","when_to_set_to_false":"Set to false if the patient currently does not have decompensated cardiac failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has decompensated cardiac failure.","meaning":"Boolean indicating whether the patient currently has decompensated cardiac failure."} ;; "decompensated cardiac failure"

(declare-const patient_has_finding_of_hepatic_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatic (liver) failure.","when_to_set_to_false":"Set to false if the patient currently does not have hepatic (liver) failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatic (liver) failure.","meaning":"Boolean indicating whether the patient currently has hepatic (liver) failure."} ;; "decompensated liver failure"

(declare-const patient_has_finding_of_renal_failure_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has renal (kidney) failure.","when_to_set_to_false":"Set to false if the patient currently does not have renal (kidney) failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal (kidney) failure.","meaning":"Boolean indicating whether the patient currently has renal (kidney) failure."} ;; "decompensated kidney failure"

(declare-const patient_has_undergone_major_surgery_inthehistory@@temporalcontext_within3months_prior_to_entry Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone major surgery within the three months prior to entry.","when_to_set_to_false":"Set to false if the patient has not undergone major surgery within the three months prior to entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone major surgery within the three months prior to entry.","meaning":"Boolean indicating whether the patient has undergone major surgery within the three months prior to entry."} ;; "major surgery during the three months prior to entry"

(declare-const patient_has_finding_of_cerebrovascular_accident_inthehistory@@temporalcontext_within3months_prior_to_entry Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cerebrovascular accident (stroke) occurred within the three months prior to entry.","when_to_set_to_false":"Set to false if the patient's cerebrovascular accident (stroke) did not occur within the three months prior to entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cerebrovascular accident (stroke) occurred within the three months prior to entry.","meaning":"Boolean indicating whether the patient's cerebrovascular accident (stroke) occurred within the three months prior to entry."} ;; "stroke during the three months prior to entry"

(declare-const patient_has_finding_of_myocardial_infarction_inthehistory@@temporalcontext_within3months_prior_to_entry Bool) ;; {"when_to_set_to_true":"Set to true if the patient's myocardial infarction occurred within the three months prior to entry.","when_to_set_to_false":"Set to false if the patient's myocardial infarction did not occur within the three months prior to entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the myocardial infarction occurred within the three months prior to entry.","meaning":"Boolean indicating whether the patient's myocardial infarction occurred within the three months prior to entry."} ;; "myocardial infarction during the three months prior to entry"

(declare-const patient_is_exposed_to_drug_or_medicament_now@@known_to_cause_depression Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient is currently exposed to is known to cause depression.","when_to_set_to_false":"Set to false if the drug or medicament the patient is currently exposed to is not known to cause depression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is known to cause depression.","meaning":"Boolean indicating whether the drug or medicament the patient is currently exposed to is known to cause depression."} ;; "drugs known to cause depression"

(declare-const patient_is_exposed_to_reserpine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to (using) reserpine.","when_to_set_to_false":"Set to false if the patient is currently not exposed to (using) reserpine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to (using) reserpine.","meaning":"Boolean indicating whether the patient is currently exposed to (using) reserpine."} ;; "reserpine"

(declare-const patient_is_exposed_to_alpha_methyl_dopa_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to (using) alpha-methyl-dopa.","when_to_set_to_false":"Set to false if the patient is currently not exposed to (using) alpha-methyl-dopa.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to (using) alpha-methyl-dopa.","meaning":"Boolean indicating whether the patient is currently exposed to (using) alpha-methyl-dopa."} ;; "alpha-methyl-dopa"

(declare-const patient_is_exposed_to_steroids_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to (using) steroids.","when_to_set_to_false":"Set to false if the patient is currently not exposed to (using) steroids.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to (using) steroids.","meaning":"Boolean indicating whether the patient is currently exposed to (using) steroids."} ;; "steroids"

(declare-const patient_has_finding_of_chronic_addictive_drug_use_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic addictive drug use.","when_to_set_to_false":"Set to false if the patient currently does not have chronic addictive drug use.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic addictive drug use.","meaning":"Boolean indicating whether the patient currently has chronic addictive drug use."} ;; "chronic addictive drug use"

;; ===================== Auxiliary Assertions (REQ 4) =====================

;; Non-exhaustive examples imply severe medical illness
(assert
(! (=> (or patient_has_finding_of_delirium_now
           patient_has_finding_of_secondary_malignant_neoplastic_disease_now
           patient_has_finding_of_decompensated_cardiac_failure_now
           patient_has_finding_of_hepatic_failure_now
           patient_has_finding_of_renal_failure_syndrome_now
           patient_has_undergone_major_surgery_inthehistory@@temporalcontext_within3months_prior_to_entry
           patient_has_finding_of_cerebrovascular_accident_inthehistory@@temporalcontext_within3months_prior_to_entry
           patient_has_finding_of_myocardial_infarction_inthehistory@@temporalcontext_within3months_prior_to_entry)
    patient_has_finding_of_severe_medical_illness_now)
:named REQ4_AUXILIARY0)) ;; "severe medical illness with non-exhaustive examples ((delirium) OR (metastatic cancer) OR (decompensated cardiac failure) OR (decompensated liver failure) OR (decompensated kidney failure) OR (major surgery during the three months prior to entry) OR (stroke during the three months prior to entry) OR (myocardial infarction during the three months prior to entry))"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_undergone_major_surgery_inthehistory@@temporalcontext_within3months_prior_to_entry
       true)
:named REQ4_AUXILIARY1)) ;; "major surgery during the three months prior to entry" (qualifier variable)

(assert
(! (=> patient_has_finding_of_cerebrovascular_accident_inthehistory@@temporalcontext_within3months_prior_to_entry
       true)
:named REQ4_AUXILIARY2)) ;; "stroke during the three months prior to entry" (qualifier variable)

(assert
(! (=> patient_has_finding_of_myocardial_infarction_inthehistory@@temporalcontext_within3months_prior_to_entry
       true)
:named REQ4_AUXILIARY3)) ;; "myocardial infarction during the three months prior to entry" (qualifier variable)

;; Non-exhaustive examples imply drugs known to cause depression
(assert
(! (=> (or patient_is_exposed_to_reserpine_now
           patient_is_exposed_to_alpha_methyl_dopa_now
           patient_is_exposed_to_steroids_now)
    patient_is_exposed_to_drug_or_medicament_now@@known_to_cause_depression)
:named REQ4_AUXILIARY4)) ;; "drugs known to cause depression with non-exhaustive examples (reserpine, alpha-methyl-dopa, steroids)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@known_to_cause_depression
       true)
:named REQ4_AUXILIARY5)) ;; "drugs known to cause depression" (qualifier variable)

;; ===================== Constraint Assertions (REQ 4) =====================

(assert
(! (not patient_has_finding_of_acute_disease_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute medical illness."

(assert
(! (not patient_has_finding_of_severe_medical_illness_now)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe medical illness with non-exhaustive examples..."

(assert
(! (not patient_is_exposed_to_drug_or_medicament_now@@known_to_cause_depression)
:named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses drugs known to cause depression with non-exhaustive examples..."

(assert
(! (not patient_has_finding_of_chronic_addictive_drug_use_now)
:named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic addictive drug use."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_currently_involved_in_psychotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently involved in psychotherapy (ongoing at the present time).","when_to_set_to_false":"Set to false if the patient is not currently involved in psychotherapy (not ongoing at the present time).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently involved in psychotherapy.","meaning":"Boolean indicating whether the patient is currently involved in psychotherapy (ongoing at the present time)."} ;; "The patient is excluded if the patient is currently involved in psychotherapy."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_currently_involved_in_psychotherapy)
:named REQ5_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is currently involved in psychotherapy."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_aphasia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of aphasia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of aphasia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has aphasia.","meaning":"Boolean indicating whether the patient currently has aphasia."} ;; "aphasia"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_aphasia_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has aphasia."
