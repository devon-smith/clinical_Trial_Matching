;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has chronic obstructive pulmonary disease."} ;; "chronic obstructive pulmonary disease"

(declare-const patient_has_finding_of_chronic_obstructive_lung_disease_now@@gold_stage_i Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic obstructive pulmonary disease and the disease is at Global Initiative for Chronic Obstructive Lung Disease stage I.","when_to_set_to_false":"Set to false if the patient currently has chronic obstructive pulmonary disease but the disease is not at stage I.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic obstructive pulmonary disease is at stage I.","meaning":"Boolean indicating whether the patient's chronic obstructive pulmonary disease is at Global Initiative for Chronic Obstructive Lung Disease stage I."} ;; "chronic obstructive pulmonary disease Global Initiative for Chronic Obstructive Lung Disease stage I"

(declare-const patient_has_finding_of_chronic_obstructive_lung_disease_now@@gold_stage_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic obstructive pulmonary disease and the disease is at Global Initiative for Chronic Obstructive Lung Disease stage IV.","when_to_set_to_false":"Set to false if the patient currently has chronic obstructive pulmonary disease but the disease is not at stage IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic obstructive pulmonary disease is at stage IV.","meaning":"Boolean indicating whether the patient's chronic obstructive pulmonary disease is at Global Initiative for Chronic Obstructive Lung Disease stage IV."} ;; "chronic obstructive pulmonary disease Global Initiative for Chronic Obstructive Lung Disease stage IV"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_chronic_obstructive_lung_disease_now@@gold_stage_i
      patient_has_finding_of_chronic_obstructive_lung_disease_now)
   :named REQ0_AUXILIARY0)) ;; "chronic obstructive pulmonary disease Global Initiative for Chronic Obstructive Lung Disease stage I"

(assert
(! (=> patient_has_finding_of_chronic_obstructive_lung_disease_now@@gold_stage_iv
      patient_has_finding_of_chronic_obstructive_lung_disease_now)
   :named REQ0_AUXILIARY1)) ;; "chronic obstructive pulmonary disease Global Initiative for Chronic Obstructive Lung Disease stage IV"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_chronic_obstructive_lung_disease_now@@gold_stage_i)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic obstructive pulmonary disease Global Initiative for Chronic Obstructive Lung Disease stage I."

(assert
(! (not patient_has_finding_of_chronic_obstructive_lung_disease_now@@gold_stage_iv)
   :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic obstructive pulmonary disease Global Initiative for Chronic Obstructive Lung Disease stage IV."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_asthma_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with asthma at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with asthma in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with asthma.","meaning":"Boolean indicating whether the patient has a history of asthma."} ;; "a history of asthma"
(declare-const patient_has_finding_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of asthma.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of asthma.","meaning":"Boolean indicating whether the patient currently has a clinical finding of asthma."} ;; "present asthma by complaints"
(declare-const patient_has_finding_of_eosinophil_count_raised_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of raised eosinophil count (eosinophilia).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of raised eosinophil count (eosinophilia).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of raised eosinophil count (eosinophilia).","meaning":"Boolean indicating whether the patient currently has raised eosinophil count (eosinophilia)."} ;; "eosinophilia"
(declare-const patient_has_symptoms_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms consistent with asthma.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms consistent with asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of asthma.","meaning":"Boolean indicating whether the patient currently has symptoms of asthma."} ;; "present asthma by complaints"
(declare-const patient_reversibility_value_recorded_now_withunit_percent_of_predicted Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current reversibility as a percent of predicted is recorded.","when_to_set_to_null":"Set to null if the patient's current reversibility as a percent of predicted is not recorded, unknown, or cannot be determined.","meaning":"Numeric value indicating the patient's current measured reversibility as a percent of predicted value."} ;; "reversibility ≥ 10 % of predicted"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have any asthmatic component as defined
(assert
(! (not (or patient_has_diagnosis_of_asthma_inthehistory
            patient_has_finding_of_asthma_now
            patient_has_symptoms_of_asthma_now
            patient_has_finding_of_eosinophil_count_raised_now
            (>= patient_reversibility_value_recorded_now_withunit_percent_of_predicted 10)))
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has an asthmatic component defined as (a history of asthma) OR (present asthma by complaints) OR (eosinophilia) OR (reversibility ≥ 10 % of predicted))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_unable_to_communicate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to communicate.","when_to_set_to_false":"Set to false if the patient is currently able to communicate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to communicate.","meaning":"Boolean indicating whether the patient is currently unable to communicate."} ;; "unable to communicate"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_unable_to_communicate_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to communicate."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_exercise_physically_impossible_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently physically unable to perform any of the required tests.","when_to_set_to_false":"Set to false if the patient is currently physically able to perform all of the required tests.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently physically unable to perform any of the required tests.","meaning":"Boolean indicating whether the patient is currently physically unable to perform any of the required tests."} ;; "physically unable to perform any of the tests"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_exercise_physically_impossible_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is physically unable to perform any of the tests."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_disorder_of_respiratory_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disorder of the respiratory system, regardless of type.","when_to_set_to_false":"Set to false if the patient currently does not have any disorder of the respiratory system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disorder of the respiratory system.","meaning":"Boolean indicating whether the patient currently has any disorder of the respiratory system."} ;; "respiratory disorders"
(declare-const patient_has_finding_of_disorder_of_respiratory_system_now@@non_chronic_obstructive_pulmonary_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the respiratory system and that disorder is non-chronic obstructive pulmonary disease (non-COPD).","when_to_set_to_false":"Set to false if the patient currently has a disorder of the respiratory system and that disorder is chronic obstructive pulmonary disease (COPD) or if the patient does not have a respiratory disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's respiratory disorder is non-chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient's current respiratory disorder is non-chronic obstructive pulmonary disease (non-COPD)."} ;; "non-chronic obstructive pulmonary disease respiratory disorders"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_finding_of_disorder_of_respiratory_system_now@@non_chronic_obstructive_pulmonary_disease
      patient_has_finding_of_disorder_of_respiratory_system_now)
   :named REQ4_AUXILIARY0)) ;; "non-chronic obstructive pulmonary disease respiratory disorders" implies "respiratory disorders"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_disorder_of_respiratory_system_now@@non_chronic_obstructive_pulmonary_disease)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has non-chronic obstructive pulmonary disease respiratory disorders."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_undergone_lung_volume_reduction_surgery_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone lung-volume reduction surgery at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone lung-volume reduction surgery at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone lung-volume reduction surgery.","meaning":"Boolean indicating whether the patient has ever undergone lung-volume reduction surgery at any time in the past."} ;; "lung-volume reduction surgery"
(declare-const patient_has_undergone_transplant_of_lung_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone lung transplantation at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone lung transplantation at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone lung transplantation.","meaning":"Boolean indicating whether the patient has ever undergone lung transplantation at any time in the past."} ;; "lung transplantation"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_undergone_lung_volume_reduction_surgery_inthehistory)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had previous lung-volume reduction surgery."

(assert
(! (not patient_has_undergone_transplant_of_lung_inthehistory)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had previous lung transplantation."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_alcohol_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of alcohol abuse.","when_to_set_to_false":"Set to false if the patient currently does not have evidence of alcohol abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of alcohol abuse.","meaning":"Boolean indicating whether the patient currently has evidence of alcohol abuse."} ;; "evidence of alcohol abuse"
(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of drug abuse.","when_to_set_to_false":"Set to false if the patient currently does not have evidence of drug abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of drug abuse.","meaning":"Boolean indicating whether the patient currently has evidence of drug abuse."} ;; "evidence of drug abuse"
(declare-const patient_has_finding_of_solvent_misuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of solvent abuse.","when_to_set_to_false":"Set to false if the patient currently does not have evidence of solvent abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of solvent abuse.","meaning":"Boolean indicating whether the patient currently has evidence of solvent abuse."} ;; "evidence of solvent abuse"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_alcohol_abuse_now)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of alcohol abuse."

(assert
(! (not patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now)
    :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of drug abuse."

(assert
(! (not patient_has_finding_of_solvent_misuse_now)
    :named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of solvent abuse."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_diagnosis_of_alpha_1_antitrypsin_deficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of alpha-1 antitrypsin deficiency.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of alpha-1 antitrypsin deficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of alpha-1 antitrypsin deficiency.","meaning":"Boolean indicating whether the patient currently has a diagnosis of alpha-1 antitrypsin deficiency."} ;; "alpha-1 antitrypsin deficiency"
(declare-const patient_has_diagnosis_of_alpha_1_antitrypsin_deficiency_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of alpha-1 antitrypsin deficiency is known (confirmed and documented).","when_to_set_to_false":"Set to false if the patient's diagnosis of alpha-1 antitrypsin deficiency is not known (suspected, undiagnosed, or uncertain).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of alpha-1 antitrypsin deficiency is known.","meaning":"Boolean indicating whether the patient's diagnosis of alpha-1 antitrypsin deficiency is known (confirmed and documented)."} ;; "known alpha-1 antitrypsin deficiency"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_alpha_1_antitrypsin_deficiency_now@@known
      patient_has_diagnosis_of_alpha_1_antitrypsin_deficiency_now)
   :named REQ7_AUXILIARY0)) ;; "known alpha-1 antitrypsin deficiency"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_diagnosis_of_alpha_1_antitrypsin_deficiency_now@@known)
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known alpha-1 antitrypsin deficiency."
