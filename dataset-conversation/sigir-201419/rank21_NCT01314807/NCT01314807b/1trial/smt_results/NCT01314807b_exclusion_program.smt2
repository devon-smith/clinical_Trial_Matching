;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_disorder_of_respiratory_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disorder of the respiratory system.","when_to_set_to_false":"Set to false if the patient currently does not have any disorder of the respiratory system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disorder of the respiratory system.","meaning":"Boolean indicating whether the patient currently has any disorder of the respiratory system."} ;; "respiratory disorder"

(declare-const patient_has_finding_of_disorder_of_respiratory_system_now@@not_chronic_obstructive_pulmonary_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the respiratory system and that disorder is not chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently has a disorder of the respiratory system and that disorder is chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder of the respiratory system is chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient's current disorder of the respiratory system is not chronic obstructive pulmonary disease."} ;; "respiratory disorder other than chronic obstructive pulmonary disease"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_of_respiratory_system_now@@not_chronic_obstructive_pulmonary_disease
      patient_has_finding_of_disorder_of_respiratory_system_now)
:named REQ0_AUXILIARY0)) ;; "respiratory disorder other than chronic obstructive pulmonary disease""

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_disorder_of_respiratory_system_now@@not_chronic_obstructive_pulmonary_disease)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a respiratory disorder other than chronic obstructive pulmonary disease."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_alpha_1_antitrypsin_deficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of alpha-1 antitrypsin deficiency.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of alpha-1 antitrypsin deficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of alpha-1 antitrypsin deficiency.","meaning":"Boolean indicating whether the patient currently has a diagnosis of alpha-1 antitrypsin deficiency."} ;; "alpha-1 antitrypsin deficiency"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_alpha_1_antitrypsin_deficiency_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has alpha-1 antitrypsin deficiency."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_inflammatory_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of inflammatory disorder at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of inflammatory disorder at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of inflammatory disorder.","meaning":"Boolean indicating whether the patient has a history of inflammatory disorder."} ;; "inflammatory disease"
(declare-const patient_has_finding_of_inflammatory_disorder_inthehistory@@excluding_chronic_obstructive_pulmonary_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of inflammatory disorder does not include chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient's history of inflammatory disorder includes chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether chronic obstructive pulmonary disease is excluded from the patient's history of inflammatory disorder.","meaning":"Boolean indicating whether the patient's history of inflammatory disorder excludes chronic obstructive pulmonary disease."} ;; "inflammatory disease other than chronic obstructive pulmonary disease"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_inflammatory_disorder_inthehistory@@excluding_chronic_obstructive_pulmonary_disease
      patient_has_finding_of_inflammatory_disorder_inthehistory)
:named REQ2_AUXILIARY0)) ;; "history of significant inflammatory disease other than chronic obstructive pulmonary disease"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_inflammatory_disorder_inthehistory@@excluding_chronic_obstructive_pulmonary_disease)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known history of significant inflammatory disease other than chronic obstructive pulmonary disease."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an acute exacerbation of chronic obstructive airways disease at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had an acute exacerbation of chronic obstructive airways disease in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an acute exacerbation of chronic obstructive airways disease.","meaning":"Boolean indicating whether the patient has ever had an acute exacerbation of chronic obstructive airways disease in the past."} ;; "chronic obstructive pulmonary disease exacerbation"
(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@temporalcontext_within_four_weeks_prior_to_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's acute exacerbation of chronic obstructive airways disease occurred within four weeks prior to the study.","when_to_set_to_false":"Set to false if the patient's acute exacerbation of chronic obstructive airways disease did not occur within four weeks prior to the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's acute exacerbation of chronic obstructive airways disease occurred within four weeks prior to the study.","meaning":"Boolean indicating whether the patient's acute exacerbation of chronic obstructive airways disease occurred within four weeks prior to the study."} ;; "within four weeks prior to study"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@temporalcontext_within_four_weeks_prior_to_study
      patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory)
   :named REQ3_AUXILIARY0)) ;; "chronic obstructive pulmonary disease exacerbation within four weeks prior to study"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@temporalcontext_within_four_weeks_prior_to_study)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a chronic obstructive pulmonary disease exacerbation within four weeks prior to study."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_undergone_operation_on_lung_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a surgical operation on the lung at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone a surgical operation on the lung at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a surgical operation on the lung.","meaning":"Boolean indicating whether the patient has ever undergone a surgical operation on the lung at any time in their history."} ;; "lung surgery"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_undergone_operation_on_lung_inthehistory)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had lung surgery."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with malignant neoplastic disease (cancer) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with malignant neoplastic disease (cancer) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient has ever been diagnosed with malignant neoplastic disease (cancer) at any time in their history."} ;; "cancer"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@recent_diagnosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of malignant neoplastic disease (cancer) is considered recent (according to study-specific definition, e.g., within the last X months/years).","when_to_set_to_false":"Set to false if the patient's diagnosis of malignant neoplastic disease (cancer) is not considered recent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is recent.","meaning":"Boolean indicating whether the patient's diagnosis of malignant neoplastic disease (cancer) is recent."} ;; "recent diagnosis of cancer"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@recent_diagnosis
      patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory)
:named REQ5_AUXILIARY0)) ;; "recent diagnosis of cancer" implies "diagnosis of cancer"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@recent_diagnosis)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a recent diagnosis of cancer."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_therapy_with_oral_corticosteroid_within_last_6_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had therapy with oral corticosteroid within the last six weeks.","when_to_set_to_false":"Set to false if the patient has not had therapy with oral corticosteroid within the last six weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had therapy with oral corticosteroid within the last six weeks.","meaning":"Boolean indicating whether the patient has had therapy with oral corticosteroid within the last six weeks."} ;; "has had therapy with oral corticosteroid within the last six weeks"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_therapy_with_oral_corticosteroid_within_last_6_weeks)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had therapy with oral corticosteroid within the last six weeks."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_co_morbid_conditions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any co-morbid conditions.","when_to_set_to_false":"Set to false if the patient currently does not have any co-morbid conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any co-morbid conditions.","meaning":"Boolean indicating whether the patient currently has any co-morbid conditions."} ;; "comorbidity"
(declare-const patient_has_finding_of_significant_cardiovascular_comorbidity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has significant cardiovascular comorbidity.","when_to_set_to_false":"Set to false if the patient currently does not have significant cardiovascular comorbidity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has significant cardiovascular comorbidity.","meaning":"Boolean indicating whether the patient currently has significant cardiovascular comorbidity."} ;; "significant cardiovascular comorbidity"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_significant_cardiovascular_comorbidity_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant cardiovascular comorbidity."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_orthopedic_problem_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an orthopedic problem.","when_to_set_to_false":"Set to false if the patient currently does not have an orthopedic problem.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an orthopedic problem.","meaning":"Boolean indicating whether the patient currently has an orthopedic problem."} ;; "orthopedic problem"
(declare-const patient_has_finding_of_orthopedic_problem_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's orthopedic problem is significant.","when_to_set_to_false":"Set to false if the patient's orthopedic problem is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's orthopedic problem is significant.","meaning":"Boolean indicating whether the patient's orthopedic problem is significant."} ;; "significant orthopedic problem"
(declare-const patient_has_finding_of_disorder_of_musculoskeletal_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the musculoskeletal system.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the musculoskeletal system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the musculoskeletal system.","meaning":"Boolean indicating whether the patient currently has a disorder of the musculoskeletal system."} ;; "musculoskeletal problem"
(declare-const patient_has_finding_of_disorder_of_musculoskeletal_system_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's disorder of the musculoskeletal system is significant.","when_to_set_to_false":"Set to false if the patient's disorder of the musculoskeletal system is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's disorder of the musculoskeletal system is significant.","meaning":"Boolean indicating whether the patient's disorder of the musculoskeletal system is significant."} ;; "significant musculoskeletal problem"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_orthopedic_problem_now@@significant
       patient_has_finding_of_orthopedic_problem_now)
   :named REQ8_AUXILIARY0)) ;; "significant orthopedic problem"

(assert
(! (=> patient_has_finding_of_disorder_of_musculoskeletal_system_now@@significant
       patient_has_finding_of_disorder_of_musculoskeletal_system_now)
   :named REQ8_AUXILIARY1)) ;; "significant musculoskeletal problem"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (or patient_has_finding_of_orthopedic_problem_now@@significant
            patient_has_finding_of_disorder_of_musculoskeletal_system_now@@significant))
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has significant orthopedic problem) OR (the patient has significant musculoskeletal problem)."
