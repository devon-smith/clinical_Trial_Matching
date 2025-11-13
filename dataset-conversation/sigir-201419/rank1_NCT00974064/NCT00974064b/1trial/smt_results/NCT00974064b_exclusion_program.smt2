;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_able_to_provide_proper_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to provide proper informed consent.","when_to_set_to_false":"Set to false if the patient is currently unable to provide proper informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to provide proper informed consent.","meaning":"Boolean indicating whether the patient is currently able to provide proper informed consent."} ;; "unable to provide proper informed consent"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_able_to_provide_proper_informed_consent_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to provide proper informed consent."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_habitual_drug_user_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had habitual use of drugs within the past six months.","when_to_set_to_false":"Set to false if the patient has not had habitual use of drugs within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had habitual use of drugs within the past six months.","meaning":"Boolean indicating whether the patient has had habitual use of drugs within the past six months."} ;; "habitual use of drugs within the past six months"
(declare-const patient_has_finding_of_habitual_drug_user_inthepast6months@@exception_marijuana_one_time_in_three_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient's habitual drug use within the past six months is excepted because marijuana use occurred only one time in three months.","when_to_set_to_false":"Set to false if the exception does not apply (i.e., marijuana use occurred more than once in three months or other drugs were used habitually).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exception for marijuana use applies.","meaning":"Boolean indicating whether the exception for marijuana use (one time in three months) applies to the patient's habitual drug use within the past six months."} ;; "except if marijuana use occurred one time in three months"
(declare-const patient_has_finding_of_habitual_drinker_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had habitual use of alcohol within the past six months.","when_to_set_to_false":"Set to false if the patient has not had habitual use of alcohol within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had habitual use of alcohol within the past six months.","meaning":"Boolean indicating whether the patient has had habitual use of alcohol within the past six months."} ;; "habitual use of alcohol within the past six months"
(declare-const patient_has_finding_of_habitual_drinker_inthepast6months@@exception_average_two_alcoholic_beverages_per_day Bool) ;; {"when_to_set_to_true":"Set to true if the patient's habitual alcohol use within the past six months is excepted because the average consumption is two alcoholic beverages per day.","when_to_set_to_false":"Set to false if the exception does not apply (i.e., average consumption is greater than two alcoholic beverages per day or other habitual use patterns).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exception for average daily consumption applies.","meaning":"Boolean indicating whether the exception for average daily consumption (two alcoholic beverages per day) applies to the patient's habitual alcohol use within the past six months."} ;; "except if the average is two alcoholic beverages per day"
(declare-const patient_has_finding_of_drug_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently meets criteria for drug abuse as defined by DSM-IV substance abuse criteria.","when_to_set_to_false":"Set to false if the patient currently does not meet criteria for drug abuse as defined by DSM-IV substance abuse criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently meets criteria for drug abuse as defined by DSM-IV substance abuse criteria.","meaning":"Boolean indicating whether the patient currently meets criteria for drug abuse as defined by DSM-IV substance abuse criteria."} ;; "drug abuse is defined as per the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition substance abuse criteria"
(declare-const patient_has_finding_of_alcohol_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently meets criteria for alcohol abuse as defined by DSM-IV substance abuse criteria.","when_to_set_to_false":"Set to false if the patient currently does not meet criteria for alcohol abuse as defined by DSM-IV substance abuse criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently meets criteria for alcohol abuse as defined by DSM-IV substance abuse criteria.","meaning":"Boolean indicating whether the patient currently meets criteria for alcohol abuse as defined by DSM-IV substance abuse criteria."} ;; "alcohol abuse is defined as per the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition substance abuse criteria"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_habitual_drug_user_inthepast6months@@exception_marijuana_one_time_in_three_months
      patient_has_finding_of_habitual_drug_user_inthepast6months)
:named REQ1_AUXILIARY0)) ;; "except if marijuana use occurred one time in three months"

(assert
(! (=> patient_has_finding_of_habitual_drinker_inthepast6months@@exception_average_two_alcoholic_beverages_per_day
      patient_has_finding_of_habitual_drinker_inthepast6months)
:named REQ1_AUXILIARY1)) ;; "except if the average is two alcoholic beverages per day"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: habitual drug use in past 6 months, except if marijuana use occurred one time in three months
(assert
(! (not (and patient_has_finding_of_habitual_drug_user_inthepast6months
             (not patient_has_finding_of_habitual_drug_user_inthepast6months@@exception_marijuana_one_time_in_three_months)))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has habitual use of drugs within the past six months, except if marijuana use occurred one time in three months"

;; Exclusion: habitual alcohol use in past 6 months, except if the average is two alcoholic beverages per day
(assert
(! (not (and patient_has_finding_of_habitual_drinker_inthepast6months
             (not patient_has_finding_of_habitual_drinker_inthepast6months@@exception_average_two_alcoholic_beverages_per_day)))
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has habitual use of alcohol within the past six months, except if the average is two alcoholic beverages per day"

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of asthma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of asthma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of asthma."} ;; "asthma"

(declare-const patient_has_diagnosis_of_infectious_disease_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of infectious disease of the lung.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of infectious disease of the lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of infectious disease of the lung.","meaning":"Boolean indicating whether the patient currently has a diagnosis of infectious disease of the lung."} ;; "pulmonary infection"

(declare-const patient_has_diagnosis_of_infectious_disease_of_lung_now@@recurrent Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of infectious disease of the lung and the infection is recurrent.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of infectious disease of the lung but the infection is not recurrent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is recurrent.","meaning":"Boolean indicating whether the patient's current infectious disease of the lung is recurrent."} ;; "recurrent pulmonary infection"

(declare-const patient_has_diagnosis_of_infectious_disease_of_lung_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of infectious disease of the lung within the past three months.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of infectious disease of the lung within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of infectious disease of the lung within the past three months.","meaning":"Boolean indicating whether the patient has had a diagnosis of infectious disease of the lung within the past three months."} ;; "recent pulmonary infection within three months"

(declare-const patient_has_diagnosis_of_infectious_disease_of_lung_now@@acute Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of infectious disease of the lung and the infection is acute.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of infectious disease of the lung but the infection is not acute.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is acute.","meaning":"Boolean indicating whether the patient's current infectious disease of the lung is acute."} ;; "acute pulmonary infection"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_infectious_disease_of_lung_now@@recurrent
       patient_has_diagnosis_of_infectious_disease_of_lung_now)
:named REQ2_AUXILIARY0)) ;; "recurrent pulmonary infection"

(assert
(! (=> patient_has_diagnosis_of_infectious_disease_of_lung_now@@acute
       patient_has_diagnosis_of_infectious_disease_of_lung_now)
:named REQ2_AUXILIARY1)) ;; "acute pulmonary infection"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: The patient is excluded if the patient has asthma AND the patient has recurrent pulmonary infection.
(assert
(! (not (and patient_has_diagnosis_of_asthma_now
             patient_has_diagnosis_of_infectious_disease_of_lung_now@@recurrent))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has asthma AND the patient has recurrent pulmonary infection."

;; Component 1: The patient is excluded if the patient has recent pulmonary infection within three months.
(assert
(! (not patient_has_diagnosis_of_infectious_disease_of_lung_inthepast3months)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has recent pulmonary infection within three months."

;; Component 2: The patient is excluded if the patient has acute pulmonary infection.
(assert
(! (not patient_has_diagnosis_of_infectious_disease_of_lung_now@@acute)
:named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute pulmonary infection."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_allergy_to_lidocaine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to lidocaine.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to lidocaine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to lidocaine.","meaning":"Boolean indicating whether the patient currently has an allergy to lidocaine."} ;; "allergy to lidocaine"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_allergy_to_lidocaine_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has allergy to lidocaine."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of kidney disease.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of kidney disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of kidney disease.","meaning":"Boolean indicating whether the patient currently has kidney disease."} ;; "kidney disease"
(declare-const patient_has_finding_of_kidney_disease_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's kidney disease is considered significant.","when_to_set_to_false":"Set to false if the patient's kidney disease is not considered significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's kidney disease is significant.","meaning":"Boolean indicating whether the patient's kidney disease is significant."} ;; "significant kidney disease"
(declare-const patient_is_undergoing_dialysis_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing dialysis treatment.","when_to_set_to_false":"Set to false if the patient is not currently undergoing dialysis treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing dialysis treatment.","meaning":"Boolean indicating whether the patient is currently undergoing dialysis treatment."} ;; "dialysis treatment"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_kidney_disease_now@@significant
      patient_has_finding_of_kidney_disease_now)
   :named REQ4_AUXILIARY0)) ;; "significant kidney disease" implies "kidney disease"

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
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is currently female."} ;; "the patient is female"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently pregnant.","when_to_set_to_false":"Set to false if the patient is documented as not currently pregnant.","when_to_set_to_null":"Set to null if the patient's pregnancy status is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently lactating.","when_to_set_to_false":"Set to false if the patient is documented as not currently lactating.","when_to_set_to_null":"Set to null if the patient's lactation status is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"
(declare-const patient_is_able_to_be_pregnant_inthefuture12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as intending or able to become pregnant in the next twelve months.","when_to_set_to_false":"Set to false if the patient is documented as not intending or not able to become pregnant in the next twelve months.","when_to_set_to_null":"Set to null if the patient's intention or ability to become pregnant in the next twelve months is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient intends or is able to become pregnant in the next twelve months."} ;; "the patient is intending to become pregnant in the next twelve months"

;; ===================== Constraint Assertions (REQ 5) =====================
;; "The patient is excluded if the patient is female AND the patient is pregnant."
(assert
(! (not (and patient_sex_is_female_now patient_is_pregnant_now))
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS))

;; "The patient is excluded if the patient is female AND the patient is lactating."
(assert
(! (not (and patient_sex_is_female_now patient_is_lactating_now))
    :named REQ5_COMPONENT1_OTHER_REQUIREMENTS))

;; "The patient is excluded if the patient is female AND the patient is intending to become pregnant in the next twelve months."
(assert
(! (not (and patient_sex_is_female_now patient_is_able_to_be_pregnant_inthefuture12months))
    :named REQ5_COMPONENT2_OTHER_REQUIREMENTS))

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
(declare-const patient_has_nyha_cardiac_status_value_recorded_now_withunit_class Real) ;; {"when_to_set_to_value":"Set to the numeric value corresponding to the patient's current NYHA cardiac status class (e.g., 1 for Class I, 2 for Class II, 3 for Class III, 4 for Class IV) as recorded now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the patient's current NYHA cardiac status class is.","meaning":"Numeric value indicating the patient's current NYHA cardiac status class, with unit 'class'."} ;; "greater than Class II New York Heart Association cardiac status"
(declare-const patient_has_finding_of_congestive_heart_failure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had the clinical finding of congestive heart failure at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had the clinical finding of congestive heart failure in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had congestive heart failure.","meaning":"Boolean indicating whether the patient has ever had congestive heart failure in their history."} ;; "history of congestive heart failure"
(declare-const patient_has_finding_of_myocardial_infarction_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had the clinical finding of myocardial infarction within the past twelve months.","when_to_set_to_false":"Set to false if the patient has not had the clinical finding of myocardial infarction within the past twelve months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a myocardial infarction within the past twelve months.","meaning":"Boolean indicating whether the patient has had a myocardial infarction within the past twelve months."} ;; "myocardial infarction within the last twelve months"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; "unstable coronary artery disease as evidenced by unstable angina"
(assert
(! (=> patient_has_finding_of_preinfarction_syndrome_now
      patient_has_finding_of_coronary_arteriosclerosis_now@@unstable)
   :named REQ7_AUXILIARY0)) ;; "as evidenced by unstable angina"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_coronary_arteriosclerosis_now@@unstable
      patient_has_finding_of_coronary_arteriosclerosis_now)
   :named REQ7_AUXILIARY1)) ;; "unstable coronary artery disease"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: unstable coronary artery disease as evidenced by unstable angina
(assert
(! (not patient_has_finding_of_coronary_arteriosclerosis_now@@unstable)
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "unstable coronary artery disease as evidenced by unstable angina"

;; Component 1: greater than Class II NYHA cardiac status
(assert
(! (not (> patient_has_nyha_cardiac_status_value_recorded_now_withunit_class 2))
   :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "greater than Class II New York Heart Association cardiac status"

;; Component 2: history of congestive heart failure
(assert
(! (not patient_has_finding_of_congestive_heart_failure_inthehistory)
   :named REQ7_COMPONENT2_OTHER_REQUIREMENTS)) ;; "history of congestive heart failure"

;; Component 3: myocardial infarction within the last twelve months
(assert
(! (not patient_has_finding_of_myocardial_infarction_inthepast12months)
   :named REQ7_COMPONENT3_OTHER_REQUIREMENTS)) ;; "myocardial infarction within the last twelve months"

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_contraindication_for_undergoing_bronchoscopy Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented or clinically determined contraindication for undergoing bronchoscopy.","when_to_set_to_false":"Set to false if the patient does not have a contraindication for undergoing bronchoscopy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a contraindication for undergoing bronchoscopy.","meaning":"Boolean indicating whether the patient has a contraindication for undergoing bronchoscopy."} ;; "contraindication for undergoing bronchoscopy"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_contraindication_for_undergoing_bronchoscopy)
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has contraindication for undergoing bronchoscopy."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have any disease, condition, or clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease, condition, or clinical finding.","meaning":"Boolean indicating whether the patient currently has any disease, condition, or clinical finding."} ;; "any medical condition"

(declare-const patient_has_finding_of_disease_condition_finding_now@@would_preclude_study_entry_investigator_opinion Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding, and, in the investigator's opinion, this would preclude study entry.","when_to_set_to_false":"Set to false if the patient currently has any disease, condition, or clinical finding, but, in the investigator's opinion, this would not preclude study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator's opinion is that the condition would preclude study entry.","meaning":"Boolean indicating whether the patient currently has any disease, condition, or clinical finding that, in the investigator's opinion, would preclude study entry."} ;; "in the opinion of the investigator, would preclude the patient from entering the study"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@would_preclude_study_entry_investigator_opinion
      patient_has_finding_of_disease_condition_finding_now)
:named REQ9_AUXILIARY0)) ;; "any medical condition that, in the opinion of the investigator, would preclude the patient from entering the study"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_disease_condition_finding_now@@would_preclude_study_entry_investigator_opinion)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any medical condition that, in the opinion of the investigator, would preclude the patient from entering the study."
