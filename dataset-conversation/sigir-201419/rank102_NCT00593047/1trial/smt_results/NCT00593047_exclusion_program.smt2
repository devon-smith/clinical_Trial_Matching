;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_exposed_to_antilipemic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any antilipemic agent (cholesterol lowering agent).","when_to_set_to_false":"Set to false if the patient is currently not exposed to any antilipemic agent (cholesterol lowering agent).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any antilipemic agent.","meaning":"Boolean indicating whether the patient is currently exposed to any antilipemic agent (cholesterol lowering agent)." } ;; "cholesterol lowering agents"
(declare-const patient_is_exposed_to_antilipemic_agent_now@@other_than_defined_statins Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to antilipemic agents that are not among the defined statins.","when_to_set_to_false":"Set to false if the patient is currently exposed only to the defined statins or not exposed to any antilipemic agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to antilipemic agents other than the defined statins.","meaning":"Boolean indicating whether the patient is currently exposed to antilipemic agents other than the defined statins."} ;; "other than the defined statins"

;; ===================== Qualifier variable implies stem variable (REQ 0) =====================
(assert
(! (=> patient_is_exposed_to_antilipemic_agent_now@@other_than_defined_statins
      patient_is_exposed_to_antilipemic_agent_now)
   :named REQ0_AUXILIARY0)) ;; "other than the defined statins" implies "cholesterol lowering agents"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_exposed_to_antilipemic_agent_now@@other_than_defined_statins)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses cholesterol lowering agents other than the defined statins."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_history_of_somatic_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of somatic disease.","when_to_set_to_false":"Set to false if the patient does not have a history of somatic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of somatic disease.","meaning":"Boolean indicating whether the patient has a history of somatic disease."} ;; "history of somatic disease"
(declare-const patient_has_history_of_somatic_disease@@may_interfere_with_study_objectives_as_judged_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of somatic disease may interfere with the objectives of the study as judged by the investigator.","when_to_set_to_false":"Set to false if the patient's history of somatic disease does not interfere with the objectives of the study as judged by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of somatic disease may interfere with the objectives of the study as judged by the investigator.","meaning":"Boolean indicating whether the patient's history of somatic disease may interfere with the objectives of the study as judged by the investigator."} ;; "history of somatic disease which may interfere with the objectives of the study as judged by the investigator"

(declare-const patient_has_diagnosis_of_mental_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a mental disorder (psychiatric disease) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a mental disorder (psychiatric disease) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a mental disorder (psychiatric disease).","meaning":"Boolean indicating whether the patient has ever been diagnosed with a mental disorder (psychiatric disease) at any time in the past."} ;; "history of psychiatric disease"
(declare-const patient_has_diagnosis_of_mental_disorder_inthehistory@@may_interfere_with_study_objectives_as_judged_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of mental disorder (psychiatric disease) may interfere with the objectives of the study as judged by the investigator.","when_to_set_to_false":"Set to false if the patient's history of mental disorder (psychiatric disease) does not interfere with the objectives of the study as judged by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of mental disorder (psychiatric disease) may interfere with the objectives of the study as judged by the investigator.","meaning":"Boolean indicating whether the patient's history of mental disorder (psychiatric disease) may interfere with the objectives of the study as judged by the investigator."} ;; "history of psychiatric disease which may interfere with the objectives of the study as judged by the investigator"

(declare-const patient_has_history_of_somatic_condition Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of somatic condition.","when_to_set_to_false":"Set to false if the patient does not have a history of somatic condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of somatic condition.","meaning":"Boolean indicating whether the patient has a history of somatic condition."} ;; "history of somatic condition"
(declare-const patient_has_history_of_somatic_condition@@may_interfere_with_study_objectives_as_judged_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of somatic condition may interfere with the objectives of the study as judged by the investigator.","when_to_set_to_false":"Set to false if the patient's history of somatic condition does not interfere with the objectives of the study as judged by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of somatic condition may interfere with the objectives of the study as judged by the investigator.","meaning":"Boolean indicating whether the patient's history of somatic condition may interfere with the objectives of the study as judged by the investigator."} ;; "history of somatic condition which may interfere with the objectives of the study as judged by the investigator"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_history_of_somatic_disease@@may_interfere_with_study_objectives_as_judged_by_investigator
      patient_has_history_of_somatic_disease)
:named REQ1_AUXILIARY0)) ;; "history of somatic disease which may interfere with the objectives of the study as judged by the investigator"

(assert
(! (=> patient_has_diagnosis_of_mental_disorder_inthehistory@@may_interfere_with_study_objectives_as_judged_by_investigator
      patient_has_diagnosis_of_mental_disorder_inthehistory)
:named REQ1_AUXILIARY1)) ;; "history of psychiatric disease which may interfere with the objectives of the study as judged by the investigator"

(assert
(! (=> patient_has_history_of_somatic_condition@@may_interfere_with_study_objectives_as_judged_by_investigator
      patient_has_history_of_somatic_condition)
:named REQ1_AUXILIARY2)) ;; "history of somatic condition which may interfere with the objectives of the study as judged by the investigator"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_history_of_somatic_disease@@may_interfere_with_study_objectives_as_judged_by_investigator)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of somatic disease which may interfere with the objectives of the study as judged by the investigator."

(assert
(! (not patient_has_diagnosis_of_mental_disorder_inthehistory@@may_interfere_with_study_objectives_as_judged_by_investigator)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of psychiatric disease which may interfere with the objectives of the study as judged by the investigator."

(assert
(! (not patient_has_history_of_somatic_condition@@may_interfere_with_study_objectives_as_judged_by_investigator)
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of somatic condition which may interfere with the objectives of the study as judged by the investigator."

(assert
(! (not patient_has_diagnosis_of_mental_disorder_inthehistory@@may_interfere_with_study_objectives_as_judged_by_investigator)
:named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of psychiatric condition which may interfere with the objectives of the study as judged by the investigator."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_illness_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an illness within the past 2 weeks.","when_to_set_to_false":"Set to false if the patient has not had an illness within the past 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an illness within the past 2 weeks.","meaning":"Boolean indicating whether the patient has had an illness within the past 2 weeks."} ;; "illness within 2 weeks before the administration of the investigational product"
(declare-const patient_has_finding_of_illness_inthepast2weeks@@temporalcontext_within2weeks_before_administration_of_investigational_product Bool) ;; {"when_to_set_to_true":"Set to true if the illness occurred within 2 weeks before the administration of the investigational product.","when_to_set_to_false":"Set to false if the illness did not occur within 2 weeks before the administration of the investigational product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the illness occurred within 2 weeks before the administration of the investigational product.","meaning":"Boolean indicating whether the illness occurred within 2 weeks before the administration of the investigational product."} ;; "within 2 weeks before the administration of the investigational product"
(declare-const patient_has_finding_of_illness_inthepast2weeks@@is_clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the illness within the past 2 weeks is clinically significant.","when_to_set_to_false":"Set to false if the illness within the past 2 weeks is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the illness within the past 2 weeks is clinically significant.","meaning":"Boolean indicating whether the illness within the past 2 weeks is clinically significant."} ;; "clinically significant illness"
(declare-const patient_has_finding_of_illness_inthepast2weeks@@as_judged_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an illness within the past 2 weeks and the illness is considered clinically significant as judged by the investigator.","when_to_set_to_false":"Set to false if the patient has had an illness within the past 2 weeks and the illness is not considered clinically significant as judged by the investigator, or if the patient has not had an illness within the past 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a clinically significant illness within the past 2 weeks as judged by the investigator.","meaning":"Boolean indicating whether the patient has had a clinically significant illness within the past 2 weeks as judged by the investigator."} ;; "as judged by the investigator"

(declare-const patient_has_finding_of_traumatic_injury_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a traumatic injury within the past 2 weeks.","when_to_set_to_false":"Set to false if the patient has not had a traumatic injury within the past 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a traumatic injury within the past 2 weeks.","meaning":"Boolean indicating whether the patient has had a traumatic injury within the past 2 weeks."} ;; "trauma within 2 weeks before the administration of the investigational product"
(declare-const patient_has_finding_of_traumatic_injury_inthepast2weeks@@temporalcontext_within2weeks_before_administration_of_investigational_product Bool) ;; {"when_to_set_to_true":"Set to true if the traumatic injury occurred within 2 weeks before the administration of the investigational product.","when_to_set_to_false":"Set to false if the traumatic injury did not occur within 2 weeks before the administration of the investigational product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the traumatic injury occurred within 2 weeks before the administration of the investigational product.","meaning":"Boolean indicating whether the traumatic injury occurred within 2 weeks before the administration of the investigational product."} ;; "within 2 weeks before the administration of the investigational product"
(declare-const patient_has_finding_of_traumatic_injury_inthepast2weeks@@is_clinically_relevant Bool) ;; {"when_to_set_to_true":"Set to true if the traumatic injury within the past 2 weeks is clinically relevant.","when_to_set_to_false":"Set to false if the traumatic injury within the past 2 weeks is not clinically relevant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the traumatic injury within the past 2 weeks is clinically relevant.","meaning":"Boolean indicating whether the traumatic injury within the past 2 weeks is clinically relevant."} ;; "clinically relevant trauma"
(declare-const patient_has_finding_of_traumatic_injury_inthepast2weeks@@as_judged_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the traumatic injury within the past 2 weeks is considered relevant as judged by the investigator.","when_to_set_to_false":"Set to false if the traumatic injury within the past 2 weeks is not considered relevant as judged by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the traumatic injury within the past 2 weeks is considered relevant as judged by the investigator.","meaning":"Boolean indicating whether the traumatic injury within the past 2 weeks is considered relevant as judged by the investigator."} ;; "as judged by the investigator"
(declare-const patient_has_finding_of_traumatic_injury_inthepast2weeks@@is_clinically_relevant@@as_judged_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a traumatic injury within the past 2 weeks and the injury is considered clinically relevant as judged by the investigator.","when_to_set_to_false":"Set to false if the patient has had a traumatic injury within the past 2 weeks and the injury is not considered clinically relevant as judged by the investigator, or if the patient has not had a traumatic injury within the past 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a clinically relevant traumatic injury within the past 2 weeks as judged by the investigator.","meaning":"Boolean indicating whether the patient has had a clinically relevant traumatic injury within the past 2 weeks as judged by the investigator."} ;; "clinically relevant trauma within 2 weeks before the administration of the investigational product as judged by the investigator"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables for illness
(assert
(! (=> patient_has_finding_of_illness_inthepast2weeks@@temporalcontext_within2weeks_before_administration_of_investigational_product
      patient_has_finding_of_illness_inthepast2weeks)
:named REQ2_AUXILIARY0)) ;; "illness within 2 weeks before the administration of the investigational product"

(assert
(! (=> patient_has_finding_of_illness_inthepast2weeks@@is_clinically_significant
      patient_has_finding_of_illness_inthepast2weeks)
:named REQ2_AUXILIARY1)) ;; "clinically significant illness"

(assert
(! (=> patient_has_finding_of_illness_inthepast2weeks@@as_judged_by_investigator
      patient_has_finding_of_illness_inthepast2weeks@@is_clinically_significant)
:named REQ2_AUXILIARY2)) ;; "as judged by the investigator"

;; Qualifier variables imply corresponding stem variables for trauma
(assert
(! (=> patient_has_finding_of_traumatic_injury_inthepast2weeks@@temporalcontext_within2weeks_before_administration_of_investigational_product
      patient_has_finding_of_traumatic_injury_inthepast2weeks)
:named REQ2_AUXILIARY3)) ;; "trauma within 2 weeks before the administration of the investigational product"

(assert
(! (=> patient_has_finding_of_traumatic_injury_inthepast2weeks@@is_clinically_relevant
      patient_has_finding_of_traumatic_injury_inthepast2weeks)
:named REQ2_AUXILIARY4)) ;; "clinically relevant trauma"

(assert
(! (=> patient_has_finding_of_traumatic_injury_inthepast2weeks@@as_judged_by_investigator
      patient_has_finding_of_traumatic_injury_inthepast2weeks@@is_clinically_relevant)
:named REQ2_AUXILIARY5)) ;; "as judged by the investigator"

(assert
(! (=> patient_has_finding_of_traumatic_injury_inthepast2weeks@@is_clinically_relevant@@as_judged_by_investigator
      (and patient_has_finding_of_traumatic_injury_inthepast2weeks@@is_clinically_relevant
           patient_has_finding_of_traumatic_injury_inthepast2weeks@@as_judged_by_investigator))
:named REQ2_AUXILIARY6)) ;; "clinically relevant trauma within 2 weeks before the administration of the investigational product as judged by the investigator"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_illness_inthepast2weeks@@as_judged_by_investigator)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "clinically significant illness within 2 weeks before the administration of the investigational product as judged by the investigator"

(assert
(! (not patient_has_finding_of_traumatic_injury_inthepast2weeks@@is_clinically_relevant@@as_judged_by_investigator)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "clinically relevant trauma within 2 weeks before the administration of the investigational product as judged by the investigator"

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const chronic_pain_condition_duration_value_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months the patient's chronic pain condition has lasted.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many months the patient's chronic pain condition has lasted.","meaning":"Numeric value indicating the duration in months of the patient's chronic pain condition."} ;; "duration greater than 3 months"
(declare-const patient_has_chronic_pain_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chronic pain condition.","when_to_set_to_false":"Set to false if the patient currently does not have a chronic pain condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a chronic pain condition.","meaning":"Boolean indicating whether the patient currently has a chronic pain condition."} ;; "chronic pain condition"
(declare-const patient_has_finding_of_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pain.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pain.","meaning":"Boolean indicating whether the patient currently has pain."} ;; "pain"
(declare-const patient_has_finding_of_pain_now@@chronic_with_duration_greater_than_3_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pain and the pain is chronic with duration greater than 3 months.","when_to_set_to_false":"Set to false if the patient currently has pain but it is not chronic or the duration is 3 months or less.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pain is chronic with duration greater than 3 months.","meaning":"Boolean indicating whether the patient's current pain is chronic with duration greater than 3 months."} ;; "chronic pain condition with duration greater than 3 months"
(declare-const patient_requires_daily_medication_with_pain_killers_for_chronic_pain_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently requires daily medication with pain killers for their chronic pain condition.","when_to_set_to_false":"Set to false if the patient currently does not require daily medication with pain killers for their chronic pain condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently requires daily medication with pain killers for their chronic pain condition.","meaning":"Boolean indicating whether the patient currently requires daily medication with pain killers for their chronic pain condition."} ;; "requiring daily medication with pain killers"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition: chronic pain condition with duration greater than 3 months
(assert
(! (= patient_has_finding_of_pain_now@@chronic_with_duration_greater_than_3_months
     (and patient_has_finding_of_pain_now
          (> chronic_pain_condition_duration_value_in_months 3)))
:named REQ3_AUXILIARY0)) ;; "chronic pain condition with duration greater than 3 months"

;; Chronic pain condition now implies pain now
(assert
(! (=> patient_has_chronic_pain_condition_now
       patient_has_finding_of_pain_now)
:named REQ3_AUXILIARY1)) ;; "chronic pain condition" implies "pain"

;; Chronic pain condition with duration > 3 months implies chronic pain condition now
(assert
(! (=> patient_has_finding_of_pain_now@@chronic_with_duration_greater_than_3_months
       patient_has_chronic_pain_condition_now)
:named REQ3_AUXILIARY2)) ;; "chronic pain condition with duration greater than 3 months" implies "chronic pain condition"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (and patient_has_finding_of_pain_now@@chronic_with_duration_greater_than_3_months
             patient_requires_daily_medication_with_pain_killers_for_chronic_pain_condition_now))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a chronic pain condition with duration greater than 3 months requiring daily medication with pain killers."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_glycosylated_hemoglobin_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's glycosylated hemoglobin is recorded now in percent units.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's glycosylated hemoglobin measured now, in percent units."} ;; "glycosylated haemoglobin greater than 7.0 percent"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (> patient_glycosylated_hemoglobin_value_recorded_now_withunit_percent 7.0))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has glycosylated haemoglobin greater than 7.0 percent."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus."} ;; "diabetes"
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now@@requires_medication_other_than_metformin Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has diabetes mellitus and the diabetes requires medication other than metformin.","when_to_set_to_false":"Set to false if the patient currently has diabetes mellitus but the diabetes does not require medication other than metformin (i.e., only metformin or no medication is required).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diabetes requires medication other than metformin.","meaning":"Boolean indicating whether the patient's diabetes mellitus requires medication other than metformin."} ;; "diabetes requiring medication other than metformin"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_diabetes_mellitus_now@@requires_medication_other_than_metformin
      patient_has_diagnosis_of_diabetes_mellitus_now)
:named REQ5_AUXILIARY0)) ;; "diabetes requiring medication other than metformin" implies "diabetes"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_diagnosis_of_diabetes_mellitus_now@@requires_medication_other_than_metformin)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diabetes requiring medication other than metformin."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_problem_abnormal_examination_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abnormal physical findings.","when_to_set_to_false":"Set to false if the patient currently does not have abnormal physical findings.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abnormal physical findings.","meaning":"Boolean indicating whether the patient currently has abnormal physical findings."} ;; "abnormal physical findings"
(declare-const patient_has_finding_of_problem_abnormal_examination_now@@judged_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the abnormal physical findings are judged by the investigator.","when_to_set_to_false":"Set to false if the abnormal physical findings are not judged by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal physical findings are judged by the investigator.","meaning":"Boolean indicating whether the abnormal physical findings are judged by the investigator."} ;; "as judged by the investigator"
(declare-const patient_has_finding_of_problem_abnormal_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abnormal laboratory values.","when_to_set_to_false":"Set to false if the patient currently does not have abnormal laboratory values.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abnormal laboratory values.","meaning":"Boolean indicating whether the patient currently has abnormal laboratory values."} ;; "abnormal laboratory values"
(declare-const patient_has_finding_of_problem_abnormal_test_now@@judged_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the abnormal laboratory values are judged by the investigator.","when_to_set_to_false":"Set to false if the abnormal laboratory values are not judged by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal laboratory values are judged by the investigator.","meaning":"Boolean indicating whether the abnormal laboratory values are judged by the investigator."} ;; "as judged by the investigator"
(declare-const patient_has_finding_of_electrocardiogram_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an abnormal resting electrocardiogram.","when_to_set_to_false":"Set to false if the patient currently does not have an abnormal resting electrocardiogram.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an abnormal resting electrocardiogram.","meaning":"Boolean indicating whether the patient currently has an abnormal resting electrocardiogram."} ;; "abnormal resting electrocardiogram"
(declare-const patient_qt_interval_value_recorded_now_in_milliseconds Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's corrected QT interval in milliseconds as measured on a resting electrocardiogram, recorded now.","when_to_set_to_null":"Set to null if the corrected QT interval value is unknown, not documented, or cannot be determined now.","meaning":"Numeric value of the patient's corrected QT interval on a resting electrocardiogram, recorded now, in milliseconds."} ;; "corrected QT interval greater than 450 milliseconds"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_problem_abnormal_examination_now@@judged_by_investigator
      patient_has_finding_of_problem_abnormal_examination_now)
    :named REQ6_AUXILIARY0)) ;; "abnormal physical findings as judged by the investigator"

(assert
(! (=> patient_has_finding_of_problem_abnormal_test_now@@judged_by_investigator
      patient_has_finding_of_problem_abnormal_test_now)
    :named REQ6_AUXILIARY1)) ;; "abnormal laboratory values as judged by the investigator"

;; Non-exhaustive example: corrected QT interval > 450 ms implies abnormal resting ECG
(assert
(! (=> (> patient_qt_interval_value_recorded_now_in_milliseconds 450)
      patient_has_finding_of_electrocardiogram_abnormal_now)
    :named REQ6_AUXILIARY2)) ;; "abnormal resting electrocardiogram with non-exhaustive examples (corrected QT interval greater than 450 milliseconds)"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_problem_abnormal_examination_now@@judged_by_investigator)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "clinically abnormal physical findings as judged by the investigator"

(assert
(! (not patient_has_finding_of_problem_abnormal_test_now@@judged_by_investigator)
    :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "clinically abnormal laboratory values as judged by the investigator"

(assert
(! (not patient_has_finding_of_electrocardiogram_abnormal_now)
    :named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "abnormal resting electrocardiogram with non-exhaustive examples (corrected QT interval greater than 450 milliseconds)"

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body mass index (BMI) in kilograms per square meter is recorded now.","when_to_set_to_null":"Set to null if no BMI measurement in kilograms per square meter is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kilograms per square meter."} ;; "body mass index"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (>= patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 40))
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has body mass index greater than or equal to 40 kilograms per square meter."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_cerebrovascular_accident_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a cerebrovascular accident (stroke) within the past 3 months prior to assessment.","when_to_set_to_false":"Set to false if the patient has not had a cerebrovascular accident (stroke) within the past 3 months prior to assessment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a cerebrovascular accident (stroke) within the past 3 months prior to assessment.","meaning":"Boolean indicating whether the patient has had a cerebrovascular accident (stroke) within the past 3 months."} ;; "stroke"
(declare-const patient_has_finding_of_transient_cerebral_ischemia_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a transient cerebral ischemia (transient ischemic attack) within the past 3 months prior to assessment.","when_to_set_to_false":"Set to false if the patient has not had a transient cerebral ischemia (transient ischemic attack) within the past 3 months prior to assessment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a transient cerebral ischemia (transient ischemic attack) within the past 3 months prior to assessment.","meaning":"Boolean indicating whether the patient has had a transient cerebral ischemia (transient ischemic attack) within the past 3 months."} ;; "transient ischemic attack"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_cerebrovascular_accident_inthepast3months)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a recent history within less than 3 months of stroke."

(assert
(! (not patient_has_finding_of_transient_cerebral_ischemia_inthepast3months)
:named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a recent history within less than 3 months of transient ischemic attack."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_seizure_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a history of seizure disorder at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a history of seizure disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of seizure disorder.","meaning":"Boolean indicating whether the patient has ever had a history of seizure disorder."} ;; "history of seizure disorder"
(declare-const patient_has_finding_of_seizure_disorder_inthehistory@@history_limited_to_febrile_convulsions Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of seizure disorder is limited to febrile convulsions (i.e., the only seizure events in history were febrile convulsions).","when_to_set_to_false":"Set to false if the patient's history of seizure disorder includes other types of seizures beyond febrile convulsions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of seizure disorder is limited to febrile convulsions.","meaning":"Boolean indicating whether the patient's history of seizure disorder is limited to febrile convulsions."} ;; "history limited to febrile convulsions"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_seizure_disorder_inthehistory@@history_limited_to_febrile_convulsions
      patient_has_finding_of_seizure_disorder_inthehistory)
:named REQ9_AUXILIARY0)) ;; "EXCEPT if the history is limited to febrile convulsions."

;; ===================== Constraint Assertions (REQ 9) =====================
;; Exclusion: patient must NOT have a history of seizure disorder unless it is limited to febrile convulsions
(assert
(! (not (and patient_has_finding_of_seizure_disorder_inthehistory
             (not patient_has_finding_of_seizure_disorder_inthehistory@@history_limited_to_febrile_convulsions)))
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of seizure disorder EXCEPT if the history is limited to febrile convulsions."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (cancer)."} ;; "current diagnosis of cancer"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@in_remission Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (cancer) and the disease is in remission.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of malignant neoplastic disease (cancer) and the disease is not in remission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's malignant neoplastic disease (cancer) is in remission.","meaning":"Boolean indicating whether the patient's current malignant neoplastic disease (cancer) is in remission."} ;; "cancer in remission"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@in_remission
      patient_has_diagnosis_of_malignant_neoplastic_disease_now)
:named REQ10_AUXILIARY0)) ;; "cancer in remission" implies "current diagnosis of cancer"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Exclusion: patient must NOT have a current diagnosis of cancer unless the cancer is in remission
(assert
(! (not (and patient_has_diagnosis_of_malignant_neoplastic_disease_now
             (not patient_has_diagnosis_of_malignant_neoplastic_disease_now@@in_remission)))
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a current diagnosis of cancer) AND (the patient does NOT have cancer in remission)."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's systolic blood pressure is recorded now in millimeters of mercury.","when_to_set_to_null":"Set to null if no systolic blood pressure measurement is available for now or the value is indeterminate.","meaning":"Numeric value of the patient's systolic blood pressure measured now, in millimeters of mercury."} ;; "systolic blood pressure"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's diastolic blood pressure is recorded now in millimeters of mercury.","when_to_set_to_null":"Set to null if no diastolic blood pressure measurement is available for now or the value is indeterminate.","meaning":"Numeric value of the patient's diastolic blood pressure measured now, in millimeters of mercury."} ;; "diastolic blood pressure"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! (not (> patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 160))
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has systolic blood pressure greater than 160 millimeters of mercury."

(assert
  (! (not (> patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 95))
     :named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diastolic blood pressure greater than 95 millimeters of mercury."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_diagnosis_of_cardiac_arrhythmia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with cardiac arrhythmia at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with cardiac arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with cardiac arrhythmia.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of cardiac arrhythmia."} ;; "history of cardiac arrhythmia"
(declare-const patient_has_diagnosis_of_supraventricular_tachyarrhythmia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with supraventricular tachyarrhythmia at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with supraventricular tachyarrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with supraventricular tachyarrhythmia.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of supraventricular tachyarrhythmia."} ;; "history of intermittent supraventricular tachyarrhythmia"
(declare-const patient_has_diagnosis_of_atrial_fibrillation_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with atrial fibrillation at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with atrial fibrillation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with atrial fibrillation.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of atrial fibrillation."} ;; "history of atrial fibrillation"
(declare-const patient_has_diagnosis_of_tachyarrhythmia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with tachyarrhythmia at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with tachyarrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with tachyarrhythmia.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of tachyarrhythmia."} ;; "history of tachyarrhythmia"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_supraventricular_tachyarrhythmia_inthehistory
          patient_has_diagnosis_of_atrial_fibrillation_inthehistory)
     patient_has_diagnosis_of_cardiac_arrhythmia_inthehistory)
:named REQ12_AUXILIARY0)) ;; "with non-exhaustive examples (history of intermittent supraventricular tachyarrhythmia, history of atrial fibrillation)"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_diagnosis_of_cardiac_arrhythmia_inthehistory)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of cardiac arrhythmia with non-exhaustive examples (history of intermittent supraventricular tachyarrhythmia, history of atrial fibrillation)."

;; --- verifier-bypassed (attempt 8/8) 2025-10-24T10:06:23.461884 policy=eventual
;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_diagnosis_of_angina_pectoris_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with angina pectoris at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with angina pectoris.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with angina pectoris.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of angina pectoris."} ;; "angina pectoris"

(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with myocardial infarction at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with myocardial infarction.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of myocardial infarction."} ;; "myocardial infarction"

(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone coronary artery bypass graft surgery at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone coronary artery bypass graft surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone coronary artery bypass graft surgery.","meaning":"Boolean indicating whether the patient has ever undergone coronary artery bypass graft surgery."} ;; "coronary bypass graft surgery"

(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone percutaneous coronary intervention at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone percutaneous coronary intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone percutaneous coronary intervention.","meaning":"Boolean indicating whether the patient has ever undergone percutaneous coronary intervention."} ;; "percutaneous coronary intervention"

(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@temporalcontext_within6months_before_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone percutaneous coronary intervention and the procedure occurred within 6 months before randomization.","when_to_set_to_false":"Set to false if the patient has undergone percutaneous coronary intervention but the procedure did not occur within 6 months before randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure occurred within 6 months before randomization.","meaning":"Boolean indicating whether the patient's percutaneous coronary intervention occurred within 6 months before randomization."} ;; "percutaneous coronary intervention less than 6 months before randomization"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variable implies corresponding stem variable for percutaneous coronary intervention
(assert
(! (=> patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@temporalcontext_within6months_before_randomization
      patient_has_undergone_percutaneous_coronary_intervention_inthehistory)
:named REQ13_AUXILIARY0)) ;; "percutaneous coronary intervention less than 6 months before randomization"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_diagnosis_of_angina_pectoris_inthehistory)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had unstable angina pectoris less than 6 months before randomization."

(assert
(! (not patient_has_diagnosis_of_myocardial_infarction_inthehistory)
:named REQ13_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had myocardial infarction less than 6 months before randomization."

(assert
(! (not patient_has_undergone_coronary_artery_bypass_graft_inthehistory)
:named REQ13_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had coronary bypass graft surgery less than 6 months before randomization."

(assert
(! (not patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@temporalcontext_within6months_before_randomization)
:named REQ13_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had percutaneous coronary intervention less than 6 months before randomization."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_diagnosis_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of congestive heart failure.","meaning":"Boolean indicating whether the patient currently has a diagnosis of congestive heart failure."} ;; "congestive heart failure"
(declare-const patient_nyha_class_value_recorded_now_withunit_integer Real) ;; {"when_to_set_to_value":"Set to the integer value of the patient's current NYHA Class (e.g., 1, 2, 3, 4) as recorded now.","when_to_set_to_null":"Set to null if the patient's current NYHA Class is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current NYHA Class, recorded as an integer at the present time."} ;; "New York Heart Association Class greater than 2"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
  (! (not (and patient_has_diagnosis_of_congestive_heart_failure_now
               (> patient_nyha_class_value_recorded_now_withunit_integer 2)))
     :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has congestive heart failure New York Heart Association Class greater than 2."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_diagnosis_of_preinfarction_syndrome_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with unstable angina pectoris (preinfarction syndrome) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with unstable angina pectoris (preinfarction syndrome) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with unstable angina pectoris (preinfarction syndrome).","meaning":"Boolean indicating whether the patient has ever been diagnosed with unstable angina pectoris (preinfarction syndrome) in their history."} ;; "unstable angina pectoris"
(declare-const patient_has_diagnosis_of_severe_angina_pectoris_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with severe angina pectoris at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with severe angina pectoris at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with severe angina pectoris.","meaning":"Boolean indicating whether the patient has ever been diagnosed with severe angina pectoris in their history."} ;; "severe angina pectoris"
(declare-const patient_has_diagnosis_of_peripheral_arterial_occlusive_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with peripheral arterial occlusive disease at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with peripheral arterial occlusive disease at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with peripheral arterial occlusive disease.","meaning":"Boolean indicating whether the patient has ever been diagnosed with peripheral arterial occlusive disease in their history."} ;; "peripheral artery disease"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_diagnosis_of_preinfarction_syndrome_inthehistory)
    :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has unstable angina pectoris."

(assert
(! (not patient_has_diagnosis_of_severe_angina_pectoris_inthehistory)
    :named REQ15_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe angina pectoris."

(assert
(! (not patient_has_diagnosis_of_peripheral_arterial_occlusive_disease_inthehistory)
    :named REQ15_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has peripheral artery disease."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_diagnosis_of_disorder_of_thyroid_gland_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of disorder of thyroid gland.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of disorder of thyroid gland.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of disorder of thyroid gland.","meaning":"Boolean indicating whether the patient currently has a diagnosis of disorder of thyroid gland."} ;; "the patient has known thyroid disease"
(declare-const patient_has_diagnosis_of_disorder_of_thyroid_gland_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of disorder of thyroid gland and the diagnosis is known.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of disorder of thyroid gland but the diagnosis is not known.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of disorder of thyroid gland is known.","meaning":"Boolean indicating whether the diagnosis of disorder of thyroid gland is known."} ;; "the patient has known thyroid disease"

(declare-const patients_thyrotrophin_is_abnormal_now@@at_enrolment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's thyroid stimulating hormone (TSH) is abnormal now and the measurement is at enrolment.","when_to_set_to_false":"Set to false if the patient's thyroid stimulating hormone (TSH) is abnormal now but not at enrolment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal TSH measurement is at enrolment.","meaning":"Boolean indicating whether the abnormal TSH measurement is at enrolment."} ;; "thyroid stimulating hormone ... outside the reference range for normal at enrolment"
(declare-const patients_triiodothyronine_is_abnormal_now@@at_enrolment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's triiodothyronine (T3) is abnormal now and the measurement is at enrolment.","when_to_set_to_false":"Set to false if the patient's triiodothyronine (T3) is abnormal now but not at enrolment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal triiodothyronine (T3) measurement is at enrolment.","meaning":"Boolean indicating whether the abnormal triiodothyronine (T3) measurement is at enrolment."} ;; "triiodothyronine ... outside the reference range for normal at enrolment"
(declare-const patients_free_triiodothyronine_is_abnormal_now@@at_enrolment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's free triiodothyronine is abnormal now and the measurement is at enrolment.","when_to_set_to_false":"Set to false if the patient's free triiodothyronine is abnormal now but not at enrolment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal free triiodothyronine measurement is at enrolment.","meaning":"Boolean indicating whether the abnormal free triiodothyronine measurement is at enrolment."} ;; "free triiodothyronine ... outside the reference range for normal at enrolment"
(declare-const patients_thyroxine_is_abnormal_now@@at_enrolment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's thyroxine (T4) is abnormal now and the measurement is at enrolment.","when_to_set_to_false":"Set to false if the patient's thyroxine (T4) is abnormal now but not at enrolment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal thyroxine (T4) measurement is at enrolment.","meaning":"Boolean indicating whether the abnormal thyroxine (T4) measurement is at enrolment."} ;; "thyroxine ... outside the reference range for normal at enrolment"
(declare-const patients_free_thyroxine_is_abnormal_now@@at_enrolment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's free thyroxine is abnormal now and the measurement is at enrolment.","when_to_set_to_false":"Set to false if the patient's free thyroxine is abnormal now but not at enrolment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal free thyroxine measurement is at enrolment.","meaning":"Boolean indicating whether the abnormal free thyroxine measurement is at enrolment."} ;; "free thyroxine ... outside the reference range for normal at enrolment"

(declare-const patients_thyrotrophin_is_abnormal_now@@at_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the patient's thyroid stimulating hormone (TSH) is abnormal now and the measurement is at baseline.","when_to_set_to_false":"Set to false if the patient's thyroid stimulating hormone (TSH) is abnormal now but not at baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal TSH measurement is at baseline.","meaning":"Boolean indicating whether the abnormal TSH measurement is at baseline."} ;; "thyroid stimulating hormone ... outside the reference range for normal at baseline"
(declare-const patients_triiodothyronine_is_abnormal_now@@at_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the patient's triiodothyronine (T3) is abnormal now and the measurement is at baseline.","when_to_set_to_false":"Set to false if the patient's triiodothyronine (T3) is abnormal now but not at baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal triiodothyronine (T3) measurement is at baseline.","meaning":"Boolean indicating whether the abnormal triiodothyronine (T3) measurement is at baseline."} ;; "triiodothyronine ... outside the reference range for normal at baseline"
(declare-const patients_free_triiodothyronine_is_abnormal_now@@at_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the patient's free triiodothyronine is abnormal now and the measurement is at baseline.","when_to_set_to_false":"Set to false if the patient's free triiodothyronine is abnormal now but not at baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal free triiodothyronine measurement is at baseline.","meaning":"Boolean indicating whether the abnormal free triiodothyronine measurement is at baseline."} ;; "free triiodothyronine ... outside the reference range for normal at baseline"
(declare-const patients_thyroxine_is_abnormal_now@@at_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the patient's thyroxine (T4) is abnormal now and the measurement is at baseline.","when_to_set_to_false":"Set to false if the patient's thyroxine (T4) is abnormal now but not at baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal thyroxine (T4) measurement is at baseline.","meaning":"Boolean indicating whether the abnormal thyroxine (T4) measurement is at baseline."} ;; "thyroxine ... outside the reference range for normal at baseline"
(declare-const patients_free_thyroxine_is_abnormal_now@@at_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the patient's free thyroxine is abnormal now and the measurement is at baseline.","when_to_set_to_false":"Set to false if the patient's free thyroxine is abnormal now but not at baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal free thyroxine measurement is at baseline.","meaning":"Boolean indicating whether the abnormal free thyroxine measurement is at baseline."} ;; "free thyroxine ... outside the reference range for normal at baseline"

;; ===================== Auxiliary Assertions (REQ 16) =====================
;; Qualifier variable implies stem variable for thyroid disease
(assert
(! (=> patient_has_diagnosis_of_disorder_of_thyroid_gland_now@@known
       patient_has_diagnosis_of_disorder_of_thyroid_gland_now)
   :named REQ16_AUXILIARY0)) ;; "the patient has known thyroid disease"

;; ===================== Auxiliary Assertions for exhaustive subcategories (REQ 16) =====================
;; At enrolment: umbrella ≡ (any abnormal biomarker at enrolment)
(assert
(! (= (or patients_thyrotrophin_is_abnormal_now@@at_enrolment
          patients_triiodothyronine_is_abnormal_now@@at_enrolment
          patients_free_triiodothyronine_is_abnormal_now@@at_enrolment
          patients_thyroxine_is_abnormal_now@@at_enrolment
          patients_free_thyroxine_is_abnormal_now@@at_enrolment)
       (or patients_thyrotrophin_is_abnormal_now@@at_enrolment
           patients_triiodothyronine_is_abnormal_now@@at_enrolment
           patients_free_triiodothyronine_is_abnormal_now@@at_enrolment
           patients_thyroxine_is_abnormal_now@@at_enrolment
           patients_free_thyroxine_is_abnormal_now@@at_enrolment))
   :named REQ16_AUXILIARY1)) ;; "thyroid biomarker with exhaustive subcategories (thyroid stimulating hormone, triiodothyronine, free triiodothyronine, thyroxine, free thyroxine) outside the reference range for normal at enrolment"

;; At baseline: umbrella ≡ (any abnormal biomarker at baseline)
(assert
(! (= (or patients_thyrotrophin_is_abnormal_now@@at_baseline
          patients_triiodothyronine_is_abnormal_now@@at_baseline
          patients_free_triiodothyronine_is_abnormal_now@@at_baseline
          patients_thyroxine_is_abnormal_now@@at_baseline
          patients_free_thyroxine_is_abnormal_now@@at_baseline)
       (or patients_thyrotrophin_is_abnormal_now@@at_baseline
           patients_triiodothyronine_is_abnormal_now@@at_baseline
           patients_free_triiodothyronine_is_abnormal_now@@at_baseline
           patients_thyroxine_is_abnormal_now@@at_baseline
           patients_free_thyroxine_is_abnormal_now@@at_baseline))
   :named REQ16_AUXILIARY2)) ;; "thyroid biomarker with exhaustive subcategories (thyroid stimulating hormone, triiodothyronine, free triiodothyronine, thyroxine, free thyroxine) outside the reference range for normal at baseline"

;; ===================== Constraint Assertions (REQ 16) =====================
;; Exclusion: patient must NOT have known thyroid disease
(assert
(! (not patient_has_diagnosis_of_disorder_of_thyroid_gland_now@@known)
   :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has known thyroid disease"

;; Exclusion: patient must NOT have any abnormal thyroid biomarker at enrolment
(assert
(! (not (or patients_thyrotrophin_is_abnormal_now@@at_enrolment
            patients_triiodothyronine_is_abnormal_now@@at_enrolment
            patients_free_triiodothyronine_is_abnormal_now@@at_enrolment
            patients_thyroxine_is_abnormal_now@@at_enrolment
            patients_free_thyroxine_is_abnormal_now@@at_enrolment))
   :named REQ16_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has thyroid biomarker ... outside the reference range for normal at enrolment"

;; Exclusion: patient must NOT have any abnormal thyroid biomarker at baseline
(assert
(! (not (or patients_thyrotrophin_is_abnormal_now@@at_baseline
            patients_triiodothyronine_is_abnormal_now@@at_baseline
            patients_free_triiodothyronine_is_abnormal_now@@at_baseline
            patients_thyroxine_is_abnormal_now@@at_baseline
            patients_free_thyroxine_is_abnormal_now@@at_baseline))
   :named REQ16_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient has thyroid biomarker ... outside the reference range for normal at baseline"

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_is_woman Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a woman (female sex assigned at birth or identifies as female).","when_to_set_to_false":"Set to false if the patient is not a woman (not female sex assigned at birth and does not identify as female).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a woman.","meaning":"Boolean indicating whether the patient is a woman."} ;; "the patient is a woman"
(declare-const patient_has_positive_urine_pregnancy_test_at_enrolment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a positive urine pregnancy test result at the time of enrolment.","when_to_set_to_false":"Set to false if the patient has a negative urine pregnancy test result at the time of enrolment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a positive urine pregnancy test result at the time of enrolment.","meaning":"Boolean indicating whether the patient has a positive urine pregnancy test result at the time of enrolment."} ;; "the patient has a positive urine pregnancy test at enrolment"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not (and patient_is_woman patient_has_positive_urine_pregnancy_test_at_enrolment))
:named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is a woman) AND (the patient has a positive urine pregnancy test at enrolment)."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_has_undergone_thyroid_hormone_replacement_therapy_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone thyroid hormone replacement therapy within the past 3 months before randomization.","when_to_set_to_false":"Set to false if the patient has not undergone thyroid hormone replacement therapy within the past 3 months before randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone thyroid hormone replacement therapy within the past 3 months before randomization.","meaning":"Boolean indicating whether the patient has undergone thyroid hormone replacement therapy within the past 3 months before randomization."} ;; "the patient has used thyroid replacement therapy in the last 3 months before randomization"

(declare-const patient_has_undergone_thyroid_hormone_replacement_therapy_inthepast3months@@temporalcontext_within3months_before_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone thyroid hormone replacement therapy within the past 3 months and the window is anchored before randomization.","when_to_set_to_false":"Set to false if the patient has not undergone thyroid hormone replacement therapy within the past 3 months before randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone thyroid hormone replacement therapy within the past 3 months before randomization.","meaning":"Boolean indicating whether the patient has undergone thyroid hormone replacement therapy within the past 3 months before randomization."} ;; "in the last 3 months before randomization"

(declare-const patient_has_undergone_hormone_replacement_therapy_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone hormone replacement therapy within the past 3 months before randomization.","when_to_set_to_false":"Set to false if the patient has not undergone hormone replacement therapy within the past 3 months before randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone hormone replacement therapy within the past 3 months before randomization.","meaning":"Boolean indicating whether the patient has undergone hormone replacement therapy within the past 3 months before randomization."} ;; "the patient has used hormone replacement therapy in the last 3 months before randomization"

(declare-const patient_has_undergone_hormone_replacement_therapy_inthepast3months@@temporalcontext_within3months_before_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone hormone replacement therapy within the past 3 months and the window is anchored before randomization.","when_to_set_to_false":"Set to false if the patient has not undergone hormone replacement therapy within the past 3 months before randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone hormone replacement therapy within the past 3 months before randomization.","meaning":"Boolean indicating whether the patient has undergone hormone replacement therapy within the past 3 months before randomization."} ;; "in the last 3 months before randomization"

(declare-const patient_has_used_contraceptive_pills_inthepast3months_before_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used contraceptive pills within the last 3 months before randomization.","when_to_set_to_false":"Set to false if the patient has not used contraceptive pills within the last 3 months before randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used contraceptive pills within the last 3 months before randomization.","meaning":"Boolean indicating whether the patient has used contraceptive pills within the last 3 months before randomization."} ;; "contraceptive pills in the last 3 months before randomization"

;; ===================== Auxiliary Assertions (REQ 18) =====================
;; Qualifier variable implies corresponding stem variable for thyroid hormone replacement therapy
(assert
(! (=> patient_has_undergone_thyroid_hormone_replacement_therapy_inthepast3months@@temporalcontext_within3months_before_randomization
      patient_has_undergone_thyroid_hormone_replacement_therapy_inthepast3months)
:named REQ18_AUXILIARY0)) ;; "in the last 3 months before randomization"

;; Qualifier variable implies corresponding stem variable for hormone replacement therapy
(assert
(! (=> patient_has_undergone_hormone_replacement_therapy_inthepast3months@@temporalcontext_within3months_before_randomization
      patient_has_undergone_hormone_replacement_therapy_inthepast3months)
:named REQ18_AUXILIARY1)) ;; "in the last 3 months before randomization"

;; Non-exhaustive example: contraceptive pills imply hormone replacement therapy
(assert
(! (=> patient_has_used_contraceptive_pills_inthepast3months_before_randomization
      patient_has_undergone_hormone_replacement_therapy_inthepast3months)
:named REQ18_AUXILIARY2)) ;; "hormone replacement therapy with non-exhaustive examples (contraceptive pills)"

;; ===================== Constraint Assertions (REQ 18) =====================
;; Exclusion: patient must NOT have used thyroid hormone replacement therapy in the last 3 months before randomization
(assert
(! (not patient_has_undergone_thyroid_hormone_replacement_therapy_inthepast3months)
:named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has used thyroid replacement therapy in the last 3 months before randomization"

;; Exclusion: patient must NOT have used hormone replacement therapy in the last 3 months before randomization
(assert
(! (not patient_has_undergone_hormone_replacement_therapy_inthepast3months)
:named REQ18_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has used hormone replacement therapy with non-exhaustive examples (contraceptive pills) in the last 3 months before randomization"
