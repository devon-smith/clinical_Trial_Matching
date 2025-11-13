;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of asthma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of asthma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of asthma."} ;; "has a current diagnosis of asthma"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_asthma_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current diagnosis of asthma."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_active_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of active tuberculosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of active tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of active tuberculosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of active tuberculosis."} ;; "active tuberculosis"
(declare-const patient_has_diagnosis_of_alpha_1_antitrypsin_deficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of alpha-1 antitrypsin deficiency.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of alpha-1 antitrypsin deficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of alpha-1 antitrypsin deficiency.","meaning":"Boolean indicating whether the patient currently has a diagnosis of alpha-1 antitrypsin deficiency."} ;; "α1-antitrypsin deficiency"
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic obstructive pulmonary disease."} ;; "chronic obstructive pulmonary disease"
(declare-const patient_has_diagnosis_of_bronchiectasis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of bronchiectasis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of bronchiectasis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of bronchiectasis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of bronchiectasis."} ;; "bronchiectasis"
(declare-const patient_has_diagnosis_of_bronchiectasis_now@@excludes_focal_bronchiectasis Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of bronchiectasis excludes focal bronchiectasis.","when_to_set_to_false":"Set to false if the diagnosis of bronchiectasis does not exclude focal bronchiectasis (i.e., includes focal bronchiectasis).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether focal bronchiectasis is excluded from the diagnosis of bronchiectasis.","meaning":"Boolean indicating whether the diagnosis of bronchiectasis excludes focal bronchiectasis."} ;; "bronchiectasis except focal bronchiectasis"
(declare-const patient_has_diagnosis_of_fibrosis_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of pulmonary fibrosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of pulmonary fibrosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of pulmonary fibrosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of pulmonary fibrosis."} ;; "pulmonary fibrosis"
(declare-const patient_has_diagnosis_of_fibrosis_of_lung_now@@excludes_focal_fibrotic_pulmonary_lesions Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of pulmonary fibrosis excludes focal fibrotic pulmonary lesions.","when_to_set_to_false":"Set to false if the diagnosis of pulmonary fibrosis does not exclude focal fibrotic pulmonary lesions (i.e., includes focal fibrotic pulmonary lesions).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether focal fibrotic pulmonary lesions are excluded from the diagnosis of pulmonary fibrosis.","meaning":"Boolean indicating whether the diagnosis of pulmonary fibrosis excludes focal fibrotic pulmonary lesions."} ;; "pulmonary fibrosis except focal fibrotic pulmonary lesions"
(declare-const patient_has_diagnosis_of_interstitial_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of interstitial lung disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of interstitial lung disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of interstitial lung disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of interstitial lung disease."} ;; "interstitial lung diseases"
(declare-const patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of primary malignant neoplasm of lung.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of primary malignant neoplasm of lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of primary malignant neoplasm of lung.","meaning":"Boolean indicating whether the patient currently has a diagnosis of primary malignant neoplasm of lung."} ;; "lung cancer"
(declare-const patient_has_diagnosis_of_pulmonary_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of pulmonary hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of pulmonary hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of pulmonary hypertension.","meaning":"Boolean indicating whether the patient currently has a diagnosis of pulmonary hypertension."} ;; "pulmonary hypertension"
(declare-const patient_has_diagnosis_of_sarcoidosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of sarcoidosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of sarcoidosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of sarcoidosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of sarcoidosis."} ;; "sarcoidosis"
(declare-const patient_has_diagnosis_of_other_active_pulmonary_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any other active pulmonary disease not otherwise specified in the exclusion list.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of any other active pulmonary disease not otherwise specified in the exclusion list.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of any other active pulmonary disease not otherwise specified in the exclusion list.","meaning":"Boolean indicating whether the patient currently has a diagnosis of any other active pulmonary disease not otherwise specified in the exclusion list."} ;; "other active pulmonary diseases"
(declare-const patient_has_diagnosis_of_disorder_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of disorder of lung.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of disorder of lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of disorder of lung.","meaning":"Boolean indicating whether the patient currently has a diagnosis of disorder of lung."} ;; "pulmonary diseases"
(declare-const patient_has_diagnosis_of_disorder_of_lung_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of disorder of lung is active.","when_to_set_to_false":"Set to false if the diagnosis of disorder of lung is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of disorder of lung is active.","meaning":"Boolean indicating whether the diagnosis of disorder of lung is active."} ;; "active pulmonary diseases"
(declare-const patient_has_diagnosis_of_disorder_of_respiratory_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a disorder of the respiratory system.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a disorder of the respiratory system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a disorder of the respiratory system.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a disorder of the respiratory system."} ;; "respiratory disorder"
(declare-const patient_has_diagnosis_of_disorder_of_respiratory_system_now@@excludes_asthma Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of disorder of respiratory system excludes asthma.","when_to_set_to_false":"Set to false if the diagnosis of disorder of respiratory system does not exclude asthma (i.e., includes asthma).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether asthma is excluded from the diagnosis of disorder of respiratory system.","meaning":"Boolean indicating whether the diagnosis of disorder of respiratory system excludes asthma."} ;; "respiratory disorder excluding asthma"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or
        patient_has_diagnosis_of_alpha_1_antitrypsin_deficiency_now
        patient_has_diagnosis_of_active_tuberculosis_now
        patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now
        patient_has_diagnosis_of_bronchiectasis_now@@excludes_focal_bronchiectasis
        patient_has_diagnosis_of_sarcoidosis_now
        patient_has_diagnosis_of_fibrosis_of_lung_now@@excludes_focal_fibrotic_pulmonary_lesions
        patient_has_diagnosis_of_pulmonary_hypertension_now
        patient_has_diagnosis_of_interstitial_lung_disease_now
        patient_has_diagnosis_of_other_active_pulmonary_disease_now)
    patient_has_diagnosis_of_disorder_of_respiratory_system_now@@excludes_asthma)
:named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples ((α1-antitrypsin deficiency as the underlying cause of chronic obstructive pulmonary disease) OR (active tuberculosis) OR (lung cancer) OR (bronchiectasis except focal bronchiectasis) OR (sarcoidosis) OR (pulmonary fibrosis except focal fibrotic pulmonary lesions) OR (pulmonary hypertension) OR (interstitial lung diseases) OR (other active pulmonary diseases))."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_bronchiectasis_now@@excludes_focal_bronchiectasis
      patient_has_diagnosis_of_bronchiectasis_now)
:named REQ1_AUXILIARY1)) ;; "bronchiectasis except focal bronchiectasis"

(assert
(! (=> patient_has_diagnosis_of_fibrosis_of_lung_now@@excludes_focal_fibrotic_pulmonary_lesions
      patient_has_diagnosis_of_fibrosis_of_lung_now)
:named REQ1_AUXILIARY2)) ;; "pulmonary fibrosis except focal fibrotic pulmonary lesions"

(assert
(! (=> patient_has_diagnosis_of_disorder_of_lung_now@@active
      patient_has_diagnosis_of_disorder_of_lung_now)
:named REQ1_AUXILIARY3)) ;; "active pulmonary diseases"

(assert
(! (=> patient_has_diagnosis_of_disorder_of_respiratory_system_now@@excludes_asthma
      patient_has_diagnosis_of_disorder_of_respiratory_system_now)
:named REQ1_AUXILIARY4)) ;; "respiratory disorder excluding asthma"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_disorder_of_respiratory_system_now@@excludes_asthma)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has at least one other respiratory disorder with non-exhaustive examples ((α1-antitrypsin deficiency as the underlying cause of chronic obstructive pulmonary disease) OR (active tuberculosis) OR (lung cancer) OR (bronchiectasis except focal bronchiectasis) OR (sarcoidosis) OR (pulmonary fibrosis except focal fibrotic pulmonary lesions) OR (pulmonary hypertension) OR (interstitial lung diseases) OR (other active pulmonary diseases))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_lung_volume_reduction_surgery_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone lung volume reduction surgery at any time within the past 12 months.","when_to_set_to_false":"Set to false if the patient has not undergone lung volume reduction surgery within the past 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone lung volume reduction surgery within the past 12 months.","meaning":"Boolean indicating whether the patient has undergone lung volume reduction surgery within the past 12 months."} ;; "has had lung volume reduction surgery within the previous twelve months."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_has_undergone_lung_volume_reduction_surgery_inthepast12months)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had lung volume reduction surgery within the previous twelve months."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_clinically_significant_abnormalities_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinically significant abnormalities.","when_to_set_to_false":"Set to false if the patient currently does not have clinically significant abnormalities.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinically significant abnormalities.","meaning":"Boolean indicating whether the patient currently has clinically significant abnormalities."} ;; "clinically significant abnormalities"

(declare-const patient_has_finding_of_clinically_significant_abnormalities_now@@determined_by_chest_xray_or_computed_tomography_scan Bool) ;; {"when_to_set_to_true":"Set to true if the patient's clinically significant abnormalities are determined by chest X-ray or computed tomography scan.","when_to_set_to_false":"Set to false if the patient's clinically significant abnormalities are not determined by chest X-ray or computed tomography scan.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's clinically significant abnormalities are determined by chest X-ray or computed tomography scan.","meaning":"Boolean indicating whether the patient's clinically significant abnormalities are determined by chest X-ray or computed tomography scan."} ;; "as determined by chest X-ray OR computed tomography scan"

(declare-const patient_has_finding_of_clinically_significant_abnormalities_now@@not_due_to_chronic_obstructive_pulmonary_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient's clinically significant abnormalities are not due to chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient's clinically significant abnormalities are due to chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's clinically significant abnormalities are due to chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient's clinically significant abnormalities are not due to chronic obstructive pulmonary disease."} ;; "not due to chronic obstructive pulmonary disease"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_clinically_significant_abnormalities_now@@determined_by_chest_xray_or_computed_tomography_scan
      patient_has_finding_of_clinically_significant_abnormalities_now)
:named REQ3_AUXILIARY0)) ;; "as determined by chest X-ray OR computed tomography scan"

(assert
(! (=> patient_has_finding_of_clinically_significant_abnormalities_now@@not_due_to_chronic_obstructive_pulmonary_disease
      patient_has_finding_of_clinically_significant_abnormalities_now)
:named REQ3_AUXILIARY1)) ;; "not due to chronic obstructive pulmonary disease"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT have clinically significant abnormalities not due to COPD as determined by chest X-ray OR CT scan
(assert
(! (not (and patient_has_finding_of_clinically_significant_abnormalities_now@@not_due_to_chronic_obstructive_pulmonary_disease
             patient_has_finding_of_clinically_significant_abnormalities_now@@determined_by_chest_xray_or_computed_tomography_scan))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically significant abnormalities not due to chronic obstructive pulmonary disease as determined by chest X-ray OR computed tomography scan."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_inthepast12weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of chronic obstructive pulmonary disease within the past 12 weeks.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of chronic obstructive pulmonary disease within the past 12 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of chronic obstructive pulmonary disease within the past 12 weeks.","meaning":"Boolean indicating whether the patient has had a diagnosis of chronic obstructive pulmonary disease within the past 12 weeks."} ;; "chronic obstructive pulmonary disease within twelve weeks prior to Screening"
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_inthepast12weeks@@hospitalized_for_poorly_controlled Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of chronic obstructive pulmonary disease within the past 12 weeks and was hospitalized for poorly controlled disease.","when_to_set_to_false":"Set to false if the patient has had a diagnosis of chronic obstructive pulmonary disease within the past 12 weeks but was not hospitalized for poorly controlled disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was hospitalized for poorly controlled disease within the past 12 weeks.","meaning":"Boolean indicating whether the patient has had a diagnosis of chronic obstructive pulmonary disease within the past 12 weeks and was hospitalized for poorly controlled disease."} ;; "hospitalized for poorly controlled chronic obstructive pulmonary disease within twelve weeks prior to Screening"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_chronic_obstructive_lung_disease_inthepast12weeks@@hospitalized_for_poorly_controlled
      patient_has_diagnosis_of_chronic_obstructive_lung_disease_inthepast12weeks)
:named REQ4_AUXILIARY0)) ;; "hospitalized for poorly controlled chronic obstructive pulmonary disease within twelve weeks prior to Screening"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_chronic_obstructive_lung_disease_inthepast12weeks@@hospitalized_for_poorly_controlled)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been hospitalized for poorly controlled chronic obstructive pulmonary disease within twelve weeks prior to Screening."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthepast6weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an acute exacerbation of chronic obstructive pulmonary disease within the past six weeks.","when_to_set_to_false":"Set to false if the patient has not had an acute exacerbation of chronic obstructive pulmonary disease within the past six weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an acute exacerbation of chronic obstructive pulmonary disease within the past six weeks.","meaning":"Boolean indicating whether the patient has had an acute exacerbation of chronic obstructive pulmonary disease within the past six weeks."} ;; "acute worsening of chronic obstructive pulmonary disease within six weeks prior to Screening"

(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthepast6weeks@@managed_by_corticosteroid_or_antibiotic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the acute exacerbation of chronic obstructive pulmonary disease within the past six weeks was managed by the patient with corticosteroid therapy or antibiotic therapy.","when_to_set_to_false":"Set to false if the episode was not managed by the patient with corticosteroid therapy or antibiotic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the episode was managed by corticosteroid or antibiotic therapy.","meaning":"Boolean indicating whether the acute exacerbation of chronic obstructive pulmonary disease within the past six weeks was managed by corticosteroid or antibiotic therapy."} ;; "managed by the patient with corticosteroid therapy OR antibiotic therapy"

(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthepast6weeks@@requires_treatment_prescribed_by_physician Bool) ;; {"when_to_set_to_true":"Set to true if the acute exacerbation of chronic obstructive pulmonary disease within the past six weeks required treatment prescribed by a physician.","when_to_set_to_false":"Set to false if the episode did not require treatment prescribed by a physician.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the episode required treatment prescribed by a physician.","meaning":"Boolean indicating whether the acute exacerbation of chronic obstructive pulmonary disease within the past six weeks required treatment prescribed by a physician."} ;; "requires treatment prescribed by a physician"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthepast6weeks@@managed_by_corticosteroid_or_antibiotic_therapy
      patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthepast6weeks)
   :named REQ5_AUXILIARY0)) ;; "managed by the patient with corticosteroid therapy OR antibiotic therapy"

(assert
(! (=> patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthepast6weeks@@requires_treatment_prescribed_by_physician
      patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthepast6weeks)
   :named REQ5_AUXILIARY1)) ;; "requires treatment prescribed by a physician"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: poorly controlled COPD within 6 weeks prior to Screening, defined as (acute worsening managed by corticosteroid/antibiotic OR acute worsening requiring physician-prescribed treatment)
(assert
(! (not (or patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthepast6weeks@@managed_by_corticosteroid_or_antibiotic_therapy
            patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthepast6weeks@@requires_treatment_prescribed_by_physician))
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "poorly controlled chronic obstructive pulmonary disease within six weeks prior to Screening, defined as (acute worsening ... managed by corticosteroid therapy OR antibiotic therapy) OR (acute worsening ... requires treatment prescribed by a physician)"

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_lower_respiratory_tract_infection_inthepast6weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a lower respiratory tract infection within the past six weeks.","when_to_set_to_false":"Set to false if the patient has not had a lower respiratory tract infection within the past six weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a lower respiratory tract infection within the past six weeks.","meaning":"Boolean indicating whether the patient has had a lower respiratory tract infection within the past six weeks."} ;; "lower respiratory infection within six weeks prior to Screening"
(declare-const patient_has_finding_of_lower_respiratory_tract_infection_inthepast6weeks@@requires_antibiotic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the lower respiratory tract infection within the past six weeks required antibiotic therapy.","when_to_set_to_false":"Set to false if the lower respiratory tract infection within the past six weeks did not require antibiotic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether antibiotic therapy was required for the lower respiratory tract infection within the past six weeks.","meaning":"Boolean indicating whether the lower respiratory tract infection within the past six weeks required antibiotic therapy."} ;; "lower respiratory infection requiring antibiotic therapy within six weeks prior to Screening"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_lower_respiratory_tract_infection_inthepast6weeks@@requires_antibiotic_therapy
      patient_has_finding_of_lower_respiratory_tract_infection_inthepast6weeks)
:named REQ6_AUXILIARY0)) ;; "lower respiratory infection requiring antibiotic therapy within six weeks prior to Screening"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_lower_respiratory_tract_infection_inthepast6weeks@@requires_antibiotic_therapy)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a lower respiratory infection requiring antibiotic therapy within six weeks prior to Screening."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an acute exacerbation of chronic obstructive airways disease at any time in the history.","when_to_set_to_false":"Set to false if the patient has not had an acute exacerbation of chronic obstructive airways disease at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an acute exacerbation of chronic obstructive airways disease in the history.","meaning":"Boolean indicating whether the patient has had an acute exacerbation of chronic obstructive airways disease in the history."} ;; "chronic obstructive pulmonary disease exacerbation"
(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@severity_moderate_or_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an acute exacerbation of chronic obstructive airways disease in the history and the severity was moderate or severe.","when_to_set_to_false":"Set to false if the patient has had an acute exacerbation of chronic obstructive airways disease in the history and the severity was not moderate or severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity was moderate or severe.","meaning":"Boolean indicating whether the patient has had a moderate or severe acute exacerbation of chronic obstructive airways disease in the history."} ;; "moderate or severe chronic obstructive pulmonary disease exacerbation"
(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@temporalcontext_during_run_in_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an acute exacerbation of chronic obstructive airways disease in the history and the event occurred during the Run-In Period.","when_to_set_to_false":"Set to false if the patient has had an acute exacerbation of chronic obstructive airways disease in the history but the event did not occur during the Run-In Period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the event occurred during the Run-In Period.","meaning":"Boolean indicating whether the patient has had an acute exacerbation of chronic obstructive airways disease in the history and the event occurred during the Run-In Period."} ;; "during the Run-In Period"
(declare-const patient_has_finding_of_lower_respiratory_tract_infection_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a lower respiratory tract infection at any time in the history.","when_to_set_to_false":"Set to false if the patient has not had a lower respiratory tract infection at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a lower respiratory tract infection in the history.","meaning":"Boolean indicating whether the patient has had a lower respiratory tract infection in the history."} ;; "lower respiratory tract infection"
(declare-const patient_has_finding_of_lower_respiratory_tract_infection_inthehistory@@temporalcontext_during_run_in_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a lower respiratory tract infection in the history and the event occurred during the Run-In Period.","when_to_set_to_false":"Set to false if the patient has had a lower respiratory tract infection in the history but the event did not occur during the Run-In Period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the event occurred during the Run-In Period.","meaning":"Boolean indicating whether the patient has had a lower respiratory tract infection in the history and the event occurred during the Run-In Period."} ;; "during the Run-In Period"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@severity_moderate_or_severe
       patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory)
   :named REQ7_AUXILIARY0)) ;; "moderate or severe chronic obstructive pulmonary disease exacerbation"

(assert
(! (=> patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@temporalcontext_during_run_in_period
       patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory)
   :named REQ7_AUXILIARY1)) ;; "during the Run-In Period" for COPD exacerbation

(assert
(! (=> patient_has_finding_of_lower_respiratory_tract_infection_inthehistory@@temporalcontext_during_run_in_period
       patient_has_finding_of_lower_respiratory_tract_infection_inthehistory)
   :named REQ7_AUXILIARY2)) ;; "during the Run-In Period" for lower respiratory tract infection

;; Non-exhaustive example: pneumonia is an example of lower respiratory tract infection (not an equivalence, so not encoded as an equivalence here)

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion 1: moderate or severe COPD exacerbation during Run-In Period
(assert
(! (not (and patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@severity_moderate_or_severe
             patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@temporalcontext_during_run_in_period))
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has had a moderate or severe chronic obstructive pulmonary disease exacerbation during the Run-In Period"

;; Exclusion 2: lower respiratory tract infection during Run-In Period
(assert
(! (not patient_has_finding_of_lower_respiratory_tract_infection_inthehistory@@temporalcontext_during_run_in_period)
   :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has had a lower respiratory tract infection with non-exhaustive examples (pneumonia) during the Run-In Period"

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_undergone_hepatic_function_panel_now_outcome_is_abnormal Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a hepatic function panel (liver chemistry test) now and the outcome is abnormal.","when_to_set_to_false":"Set to false if the patient has undergone a hepatic function panel (liver chemistry test) now and the outcome is not abnormal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a hepatic function panel (liver chemistry test) now and the outcome is abnormal.","meaning":"Boolean indicating whether the patient has undergone a hepatic function panel (liver chemistry test) now and the outcome is abnormal."} ;; "liver chemistry test"
(declare-const patient_has_undergone_hepatic_function_panel_now_outcome_is_abnormal@@performed_at_screening_or_repeat_prior_to_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the abnormal hepatic function panel was performed at Screening (Visit 1) or upon repeat prior to randomization.","when_to_set_to_false":"Set to false if the abnormal hepatic function panel was not performed at Screening (Visit 1) or upon repeat prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal hepatic function panel was performed at Screening (Visit 1) or upon repeat prior to randomization.","meaning":"Boolean indicating whether the abnormal hepatic function panel was performed at Screening (Visit 1) or upon repeat prior to randomization."} ;; "at Screening (Visit 1) OR upon repeat prior to randomization"
(declare-const patient_has_undergone_biochemical_test_now_outcome_is_abnormal Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a biochemical test now and the outcome is abnormal.","when_to_set_to_false":"Set to false if the patient has undergone a biochemical test now and the outcome is not abnormal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a biochemical test now and the outcome is abnormal.","meaning":"Boolean indicating whether the patient has undergone a biochemical test now and the outcome is abnormal."} ;; "biochemical test"
(declare-const patient_has_undergone_biochemical_test_now_outcome_is_abnormal@@performed_at_screening_or_repeat_prior_to_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the abnormal biochemical test was performed at Screening (Visit 1) or upon repeat prior to randomization.","when_to_set_to_false":"Set to false if the abnormal biochemical test was not performed at Screening (Visit 1) or upon repeat prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal biochemical test was performed at Screening (Visit 1) or upon repeat prior to randomization.","meaning":"Boolean indicating whether the abnormal biochemical test was performed at Screening (Visit 1) or upon repeat prior to randomization."} ;; "at Screening (Visit 1) OR upon repeat prior to randomization"
(declare-const patient_has_undergone_hematology_test_now_outcome_is_abnormal Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a hematology test now and the outcome is abnormal.","when_to_set_to_false":"Set to false if the patient has undergone a hematology test now and the outcome is not abnormal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a hematology test now and the outcome is abnormal.","meaning":"Boolean indicating whether the patient has undergone a hematology test now and the outcome is abnormal."} ;; "haematology test"
(declare-const patient_has_undergone_hematology_test_now_outcome_is_abnormal@@performed_at_screening_or_repeat_prior_to_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the abnormal hematology test was performed at Screening (Visit 1) or upon repeat prior to randomization.","when_to_set_to_false":"Set to false if the abnormal hematology test was not performed at Screening (Visit 1) or upon repeat prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal hematology test was performed at Screening (Visit 1) or upon repeat prior to randomization.","meaning":"Boolean indicating whether the abnormal hematology test was performed at Screening (Visit 1) or upon repeat prior to randomization."} ;; "at Screening (Visit 1) OR upon repeat prior to randomization"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_undergone_hepatic_function_panel_now_outcome_is_abnormal@@performed_at_screening_or_repeat_prior_to_randomization
      patient_has_undergone_hepatic_function_panel_now_outcome_is_abnormal)
   :named REQ8_AUXILIARY0)) ;; "at Screening (Visit 1) OR upon repeat prior to randomization" for liver chemistry test

(assert
(! (=> patient_has_undergone_biochemical_test_now_outcome_is_abnormal@@performed_at_screening_or_repeat_prior_to_randomization
      patient_has_undergone_biochemical_test_now_outcome_is_abnormal)
   :named REQ8_AUXILIARY1)) ;; "at Screening (Visit 1) OR upon repeat prior to randomization" for biochemical test

(assert
(! (=> patient_has_undergone_hematology_test_now_outcome_is_abnormal@@performed_at_screening_or_repeat_prior_to_randomization
      patient_has_undergone_hematology_test_now_outcome_is_abnormal)
   :named REQ8_AUXILIARY2)) ;; "at Screening (Visit 1) OR upon repeat prior to randomization" for haematology test

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_undergone_hepatic_function_panel_now_outcome_is_abnormal@@performed_at_screening_or_repeat_prior_to_randomization)
   :named REQ8_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has an abnormal, clinically significant finding in any liver chemistry test at Screening (Visit 1) OR upon repeat prior to randomization."

(assert
(! (not patient_has_undergone_biochemical_test_now_outcome_is_abnormal@@performed_at_screening_or_repeat_prior_to_randomization)
   :named REQ8_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has an abnormal, clinically significant finding in any biochemical test at Screening (Visit 1) OR upon repeat prior to randomization."

(assert
(! (not patient_has_undergone_hematology_test_now_outcome_is_abnormal@@performed_at_screening_or_repeat_prior_to_randomization)
   :named REQ8_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has an abnormal, clinically significant finding in any haematology test at Screening (Visit 1) OR upon repeat prior to randomization."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_abnormal_clinically_significant_electrocardiogram_finding_at_screening_or_repeat_prior_to_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has an abnormal, clinically significant electrocardiogram finding at Screening (Visit 1) or upon repeat prior to randomization.","when_to_set_to_false":"Set to false if the patient does not have an abnormal, clinically significant electrocardiogram finding at Screening (Visit 1) nor upon repeat prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has an abnormal, clinically significant electrocardiogram finding at Screening (Visit 1) or upon repeat prior to randomization.","meaning":"Boolean indicating whether the patient has an abnormal, clinically significant electrocardiogram finding at Screening (Visit 1) or upon repeat prior to randomization."} ;; "an abnormal, clinically significant electrocardiogram finding at Screening (Visit 1) OR upon repeat prior to randomization"

(declare-const patient_has_abnormal_clinically_significant_electrocardiogram_finding_at_screening_or_repeat_prior_to_randomization@@at_screening_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the abnormal, clinically significant electrocardiogram finding occurred at Screening (Visit 1).","when_to_set_to_false":"Set to false if the abnormal, clinically significant electrocardiogram finding did not occur at Screening (Visit 1).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal, clinically significant electrocardiogram finding occurred at Screening (Visit 1).","meaning":"Boolean indicating whether the abnormal, clinically significant electrocardiogram finding occurred at Screening (Visit 1)."} ;; "at Screening (Visit 1)"

(declare-const patient_has_abnormal_clinically_significant_electrocardiogram_finding_at_screening_or_repeat_prior_to_randomization@@on_repeat_prior_to_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the abnormal, clinically significant electrocardiogram finding occurred upon repeat prior to randomization.","when_to_set_to_false":"Set to false if the abnormal, clinically significant electrocardiogram finding did not occur upon repeat prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal, clinically significant electrocardiogram finding occurred upon repeat prior to randomization.","meaning":"Boolean indicating whether the abnormal, clinically significant electrocardiogram finding occurred upon repeat prior to randomization."} ;; "upon repeat prior to randomization"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; The umbrella variable is true if either qualifier is true (definition from requirement)
(assert
(! (= patient_has_abnormal_clinically_significant_electrocardiogram_finding_at_screening_or_repeat_prior_to_randomization
     (or patient_has_abnormal_clinically_significant_electrocardiogram_finding_at_screening_or_repeat_prior_to_randomization@@at_screening_visit_1
         patient_has_abnormal_clinically_significant_electrocardiogram_finding_at_screening_or_repeat_prior_to_randomization@@on_repeat_prior_to_randomization))
:named REQ9_AUXILIARY0)) ;; "an abnormal, clinically significant electrocardiogram finding at Screening (Visit 1) OR upon repeat prior to randomization"

;; Qualifier variables imply corresponding umbrella variable
(assert
(! (=> patient_has_abnormal_clinically_significant_electrocardiogram_finding_at_screening_or_repeat_prior_to_randomization@@at_screening_visit_1
      patient_has_abnormal_clinically_significant_electrocardiogram_finding_at_screening_or_repeat_prior_to_randomization)
:named REQ9_AUXILIARY1)) ;; "at Screening (Visit 1)"

(assert
(! (=> patient_has_abnormal_clinically_significant_electrocardiogram_finding_at_screening_or_repeat_prior_to_randomization@@on_repeat_prior_to_randomization
      patient_has_abnormal_clinically_significant_electrocardiogram_finding_at_screening_or_repeat_prior_to_randomization)
:named REQ9_AUXILIARY2)) ;; "upon repeat prior to randomization"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_abnormal_clinically_significant_electrocardiogram_finding_at_screening_or_repeat_prior_to_randomization)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an abnormal, clinically significant electrocardiogram finding at Screening (Visit 1) OR upon repeat prior to randomization."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_abnormal_clinically_significant_holter_monitor_finding_at_screening_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has an abnormal, clinically significant Holter monitor finding at Screening (Visit 1).","when_to_set_to_false":"Set to false if the patient does not have an abnormal, clinically significant Holter monitor finding at Screening (Visit 1).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has an abnormal, clinically significant Holter monitor finding at Screening (Visit 1).","meaning":"Boolean indicating whether the patient has an abnormal, clinically significant Holter monitor finding at Screening (Visit 1)."} ;; "the patient has an abnormal, clinically significant Holter monitor finding at Screening (Visit 1)"
(declare-const patient_has_abnormal_clinically_significant_holter_monitor_finding_upon_repeat_prior_to_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has an abnormal, clinically significant Holter monitor finding upon repeat prior to randomization.","when_to_set_to_false":"Set to false if the patient does not have an abnormal, clinically significant Holter monitor finding upon repeat prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has an abnormal, clinically significant Holter monitor finding upon repeat prior to randomization.","meaning":"Boolean indicating whether the patient has an abnormal, clinically significant Holter monitor finding upon repeat prior to randomization."} ;; "the patient has an abnormal, clinically significant Holter monitor finding upon repeat prior to randomization"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not (or patient_has_abnormal_clinically_significant_holter_monitor_finding_at_screening_visit_1
            patient_has_abnormal_clinically_significant_holter_monitor_finding_upon_repeat_prior_to_randomization))
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has an abnormal, clinically significant Holter monitor finding at Screening (Visit 1)) OR (the patient has an abnormal, clinically significant Holter monitor finding upon repeat prior to randomization)."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of cardiovascular disease at any time in their history, including currently.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of cardiovascular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of cardiovascular disease.","meaning":"Boolean indicating whether the patient has a diagnosis of cardiovascular disease at any time in their history (including currently)."} ;; "cardiovascular disease"
(declare-const patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory@@clinically_significant_and_unstable_in_opinion_of_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cardiovascular disease is clinically significant and unstable in the opinion of the Investigator.","when_to_set_to_false":"Set to false if the patient's cardiovascular disease is not clinically significant and/or not unstable in the opinion of the Investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cardiovascular disease is clinically significant and unstable in the opinion of the Investigator.","meaning":"Boolean indicating whether the patient's cardiovascular disease is clinically significant and unstable in the opinion of the Investigator."} ;; "clinically significant and unstable cardiovascular disease in the opinion of the Investigator"
(declare-const patient_has_diagnosis_of_heart_failure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of heart failure at any time in their history, including currently.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of heart failure.","meaning":"Boolean indicating whether the patient has a diagnosis of heart failure at any time in their history (including currently)."} ;; "heart failure"
(declare-const patient_has_diagnosis_of_heart_failure_inthehistory@@new_york_heart_association_class_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's heart failure is New York Heart Association Class IV.","when_to_set_to_false":"Set to false if the patient's heart failure is not New York Heart Association Class IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the heart failure is New York Heart Association Class IV.","meaning":"Boolean indicating whether the patient's heart failure is New York Heart Association Class IV."} ;; "New York Heart Association Class IV heart failure"
(declare-const patient_has_diagnosis_of_poor_hypertension_control_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of uncontrolled hypertension at any time in their history, including currently.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of uncontrolled hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of uncontrolled hypertension.","meaning":"Boolean indicating whether the patient has a diagnosis of uncontrolled hypertension at any time in their history (including currently)."} ;; "uncontrolled hypertension"
(declare-const patient_has_diagnosis_of_poor_hypertension_control_inthehistory@@clinically_significant_and_unstable_in_opinion_of_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient's uncontrolled hypertension is clinically significant and unstable in the opinion of the Investigator.","when_to_set_to_false":"Set to false if the patient's uncontrolled hypertension is not clinically significant and/or not unstable in the opinion of the Investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the uncontrolled hypertension is clinically significant and unstable in the opinion of the Investigator.","meaning":"Boolean indicating whether the patient's uncontrolled hypertension is clinically significant and unstable in the opinion of the Investigator."} ;; "clinically significant and unstable uncontrolled hypertension in the opinion of the Investigator"
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_inthehistory_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percent value if a numeric measurement of left ventricular ejection fraction recorded at any time in the patient's history (including currently) is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percent representing the patient's left ventricular ejection fraction recorded at any time in their history (including currently)."} ;; "known left ventricular ejection fraction less than 30 percent"
(declare-const patient_has_diagnosis_of_disorder_of_nervous_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of neurological disease at any time in their history, including currently.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of neurological disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of neurological disease.","meaning":"Boolean indicating whether the patient has a diagnosis of neurological disease at any time in their history (including currently)."} ;; "neurological disease"
(declare-const patient_has_diagnosis_of_mental_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of psychiatric disease at any time in their history, including currently.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of psychiatric disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of psychiatric disease.","meaning":"Boolean indicating whether the patient has a diagnosis of psychiatric disease at any time in their history (including currently)."} ;; "psychiatric disease"
(declare-const patient_has_diagnosis_of_kidney_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of renal disease at any time in their history, including currently.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of renal disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of renal disease.","meaning":"Boolean indicating whether the patient has a diagnosis of renal disease at any time in their history (including currently)."} ;; "renal disease"
(declare-const patient_has_diagnosis_of_kidney_disease_inthehistory@@clinically_significant_and_unstable_in_opinion_of_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient's renal disease is clinically significant and unstable in the opinion of the Investigator.","when_to_set_to_false":"Set to false if the patient's renal disease is not clinically significant and/or not unstable in the opinion of the Investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the renal disease is clinically significant and unstable in the opinion of the Investigator.","meaning":"Boolean indicating whether the patient's renal disease is clinically significant and unstable in the opinion of the Investigator."} ;; "clinically significant and unstable renal disease in the opinion of the Investigator"
(declare-const patient_has_diagnosis_of_disease_of_liver_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of hepatic disease at any time in their history, including currently.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of hepatic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of hepatic disease.","meaning":"Boolean indicating whether the patient has a diagnosis of hepatic disease at any time in their history (including currently)."} ;; "hepatic disease"
(declare-const patient_has_diagnosis_of_disease_of_liver_inthehistory@@clinically_significant_and_unstable_in_opinion_of_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hepatic disease is clinically significant and unstable in the opinion of the Investigator.","when_to_set_to_false":"Set to false if the patient's hepatic disease is not clinically significant and/or not unstable in the opinion of the Investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hepatic disease is clinically significant and unstable in the opinion of the Investigator.","meaning":"Boolean indicating whether the patient's hepatic disease is clinically significant and unstable in the opinion of the Investigator."} ;; "clinically significant and unstable hepatic disease in the opinion of the Investigator"
(declare-const patient_has_diagnosis_of_disorder_of_immune_function_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of immunological disease at any time in their history, including currently.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of immunological disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of immunological disease.","meaning":"Boolean indicating whether the patient has a diagnosis of immunological disease at any time in their history (including currently)."} ;; "immunological disease"
(declare-const patient_has_diagnosis_of_disorder_of_immune_function_inthehistory@@clinically_significant_and_unstable_in_opinion_of_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient's immunological disease is clinically significant and unstable in the opinion of the Investigator.","when_to_set_to_false":"Set to false if the patient's immunological disease is not clinically significant and/or not unstable in the opinion of the Investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the immunological disease is clinically significant and unstable in the opinion of the Investigator.","meaning":"Boolean indicating whether the patient's immunological disease is clinically significant and unstable in the opinion of the Investigator."} ;; "clinically significant and unstable immunological disease in the opinion of the Investigator"
(declare-const patient_has_diagnosis_of_disorder_of_endocrine_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of endocrine disease at any time in their history, including currently.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of endocrine disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of endocrine disease.","meaning":"Boolean indicating whether the patient has a diagnosis of endocrine disease at any time in their history (including currently)."} ;; "endocrine disease"
(declare-const patient_has_diagnosis_of_disorder_of_endocrine_system_inthehistory@@clinically_significant_and_unstable_in_opinion_of_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient's endocrine disease is clinically significant and unstable in the opinion of the Investigator.","when_to_set_to_false":"Set to false if the patient's endocrine disease is not clinically significant and/or not unstable in the opinion of the Investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the endocrine disease is clinically significant and unstable in the opinion of the Investigator.","meaning":"Boolean indicating whether the patient's endocrine disease is clinically significant and unstable in the opinion of the Investigator."} ;; "clinically significant and unstable endocrine disease in the opinion of the Investigator"
(declare-const patient_has_diagnosis_of_diabetic_poor_control_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of uncontrolled diabetes mellitus at any time in their history, including currently.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of uncontrolled diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of uncontrolled diabetes mellitus.","meaning":"Boolean indicating whether the patient has a diagnosis of uncontrolled diabetes mellitus at any time in their history (including currently)."} ;; "uncontrolled diabetes mellitus"
(declare-const patient_has_diagnosis_of_diabetic_poor_control_inthehistory@@clinically_significant_and_unstable_in_opinion_of_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient's uncontrolled diabetes mellitus is clinically significant and unstable in the opinion of the Investigator.","when_to_set_to_false":"Set to false if the patient's uncontrolled diabetes mellitus is not clinically significant and/or not unstable in the opinion of the Investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the uncontrolled diabetes mellitus is clinically significant and unstable in the opinion of the Investigator.","meaning":"Boolean indicating whether the patient's uncontrolled diabetes mellitus is clinically significant and unstable in the opinion of the Investigator."} ;; "clinically significant and unstable uncontrolled diabetes mellitus in the opinion of the Investigator"
(declare-const patient_has_diagnosis_of_disorder_of_thyroid_gland_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of thyroid disease at any time in their history, including currently.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of thyroid disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of thyroid disease.","meaning":"Boolean indicating whether the patient has a diagnosis of thyroid disease at any time in their history (including currently)."} ;; "thyroid disease"
(declare-const patient_has_diagnosis_of_disorder_of_thyroid_gland_inthehistory@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's thyroid disease is uncontrolled.","when_to_set_to_false":"Set to false if the patient's thyroid disease is controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the thyroid disease is uncontrolled.","meaning":"Boolean indicating whether the patient's thyroid disease is uncontrolled."} ;; "uncontrolled thyroid disease"
(declare-const patient_has_diagnosis_of_peptic_ulcer_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of peptic ulcer disease at any time in their history, including currently.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of peptic ulcer disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of peptic ulcer disease.","meaning":"Boolean indicating whether the patient has a diagnosis of peptic ulcer disease at any time in their history (including currently)."} ;; "peptic ulcer disease"
(declare-const patient_has_finding_of_haematological_abnormality_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis or finding of haematological abnormality at any time in their history, including currently.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis or finding of haematological abnormality.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis or finding of haematological abnormality.","meaning":"Boolean indicating whether the patient has a diagnosis or finding of haematological abnormality at any time in their history (including currently)."} ;; "haematological abnormality"
(declare-const patient_has_finding_of_haematological_abnormality_inthehistory@@clinically_significant_and_unstable_in_opinion_of_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient's haematological abnormality is clinically significant and unstable in the opinion of the Investigator.","when_to_set_to_false":"Set to false if the patient's haematological abnormality is not clinically significant and/or not unstable in the opinion of the Investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the haematological abnormality is clinically significant and unstable in the opinion of the Investigator.","meaning":"Boolean indicating whether the patient's haematological abnormality is clinically significant and unstable in the opinion of the Investigator."} ;; "clinically significant and unstable haematological abnormality in the opinion of the Investigator"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Non-exhaustive examples for cardiovascular disease
(assert
(! (=> (or
        patient_has_diagnosis_of_heart_failure_inthehistory@@new_york_heart_association_class_iv
        patient_has_diagnosis_of_poor_hypertension_control_inthehistory@@clinically_significant_and_unstable_in_opinion_of_investigator
        (< patient_left_ventricular_ejection_fraction_value_recorded_inthehistory_withunit_percent 30)
      )
      patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory@@clinically_significant_and_unstable_in_opinion_of_investigator)
:named REQ11_AUXILIARY0)) ;; "cardiovascular disease with non-exhaustive examples ((patients requiring implantable cardioverter-defibrillator) OR (patients requiring pacemaker with a ventricular pace rate set at greater than 60 beats per minute) OR (uncontrolled hypertension) OR (New York Heart Association Class IV heart failure) OR (known left ventricular ejection fraction less than 30 percent))"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory@@clinically_significant_and_unstable_in_opinion_of_investigator
       patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory)
:named REQ11_AUXILIARY1)) ;; "clinically significant and unstable cardiovascular disease in the opinion of the Investigator"

(assert
(! (=> patient_has_diagnosis_of_heart_failure_inthehistory@@new_york_heart_association_class_iv
       patient_has_diagnosis_of_heart_failure_inthehistory)
:named REQ11_AUXILIARY2)) ;; "New York Heart Association Class IV heart failure"

(assert
(! (=> patient_has_diagnosis_of_poor_hypertension_control_inthehistory@@clinically_significant_and_unstable_in_opinion_of_investigator
       patient_has_diagnosis_of_poor_hypertension_control_inthehistory)
:named REQ11_AUXILIARY3)) ;; "clinically significant and unstable uncontrolled hypertension in the opinion of the Investigator"

(assert
(! (=> patient_has_diagnosis_of_kidney_disease_inthehistory@@clinically_significant_and_unstable_in_opinion_of_investigator
       patient_has_diagnosis_of_kidney_disease_inthehistory)
:named REQ11_AUXILIARY4)) ;; "clinically significant and unstable renal disease in the opinion of the Investigator"

(assert
(! (=> patient_has_diagnosis_of_disease_of_liver_inthehistory@@clinically_significant_and_unstable_in_opinion_of_investigator
       patient_has_diagnosis_of_disease_of_liver_inthehistory)
:named REQ11_AUXILIARY5)) ;; "clinically significant and unstable hepatic disease in the opinion of the Investigator"

(assert
(! (=> patient_has_diagnosis_of_disorder_of_immune_function_inthehistory@@clinically_significant_and_unstable_in_opinion_of_investigator
       patient_has_diagnosis_of_disorder_of_immune_function_inthehistory)
:named REQ11_AUXILIARY6)) ;; "clinically significant and unstable immunological disease in the opinion of the Investigator"

(assert
(! (=> patient_has_diagnosis_of_disorder_of_endocrine_system_inthehistory@@clinically_significant_and_unstable_in_opinion_of_investigator
       patient_has_diagnosis_of_disorder_of_endocrine_system_inthehistory)
:named REQ11_AUXILIARY7)) ;; "clinically significant and unstable endocrine disease in the opinion of the Investigator"

(assert
(! (=> patient_has_diagnosis_of_diabetic_poor_control_inthehistory@@clinically_significant_and_unstable_in_opinion_of_investigator
       patient_has_diagnosis_of_diabetic_poor_control_inthehistory)
:named REQ11_AUXILIARY8)) ;; "clinically significant and unstable uncontrolled diabetes mellitus in the opinion of the Investigator"

(assert
(! (=> patient_has_finding_of_haematological_abnormality_inthehistory@@clinically_significant_and_unstable_in_opinion_of_investigator
       patient_has_finding_of_haematological_abnormality_inthehistory)
:named REQ11_AUXILIARY9)) ;; "clinically significant and unstable haematological abnormality in the opinion of the Investigator"

;; Non-exhaustive examples for endocrine disease
(assert
(! (=> (or
        patient_has_diagnosis_of_diabetic_poor_control_inthehistory@@clinically_significant_and_unstable_in_opinion_of_investigator
        patient_has_diagnosis_of_disorder_of_thyroid_gland_inthehistory@@uncontrolled
      )
      patient_has_diagnosis_of_disorder_of_endocrine_system_inthehistory@@clinically_significant_and_unstable_in_opinion_of_investigator)
:named REQ11_AUXILIARY10)) ;; "endocrine disease with non-exhaustive examples ((uncontrolled diabetes mellitus) OR (uncontrolled thyroid disease))"

;; Qualifier variable for uncontrolled thyroid disease
(assert
(! (=> patient_has_diagnosis_of_disorder_of_thyroid_gland_inthehistory@@uncontrolled
       patient_has_diagnosis_of_disorder_of_thyroid_gland_inthehistory)
:named REQ11_AUXILIARY11)) ;; "uncontrolled thyroid disease"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not
    (or
      patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory@@clinically_significant_and_unstable_in_opinion_of_investigator
      patient_has_diagnosis_of_disorder_of_nervous_system_inthehistory
      patient_has_diagnosis_of_mental_disorder_inthehistory
      patient_has_diagnosis_of_kidney_disease_inthehistory@@clinically_significant_and_unstable_in_opinion_of_investigator
      patient_has_diagnosis_of_disease_of_liver_inthehistory@@clinically_significant_and_unstable_in_opinion_of_investigator
      patient_has_diagnosis_of_disorder_of_immune_function_inthehistory@@clinically_significant_and_unstable_in_opinion_of_investigator
      patient_has_diagnosis_of_disorder_of_endocrine_system_inthehistory@@clinically_significant_and_unstable_in_opinion_of_investigator
      patient_has_diagnosis_of_peptic_ulcer_inthehistory
      patient_has_finding_of_haematological_abnormality_inthehistory@@clinically_significant_and_unstable_in_opinion_of_investigator
    ))
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has historical evidence of clinically significant and unstable disease in the opinion of the Investigator with non-exhaustive examples..."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const carcinoma_remission_duration_value_in_years Real) ;; {"when_to_set_to_value":"Set to the number of years the patient's carcinoma has been in complete remission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how long the patient's carcinoma has been in complete remission.","meaning":"Numeric value indicating the duration in years that the patient's carcinoma has been in complete remission."} ;; "complete remission for at least 5 years"

(declare-const patient_has_diagnosis_of_malignant_epithelial_neoplasm_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant epithelial neoplasm (carcinoma).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant epithelial neoplasm (carcinoma).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant epithelial neoplasm (carcinoma).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant epithelial neoplasm (carcinoma)."} ;; "carcinoma"

(declare-const patient_has_diagnosis_of_malignant_epithelial_neoplasm_now@@not_in_complete_remission_for_at_least_5_years Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant epithelial neoplasm (carcinoma) and the carcinoma has not been in complete remission for at least 5 years.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of malignant epithelial neoplasm (carcinoma) and the carcinoma has been in complete remission for at least 5 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the carcinoma has been in complete remission for at least 5 years.","meaning":"Boolean indicating whether the patient currently has carcinoma and the carcinoma has not been in complete remission for at least 5 years."} ;; "carcinoma NOT in complete remission for at least 5 years"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Definition: carcinoma NOT in complete remission for at least 5 years
(assert
(! (= patient_has_diagnosis_of_malignant_epithelial_neoplasm_now@@not_in_complete_remission_for_at_least_5_years
     (and patient_has_diagnosis_of_malignant_epithelial_neoplasm_now
          (< carcinoma_remission_duration_value_in_years 5)))
:named REQ12_AUXILIARY0)) ;; "carcinoma NOT in complete remission for at least 5 years"

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_diagnosis_of_malignant_epithelial_neoplasm_now@@not_in_complete_remission_for_at_least_5_years
      patient_has_diagnosis_of_malignant_epithelial_neoplasm_now)
:named REQ12_AUXILIARY1)) ;; "carcinoma NOT in complete remission for at least 5 years" implies "carcinoma"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_diagnosis_of_malignant_epithelial_neoplasm_now@@not_in_complete_remission_for_at_least_5_years)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has carcinoma NOT in complete remission for at least 5 years."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_finding_of_allergy_inthehistory@@to_any_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had allergy at any time in the past specifically to any of the study medications.","when_to_set_to_false":"Set to false if the patient has never had allergy at any time in the past specifically to any of the study medications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had allergy specifically to any of the study medications.","meaning":"Boolean indicating whether the patient has ever had allergy specifically to any of the study medications."} ;; "history of allergy to any of the study medications"

(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_any_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's historical hypersensitivity was specifically to any of the study medications.","when_to_set_to_false":"Set to false if the patient's historical hypersensitivity was not to any of the study medications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypersensitivity was to any of the study medications.","meaning":"Boolean indicating whether the patient's historical hypersensitivity was to any of the study medications."} ;; "history of hypersensitivity to any of the study medications"

(declare-const patient_has_hypersensitivity_to_acetylcholine_receptor_antagonist_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had hypersensitivity to an anticholinergic agent (acetylcholine receptor antagonist) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had hypersensitivity to an anticholinergic agent at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had hypersensitivity to an anticholinergic agent.","meaning":"Boolean indicating whether the patient has ever had hypersensitivity to an anticholinergic agent."} ;; "anticholinergic agent"

(declare-const patient_has_finding_of_allergy_inthehistory@@to_inhalation_powder_component Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had allergy at any time in the past specifically to components of the inhalation powder.","when_to_set_to_false":"Set to false if the patient has never had allergy at any time in the past specifically to components of the inhalation powder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had allergy specifically to components of the inhalation powder.","meaning":"Boolean indicating whether the patient has ever had allergy specifically to components of the inhalation powder."} ;; "history of allergy to components of the inhalation powder"

(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_inhalation_powder_component Bool) ;; {"when_to_set_to_true":"Set to true if the patient's historical hypersensitivity was specifically to components of the inhalation powder.","when_to_set_to_false":"Set to false if the patient's historical hypersensitivity was not to components of the inhalation powder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypersensitivity was to components of the inhalation powder.","meaning":"Boolean indicating whether the patient's historical hypersensitivity was to components of the inhalation powder."} ;; "history of hypersensitivity to components of the inhalation powder"

(declare-const patient_has_finding_of_narrow_angle_glaucoma_now@@contraindicates_participation_per_study_physician Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has narrow-angle glaucoma and, in the opinion of the study physician, this condition contraindicates study participation or use of an inhaled anticholinergic agent.","when_to_set_to_false":"Set to false if the patient currently has narrow-angle glaucoma but, in the opinion of the study physician, this condition does not contraindicate study participation or use of an inhaled anticholinergic agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's narrow-angle glaucoma contraindicates study participation or use of an inhaled anticholinergic agent per study physician's opinion.","meaning":"Boolean indicating whether, in the opinion of the study physician, the patient's narrow-angle glaucoma contraindicates study participation or use of an inhaled anticholinergic agent."} ;; "narrow-angle glaucoma that, in the opinion of the study physician, contraindicates study participation or use of an inhaled anticholinergic agent"

(declare-const patient_has_finding_of_prostatic_hypertrophy_now@@contraindicates_participation_per_study_physician Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has prostatic hypertrophy and, in the opinion of the study physician, this condition contraindicates study participation or use of an inhaled anticholinergic agent.","when_to_set_to_false":"Set to false if the patient currently has prostatic hypertrophy but, in the opinion of the study physician, this condition does not contraindicate study participation or use of an inhaled anticholinergic agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's prostatic hypertrophy contraindicates study participation or use of an inhaled anticholinergic agent per study physician's opinion.","meaning":"Boolean indicating whether, in the opinion of the study physician, the patient's prostatic hypertrophy contraindicates study participation or use of an inhaled anticholinergic agent."} ;; "prostatic hypertrophy that, in the opinion of the study physician, contraindicates study participation or use of an inhaled anticholinergic agent"

(declare-const patient_has_finding_of_bladder_neck_obstruction_now@@contraindicates_participation_per_study_physician Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bladder neck obstruction and, in the opinion of the study physician, this condition contraindicates study participation or use of an inhaled anticholinergic agent.","when_to_set_to_false":"Set to false if the patient currently has bladder neck obstruction but, in the opinion of the study physician, this condition does not contraindicate study participation or use of an inhaled anticholinergic agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's bladder neck obstruction contraindicates study participation or use of an inhaled anticholinergic agent per study physician's opinion.","meaning":"Boolean indicating whether, in the opinion of the study physician, the patient's bladder neck obstruction contraindicates study participation or use of an inhaled anticholinergic agent."} ;; "bladder neck obstruction that, in the opinion of the study physician, contraindicates study participation or use of an inhaled anticholinergic agent"

(declare-const patient_has_finding_of_allergy_to_cow_s_milk_protein_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had allergy to cow's milk protein (milk protein allergy) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had allergy to cow's milk protein at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had allergy to cow's milk protein.","meaning":"Boolean indicating whether the patient has ever had allergy to cow's milk protein."} ;; "history of milk protein allergy"

(declare-const patient_has_finding_of_allergy_to_cow_s_milk_protein_inthehistory@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's historical allergy to cow's milk protein was severe.","when_to_set_to_false":"Set to false if the patient's historical allergy to cow's milk protein was not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergy was severe.","meaning":"Boolean indicating whether the patient's historical allergy to cow's milk protein was severe."} ;; "history of severe milk protein allergy"

(declare-const patient_has_finding_of_allergy_to_cow_s_milk_protein_inthehistory@@contraindicates_participation_per_investigator Bool) ;; {"when_to_set_to_true":"Set to true if, in the opinion of the Investigator, the patient's historical allergy to cow's milk protein contraindicates participation.","when_to_set_to_false":"Set to false if, in the opinion of the Investigator, the allergy does not contraindicate participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergy contraindicates participation per Investigator's opinion.","meaning":"Boolean indicating whether, in the opinion of the Investigator, the patient's historical allergy to cow's milk protein contraindicates participation."} ;; "history of severe milk protein allergy that, in the opinion of the Investigator, contraindicates the patient's participation"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Non-exhaustive examples for study medication allergy/hypersensitivity
(assert
(! (=> (or patient_has_hypersensitivity_to_acetylcholine_receptor_antagonist_inthehistory)
       patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_any_study_medication)
:named REQ13_AUXILIARY0)) ;; "with non-exhaustive examples (anticholinergic agent)"

;; Non-exhaustive examples for inhalation powder component allergy/hypersensitivity
;; (No specific example variables provided for lactose or magnesium stearate, so no auxiliary assertion needed)

;; ===================== Constraint Assertions (REQ 13) =====================
;; Component 0: history of allergy OR hypersensitivity to any study medication
(assert
(! (not (or patient_has_finding_of_allergy_inthehistory@@to_any_study_medication
            patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_any_study_medication))
    :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "history of allergy OR hypersensitivity to any of the study medications"

;; Component 1: history of allergy OR hypersensitivity to components of inhalation powder
(assert
(! (not (or patient_has_finding_of_allergy_inthehistory@@to_inhalation_powder_component
            patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_inhalation_powder_component))
    :named REQ13_COMPONENT1_OTHER_REQUIREMENTS)) ;; "history of allergy OR hypersensitivity to components of the inhalation powder"

;; Component 2: medical condition (narrow-angle glaucoma, prostatic hypertrophy, bladder neck obstruction) that, in the opinion of the study physician, contraindicates study participation OR use of an inhaled anticholinergic agent
(assert
(! (not (or patient_has_finding_of_narrow_angle_glaucoma_now@@contraindicates_participation_per_study_physician
            patient_has_finding_of_prostatic_hypertrophy_now@@contraindicates_participation_per_study_physician
            patient_has_finding_of_bladder_neck_obstruction_now@@contraindicates_participation_per_study_physician))
    :named REQ13_COMPONENT2_OTHER_REQUIREMENTS)) ;; "medical condition with non-exhaustive examples (narrow-angle glaucoma, prostatic hypertrophy, bladder neck obstruction) that, in the opinion of the study physician, contraindicates study participation OR use of an inhaled anticholinergic agent"

;; Component 3: history of severe milk protein allergy that, in the opinion of the Investigator, contraindicates the patient's participation
(assert
(! (not (and patient_has_finding_of_allergy_to_cow_s_milk_protein_inthehistory@@severe
             patient_has_finding_of_allergy_to_cow_s_milk_protein_inthehistory@@contraindicates_participation_per_investigator))
    :named REQ13_COMPONENT3_OTHER_REQUIREMENTS)) ;; "history of severe milk protein allergy that, in the opinion of the Investigator, contraindicates the patient's participation"

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_alcohol_abuse_inthepast2years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a known or suspected history of alcohol abuse that occurred within the past 2 years.","when_to_set_to_false":"Set to false if the patient does not have a known or suspected history of alcohol abuse within the past 2 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of alcohol abuse within the past 2 years.","meaning":"Boolean indicating whether the patient has a history of alcohol abuse within the past 2 years."} ;; "alcohol abuse in the last 2 years"

(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthepast2years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a known or suspected history of drug abuse that occurred within the past 2 years.","when_to_set_to_false":"Set to false if the patient does not have a known or suspected history of drug abuse within the past 2 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of drug abuse within the past 2 years.","meaning":"Boolean indicating whether the patient has a history of drug abuse within the past 2 years."} ;; "drug abuse in the last 2 years"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_finding_of_alcohol_abuse_inthepast2years)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known history of alcohol abuse in the last 2 years."

(assert
(! (not patient_has_finding_of_alcohol_abuse_inthepast2years)
:named REQ14_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a suspected history of alcohol abuse in the last 2 years."

(assert
(! (not patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthepast2years)
:named REQ14_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known history of drug abuse in the last 2 years."

(assert
(! (not patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthepast2years)
:named REQ14_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a suspected history of drug abuse in the last 2 years."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient's sex is female at the current time."} ;; "the patient is a woman"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently pregnant.","when_to_set_to_false":"Set to false if the patient is documented as not currently pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently lactating.","when_to_set_to_false":"Set to false if the patient is documented as not currently lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient is currently lactating."} ;; "the patient is lactating"
(declare-const patient_is_able_to_be_pregnant_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as planning or able to become pregnant in the future.","when_to_set_to_false":"Set to false if the patient is documented as not planning or not able to become pregnant in the future.","when_to_set_to_null":"Set to null if the patient's future pregnancy plans or ability are unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient plans or is able to become pregnant in the future."} ;; "the patient plans to become pregnant"

;; ===================== Constraint Assertions (REQ 15) =====================
;; Exclusion: patient is a woman who is currently pregnant
(assert
(! (not (and patient_sex_is_female_now patient_is_pregnant_now))
:named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman who is pregnant."

;; Exclusion: patient is a woman who is currently lactating
(assert
(! (not (and patient_sex_is_female_now patient_is_lactating_now))
:named REQ15_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman who is lactating."

;; Exclusion: patient is a woman who plans to become pregnant
(assert
(! (not (and patient_sex_is_female_now patient_is_able_to_be_pregnant_inthefuture))
:named REQ15_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is a woman who plans to become pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_is_exposed_to_albuterol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to albuterol (e.g., receiving albuterol therapy now).","when_to_set_to_false":"Set to false if the patient is not currently exposed to albuterol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to albuterol.","meaning":"Boolean indicating whether the patient is currently exposed to albuterol."} ;; "albuterol"

(declare-const patient_is_exposed_to_albuterol_now@@withheld_for_at_least_4_hours_prior_to_spirometry_testing_at_each_study_visit Bool) ;; {"when_to_set_to_true":"Set to true if albuterol therapy has been withheld for at least 4 hours prior to spirometry testing at each study visit.","when_to_set_to_false":"Set to false if albuterol therapy has not been withheld for at least 4 hours prior to spirometry testing at each study visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether albuterol therapy has been withheld for at least 4 hours prior to spirometry testing at each study visit.","meaning":"Boolean indicating whether albuterol therapy has been withheld for at least 4 hours prior to spirometry testing at each study visit."} ;; "withheld for at least 4 hours prior to spirometry testing at each study visit"

(declare-const patient_is_exposed_to_salbutamol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to salbutamol (e.g., receiving salbutamol therapy now).","when_to_set_to_false":"Set to false if the patient is not currently exposed to salbutamol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to salbutamol.","meaning":"Boolean indicating whether the patient is currently exposed to salbutamol therapy."} ;; "salbutamol"

(declare-const patient_is_exposed_to_salbutamol_now@@withheld_for_at_least_4_hours_prior_to_spirometry_testing_at_each_study_visit Bool) ;; {"when_to_set_to_true":"Set to true if salbutamol therapy has been withheld for at least 4 hours prior to spirometry testing at each study visit.","when_to_set_to_false":"Set to false if salbutamol therapy has not been withheld for at least 4 hours prior to spirometry testing at each study visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether salbutamol therapy has been withheld for at least 4 hours prior to spirometry testing at each study visit.","meaning":"Boolean indicating whether salbutamol therapy has been withheld for at least 4 hours prior to spirometry testing at each study visit."} ;; "withheld for at least 4 hours prior to spirometry testing at each study visit"

(declare-const patient_is_medically_unable_to_withhold_albuterol_therapy_for_at_least_4_hours_prior_to_spirometry_testing_at_each_study_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient is medically unable to withhold albuterol therapy for at least 4 hours prior to spirometry testing at each study visit.","when_to_set_to_false":"Set to false if the patient is medically able to withhold albuterol therapy for at least 4 hours prior to spirometry testing at each study visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is medically unable to withhold albuterol therapy for at least 4 hours prior to spirometry testing at each study visit.","meaning":"Boolean indicating whether the patient is medically unable to withhold albuterol therapy for at least 4 hours prior to spirometry testing at each study visit."} ;; "medically unable to withhold albuterol therapy for at least 4 hours prior to spirometry testing at each study visit"

(declare-const patient_is_medically_unable_to_withhold_salbutamol_therapy_for_at_least_4_hours_prior_to_spirometry_testing_at_each_study_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient is medically unable to withhold salbutamol therapy for at least 4 hours prior to spirometry testing at each study visit.","when_to_set_to_false":"Set to false if the patient is medically able to withhold salbutamol therapy for at least 4 hours prior to spirometry testing at each study visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is medically unable to withhold salbutamol therapy for at least 4 hours prior to spirometry testing at each study visit.","meaning":"Boolean indicating whether the patient is medically unable to withhold salbutamol therapy for at least 4 hours prior to spirometry testing at each study visit."} ;; "medically unable to withhold salbutamol therapy for at least 4 hours prior to spirometry testing at each study visit"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not patient_is_medically_unable_to_withhold_albuterol_therapy_for_at_least_4_hours_prior_to_spirometry_testing_at_each_study_visit)
:named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is medically unable to withhold albuterol therapy for at least 4 hours prior to spirometry testing at each study visit."

(assert
(! (not patient_is_medically_unable_to_withhold_salbutamol_therapy_for_at_least_4_hours_prior_to_spirometry_testing_at_each_study_visit)
:named REQ16_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is medically unable to withhold salbutamol therapy for at least 4 hours prior to spirometry testing at each study visit."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_is_exposed_to_bronchodilator_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any bronchodilator.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any bronchodilator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any bronchodilator.","meaning":"Boolean indicating whether the patient is currently exposed to any bronchodilator."} ;; "bronchodilator therapy"
(declare-const patient_is_exposed_to_bronchodilator_now@@protocol_specific_times_prior_to_screening_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to any bronchodilator occurred within the protocol-specific times prior to Screening (Visit 1).","when_to_set_to_false":"Set to false if the patient's exposure to any bronchodilator did not occur within the protocol-specific times prior to Screening (Visit 1).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's exposure to any bronchodilator occurred within the protocol-specific times prior to Screening (Visit 1).","meaning":"Boolean indicating whether the patient's exposure to any bronchodilator occurred within the protocol-specific times prior to Screening (Visit 1)."} ;; "bronchodilator therapy for the protocol-specific times prior to Screening (Visit 1)"
(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any drug or medicament (medication).","when_to_set_to_false":"Set to false if the patient is currently not exposed to any drug or medicament (medication).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any drug or medicament (medication).","meaning":"Boolean indicating whether the patient is currently exposed to any drug or medicament (medication)."} ;; "certain medications"
(declare-const patient_is_exposed_to_drug_or_medicament_now@@protocol_specific_times_prior_to_screening_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to any drug or medicament (medication) occurred within the protocol-specific times prior to Screening (Visit 1).","when_to_set_to_false":"Set to false if the patient's exposure to any drug or medicament (medication) did not occur within the protocol-specific times prior to Screening (Visit 1).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's exposure to any drug or medicament (medication) occurred within the protocol-specific times prior to Screening (Visit 1).","meaning":"Boolean indicating whether the patient's exposure to any drug or medicament (medication) occurred within the protocol-specific times prior to Screening (Visit 1)."} ;; "certain medications for the protocol-specific times prior to Screening (Visit 1)"
(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any corticosteroid or corticosteroid derivative-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking any corticosteroid or corticosteroid derivative-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any corticosteroid or corticosteroid derivative-containing product.","meaning":"Boolean indicating whether the patient is currently taking any corticosteroid or corticosteroid derivative-containing product."} ;; "corticosteroid therapy"
(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@protocol_specific_times_prior_to_screening_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient's taking of any corticosteroid or corticosteroid derivative-containing product occurred within the protocol-specific times prior to Screening (Visit 1).","when_to_set_to_false":"Set to false if the patient's taking of any corticosteroid or corticosteroid derivative-containing product did not occur within the protocol-specific times prior to Screening (Visit 1).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's taking of any corticosteroid or corticosteroid derivative-containing product occurred within the protocol-specific times prior to Screening (Visit 1).","meaning":"Boolean indicating whether the patient's taking of any corticosteroid or corticosteroid derivative-containing product occurred within the protocol-specific times prior to Screening (Visit 1)."} ;; "corticosteroid therapy for the protocol-specific times prior to Screening (Visit 1)"
(declare-const patient_is_taking_corticosteroid_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking corticosteroid therapy.","when_to_set_to_false":"Set to false if the patient is currently not taking corticosteroid therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking corticosteroid therapy.","meaning":"Boolean indicating whether the patient is currently taking corticosteroid therapy."} ;; "corticosteroid therapy"
(declare-const patient_is_taking_corticosteroid_therapy_now@@protocol_specific_times_prior_to_screening_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient's taking of corticosteroid therapy occurred within the protocol-specific times prior to Screening (Visit 1).","when_to_set_to_false":"Set to false if the patient's taking of corticosteroid therapy did not occur within the protocol-specific times prior to Screening (Visit 1).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's taking of corticosteroid therapy occurred within the protocol-specific times prior to Screening (Visit 1).","meaning":"Boolean indicating whether the patient's taking of corticosteroid therapy occurred within the protocol-specific times prior to Screening (Visit 1)."} ;; "corticosteroid therapy for the protocol-specific times prior to Screening (Visit 1)"

;; ===================== Auxiliary Assertions (REQ 17) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_is_exposed_to_bronchodilator_now@@protocol_specific_times_prior_to_screening_visit_1
           patient_is_taking_corticosteroid_therapy_now@@protocol_specific_times_prior_to_screening_visit_1)
       patient_is_exposed_to_drug_or_medicament_now@@protocol_specific_times_prior_to_screening_visit_1)
    :named REQ17_AUXILIARY0)) ;; "with non-exhaustive examples ((bronchodilator therapy) OR (corticosteroid therapy)) for the protocol-specific times prior to Screening (Visit 1)."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_bronchodilator_now@@protocol_specific_times_prior_to_screening_visit_1
       patient_is_exposed_to_bronchodilator_now)
    :named REQ17_AUXILIARY1)) ;; "bronchodilator therapy for the protocol-specific times prior to Screening (Visit 1)"

(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@protocol_specific_times_prior_to_screening_visit_1
       patient_is_exposed_to_drug_or_medicament_now)
    :named REQ17_AUXILIARY2)) ;; "certain medications for the protocol-specific times prior to Screening (Visit 1)"

(assert
(! (=> patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@protocol_specific_times_prior_to_screening_visit_1
       patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now)
    :named REQ17_AUXILIARY3)) ;; "corticosteroid therapy for the protocol-specific times prior to Screening (Visit 1)"

(assert
(! (=> patient_is_taking_corticosteroid_therapy_now@@protocol_specific_times_prior_to_screening_visit_1
       patient_is_taking_corticosteroid_therapy_now)
    :named REQ17_AUXILIARY4)) ;; "corticosteroid therapy for the protocol-specific times prior to Screening (Visit 1)"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not patient_is_exposed_to_drug_or_medicament_now@@protocol_specific_times_prior_to_screening_visit_1)
    :named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses certain medications with non-exhaustive examples ((bronchodilator therapy) OR (corticosteroid therapy)) for the protocol-specific times prior to Screening (Visit 1)."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_is_undergoing_long_term_oxygen_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing long-term oxygen therapy.","when_to_set_to_false":"Set to false if the patient is not currently undergoing long-term oxygen therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing long-term oxygen therapy.","meaning":"Boolean indicating whether the patient is currently undergoing long-term oxygen therapy."} ;; "long-term oxygen therapy"

(declare-const patient_is_undergoing_oxygen_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing oxygen therapy.","when_to_set_to_false":"Set to false if the patient is not currently undergoing oxygen therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing oxygen therapy.","meaning":"Boolean indicating whether the patient is currently undergoing oxygen therapy."} ;; "oxygen therapy"

(declare-const patient_is_undergoing_oxygen_therapy_now@@nocturnal Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing oxygen therapy and the therapy is administered nocturnally (during the night).","when_to_set_to_false":"Set to false if the patient is currently undergoing oxygen therapy but it is not administered nocturnally.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the oxygen therapy is administered nocturnally.","meaning":"Boolean indicating whether the patient's current oxygen therapy is administered nocturnally."} ;; "nocturnal oxygen therapy"

(declare-const patient_is_undergoing_oxygen_therapy_now@@administered_more_than_12_hours_per_day Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing oxygen therapy and the therapy is administered for more than 12 hours per day.","when_to_set_to_false":"Set to false if the patient is currently undergoing oxygen therapy but it is not administered for more than 12 hours per day.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the oxygen therapy is administered for more than 12 hours per day.","meaning":"Boolean indicating whether the patient's current oxygen therapy is administered for more than 12 hours per day."} ;; "oxygen therapy for more than 12 hours per day"

(declare-const patient_is_undergoing_oxygen_therapy_now@@nocturnal_administered_more_than_12_hours_per_day Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing oxygen therapy and the therapy is administered nocturnally for more than 12 hours per day.","when_to_set_to_false":"Set to false if the patient is currently undergoing oxygen therapy but the therapy is not administered nocturnally for more than 12 hours per day.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the oxygen therapy is administered nocturnally for more than 12 hours per day.","meaning":"Boolean indicating whether the patient's current oxygen therapy is administered nocturnally for more than 12 hours per day."} ;; "nocturnal oxygen therapy for more than 12 hours per day"

;; ===================== Auxiliary Assertions (REQ 18) =====================
;; Qualifier variable implies stem variable for nocturnal oxygen therapy
(assert
(! (=> patient_is_undergoing_oxygen_therapy_now@@nocturnal
      patient_is_undergoing_oxygen_therapy_now)
:named REQ18_AUXILIARY0)) ;; "nocturnal oxygen therapy"

;; Qualifier variable implies stem variable for oxygen therapy administered more than 12 hours per day
(assert
(! (=> patient_is_undergoing_oxygen_therapy_now@@administered_more_than_12_hours_per_day
      patient_is_undergoing_oxygen_therapy_now)
:named REQ18_AUXILIARY1)) ;; "oxygen therapy for more than 12 hours per day"

;; Qualifier variable implies both nocturnal and >12h qualifiers
(assert
(! (=> patient_is_undergoing_oxygen_therapy_now@@nocturnal_administered_more_than_12_hours_per_day
      (and patient_is_undergoing_oxygen_therapy_now@@nocturnal
           patient_is_undergoing_oxygen_therapy_now@@administered_more_than_12_hours_per_day))
:named REQ18_AUXILIARY2)) ;; "nocturnal oxygen therapy for more than 12 hours per day"

;; ===================== Constraint Assertions (REQ 18) =====================
;; Exclusion: patient is on long-term oxygen therapy
(assert
(! (not patient_is_undergoing_long_term_oxygen_therapy_now)
:named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is on long-term oxygen therapy."

;; Exclusion: patient is on nocturnal oxygen therapy for more than 12 hours per day
(assert
(! (not patient_is_undergoing_oxygen_therapy_now@@nocturnal_administered_more_than_12_hours_per_day)
:named REQ18_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is on nocturnal oxygen therapy for more than 12 hours per day."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_has_participated_in_acute_phase_of_pulmonary_rehabilitation_program_within_4_weeks_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in the acute phase of a pulmonary rehabilitation program at any time within the 4 weeks prior to Screening.","when_to_set_to_false":"Set to false if the patient has not participated in the acute phase of a pulmonary rehabilitation program within the 4 weeks prior to Screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in the acute phase of a pulmonary rehabilitation program within the 4 weeks prior to Screening.","meaning":"Boolean indicating whether the patient has participated in the acute phase of a pulmonary rehabilitation program within 4 weeks prior to Screening."} ;; "the patient has participated in the acute phase of a pulmonary rehabilitation program within 4 weeks prior to Screening"

(declare-const patient_participates_in_acute_phase_of_pulmonary_rehabilitation_program_during_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient participates in the acute phase of a pulmonary rehabilitation program at any time during the study period.","when_to_set_to_false":"Set to false if the patient does not participate in the acute phase of a pulmonary rehabilitation program at any time during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient participates in the acute phase of a pulmonary rehabilitation program during the study.","meaning":"Boolean indicating whether the patient participates in the acute phase of a pulmonary rehabilitation program during the study."} ;; "the patient participates in the acute phase of a pulmonary rehabilitation program during the study"

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not patient_has_participated_in_acute_phase_of_pulmonary_rehabilitation_program_within_4_weeks_prior_to_screening)
:named REQ19_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has participated in the acute phase of a pulmonary rehabilitation program within 4 weeks prior to Screening"

(assert
(! (not patient_participates_in_acute_phase_of_pulmonary_rehabilitation_program_during_study)
:named REQ19_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient participates in the acute phase of a pulmonary rehabilitation program during the study"

;; ===================== Declarations for the exclusion criterion (REQ 20) =====================
(declare-const patient_completed_all_diary_entries_on_at_least_4_of_last_7_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient completed all diary entries on at least four of the last seven consecutive days.","when_to_set_to_false":"Set to false if the patient did not complete all diary entries on at least four of the last seven consecutive days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient completed all diary entries on at least four of the last seven consecutive days.","meaning":"Boolean indicating whether the patient completed all diary entries on at least four of the last seven consecutive days."} ;; "the patient does NOT complete all diary entries on at least four of the last seven consecutive days"

(declare-const patient_has_ability_to_withhold_copd_medications Bool) ;; {"when_to_set_to_true":"Set to true if the patient has the ability to withhold COPD medications.","when_to_set_to_false":"Set to false if the patient does not have the ability to withhold COPD medications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has the ability to withhold COPD medications.","meaning":"Boolean indicating whether the patient has the ability to withhold COPD medications."} ;; "the patient does NOT have the ability to withhold chronic obstructive pulmonary disease medications"

(declare-const patient_has_ability_to_keep_clinic_visit_appointments Bool) ;; {"when_to_set_to_true":"Set to true if the patient has the ability to keep clinic visit appointments.","when_to_set_to_false":"Set to false if the patient does not have the ability to keep clinic visit appointments.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has the ability to keep clinic visit appointments.","meaning":"Boolean indicating whether the patient has the ability to keep clinic visit appointments."} ;; "the patient does NOT have the ability to keep clinic visit appointments"

;; ===================== Constraint Assertions (REQ 20) =====================
;; Exclusion: patient fails to demonstrate adequate compliance, defined as (the patient does NOT complete all diary entries on at least four of the last seven consecutive days) OR (the patient does NOT have the ability to withhold COPD medications) OR (the patient does NOT have the ability to keep clinic visit appointments).
(assert
(! (not (or (not patient_completed_all_diary_entries_on_at_least_4_of_last_7_days)
            (not patient_has_ability_to_withhold_copd_medications)
            (not patient_has_ability_to_keep_clinic_visit_appointments)))
   :named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient fails to demonstrate adequate compliance, defined as (the patient does NOT complete all diary entries on at least four of the last seven consecutive days) OR (the patient does NOT have the ability to withhold chronic obstructive pulmonary disease medications) OR (the patient does NOT have the ability to keep clinic visit appointments)."

;; ===================== Declarations for the exclusion criterion (REQ 21) =====================
(declare-const patient_is_non_compliant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently non-compliant with any aspect of study requirements, procedures, or scheduled visits.","when_to_set_to_false":"Set to false if the patient is currently compliant with all aspects of study requirements, procedures, and scheduled visits.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently non-compliant.","meaning":"Boolean indicating whether the patient is currently non-compliant with study requirements, procedures, or scheduled visits."} ;; "the patient is non-compliant"
(declare-const patient_is_unable_to_comply_with_study_procedures_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to comply with study procedures.","when_to_set_to_false":"Set to false if the patient is currently able to comply with study procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to comply with study procedures.","meaning":"Boolean indicating whether the patient is currently unable to comply with study procedures."} ;; "the patient is unable to comply with study procedures"
(declare-const patient_is_unable_to_comply_with_scheduled_visits_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to comply with scheduled visits.","when_to_set_to_false":"Set to false if the patient is currently able to comply with scheduled visits.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to comply with scheduled visits.","meaning":"Boolean indicating whether the patient is currently unable to comply with scheduled visits."} ;; "the patient is unable to comply with scheduled visits"

;; ===================== Constraint Assertions (REQ 21) =====================
(assert
(! (not (or patient_is_non_compliant_now
            patient_is_unable_to_comply_with_study_procedures_now
            patient_is_unable_to_comply_with_scheduled_visits_now))
:named REQ21_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if (the patient is non-compliant) OR (the patient is unable to comply with study procedures) OR (the patient is unable to comply with scheduled visits)."

;; ===================== Declarations for the exclusion criterion (REQ 22) =====================
(declare-const patient_has_diagnosis_of_intellectual_disability_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of intellectual disability.","when_to_set_to_false":"Set to false if the patient does not have a documented history of intellectual disability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of intellectual disability.","meaning":"Boolean indicating whether the patient has a history of intellectual disability."} ;; "intellectual deficiency"

(declare-const patient_has_history_of_poor_motivation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of poor motivation.","when_to_set_to_false":"Set to false if the patient does not have a documented history of poor motivation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of poor motivation.","meaning":"Boolean indicating whether the patient has a history of poor motivation."} ;; "poor motivation"

(declare-const patient_has_history_of_other_condition_limiting_validity_of_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of any other condition that will limit the validity of informed consent to participate in the study.","when_to_set_to_false":"Set to false if the patient does not have a documented history of any other condition that will limit the validity of informed consent to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of any other condition that will limit the validity of informed consent to participate in the study.","meaning":"Boolean indicating whether the patient has a history of any other condition that will limit the validity of informed consent to participate in the study."} ;; "other conditions that will limit the validity of informed consent to participate in the study"

;; ===================== Constraint Assertions (REQ 22) =====================
(assert
(! (not patient_has_diagnosis_of_mental_disorder_inthehistory)
:named REQ22_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of psychiatric disease."

(assert
(! (not patient_has_diagnosis_of_intellectual_disability_inthehistory)
:named REQ22_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of intellectual deficiency."

(assert
(! (not patient_has_history_of_poor_motivation)
:named REQ22_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of poor motivation."

(assert
(! (not patient_has_history_of_other_condition_limiting_validity_of_informed_consent)
:named REQ22_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of other conditions that will limit the validity of informed consent to participate in the study."

;; ===================== Declarations for the exclusion criterion (REQ 23) =====================
(declare-const patient_has_affiliation_with_investigator_site_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any form of affiliation with the investigator site (e.g., employment, contractual relationship, or other formal association).","when_to_set_to_false":"Set to false if the patient currently does not have any affiliation with the investigator site.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an affiliation with the investigator site.","meaning":"Boolean indicating whether the patient currently has an affiliation with the investigator site."} ;; "has an affiliation with the investigator site"

;; ===================== Constraint Assertions (REQ 23) =====================
(assert
(! (not patient_has_affiliation_with_investigator_site_now)
:named REQ23_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an affiliation with the investigator site."

;; ===================== Declarations for the exclusion criterion (REQ 24) =====================
(declare-const patient_is_planning_on_becoming_pregnant_during_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient is planning on becoming pregnant at any time during the study period.","when_to_set_to_false":"Set to false if the patient is not planning on becoming pregnant at any time during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is planning on becoming pregnant during the study period.","meaning":"Boolean indicating whether the patient is planning on becoming pregnant at any time during the study period."} ;; "the patient is a woman who is planning on becoming pregnant during the study"

;; ===================== Constraint Assertions (REQ 24) =====================
(assert
(! (not (and patient_sex_is_female_now patient_is_pregnant_now))
:named REQ24_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient is a woman who is pregnant"

(assert
(! (not (and patient_sex_is_female_now patient_is_lactating_now))
:named REQ24_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient is a woman who is lactating"

(assert
(! (not (and patient_sex_is_female_now patient_is_planning_on_becoming_pregnant_during_study))
:named REQ24_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is a woman who is planning on becoming pregnant during the study"
