;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_able_to_provide_proper_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to provide proper informed consent.","when_to_set_to_false":"Set to false if the patient is currently unable to provide proper informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to provide proper informed consent.","meaning":"Boolean indicating whether the patient is currently able to provide proper informed consent."} ;; "unable to provide proper informed consent"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_able_to_provide_proper_informed_consent_now)
:named REQ0_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to provide proper informed consent."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_habitual_drug_user_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had habitual use of drugs within the past six months.","when_to_set_to_false":"Set to false if the patient has not had habitual use of drugs within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had habitual use of drugs within the past six months.","meaning":"Boolean indicating whether the patient has had habitual use of drugs within the past six months."} ;; "habitual use of drugs within the past six months"
(declare-const patient_has_finding_of_habitual_drug_user_inthepast6months@@exception_marijuana_one_time_in_three_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient's only drug use within the past six months is marijuana used one time in three months, which is excepted from habitual drug use.","when_to_set_to_false":"Set to false if the patient has habitual use of drugs within the past six months and the exception does not apply.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exception for marijuana use applies.","meaning":"Boolean indicating whether the exception for marijuana used one time in three months applies to habitual drug use within the past six months."} ;; "except if marijuana was used one time in three months"
(declare-const patient_is_exposed_to_cannabis_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to marijuana (cannabis) within the past six months.","when_to_set_to_false":"Set to false if the patient was not exposed to marijuana (cannabis) within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to marijuana (cannabis) within the past six months.","meaning":"Boolean indicating whether the patient was exposed to marijuana (cannabis) within the past six months."} ;; "marijuana"
(declare-const patient_is_exposed_to_cannabis_inthepast6months@@used_one_time_in_three_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient used marijuana only one time in three months within the past six months.","when_to_set_to_false":"Set to false if the patient used marijuana more than one time in three months or the usage does not meet the exception criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient used marijuana only one time in three months within the past six months.","meaning":"Boolean indicating whether the patient used marijuana only one time in three months within the past six months."} ;; "marijuana was used one time in three months"
(declare-const patient_has_finding_of_habitual_drinker_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had habitual use of alcohol within the past six months.","when_to_set_to_false":"Set to false if the patient has not had habitual use of alcohol within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had habitual use of alcohol within the past six months.","meaning":"Boolean indicating whether the patient has had habitual use of alcohol within the past six months."} ;; "habitual use of alcohol within the past six months"
(declare-const patient_has_finding_of_habitual_drinker_inthepast6months@@exception_average_two_alcoholic_beverages_per_day Bool) ;; {"when_to_set_to_true":"Set to true if the patient's only alcohol use within the past six months is an average of two alcoholic beverages per day, which is excepted from habitual alcohol use.","when_to_set_to_false":"Set to false if the patient has habitual use of alcohol within the past six months and the exception does not apply.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exception for average alcohol use applies.","meaning":"Boolean indicating whether the exception for an average of two alcoholic beverages per day applies to habitual alcohol use within the past six months."} ;; "except if the average is two alcoholic beverages per day"
(declare-const patient_has_finding_of_drug_abuse_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had drug abuse within the past six months, as defined by DSM-IV substance abuse criteria.","when_to_set_to_false":"Set to false if the patient has not had drug abuse within the past six months, as defined by DSM-IV substance abuse criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had drug abuse within the past six months, as defined by DSM-IV substance abuse criteria.","meaning":"Boolean indicating whether the patient has had drug abuse within the past six months, as defined by DSM-IV substance abuse criteria."} ;; "drug abuse is defined as per the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition substance abuse criteria"
(declare-const patient_has_finding_of_alcohol_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently meets criteria for alcohol abuse as defined by DSM-IV substance abuse criteria.","when_to_set_to_false":"Set to false if the patient currently does not meet criteria for alcohol abuse as defined by DSM-IV substance abuse criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently meets criteria for alcohol abuse as defined by DSM-IV substance abuse criteria.","meaning":"Boolean indicating whether the patient currently meets criteria for alcohol abuse."} ;; "alcohol abuse is defined as per the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition substance abuse criteria"
(declare-const patient_has_finding_of_substance_abuse_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had substance abuse within the past six months, as defined by DSM-IV substance abuse criteria.","when_to_set_to_false":"Set to false if the patient has not had substance abuse within the past six months, as defined by DSM-IV substance abuse criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had substance abuse within the past six months, as defined by DSM-IV substance abuse criteria.","meaning":"Boolean indicating whether the patient has had substance abuse within the past six months, as defined by DSM-IV substance abuse criteria."} ;; "substance abuse within the past six months, as defined by DSM-IV substance abuse criteria"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable for marijuana exception implies cannabis exposure
(assert
(! (=> patient_is_exposed_to_cannabis_inthepast6months@@used_one_time_in_three_months
       patient_is_exposed_to_cannabis_inthepast6months)
    :named REQ1_AUXILIARY0)) ;; "marijuana was used one time in three months"

;; Qualifier variable for marijuana exception implies habitual drug user
(assert
(! (=> patient_has_finding_of_habitual_drug_user_inthepast6months@@exception_marijuana_one_time_in_three_months
       patient_has_finding_of_habitual_drug_user_inthepast6months)
    :named REQ1_AUXILIARY1)) ;; "except if marijuana was used one time in three months"

;; Qualifier variable for alcohol exception implies habitual drinker
(assert
(! (=> patient_has_finding_of_habitual_drinker_inthepast6months@@exception_average_two_alcoholic_beverages_per_day
       patient_has_finding_of_habitual_drinker_inthepast6months)
    :named REQ1_AUXILIARY2)) ;; "except if the average is two alcoholic beverages per day"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion for habitual drug use within past 6 months, except if marijuana was used one time in three months
(assert
(! (not (and patient_has_finding_of_habitual_drug_user_inthepast6months
             (not patient_has_finding_of_habitual_drug_user_inthepast6months@@exception_marijuana_one_time_in_three_months)))
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has habitual use of drugs within the past six months, except if marijuana was used one time in three months"

;; Exclusion for habitual alcohol use within past 6 months, except if the average is two alcoholic beverages per day
(assert
(! (not (and patient_has_finding_of_habitual_drinker_inthepast6months
             (not patient_has_finding_of_habitual_drinker_inthepast6months@@exception_average_two_alcoholic_beverages_per_day)))
    :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has habitual use of alcohol within the past six months, except if the average is two alcoholic beverages per day"

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of asthma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of asthma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of asthma."} ;; "asthma"
(declare-const patient_has_finding_of_infectious_disease_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a pulmonary infection.","when_to_set_to_false":"Set to false if the patient currently does not have a pulmonary infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a pulmonary infection.","meaning":"Boolean indicating whether the patient currently has a pulmonary infection."} ;; "pulmonary infection"
(declare-const patient_has_finding_of_infectious_disease_of_lung_now@@recurrent Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a pulmonary infection and the infection is recurrent.","when_to_set_to_false":"Set to false if the patient currently has a pulmonary infection and the infection is not recurrent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pulmonary infection is recurrent.","meaning":"Boolean indicating whether the patient's current pulmonary infection is recurrent."} ;; "recurrent pulmonary infection"
(declare-const patient_has_finding_of_infectious_disease_of_lung_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a pulmonary infection within the past three months.","when_to_set_to_false":"Set to false if the patient has not had a pulmonary infection within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a pulmonary infection within the past three months.","meaning":"Boolean indicating whether the patient has had a pulmonary infection within the past three months."} ;; "recent pulmonary infection within the past three months"
(declare-const patient_has_finding_of_infectious_disease_of_lung_now@@acute Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a pulmonary infection and the infection is acute.","when_to_set_to_false":"Set to false if the patient currently has a pulmonary infection and the infection is not acute.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pulmonary infection is acute.","meaning":"Boolean indicating whether the patient's current pulmonary infection is acute."} ;; "acute pulmonary infection"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_infectious_disease_of_lung_now@@recurrent
       patient_has_finding_of_infectious_disease_of_lung_now)
   :named REQ2_AUXILIARY0)) ;; "recurrent pulmonary infection"

(assert
(! (=> patient_has_finding_of_infectious_disease_of_lung_now@@acute
       patient_has_finding_of_infectious_disease_of_lung_now)
   :named REQ2_AUXILIARY1)) ;; "acute pulmonary infection"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: asthma AND recurrent pulmonary infection
(assert
(! (not (and patient_has_diagnosis_of_asthma_now
             patient_has_finding_of_infectious_disease_of_lung_now@@recurrent))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has asthma AND the patient has recurrent pulmonary infection."

;; Component 1: recent pulmonary infection within the past three months
(assert
(! (not patient_has_finding_of_infectious_disease_of_lung_inthepast3months)
   :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has recent pulmonary infection within the past three months."

;; Component 2: acute pulmonary infection
(assert
(! (not patient_has_finding_of_infectious_disease_of_lung_now@@acute)
   :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute pulmonary infection."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_allergy_to_lidocaine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented clinical finding of allergy to lidocaine.","when_to_set_to_false":"Set to false if the patient currently does not have a documented clinical finding of allergy to lidocaine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of allergy to lidocaine.","meaning":"Boolean indicating whether the patient currently has a clinical finding of allergy to lidocaine."} ;; "allergy to lidocaine"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_allergy_to_lidocaine_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an allergy to lidocaine."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has kidney disease.","when_to_set_to_false":"Set to false if the patient currently does not have kidney disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has kidney disease.","meaning":"Boolean indicating whether the patient currently has kidney disease."} ;; "significant kidney disease"
(declare-const patient_is_undergoing_dialysis_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing dialysis.","when_to_set_to_false":"Set to false if the patient is currently not undergoing dialysis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing dialysis.","meaning":"Boolean indicating whether the patient is currently undergoing dialysis procedure."} ;; "dialysis"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_kidney_disease_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant kidney disease."

(assert
(! (not patient_is_undergoing_dialysis_procedure_now)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has dialysis."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."} ;; "the patient is female"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently pregnant.","when_to_set_to_false":"Set to false if the patient is documented as not currently pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently lactating.","when_to_set_to_false":"Set to false if the patient is documented as not currently lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"
(declare-const patient_is_pregnant_inthefuture12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as intending to become pregnant within the next twelve months.","when_to_set_to_false":"Set to false if the patient is documented as not intending to become pregnant within the next twelve months.","when_to_set_to_null":"Set to null if the patient's intention to become pregnant within the next twelve months is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient intends to become pregnant within the next twelve months."} ;; "the patient is intending to become pregnant in the next twelve months"
(declare-const patients_lactation_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating (actively producing milk).","when_to_set_to_false":"Set to false if the patient is currently not lactating (not producing milk).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently lactating.","meaning":"Boolean indicating whether the patient is currently lactating."} ;; "lactating"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Link observable lactation to clinical status
(assert
(! (= patient_is_lactating_now patients_lactation_is_positive_now)
:named REQ5_AUXILIARY0)) ;; "the patient is lactating"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient is female AND pregnant
(assert
(! (not (and patient_sex_is_female_now patient_is_pregnant_now))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is female AND the patient is pregnant."

;; Exclusion: patient is female AND lactating
(assert
(! (not (and patient_sex_is_female_now patient_is_lactating_now))
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is female AND the patient is lactating."

;; Exclusion: patient is female AND intending to become pregnant in the next twelve months
(assert
(! (not (and patient_sex_is_female_now patient_is_pregnant_inthefuture12months))
:named REQ5_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is female AND the patient is intending to become pregnant in the next twelve months."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of human immunodeficiency virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of human immunodeficiency virus infection."} ;; "human immunodeficiency virus infection"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has human immunodeficiency virus infection."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_coronary_arteriosclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of coronary artery disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of coronary artery disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of coronary artery disease.","meaning":"Boolean indicating whether the patient currently has coronary artery disease."} ;; "coronary artery disease"
(declare-const patient_has_finding_of_coronary_arteriosclerosis_now@@unstable Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has coronary artery disease and the disease is unstable.","when_to_set_to_false":"Set to false if the patient currently has coronary artery disease and the disease is not unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's coronary artery disease is unstable.","meaning":"Boolean indicating whether the patient's coronary artery disease is unstable."} ;; "unstable coronary artery disease"
(declare-const patient_has_finding_of_preinfarction_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of unstable angina.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of unstable angina.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of unstable angina.","meaning":"Boolean indicating whether the patient currently has unstable angina."} ;; "unstable angina"
(declare-const nyha_cardiac_status_value_recorded_now_withunit_class Real) ;; {"when_to_set_to_value":"Set to the numeric value corresponding to the patient's current NYHA cardiac status class (e.g., 1 for Class I, 2 for Class II, 3 for Class III, 4 for Class IV) if available.","when_to_set_to_null":"Set to null if the patient's current NYHA cardiac status is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current NYHA cardiac status, with unit 'class'."} ;; "New York Heart Association cardiac status greater than Class II"
(declare-const patient_has_finding_of_congestive_heart_failure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had the clinical finding of congestive heart failure in their history.","when_to_set_to_false":"Set to false if the patient has never had the clinical finding of congestive heart failure in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had the clinical finding of congestive heart failure in their history.","meaning":"Boolean indicating whether the patient has a history of congestive heart failure."} ;; "history of congestive heart failure"
(declare-const patient_has_finding_of_myocardial_infarction_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a myocardial infarction within the past twelve months.","when_to_set_to_false":"Set to false if the patient has not had a myocardial infarction within the past twelve months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a myocardial infarction within the past twelve months.","meaning":"Boolean indicating whether the patient has had a myocardial infarction within the past twelve months."} ;; "myocardial infarction within the last twelve months"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_coronary_arteriosclerosis_now@@unstable
       patient_has_finding_of_coronary_arteriosclerosis_now)
   :named REQ7_AUXILIARY0)) ;; "unstable coronary artery disease"

;; Definition: unstable coronary artery disease as evidenced by (unstable angina OR NYHA > II OR history of CHF OR MI within 12 months)
(assert
(! (= patient_has_finding_of_coronary_arteriosclerosis_now@@unstable
      (or patient_has_finding_of_preinfarction_syndrome_now
          (> nyha_cardiac_status_value_recorded_now_withunit_class 2)
          patient_has_finding_of_congestive_heart_failure_inthehistory
          patient_has_finding_of_myocardial_infarction_inthepast12months))
   :named REQ7_AUXILIARY1)) ;; "as evidenced by ((unstable angina) OR (NYHA cardiac status > Class II) OR (history of CHF) OR (MI within 12 months))"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_coronary_arteriosclerosis_now@@unstable)
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has unstable coronary artery disease as evidenced by ((unstable angina) OR (NYHA cardiac status > Class II) OR (history of CHF) OR (MI within 12 months))."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_can_undergo_bronchoscopy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo bronchoscopy (i.e., no contraindication exists).","when_to_set_to_false":"Set to false if the patient is currently contraindicated for undergoing bronchoscopy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo bronchoscopy.","meaning":"Boolean indicating whether the patient can currently undergo bronchoscopy."} ;; "contraindicated for undergoing bronchoscopy"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_can_undergo_bronchoscopy_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is contraindicated for undergoing bronchoscopy."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have any disease, condition, or clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease, condition, or clinical finding.","meaning":"Boolean indicating whether the patient currently has any disease, condition, or clinical finding."} ;; "any medical condition"
(declare-const patient_has_finding_of_disease_condition_finding_now@@would_preclude_study_entry_investigator_opinion Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding, and the investigator's opinion is that this condition would preclude study entry.","when_to_set_to_false":"Set to false if the patient currently has any disease, condition, or clinical finding, but the investigator's opinion is that it would not preclude study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator's opinion is that the condition would preclude study entry.","meaning":"Boolean indicating whether the patient currently has any disease, condition, or clinical finding, and the investigator's opinion is that this condition would preclude study entry."} ;; "in the opinion of the investigator, would preclude the patient from entering the study"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@would_preclude_study_entry_investigator_opinion
      patient_has_finding_of_disease_condition_finding_now)
:named REQ9_AUXILIARY0)) ;; "in the opinion of the investigator, would preclude the patient from entering the study"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_disease_condition_finding_now@@would_preclude_study_entry_investigator_opinion)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any medical condition that, in the opinion of the investigator, would preclude the patient from entering the study."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_respiratory_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of respiratory failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of respiratory failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of respiratory failure.","meaning":"Boolean indicating whether the patient currently has respiratory failure."} ;; "respiratory failure"

(declare-const patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a numeric measurement of the patient's current hemoglobin saturation with oxygen (oxygen saturation) is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current hemoglobin saturation with oxygen (oxygen saturation)."} ;; "oxygen saturation < 90 percent"

(declare-const patient_partial_pressure_of_oxygen_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's current partial pressure of oxygen is available in millimeters of mercury.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current partial pressure of oxygen in millimeters of mercury."} ;; "partial pressure of oxygen < 60 millimeters of mercury"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or (< patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent 90)
           (< patient_partial_pressure_of_oxygen_value_recorded_now_withunit_millimeters_of_mercury 60))
       patient_has_finding_of_respiratory_failure_now)
:named REQ10_AUXILIARY0)) ;; "with non-exhaustive examples ((oxygen saturation < 90 percent) OR (partial pressure of oxygen < 60 millimeters of mercury))."

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_respiratory_failure_now)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of respiratory failure with non-exhaustive examples ((oxygen saturation < 90 percent) OR (partial pressure of oxygen < 60 millimeters of mercury))."
