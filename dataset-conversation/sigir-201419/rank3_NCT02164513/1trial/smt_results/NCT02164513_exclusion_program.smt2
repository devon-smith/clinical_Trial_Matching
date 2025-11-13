;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently not lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"
(declare-const patient_is_pregnant_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is planning or expected to become pregnant during the study period.","when_to_set_to_false":"Set to false if the patient is not planning or expected to become pregnant during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is planning or expected to become pregnant during the study period.","meaning":"Boolean value indicating whether the patient is expected or planning to become pregnant in the future (during the study period)."} ;; "the patient is planning on becoming pregnant during the study"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."
(assert
  (! (not patient_is_lactating_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is lactating."
(assert
  (! (not patient_is_pregnant_inthefuture)
     :named REQ0_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is planning on becoming pregnant during the study."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_asthma_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a prior history of diagnosis of asthma.","when_to_set_to_false":"Set to false if the patient does not have a prior history of diagnosis of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a prior history of diagnosis of asthma.","meaning":"Boolean indicating whether the patient has a prior history of diagnosis of asthma."} ;; "prior history of asthma"
(declare-const patient_has_diagnosis_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of asthma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of asthma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of asthma."} ;; "current diagnosis of asthma"
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic obstructive pulmonary disease."} ;; "current diagnosis of chronic obstructive pulmonary disease"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient has a current diagnosis of asthma
(assert
(! (not patient_has_diagnosis_of_asthma_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current diagnosis of asthma."

;; Exclusion: patient has a prior history of asthma AND does NOT have a current diagnosis of chronic obstructive pulmonary disease
(assert
(! (not (and patient_has_diagnosis_of_asthma_inthehistory
             (not patient_has_diagnosis_of_chronic_obstructive_lung_disease_now)))
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a prior history of asthma AND the patient does NOT have a current diagnosis of chronic obstructive pulmonary disease."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_alpha_1_antitrypsin_deficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of alpha-1 antitrypsin deficiency.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of alpha-1 antitrypsin deficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of alpha-1 antitrypsin deficiency.","meaning":"Boolean indicating whether the patient currently has a diagnosis of alpha-1 antitrypsin deficiency."} ;; "alpha-1 antitrypsin deficiency"

(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@underlying_cause_is_alpha_1_antitrypsin_deficiency Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chronic obstructive pulmonary disease is caused by alpha-1 antitrypsin deficiency.","when_to_set_to_false":"Set to false if the patient's chronic obstructive pulmonary disease is not caused by alpha-1 antitrypsin deficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether alpha-1 antitrypsin deficiency is the underlying cause of the patient's chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient's chronic obstructive pulmonary disease is caused by alpha-1 antitrypsin deficiency."} ;; "alpha-1 antitrypsin deficiency as the underlying cause of chronic obstructive pulmonary disease"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@underlying_cause_is_alpha_1_antitrypsin_deficiency
     patient_has_diagnosis_of_chronic_obstructive_lung_disease_now)
:named REQ2_AUXILIARY0)) ;; "the patient has alpha-1 antitrypsin deficiency as the underlying cause of chronic obstructive pulmonary disease."

;; Underlying cause requires both COPD and alpha-1 antitrypsin deficiency
(assert
(! (=> patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@underlying_cause_is_alpha_1_antitrypsin_deficiency
     patient_has_diagnosis_of_alpha_1_antitrypsin_deficiency_now)
:named REQ2_AUXILIARY1)) ;; "the patient has alpha-1 antitrypsin deficiency as the underlying cause of chronic obstructive pulmonary disease."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@underlying_cause_is_alpha_1_antitrypsin_deficiency)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has alpha-1 antitrypsin deficiency as the underlying cause of chronic obstructive pulmonary disease."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of tuberculosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of tuberculosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of tuberculosis."} ;; "active tuberculosis"
(declare-const patient_has_diagnosis_of_tuberculosis_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of tuberculosis is currently active.","when_to_set_to_false":"Set to false if the patient's diagnosis of tuberculosis is not currently active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is active.","meaning":"Boolean indicating whether the patient's diagnosis of tuberculosis is active."} ;; "active tuberculosis"
(declare-const patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of primary malignant neoplasm of lung (lung cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of primary malignant neoplasm of lung (lung cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of primary malignant neoplasm of lung (lung cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of primary malignant neoplasm of lung (lung cancer)."} ;; "lung cancer"
(declare-const patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of primary malignant neoplasm of lung (lung cancer) is currently active.","when_to_set_to_false":"Set to false if the patient's diagnosis of primary malignant neoplasm of lung (lung cancer) is not currently active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is active.","meaning":"Boolean indicating whether the patient's diagnosis of primary malignant neoplasm of lung (lung cancer) is active."} ;; "active lung cancer"
(declare-const patient_has_diagnosis_of_bronchiectasis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of bronchiectasis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of bronchiectasis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of bronchiectasis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of bronchiectasis."} ;; "significant bronchiectasis"
(declare-const patient_has_diagnosis_of_bronchiectasis_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of bronchiectasis is significant.","when_to_set_to_false":"Set to false if the patient's diagnosis of bronchiectasis is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is significant.","meaning":"Boolean indicating whether the patient's diagnosis of bronchiectasis is significant."} ;; "significant bronchiectasis"
(declare-const patient_has_diagnosis_of_bronchiectasis_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of bronchiectasis is currently active.","when_to_set_to_false":"Set to false if the patient's diagnosis of bronchiectasis is not currently active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is active.","meaning":"Boolean indicating whether the patient's diagnosis of bronchiectasis is active."} ;; "active bronchiectasis"
(declare-const patient_has_diagnosis_of_sarcoidosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of sarcoidosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of sarcoidosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of sarcoidosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of sarcoidosis."} ;; "sarcoidosis"
(declare-const patient_has_diagnosis_of_sarcoidosis_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of sarcoidosis is currently active.","when_to_set_to_false":"Set to false if the patient's diagnosis of sarcoidosis is not currently active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is active.","meaning":"Boolean indicating whether the patient's diagnosis of sarcoidosis is active."} ;; "active sarcoidosis"
(declare-const patient_has_diagnosis_of_fibrosis_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of fibrosis of lung (lung fibrosis).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of fibrosis of lung (lung fibrosis).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of fibrosis of lung (lung fibrosis).","meaning":"Boolean indicating whether the patient currently has a diagnosis of fibrosis of lung (lung fibrosis)."} ;; "lung fibrosis"
(declare-const patient_has_diagnosis_of_fibrosis_of_lung_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of fibrosis of lung (lung fibrosis) is currently active.","when_to_set_to_false":"Set to false if the patient's diagnosis of fibrosis of lung (lung fibrosis) is not currently active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is active.","meaning":"Boolean indicating whether the patient's diagnosis of fibrosis of lung (lung fibrosis) is active."} ;; "active lung fibrosis"
(declare-const patient_has_diagnosis_of_pulmonary_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of pulmonary hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of pulmonary hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of pulmonary hypertension.","meaning":"Boolean indicating whether the patient currently has a diagnosis of pulmonary hypertension."} ;; "pulmonary hypertension"
(declare-const patient_has_diagnosis_of_pulmonary_hypertension_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of pulmonary hypertension is currently active.","when_to_set_to_false":"Set to false if the patient's diagnosis of pulmonary hypertension is not currently active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is active.","meaning":"Boolean indicating whether the patient's diagnosis of pulmonary hypertension is active."} ;; "active pulmonary hypertension"
(declare-const patient_has_diagnosis_of_interstitial_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of interstitial lung disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of interstitial lung disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of interstitial lung disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of interstitial lung disease."} ;; "interstitial lung disease"
(declare-const patient_has_diagnosis_of_interstitial_lung_disease_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of interstitial lung disease is currently active.","when_to_set_to_false":"Set to false if the patient's diagnosis of interstitial lung disease is not currently active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is active.","meaning":"Boolean indicating whether the patient's diagnosis of interstitial lung disease is active."} ;; "active interstitial lung disease"
(declare-const patient_has_diagnosis_of_other_pulmonary_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of another pulmonary disease not otherwise specified.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of another pulmonary disease not otherwise specified.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of another pulmonary disease not otherwise specified.","meaning":"Boolean indicating whether the patient currently has a diagnosis of another pulmonary disease not otherwise specified."} ;; "another active pulmonary disease"
(declare-const patient_has_diagnosis_of_other_pulmonary_disease_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of another pulmonary disease is currently active.","when_to_set_to_false":"Set to false if the patient's diagnosis of another pulmonary disease is not currently active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is active.","meaning":"Boolean indicating whether the patient's diagnosis of another pulmonary disease is active."} ;; "another active pulmonary disease"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_tuberculosis_now@@active
      patient_has_diagnosis_of_tuberculosis_now)
    :named REQ3_AUXILIARY0)) ;; "active tuberculosis"

(assert
(! (=> patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now@@active
      patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now)
    :named REQ3_AUXILIARY1)) ;; "active lung cancer"

(assert
(! (=> patient_has_diagnosis_of_bronchiectasis_now@@significant
      patient_has_diagnosis_of_bronchiectasis_now)
    :named REQ3_AUXILIARY2)) ;; "significant bronchiectasis"

(assert
(! (=> patient_has_diagnosis_of_bronchiectasis_now@@active
      patient_has_diagnosis_of_bronchiectasis_now)
    :named REQ3_AUXILIARY3)) ;; "active bronchiectasis"

(assert
(! (=> patient_has_diagnosis_of_sarcoidosis_now@@active
      patient_has_diagnosis_of_sarcoidosis_now)
    :named REQ3_AUXILIARY4)) ;; "active sarcoidosis"

(assert
(! (=> patient_has_diagnosis_of_fibrosis_of_lung_now@@active
      patient_has_diagnosis_of_fibrosis_of_lung_now)
    :named REQ3_AUXILIARY5)) ;; "active lung fibrosis"

(assert
(! (=> patient_has_diagnosis_of_pulmonary_hypertension_now@@active
      patient_has_diagnosis_of_pulmonary_hypertension_now)
    :named REQ3_AUXILIARY6)) ;; "active pulmonary hypertension"

(assert
(! (=> patient_has_diagnosis_of_interstitial_lung_disease_now@@active
      patient_has_diagnosis_of_interstitial_lung_disease_now)
    :named REQ3_AUXILIARY7)) ;; "active interstitial lung disease"

(assert
(! (=> patient_has_diagnosis_of_other_pulmonary_disease_now@@active
      patient_has_diagnosis_of_other_pulmonary_disease_now)
    :named REQ3_AUXILIARY8)) ;; "another active pulmonary disease"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_tuberculosis_now@@active)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "active tuberculosis"

(assert
(! (not patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now@@active)
    :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "lung cancer"

(assert
(! (not patient_has_diagnosis_of_bronchiectasis_now@@significant)
    :named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "significant bronchiectasis"

(assert
(! (not patient_has_diagnosis_of_sarcoidosis_now@@active)
    :named REQ3_COMPONENT3_OTHER_REQUIREMENTS)) ;; "sarcoidosis"

(assert
(! (not patient_has_diagnosis_of_fibrosis_of_lung_now@@active)
    :named REQ3_COMPONENT4_OTHER_REQUIREMENTS)) ;; "lung fibrosis"

(assert
(! (not patient_has_diagnosis_of_pulmonary_hypertension_now@@active)
    :named REQ3_COMPONENT5_OTHER_REQUIREMENTS)) ;; "pulmonary hypertension"

(assert
(! (not patient_has_diagnosis_of_interstitial_lung_disease_now@@active)
    :named REQ3_COMPONENT6_OTHER_REQUIREMENTS)) ;; "interstitial lung disease"

(assert
(! (not patient_has_diagnosis_of_other_pulmonary_disease_now@@active)
    :named REQ3_COMPONENT7_OTHER_REQUIREMENTS)) ;; "another active pulmonary disease"

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_undergone_lung_volume_reduction_surgery_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone lung volume reduction surgery at any time in the 12 months prior to the reference point (screening).","when_to_set_to_false":"Set to false if the patient has not undergone lung volume reduction surgery in the 12 months prior to the reference point (screening).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone lung volume reduction surgery in the 12 months prior to the reference point (screening).","meaning":"Boolean indicating whether the patient has undergone lung volume reduction surgery in the past 12 months."} ;; "lung volume reduction surgery within the twelve months prior to screening"

(declare-const patient_has_undergone_lung_volume_reduction_surgery_inthepast12months@@temporalcontext_within12months_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the 12-month lookback window for lung volume reduction surgery is anchored prior to the screening event.","when_to_set_to_false":"Set to false if the 12-month lookback window is not anchored prior to the screening event.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the 12-month window is anchored prior to screening.","meaning":"Boolean indicating whether the 12-month lookback window for lung volume reduction surgery is anchored prior to screening."} ;; "within the twelve months prior to screening"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_lung_volume_reduction_surgery_inthepast12months@@temporalcontext_within12months_prior_to_screening
     patient_has_undergone_lung_volume_reduction_surgery_inthepast12months)
:named REQ4_AUXILIARY0)) ;; "lung volume reduction surgery within the twelve months prior to screening"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_undergone_lung_volume_reduction_surgery_inthepast12months@@temporalcontext_within12months_prior_to_screening)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had lung volume reduction surgery within the twelve months prior to screening."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_immunosuppression_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of immunosuppression (immune suppression).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of immunosuppression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has immunosuppression.","meaning":"Boolean indicating whether the patient currently has immunosuppression."} ;; "immune suppression"

(declare-const patient_has_finding_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of human immunodeficiency virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient currently has human immunodeficiency virus infection."} ;; "human immunodeficiency virus infection"

(declare-const patient_has_finding_of_systemic_lupus_erythematosus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of systemic lupus erythematosus.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of systemic lupus erythematosus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has systemic lupus erythematosus.","meaning":"Boolean indicating whether the patient currently has systemic lupus erythematosus."} ;; "systemic lupus erythematosus"

(declare-const patient_has_finding_of_risk_factor_for_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any risk factor for pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have any risk factor for pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any risk factor for pneumonia.","meaning":"Boolean indicating whether the patient currently has any risk factor for pneumonia."} ;; "risk factor for pneumonia"

(declare-const patient_has_finding_of_neurological_disorder_affecting_control_of_upper_airway_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a neurological disorder affecting control of the upper airway.","when_to_set_to_false":"Set to false if the patient currently does not have a neurological disorder affecting control of the upper airway.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a neurological disorder affecting control of the upper airway.","meaning":"Boolean indicating whether the patient currently has a neurological disorder affecting control of the upper airway."} ;; "neurological disorder affecting control of the upper airway"

(declare-const patient_has_finding_of_neurological_disorder_affecting_control_of_upper_airway_now@@is_risk_factor_for_pneumonia Bool) ;; {"when_to_set_to_true":"Set to true if the patient's neurological disorder affecting control of the upper airway is a risk factor for pneumonia.","when_to_set_to_false":"Set to false if the patient's neurological disorder affecting control of the upper airway is not a risk factor for pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's neurological disorder affecting control of the upper airway is a risk factor for pneumonia.","meaning":"Boolean indicating whether the patient's neurological disorder affecting control of the upper airway is a risk factor for pneumonia."} ;; "neurological disorder affecting control of the upper airway is a risk factor for pneumonia"

(declare-const patient_has_finding_of_parkinson_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of Parkinson's disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of Parkinson's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Parkinson's disease.","meaning":"Boolean indicating whether the patient currently has Parkinson's disease."} ;; "Parkinson's disease"

(declare-const patient_has_finding_of_myasthenia_gravis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of myasthenia gravis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of myasthenia gravis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has myasthenia gravis.","meaning":"Boolean indicating whether the patient currently has myasthenia gravis."} ;; "myasthenia gravis"

(declare-const patient_is_at_potentially_high_risk_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently at potentially high risk (e.g., very low BMI, severe malnutrition, or very low FEV1).","when_to_set_to_false":"Set to false if the patient is currently not at potentially high risk.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently at potentially high risk.","meaning":"Boolean indicating whether the patient is currently at potentially high risk (e.g., very low BMI, severe malnutrition, or very low FEV1)."} ;; "potentially high risk"

(declare-const patient_has_finding_of_very_low_body_mass_index_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a very low body mass index.","when_to_set_to_false":"Set to false if the patient currently does not have a very low body mass index.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a very low body mass index.","meaning":"Boolean indicating whether the patient currently has a very low body mass index."} ;; "very low body mass index"

(declare-const patient_has_finding_of_severe_malnutrition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently is severely malnourished.","when_to_set_to_false":"Set to false if the patient currently is not severely malnourished.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently is severely malnourished.","meaning":"Boolean indicating whether the patient currently is severely malnourished."} ;; "severely malnourished"

(declare-const patient_has_finding_of_very_low_forced_expiratory_volume_in_one_second_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a very low forced expiratory volume in one second (FEV1).","when_to_set_to_false":"Set to false if the patient currently does not have a very low forced expiratory volume in one second (FEV1).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a very low forced expiratory volume in one second (FEV1).","meaning":"Boolean indicating whether the patient currently has a very low forced expiratory volume in one second (FEV1)."} ;; "very low forced expiratory volume in one second"

(declare-const body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the patient's body mass index value recorded now, in kg/m^2.","when_to_set_to_null":"Set to null if the patient's body mass index value recorded now is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's body mass index (BMI) recorded now, in kilograms per square meter (kg/m^2)."} ;; "body mass index value"

(declare-const forced_expiratory_volume_in_one_second_value_recorded_now_withunit_liters Real) ;; {"when_to_set_to_value":"Set to the patient's forced expiratory volume in one second (FEV1) value recorded now, in liters.","when_to_set_to_null":"Set to null if the patient's FEV1 value recorded now is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's forced expiratory volume in one second (FEV1) recorded now, in liters."} ;; "forced expiratory volume in one second value"

(declare-const inclusion_at_discretion_of_investigator_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inclusion is at the discretion of the investigator now.","when_to_set_to_false":"Set to false if the patient's inclusion is not at the discretion of the investigator now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's inclusion is at the discretion of the investigator now.","meaning":"Boolean indicating whether the patient's inclusion is at the discretion of the investigator at the current time."} ;; "included at the discretion of the investigator"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Non-exhaustive examples imply umbrella term: immune suppression
(assert
(! (=> (or patient_has_finding_of_human_immunodeficiency_virus_infection_now
          patient_has_finding_of_systemic_lupus_erythematosus_now)
    patient_has_finding_of_immunosuppression_now)
:named REQ5_AUXILIARY0)) ;; "immune suppression with non-exhaustive examples (human immunodeficiency virus infection, systemic lupus erythematosus)"

;; Non-exhaustive examples imply umbrella term: risk factor for pneumonia
(assert
(! (=> patient_has_finding_of_neurological_disorder_affecting_control_of_upper_airway_now@@is_risk_factor_for_pneumonia
    patient_has_finding_of_risk_factor_for_pneumonia_now)
:named REQ5_AUXILIARY1)) ;; "risk factor for pneumonia with non-exhaustive examples (neurological disorder affecting control of the upper airway...)"

;; Non-exhaustive examples imply umbrella term: neurological disorder affecting control of upper airway
(assert
(! (=> (or patient_has_finding_of_parkinson_s_disease_now
          patient_has_finding_of_myasthenia_gravis_now)
    patient_has_finding_of_neurological_disorder_affecting_control_of_upper_airway_now)
:named REQ5_AUXILIARY2)) ;; "neurological disorder affecting control of the upper airway with non-exhaustive examples (Parkinson's disease, myasthenia gravis)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_neurological_disorder_affecting_control_of_upper_airway_now@@is_risk_factor_for_pneumonia
    patient_has_finding_of_neurological_disorder_affecting_control_of_upper_airway_now)
:named REQ5_AUXILIARY3)) ;; "neurological disorder affecting control of the upper airway is a risk factor for pneumonia"

;; Non-exhaustive examples imply umbrella term: potentially high risk
(assert
(! (=> (or patient_has_finding_of_very_low_body_mass_index_now
          patient_has_finding_of_severe_malnutrition_now
          patient_has_finding_of_very_low_forced_expiratory_volume_in_one_second_now)
    patient_is_at_potentially_high_risk_now)
:named REQ5_AUXILIARY4)) ;; "potentially high risk with non-exhaustive examples (very low body mass index, is severely malnourished, or has very low forced expiratory volume in one second)"

;; Very low BMI definition (if needed for future use)
;; (assert
;; (! (=> (< body_mass_index_value_recorded_now_withunit_kg_per_m2 18.5)
;;     patient_has_finding_of_very_low_body_mass_index_now)
;; :named REQ5_AUXILIARY5)) ;; "very low body mass index (threshold not specified in requirement)"

;; Very low FEV1 definition (if needed for future use)
;; (assert
;; (! (=> (< forced_expiratory_volume_in_one_second_value_recorded_now_withunit_liters 1.0)
;;     patient_has_finding_of_very_low_forced_expiratory_volume_in_one_second_now)
;; :named REQ5_AUXILIARY6)) ;; "very low forced expiratory volume in one second (threshold not specified in requirement)"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: immune suppression
(assert
(! (not patient_has_finding_of_immunosuppression_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has immune suppression..."

;; Exclusion: risk factor for pneumonia
(assert
(! (not patient_has_finding_of_risk_factor_for_pneumonia_now)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has another risk factor for pneumonia..."

;; Exclusion: potentially high risk and not included at discretion of investigator
(assert
(! (not (and patient_is_at_potentially_high_risk_now
             (not inclusion_at_discretion_of_investigator_now)))
:named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient who is at potentially high risk ... is only included at the discretion of the investigator."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_pneumonia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had pneumonia at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had pneumonia in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had pneumonia in the past.","meaning":"Boolean indicating whether the patient has had pneumonia in the past."} ;; "pneumonia"

(declare-const patient_has_finding_of_pneumonia_inthehistory@@not_resolved_at_least_fourteen_days_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had pneumonia in the past and the pneumonia has not resolved at least fourteen days prior to screening.","when_to_set_to_false":"Set to false if the patient has had pneumonia in the past and the pneumonia has resolved at least fourteen days prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pneumonia resolved at least fourteen days prior to screening.","meaning":"Boolean indicating whether the patient's pneumonia has not resolved at least fourteen days prior to screening."} ;; "pneumonia that has not resolved at least fourteen days prior to screening"

(declare-const patient_has_finding_of_pneumonia_inthehistory@@occurred_during_run_in_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had pneumonia in the past and the pneumonia occurred during the run-in period.","when_to_set_to_false":"Set to false if the patient has had pneumonia in the past and the pneumonia did not occur during the run-in period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pneumonia occurred during the run-in period.","meaning":"Boolean indicating whether the patient's pneumonia occurred during the run-in period."} ;; "pneumonia during the run-in period"

(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an acute exacerbation of chronic obstructive airways disease in the past.","when_to_set_to_false":"Set to false if the patient has never had an acute exacerbation of chronic obstructive airways disease in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an acute exacerbation of chronic obstructive airways disease in the past.","meaning":"Boolean indicating whether the patient has had an acute exacerbation of chronic obstructive airways disease in the past."} ;; "chronic obstructive pulmonary disease exacerbation"

(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@not_resolved_at_least_fourteen_days_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a moderate COPD exacerbation in the past and it has not resolved at least fourteen days prior to screening.","when_to_set_to_false":"Set to false if the patient has had a moderate COPD exacerbation in the past and it has resolved at least fourteen days prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the moderate COPD exacerbation resolved at least fourteen days prior to screening.","meaning":"Boolean indicating whether the patient's moderate COPD exacerbation has not resolved at least fourteen days prior to screening."} ;; "moderate chronic obstructive pulmonary disease exacerbation that has not resolved at least fourteen days prior to screening"

(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@not_resolved_at_least_thirty_days_following_last_dose_of_oral_or_systemic_corticosteroid_if_applicable Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a moderate COPD exacerbation in the past and it has not resolved at least thirty days following the last dose of oral or systemic corticosteroid, if applicable.","when_to_set_to_false":"Set to false if the patient has had a moderate COPD exacerbation in the past and it has resolved at least thirty days following the last dose of oral or systemic corticosteroid, if applicable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the moderate COPD exacerbation resolved at least thirty days following the last dose of oral or systemic corticosteroid, if applicable.","meaning":"Boolean indicating whether the patient's moderate COPD exacerbation has not resolved at least thirty days following the last dose of oral or systemic corticosteroid, if applicable."} ;; "moderate chronic obstructive pulmonary disease exacerbation that has not resolved at least thirty days following the last dose of oral corticosteroid or systemic corticosteroid if applicable"

(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@occurred_during_run_in_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a moderate COPD exacerbation in the past and the exacerbation occurred during the run-in period.","when_to_set_to_false":"Set to false if the patient has had a moderate COPD exacerbation in the past and the exacerbation did not occur during the run-in period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the moderate COPD exacerbation occurred during the run-in period.","meaning":"Boolean indicating whether the patient's moderate COPD exacerbation occurred during the run-in period."} ;; "moderate chronic obstructive pulmonary disease exacerbation during the run-in period"

(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a severe acute exacerbation of chronic obstructive airways disease in the past.","when_to_set_to_false":"Set to false if the patient has not had a severe acute exacerbation of chronic obstructive airways disease in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a severe acute exacerbation of chronic obstructive airways disease in the past.","meaning":"Boolean indicating whether the patient has had a severe acute exacerbation of chronic obstructive airways disease in the past."} ;; "severe chronic obstructive pulmonary disease exacerbation"

(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@severe@@not_resolved_at_least_fourteen_days_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a severe acute exacerbation of chronic obstructive airways disease in the past and it has not resolved at least fourteen days prior to screening.","when_to_set_to_false":"Set to false if the patient has had a severe acute exacerbation of chronic obstructive airways disease in the past and it has resolved at least fourteen days prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severe acute exacerbation of chronic obstructive airways disease resolved at least fourteen days prior to screening.","meaning":"Boolean indicating whether the patient's severe acute exacerbation of chronic obstructive airways disease has not resolved at least fourteen days prior to screening."} ;; "severe chronic obstructive pulmonary disease exacerbation that has not resolved at least fourteen days prior to screening"

(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@severe@@not_resolved_at_least_thirty_days_following_last_dose_of_oral_or_systemic_corticosteroid_if_applicable Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a severe acute exacerbation of chronic obstructive airways disease in the past and it has not resolved at least thirty days following the last dose of oral or systemic corticosteroid, if applicable.","when_to_set_to_false":"Set to false if the patient has had a severe acute exacerbation of chronic obstructive airways disease in the past and it has resolved at least thirty days following the last dose of oral or systemic corticosteroid, if applicable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severe acute exacerbation of chronic obstructive airways disease resolved at least thirty days following the last dose of oral or systemic corticosteroid, if applicable.","meaning":"Boolean indicating whether the patient's severe acute exacerbation of chronic obstructive airways disease has not resolved at least thirty days following the last dose of oral or systemic corticosteroid, if applicable."} ;; "severe chronic obstructive pulmonary disease exacerbation that has not resolved at least thirty days following the last dose of oral corticosteroid or systemic corticosteroid if applicable"

(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@severe@@occurred_during_run_in_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a severe acute exacerbation of chronic obstructive airways disease in the past and the exacerbation occurred during the run-in period.","when_to_set_to_false":"Set to false if the patient has had a severe acute exacerbation of chronic obstructive airways disease in the past and the exacerbation did not occur during the run-in period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severe acute exacerbation of chronic obstructive airways disease occurred during the run-in period.","meaning":"Boolean indicating whether the patient's severe acute exacerbation of chronic obstructive airways disease occurred during the run-in period."} ;; "severe chronic obstructive pulmonary disease exacerbation during the run-in period"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_pneumonia_inthehistory@@not_resolved_at_least_fourteen_days_prior_to_screening
       patient_has_finding_of_pneumonia_inthehistory)
   :named REQ6_AUXILIARY0)) ;; "pneumonia that has not resolved at least fourteen days prior to screening"

(assert
(! (=> patient_has_finding_of_pneumonia_inthehistory@@occurred_during_run_in_period
       patient_has_finding_of_pneumonia_inthehistory)
   :named REQ6_AUXILIARY1)) ;; "pneumonia during the run-in period"

(assert
(! (=> patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@not_resolved_at_least_fourteen_days_prior_to_screening
       patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory)
   :named REQ6_AUXILIARY2)) ;; "moderate chronic obstructive pulmonary disease exacerbation that has not resolved at least fourteen days prior to screening"

(assert
(! (=> patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@not_resolved_at_least_thirty_days_following_last_dose_of_oral_or_systemic_corticosteroid_if_applicable
       patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory)
   :named REQ6_AUXILIARY3)) ;; "moderate chronic obstructive pulmonary disease exacerbation that has not resolved at least thirty days following the last dose of oral corticosteroid or systemic corticosteroid if applicable"

(assert
(! (=> patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@occurred_during_run_in_period
       patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory)
   :named REQ6_AUXILIARY4)) ;; "moderate chronic obstructive pulmonary disease exacerbation during the run-in period"

(assert
(! (=> patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@severe@@not_resolved_at_least_fourteen_days_prior_to_screening
       patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@severe)
   :named REQ6_AUXILIARY5)) ;; "severe chronic obstructive pulmonary disease exacerbation that has not resolved at least fourteen days prior to screening"

(assert
(! (=> patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@severe@@not_resolved_at_least_thirty_days_following_last_dose_of_oral_or_systemic_corticosteroid_if_applicable
       patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@severe)
   :named REQ6_AUXILIARY6)) ;; "severe chronic obstructive pulmonary disease exacerbation that has not resolved at least thirty days following the last dose of oral corticosteroid or systemic corticosteroid if applicable"

(assert
(! (=> patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@severe@@occurred_during_run_in_period
       patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@severe)
   :named REQ6_AUXILIARY7)) ;; "severe chronic obstructive pulmonary disease exacerbation during the run-in period"

;; Qualifier variables imply corresponding stem variables (severe is a qualifier of moderate COPD exacerbation)
(assert
(! (=> patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@severe
       patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory)
   :named REQ6_AUXILIARY8)) ;; "severe chronic obstructive pulmonary disease exacerbation is a type of COPD exacerbation"

;; ===================== Constraint Assertions (REQ 6) =====================
;; 1. Pneumonia not resolved at least fourteen days prior to screening
(assert
(! (not patient_has_finding_of_pneumonia_inthehistory@@not_resolved_at_least_fourteen_days_prior_to_screening)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pneumonia that has not resolved at least fourteen days prior to screening."

;; 2. Moderate COPD exacerbation not resolved at least fourteen days prior to screening AND at least thirty days following last dose of corticosteroid
(assert
(! (not (and patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@not_resolved_at_least_fourteen_days_prior_to_screening
             patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@not_resolved_at_least_thirty_days_following_last_dose_of_oral_or_systemic_corticosteroid_if_applicable))
   :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has moderate chronic obstructive pulmonary disease exacerbation that has not resolved at least fourteen days prior to screening and at least thirty days following the last dose of oral corticosteroid or systemic corticosteroid if applicable."

;; 3. Severe COPD exacerbation not resolved at least fourteen days prior to screening AND at least thirty days following last dose of corticosteroid
(assert
(! (not (and patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@severe@@not_resolved_at_least_fourteen_days_prior_to_screening
             patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@severe@@not_resolved_at_least_thirty_days_following_last_dose_of_oral_or_systemic_corticosteroid_if_applicable))
   :named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe chronic obstructive pulmonary disease exacerbation that has not resolved at least fourteen days prior to screening and at least thirty days following the last dose of oral corticosteroid or systemic corticosteroid if applicable."

;; 4. Pneumonia during the run-in period
(assert
(! (not patient_has_finding_of_pneumonia_inthehistory@@occurred_during_run_in_period)
   :named REQ6_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient experiences pneumonia during the run-in period."

;; 5. Moderate COPD exacerbation during the run-in period
(assert
(! (not patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@occurred_during_run_in_period)
   :named REQ6_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient experiences moderate chronic obstructive pulmonary disease exacerbation during the run-in period."

;; 6. Severe COPD exacerbation during the run-in period
(assert
(! (not patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@severe@@occurred_during_run_in_period)
   :named REQ6_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient experiences severe chronic obstructive pulmonary disease exacerbation during the run-in period."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_respiratory_tract_infection_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a respiratory tract infection in their history, regardless of current status.","when_to_set_to_false":"Set to false if the patient has never had a respiratory tract infection in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a respiratory tract infection in their history.","meaning":"Boolean indicating whether the patient has ever had a respiratory tract infection in their history."} ;; "respiratory tract infection"

(declare-const patient_has_finding_of_respiratory_tract_infection_inthehistory@@not_resolved_at_least_seven_days_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a respiratory tract infection in their history and that infection has not resolved at least seven days prior to screening.","when_to_set_to_false":"Set to false if the patient has had a respiratory tract infection in their history and that infection has resolved at least seven days prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection resolved at least seven days prior to screening.","meaning":"Boolean indicating whether the patient's respiratory tract infection has not resolved at least seven days prior to screening."} ;; "respiratory tract infection that has not resolved at least seven days prior to screening"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_respiratory_tract_infection_inthehistory@@not_resolved_at_least_seven_days_prior_to_screening
      patient_has_finding_of_respiratory_tract_infection_inthehistory)
:named REQ7_AUXILIARY0)) ;; "respiratory tract infection that has not resolved at least seven days prior to screening"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_respiratory_tract_infection_inthehistory@@not_resolved_at_least_seven_days_prior_to_screening)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has another respiratory tract infection that has not resolved at least seven days prior to screening."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of pneumonia.","meaning":"Boolean indicating whether the patient currently has a finding of pneumonia."} ;; "the patient's chest x-ray (posteroanterior and lateral) reveals evidence of pneumonia"

(declare-const patient_has_finding_of_clinically_significant_abnormality_on_plain_chest_x_ray_now_not_believed_due_to_chronic_obstructive_pulmonary_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinically significant abnormality on plain chest x-ray (posteroanterior and lateral) that is not believed to be due to the presence of chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have a clinically significant abnormality on plain chest x-ray (posteroanterior and lateral) that is not believed to be due to the presence of chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinically significant abnormality on plain chest x-ray (posteroanterior and lateral) that is not believed to be due to the presence of chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has a clinically significant abnormality on plain chest x-ray (posteroanterior and lateral) that is not believed to be due to the presence of chronic obstructive pulmonary disease."} ;; "the patient's chest x-ray (posteroanterior and lateral) reveals a clinically significant abnormality not believed to be due to the presence of chronic obstructive pulmonary disease"

(declare-const patient_has_finding_of_condition_that_hinders_detection_of_infiltrate_on_plain_chest_x_ray_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has another condition that would hinder the ability to detect an infiltrate on plain chest x-ray (posteroanterior and lateral).","when_to_set_to_false":"Set to false if the patient currently does not have another condition that would hinder the ability to detect an infiltrate on plain chest x-ray (posteroanterior and lateral).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has another condition that would hinder the ability to detect an infiltrate on plain chest x-ray (posteroanterior and lateral).","meaning":"Boolean indicating whether the patient currently has another condition that would hinder the ability to detect an infiltrate on plain chest x-ray (posteroanterior and lateral)."} ;; "the patient's chest x-ray (posteroanterior and lateral) reveals another condition that would hinder the ability to detect an infiltrate on chest x-ray"

(declare-const patient_has_finding_of_significant_cardiomegaly_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of significant cardiomegaly.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of significant cardiomegaly.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of significant cardiomegaly.","meaning":"Boolean indicating whether the patient currently has a finding of significant cardiomegaly."} ;; "significant cardiomegaly"

(declare-const patient_has_finding_of_pleural_effusion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of pleural effusion.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of pleural effusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of pleural effusion.","meaning":"Boolean indicating whether the patient currently has a finding of pleural effusion."} ;; "pleural effusion"

(declare-const patient_has_finding_of_pleural_scarring_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of pleural scarring.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of pleural scarring.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of pleural scarring.","meaning":"Boolean indicating whether the patient currently has a finding of pleural scarring."} ;; "pleural scarring"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Non-exhaustive examples imply umbrella term for "condition that would hinder the ability to detect an infiltrate on chest x-ray"
(assert
(! (=> (or patient_has_finding_of_significant_cardiomegaly_now
           patient_has_finding_of_pleural_effusion_now
           patient_has_finding_of_pleural_scarring_now)
        patient_has_finding_of_condition_that_hinders_detection_of_infiltrate_on_plain_chest_x_ray_now)
   :named REQ8_AUXILIARY0)) ;; "with non-exhaustive examples (significant cardiomegaly, pleural effusion, pleural scarring)"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_pneumonia_now)
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient's chest x-ray (posteroanterior and lateral) reveals evidence of pneumonia"

(assert
(! (not patient_has_finding_of_clinically_significant_abnormality_on_plain_chest_x_ray_now_not_believed_due_to_chronic_obstructive_pulmonary_disease)
   :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient's chest x-ray (posteroanterior and lateral) reveals a clinically significant abnormality not believed to be due to the presence of chronic obstructive pulmonary disease"

(assert
(! (not patient_has_finding_of_condition_that_hinders_detection_of_infiltrate_on_plain_chest_x_ray_now)
   :named REQ8_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient's chest x-ray (posteroanterior and lateral) reveals another condition that would hinder the ability to detect an infiltrate on chest x-ray with non-exhaustive examples (significant cardiomegaly, pleural effusion, pleural scarring)"

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_cardiovascular_system_alteration_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a cardiovascular system abnormality, either currently or in the past.","when_to_set_to_false":"Set to false if the patient has never had a cardiovascular system abnormality, neither currently nor in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a cardiovascular system abnormality.","meaning":"Boolean indicating whether the patient has ever had a cardiovascular system abnormality (at any time in their history or currently)."} ;; "cardiovascular abnormality"

(declare-const patient_has_finding_of_cardiovascular_system_alteration_inthehistory@@clinically_significant_and_uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the cardiovascular system abnormality is both clinically significant and uncontrolled.","when_to_set_to_false":"Set to false if the cardiovascular system abnormality is not both clinically significant and uncontrolled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cardiovascular system abnormality is both clinically significant and uncontrolled.","meaning":"Boolean indicating that the cardiovascular system abnormality is both clinically significant and uncontrolled."} ;; "clinically significant cardiovascular abnormality that is uncontrolled"

(declare-const patient_has_finding_of_neurological_abnormality_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a neurological abnormality, either currently or in the past.","when_to_set_to_false":"Set to false if the patient has never had a neurological abnormality, neither currently nor in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a neurological abnormality.","meaning":"Boolean indicating whether the patient has ever had a neurological abnormality (at any time in their history or currently)."} ;; "neurological abnormality"

(declare-const patient_has_finding_of_neurological_abnormality_inthehistory@@clinically_significant_and_uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the neurological abnormality is both clinically significant and uncontrolled.","when_to_set_to_false":"Set to false if the neurological abnormality is not both clinically significant and uncontrolled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the neurological abnormality is both clinically significant and uncontrolled.","meaning":"Boolean indicating that the neurological abnormality is both clinically significant and uncontrolled."} ;; "clinically significant neurological abnormality that is uncontrolled"

(declare-const patient_has_finding_of_psychiatric_abnormality_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a psychiatric abnormality, either currently or in the past.","when_to_set_to_false":"Set to false if the patient has never had a psychiatric abnormality, neither currently nor in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a psychiatric abnormality.","meaning":"Boolean indicating whether the patient has ever had a psychiatric abnormality (at any time in their history or currently)."} ;; "psychiatric abnormality"

(declare-const patient_has_finding_of_psychiatric_abnormality_inthehistory@@clinically_significant_and_uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the psychiatric abnormality is both clinically significant and uncontrolled.","when_to_set_to_false":"Set to false if the psychiatric abnormality is not both clinically significant and uncontrolled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the psychiatric abnormality is both clinically significant and uncontrolled.","meaning":"Boolean indicating that the psychiatric abnormality is both clinically significant and uncontrolled."} ;; "clinically significant psychiatric abnormality that is uncontrolled"

(declare-const patient_has_finding_of_renal_alteration_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a renal abnormality, either currently or in the past.","when_to_set_to_false":"Set to false if the patient has never had a renal abnormality, neither currently nor in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a renal abnormality.","meaning":"Boolean indicating whether the patient has ever had a renal abnormality (at any time in their history or currently)."} ;; "renal abnormality"

(declare-const patient_has_finding_of_renal_alteration_inthehistory@@clinically_significant_and_uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the renal abnormality is both clinically significant and uncontrolled.","when_to_set_to_false":"Set to false if the renal abnormality is not both clinically significant and uncontrolled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the renal abnormality is both clinically significant and uncontrolled.","meaning":"Boolean indicating that the renal abnormality is both clinically significant and uncontrolled."} ;; "clinically significant renal abnormality that is uncontrolled"

(declare-const patient_has_finding_of_hepatic_abnormality_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a hepatic abnormality, either currently or in the past.","when_to_set_to_false":"Set to false if the patient has never had a hepatic abnormality, neither currently nor in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a hepatic abnormality.","meaning":"Boolean indicating whether the patient has ever had a hepatic abnormality (at any time in their history or currently)."} ;; "hepatic abnormality"

(declare-const patient_has_finding_of_hepatic_abnormality_inthehistory@@clinically_significant_and_uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the hepatic abnormality is both clinically significant and uncontrolled.","when_to_set_to_false":"Set to false if the hepatic abnormality is not both clinically significant and uncontrolled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hepatic abnormality is both clinically significant and uncontrolled.","meaning":"Boolean indicating that the hepatic abnormality is both clinically significant and uncontrolled."} ;; "clinically significant hepatic abnormality that is uncontrolled"

(declare-const patient_has_finding_of_immunological_abnormality_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an immunological abnormality, either currently or in the past.","when_to_set_to_false":"Set to false if the patient has never had an immunological abnormality, neither currently nor in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an immunological abnormality.","meaning":"Boolean indicating whether the patient has ever had an immunological abnormality (at any time in their history or currently)."} ;; "immunological abnormality"

(declare-const patient_has_finding_of_immunological_abnormality_inthehistory@@clinically_significant_and_uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the immunological abnormality is both clinically significant and uncontrolled.","when_to_set_to_false":"Set to false if the immunological abnormality is not both clinically significant and uncontrolled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the immunological abnormality is both clinically significant and uncontrolled.","meaning":"Boolean indicating that the immunological abnormality is both clinically significant and uncontrolled."} ;; "clinically significant immunological abnormality that is uncontrolled"

(declare-const patient_has_finding_of_gastrointestinal_abnormality_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a gastrointestinal abnormality, either currently or in the past.","when_to_set_to_false":"Set to false if the patient has never had a gastrointestinal abnormality, neither currently nor in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a gastrointestinal abnormality.","meaning":"Boolean indicating whether the patient has ever had a gastrointestinal abnormality (at any time in their history or currently)."} ;; "gastrointestinal abnormality"

(declare-const patient_has_finding_of_gastrointestinal_abnormality_inthehistory@@clinically_significant_and_uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the gastrointestinal abnormality is both clinically significant and uncontrolled.","when_to_set_to_false":"Set to false if the gastrointestinal abnormality is not both clinically significant and uncontrolled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the gastrointestinal abnormality is both clinically significant and uncontrolled.","meaning":"Boolean indicating that the gastrointestinal abnormality is both clinically significant and uncontrolled."} ;; "clinically significant gastrointestinal abnormality that is uncontrolled"

(declare-const patient_has_finding_of_urogenital_abnormality_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a urogenital abnormality, either currently or in the past.","when_to_set_to_false":"Set to false if the patient has never had a urogenital abnormality, neither currently nor in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a urogenital abnormality.","meaning":"Boolean indicating whether the patient has ever had a urogenital abnormality (at any time in their history or currently)."} ;; "urogenital abnormality"

(declare-const patient_has_finding_of_urogenital_abnormality_inthehistory@@clinically_significant_and_uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the urogenital abnormality is both clinically significant and uncontrolled.","when_to_set_to_false":"Set to false if the urogenital abnormality is not both clinically significant and uncontrolled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the urogenital abnormality is both clinically significant and uncontrolled.","meaning":"Boolean indicating that the urogenital abnormality is both clinically significant and uncontrolled."} ;; "clinically significant urogenital abnormality that is uncontrolled"

(declare-const patient_has_finding_of_nervous_system_abnormality_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a nervous system abnormality, either currently or in the past.","when_to_set_to_false":"Set to false if the patient has never had a nervous system abnormality, neither currently nor in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a nervous system abnormality.","meaning":"Boolean indicating whether the patient has ever had a nervous system abnormality (at any time in their history or currently)."} ;; "nervous system abnormality"

(declare-const patient_has_finding_of_nervous_system_abnormality_inthehistory@@clinically_significant_and_uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the nervous system abnormality is both clinically significant and uncontrolled.","when_to_set_to_false":"Set to false if the nervous system abnormality is not both clinically significant and uncontrolled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the nervous system abnormality is both clinically significant and uncontrolled.","meaning":"Boolean indicating that the nervous system abnormality is both clinically significant and uncontrolled."} ;; "clinically significant nervous system abnormality that is uncontrolled"

(declare-const patient_has_finding_of_musculoskeletal_abnormality_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a musculoskeletal abnormality, either currently or in the past.","when_to_set_to_false":"Set to false if the patient has never had a musculoskeletal abnormality, neither currently nor in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a musculoskeletal abnormality.","meaning":"Boolean indicating whether the patient has ever had a musculoskeletal abnormality (at any time in their history or currently)."} ;; "musculoskeletal abnormality"

(declare-const patient_has_finding_of_musculoskeletal_abnormality_inthehistory@@clinically_significant_and_uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the musculoskeletal abnormality is both clinically significant and uncontrolled.","when_to_set_to_false":"Set to false if the musculoskeletal abnormality is not both clinically significant and uncontrolled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the musculoskeletal abnormality is both clinically significant and uncontrolled.","meaning":"Boolean indicating that the musculoskeletal abnormality is both clinically significant and uncontrolled."} ;; "clinically significant musculoskeletal abnormality that is uncontrolled"

(declare-const patient_has_finding_of_skin_abnormality_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a skin abnormality, either currently or in the past.","when_to_set_to_false":"Set to false if the patient has never had a skin abnormality, neither currently nor in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a skin abnormality.","meaning":"Boolean indicating whether the patient has ever had a skin abnormality (at any time in their history or currently)."} ;; "skin abnormality"

(declare-const patient_has_finding_of_skin_abnormality_inthehistory@@clinically_significant_and_uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the skin abnormality is both clinically significant and uncontrolled.","when_to_set_to_false":"Set to false if the skin abnormality is not both clinically significant and uncontrolled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the skin abnormality is both clinically significant and uncontrolled.","meaning":"Boolean indicating that the skin abnormality is both clinically significant and uncontrolled."} ;; "clinically significant skin abnormality that is uncontrolled"

(declare-const patient_has_finding_of_sensory_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a sensory disorder, either currently or in the past.","when_to_set_to_false":"Set to false if the patient has never had a sensory disorder, neither currently nor in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a sensory disorder.","meaning":"Boolean indicating whether the patient has ever had a sensory disorder (at any time in their history or currently)."} ;; "sensory abnormality"

(declare-const patient_has_finding_of_sensory_disorder_inthehistory@@clinically_significant_and_uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the sensory disorder is both clinically significant and uncontrolled.","when_to_set_to_false":"Set to false if the sensory disorder is not both clinically significant and uncontrolled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the sensory disorder is both clinically significant and uncontrolled.","meaning":"Boolean indicating that the sensory disorder is both clinically significant and uncontrolled."} ;; "clinically significant sensory abnormality that is uncontrolled"

(declare-const patient_has_finding_of_disorder_of_endocrine_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a disorder of the endocrine system, either currently or in the past.","when_to_set_to_false":"Set to false if the patient has never had a disorder of the endocrine system, neither currently nor in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a disorder of the endocrine system.","meaning":"Boolean indicating whether the patient has ever had a disorder of the endocrine system (at any time in their history or currently)."} ;; "endocrine abnormality"

(declare-const patient_has_finding_of_disorder_of_endocrine_system_inthehistory@@clinically_significant_and_uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the disorder of the endocrine system is both clinically significant and uncontrolled.","when_to_set_to_false":"Set to false if the disorder of the endocrine system is not both clinically significant and uncontrolled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder of the endocrine system is both clinically significant and uncontrolled.","meaning":"Boolean indicating that the disorder of the endocrine system is both clinically significant and uncontrolled."} ;; "clinically significant endocrine abnormality that is uncontrolled"

(declare-const patient_has_finding_of_uncontrolled_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has uncontrolled diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have uncontrolled diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has uncontrolled diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has uncontrolled diabetes mellitus."} ;; "uncontrolled diabetes mellitus"

(declare-const patient_has_finding_of_uncontrolled_thyroid_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has uncontrolled thyroid disease.","when_to_set_to_false":"Set to false if the patient currently does not have uncontrolled thyroid disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has uncontrolled thyroid disease.","meaning":"Boolean indicating whether the patient currently has uncontrolled thyroid disease."} ;; "uncontrolled thyroid disease"

(declare-const patient_has_finding_of_hematological_abnormality_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a hematological abnormality, either currently or in the past.","when_to_set_to_false":"Set to false if the patient has never had a hematological abnormality, neither currently nor in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a hematological abnormality.","meaning":"Boolean indicating whether the patient has ever had a hematological abnormality (at any time in their history or currently)."} ;; "hematological abnormality"

(declare-const patient_has_finding_of_hematological_abnormality_inthehistory@@clinically_significant_and_uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the hematological abnormality is both clinically significant and uncontrolled.","when_to_set_to_false":"Set to false if the hematological abnormality is not both clinically significant and uncontrolled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hematological abnormality is both clinically significant and uncontrolled.","meaning":"Boolean indicating that the hematological abnormality is both clinically significant and uncontrolled."} ;; "clinically significant hematological abnormality that is uncontrolled"

(declare-const patient_has_any_disease_that_investigator_judges_would_put_safety_at_risk_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease that, in the opinion of the investigator, would put the safety of the patient at risk through participation.","when_to_set_to_false":"Set to false if the patient currently does not have any disease that, in the opinion of the investigator, would put the safety of the patient at risk through participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease that, in the opinion of the investigator, would put the safety of the patient at risk through participation.","meaning":"Boolean indicating whether the patient currently has any disease that, in the opinion of the investigator, would put the safety of the patient at risk through participation."} ;; "any disease that, in the opinion of the investigator, would put the safety of the patient at risk through participation"

(declare-const patient_has_any_disease_that_investigator_judges_would_affect_efficacy_or_safety_analysis_if_exacerbated_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease that, in the opinion of the investigator, would affect the efficacy analysis or safety analysis if the disease or condition exacerbated during the study.","when_to_set_to_false":"Set to false if the patient currently does not have any disease that, in the opinion of the investigator, would affect the efficacy analysis or safety analysis if the disease or condition exacerbated during the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease that, in the opinion of the investigator, would affect the efficacy analysis or safety analysis if the disease or condition exacerbated during the study.","meaning":"Boolean indicating whether the patient currently has any disease that, in the opinion of the investigator, would affect the efficacy analysis or safety analysis if the disease or condition exacerbated during the study."} ;; "any disease that, in the opinion of the investigator, would affect the efficacy analysis or safety analysis if the disease or condition exacerbated during the study"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Non-exhaustive examples imply umbrella term for endocrine abnormality
(assert
(! (=> (or patient_has_finding_of_uncontrolled_diabetes_mellitus_now
          patient_has_finding_of_uncontrolled_thyroid_disease_now)
     patient_has_finding_of_disorder_of_endocrine_system_inthehistory@@clinically_significant_and_uncontrolled)
:named REQ9_AUXILIARY0)) ;; "with non-exhaustive examples (uncontrolled diabetes mellitus, uncontrolled thyroid disease)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_cardiovascular_system_alteration_inthehistory@@clinically_significant_and_uncontrolled
       patient_has_finding_of_cardiovascular_system_alteration_inthehistory)
:named REQ9_AUXILIARY1)) ;; "clinically significant cardiovascular abnormality that is uncontrolled"

(assert
(! (=> patient_has_finding_of_neurological_abnormality_inthehistory@@clinically_significant_and_uncontrolled
       patient_has_finding_of_neurological_abnormality_inthehistory)
:named REQ9_AUXILIARY2)) ;; "clinically significant neurological abnormality that is uncontrolled"

(assert
(! (=> patient_has_finding_of_psychiatric_abnormality_inthehistory@@clinically_significant_and_uncontrolled
       patient_has_finding_of_psychiatric_abnormality_inthehistory)
:named REQ9_AUXILIARY3)) ;; "clinically significant psychiatric abnormality that is uncontrolled"

(assert
(! (=> patient_has_finding_of_renal_alteration_inthehistory@@clinically_significant_and_uncontrolled
       patient_has_finding_of_renal_alteration_inthehistory)
:named REQ9_AUXILIARY4)) ;; "clinically significant renal abnormality that is uncontrolled"

(assert
(! (=> patient_has_finding_of_hepatic_abnormality_inthehistory@@clinically_significant_and_uncontrolled
       patient_has_finding_of_hepatic_abnormality_inthehistory)
:named REQ9_AUXILIARY5)) ;; "clinically significant hepatic abnormality that is uncontrolled"

(assert
(! (=> patient_has_finding_of_immunological_abnormality_inthehistory@@clinically_significant_and_uncontrolled
       patient_has_finding_of_immunological_abnormality_inthehistory)
:named REQ9_AUXILIARY6)) ;; "clinically significant immunological abnormality that is uncontrolled"

(assert
(! (=> patient_has_finding_of_gastrointestinal_abnormality_inthehistory@@clinically_significant_and_uncontrolled
       patient_has_finding_of_gastrointestinal_abnormality_inthehistory)
:named REQ9_AUXILIARY7)) ;; "clinically significant gastrointestinal abnormality that is uncontrolled"

(assert
(! (=> patient_has_finding_of_urogenital_abnormality_inthehistory@@clinically_significant_and_uncontrolled
       patient_has_finding_of_urogenital_abnormality_inthehistory)
:named REQ9_AUXILIARY8)) ;; "clinically significant urogenital abnormality that is uncontrolled"

(assert
(! (=> patient_has_finding_of_nervous_system_abnormality_inthehistory@@clinically_significant_and_uncontrolled
       patient_has_finding_of_nervous_system_abnormality_inthehistory)
:named REQ9_AUXILIARY9)) ;; "clinically significant nervous system abnormality that is uncontrolled"

(assert
(! (=> patient_has_finding_of_musculoskeletal_abnormality_inthehistory@@clinically_significant_and_uncontrolled
       patient_has_finding_of_musculoskeletal_abnormality_inthehistory)
:named REQ9_AUXILIARY10)) ;; "clinically significant musculoskeletal abnormality that is uncontrolled"

(assert
(! (=> patient_has_finding_of_skin_abnormality_inthehistory@@clinically_significant_and_uncontrolled
       patient_has_finding_of_skin_abnormality_inthehistory)
:named REQ9_AUXILIARY11)) ;; "clinically significant skin abnormality that is uncontrolled"

(assert
(! (=> patient_has_finding_of_sensory_disorder_inthehistory@@clinically_significant_and_uncontrolled
       patient_has_finding_of_sensory_disorder_inthehistory)
:named REQ9_AUXILIARY12)) ;; "clinically significant sensory abnormality that is uncontrolled"

(assert
(! (=> patient_has_finding_of_disorder_of_endocrine_system_inthehistory@@clinically_significant_and_uncontrolled
       patient_has_finding_of_disorder_of_endocrine_system_inthehistory)
:named REQ9_AUXILIARY13)) ;; "clinically significant endocrine abnormality that is uncontrolled"

(assert
(! (=> patient_has_finding_of_hematological_abnormality_inthehistory@@clinically_significant_and_uncontrolled
       patient_has_finding_of_hematological_abnormality_inthehistory)
:named REQ9_AUXILIARY14)) ;; "clinically significant hematological abnormality that is uncontrolled"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_cardiovascular_system_alteration_inthehistory@@clinically_significant_and_uncontrolled)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has historical or current evidence of a clinically significant cardiovascular abnormality that is uncontrolled."

(assert
(! (not patient_has_finding_of_neurological_abnormality_inthehistory@@clinically_significant_and_uncontrolled)
:named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has historical or current evidence of a clinically significant neurological abnormality that is uncontrolled."

(assert
(! (not patient_has_finding_of_psychiatric_abnormality_inthehistory@@clinically_significant_and_uncontrolled)
:named REQ9_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has historical or current evidence of a clinically significant psychiatric abnormality that is uncontrolled."

(assert
(! (not patient_has_finding_of_renal_alteration_inthehistory@@clinically_significant_and_uncontrolled)
:named REQ9_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has historical or current evidence of a clinically significant renal abnormality that is uncontrolled."

(assert
(! (not patient_has_finding_of_hepatic_abnormality_inthehistory@@clinically_significant_and_uncontrolled)
:named REQ9_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has historical or current evidence of a clinically significant hepatic abnormality that is uncontrolled."

(assert
(! (not patient_has_finding_of_immunological_abnormality_inthehistory@@clinically_significant_and_uncontrolled)
:named REQ9_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has historical or current evidence of a clinically significant immunological abnormality that is uncontrolled."

(assert
(! (not patient_has_finding_of_gastrointestinal_abnormality_inthehistory@@clinically_significant_and_uncontrolled)
:named REQ9_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has historical or current evidence of a clinically significant gastrointestinal abnormality that is uncontrolled."

(assert
(! (not patient_has_finding_of_urogenital_abnormality_inthehistory@@clinically_significant_and_uncontrolled)
:named REQ9_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has historical or current evidence of a clinically significant urogenital abnormality that is uncontrolled."

(assert
(! (not patient_has_finding_of_nervous_system_abnormality_inthehistory@@clinically_significant_and_uncontrolled)
:named REQ9_COMPONENT8_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has historical or current evidence of a clinically significant nervous system abnormality that is uncontrolled."

(assert
(! (not patient_has_finding_of_musculoskeletal_abnormality_inthehistory@@clinically_significant_and_uncontrolled)
:named REQ9_COMPONENT9_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has historical or current evidence of a clinically significant musculoskeletal abnormality that is uncontrolled."

(assert
(! (not patient_has_finding_of_skin_abnormality_inthehistory@@clinically_significant_and_uncontrolled)
:named REQ9_COMPONENT10_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has historical or current evidence of a clinically significant skin abnormality that is uncontrolled."

(assert
(! (not patient_has_finding_of_sensory_disorder_inthehistory@@clinically_significant_and_uncontrolled)
:named REQ9_COMPONENT11_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has historical or current evidence of a clinically significant sensory abnormality that is uncontrolled."

(assert
(! (not patient_has_finding_of_disorder_of_endocrine_system_inthehistory@@clinically_significant_and_uncontrolled)
:named REQ9_COMPONENT12_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has historical or current evidence of a clinically significant endocrine abnormality that is uncontrolled with non-exhaustive examples (uncontrolled diabetes mellitus, uncontrolled thyroid disease)."

(assert
(! (not patient_has_finding_of_hematological_abnormality_inthehistory@@clinically_significant_and_uncontrolled)
:named REQ9_COMPONENT13_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has historical or current evidence of a clinically significant hematological abnormality that is uncontrolled."

(assert
(! (not patient_has_any_disease_that_investigator_judges_would_put_safety_at_risk_now)
:named REQ9_COMPONENT14_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any disease that, in the opinion of the investigator, would put the safety of the patient at risk through participation."

(assert
(! (not patient_has_any_disease_that_investigator_judges_would_affect_efficacy_or_safety_analysis_if_exacerbated_now)
:named REQ9_COMPONENT15_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any disease that, in the opinion of the investigator, would affect the efficacy analysis or safety analysis if the disease or condition exacerbated during the study."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_unstable_liver_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has unstable liver disease, as defined by the presence of any of the following: ascites, hepatic encephalopathy, coagulopathy, hypoalbuminemia, esophageal varices, gastric varices, persistent jaundice, cirrhosis, or known biliary abnormality (excluding Gilbert's syndrome or asymptomatic gallstones).","when_to_set_to_false":"Set to false if the patient currently does not have unstable liver disease as defined above.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has unstable liver disease as defined above.","meaning":"Boolean indicating whether the patient currently has unstable liver disease as defined by the specified criteria."} ;; "The patient is excluded if the patient has unstable liver disease as defined by the presence of (ascites OR hepatic encephalopathy OR coagulopathy OR hypoalbuminemia OR esophageal varices OR gastric varices OR persistent jaundice OR cirrhosis OR known biliary abnormality (with the exception of Gilbert's syndrome OR asymptomatic gallstones))."

(declare-const patient_has_finding_of_ascites_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ascites.","when_to_set_to_false":"Set to false if the patient currently does not have ascites.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ascites.","meaning":"Boolean indicating whether the patient currently has ascites."} ;; "ascites"

(declare-const patient_has_finding_of_hepatic_encephalopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatic encephalopathy.","when_to_set_to_false":"Set to false if the patient currently does not have hepatic encephalopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatic encephalopathy.","meaning":"Boolean indicating whether the patient currently has hepatic encephalopathy."} ;; "hepatic encephalopathy"

(declare-const patient_has_finding_of_coagulopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has coagulopathy.","when_to_set_to_false":"Set to false if the patient currently does not have coagulopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has coagulopathy.","meaning":"Boolean indicating whether the patient currently has coagulopathy."} ;; "coagulopathy"

(declare-const patient_has_finding_of_hypoalbuminemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypoalbuminemia.","when_to_set_to_false":"Set to false if the patient currently does not have hypoalbuminemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypoalbuminemia.","meaning":"Boolean indicating whether the patient currently has hypoalbuminemia."} ;; "hypoalbuminemia"

(declare-const patient_has_finding_of_esophageal_varices_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has esophageal varices.","when_to_set_to_false":"Set to false if the patient currently does not have esophageal varices.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has esophageal varices.","meaning":"Boolean indicating whether the patient currently has esophageal varices."} ;; "esophageal varices"

(declare-const patient_has_finding_of_gastric_varices_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has gastric varices.","when_to_set_to_false":"Set to false if the patient currently does not have gastric varices.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has gastric varices.","meaning":"Boolean indicating whether the patient currently has gastric varices."} ;; "gastric varices"

(declare-const patient_has_finding_of_persistent_jaundice_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has persistent jaundice.","when_to_set_to_false":"Set to false if the patient currently does not have persistent jaundice.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has persistent jaundice.","meaning":"Boolean indicating whether the patient currently has persistent jaundice."} ;; "persistent jaundice"

(declare-const patient_has_finding_of_cirrhosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cirrhosis.","when_to_set_to_false":"Set to false if the patient currently does not have cirrhosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cirrhosis.","meaning":"Boolean indicating whether the patient currently has cirrhosis."} ;; "cirrhosis"

(declare-const patient_has_finding_of_known_biliary_abnormality_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known biliary abnormality.","when_to_set_to_false":"Set to false if the patient currently does not have a known biliary abnormality.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known biliary abnormality.","meaning":"Boolean indicating whether the patient currently has a known biliary abnormality."} ;; "known biliary abnormality"

(declare-const patient_has_finding_of_gilberts_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has Gilbert's syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have Gilbert's syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Gilbert's syndrome.","meaning":"Boolean indicating whether the patient currently has Gilbert's syndrome."} ;; "Gilbert's syndrome"

(declare-const patient_has_finding_of_asymptomatic_gallstones_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has asymptomatic gallstones.","when_to_set_to_false":"Set to false if the patient currently does not have asymptomatic gallstones.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has asymptomatic gallstones.","meaning":"Boolean indicating whether the patient currently has asymptomatic gallstones."} ;; "asymptomatic gallstones"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Definition: unstable liver disease is present if any of the listed findings are present, except that known biliary abnormality only counts if it is NOT Gilbert's syndrome or asymptomatic gallstones.
(assert
(! (= patient_has_finding_of_unstable_liver_disease_now
(or patient_has_finding_of_ascites_now
    patient_has_finding_of_hepatic_encephalopathy_now
    patient_has_finding_of_coagulopathy_now
    patient_has_finding_of_hypoalbuminemia_now
    patient_has_finding_of_esophageal_varices_now
    patient_has_finding_of_gastric_varices_now
    patient_has_finding_of_persistent_jaundice_now
    patient_has_finding_of_cirrhosis_now
    (and patient_has_finding_of_known_biliary_abnormality_now
         (not (or patient_has_finding_of_gilberts_syndrome_now
                  patient_has_finding_of_asymptomatic_gallstones_now)))))
:named REQ10_AUXILIARY0)) ;; "unstable liver disease as defined by the presence of (ascites OR hepatic encephalopathy OR coagulopathy OR hypoalbuminemia OR esophageal varices OR gastric varices OR persistent jaundice OR cirrhosis OR known biliary abnormality (with the exception of Gilbert's syndrome OR asymptomatic gallstones))."

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_unstable_liver_disease_now)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has unstable liver disease as defined by the presence of (ascites OR hepatic encephalopathy OR coagulopathy OR hypoalbuminemia OR esophageal varices OR gastric varices OR persistent jaundice OR cirrhosis OR known biliary abnormality (with the exception of Gilbert's syndrome OR asymptomatic gallstones))."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_myocardial_infarction_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a myocardial infarction at any time within the past 6 months prior to screening.","when_to_set_to_false":"Set to false if the patient has not had a myocardial infarction within the past 6 months prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a myocardial infarction within the past 6 months prior to screening.","meaning":"Boolean indicating whether the patient has had a myocardial infarction within the past 6 months."} ;; "myocardial infarction within the last 6 months"

(declare-const patient_has_finding_of_angina_pectoris_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had unstable angina at any time within the past 6 months prior to screening.","when_to_set_to_false":"Set to false if the patient has not had unstable angina within the past 6 months prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had unstable angina within the past 6 months prior to screening.","meaning":"Boolean indicating whether the patient has had unstable angina within the past 6 months."} ;; "unstable angina within the last 6 months"

(declare-const patient_has_finding_of_angina_pectoris_inthepast6months@@unstable Bool) ;; {"when_to_set_to_true":"Set to true if the angina pectoris event within the past 6 months was unstable.","when_to_set_to_false":"Set to false if the angina pectoris event within the past 6 months was not unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the angina pectoris event within the past 6 months was unstable.","meaning":"Boolean indicating whether the angina pectoris within the past 6 months was unstable."} ;; "unstable angina within the last 6 months"

(declare-const patient_has_finding_of_cardiac_arrhythmia_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had cardiac arrhythmia at any time within the past 3 months prior to screening.","when_to_set_to_false":"Set to false if the patient has not had cardiac arrhythmia within the past 3 months prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had cardiac arrhythmia within the past 3 months prior to screening.","meaning":"Boolean indicating whether the patient has had cardiac arrhythmia within the past 3 months."} ;; "cardiac arrhythmia within the last 3 months"

(declare-const patient_has_finding_of_cardiac_arrhythmia_inthepast3months@@unstable Bool) ;; {"when_to_set_to_true":"Set to true if the cardiac arrhythmia event within the past 3 months was unstable.","when_to_set_to_false":"Set to false if the cardiac arrhythmia event within the past 3 months was not unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cardiac arrhythmia event within the past 3 months was unstable.","meaning":"Boolean indicating whether the cardiac arrhythmia within the past 3 months was unstable."} ;; "unstable cardiac arrhythmia within the last 3 months"

(declare-const patient_has_finding_of_cardiac_arrhythmia_inthepast3months@@requiring_intervention Bool) ;; {"when_to_set_to_true":"Set to true if the cardiac arrhythmia event within the past 3 months required intervention.","when_to_set_to_false":"Set to false if the cardiac arrhythmia event within the past 3 months did not require intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cardiac arrhythmia event within the past 3 months required intervention.","meaning":"Boolean indicating whether the cardiac arrhythmia within the past 3 months required intervention."} ;; "cardiac arrhythmia requiring intervention within the last 3 months"

(declare-const patient_has_finding_of_cardiac_arrhythmia_inthepast3months@@life_threatening Bool) ;; {"when_to_set_to_true":"Set to true if the cardiac arrhythmia event within the past 3 months was life-threatening.","when_to_set_to_false":"Set to false if the cardiac arrhythmia event within the past 3 months was not life-threatening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cardiac arrhythmia event within the past 3 months was life-threatening.","meaning":"Boolean indicating whether the cardiac arrhythmia within the past 3 months was life-threatening."} ;; "life-threatening cardiac arrhythmia within the last 3 months"

(declare-const patient_has_finding_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart failure.","when_to_set_to_false":"Set to false if the patient does not currently have heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has heart failure.","meaning":"Boolean indicating whether the patient currently has heart failure."} ;; "heart failure"

(declare-const patient_has_finding_of_heart_failure_now@@nyha_class_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart failure and it is NYHA Class IV.","when_to_set_to_false":"Set to false if the patient currently has heart failure but it is not NYHA Class IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current heart failure is NYHA Class IV.","meaning":"Boolean indicating whether the patient's current heart failure is NYHA Class IV."} ;; "New York Heart Association Class IV heart failure"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable implies corresponding stem variable for angina
(assert
(! (=> patient_has_finding_of_angina_pectoris_inthepast6months@@unstable
      patient_has_finding_of_angina_pectoris_inthepast6months)
:named REQ11_AUXILIARY0)) ;; "unstable angina within the last 6 months"

;; Qualifier variable implies corresponding stem variable for cardiac arrhythmia (unstable)
(assert
(! (=> patient_has_finding_of_cardiac_arrhythmia_inthepast3months@@unstable
      patient_has_finding_of_cardiac_arrhythmia_inthepast3months)
:named REQ11_AUXILIARY1)) ;; "unstable cardiac arrhythmia within the last 3 months"

;; Qualifier variable implies corresponding stem variable for cardiac arrhythmia (requiring intervention)
(assert
(! (=> patient_has_finding_of_cardiac_arrhythmia_inthepast3months@@requiring_intervention
      patient_has_finding_of_cardiac_arrhythmia_inthepast3months)
:named REQ11_AUXILIARY2)) ;; "cardiac arrhythmia requiring intervention within the last 3 months"

;; Qualifier variable implies corresponding stem variable for cardiac arrhythmia (life-threatening)
(assert
(! (=> patient_has_finding_of_cardiac_arrhythmia_inthepast3months@@life_threatening
      patient_has_finding_of_cardiac_arrhythmia_inthepast3months)
:named REQ11_AUXILIARY3)) ;; "life-threatening cardiac arrhythmia within the last 3 months"

;; Qualifier variable implies corresponding stem variable for heart failure (NYHA Class IV)
(assert
(! (=> patient_has_finding_of_heart_failure_now@@nyha_class_iv
      patient_has_finding_of_heart_failure_now)
:named REQ11_AUXILIARY4)) ;; "New York Heart Association Class IV heart failure"

;; ===================== Constraint Assertions (REQ 11) =====================
;; Exclusion: patient must NOT have any of the following at screening
(assert
(! (not patient_has_finding_of_myocardial_infarction_inthepast6months)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "myocardial infarction within the last 6 months"

(assert
(! (not patient_has_finding_of_angina_pectoris_inthepast6months@@unstable)
:named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "unstable angina within the last 6 months"

(assert
(! (not (and patient_has_finding_of_cardiac_arrhythmia_inthepast3months@@unstable
             patient_has_finding_of_cardiac_arrhythmia_inthepast3months@@requiring_intervention))
:named REQ11_COMPONENT2_OTHER_REQUIREMENTS)) ;; "unstable cardiac arrhythmia requiring intervention within the last 3 months"

(assert
(! (not (and patient_has_finding_of_cardiac_arrhythmia_inthepast3months@@life_threatening
             patient_has_finding_of_cardiac_arrhythmia_inthepast3months@@requiring_intervention))
:named REQ11_COMPONENT3_OTHER_REQUIREMENTS)) ;; "life-threatening cardiac arrhythmia requiring intervention within the last 3 months"

(assert
(! (not patient_has_finding_of_heart_failure_now@@nyha_class_iv)
:named REQ11_COMPONENT4_OTHER_REQUIREMENTS)) ;; "New York Heart Association Class IV heart failure"

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_abnormal_and_clinically_significant_12_lead_electrocardiogram_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an abnormal and clinically significant 12-lead electrocardiogram finding.","when_to_set_to_false":"Set to false if the patient currently does not have an abnormal and clinically significant 12-lead electrocardiogram finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an abnormal and clinically significant 12-lead electrocardiogram finding.","meaning":"Boolean indicating whether the patient currently has an abnormal and clinically significant 12-lead electrocardiogram finding."} ;; "abnormal and clinically significant 12-lead electrocardiogram finding"

(declare-const patient_has_abnormal_and_clinically_significant_12_lead_electrocardiogram_finding_now@@principal_investigator_determines_finding_puts_patient_at_undue_risk Bool) ;; {"when_to_set_to_true":"Set to true if the principal investigator determines that the patient's abnormal and clinically significant 12-lead electrocardiogram finding would put the patient at undue risk by participating in the trial.","when_to_set_to_false":"Set to false if the principal investigator does not determine that the patient's abnormal and clinically significant 12-lead electrocardiogram finding would put the patient at undue risk by participating in the trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the principal investigator determines that the patient's abnormal and clinically significant 12-lead electrocardiogram finding would put the patient at undue risk by participating in the trial.","meaning":"Boolean indicating whether the principal investigator determines that the patient's abnormal and clinically significant 12-lead electrocardiogram finding would put the patient at undue risk by participating in the trial."} ;; "principal investigator determines the abnormal electrocardiogram finding would put the patient at undue risk"

(declare-const patient_has_finding_of_atrial_fibrillation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of atrial fibrillation.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of atrial fibrillation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has atrial fibrillation.","meaning":"Boolean indicating whether the patient currently has atrial fibrillation."} ;; "atrial fibrillation"

(declare-const ventricular_rate_value_recorded_now_in_beats_per_minute Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's ventricular rate, recorded now, in beats per minute.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's ventricular rate, recorded now, in beats per minute."} ;; "rapid ventricular rate greater than 120 beats per minute"

(declare-const patient_has_finding_of_sustained_ventricular_tachycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of sustained ventricular tachycardia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of sustained ventricular tachycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sustained ventricular tachycardia.","meaning":"Boolean indicating whether the patient currently has sustained ventricular tachycardia."} ;; "sustained ventricular tachycardia"

(declare-const patient_has_finding_of_nonsustained_ventricular_tachycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of nonsustained ventricular tachycardia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of nonsustained ventricular tachycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has nonsustained ventricular tachycardia.","meaning":"Boolean indicating whether the patient currently has nonsustained ventricular tachycardia."} ;; "nonsustained ventricular tachycardia"

(declare-const patient_has_finding_of_mobitz_type_ii_atrioventricular_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of Mobitz type II second degree atrioventricular block.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of Mobitz type II second degree atrioventricular block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Mobitz type II second degree atrioventricular block.","meaning":"Boolean indicating whether the patient currently has Mobitz type II second degree atrioventricular block."} ;; "second degree heart block Mobitz type II"

(declare-const patient_has_finding_of_complete_atrioventricular_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of complete (third degree) atrioventricular block.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of complete (third degree) atrioventricular block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has complete (third degree) atrioventricular block.","meaning":"Boolean indicating whether the patient currently has complete (third degree) atrioventricular block."} ;; "third degree heart block"

(declare-const patient_has_pacemaker_inserted_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a pacemaker inserted.","when_to_set_to_false":"Set to false if the patient currently does not have a pacemaker inserted.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a pacemaker inserted.","meaning":"Boolean indicating whether the patient currently has a pacemaker inserted."} ;; "pacemaker has been inserted"

(declare-const patient_has_defibrillator_inserted_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a defibrillator inserted.","when_to_set_to_false":"Set to false if the patient currently does not have a defibrillator inserted.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a defibrillator inserted.","meaning":"Boolean indicating whether the patient currently has a defibrillator inserted."} ;; "defibrillator has been inserted"

(declare-const qt_interval_corrected_for_heart_rate_value_recorded_now_in_milliseconds Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's QT interval corrected for heart rate, recorded now, in milliseconds.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's QT interval corrected for heart rate, recorded now, in milliseconds."} ;; "QT interval corrected for heart rate"

(declare-const qrs_duration_value_recorded_now_in_milliseconds Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's QRS duration, recorded now, in milliseconds.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's QRS duration, recorded now, in milliseconds."} ;; "QRS duration"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or
        (and patient_has_finding_of_atrial_fibrillation_now
             (> ventricular_rate_value_recorded_now_in_beats_per_minute 120)) ;; "atrial fibrillation with rapid ventricular rate greater than 120 beats per minute"
        patient_has_finding_of_sustained_ventricular_tachycardia_now ;; "sustained ventricular tachycardia"
        patient_has_finding_of_nonsustained_ventricular_tachycardia_now ;; "nonsustained ventricular tachycardia"
        patient_has_finding_of_mobitz_type_ii_atrioventricular_block_now ;; "second degree heart block Mobitz type II"
        (and patient_has_finding_of_complete_atrioventricular_block_now
             (not (or patient_has_pacemaker_inserted_now patient_has_defibrillator_inserted_now))) ;; "third degree heart block (unless pacemaker OR defibrillator has been inserted)"
        (and (>= qt_interval_corrected_for_heart_rate_value_recorded_now_in_milliseconds 500)
             (< qrs_duration_value_recorded_now_in_milliseconds 120)) ;; "QT interval corrected for heart rate >= 500 ms in patients with QRS duration < 120 ms"
        (and (>= qt_interval_corrected_for_heart_rate_value_recorded_now_in_milliseconds 530)
             (>= qrs_duration_value_recorded_now_in_milliseconds 120)) ;; "QT interval corrected for heart rate >= 530 ms in patients with QRS duration >= 120 ms"
    )
    patient_has_abnormal_and_clinically_significant_12_lead_electrocardiogram_finding_now)
:named REQ12_AUXILIARY0)) ;; "with non-exhaustive examples ((atrial fibrillation with rapid ventricular rate greater than 120 beats per minute) OR (sustained ventricular tachycardia) OR (nonsustained ventricular tachycardia) OR (second degree heart block Mobitz type II) OR (third degree heart block (unless pacemaker OR defibrillator has been inserted)) OR (QT interval corrected for heart rate greater than or equal to 500 milliseconds in patients with QRS duration less than 120 milliseconds) OR (QT interval corrected for heart rate greater than or equal to 530 milliseconds in patients with QRS duration greater than or equal to 120 milliseconds))"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_abnormal_and_clinically_significant_12_lead_electrocardiogram_finding_now@@principal_investigator_determines_finding_puts_patient_at_undue_risk
      patient_has_abnormal_and_clinically_significant_12_lead_electrocardiogram_finding_now)
:named REQ12_AUXILIARY1)) ;; "principal investigator determines the abnormal electrocardiogram finding would put the patient at undue risk"

;; ===================== Constraint Assertions (REQ 12) =====================
;; Exclusion: patient must NOT have abnormal and clinically significant 12-lead ECG finding
(assert
(! (not patient_has_abnormal_and_clinically_significant_12_lead_electrocardiogram_finding_now)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an abnormal and clinically significant 12-lead electrocardiogram finding with non-exhaustive examples..."

;; Exclusion: patient must NOT have abnormal and clinically significant 12-lead ECG finding that PI determines puts patient at undue risk
(assert
(! (not patient_has_abnormal_and_clinically_significant_12_lead_electrocardiogram_finding_now@@principal_investigator_determines_finding_puts_patient_at_undue_risk)
:named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the principal investigator determines the abnormal electrocardiogram finding would put the patient at undue risk by participating in the trial."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_allergy_to_corticosteroid_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented or reported history of allergy to any corticosteroid.","when_to_set_to_false":"Set to false if the patient has no history of allergy to any corticosteroid.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of allergy to any corticosteroid.","meaning":"Boolean indicating whether the patient has ever had an allergy to any corticosteroid in their history."} ;; "the patient has a history of allergy to any corticosteroid"
(declare-const patient_has_allergy_to_acetylcholine_receptor_antagonist_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented or reported history of allergy to any acetylcholine receptor antagonist (anticholinergic drug).","when_to_set_to_false":"Set to false if the patient has no history of allergy to any acetylcholine receptor antagonist (anticholinergic drug).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of allergy to any acetylcholine receptor antagonist (anticholinergic drug).","meaning":"Boolean indicating whether the patient has ever had an allergy to any acetylcholine receptor antagonist (anticholinergic drug) in their history."} ;; "the patient has a history of allergy to any anticholinergic drug"
(declare-const patient_has_allergy_to_muscarinic_receptor_antagonist_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented or reported history of allergy to any muscarinic receptor antagonist.","when_to_set_to_false":"Set to false if the patient has no history of allergy to any muscarinic receptor antagonist.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of allergy to any muscarinic receptor antagonist.","meaning":"Boolean indicating whether the patient has ever had an allergy to any muscarinic receptor antagonist in their history."} ;; "the patient has a history of allergy to any muscarinic receptor antagonist"
(declare-const patient_has_allergy_to_beta_2_adrenergic_agonist_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented or reported history of allergy to any beta-2 adrenergic agonist.","when_to_set_to_false":"Set to false if the patient has no history of allergy to any beta-2 adrenergic agonist.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of allergy to any beta-2 adrenergic agonist.","meaning":"Boolean indicating whether the patient has ever had an allergy to any beta-2 adrenergic agonist in their history."} ;; "the patient has a history of allergy to any beta-2 adrenergic agonist"
(declare-const patient_has_allergy_to_lactose_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented or reported history of allergy to lactose.","when_to_set_to_false":"Set to false if the patient has no history of allergy to lactose.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of allergy to lactose.","meaning":"Boolean indicating whether the patient has ever had an allergy to lactose in their history."} ;; "the patient has a history of allergy to lactose"
(declare-const patient_has_allergy_to_milk_protein_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented or reported history of allergy to milk protein.","when_to_set_to_false":"Set to false if the patient has no history of allergy to milk protein.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of allergy to milk protein.","meaning":"Boolean indicating whether the patient has ever had an allergy to milk protein in their history."} ;; "the patient has a history of allergy to milk protein"
(declare-const patient_has_allergy_to_magnesium_stearate_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented or reported history of allergy to magnesium stearate.","when_to_set_to_false":"Set to false if the patient has no history of allergy to magnesium stearate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of allergy to magnesium stearate.","meaning":"Boolean indicating whether the patient has ever had an allergy to magnesium stearate in their history."} ;; "the patient has a history of allergy to magnesium stearate"
(declare-const patient_has_finding_of_narrow_angle_glaucoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has narrow-angle glaucoma.","when_to_set_to_false":"Set to false if the patient currently does not have narrow-angle glaucoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has narrow-angle glaucoma.","meaning":"Boolean indicating whether the patient currently has narrow-angle glaucoma."} ;; "narrow-angle glaucoma"
(declare-const patient_has_finding_of_prostatic_hypertrophy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has prostatic hypertrophy.","when_to_set_to_false":"Set to false if the patient currently does not have prostatic hypertrophy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has prostatic hypertrophy.","meaning":"Boolean indicating whether the patient currently has prostatic hypertrophy."} ;; "prostatic hypertrophy"
(declare-const patient_has_finding_of_bladder_neck_obstruction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bladder neck obstruction.","when_to_set_to_false":"Set to false if the patient currently does not have bladder neck obstruction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bladder neck obstruction.","meaning":"Boolean indicating whether the patient currently has bladder neck obstruction."} ;; "bladder neck obstruction"
(declare-const patient_has_medical_condition_that_contraindicates_study_participation_investigator_opinion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a medical condition (such as narrow-angle glaucoma, prostatic hypertrophy, or bladder neck obstruction) that, in the opinion of the investigator, contraindicates study participation.","when_to_set_to_false":"Set to false if the patient currently does not have such a medical condition or the investigator does not judge it to contraindicate study participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has such a medical condition that, in the opinion of the investigator, contraindicates study participation.","meaning":"Boolean indicating whether the patient currently has a medical condition that, in the opinion of the investigator, contraindicates study participation."} ;; "the patient has a medical condition such as narrow-angle glaucoma or prostatic hypertrophy or bladder neck obstruction that, in the opinion of the investigator, contraindicates study participation"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Non-exhaustive examples: (narrow-angle glaucoma OR prostatic hypertrophy OR bladder neck obstruction) are examples of medical conditions that, in the opinion of the investigator, contraindicate study participation
(assert
(! (=> (or patient_has_finding_of_narrow_angle_glaucoma_now
         patient_has_finding_of_prostatic_hypertrophy_now
         patient_has_finding_of_bladder_neck_obstruction_now)
    patient_has_medical_condition_that_contraindicates_study_participation_investigator_opinion_now)
:named REQ13_AUXILIARY0)) ;; "such as narrow-angle glaucoma OR prostatic hypertrophy OR bladder neck obstruction that, in the opinion of the investigator, contraindicates study participation"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_allergy_to_corticosteroid_inthehistory)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of allergy to any corticosteroid."

(assert
(! (not patient_has_allergy_to_acetylcholine_receptor_antagonist_inthehistory)
:named REQ13_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of allergy to any anticholinergic drug."

(assert
(! (not patient_has_allergy_to_muscarinic_receptor_antagonist_inthehistory)
:named REQ13_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of allergy to any muscarinic receptor antagonist."

(assert
(! (not patient_has_allergy_to_beta_2_adrenergic_agonist_inthehistory)
:named REQ13_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of allergy to any beta-2 adrenergic agonist."

(assert
(! (not patient_has_allergy_to_lactose_inthehistory)
:named REQ13_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of allergy to lactose."

(assert
(! (not patient_has_allergy_to_milk_protein_inthehistory)
:named REQ13_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of allergy to milk protein."

(assert
(! (not patient_has_allergy_to_magnesium_stearate_inthehistory)
:named REQ13_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of allergy to magnesium stearate."

(assert
(! (not patient_has_medical_condition_that_contraindicates_study_participation_investigator_opinion_now)
:named REQ13_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a medical condition such as narrow-angle glaucoma or prostatic hypertrophy or bladder neck obstruction that, in the opinion of the investigator, contraindicates study participation."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const carcinoma_remission_duration_value_recorded_in_years Real) ;; {"when_to_set_to_value":"Set to the number of years the patient's carcinoma has been in complete remission, if known and documented.","when_to_set_to_null":"Set to null if the duration of complete remission for the patient's carcinoma is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the duration in years that the patient's carcinoma has been in complete remission."} ;; "duration in years that the patient's carcinoma has been in complete remission"

(declare-const patient_has_finding_of_carcinoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has carcinoma.","when_to_set_to_false":"Set to false if the patient currently does not have carcinoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has carcinoma.","meaning":"Boolean indicating whether the patient currently has carcinoma."} ;; "the patient currently has carcinoma"

(declare-const patient_has_finding_of_carcinoma_now@@not_in_complete_remission_for_at_least_5_years Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current carcinoma has not been in complete remission for at least 5 years.","when_to_set_to_false":"Set to false if the patient's current carcinoma has been in complete remission for at least 5 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current carcinoma has been in complete remission for at least 5 years.","meaning":"Boolean indicating whether the patient's current carcinoma has not been in complete remission for at least 5 years."} ;; "carcinoma that has not been in complete remission for at least 5 years"

(declare-const patient_has_finding_of_carcinoma_now@@excluding_carcinoma_in_situ_of_cervix_or_squamous_cell_carcinoma_of_skin_or_basal_cell_carcinoma_of_skin_considered_cured Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current carcinoma is NOT carcinoma in situ of the cervix, squamous cell carcinoma of the skin, or basal cell carcinoma of the skin considered cured by treatment.","when_to_set_to_false":"Set to false if the patient's current carcinoma IS carcinoma in situ of the cervix, squamous cell carcinoma of the skin, or basal cell carcinoma of the skin considered cured by treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current carcinoma is one of the excluded types or considered cured by treatment.","meaning":"Boolean indicating whether the patient's current carcinoma excludes carcinoma in situ of the cervix, squamous cell carcinoma of the skin, or basal cell carcinoma of the skin considered cured by treatment."} ;; "EXCEPT for carcinoma in situ of the cervix, squamous cell carcinoma of the skin, or basal cell carcinoma of the skin that has been considered cured by treatment"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Link the remission duration to the qualifier variable
(assert
(! (= patient_has_finding_of_carcinoma_now@@not_in_complete_remission_for_at_least_5_years
     (and patient_has_finding_of_carcinoma_now
          (< carcinoma_remission_duration_value_recorded_in_years 5)))
:named REQ14_AUXILIARY0)) ;; "carcinoma that has not been in complete remission for at least 5 years"

;; Qualifier variable for exclusion of certain carcinoma types
(assert
(! (=> patient_has_finding_of_carcinoma_now@@excluding_carcinoma_in_situ_of_cervix_or_squamous_cell_carcinoma_of_skin_or_basal_cell_carcinoma_of_skin_considered_cured
       patient_has_finding_of_carcinoma_now)
:named REQ14_AUXILIARY1)) ;; "EXCEPT for carcinoma in situ of the cervix, squamous cell carcinoma of the skin, or basal cell carcinoma of the skin that has been considered cured by treatment"

;; ===================== Constraint Assertions (REQ 14) =====================
;; Exclusion: patient must NOT have carcinoma that has not been in complete remission for at least 5 years, except for the specified types considered cured
(assert
(! (not (and patient_has_finding_of_carcinoma_now@@not_in_complete_remission_for_at_least_5_years
             patient_has_finding_of_carcinoma_now@@excluding_carcinoma_in_situ_of_cervix_or_squamous_cell_carcinoma_of_skin_or_basal_cell_carcinoma_of_skin_considered_cured))
   :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has carcinoma that has not been in complete remission for at least 5 years, EXCEPT for carcinoma in situ of the cervix, squamous cell carcinoma of the skin, or basal cell carcinoma of the skin that has been considered cured by treatment."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_is_undergoing_long_term_oxygen_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing long-term oxygen therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing long-term oxygen therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing long-term oxygen therapy.","meaning":"Boolean indicating whether the patient is currently undergoing long-term oxygen therapy."} ;; "long-term oxygen therapy"

(declare-const patient_is_undergoing_long_term_oxygen_therapy_now@@described_as_resting_oxygen_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current long-term oxygen therapy is described as resting oxygen therapy.","when_to_set_to_false":"Set to false if the patient's current long-term oxygen therapy is not described as resting oxygen therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current long-term oxygen therapy is described as resting oxygen therapy.","meaning":"Boolean indicating whether the patient's current long-term oxygen therapy is described as resting oxygen therapy."} ;; "resting oxygen therapy"

(declare-const patient_long_term_oxygen_therapy_value_recorded_now_withunit_liters_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured flow rate in liters per minute if the patient is currently receiving long-term oxygen therapy and the flow rate is recorded.","when_to_set_to_null":"Set to null if the patient is not currently receiving long-term oxygen therapy or if the flow rate is not recorded or unknown.","meaning":"Numeric value representing the flow rate (liters per minute) of the patient's current long-term oxygen therapy."} ;; "flow rate greater than 3 liters per minute"

;; ===================== Auxiliary Assertions (REQ 15) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_undergoing_long_term_oxygen_therapy_now@@described_as_resting_oxygen_therapy
      patient_is_undergoing_long_term_oxygen_therapy_now)
:named REQ15_AUXILIARY0)) ;; "described as resting oxygen therapy"

;; ===================== Constraint Assertions (REQ 15) =====================
;; Exclusion: patient uses long-term oxygen therapy described as resting oxygen therapy at a flow rate greater than 3 liters per minute
(assert
(! (not (and patient_is_undergoing_long_term_oxygen_therapy_now@@described_as_resting_oxygen_therapy
             (> patient_long_term_oxygen_therapy_value_recorded_now_withunit_liters_per_minute 3)))
:named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses long-term oxygen therapy described as resting oxygen therapy at a flow rate greater than 3 liters per minute."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_is_exposed_to_albuterol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to albuterol.","when_to_set_to_false":"Set to false if the patient is currently not exposed to albuterol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to albuterol.","meaning":"Boolean indicating whether the patient is currently exposed to albuterol."} ;; "albuterol"
(declare-const patient_is_exposed_to_albuterol_now@@medically_unable_to_withhold_for_4_hour_period_prior_to_spirometry_testing_at_each_study_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to albuterol and is medically unable to withhold albuterol for the 4-hour period required prior to spirometry testing at each study visit.","when_to_set_to_false":"Set to false if the patient is currently exposed to albuterol and is medically able to withhold albuterol for the 4-hour period required prior to spirometry testing at each study visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is medically unable to withhold albuterol for the 4-hour period required prior to spirometry testing at each study visit.","meaning":"Boolean indicating whether the patient is currently exposed to albuterol and is medically unable to withhold albuterol for the 4-hour period required prior to spirometry testing at each study visit."} ;; "the patient is medically unable to withhold albuterol for the 4-hour period required prior to spirometry testing at each study visit"
(declare-const patient_is_medically_unable_to_withhold_salbutamol_for_4_hour_period_prior_to_spirometry_testing_at_each_study_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient is medically unable to withhold salbutamol for the 4-hour period required prior to spirometry testing at each study visit.","when_to_set_to_false":"Set to false if the patient is medically able to withhold salbutamol for the 4-hour period required prior to spirometry testing at each study visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is medically unable to withhold salbutamol for the 4-hour period required prior to spirometry testing at each study visit.","meaning":"Boolean indicating whether the patient is medically unable to withhold salbutamol for the 4-hour period required prior to spirometry testing at each study visit."} ;; "the patient is medically unable to withhold salbutamol for the 4-hour period required prior to spirometry testing at each study visit"

;; ===================== Auxiliary Assertions (REQ 16) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_albuterol_now@@medically_unable_to_withhold_for_4_hour_period_prior_to_spirometry_testing_at_each_study_visit
       patient_is_exposed_to_albuterol_now)
   :named REQ16_AUXILIARY0)) ;; "the patient is medically unable to withhold albuterol for the 4-hour period required prior to spirometry testing at each study visit"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not (or patient_is_exposed_to_albuterol_now@@medically_unable_to_withhold_for_4_hour_period_prior_to_spirometry_testing_at_each_study_visit
            patient_is_medically_unable_to_withhold_salbutamol_for_4_hour_period_prior_to_spirometry_testing_at_each_study_visit))
   :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is medically unable to withhold albuterol for the 4-hour period required prior to spirometry testing at each study visit) OR (the patient is medically unable to withhold salbutamol for the 4-hour period required prior to spirometry testing at each study visit)."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_participated_in_acute_phase_of_pulmonary_rehabilitation_program_within_4_weeks_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in the acute phase of a pulmonary rehabilitation program within 4 weeks prior to screening.","when_to_set_to_false":"Set to false if the patient has not participated in the acute phase of a pulmonary rehabilitation program within 4 weeks prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in the acute phase of a pulmonary rehabilitation program within 4 weeks prior to screening.","meaning":"Boolean indicating whether the patient has participated in the acute phase of a pulmonary rehabilitation program within 4 weeks prior to screening."} ;; "the patient has participated in the acute phase of a pulmonary rehabilitation program within 4 weeks prior to screening"

(declare-const patient_has_participated_in_maintenance_phase_of_pulmonary_rehabilitation_program Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in the maintenance phase of a pulmonary rehabilitation program.","when_to_set_to_false":"Set to false if the patient has not participated in the maintenance phase of a pulmonary rehabilitation program.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in the maintenance phase of a pulmonary rehabilitation program.","meaning":"Boolean indicating whether the patient has participated in the maintenance phase of a pulmonary rehabilitation program."} ;; "Participation in the maintenance phase of a pulmonary rehabilitation program is NOT exclusionary."

(declare-const patient_plans_to_enter_acute_phase_of_pulmonary_rehabilitation_program_during_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient plans to enter the acute phase of a pulmonary rehabilitation program during the study.","when_to_set_to_false":"Set to false if the patient does not plan to enter the acute phase of a pulmonary rehabilitation program during the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient plans to enter the acute phase of a pulmonary rehabilitation program during the study.","meaning":"Boolean indicating whether the patient plans to enter the acute phase of a pulmonary rehabilitation program during the study."} ;; "the patient plans to enter the acute phase of a pulmonary rehabilitation program during the study"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not patient_has_participated_in_acute_phase_of_pulmonary_rehabilitation_program_within_4_weeks_prior_to_screening)
:named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has participated in the acute phase of a pulmonary rehabilitation program within 4 weeks prior to screening."

(assert
(! (not patient_plans_to_enter_acute_phase_of_pulmonary_rehabilitation_program_during_study)
:named REQ17_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient plans to enter the acute phase of a pulmonary rehabilitation program during the study."

;; ===================== Auxiliary Assertions (REQ 17) =====================
;; Maintenance phase participation is NOT exclusionary; no constraint assertion needed.
;; No auxiliary assertion required for maintenance phase, as per requirement.

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_has_finding_of_alcohol_abuse_inthepast2years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented finding of alcohol abuse that occurred within the past 2 years.","when_to_set_to_false":"Set to false if the patient does not have a documented finding of alcohol abuse within the past 2 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a finding of alcohol abuse within the past 2 years.","meaning":"Boolean indicating whether the patient has a finding of alcohol abuse within the past 2 years."} ;; "alcohol abuse within the last 2 years"

(declare-const patient_has_finding_of_alcohol_abuse_inthepast2years@@known_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of alcohol abuse within the past 2 years is known (confirmed/documented).","when_to_set_to_false":"Set to false if the patient's history of alcohol abuse within the past 2 years is not known (i.e., not confirmed/documented).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the history is known.","meaning":"Boolean indicating whether the patient's history of alcohol abuse within the past 2 years is known."} ;; "known history of alcohol abuse within the last 2 years"

(declare-const patient_has_finding_of_alcohol_abuse_inthepast2years@@suspected_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of alcohol abuse within the past 2 years is suspected (not confirmed/documented).","when_to_set_to_false":"Set to false if the patient's history of alcohol abuse within the past 2 years is not suspected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the history is suspected.","meaning":"Boolean indicating whether the patient's history of alcohol abuse within the past 2 years is suspected."} ;; "suspected history of alcohol abuse within the last 2 years"

(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthepast2years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented finding relating to drug misuse behavior that occurred within the past 2 years.","when_to_set_to_false":"Set to false if the patient does not have a documented finding relating to drug misuse behavior within the past 2 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a finding relating to drug misuse behavior within the past 2 years.","meaning":"Boolean indicating whether the patient has a finding relating to drug misuse behavior within the past 2 years."} ;; "drug abuse within the last 2 years"

(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthepast2years@@known_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of drug abuse within the past 2 years is known (confirmed/documented).","when_to_set_to_false":"Set to false if the patient's history of drug abuse within the past 2 years is not known (i.e., not confirmed/documented).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the history is known.","meaning":"Boolean indicating whether the patient's history of drug abuse within the past 2 years is known."} ;; "known history of drug abuse within the last 2 years"

(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthepast2years@@suspected_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of drug abuse within the past 2 years is suspected (not confirmed/documented).","when_to_set_to_false":"Set to false if the patient's history of drug abuse within the past 2 years is not suspected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the history is suspected.","meaning":"Boolean indicating whether the patient's history of drug abuse within the past 2 years is suspected."} ;; "suspected history of drug abuse within the last 2 years"

;; ===================== Auxiliary Assertions (REQ 18) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_alcohol_abuse_inthepast2years@@known_history
      patient_has_finding_of_alcohol_abuse_inthepast2years)
:named REQ18_AUXILIARY0)) ;; "known history of alcohol abuse within the last 2 years"

(assert
(! (=> patient_has_finding_of_alcohol_abuse_inthepast2years@@suspected_history
      patient_has_finding_of_alcohol_abuse_inthepast2years)
:named REQ18_AUXILIARY1)) ;; "suspected history of alcohol abuse within the last 2 years"

(assert
(! (=> patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthepast2years@@known_history
      patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthepast2years)
:named REQ18_AUXILIARY2)) ;; "known history of drug abuse within the last 2 years"

(assert
(! (=> patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthepast2years@@suspected_history
      patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthepast2years)
:named REQ18_AUXILIARY3)) ;; "suspected history of drug abuse within the last 2 years"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not patient_has_finding_of_alcohol_abuse_inthepast2years@@known_history)
:named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known history of alcohol abuse within the last 2 years."

(assert
(! (not patient_has_finding_of_alcohol_abuse_inthepast2years@@suspected_history)
:named REQ18_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a suspected history of alcohol abuse within the last 2 years."

(assert
(! (not patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthepast2years@@known_history)
:named REQ18_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known history of drug abuse within the last 2 years."

(assert
(! (not patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthepast2years@@suspected_history)
:named REQ18_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a suspected history of drug abuse within the last 2 years."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_is_at_risk_of_non_compliance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently at risk of non-compliance.","when_to_set_to_false":"Set to false if the patient is currently not at risk of non-compliance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently at risk of non-compliance.","meaning":"Boolean indicating whether the patient is currently at risk of non-compliance."} ;; "the patient is at risk of non-compliance"

(declare-const patient_is_at_risk_of_non_compliance_now@@for_study_procedures Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently at risk of non-compliance for study procedures.","when_to_set_to_false":"Set to false if the patient is currently not at risk of non-compliance for study procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently at risk of non-compliance for study procedures.","meaning":"Boolean indicating whether the patient is currently at risk of non-compliance for study procedures."} ;; "the patient is at risk of non-compliance for study procedures"

(declare-const patient_is_unable_to_comply_with_study_procedures_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to comply with study procedures.","when_to_set_to_false":"Set to false if the patient is currently able to comply with study procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to comply with study procedures.","meaning":"Boolean indicating whether the patient is currently unable to comply with study procedures."} ;; "the patient is unable to comply with the study procedures"

(declare-const patient_has_finding_of_infirmity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an infirmity.","when_to_set_to_false":"Set to false if the patient currently does not have an infirmity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an infirmity.","meaning":"Boolean indicating whether the patient currently has an infirmity."} ;; "the patient has any infirmity"

(declare-const patient_has_finding_of_infirmity_now@@limits_compliance_for_scheduled_visits Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current infirmity limits compliance for scheduled visits.","when_to_set_to_false":"Set to false if the patient's current infirmity does not limit compliance for scheduled visits.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current infirmity limits compliance for scheduled visits.","meaning":"Boolean indicating whether the patient's current infirmity limits compliance for scheduled visits."} ;; "the patient has any infirmity that would limit compliance for scheduled visits"

(declare-const patient_has_finding_of_disability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disability.","when_to_set_to_false":"Set to false if the patient currently does not have a disability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disability.","meaning":"Boolean indicating whether the patient currently has a disability."} ;; "the patient has any disability"

(declare-const patient_has_finding_of_disability_now@@limits_compliance_for_scheduled_visits Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disability limits compliance for scheduled visits.","when_to_set_to_false":"Set to false if the patient's current disability does not limit compliance for scheduled visits.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disability limits compliance for scheduled visits.","meaning":"Boolean indicating whether the patient's current disability limits compliance for scheduled visits."} ;; "the patient has any disability that would limit compliance for scheduled visits"

(declare-const patient_has_geographic_location_limiting_compliance_for_scheduled_visits_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current geographic location limits compliance for scheduled visits.","when_to_set_to_false":"Set to false if the patient's current geographic location does not limit compliance for scheduled visits.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current geographic location limits compliance for scheduled visits.","meaning":"Boolean indicating whether the patient's current geographic location limits compliance for scheduled visits."} ;; "the patient has a geographic location that would limit compliance for scheduled visits"

;; ===================== Auxiliary Assertions (REQ 19) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_at_risk_of_non_compliance_now@@for_study_procedures
      patient_is_at_risk_of_non_compliance_now)
:named REQ19_AUXILIARY0)) ;; "the patient is at risk of non-compliance for study procedures"

(assert
(! (=> patient_has_finding_of_infirmity_now@@limits_compliance_for_scheduled_visits
      patient_has_finding_of_infirmity_now)
:named REQ19_AUXILIARY1)) ;; "the patient has any infirmity that would limit compliance for scheduled visits"

(assert
(! (=> patient_has_finding_of_disability_now@@limits_compliance_for_scheduled_visits
      patient_has_finding_of_disability_now)
:named REQ19_AUXILIARY2)) ;; "the patient has any disability that would limit compliance for scheduled visits"

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not patient_is_at_risk_of_non_compliance_now)
:named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is at risk of non-compliance."

(assert
(! (not patient_is_unable_to_comply_with_study_procedures_now)
:named REQ19_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to comply with the study procedures."

(assert
(! (not patient_has_finding_of_infirmity_now@@limits_compliance_for_scheduled_visits)
:named REQ19_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any infirmity that would limit compliance for scheduled visits."

(assert
(! (not patient_has_finding_of_disability_now@@limits_compliance_for_scheduled_visits)
:named REQ19_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any disability that would limit compliance for scheduled visits."

(assert
(! (not patient_has_geographic_location_limiting_compliance_for_scheduled_visits_now)
:named REQ19_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a geographic location that would limit compliance for scheduled visits."

;; ===================== Declarations for the exclusion criterion (REQ 20) =====================
(declare-const patient_has_finding_of_poor_motivation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has poor motivation.","when_to_set_to_false":"Set to false if the patient currently does not have poor motivation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has poor motivation.","meaning":"Boolean indicating whether the patient currently has poor motivation."} ;; "the patient has poor motivation"
(declare-const patient_has_condition_limiting_validity_of_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has another condition that will limit the validity of informed consent to participate in the study.","when_to_set_to_false":"Set to false if the patient currently does not have another condition that will limit the validity of informed consent to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has another condition that will limit the validity of informed consent to participate in the study.","meaning":"Boolean indicating whether the patient currently has another condition that will limit the validity of informed consent to participate in the study."} ;; "the patient has another condition that will limit the validity of informed consent to participate in the study"

;; ===================== Constraint Assertions (REQ 20) =====================
(assert
(! (not patient_has_finding_of_psychiatric_abnormality_inthehistory)
    :named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of psychiatric disease."

(assert
(! (not patient_has_finding_of_intellectual_deficiency_now)
    :named REQ20_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has intellectual deficiency."

(assert
(! (not patient_has_finding_of_poor_motivation_now)
    :named REQ20_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has poor motivation."

(assert
(! (not patient_has_condition_limiting_validity_of_informed_consent_now)
    :named REQ20_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has another condition that will limit the validity of informed consent to participate in the study."
