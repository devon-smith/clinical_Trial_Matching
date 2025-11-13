;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_chronic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a chronic disease at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had a chronic disease in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a chronic disease.","meaning":"Boolean indicating whether the patient has ever had a chronic disease."} ;; "chronic medical condition"

(declare-const patient_has_finding_of_chronic_kidney_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had chronic kidney disease at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had chronic kidney disease in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had chronic kidney disease.","meaning":"Boolean indicating whether the patient has ever had chronic kidney disease."} ;; "chronic renal disease"

(declare-const patient_has_finding_of_contraindication_to_exposure_study_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had any chronic medical condition considered by the principal investigator as a contraindication to the exposure study at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had any chronic medical condition considered by the principal investigator as a contraindication to the exposure study in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had any chronic medical condition considered by the principal investigator as a contraindication to the exposure study.","meaning":"Boolean indicating whether the patient has ever had any chronic medical condition considered by the principal investigator as a contraindication to the exposure study."} ;; "chronic medical condition considered by the principal investigator as a contraindication to the exposure study"

(declare-const patient_has_finding_of_contraindication_to_exposure_study_inthehistory@@considered_by_principal_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the contraindication is considered by the principal investigator.","when_to_set_to_false":"Set to false if the contraindication is not considered by the principal investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the contraindication is considered by the principal investigator.","meaning":"Boolean indicating whether the contraindication is considered by the principal investigator."} ;; "considered by the principal investigator"

(declare-const patient_has_finding_of_diabetes_mellitus_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had diabetes mellitus at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had diabetes mellitus in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had diabetes mellitus.","meaning":"Boolean indicating whether the patient has ever had diabetes mellitus."} ;; "diabetes mellitus"

(declare-const patient_has_finding_of_diabetes_mellitus_inthehistory@@requires_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diabetes mellitus requires medication.","when_to_set_to_false":"Set to false if the patient's diabetes mellitus does not require medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diabetes mellitus requires medication.","meaning":"Boolean indicating whether the patient's diabetes mellitus requires medication."} ;; "diabetes mellitus requiring medication"

(declare-const patient_has_finding_of_disorder_of_cardiovascular_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a disorder of the cardiovascular system at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had a disorder of the cardiovascular system in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a disorder of the cardiovascular system.","meaning":"Boolean indicating whether the patient has ever had a disorder of the cardiovascular system."} ;; "cardiovascular disease"

(declare-const patient_has_finding_of_disorder_of_cardiovascular_system_inthehistory@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's disorder of the cardiovascular system is considered significant.","when_to_set_to_false":"Set to false if the patient's disorder of the cardiovascular system is not considered significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder is significant.","meaning":"Boolean indicating whether the patient's disorder of the cardiovascular system is significant."} ;; "significant cardiovascular disease"

(declare-const patient_has_finding_of_disorder_of_thyroid_gland_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a disorder of the thyroid gland at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had a disorder of the thyroid gland in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a disorder of the thyroid gland.","meaning":"Boolean indicating whether the patient has ever had a disorder of the thyroid gland."} ;; "chronic thyroid disease"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_contraindication_to_exposure_study_inthehistory@@considered_by_principal_investigator
      patient_has_finding_of_contraindication_to_exposure_study_inthehistory)
:named REQ0_AUXILIARY0)) ;; "considered by the principal investigator"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_diabetes_mellitus_inthehistory@@requires_medication
      patient_has_finding_of_diabetes_mellitus_inthehistory)
:named REQ0_AUXILIARY1)) ;; "diabetes mellitus requiring medication"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_of_cardiovascular_system_inthehistory@@significant
      patient_has_finding_of_disorder_of_cardiovascular_system_inthehistory)
:named REQ0_AUXILIARY2)) ;; "significant cardiovascular disease"

;; Non-exhaustive examples: listed conditions imply umbrella term
(assert
(! (=> (or patient_has_finding_of_disorder_of_cardiovascular_system_inthehistory@@significant
          patient_has_finding_of_diabetes_mellitus_inthehistory@@requires_medication
          patient_has_finding_of_chronic_kidney_disease_inthehistory
          patient_has_finding_of_disorder_of_thyroid_gland_inthehistory)
      patient_has_finding_of_contraindication_to_exposure_study_inthehistory@@considered_by_principal_investigator)
:named REQ0_AUXILIARY3)) ;; "including (but not limited to) significant cardiovascular disease, diabetes mellitus requiring medication, chronic renal disease, or chronic thyroid disease"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_contraindication_to_exposure_study_inthehistory@@considered_by_principal_investigator)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any chronic medical condition considered by the principal investigator as a contraindication to the exposure study, including (but not limited to) significant cardiovascular disease, diabetes mellitus requiring medication, chronic renal disease, or chronic thyroid disease."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_emergency_treatment_management_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone emergency treatment management at any time within the past twelve months.","when_to_set_to_false":"Set to false if the patient has not undergone emergency treatment management within the past twelve months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone emergency treatment management within the past twelve months.","meaning":"Boolean indicating whether the patient has undergone emergency treatment management within the past twelve months."} ;; "emergency treatment"
(declare-const patient_has_undergone_emergency_treatment_management_inthepast12months@@physician_directed Bool) ;; {"when_to_set_to_true":"Set to true if the emergency treatment management within the past twelve months was physician-directed.","when_to_set_to_false":"Set to false if the emergency treatment management within the past twelve months was not physician-directed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the emergency treatment management within the past twelve months was physician-directed.","meaning":"Boolean indicating whether the emergency treatment management within the past twelve months was physician-directed."} ;; "physician directed"
(declare-const patient_has_undergone_emergency_treatment_management_inthepast12months@@for_asthma_exacerbation Bool) ;; {"when_to_set_to_true":"Set to true if the emergency treatment management within the past twelve months was for an asthma exacerbation.","when_to_set_to_false":"Set to false if the emergency treatment management within the past twelve months was not for an asthma exacerbation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the emergency treatment management within the past twelve months was for an asthma exacerbation.","meaning":"Boolean indicating whether the emergency treatment management within the past twelve months was for an asthma exacerbation."} ;; "for an asthma exacerbation"
(declare-const patient_has_undergone_emergency_treatment_management_inthepast12months@@physician_directed@@for_asthma_exacerbation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone physician-directed emergency treatment management for an asthma exacerbation within the past twelve months.","when_to_set_to_false":"Set to false if the patient has not undergone physician-directed emergency treatment management for an asthma exacerbation within the past twelve months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone physician-directed emergency treatment management for an asthma exacerbation within the past twelve months.","meaning":"Boolean indicating whether the patient has undergone physician-directed emergency treatment management for an asthma exacerbation within the past twelve months."} ;; "physician directed emergency treatment for an asthma exacerbation within the preceding twelve months"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_undergone_emergency_treatment_management_inthepast12months@@physician_directed
      patient_has_undergone_emergency_treatment_management_inthepast12months)
:named REQ1_AUXILIARY0)) ;; "physician directed emergency treatment"

(assert
(! (=> patient_has_undergone_emergency_treatment_management_inthepast12months@@for_asthma_exacerbation
      patient_has_undergone_emergency_treatment_management_inthepast12months)
:named REQ1_AUXILIARY1)) ;; "emergency treatment for an asthma exacerbation"

;; Double qualifier variable implies both single qualifiers and stem variable
(assert
(! (=> patient_has_undergone_emergency_treatment_management_inthepast12months@@physician_directed@@for_asthma_exacerbation
      (and patient_has_undergone_emergency_treatment_management_inthepast12months@@physician_directed
           patient_has_undergone_emergency_treatment_management_inthepast12months@@for_asthma_exacerbation
           patient_has_undergone_emergency_treatment_management_inthepast12months))
:named REQ1_AUXILIARY2)) ;; "physician directed emergency treatment for an asthma exacerbation within the preceding twelve months"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_undergone_emergency_treatment_management_inthepast12months@@physician_directed@@for_asthma_exacerbation)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received physician directed emergency treatment for an asthma exacerbation within the preceding twelve months."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_exposed_to_steroid_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to a steroid at any time in the past twelve months, regardless of indication.","when_to_set_to_false":"Set to false if the patient has not been exposed to a steroid at any time in the past twelve months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to a steroid in the past twelve months.","meaning":"Boolean indicating whether the patient has been exposed to a steroid in the past twelve months."} ;; "systemic steroid therapy within the preceding twelve months"
(declare-const patient_is_exposed_to_steroid_inthepast12months@@for_asthma_exacerbation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's steroid exposure in the past twelve months was for the treatment of an asthma exacerbation.","when_to_set_to_false":"Set to false if the patient's steroid exposure in the past twelve months was not for the treatment of an asthma exacerbation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the steroid exposure was for an asthma exacerbation.","meaning":"Boolean indicating whether the steroid exposure in the past twelve months was for an asthma exacerbation."} ;; "for an asthma exacerbation"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_steroid_inthepast12months@@for_asthma_exacerbation
      patient_is_exposed_to_steroid_inthepast12months)
:named REQ2_AUXILIARY0)) ;; "systemic steroid therapy within the preceding twelve months for an asthma exacerbation"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_exposed_to_steroid_inthepast12months@@for_asthma_exacerbation)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used systemic steroid therapy within the preceding twelve months for an asthma exacerbation."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_undergone_inhaled_steroid_therapy_inthepast1months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has initiated use of inhaled steroid therapy within the past one month.","when_to_set_to_false":"Set to false if the patient has not initiated use of inhaled steroid therapy within the past one month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has initiated use of inhaled steroid therapy within the past one month.","meaning":"Boolean indicating whether the patient has initiated use of inhaled steroid therapy within the past one month."} ;; "initiated use of inhaled steroid therapy within the past one month"

(declare-const patient_has_undergone_inhaled_cromolyn_therapy_inthepast1months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has initiated use of inhaled cromolyn therapy within the past one month.","when_to_set_to_false":"Set to false if the patient has not initiated use of inhaled cromolyn therapy within the past one month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has initiated use of inhaled cromolyn therapy within the past one month.","meaning":"Boolean indicating whether the patient has initiated use of inhaled cromolyn therapy within the past one month."} ;; "initiated use of inhaled cromolyn therapy within the past one month"

(declare-const patient_has_undergone_inhaled_cromolyn_therapy_inthepast1months@@exclusively_prior_to_exercise Bool) ;; {"when_to_set_to_true":"Set to true if the patient's use of inhaled cromolyn therapy within the past one month was exclusively prior to exercise.","when_to_set_to_false":"Set to false if the patient's use of inhaled cromolyn therapy within the past one month was not exclusively prior to exercise.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's use of inhaled cromolyn therapy within the past one month was exclusively prior to exercise.","meaning":"Boolean indicating whether the patient's use of inhaled cromolyn therapy within the past one month was exclusively prior to exercise."} ;; "use of inhaled cromolyn therapy exclusively prior to exercise"

(declare-const patient_has_undergone_leukotriene_inhibitor_therapy_inthepast1months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has initiated use of leukotriene inhibitor therapy within the past one month.","when_to_set_to_false":"Set to false if the patient has not initiated use of leukotriene inhibitor therapy within the past one month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has initiated use of leukotriene inhibitor therapy within the past one month.","meaning":"Boolean indicating whether the patient has initiated use of leukotriene inhibitor therapy within the past one month."} ;; "initiated use of leukotriene inhibitor therapy within the past one month"

(declare-const patient_has_undergone_montelukast_therapy_inthepast1months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has initiated use of montelukast therapy within the past one month.","when_to_set_to_false":"Set to false if the patient has not initiated use of montelukast therapy within the past one month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has initiated use of montelukast therapy within the past one month.","meaning":"Boolean indicating whether the patient has initiated use of montelukast therapy within the past one month."} ;; "initiated use of montelukast therapy within the past one month"

(declare-const patient_has_undergone_zafirkulast_therapy_inthepast1months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has initiated use of zafirkulast therapy within the past one month.","when_to_set_to_false":"Set to false if the patient has not initiated use of zafirkulast therapy within the past one month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has initiated use of zafirkulast therapy within the past one month.","meaning":"Boolean indicating whether the patient has initiated use of zafirkulast therapy within the past one month."} ;; "initiated use of zafirkulast therapy within the past one month"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_inhaled_cromolyn_therapy_inthepast1months@@exclusively_prior_to_exercise
      patient_has_undergone_inhaled_cromolyn_therapy_inthepast1months)
:named REQ3_AUXILIARY0)) ;; "use of inhaled cromolyn therapy exclusively prior to exercise implies use of inhaled cromolyn therapy"

;; Non-exhaustive examples: montelukast and zafirkulast are examples of leukotriene inhibitor therapy
(assert
(! (=> (or patient_has_undergone_montelukast_therapy_inthepast1months
           patient_has_undergone_zafirkulast_therapy_inthepast1months)
      patient_has_undergone_leukotriene_inhibitor_therapy_inthepast1months)
:named REQ3_AUXILIARY1)) ;; "leukotriene inhibitor therapy (montelukast therapy OR zafirkulast therapy) within the past one month"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion 1: inhaled steroid therapy within past one month
(assert
(! (not patient_has_undergone_inhaled_steroid_therapy_inthepast1months)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has initiated use of inhaled steroid therapy within the past one month."

;; Exclusion 2: inhaled cromolyn therapy within past one month, except exclusively prior to exercise
(assert
(! (not (and patient_has_undergone_inhaled_cromolyn_therapy_inthepast1months
             (not patient_has_undergone_inhaled_cromolyn_therapy_inthepast1months@@exclusively_prior_to_exercise)))
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has initiated use of inhaled cromolyn therapy within the past one month, except for use of inhaled cromolyn therapy exclusively prior to exercise."

;; Exclusion 3: leukotriene inhibitor therapy within past one month
(assert
(! (not patient_has_undergone_leukotriene_inhibitor_therapy_inthepast1months)
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has initiated use of leukotriene inhibitor therapy (montelukast therapy OR zafirkulast therapy) within the past one month."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_used_daily_theophylline_therapy_within_past_1_month Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used daily theophylline therapy at any time within the past one month.","when_to_set_to_false":"Set to false if the patient has not used daily theophylline therapy at any time within the past one month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used daily theophylline therapy within the past one month.","meaning":"Boolean indicating whether the patient has used daily theophylline therapy at any time within the past one month."} ;; "has used daily theophylline therapy within the past one month"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_has_used_daily_theophylline_therapy_within_past_1_month)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used daily theophylline therapy within the past one month."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding a baby.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is nursing a baby"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not (or patient_is_pregnant_now patient_is_breastfeeding_now))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is pregnant) OR (the patient is nursing a baby)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_tobacco_smoking_behavior_finding_value_recorded_now_withunit_pack_per_month Real) ;; {"when_to_set_to_value":"Set to the number of packs of cigarettes the patient currently smokes per month, if available.","when_to_set_to_null":"Set to null if the number of packs of cigarettes the patient currently smokes per month is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of packs of cigarettes the patient currently smokes per month."} ;; "smokes more than one pack of cigarettes per month"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (> patient_tobacco_smoking_behavior_finding_value_recorded_now_withunit_pack_per_month 1))
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient smokes more than one pack of cigarettes per month."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_symptoms_of_nocturnal_cough_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had symptoms of nocturnal cough at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had symptoms of nocturnal cough at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had symptoms of nocturnal cough.","meaning":"Boolean indicating whether the patient has symptoms of nocturnal cough at any point in their history."} ;; "nighttime symptoms of cough"
(declare-const patient_has_symptoms_of_nocturnal_cough_inthehistory@@at_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the patient's nocturnal cough symptoms occur at baseline.","when_to_set_to_false":"Set to false if the patient's nocturnal cough symptoms do not occur at baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's nocturnal cough symptoms occur at baseline.","meaning":"Boolean indicating whether the patient's nocturnal cough symptoms occur at baseline."} ;; "at baseline"
(declare-const patient_has_symptoms_of_nocturnal_cough_inthehistory@@frequency_greater_than_one_time_per_week Bool) ;; {"when_to_set_to_true":"Set to true if the patient's nocturnal cough symptoms occur greater than one time per week.","when_to_set_to_false":"Set to false if the patient's nocturnal cough symptoms occur one time per week or less.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's nocturnal cough symptoms occur greater than one time per week.","meaning":"Boolean indicating whether the patient's nocturnal cough symptoms occur greater than one time per week."} ;; "greater than one time per week"
(declare-const patient_has_symptoms_of_nocturnal_cough_inthehistory@@not_during_viral_induced_asthma_exacerbation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's nocturnal cough symptoms do not occur during a clearly recognized viral induced asthma exacerbation.","when_to_set_to_false":"Set to false if the patient's nocturnal cough symptoms do occur during a clearly recognized viral induced asthma exacerbation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's nocturnal cough symptoms occur during a clearly recognized viral induced asthma exacerbation.","meaning":"Boolean indicating whether the patient's nocturnal cough symptoms do not occur during a clearly recognized viral induced asthma exacerbation."} ;; "not during a clearly recognized viral induced asthma exacerbation"

(declare-const patient_has_symptoms_of_wheezing_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had symptoms of wheezing at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had symptoms of wheezing at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had symptoms of wheezing.","meaning":"Boolean indicating whether the patient has symptoms of wheezing at any point in their history."} ;; "wheeze"
(declare-const patient_has_symptoms_of_wheezing_inthehistory@@at_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the patient's wheezing symptoms occur at baseline.","when_to_set_to_false":"Set to false if the patient's wheezing symptoms do not occur at baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's wheezing symptoms occur at baseline.","meaning":"Boolean indicating whether the patient's wheezing symptoms occur at baseline."} ;; "at baseline"
(declare-const patient_has_symptoms_of_wheezing_inthehistory@@frequency_greater_than_one_time_per_week Bool) ;; {"when_to_set_to_true":"Set to true if the patient's wheezing symptoms occur greater than one time per week.","when_to_set_to_false":"Set to false if the patient's wheezing symptoms occur one time per week or less.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's wheezing symptoms occur greater than one time per week.","meaning":"Boolean indicating whether the patient's wheezing symptoms occur greater than one time per week."} ;; "greater than one time per week"
(declare-const patient_has_symptoms_of_wheezing_inthehistory@@not_during_viral_induced_asthma_exacerbation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's wheezing symptoms do not occur during a clearly recognized viral induced asthma exacerbation.","when_to_set_to_false":"Set to false if the patient's wheezing symptoms do occur during a clearly recognized viral induced asthma exacerbation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's wheezing symptoms occur during a clearly recognized viral induced asthma exacerbation.","meaning":"Boolean indicating whether the patient's wheezing symptoms do not occur during a clearly recognized viral induced asthma exacerbation."} ;; "not during a clearly recognized viral induced asthma exacerbation"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (and patient_has_symptoms_of_nocturnal_cough_inthehistory@@at_baseline
             patient_has_symptoms_of_nocturnal_cough_inthehistory@@frequency_greater_than_one_time_per_week
             patient_has_symptoms_of_nocturnal_cough_inthehistory@@not_during_viral_induced_asthma_exacerbation))
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has nighttime symptoms of cough greater than one time per week at baseline, not during a clearly recognized viral induced asthma exacerbation."

(assert
(! (not (and patient_has_symptoms_of_wheezing_inthehistory@@at_baseline
             patient_has_symptoms_of_wheezing_inthehistory@@frequency_greater_than_one_time_per_week
             patient_has_symptoms_of_wheezing_inthehistory@@not_during_viral_induced_asthma_exacerbation))
   :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has nighttime symptoms of wheeze greater than one time per week at baseline, not during a clearly recognized viral induced asthma exacerbation."

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_symptoms_of_nocturnal_cough_inthehistory@@at_baseline
       patient_has_symptoms_of_nocturnal_cough_inthehistory)
   :named REQ7_AUXILIARY0)) ;; "at baseline" for nocturnal cough

(assert
(! (=> patient_has_symptoms_of_nocturnal_cough_inthehistory@@frequency_greater_than_one_time_per_week
       patient_has_symptoms_of_nocturnal_cough_inthehistory)
   :named REQ7_AUXILIARY1)) ;; "greater than one time per week" for nocturnal cough

(assert
(! (=> patient_has_symptoms_of_nocturnal_cough_inthehistory@@not_during_viral_induced_asthma_exacerbation
       patient_has_symptoms_of_nocturnal_cough_inthehistory)
   :named REQ7_AUXILIARY2)) ;; "not during a clearly recognized viral induced asthma exacerbation" for nocturnal cough

(assert
(! (=> patient_has_symptoms_of_wheezing_inthehistory@@at_baseline
       patient_has_symptoms_of_wheezing_inthehistory)
   :named REQ7_AUXILIARY3)) ;; "at baseline" for wheezing

(assert
(! (=> patient_has_symptoms_of_wheezing_inthehistory@@frequency_greater_than_one_time_per_week
       patient_has_symptoms_of_wheezing_inthehistory)
   :named REQ7_AUXILIARY4)) ;; "greater than one time per week" for wheezing

(assert
(! (=> patient_has_symptoms_of_wheezing_inthehistory@@not_during_viral_induced_asthma_exacerbation
       patient_has_symptoms_of_wheezing_inthehistory)
   :named REQ7_AUXILIARY5)) ;; "not during a clearly recognized viral induced asthma exacerbation" for wheezing

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_exacerbation_of_asthma_value_recorded_now_withunit_per_week Real) ;; {"when_to_set_to_value":"Set to the number of asthma exacerbations the patient currently experiences per week, if available.","when_to_set_to_null":"Set to null if the number of asthma exacerbations per week is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current frequency of asthma exacerbations per week."} ;; "exacerbation of asthma more than two times per week"

(declare-const patient_has_finding_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has asthma.","when_to_set_to_false":"Set to false if the patient currently does not have asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has asthma.","meaning":"Boolean indicating whether the patient currently has asthma."} ;; "asthma"

(declare-const patient_has_finding_of_moderate_persistent_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has moderate persistent asthma.","when_to_set_to_false":"Set to false if the patient currently does not have moderate persistent asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has moderate persistent asthma.","meaning":"Boolean indicating whether the patient currently has moderate persistent asthma."} ;; "moderate persistent asthma"

(declare-const patient_has_finding_of_severe_persistent_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe persistent asthma.","when_to_set_to_false":"Set to false if the patient currently does not have severe persistent asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe persistent asthma.","meaning":"Boolean indicating whether the patient currently has severe persistent asthma."} ;; "severe persistent asthma"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Definition: moderate persistent asthma or severe persistent asthma as outlined in guidelines is characterized by exacerbation of asthma more than two times per week
(assert
(! (= (or patient_has_finding_of_moderate_persistent_asthma_now
         patient_has_finding_of_severe_persistent_asthma_now)
    (and patient_has_finding_of_asthma_now
         (> patient_exacerbation_of_asthma_value_recorded_now_withunit_per_week 2)))
:named REQ8_AUXILIARY0)) ;; "which would be characteristic of moderate persistent asthma or severe persistent asthma as outlined in the current National Heart, Lung, and Blood Institute guidelines for diagnosis and management of asthma."

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (and patient_has_finding_of_asthma_now
             (> patient_exacerbation_of_asthma_value_recorded_now_withunit_per_week 2)))
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has exacerbation of asthma more than two times per week, which would be characteristic of moderate persistent asthma or severe persistent asthma as outlined in the current National Heart, Lung, and Blood Institute guidelines for diagnosis and management of asthma."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_is_taking_albuterol_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an albuterol-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking an albuterol-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking an albuterol-containing product.","meaning":"Boolean indicating whether the patient is currently taking an albuterol-containing product."} ;; "albuterol"
(declare-const patient_is_taking_albuterol_containing_product_now@@daily_requirement Bool) ;; {"when_to_set_to_true":"Set to true if the patient requires albuterol daily.","when_to_set_to_false":"Set to false if the patient does not require albuterol daily.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient requires albuterol daily.","meaning":"Boolean indicating whether the patient requires albuterol daily."} ;; "daily requirement for albuterol"
(declare-const patient_is_taking_albuterol_containing_product_now@@due_to_asthma_symptoms_cough_wheeze_or_chest_tightness Bool) ;; {"when_to_set_to_true":"Set to true if the patient's daily albuterol use is due to asthma symptoms (cough, wheeze, or chest tightness).","when_to_set_to_false":"Set to false if the patient's daily albuterol use is not due to asthma symptoms (cough, wheeze, or chest tightness).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's daily albuterol use is due to asthma symptoms (cough, wheeze, or chest tightness).","meaning":"Boolean indicating whether the patient's daily albuterol use is due to asthma symptoms (cough, wheeze, or chest tightness)."} ;; "due to asthma symptoms (cough, wheeze, or chest tightness)"
(declare-const patient_is_taking_albuterol_containing_product_now@@not_including_prophylactic_use_prior_to_exercise Bool) ;; {"when_to_set_to_true":"Set to true if the patient's albuterol use does not include prophylactic use prior to exercise.","when_to_set_to_false":"Set to false if the patient's albuterol use includes prophylactic use prior to exercise.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's albuterol use includes prophylactic use prior to exercise.","meaning":"Boolean indicating whether the patient's albuterol use does not include prophylactic use prior to exercise."} ;; "not including prophylactic use of albuterol prior to exercise"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_taking_albuterol_containing_product_now@@daily_requirement
      patient_is_taking_albuterol_containing_product_now)
    :named REQ9_AUXILIARY0)) ;; "daily requirement for albuterol"

(assert
(! (=> patient_is_taking_albuterol_containing_product_now@@due_to_asthma_symptoms_cough_wheeze_or_chest_tightness
      patient_is_taking_albuterol_containing_product_now)
    :named REQ9_AUXILIARY1)) ;; "due to asthma symptoms (cough, wheeze, or chest tightness)"

(assert
(! (=> patient_is_taking_albuterol_containing_product_now@@not_including_prophylactic_use_prior_to_exercise
      patient_is_taking_albuterol_containing_product_now)
    :named REQ9_AUXILIARY2)) ;; "not including prophylactic use of albuterol prior to exercise"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Exclusion: patient must NOT have a daily requirement for albuterol due to asthma symptoms (cough, wheeze, or chest tightness), not including prophylactic use prior to exercise
(assert
(! (not (and patient_is_taking_albuterol_containing_product_now@@daily_requirement
             patient_is_taking_albuterol_containing_product_now@@due_to_asthma_symptoms_cough_wheeze_or_chest_tightness
             patient_is_taking_albuterol_containing_product_now@@not_including_prophylactic_use_prior_to_exercise))
    :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a daily requirement for albuterol due to asthma symptoms (cough, wheeze, or chest tightness), not including prophylactic use of albuterol prior to exercise, which would be characteristic of moderate persistent asthma or severe persistent asthma as outlined in the current National Heart, Lung, and Blood Institute guidelines for diagnosis and management of asthma."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_inhaled_steroid_therapy_inthepast1months@@dose_typically_used_for_moderate_or_severe_persistent_asthma_per_nhlbi_guidelines
      patient_has_undergone_inhaled_steroid_therapy_inthepast1months)
   :named REQ10_AUXILIARY0)) ;; "any dose of inhaled steroid therapy typically used for moderate persistent asthma OR severe persistent asthma"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_undergone_inhaled_steroid_therapy_inthepast1months@@dose_typically_used_for_moderate_or_severe_persistent_asthma_per_nhlbi_guidelines)
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses any dose of inhaled steroid therapy typically used for moderate persistent asthma OR severe persistent asthma (as outlined by the National Heart, Lung, and Blood Institute National Asthma Education and Prevention Program guidelines)."
