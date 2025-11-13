;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_chronic_medical_condition_considered_contraindication_to_exposure_study_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any chronic medical condition that is considered by the principal investigator as a contraindication to the exposure study.","when_to_set_to_false":"Set to false if the patient currently does not have any chronic medical condition that is considered by the principal investigator as a contraindication to the exposure study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any chronic medical condition that is considered by the principal investigator as a contraindication to the exposure study.","meaning":"Boolean indicating whether the patient currently has any chronic medical condition that is considered by the principal investigator as a contraindication to the exposure study."} ;; "any chronic medical condition considered by the principal investigator as a contraindication to the exposure study"

(declare-const patient_has_finding_of_disorder_of_cardiovascular_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the cardiovascular system.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the cardiovascular system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the cardiovascular system.","meaning":"Boolean indicating whether the patient currently has a disorder of the cardiovascular system."} ;; "significant cardiovascular disease"

(declare-const patient_has_finding_of_disorder_of_cardiovascular_system_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder of the cardiovascular system is significant.","when_to_set_to_false":"Set to false if the patient's current disorder of the cardiovascular system is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disorder of the cardiovascular system is significant.","meaning":"Boolean indicating whether the patient's current disorder of the cardiovascular system is significant."} ;; "significant cardiovascular disease"

(declare-const patient_has_finding_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has diabetes mellitus."} ;; "diabetes mellitus"

(declare-const patient_has_finding_of_chronic_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic kidney disease.","when_to_set_to_false":"Set to false if the patient currently does not have chronic kidney disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic kidney disease.","meaning":"Boolean indicating whether the patient currently has chronic kidney disease."} ;; "chronic renal disease"

(declare-const patient_has_finding_of_disorder_of_thyroid_gland_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the thyroid gland.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the thyroid gland.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the thyroid gland.","meaning":"Boolean indicating whether the patient currently has a disorder of the thyroid gland."} ;; "chronic thyroid disease"

(declare-const patient_has_finding_of_disorder_of_thyroid_gland_now@@chronic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder of the thyroid gland is chronic.","when_to_set_to_false":"Set to false if the patient's current disorder of the thyroid gland is not chronic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disorder of the thyroid gland is chronic.","meaning":"Boolean indicating whether the patient's current disorder of the thyroid gland is chronic."} ;; "chronic thyroid disease"

(declare-const patient_has_finding_of_chronic_infectious_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chronic infectious disease.","when_to_set_to_false":"Set to false if the patient currently does not have a chronic infectious disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a chronic infectious disease.","meaning":"Boolean indicating whether the patient currently has a chronic infectious disease."} ;; "chronic infections"

(declare-const patient_has_finding_of_immunodeficiency_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an immunodeficiency disorder.","when_to_set_to_false":"Set to false if the patient currently does not have an immunodeficiency disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an immunodeficiency disorder.","meaning":"Boolean indicating whether the patient currently has an immunodeficiency disorder."} ;; "immunodeficiency"

(declare-const patient_has_finding_of_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tuberculosis.","when_to_set_to_false":"Set to false if the patient currently does not have tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tuberculosis.","meaning":"Boolean indicating whether the patient currently has tuberculosis."} ;; "tuberculosis"

(declare-const patient_has_history_of_chronic_infection Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of chronic infections.","when_to_set_to_false":"Set to false if the patient does not have a history of chronic infections.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of chronic infections.","meaning":"Boolean indicating whether the patient has a history of chronic infections."} ;; "history of chronic infections"

(declare-const patient_has_history_of_immunodeficiency Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of immunodeficiency.","when_to_set_to_false":"Set to false if the patient does not have a history of immunodeficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of immunodeficiency.","meaning":"Boolean indicating whether the patient has a history of immunodeficiency."} ;; "history of immunodeficiency"

(declare-const patient_has_history_of_tuberculosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of tuberculosis.","when_to_set_to_false":"Set to false if the patient does not have a history of tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of tuberculosis.","meaning":"Boolean indicating whether the patient has a history of tuberculosis."} ;; "history of tuberculosis"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_disorder_of_cardiovascular_system_now@@significant
      patient_has_finding_of_disorder_of_cardiovascular_system_now)
    :named REQ0_AUXILIARY0)) ;; "significant cardiovascular disease"

(assert
(! (=> patient_has_finding_of_disorder_of_thyroid_gland_now@@chronic
      patient_has_finding_of_disorder_of_thyroid_gland_now)
    :named REQ0_AUXILIARY1)) ;; "chronic thyroid disease"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_chronic_medical_condition_considered_contraindication_to_exposure_study_now)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "any chronic medical condition considered by the principal investigator as a contraindication to the exposure study"

(assert
(! (not patient_has_finding_of_disorder_of_cardiovascular_system_now@@significant)
    :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "significant cardiovascular disease"

(assert
(! (not patient_has_finding_of_diabetes_mellitus_now)
    :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "diabetes mellitus"

(assert
(! (not patient_has_finding_of_chronic_kidney_disease_now)
    :named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "chronic renal disease"

(assert
(! (not patient_has_finding_of_disorder_of_thyroid_gland_now@@chronic)
    :named REQ0_COMPONENT4_OTHER_REQUIREMENTS)) ;; "chronic thyroid disease"

(assert
(! (not patient_has_history_of_chronic_infection)
    :named REQ0_COMPONENT5_OTHER_REQUIREMENTS)) ;; "history of chronic infections"

(assert
(! (not patient_has_history_of_immunodeficiency)
    :named REQ0_COMPONENT6_OTHER_REQUIREMENTS)) ;; "history of immunodeficiency"

(assert
(! (not patient_has_history_of_tuberculosis)
    :named REQ0_COMPONENT7_OTHER_REQUIREMENTS)) ;; "history of tuberculosis"

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_emergency_treatment_management_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone an emergency treatment management procedure within the past twelve months.","when_to_set_to_false":"Set to false if the patient has not undergone an emergency treatment management procedure within the past twelve months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone an emergency treatment management procedure within the past twelve months.","meaning":"Boolean indicating whether the patient has undergone an emergency treatment management procedure within the past twelve months."} ;; "emergency treatment"
(declare-const patient_has_undergone_emergency_treatment_management_inthepast12months@@indication_asthma_exacerbation Bool) ;; {"when_to_set_to_true":"Set to true if the emergency treatment management procedure within the past twelve months was specifically for an asthma exacerbation.","when_to_set_to_false":"Set to false if the emergency treatment management procedure within the past twelve months was not for an asthma exacerbation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the emergency treatment management procedure within the past twelve months was for an asthma exacerbation.","meaning":"Boolean indicating whether the emergency treatment management procedure within the past twelve months was for an asthma exacerbation."} ;; "emergency treatment for an asthma exacerbation within the preceding twelve months"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_emergency_treatment_management_inthepast12months@@indication_asthma_exacerbation
      patient_has_undergone_emergency_treatment_management_inthepast12months)
:named REQ1_AUXILIARY0)) ;; "emergency treatment for an asthma exacerbation within the preceding twelve months"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_undergone_emergency_treatment_management_inthepast12months@@indication_asthma_exacerbation)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received physician directed emergency treatment for an asthma exacerbation within the preceding twelve months."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_moderate_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of moderate asthma.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of moderate asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has moderate asthma.","meaning":"Boolean indicating whether the patient currently has moderate asthma."} ;; "moderate asthma"
(declare-const patient_has_finding_of_severe_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of severe asthma.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of severe asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe asthma.","meaning":"Boolean indicating whether the patient currently has severe asthma."} ;; "severe asthma"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_has_finding_of_moderate_asthma_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has moderate asthma."

(assert
  (! (not patient_has_finding_of_severe_asthma_now)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe asthma."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_exacerbation_of_asthma_value_recorded_now_withunit_per_week Real) ;; {"when_to_set_to_value":"Set to the number of asthma exacerbations the patient currently experiences per week if this information is available.","when_to_set_to_null":"Set to null if the number of asthma exacerbations per week is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of asthma exacerbations the patient currently experiences per week."} ;; "exacerbation of asthma more than two times per week"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not (> patient_exacerbation_of_asthma_value_recorded_now_withunit_per_week 2))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has exacerbation of asthma more than two times per week."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_taking_albuterol_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an albuterol-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking an albuterol-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking an albuterol-containing product.","meaning":"Boolean indicating whether the patient is currently taking an albuterol-containing product."} ;; "albuterol"

(declare-const patient_is_taking_albuterol_containing_product_now@@daily_requirement Bool) ;; {"when_to_set_to_true":"Set to true if the patient requires albuterol daily.","when_to_set_to_false":"Set to false if the patient does not require albuterol daily.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient requires albuterol daily.","meaning":"Boolean indicating whether the patient requires albuterol daily."} ;; "daily requirement for albuterol"

(declare-const patient_is_taking_albuterol_containing_product_now@@due_to_asthma_symptoms_cough_wheeze_chest_tightness Bool) ;; {"when_to_set_to_true":"Set to true if the patient's daily requirement for albuterol is due to asthma symptoms (cough, wheeze, or chest tightness).","when_to_set_to_false":"Set to false if the patient's daily requirement for albuterol is not due to asthma symptoms (cough, wheeze, or chest tightness).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the daily requirement is due to asthma symptoms.","meaning":"Boolean indicating whether the patient's daily requirement for albuterol is due to asthma symptoms (cough, wheeze, or chest tightness)."} ;; "due to asthma symptoms (cough OR wheeze OR chest tightness)"

(declare-const patient_is_taking_albuterol_containing_product_now@@not_only_used_prophylactically_prior_to_exercise Bool) ;; {"when_to_set_to_true":"Set to true if the patient's use of albuterol is NOT only prophylactic prior to exercise.","when_to_set_to_false":"Set to false if the patient's use of albuterol is only prophylactic prior to exercise.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's use of albuterol is only prophylactic prior to exercise.","meaning":"Boolean indicating whether the patient's use of albuterol is NOT only prophylactic prior to exercise."} ;; "does NOT only use albuterol prophylactically prior to exercise"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_taking_albuterol_containing_product_now@@daily_requirement
     patient_is_taking_albuterol_containing_product_now)
:named REQ4_AUXILIARY0)) ;; "daily requirement for albuterol"

(assert
(! (=> patient_is_taking_albuterol_containing_product_now@@due_to_asthma_symptoms_cough_wheeze_chest_tightness
     patient_is_taking_albuterol_containing_product_now@@daily_requirement)
:named REQ4_AUXILIARY1)) ;; "due to asthma symptoms (cough OR wheeze OR chest tightness)"

(assert
(! (=> patient_is_taking_albuterol_containing_product_now@@not_only_used_prophylactically_prior_to_exercise
     patient_is_taking_albuterol_containing_product_now)
:named REQ4_AUXILIARY2)) ;; "does NOT only use albuterol prophylactically prior to exercise"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient must NOT satisfy all of:
;;   (daily requirement for albuterol due to asthma symptoms (cough OR wheeze OR chest tightness))
;;   AND (does NOT only use albuterol prophylactically prior to exercise)
(assert
(! (not (and patient_is_taking_albuterol_containing_product_now@@due_to_asthma_symptoms_cough_wheeze_chest_tightness
             patient_is_taking_albuterol_containing_product_now@@not_only_used_prophylactically_prior_to_exercise))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a daily requirement for albuterol due to asthma symptoms (cough OR wheeze OR chest tightness)) AND (the patient does NOT only use albuterol prophylactically prior to exercise)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_viral_upper_respiratory_tract_infection_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a viral upper respiratory tract infection at any time in the past, regardless of timing relative to the challenge event.","when_to_set_to_false":"Set to false if the patient has never had a viral upper respiratory tract infection at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a viral upper respiratory tract infection.","meaning":"Boolean indicating whether the patient has ever had a viral upper respiratory tract infection in the past."} ;; "viral upper respiratory tract infection"
(declare-const patient_has_finding_of_viral_upper_respiratory_tract_infection_inthehistory@@temporalcontext_within2weeks_of_challenge Bool) ;; {"when_to_set_to_true":"Set to true if the patient's viral upper respiratory tract infection occurred within two weeks of the challenge event.","when_to_set_to_false":"Set to false if the patient's viral upper respiratory tract infection did not occur within two weeks of the challenge event.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection occurred within two weeks of the challenge event.","meaning":"Boolean indicating whether the patient's viral upper respiratory tract infection occurred within two weeks of the challenge event."} ;; "within two weeks of challenge"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_viral_upper_respiratory_tract_infection_inthehistory@@temporalcontext_within2weeks_of_challenge
      patient_has_finding_of_viral_upper_respiratory_tract_infection_inthehistory)
   :named REQ5_AUXILIARY0)) ;; "viral upper respiratory tract infection within two weeks of challenge"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_viral_upper_respiratory_tract_infection_inthehistory@@temporalcontext_within2weeks_of_challenge)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a viral upper respiratory tract infection within two weeks of challenge."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_acute_infectious_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an acute infectious disease at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had an acute infectious disease in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an acute infectious disease.","meaning":"Boolean indicating whether the patient has ever had an acute infectious disease in their history."} ;; "acute infection"
(declare-const patient_has_finding_of_acute_infectious_disease_inthehistory@@required_antibiotics Bool) ;; {"when_to_set_to_true":"Set to true if the acute infectious disease episode required antibiotics.","when_to_set_to_false":"Set to false if the acute infectious disease episode did not require antibiotics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether antibiotics were required for the acute infectious disease episode.","meaning":"Boolean indicating whether the acute infectious disease episode required antibiotics."} ;; "requiring antibiotics"
(declare-const patient_has_finding_of_acute_infectious_disease_inthehistory@@temporalcontext_within2weeks_of_exposure Bool) ;; {"when_to_set_to_true":"Set to true if the acute infectious disease episode occurred within two weeks of exposure.","when_to_set_to_false":"Set to false if the acute infectious disease episode did not occur within two weeks of exposure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the acute infectious disease episode occurred within two weeks of exposure.","meaning":"Boolean indicating whether the acute infectious disease episode occurred within two weeks of exposure."} ;; "within two weeks of exposure"
(declare-const patient_has_finding_of_pyrexia_of_unknown_origin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had fever of unknown origin at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had fever of unknown origin in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had fever of unknown origin.","meaning":"Boolean indicating whether the patient has ever had fever of unknown origin in their history."} ;; "fever of unknown origin"
(declare-const patient_has_finding_of_pyrexia_of_unknown_origin_inthehistory@@temporalcontext_within2weeks_of_challenge Bool) ;; {"when_to_set_to_true":"Set to true if the fever of unknown origin episode occurred within two weeks of challenge.","when_to_set_to_false":"Set to false if the fever of unknown origin episode did not occur within two weeks of challenge.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the fever of unknown origin episode occurred within two weeks of challenge.","meaning":"Boolean indicating whether the fever of unknown origin episode occurred within two weeks of challenge."} ;; "within two weeks of challenge"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_acute_infectious_disease_inthehistory@@required_antibiotics
      patient_has_finding_of_acute_infectious_disease_inthehistory)
    :named REQ6_AUXILIARY0)) ;; "acute infection requiring antibiotics"

(assert
(! (=> patient_has_finding_of_acute_infectious_disease_inthehistory@@temporalcontext_within2weeks_of_exposure
      patient_has_finding_of_acute_infectious_disease_inthehistory)
    :named REQ6_AUXILIARY1)) ;; "acute infection within two weeks of exposure"

(assert
(! (=> patient_has_finding_of_pyrexia_of_unknown_origin_inthehistory@@temporalcontext_within2weeks_of_challenge
      patient_has_finding_of_pyrexia_of_unknown_origin_inthehistory)
    :named REQ6_AUXILIARY2)) ;; "fever of unknown origin within two weeks of challenge"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: (acute infection requiring antibiotics within two weeks of exposure) OR (fever of unknown origin within two weeks of challenge)
(assert
(! (not (or
         (and patient_has_finding_of_acute_infectious_disease_inthehistory@@required_antibiotics
              patient_has_finding_of_acute_infectious_disease_inthehistory@@temporalcontext_within2weeks_of_exposure)
         patient_has_finding_of_pyrexia_of_unknown_origin_inthehistory@@temporalcontext_within2weeks_of_challenge))
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has had any acute infection requiring antibiotics within two weeks of exposure) OR (the patient has had fever of unknown origin within two weeks of challenge)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_severe_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of severe asthma.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of severe asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe asthma.","meaning":"Boolean indicating whether the patient currently has severe asthma."} ;; "The patient is excluded if the patient has severe asthma."

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_severe_asthma_now)
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe asthma."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mental disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a mental disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a mental disorder.","meaning":"Boolean indicating whether the patient currently has a mental disorder."} ;; "mental illness"

(declare-const patient_has_finding_of_mental_disorder_now@@would_interfere_with_study_compliance_investigator_opinion Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mental disorder and, in the opinion of the investigator, the disorder would interfere with the patient's ability to comply with study requirements.","when_to_set_to_false":"Set to false if the patient currently has a mental disorder but, in the opinion of the investigator, it would not interfere with compliance, or if the patient does not have a mental disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator believes the disorder would interfere with compliance.","meaning":"Boolean indicating whether the patient currently has a mental disorder and, in the investigator's opinion, it would interfere with study compliance."} ;; "mental illness that, in the opinion of the investigator, would interfere with the patient's ability to comply with study requirements"

(declare-const patient_has_finding_of_drug_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has drug abuse.","when_to_set_to_false":"Set to false if the patient currently does not have drug abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has drug abuse.","meaning":"Boolean indicating whether the patient currently has drug abuse."} ;; "drug abuse"

(declare-const patient_has_finding_of_drug_abuse_now@@would_interfere_with_study_compliance_investigator_opinion Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has drug abuse and, in the opinion of the investigator, the drug abuse would interfere with the patient's ability to comply with study requirements.","when_to_set_to_false":"Set to false if the patient currently has drug abuse but, in the opinion of the investigator, it would not interfere with compliance, or if the patient does not have drug abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator believes the drug abuse would interfere with compliance.","meaning":"Boolean indicating whether the patient currently has drug abuse and, in the investigator's opinion, it would interfere with study compliance."} ;; "history of drug abuse that, in the opinion of the investigator, would interfere with the patient's ability to comply with study requirements"

(declare-const patient_has_finding_of_alcohol_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has alcohol abuse.","when_to_set_to_false":"Set to false if the patient currently does not have alcohol abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has alcohol abuse.","meaning":"Boolean indicating whether the patient currently has alcohol abuse."} ;; "alcohol abuse"

(declare-const patient_has_finding_of_alcohol_abuse_now@@would_interfere_with_study_compliance_investigator_opinion Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has alcohol abuse and, in the opinion of the investigator, the alcohol abuse would interfere with the patient's ability to comply with study requirements.","when_to_set_to_false":"Set to false if the patient currently has alcohol abuse but, in the opinion of the investigator, it would not interfere with compliance, or if the patient does not have alcohol abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator believes the alcohol abuse would interfere with compliance.","meaning":"Boolean indicating whether the patient currently has alcohol abuse and, in the investigator's opinion, it would interfere with study compliance."} ;; "history of alcohol abuse that, in the opinion of the investigator, would interfere with the patient's ability to comply with study requirements"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_mental_disorder_now@@would_interfere_with_study_compliance_investigator_opinion
      patient_has_finding_of_mental_disorder_now)
   :named REQ8_AUXILIARY0)) ;; "mental illness that, in the opinion of the investigator, would interfere with the patient's ability to comply with study requirements"

(assert
(! (=> patient_has_finding_of_drug_abuse_now@@would_interfere_with_study_compliance_investigator_opinion
      patient_has_finding_of_drug_abuse_now)
   :named REQ8_AUXILIARY1)) ;; "history of drug abuse that, in the opinion of the investigator, would interfere with the patient's ability to comply with study requirements"

(assert
(! (=> patient_has_finding_of_alcohol_abuse_now@@would_interfere_with_study_compliance_investigator_opinion
      patient_has_finding_of_alcohol_abuse_now)
   :named REQ8_AUXILIARY2)) ;; "history of alcohol abuse that, in the opinion of the investigator, would interfere with the patient's ability to comply with study requirements"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_mental_disorder_now@@would_interfere_with_study_compliance_investigator_opinion)
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has mental illness that, in the opinion of the investigator, would interfere with the patient's ability to comply with study requirements."

(assert
(! (not patient_has_finding_of_drug_abuse_now@@would_interfere_with_study_compliance_investigator_opinion)
   :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of drug abuse that, in the opinion of the investigator, would interfere with the patient's ability to comply with study requirements."

(assert
(! (not patient_has_finding_of_alcohol_abuse_now@@would_interfere_with_study_compliance_investigator_opinion)
   :named REQ8_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of alcohol abuse that, in the opinion of the investigator, would interfere with the patient's ability to comply with study requirements."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking or exposed to any drug or medicament.","when_to_set_to_false":"Set to false if the patient is not currently taking or exposed to any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking or exposed to any drug or medicament.","meaning":"Boolean indicating whether the patient is currently taking or exposed to any drug or medicament."} ;; "medications"

(declare-const patient_is_exposed_to_drug_or_medicament_now@@may_impact_clinical_center_reference_endotoxin_exposure_results Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient is currently taking may impact the results of the Clinical Center Reference Endotoxin exposure.","when_to_set_to_false":"Set to false if the drug or medicament the patient is currently taking does not impact the results of the Clinical Center Reference Endotoxin exposure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament may impact the results of the Clinical Center Reference Endotoxin exposure.","meaning":"Boolean indicating whether the drug or medicament the patient is currently taking may impact the results of the Clinical Center Reference Endotoxin exposure."} ;; "may impact the results of the Clinical Center Reference Endotoxin exposure"

(declare-const patient_is_exposed_to_drug_or_medicament_now@@may_interfere_with_study_medications Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient is currently taking may interfere with any other medications potentially used in the study.","when_to_set_to_false":"Set to false if the drug or medicament the patient is currently taking does not interfere with any other medications potentially used in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament may interfere with any other medications potentially used in the study.","meaning":"Boolean indicating whether the drug or medicament the patient is currently taking may interfere with any other medications potentially used in the study."} ;; "may interfere with any other medications potentially used in the study"

(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any corticosteroid or corticosteroid derivative containing product.","when_to_set_to_false":"Set to false if the patient is not currently taking any corticosteroid or corticosteroid derivative containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any corticosteroid or corticosteroid derivative containing product.","meaning":"Boolean indicating whether the patient is currently taking any corticosteroid or corticosteroid derivative containing product."} ;; "corticosteroids"

(declare-const patient_is_exposed_to_beta_adrenergic_receptor_antagonist_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking or exposed to any beta adrenergic receptor antagonist.","when_to_set_to_false":"Set to false if the patient is not currently taking or exposed to any beta adrenergic receptor antagonist.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking or exposed to any beta adrenergic receptor antagonist.","meaning":"Boolean indicating whether the patient is currently taking or exposed to any beta adrenergic receptor antagonist."} ;; "beta adrenergic antagonists"

(declare-const patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking or exposed to any non-steroidal anti-inflammatory agent.","when_to_set_to_false":"Set to false if the patient is not currently taking or exposed to any non-steroidal anti-inflammatory agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking or exposed to any non-steroidal anti-inflammatory agent.","meaning":"Boolean indicating whether the patient is currently taking or exposed to any non-steroidal anti-inflammatory agent."} ;; "non-steroidal anti-inflammatory agents"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now
           patient_is_exposed_to_beta_adrenergic_receptor_antagonist_now
           patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_now)
     patient_is_exposed_to_drug_or_medicament_now@@may_interfere_with_study_medications)
:named REQ9_AUXILIARY0)) ;; "with non-exhaustive examples (corticosteroids, beta adrenergic antagonists, non-steroidal anti-inflammatory agents)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@may_impact_clinical_center_reference_endotoxin_exposure_results
       patient_is_exposed_to_drug_or_medicament_now)
:named REQ9_AUXILIARY1)) ;; "may impact the results of the Clinical Center Reference Endotoxin exposure"

(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@may_interfere_with_study_medications
       patient_is_exposed_to_drug_or_medicament_now)
:named REQ9_AUXILIARY2)) ;; "may interfere with any other medications potentially used in the study"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not (or patient_is_exposed_to_drug_or_medicament_now@@may_impact_clinical_center_reference_endotoxin_exposure_results
            patient_is_exposed_to_drug_or_medicament_now@@may_interfere_with_study_medications))
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking medications which may impact the results of the Clinical Center Reference Endotoxin exposure OR interfere with any other medications potentially used in the study with non-exhaustive examples (corticosteroids, beta adrenergic antagonists, non-steroidal anti-inflammatory agents)."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_tobacco_smoking_behavior_finding_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any history of tobacco smoking at any time in the past.","when_to_set_to_false":"Set to false if the patient has no history of tobacco smoking at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has any history of tobacco smoking.","meaning":"Boolean indicating whether the patient has any history of tobacco smoking."} ;; "smoking"
(declare-const patient_has_finding_of_tobacco_smoking_behavior_finding_inthehistory@@temporalcontext_within_1_year_prior_to_study_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of tobacco smoking occurred within the year prior to study enrollment.","when_to_set_to_false":"Set to false if the patient's history of tobacco smoking did not occur within the year prior to study enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of tobacco smoking occurred within the year prior to study enrollment.","meaning":"Boolean indicating whether the patient's history of tobacco smoking occurred within the year prior to study enrollment."} ;; "any history of smoking in the year prior to study enrollment"
(declare-const patient_tobacco_smoking_behavior_finding_value_recorded_inthehistory_withunit_pack_years Real) ;; {"when_to_set_to_value":"Set to the measured or reported lifetime tobacco smoking history in pack years if available.","when_to_set_to_null":"Set to null if no such measurement or report is available or the value is indeterminate.","meaning":"Numeric value representing the patient's lifetime tobacco smoking history in pack years."} ;; "lifetime smoking history greater than ten pack years"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_tobacco_smoking_behavior_finding_inthehistory@@temporalcontext_within_1_year_prior_to_study_enrollment
      patient_has_finding_of_tobacco_smoking_behavior_finding_inthehistory)
   :named REQ10_AUXILIARY0)) ;; "any history of smoking in the year prior to study enrollment"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_tobacco_smoking_behavior_finding_inthehistory@@temporalcontext_within_1_year_prior_to_study_enrollment)
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any history of smoking in the year prior to study enrollment."

(assert
(! (not (> patient_tobacco_smoking_behavior_finding_value_recorded_inthehistory_withunit_pack_years 10))
   :named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a lifetime smoking history greater than ten pack years."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_nighttime_symptom_of_cough_at_baseline_not_during_viral_induced_asthma_exacerbation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has nighttime symptoms of cough at baseline and these symptoms are not occurring during a clearly recognized viral induced asthma exacerbation.","when_to_set_to_false":"Set to false if the patient does not have nighttime symptoms of cough at baseline, or if such symptoms only occur during a clearly recognized viral induced asthma exacerbation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has nighttime symptoms of cough at baseline not during a clearly recognized viral induced asthma exacerbation.","meaning":"Boolean indicating whether the patient has nighttime symptoms of cough at baseline, not during a clearly recognized viral induced asthma exacerbation."} ;; "the patient has nighttime symptoms of cough greater than once per week at baseline (not during a clearly recognized viral induced asthma exacerbation)"

(declare-const patient_nighttime_cough_symptom_frequency_at_baseline_not_during_viral_induced_asthma_exacerbation_withunit_per_week Real) ;; {"when_to_set_to_value":"Set to the number of times per week the patient experiences nighttime cough symptoms at baseline, not during a clearly recognized viral induced asthma exacerbation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many times per week the patient experiences nighttime cough symptoms at baseline not during a clearly recognized viral induced asthma exacerbation.","meaning":"Numeric value representing the frequency (per week) of nighttime cough symptoms at baseline, not during a clearly recognized viral induced asthma exacerbation."} ;; "greater than once per week"

(declare-const patient_has_nighttime_symptom_of_wheeze_at_baseline_not_during_viral_induced_asthma_exacerbation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has nighttime symptoms of wheeze at baseline and these symptoms are not occurring during a clearly recognized viral induced asthma exacerbation.","when_to_set_to_false":"Set to false if the patient does not have nighttime symptoms of wheeze at baseline, or if such symptoms only occur during a clearly recognized viral induced asthma exacerbation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has nighttime symptoms of wheeze at baseline not during a clearly recognized viral induced asthma exacerbation.","meaning":"Boolean indicating whether the patient has nighttime symptoms of wheeze at baseline, not during a clearly recognized viral induced asthma exacerbation."} ;; "the patient has nighttime symptoms of wheeze greater than once per week at baseline (not during a clearly recognized viral induced asthma exacerbation)"

(declare-const patient_nighttime_wheeze_symptom_frequency_at_baseline_not_during_viral_induced_asthma_exacerbation_withunit_per_week Real) ;; {"when_to_set_to_value":"Set to the number of times per week the patient experiences nighttime wheeze symptoms at baseline, not during a clearly recognized viral induced asthma exacerbation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many times per week the patient experiences nighttime wheeze symptoms at baseline not during a clearly recognized viral induced asthma exacerbation.","meaning":"Numeric value representing the frequency (per week) of nighttime wheeze symptoms at baseline, not during a clearly recognized viral induced asthma exacerbation."} ;; "greater than once per week"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Define "nighttime symptoms of cough at baseline not during viral induced asthma exacerbation" as frequency > 1 per week
(assert
(! (= patient_has_nighttime_symptom_of_cough_at_baseline_not_during_viral_induced_asthma_exacerbation
     (> patient_nighttime_cough_symptom_frequency_at_baseline_not_during_viral_induced_asthma_exacerbation_withunit_per_week 1))
:named REQ11_AUXILIARY0)) ;; "nighttime symptoms of cough greater than once per week at baseline (not during a clearly recognized viral induced asthma exacerbation)"

;; Define "nighttime symptoms of wheeze at baseline not during viral induced asthma exacerbation" as frequency > 1 per week
(assert
(! (= patient_has_nighttime_symptom_of_wheeze_at_baseline_not_during_viral_induced_asthma_exacerbation
     (> patient_nighttime_wheeze_symptom_frequency_at_baseline_not_during_viral_induced_asthma_exacerbation_withunit_per_week 1))
:named REQ11_AUXILIARY1)) ;; "nighttime symptoms of wheeze greater than once per week at baseline (not during a clearly recognized viral induced asthma exacerbation)"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_nighttime_symptom_of_cough_at_baseline_not_during_viral_induced_asthma_exacerbation)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has nighttime symptoms of cough greater than once per week at baseline (not during a clearly recognized viral induced asthma exacerbation)."

(assert
(! (not patient_has_nighttime_symptom_of_wheeze_at_baseline_not_during_viral_induced_asthma_exacerbation)
:named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has nighttime symptoms of wheeze greater than once per week at baseline (not during a clearly recognized viral induced asthma exacerbation)."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_allergy_to_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergy to any of the study drugs.","when_to_set_to_false":"Set to false if the patient currently does not have an allergy to any of the study drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to any of the study drugs.","meaning":"Boolean indicating whether the patient currently has an allergy to any of the study drugs."} ;; "allergy to study drugs"
(declare-const patient_has_finding_of_propensity_to_adverse_reactions_to_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a sensitivity (propensity to adverse reactions) to any of the study drugs.","when_to_set_to_false":"Set to false if the patient currently does not have a sensitivity (propensity to adverse reactions) to any of the study drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a sensitivity (propensity to adverse reactions) to any of the study drugs.","meaning":"Boolean indicating whether the patient currently has a sensitivity (propensity to adverse reactions) to any of the study drugs."} ;; "sensitivity to study drugs"
(declare-const patient_has_finding_of_allergy_to_escherichia_coli_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergy to Escherichia coli.","when_to_set_to_false":"Set to false if the patient currently does not have an allergy to Escherichia coli.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to Escherichia coli.","meaning":"Boolean indicating whether the patient currently has an allergy to Escherichia coli."} ;; "allergy to Escherichia coli"
(declare-const patient_has_finding_of_propensity_to_adverse_reactions_to_escherichia_coli_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a sensitivity (propensity to adverse reactions) to Escherichia coli.","when_to_set_to_false":"Set to false if the patient currently does not have a sensitivity (propensity to adverse reactions) to Escherichia coli.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a sensitivity (propensity to adverse reactions) to Escherichia coli.","meaning":"Boolean indicating whether the patient currently has a sensitivity (propensity to adverse reactions) to Escherichia coli."} ;; "sensitivity to Escherichia coli"
(declare-const patient_has_finding_of_allergy_to_their_formulations_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergy to the formulations of the study drugs or Escherichia coli.","when_to_set_to_false":"Set to false if the patient currently does not have an allergy to the formulations of the study drugs or Escherichia coli.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to the formulations of the study drugs or Escherichia coli.","meaning":"Boolean indicating whether the patient currently has an allergy to the formulations of the study drugs or Escherichia coli."} ;; "allergy to their formulations"
(declare-const patient_has_finding_of_propensity_to_adverse_reactions_to_their_formulations_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a sensitivity (propensity to adverse reactions) to the formulations of the study drugs or Escherichia coli.","when_to_set_to_false":"Set to false if the patient currently does not have a sensitivity (propensity to adverse reactions) to the formulations of the study drugs or Escherichia coli.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a sensitivity (propensity to adverse reactions) to the formulations of the study drugs or Escherichia coli.","meaning":"Boolean indicating whether the patient currently has a sensitivity (propensity to adverse reactions) to the formulations of the study drugs or Escherichia coli."} ;; "sensitivity to their formulations"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_finding_of_allergy_to_drug_now)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has allergy to study drugs."

(assert
(! (not patient_has_finding_of_propensity_to_adverse_reactions_to_drug_now)
:named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has sensitivity to study drugs."

(assert
(! (not patient_has_finding_of_allergy_to_escherichia_coli_now)
:named REQ12_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has allergy to Escherichia coli."

(assert
(! (not patient_has_finding_of_propensity_to_adverse_reactions_to_escherichia_coli_now)
:named REQ12_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has sensitivity to Escherichia coli."

(assert
(! (not patient_has_finding_of_allergy_to_their_formulations_now)
:named REQ12_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has allergy to their formulations."

(assert
(! (not patient_has_finding_of_propensity_to_adverse_reactions_to_their_formulations_now)
:named REQ12_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has sensitivity to their formulations."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_finding_of_allergy_to_methacholine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy (hypersensitivity) to methacholine.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy (hypersensitivity) to methacholine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy (hypersensitivity) to methacholine.","meaning":"Boolean indicating whether the patient currently has an allergy to methacholine."} ;; "hypersensitivity to methacholine"
(declare-const patient_has_finding_of_allergy_to_other_parasympathomimetic_agents_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy (hypersensitivity) to any parasympathomimetic agent other than methacholine.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy (hypersensitivity) to any parasympathomimetic agent other than methacholine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy (hypersensitivity) to any parasympathomimetic agent other than methacholine.","meaning":"Boolean indicating whether the patient currently has an allergy (hypersensitivity) to other parasympathomimetic agents."} ;; "hypersensitivity to other parasympathomimetic agents"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_finding_of_allergy_to_methacholine_now)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known hypersensitivity to methacholine."

(assert
(! (not patient_has_finding_of_allergy_to_other_parasympathomimetic_agents_now)
:named REQ13_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known hypersensitivity to other parasympathomimetic agents."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_undergone_intubation_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone intubation at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone intubation at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone intubation in their medical history.","meaning":"Boolean indicating whether the patient has ever undergone intubation in their medical history."} ;; "intubation"
(declare-const patient_has_undergone_intubation_inthehistory@@performed_for_asthma Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone intubation in their medical history and the intubation was performed specifically for asthma.","when_to_set_to_false":"Set to false if the patient has ever undergone intubation in their medical history but the intubation was not performed for asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether intubation was performed for asthma.","meaning":"Boolean indicating whether the patient's intubation in their medical history was performed specifically for asthma."} ;; "intubation for asthma"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_intubation_inthehistory@@performed_for_asthma
      patient_has_undergone_intubation_inthehistory)
:named REQ14_AUXILIARY0)) ;; "intubation for asthma" implies "intubation"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_undergone_intubation_inthehistory@@performed_for_asthma)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of intubation for asthma."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_is_sexually_active_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently sexually active.","when_to_set_to_false":"Set to false if the patient is currently not sexually active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently sexually active.","meaning":"Boolean indicating whether the patient is currently sexually active."} ;; "the patient is sexually active"

(declare-const patient_is_unwilling_to_use_reliable_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unwilling to use reliable contraception (including intrauterine device, birth control pills, birth control patch, condoms).","when_to_set_to_false":"Set to false if the patient is currently willing to use reliable contraception (including intrauterine device, birth control pills, birth control patch, condoms).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unwilling to use reliable contraception.","meaning":"Boolean indicating whether the patient is currently unwilling to use reliable contraception (including intrauterine device, birth control pills, birth control patch, condoms)."} ;; "the patient is unwilling to use reliable contraception"

(declare-const patient_has_finding_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using any form of contraception.","when_to_set_to_false":"Set to false if the patient is currently not using any form of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using contraception.","meaning":"Boolean indicating whether the patient is currently using contraception."} ;; "contraception"

(declare-const patient_has_finding_of_contraception_now@@reliable Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using contraception and the contraception is considered reliable (such as intrauterine device, birth control pills, birth control patch, condoms).","when_to_set_to_false":"Set to false if the patient is currently using contraception but it is not considered reliable, or if the patient is not using contraception at all.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the contraception used is reliable.","meaning":"Boolean indicating whether the contraception currently used by the patient is reliable."} ;; "reliable contraception (intrauterine device, birth control pills, birth control patch, condoms)"

;; ===================== Auxiliary Assertions (REQ 15) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_contraception_now@@reliable
       patient_has_finding_of_contraception_now)
   :named REQ15_AUXILIARY0)) ;; "contraception" and "reliable contraception"

;; ===================== Constraint Assertions (REQ 15) =====================
;; Exclusion: patient is sexually active AND unwilling to use reliable contraception (with exhaustive subcategories)
(assert
(! (not (and patient_is_sexually_active_now
             patient_is_unwilling_to_use_reliable_contraception_now))
   :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is sexually active) AND (the patient is unwilling to use reliable contraception with exhaustive subcategories (intrauterine device, birth control pills, birth control patch, condoms)))."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_finding_of_prothrombin_time_abnormal_at_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has abnormal prothrombin time values at screening.","when_to_set_to_false":"Set to false if the patient does not have abnormal prothrombin time values at screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has abnormal prothrombin time values at screening.","meaning":"Boolean indicating whether the patient has abnormal prothrombin time values at screening."} ;; "abnormal prothrombin time values at screening"
(declare-const patient_has_finding_of_prothrombin_time_abnormal_during_treatment_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient has abnormal prothrombin time values during the treatment period.","when_to_set_to_false":"Set to false if the patient does not have abnormal prothrombin time values during the treatment period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has abnormal prothrombin time values during the treatment period.","meaning":"Boolean indicating whether the patient has abnormal prothrombin time values during the treatment period."} ;; "abnormal prothrombin time values during the treatment period"
(declare-const patient_has_finding_of_partial_thromboplastin_time_abnormal_at_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has abnormal partial thromboplastin time values at screening.","when_to_set_to_false":"Set to false if the patient does not have abnormal partial thromboplastin time values at screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has abnormal partial thromboplastin time values at screening.","meaning":"Boolean indicating whether the patient has abnormal partial thromboplastin time values at screening."} ;; "abnormal partial thromboplastin time values at screening"
(declare-const patient_has_finding_of_partial_thromboplastin_time_abnormal_during_treatment_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient has abnormal partial thromboplastin time values during the treatment period.","when_to_set_to_false":"Set to false if the patient does not have abnormal partial thromboplastin time values during the treatment period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has abnormal partial thromboplastin time values during the treatment period.","meaning":"Boolean indicating whether the patient has abnormal partial thromboplastin time values during the treatment period."} ;; "abnormal partial thromboplastin time values during the treatment period"
(declare-const patient_has_finding_of_prothrombin_time_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abnormal prothrombin time values.","when_to_set_to_false":"Set to false if the patient currently does not have abnormal prothrombin time values.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abnormal prothrombin time values.","meaning":"auto-synthesized variable for prothrombin_time_abnormal (Clinical finding) with timeframe now"} ;; "abnormal prothrombin time values"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not patient_has_finding_of_prothrombin_time_abnormal_at_screening)
    :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has abnormal prothrombin time values at screening."

(assert
(! (not patient_has_finding_of_prothrombin_time_abnormal_during_treatment_period)
    :named REQ16_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has abnormal prothrombin time values during the treatment period."

(assert
(! (not patient_has_finding_of_partial_thromboplastin_time_abnormal_at_screening)
    :named REQ16_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has abnormal partial thromboplastin time values at screening."

(assert
(! (not patient_has_finding_of_partial_thromboplastin_time_abnormal_during_treatment_period)
    :named REQ16_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has abnormal partial thromboplastin time values during the treatment period."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_finding_of_blood_coagulation_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any blood coagulation disorder (bleeding disorder).","when_to_set_to_false":"Set to false if the patient currently does not have any blood coagulation disorder (bleeding disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any blood coagulation disorder (bleeding disorder).","meaning":"Boolean indicating whether the patient currently has any blood coagulation disorder (bleeding disorder)."} ;; "bleeding disorder"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not patient_has_finding_of_blood_coagulation_disorder_now)
   :named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any bleeding disorder."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_annual_radiation_exposure_limit_in_millisievert Real) ;; {"when_to_set_to_value":"Set to the patient's annual radiation exposure limit, measured in millisieverts.","when_to_set_to_null":"Set to null if the patient's annual radiation exposure limit is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's annual radiation exposure limit, measured in millisieverts."} ;; "annual limits"
(declare-const patient_has_radiation_exposure_history_within_past_12_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of radiation exposure that occurred within the past twelve months.","when_to_set_to_false":"Set to false if the patient does not have a history of radiation exposure that occurred within the past twelve months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of radiation exposure within the past twelve months.","meaning":"Boolean indicating whether the patient has a history of radiation exposure that occurred within the past twelve months."} ;; "radiation exposure history within the past twelve months"
(declare-const patient_radiation_exposure_amount_within_past_12_months_in_millisievert Real) ;; {"when_to_set_to_value":"Set to the total amount of radiation exposure the patient has received within the past twelve months, measured in millisieverts.","when_to_set_to_null":"Set to null if the total amount of radiation exposure within the past twelve months is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total amount of radiation exposure the patient has received within the past twelve months, measured in millisieverts."} ;; "radiation exposure history would cause the patient to exceed the patient's annual limits"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not (and patient_has_radiation_exposure_history_within_past_12_months
             (> patient_radiation_exposure_amount_within_past_12_months_in_millisievert
                patient_annual_radiation_exposure_limit_in_millisievert)))
   :named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a radiation exposure history within the past twelve months) AND (the radiation exposure history would cause the patient to exceed the patient's annual limits))."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."
