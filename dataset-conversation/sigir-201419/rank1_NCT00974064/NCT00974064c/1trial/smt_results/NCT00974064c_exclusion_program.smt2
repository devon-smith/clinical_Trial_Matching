;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_able_to_provide_proper_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to provide proper informed consent.","when_to_set_to_false":"Set to false if the patient is currently unable to provide proper informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to provide proper informed consent.","meaning":"Boolean indicating whether the patient is currently able to provide proper informed consent."} ;; "The patient is excluded if the patient is unable to provide proper informed consent."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_able_to_provide_proper_informed_consent_now)
:named REQ0_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to provide proper informed consent."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_habitual_drug_user_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had habitual use of drugs within the past six months.","when_to_set_to_false":"Set to false if the patient has not had habitual use of drugs within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had habitual use of drugs within the past six months.","meaning":"Boolean indicating whether the patient has had habitual use of drugs within the past six months."} ;; "habitual use of drugs within the past six months"

(declare-const patient_has_taken_cannabis_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken marijuana (cannabis) within the past three months.","when_to_set_to_false":"Set to false if the patient has not taken marijuana (cannabis) within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken marijuana (cannabis) within the past three months.","meaning":"Boolean indicating whether the patient has taken marijuana (cannabis) within the past three months."} ;; "marijuana is used one time in three months"

(declare-const patient_has_taken_cannabis_inthepast3months@@used_one_time_in_three_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken marijuana (cannabis) within the past three months and the usage occurred only one time.","when_to_set_to_false":"Set to false if the patient has taken marijuana (cannabis) within the past three months and the usage occurred more than one time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken marijuana (cannabis) only one time within the past three months.","meaning":"Boolean indicating whether the patient has taken marijuana (cannabis) only one time within the past three months."} ;; "marijuana is used one time in three months"

(declare-const patient_has_finding_of_habitual_drinker_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had habitual use of alcohol within the past six months.","when_to_set_to_false":"Set to false if the patient has not had habitual use of alcohol within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had habitual use of alcohol within the past six months.","meaning":"Boolean indicating whether the patient has had habitual use of alcohol within the past six months."} ;; "habitual use of alcohol within the past six months"

(declare-const patient_has_finding_of_habitual_drinker_inthepast6months@@except_if_average_is_two_alcoholic_beverages_per_day Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had habitual use of alcohol within the past six months and the average consumption is not two alcoholic beverages per day.","when_to_set_to_false":"Set to false if the patient has had habitual use of alcohol within the past six months and the average consumption is two alcoholic beverages per day.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the average consumption is two alcoholic beverages per day for habitual use of alcohol within the past six months.","meaning":"Boolean indicating whether the exception for average consumption of two alcoholic beverages per day applies to habitual use of alcohol within the past six months."} ;; "except if the average is two alcoholic beverages per day"

(declare-const patient_alcoholic_beverage_value_recorded_inthehistory_withunit_count_per_day Real) ;; {"when_to_set_to_value":"Set to the average number of alcoholic beverages consumed per day if such a value is available for the patient over their history.","when_to_set_to_null":"Set to null if no such average value is available or the value is indeterminate.","meaning":"Numeric value representing the patient's average daily consumption of alcoholic beverages over their history."} ;; "average is two alcoholic beverages per day"

(declare-const patient_has_diagnosis_of_drug_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of drug abuse at any time in their history.","when_to_set_to_false":"Set to false if the patient does not have a diagnosis of drug abuse at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a diagnosis of drug abuse at any time in their history.","meaning":"Boolean indicating whether the patient has a diagnosis of drug abuse at any time in their history."} ;; "drug abuse as defined per the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition substance abuse criteria"

(declare-const patient_has_diagnosis_of_alcohol_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of alcohol abuse at any time in their history.","when_to_set_to_false":"Set to false if the patient does not have a diagnosis of alcohol abuse at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a diagnosis of alcohol abuse at any time in their history.","meaning":"Boolean indicating whether the patient has a diagnosis of alcohol abuse at any time in their history."} ;; "alcohol abuse as defined per the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition substance abuse criteria"

(declare-const patient_has_diagnosis_of_substance_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of substance abuse at any time in their history.","when_to_set_to_false":"Set to false if the patient does not have a diagnosis of substance abuse at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a diagnosis of substance abuse at any time in their history.","meaning":"Boolean indicating whether the patient has a diagnosis of substance abuse at any time in their history."} ;; "substance abuse criteria"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable for marijuana usage: only one time in three months
(assert
(! (=> patient_has_taken_cannabis_inthepast3months@@used_one_time_in_three_months
patient_has_taken_cannabis_inthepast3months)
:named REQ1_AUXILIARY0)) ;; "marijuana is used one time in three months"

;; Qualifier variable for habitual alcohol use exception: average is two alcoholic beverages per day
(assert
(! (=> patient_has_finding_of_habitual_drinker_inthepast6months@@except_if_average_is_two_alcoholic_beverages_per_day
patient_has_finding_of_habitual_drinker_inthepast6months)
:named REQ1_AUXILIARY1)) ;; "except if the average is two alcoholic beverages per day"

;; Definition of the alcohol exception qualifier in terms of numeric value
(assert
(! (= patient_has_finding_of_habitual_drinker_inthepast6months@@except_if_average_is_two_alcoholic_beverages_per_day
(and patient_has_finding_of_habitual_drinker_inthepast6months
(not (= patient_alcoholic_beverage_value_recorded_inthehistory_withunit_count_per_day 2))))
:named REQ1_AUXILIARY2)) ;; "except if the average is two alcoholic beverages per day"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion 1: habitual use of drugs within past six months, except if marijuana is used one time in three months
(assert
(! (not (and patient_has_finding_of_habitual_drug_user_inthepast6months
             (not (and patient_has_taken_cannabis_inthepast3months
                       patient_has_taken_cannabis_inthepast3months@@used_one_time_in_three_months))))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has habitual use of drugs within the past six months, except if marijuana is used one time in three months."

;; Exclusion 2: habitual use of alcohol within past six months, except if average is two alcoholic beverages per day
(assert
(! (not patient_has_finding_of_habitual_drinker_inthepast6months@@except_if_average_is_two_alcoholic_beverages_per_day)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has habitual use of alcohol within the past six months, except if the average is two alcoholic beverages per day."

;; Exclusion 3: drug abuse as defined per DSM-IV substance abuse criteria
(assert
(! (not patient_has_diagnosis_of_drug_abuse_inthehistory)
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has drug abuse as defined per the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition substance abuse criteria."

;; Exclusion 4: alcohol abuse as defined per DSM-IV substance abuse criteria
(assert
(! (not patient_has_diagnosis_of_alcohol_abuse_inthehistory)
:named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has alcohol abuse as defined per the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition substance abuse criteria."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of asthma.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has asthma.","meaning":"Boolean indicating whether the patient currently has asthma."} ;; "asthma"
(declare-const patient_has_finding_of_infectious_disease_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pulmonary infection.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pulmonary infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pulmonary infection.","meaning":"Boolean indicating whether the patient currently has pulmonary infection."} ;; "pulmonary infection"
(declare-const patient_has_finding_of_infectious_disease_of_lung_now@@recurrent Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a pulmonary infection and the infection is recurrent.","when_to_set_to_false":"Set to false if the patient currently has a pulmonary infection and the infection is not recurrent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pulmonary infection is recurrent.","meaning":"Boolean indicating whether the patient's current pulmonary infection is recurrent."} ;; "recurrent pulmonary infection"
(declare-const patient_has_finding_of_infectious_disease_of_lung_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a pulmonary infection within the past three months.","when_to_set_to_false":"Set to false if the patient has not had a pulmonary infection within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a pulmonary infection within the past three months.","meaning":"Boolean indicating whether the patient has had a pulmonary infection within the past three months."} ;; "recent pulmonary infection within three months"
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
;; Exclusion if (asthma AND recurrent pulmonary infection)
(assert
(! (not (and patient_has_finding_of_asthma_now
             patient_has_finding_of_infectious_disease_of_lung_now@@recurrent))
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has asthma AND the patient has recurrent pulmonary infection."

;; Exclusion if recent pulmonary infection within three months
(assert
(! (not patient_has_finding_of_infectious_disease_of_lung_inthepast3months)
    :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has recent pulmonary infection within three months."

;; Exclusion if acute pulmonary infection
(assert
(! (not patient_has_finding_of_infectious_disease_of_lung_now@@acute)
    :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute pulmonary infection."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_allergy_to_lidocaine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to lidocaine.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to lidocaine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to lidocaine.","meaning":"Boolean indicating whether the patient currently has an allergy to lidocaine."} ;; "allergy to lidocaine"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_has_finding_of_allergy_to_lidocaine_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has allergy to lidocaine."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of kidney disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of kidney disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has kidney disease.","meaning":"Boolean indicating whether the patient currently has kidney disease now."} ;; "kidney disease"
(declare-const patient_has_finding_of_kidney_disease_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's kidney disease is significant.","when_to_set_to_false":"Set to false if the patient's kidney disease is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's kidney disease is significant.","meaning":"Boolean indicating whether the patient's kidney disease is significant."} ;; "significant kidney disease"
(declare-const patient_is_undergoing_dialysis_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing dialysis procedure.","when_to_set_to_false":"Set to false if the patient is currently not undergoing dialysis procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing dialysis procedure.","meaning":"Boolean indicating whether the patient is currently undergoing dialysis procedure now."} ;; "dialysis treatment"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_kidney_disease_now@@significant
      patient_has_finding_of_kidney_disease_now)
:named REQ4_AUXILIARY0)) ;; "significant kidney disease"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient must NOT have significant kidney disease
(assert
(! (not patient_has_finding_of_kidney_disease_now@@significant)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant kidney disease."

;; Exclusion: patient must NOT be undergoing dialysis treatment
(assert
(! (not patient_is_undergoing_dialysis_procedure_now)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has dialysis treatment."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female as currently recorded."} ;; "the patient is female"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently pregnant.","when_to_set_to_false":"Set to false if the patient is documented as not currently pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently lactating.","when_to_set_to_false":"Set to false if the patient is documented as not currently lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"
(declare-const patient_is_able_to_be_pregnant_inthefuture12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as intending or able to become pregnant in the next twelve months.","when_to_set_to_false":"Set to false if the patient is documented as not intending or not able to become pregnant in the next twelve months.","when_to_set_to_null":"Set to null if the patient's intent or ability to become pregnant in the next twelve months is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient intends or is able to become pregnant in the next twelve months."} ;; "the patient is intending to become pregnant in the next twelve months"
(declare-const patients_lactation_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently not lactating.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently lactating.","meaning":"Boolean indicating whether the patient is currently lactating."} ;; "lactating"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Link observable lactation entity to main lactation variable
(assert
(! (= patient_is_lactating_now patients_lactation_is_positive_now)
:named REQ5_AUXILIARY0)) ;; "lactating"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient is female AND (pregnant OR lactating OR intending to become pregnant in next 12 months)
(assert
(! (not (and patient_sex_is_female_now
             (or patient_is_pregnant_now
                 patient_is_lactating_now
                 patient_is_able_to_be_pregnant_inthefuture12months)))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is female AND ((the patient is pregnant) OR (the patient is lactating) OR (the patient is intending to become pregnant in the next twelve months)))."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has human immunodeficiency virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient currently has human immunodeficiency virus infection."} ;; "human immunodeficiency virus infection"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not patient_has_finding_of_human_immunodeficiency_virus_infection_now)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has human immunodeficiency virus infection."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_coronary_arteriosclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of coronary artery disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of coronary artery disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has coronary artery disease.","meaning":"Boolean indicating whether the patient currently has coronary artery disease."} ;; "coronary artery disease"
(declare-const patient_has_finding_of_coronary_arteriosclerosis_now@@unstable Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has coronary artery disease and the disease is unstable.","when_to_set_to_false":"Set to false if the patient currently has coronary artery disease and the disease is not unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's coronary artery disease is unstable.","meaning":"Boolean indicating whether the patient's coronary artery disease is unstable."} ;; "unstable coronary artery disease"
(declare-const patient_has_finding_of_preinfarction_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of unstable angina.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of unstable angina.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has unstable angina.","meaning":"Boolean indicating whether the patient currently has unstable angina."} ;; "unstable angina"
(declare-const patient_has_nyha_cardiac_status_value_recorded_now_withunit_class Real) ;; {"when_to_set_to_value":"Set to the integer value corresponding to the patient's current NYHA cardiac status class (e.g., 1 for Class I, 2 for Class II, etc.) if available.","when_to_set_to_null":"Set to null if the patient's current NYHA cardiac status class is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current NYHA cardiac status class."} ;; "greater than Class II New York Heart Association cardiac status"
(declare-const patient_has_finding_of_congestive_heart_failure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had the clinical finding of congestive heart failure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had the clinical finding of congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had congestive heart failure.","meaning":"Boolean indicating whether the patient has ever had congestive heart failure."} ;; "history of congestive heart failure"
(declare-const patient_has_finding_of_myocardial_infarction_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a myocardial infarction within the past twelve months.","when_to_set_to_false":"Set to false if the patient has not had a myocardial infarction within the past twelve months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a myocardial infarction within the past twelve months.","meaning":"Boolean indicating whether the patient has had a myocardial infarction within the past twelve months."} ;; "myocardial infarction within the last twelve months"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; "unstable coronary artery disease as evidenced by unstable angina"
(assert
(! (=> patient_has_finding_of_preinfarction_syndrome_now
       patient_has_finding_of_coronary_arteriosclerosis_now@@unstable)
   :named REQ7_AUXILIARY0)) ;; "as evidenced by unstable angina"

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_coronary_arteriosclerosis_now@@unstable
       patient_has_finding_of_coronary_arteriosclerosis_now)
   :named REQ7_AUXILIARY1)) ;; "unstable coronary artery disease"

;; ===================== Constraint Assertions (REQ 7) =====================
;; 1. Unstable coronary artery disease as evidenced by unstable angina
(assert
(! (not patient_has_finding_of_coronary_arteriosclerosis_now@@unstable)
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has unstable coronary artery disease as evidenced by unstable angina."

;; 2. Greater than Class II NYHA cardiac status
(assert
(! (not (> patient_has_nyha_cardiac_status_value_recorded_now_withunit_class 2))
   :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has greater than Class II New York Heart Association cardiac status."

;; 3. History of congestive heart failure
(assert
(! (not patient_has_finding_of_congestive_heart_failure_inthehistory)
   :named REQ7_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has history of congestive heart failure."

;; 4. Myocardial infarction within the last twelve months
(assert
(! (not patient_has_finding_of_myocardial_infarction_inthepast12months)
   :named REQ7_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has myocardial infarction within the last twelve months."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_can_undergo_bronchoscopy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo bronchoscopy (i.e., has no contraindication for bronchoscopy).","when_to_set_to_false":"Set to false if the patient currently cannot undergo bronchoscopy due to a contraindication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo bronchoscopy.","meaning":"Boolean indicating whether the patient can currently undergo bronchoscopy."} ;; "contraindication for undergoing bronchoscopy"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_can_undergo_bronchoscopy_now)
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has contraindication for undergoing bronchoscopy."

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
(declare-const patient_has_finding_of_major_depressive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has major depressive disorder.","when_to_set_to_false":"Set to false if the patient currently does not have major depressive disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has major depressive disorder.","meaning":"Boolean indicating whether the patient currently has major depressive disorder."} ;; "major depressive disorder"

(declare-const patient_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a psychiatric disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a psychiatric disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a psychiatric disorder.","meaning":"Boolean indicating whether the patient currently has a psychiatric disorder."} ;; "psychiatric disorder"

(declare-const patient_has_finding_of_mental_disorder_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a psychiatric disorder and the disorder is significant.","when_to_set_to_false":"Set to false if the patient currently has a psychiatric disorder but the disorder is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the psychiatric disorder is significant.","meaning":"Boolean indicating whether the patient's current psychiatric disorder is significant."} ;; "significant psychiatric disorder"

(declare-const patient_has_finding_of_mental_disorder_now@@other_than_major_depressive_disorder Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a psychiatric disorder and the disorder is not major depressive disorder.","when_to_set_to_false":"Set to false if the patient currently has a psychiatric disorder and the disorder is major depressive disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the psychiatric disorder is other than major depressive disorder.","meaning":"Boolean indicating whether the patient's current psychiatric disorder is not major depressive disorder."} ;; "other than major depressive disorder"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_mental_disorder_now@@significant
       patient_has_finding_of_mental_disorder_now)
   :named REQ10_AUXILIARY0)) ;; "significant psychiatric disorder"

(assert
(! (=> patient_has_finding_of_mental_disorder_now@@other_than_major_depressive_disorder
       patient_has_finding_of_mental_disorder_now)
   :named REQ10_AUXILIARY1)) ;; "other than major depressive disorder"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Exclusion: patient must NOT have current major depressive disorder
(assert
(! (not patient_has_finding_of_major_depressive_disorder_now)
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current major depressive disorder."

;; Exclusion: patient must NOT have other significant psychiatric disorder
(assert
(! (not (and patient_has_finding_of_mental_disorder_now@@significant
             patient_has_finding_of_mental_disorder_now@@other_than_major_depressive_disorder))
   :named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other significant psychiatric disorder."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_is_taking_antidepressant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any antidepressant medication.","when_to_set_to_false":"Set to false if the patient is currently not taking any antidepressant medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking antidepressant medication.","meaning":"Boolean indicating whether the patient is currently taking antidepressant medication."} ;; "antidepressant medication"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! (not patient_is_taking_antidepressant_now)
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently taking antidepressant medication."
