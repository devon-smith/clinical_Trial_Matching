;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not lactating as documented or reported.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."
(assert
  (! (not patient_is_lactating_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is lactating."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_asthma_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with asthma at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with asthma at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with asthma in the past.","meaning":"Boolean indicating whether the patient has ever been diagnosed with asthma in the past."} ;; "prior history of asthma"
(declare-const patient_has_diagnosis_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of asthma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of asthma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of asthma."} ;; "current diagnosis of asthma"
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic obstructive pulmonary disease."} ;; "current diagnosis of chronic obstructive pulmonary disease"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient is excluded if (the patient has a current diagnosis of asthma) AND (the patient does NOT have a prior history of asthma AND a current diagnosis of chronic obstructive pulmonary disease).
(assert
(! (not (and
          patient_has_diagnosis_of_asthma_now
          (not (and patient_has_diagnosis_of_asthma_inthehistory
                    patient_has_diagnosis_of_chronic_obstructive_lung_disease_now))
      ))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a current diagnosis of asthma) AND (the patient does NOT have a prior history of asthma AND a current diagnosis of chronic obstructive pulmonary disease)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_alpha_1_antitrypsin_deficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of alpha-1 antitrypsin deficiency.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of alpha-1 antitrypsin deficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has alpha-1 antitrypsin deficiency.","meaning":"Boolean indicating whether the patient currently has alpha-1 antitrypsin deficiency."} ;; "alpha-1 antitrypsin deficiency"
(declare-const patient_has_finding_of_alpha_1_antitrypsin_deficiency_now@@is_underlying_cause_of_chronic_obstructive_lung_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has alpha-1 antitrypsin deficiency and it is the underlying cause of the patient's chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently has alpha-1 antitrypsin deficiency but it is not the underlying cause of the patient's chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether alpha-1 antitrypsin deficiency is the underlying cause of the patient's chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient's alpha-1 antitrypsin deficiency is the underlying cause of their chronic obstructive pulmonary disease."} ;; "alpha-1 antitrypsin deficiency as the underlying cause of chronic obstructive pulmonary disease"
(declare-const patient_has_finding_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has chronic obstructive pulmonary disease."} ;; "chronic obstructive pulmonary disease"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies both stem and target disease
(assert
(! (=> patient_has_finding_of_alpha_1_antitrypsin_deficiency_now@@is_underlying_cause_of_chronic_obstructive_lung_disease
      (and patient_has_finding_of_alpha_1_antitrypsin_deficiency_now
           patient_has_finding_of_chronic_obstructive_lung_disease_now))
:named REQ2_AUXILIARY0)) ;; "alpha-1 antitrypsin deficiency as the underlying cause of chronic obstructive pulmonary disease"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_alpha_1_antitrypsin_deficiency_now@@is_underlying_cause_of_chronic_obstructive_lung_disease)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has alpha-1 antitrypsin deficiency as the underlying cause of chronic obstructive pulmonary disease."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tuberculosis.","when_to_set_to_false":"Set to false if the patient currently does not have tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tuberculosis.","meaning":"Boolean indicating whether the patient currently has tuberculosis now."} ;; "tuberculosis"
(declare-const patient_has_finding_of_tuberculosis_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has active tuberculosis.","when_to_set_to_false":"Set to false if the patient currently has tuberculosis but it is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's tuberculosis is active.","meaning":"Boolean indicating whether the patient's tuberculosis is active."} ;; "active tuberculosis"
(declare-const patient_has_finding_of_primary_malignant_neoplasm_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has lung cancer.","when_to_set_to_false":"Set to false if the patient currently does not have lung cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has lung cancer.","meaning":"Boolean indicating whether the patient currently has lung cancer now."} ;; "lung cancer"
(declare-const patient_has_finding_of_bronchiectasis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bronchiectasis.","when_to_set_to_false":"Set to false if the patient currently does not have bronchiectasis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bronchiectasis.","meaning":"Boolean indicating whether the patient currently has bronchiectasis now."} ;; "bronchiectasis"
(declare-const patient_has_finding_of_sarcoidosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sarcoidosis.","when_to_set_to_false":"Set to false if the patient currently does not have sarcoidosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sarcoidosis.","meaning":"Boolean indicating whether the patient currently has sarcoidosis now."} ;; "sarcoidosis"
(declare-const patient_has_finding_of_fibrosis_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pulmonary fibrosis.","when_to_set_to_false":"Set to false if the patient currently does not have pulmonary fibrosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pulmonary fibrosis.","meaning":"Boolean indicating whether the patient currently has pulmonary fibrosis now."} ;; "pulmonary fibrosis"
(declare-const patient_has_finding_of_pulmonary_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pulmonary hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have pulmonary hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pulmonary hypertension.","meaning":"Boolean indicating whether the patient currently has pulmonary hypertension now."} ;; "pulmonary hypertension"
(declare-const patient_has_finding_of_interstitial_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has interstitial lung disease.","when_to_set_to_false":"Set to false if the patient currently does not have interstitial lung disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has interstitial lung disease.","meaning":"Boolean indicating whether the patient currently has interstitial lung disease now."} ;; "interstitial lung disease"
(declare-const patient_has_finding_of_disorder_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have a pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a pulmonary disease.","meaning":"Boolean indicating whether the patient currently has a pulmonary disease now."} ;; "pulmonary disease"
(declare-const patient_has_finding_of_disorder_of_lung_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an active pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently has a pulmonary disease but it is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's pulmonary disease is active.","meaning":"Boolean indicating whether the patient's pulmonary disease is active."} ;; "active pulmonary disease"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable for tuberculosis implies stem variable
(assert
(! (=> patient_has_finding_of_tuberculosis_now@@active
       patient_has_finding_of_tuberculosis_now)
   :named REQ3_AUXILIARY0)) ;; "active tuberculosis"

;; Qualifier variable for pulmonary disease implies stem variable
(assert
(! (=> patient_has_finding_of_disorder_of_lung_now@@active
       patient_has_finding_of_disorder_of_lung_now)
   :named REQ3_AUXILIARY1)) ;; "active pulmonary disease"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_tuberculosis_now@@active)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active tuberculosis."

(assert
(! (not patient_has_finding_of_primary_malignant_neoplasm_of_lung_now)
   :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has lung cancer."

(assert
(! (not patient_has_finding_of_bronchiectasis_now)
   :named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has bronchiectasis."

(assert
(! (not patient_has_finding_of_sarcoidosis_now)
   :named REQ3_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has sarcoidosis."

(assert
(! (not patient_has_finding_of_fibrosis_of_lung_now)
   :named REQ3_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pulmonary fibrosis."

(assert
(! (not patient_has_finding_of_pulmonary_hypertension_now)
   :named REQ3_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pulmonary hypertension."

(assert
(! (not patient_has_finding_of_interstitial_lung_disease_now)
   :named REQ3_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has interstitial lung disease."

(assert
(! (not patient_has_finding_of_disorder_of_lung_now@@active)
   :named REQ3_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has another active pulmonary disease."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_undergone_lung_volume_reduction_surgery_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone lung volume reduction surgery at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone lung volume reduction surgery at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone lung volume reduction surgery.","meaning":"Boolean indicating whether the patient has ever undergone lung volume reduction surgery in the past."} ;; "lung volume reduction surgery"

(declare-const patient_has_undergone_lung_volume_reduction_surgery_inthehistory@@temporalcontext_within12months_before_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone lung volume reduction surgery within the twelve months prior to the Screening visit.","when_to_set_to_false":"Set to false if the patient has not undergone lung volume reduction surgery within the twelve months prior to the Screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone lung volume reduction surgery within the twelve months prior to Screening.","meaning":"Boolean indicating whether the patient has undergone lung volume reduction surgery within the twelve months prior to Screening."} ;; "lung volume reduction surgery within the twelve months prior to Screening"

(declare-const patient_has_undergone_transplant_of_lung_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a lung transplant at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a lung transplant at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a lung transplant.","meaning":"Boolean indicating whether the patient has ever undergone a lung transplant in the past."} ;; "lung transplant"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_lung_volume_reduction_surgery_inthehistory@@temporalcontext_within12months_before_screening
      patient_has_undergone_lung_volume_reduction_surgery_inthehistory)
:named REQ4_AUXILIARY0)) ;; "lung volume reduction surgery within the twelve months prior to Screening" implies "lung volume reduction surgery in the history"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_undergone_lung_volume_reduction_surgery_inthehistory@@temporalcontext_within12months_before_screening)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had lung volume reduction surgery within the twelve months prior to Screening."

(assert
(! (not patient_has_undergone_transplant_of_lung_inthehistory)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a lung transplant."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an acute exacerbation of chronic obstructive airways disease at any time in the history.","when_to_set_to_false":"Set to false if the patient has not had an acute exacerbation of chronic obstructive airways disease at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an acute exacerbation of chronic obstructive airways disease in the history.","meaning":"Boolean indicating whether the patient has had an acute exacerbation of chronic obstructive airways disease in the history."} ;; "chronic obstructive pulmonary disease exacerbation"

(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@moderate_severity Bool) ;; {"when_to_set_to_true":"Set to true if the patient's historical acute exacerbation of chronic obstructive airways disease is of moderate severity.","when_to_set_to_false":"Set to false if the patient's historical acute exacerbation of chronic obstructive airways disease is not of moderate severity.","when_to_set_to_null":"Set to null if the severity of the patient's historical acute exacerbation of chronic obstructive airways disease is unknown or indeterminate.","meaning":"Boolean indicating whether the patient's historical acute exacerbation of chronic obstructive airways disease is of moderate severity."} ;; "moderate chronic obstructive pulmonary disease exacerbation"

(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@not_resolved_within_time_windows Bool) ;; {"when_to_set_to_true":"Set to true if the patient's moderate acute exacerbation of chronic obstructive airways disease has not resolved at least fourteen days prior to Visit 1 and at least thirty days following the last dose of oral corticosteroids (if applicable).","when_to_set_to_false":"Set to false if the patient's moderate acute exacerbation of chronic obstructive airways disease has resolved within the specified time windows.","when_to_set_to_null":"Set to null if the resolution timing of the patient's moderate acute exacerbation of chronic obstructive airways disease is unknown or indeterminate.","meaning":"Boolean indicating whether the patient's moderate acute exacerbation of chronic obstructive airways disease has not resolved within the specified time windows relative to Visit 1 and corticosteroid dosing."} ;; "has not resolved at least fourteen days prior to Visit 1 AND at least thirty days following the last dose of oral corticosteroids (if applicable)" (moderate)

(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@severe_severity Bool) ;; {"when_to_set_to_true":"Set to true if the patient's historical acute exacerbation of chronic obstructive airways disease is of severe severity.","when_to_set_to_false":"Set to false if the patient's historical acute exacerbation of chronic obstructive airways disease is not of severe severity.","when_to_set_to_null":"Set to null if the severity of the patient's historical acute exacerbation of chronic obstructive airways disease is unknown or indeterminate.","meaning":"Boolean indicating whether the patient's historical acute exacerbation of chronic obstructive airways disease is of severe severity."} ;; "severe chronic obstructive pulmonary disease exacerbation"

(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@severe_severity@@not_resolved_within_time_windows Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a severe acute exacerbation of chronic obstructive airways disease in the history, and the exacerbation has not resolved at least fourteen days prior to Visit 1 and at least thirty days following the last dose of oral corticosteroids (if applicable).","when_to_set_to_false":"Set to false if the patient has not had a severe acute exacerbation of chronic obstructive airways disease in the history, or if the exacerbation has resolved within the specified time windows.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a severe acute exacerbation of chronic obstructive airways disease in the history, or if the resolution timing is unknown or indeterminate.","meaning":"Boolean indicating whether the patient has had a severe acute exacerbation of chronic obstructive airways disease in the history, and the exacerbation has not resolved within the specified time windows relative to Visit 1 and corticosteroid dosing."} ;; "has not resolved at least fourteen days prior to Visit 1 AND at least thirty days following the last dose of oral corticosteroids (if applicable)" (severe)

(declare-const patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken a corticosteroid or corticosteroid derivative containing product at any time in the history.","when_to_set_to_false":"Set to false if the patient has not taken a corticosteroid or corticosteroid derivative containing product at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken a corticosteroid or corticosteroid derivative containing product in the history.","meaning":"Boolean indicating whether the patient has taken a corticosteroid or corticosteroid derivative containing product in the history."} ;; "corticosteroids"

(declare-const patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory@@administered_orally Bool) ;; {"when_to_set_to_true":"Set to true if the corticosteroid or corticosteroid derivative containing product taken by the patient in the history was administered orally.","when_to_set_to_false":"Set to false if the corticosteroid or corticosteroid derivative containing product taken by the patient in the history was not administered orally.","when_to_set_to_null":"Set to null if the route of administration for the corticosteroid or corticosteroid derivative containing product taken by the patient in the history is unknown or indeterminate.","meaning":"Boolean indicating whether the corticosteroid or corticosteroid derivative containing product taken by the patient in the history was administered orally."} ;; "oral corticosteroids"

(declare-const patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory@@last_dose_prior_to_resolution_window Bool) ;; {"when_to_set_to_true":"Set to true if the corticosteroid or corticosteroid derivative containing product taken by the patient in the history was the last dose prior to the time window for exacerbation resolution.","when_to_set_to_false":"Set to false if the corticosteroid or corticosteroid derivative containing product taken by the patient in the history was not the last dose prior to the time window for exacerbation resolution.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the corticosteroid or corticosteroid derivative containing product taken by the patient in the history was the last dose prior to the time window for exacerbation resolution.","meaning":"Boolean indicating whether the corticosteroid or corticosteroid derivative containing product taken by the patient in the history was the last dose prior to the time window for exacerbation resolution."} ;; "last dose of oral corticosteroids (if applicable)"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variables (moderate)
(assert
(! (=> patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@moderate_severity
      patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory)
:named REQ5_AUXILIARY0)) ;; "moderate chronic obstructive pulmonary disease exacerbation"

;; Qualifier variables imply corresponding stem variables (severe)
(assert
(! (=> patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@severe_severity
      patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory)
:named REQ5_AUXILIARY1)) ;; "severe chronic obstructive pulmonary disease exacerbation"

;; Qualifier variables imply corresponding stem variables (moderate, not resolved within time windows)
(assert
(! (=> patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@not_resolved_within_time_windows
      patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@moderate_severity)
:named REQ5_AUXILIARY2)) ;; "moderate chronic obstructive pulmonary disease exacerbation that has not resolved at least fourteen days prior to Visit 1 AND at least thirty days following the last dose of oral corticosteroids (if applicable)"

;; Qualifier variables imply corresponding stem variables (severe, not resolved within time windows)
(assert
(! (=> patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@severe_severity@@not_resolved_within_time_windows
      patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@severe_severity)
:named REQ5_AUXILIARY3)) ;; "severe chronic obstructive pulmonary disease exacerbation that has not resolved at least fourteen days prior to Visit 1 AND at least thirty days following the last dose of oral corticosteroids (if applicable)"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: moderate exacerbation not resolved within time windows
(assert
(! (not patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@not_resolved_within_time_windows)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a moderate chronic obstructive pulmonary disease exacerbation that has not resolved at least fourteen days prior to Visit 1 AND at least thirty days following the last dose of oral corticosteroids (if applicable)."

;; Exclusion: severe exacerbation not resolved within time windows
(assert
(! (not patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@severe_severity@@not_resolved_within_time_windows)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a severe chronic obstructive pulmonary disease exacerbation that has not resolved at least fourteen days prior to Visit 1 AND at least thirty days following the last dose of oral corticosteroids (if applicable)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of heart failure.","meaning":"Boolean indicating whether the patient currently has heart failure."} ;; "heart failure"
(declare-const patient_has_finding_of_heart_failure_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current heart failure is severe.","when_to_set_to_false":"Set to false if the patient's current heart failure is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current heart failure is severe.","meaning":"Boolean indicating whether the patient's current heart failure is severe."} ;; "severe heart failure"
(declare-const patient_has_finding_of_heart_failure_now@@new_york_heart_association_class_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current heart failure is classified as New York Heart Association class IV.","when_to_set_to_false":"Set to false if the patient's current heart failure is not classified as New York Heart Association class IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current heart failure is classified as New York Heart Association class IV.","meaning":"Boolean indicating whether the patient's current heart failure is classified as New York Heart Association class IV."} ;; "New York Heart Association class IV"
(declare-const patient_cardiac_ejection_fraction_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a numeric measurement of the patient's current cardiac ejection fraction is available.","when_to_set_to_null":"Set to null if no such percentage measurement recorded now is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current cardiac ejection fraction."} ;; "ejection fraction"
(declare-const patient_cardiac_ejection_fraction_value_recorded_now_withunit_percent@@known_value Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current cardiac ejection fraction value is known (not missing or indeterminate).","when_to_set_to_false":"Set to false if the patient's current cardiac ejection fraction value is not known (missing or indeterminate).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current cardiac ejection fraction value is known.","meaning":"Boolean indicating whether the patient's current cardiac ejection fraction value is known."} ;; "known ejection fraction value"
(declare-const patient_has_implantable_cardioverter_defibrillator_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an implantable cardioverter defibrillator.","when_to_set_to_false":"Set to false if the patient currently does not have an implantable cardioverter defibrillator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an implantable cardioverter defibrillator.","meaning":"Boolean indicating whether the patient currently has an implantable cardioverter defibrillator."} ;; "implantable cardioverter defibrillator"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_heart_failure_now@@severe
      patient_has_finding_of_heart_failure_now)
:named REQ6_AUXILIARY0)) ;; "severe heart failure"

(assert
(! (=> patient_has_finding_of_heart_failure_now@@new_york_heart_association_class_iv
      patient_has_finding_of_heart_failure_now)
:named REQ6_AUXILIARY1)) ;; "New York Heart Association class IV"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient must NOT have current severe heart failure (NYHA class IV)
(assert
(! (not patient_has_finding_of_heart_failure_now@@new_york_heart_association_class_iv)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current severe heart failure (New York Heart Association class IV)."

;; Exclusion: patient must NOT have a known ejection fraction less than thirty percent
(assert
(! (not (and patient_cardiac_ejection_fraction_value_recorded_now_withunit_percent@@known_value
             (< patient_cardiac_ejection_fraction_value_recorded_now_withunit_percent 30)))
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known ejection fraction less than thirty percent."

;; Exclusion: patient must NOT have an implantable cardioverter defibrillator
(assert
(! (not patient_has_implantable_cardioverter_defibrillator_now)
:named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an implantable cardioverter defibrillator."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_life_threatening_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any life-threatening condition.","when_to_set_to_false":"Set to false if the patient currently does not have any life-threatening condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any life-threatening condition.","meaning":"Boolean indicating whether the patient currently has any life-threatening condition."} ;; "the patient has any life-threatening condition"

(declare-const patient_has_life_threatening_condition_now@@not_vascular_disease_or_copd Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current life-threatening condition is not vascular disease or chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient's current life-threatening condition is vascular disease or chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current life-threatening condition is vascular disease or chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient's current life-threatening condition is not vascular disease or chronic obstructive pulmonary disease."} ;; "other than vascular disease or chronic obstructive pulmonary disease"

(declare-const patient_has_life_threatening_condition_now@@might_prevent_study_completion Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current life-threatening condition might prevent the patient from completing the study.","when_to_set_to_false":"Set to false if the patient's current life-threatening condition would not prevent the patient from completing the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current life-threatening condition might prevent study completion.","meaning":"Boolean indicating whether the patient's current life-threatening condition might prevent the patient from completing the study."} ;; "that might prevent the patient from completing the study"

(declare-const patient_life_expectancy_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current life expectancy in years if available.","when_to_set_to_null":"Set to null if the patient's current life expectancy in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current life expectancy in years."} ;; "with life expectancy less than three years"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_life_threatening_condition_now@@not_vascular_disease_or_copd
      patient_has_life_threatening_condition_now)
:named REQ7_AUXILIARY0)) ;; "other than vascular disease or chronic obstructive pulmonary disease"

(assert
(! (=> patient_has_life_threatening_condition_now@@might_prevent_study_completion
      patient_has_life_threatening_condition_now)
:named REQ7_AUXILIARY1)) ;; "that might prevent the patient from completing the study"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion: patient must NOT have any life-threatening condition (other than vascular disease or COPD) with life expectancy < 3 years that might prevent study completion
(assert
(! (not (and patient_has_life_threatening_condition_now@@not_vascular_disease_or_copd
             patient_has_life_threatening_condition_now@@might_prevent_study_completion
             (< patient_life_expectancy_value_recorded_now_in_years 3)))
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has any life-threatening condition, other than vascular disease or chronic obstructive pulmonary disease, with life expectancy less than three years, that might prevent the patient from completing the study)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_undergoing_hemodialysis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing hemodialysis.","when_to_set_to_false":"Set to false if the patient is currently not undergoing hemodialysis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing hemodialysis.","meaning":"Boolean indicating whether the patient is currently undergoing hemodialysis."} ;; "hemodialysis"
(declare-const patient_is_undergoing_hemodialysis_now@@as_renal_replacement_therapy_for_end_stage_chronic_renal_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing hemodialysis and it is performed as renal replacement therapy for end stage chronic renal disease.","when_to_set_to_false":"Set to false if the patient is currently undergoing hemodialysis but it is not performed as renal replacement therapy for end stage chronic renal disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hemodialysis is performed as renal replacement therapy for end stage chronic renal disease.","meaning":"Boolean indicating whether the patient's current hemodialysis is performed as renal replacement therapy for end stage chronic renal disease."} ;; "hemodialysis as renal replacement therapy for end stage chronic renal disease"
(declare-const patient_is_undergoing_peritoneal_dialysis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing peritoneal dialysis.","when_to_set_to_false":"Set to false if the patient is currently not undergoing peritoneal dialysis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing peritoneal dialysis.","meaning":"Boolean indicating whether the patient is currently undergoing peritoneal dialysis."} ;; "peritoneal dialysis"
(declare-const patient_is_undergoing_peritoneal_dialysis_now@@as_renal_replacement_therapy_for_end_stage_chronic_renal_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing peritoneal dialysis and it is performed as renal replacement therapy for end stage chronic renal disease.","when_to_set_to_false":"Set to false if the patient is currently undergoing peritoneal dialysis but it is not performed as renal replacement therapy for end stage chronic renal disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the peritoneal dialysis is performed as renal replacement therapy for end stage chronic renal disease.","meaning":"Boolean indicating whether the patient's current peritoneal dialysis is performed as renal replacement therapy for end stage chronic renal disease."} ;; "peritoneal dialysis as renal replacement therapy for end stage chronic renal disease"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable for hemodialysis
(assert
(! (=> patient_is_undergoing_hemodialysis_now@@as_renal_replacement_therapy_for_end_stage_chronic_renal_disease
      patient_is_undergoing_hemodialysis_now)
   :named REQ8_AUXILIARY0)) ;; "hemodialysis as renal replacement therapy for end stage chronic renal disease"

;; Qualifier variable implies corresponding stem variable for peritoneal dialysis
(assert
(! (=> patient_is_undergoing_peritoneal_dialysis_now@@as_renal_replacement_therapy_for_end_stage_chronic_renal_disease
      patient_is_undergoing_peritoneal_dialysis_now)
   :named REQ8_AUXILIARY1)) ;; "peritoneal dialysis as renal replacement therapy for end stage chronic renal disease"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_is_undergoing_hemodialysis_now@@as_renal_replacement_therapy_for_end_stage_chronic_renal_disease)
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving renal replacement therapy with hemodialysis for end stage chronic renal disease."

(assert
(! (not patient_is_undergoing_peritoneal_dialysis_now@@as_renal_replacement_therapy_for_end_stage_chronic_renal_disease)
   :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving renal replacement therapy with peritoneal dialysis for end stage chronic renal disease."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a history of hypersensitivity at any time in the past, regardless of cause.","when_to_set_to_false":"Set to false if the patient has never had a history of hypersensitivity at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of hypersensitivity.","meaning":"Boolean indicating whether the patient has ever had a history of hypersensitivity (any cause) in the past."} ;; "history of hypersensitivity"

(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_any_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of hypersensitivity is specifically to any of the study medications.","when_to_set_to_false":"Set to false if the patient's history of hypersensitivity is not to any of the study medications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of hypersensitivity is to any of the study medications.","meaning":"Boolean indicating whether the patient's history of hypersensitivity is specifically to any of the study medications."} ;; "history of hypersensitivity to any of the study medications"

(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_any_inhalation_powder_component Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of hypersensitivity is specifically to any component of the inhalation powder.","when_to_set_to_false":"Set to false if the patient's history of hypersensitivity is not to any component of the inhalation powder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of hypersensitivity is to any component of the inhalation powder.","meaning":"Boolean indicating whether the patient's history of hypersensitivity is specifically to any component of the inhalation powder."} ;; "history of hypersensitivity to any component of the inhalation powder"

(declare-const patient_has_allergy_to_milk_protein_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a history of allergy to milk protein at any time in the past, regardless of severity.","when_to_set_to_false":"Set to false if the patient has never had a history of allergy to milk protein at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of allergy to milk protein.","meaning":"Boolean indicating whether the patient has ever had a history of allergy to milk protein in the past."} ;; "history of allergy to milk protein"

(declare-const patient_has_allergy_to_milk_protein_inthehistory@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of allergy to milk protein is severe.","when_to_set_to_false":"Set to false if the patient's history of allergy to milk protein is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of allergy to milk protein is severe.","meaning":"Boolean indicating whether the patient's history of allergy to milk protein is severe."} ;; "history of severe allergy to milk protein"

(declare-const study_physician_opines_participation_contraindicated_due_to_severe_milk_protein_allergy Bool) ;; {"when_to_set_to_true":"Set to true if, in the opinion of the study physician, the patient's participation is contraindicated due to a history of severe milk protein allergy.","when_to_set_to_false":"Set to false if, in the opinion of the study physician, the patient's participation is not contraindicated due to a history of severe milk protein allergy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether, in the opinion of the study physician, the patient's participation is contraindicated due to a history of severe milk protein allergy.","meaning":"Boolean indicating whether, in the opinion of the study physician, the patient's participation is contraindicated due to a history of severe milk protein allergy."} ;; "in the opinion of the study physician, contraindicates the patient's participation due to severe milk protein allergy"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Non-exhaustive examples for study medications: beta-agonist, corticosteroid
(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_beta_agonist Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of hypersensitivity is specifically to beta-agonist.","when_to_set_to_false":"Set to false if the patient's history of hypersensitivity is not to beta-agonist.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of hypersensitivity is to beta-agonist.","meaning":"Boolean indicating whether the patient's history of hypersensitivity is specifically to beta-agonist."} ;; "history of hypersensitivity to beta-agonist"
(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_corticosteroid Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of hypersensitivity is specifically to corticosteroid.","when_to_set_to_false":"Set to false if the patient's history of hypersensitivity is not to corticosteroid.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of hypersensitivity is to corticosteroid.","meaning":"Boolean indicating whether the patient's history of hypersensitivity is specifically to corticosteroid."} ;; "history of hypersensitivity to corticosteroid"

(assert
(! (=> (or patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_beta_agonist
           patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_corticosteroid)
       patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_any_study_medication)
:named REQ9_AUXILIARY0)) ;; "with non-exhaustive examples (beta-agonist, corticosteroid)"

;; Non-exhaustive examples for inhalation powder components: lactose, magnesium stearate
(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_lactose Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of hypersensitivity is specifically to lactose.","when_to_set_to_false":"Set to false if the patient's history of hypersensitivity is not to lactose.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of hypersensitivity is to lactose.","meaning":"Boolean indicating whether the patient's history of hypersensitivity is specifically to lactose."} ;; "history of hypersensitivity to lactose"
(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_magnesium_stearate Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of hypersensitivity is specifically to magnesium stearate.","when_to_set_to_false":"Set to false if the patient's history of hypersensitivity is not to magnesium stearate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of hypersensitivity is to magnesium stearate.","meaning":"Boolean indicating whether the patient's history of hypersensitivity is specifically to magnesium stearate."} ;; "history of hypersensitivity to magnesium stearate"

(assert
(! (=> (or patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_lactose
           patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_magnesium_stearate)
       patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_any_inhalation_powder_component)
:named REQ9_AUXILIARY1)) ;; "with non-exhaustive examples (lactose, magnesium stearate)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_any_study_medication
       patient_has_finding_of_hypersensitivity_condition_inthehistory)
:named REQ9_AUXILIARY2)) ;; "history of hypersensitivity to any of the study medications"

(assert
(! (=> patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_any_inhalation_powder_component
       patient_has_finding_of_hypersensitivity_condition_inthehistory)
:named REQ9_AUXILIARY3)) ;; "history of hypersensitivity to any component of the inhalation powder"

(assert
(! (=> patient_has_allergy_to_milk_protein_inthehistory@@severe
       patient_has_allergy_to_milk_protein_inthehistory)
:named REQ9_AUXILIARY4)) ;; "history of severe allergy to milk protein"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Exclusion: patient must NOT have any of the following:
;; 1. history of hypersensitivity to any study medication
(assert
(! (not patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_any_study_medication)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "history of hypersensitivity to any of the study medications"

;; 2. history of hypersensitivity to any component of the inhalation powder
(assert
(! (not patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_any_inhalation_powder_component)
:named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "history of hypersensitivity to any component of the inhalation powder"

;; 3. history of severe milk protein allergy that, in the opinion of the study physician, contraindicates participation
(assert
(! (not study_physician_opines_participation_contraindicated_due_to_severe_milk_protein_allergy)
:named REQ9_COMPONENT2_OTHER_REQUIREMENTS)) ;; "history of severe milk protein allergy that, in the opinion of the study physician, contraindicates the patient's participation"

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_alcohol_abuse_inthepast2years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of alcohol abuse that occurred within the past 2 years.","when_to_set_to_false":"Set to false if the patient does not have a documented history of alcohol abuse within the past 2 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of alcohol abuse within the past 2 years.","meaning":"Boolean indicating whether the patient has alcohol abuse within the past 2 years."} ;; "alcohol abuse within the last 2 years"
(declare-const patient_has_finding_of_alcohol_abuse_inthepast2years@@known_history Bool) ;; {"when_to_set_to_true":"Set to true if the history of alcohol abuse within the past 2 years is known (confirmed/documented).","when_to_set_to_false":"Set to false if the history is not known (i.e., suspected or absent).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the history is known.","meaning":"Boolean indicating whether the history of alcohol abuse within the past 2 years is known."} ;; "known history of alcohol abuse within the last 2 years"
(declare-const patient_has_finding_of_alcohol_abuse_inthepast2years@@suspected_history Bool) ;; {"when_to_set_to_true":"Set to true if the history of alcohol abuse within the past 2 years is suspected (not confirmed/documented).","when_to_set_to_false":"Set to false if the history is not suspected (i.e., known or absent).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the history is suspected.","meaning":"Boolean indicating whether the history of alcohol abuse within the past 2 years is suspected."} ;; "suspected history of alcohol abuse within the last 2 years"
(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthepast2years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of drug abuse that occurred within the past 2 years.","when_to_set_to_false":"Set to false if the patient does not have a documented history of drug abuse within the past 2 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of drug abuse within the past 2 years.","meaning":"Boolean indicating whether the patient has drug abuse within the past 2 years."} ;; "drug abuse within the last 2 years"
(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthepast2years@@known_history Bool) ;; {"when_to_set_to_true":"Set to true if the history of drug abuse within the past 2 years is known (confirmed/documented).","when_to_set_to_false":"Set to false if the history is not known (i.e., suspected or absent).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the history is known.","meaning":"Boolean indicating whether the history of drug abuse within the past 2 years is known."} ;; "known history of drug abuse within the last 2 years"
(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthepast2years@@suspected_history Bool) ;; {"when_to_set_to_true":"Set to true if the history of drug abuse within the past 2 years is suspected (not confirmed/documented).","when_to_set_to_false":"Set to false if the history is not suspected (i.e., known or absent).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the history is suspected.","meaning":"Boolean indicating whether the history of drug abuse within the past 2 years is suspected."} ;; "suspected history of drug abuse within the last 2 years"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variables imply corresponding stem variables for alcohol abuse
(assert
(! (=> patient_has_finding_of_alcohol_abuse_inthepast2years@@known_history
      patient_has_finding_of_alcohol_abuse_inthepast2years)
    :named REQ10_AUXILIARY0)) ;; "known history of alcohol abuse within the last 2 years"

(assert
(! (=> patient_has_finding_of_alcohol_abuse_inthepast2years@@suspected_history
      patient_has_finding_of_alcohol_abuse_inthepast2years)
    :named REQ10_AUXILIARY1)) ;; "suspected history of alcohol abuse within the last 2 years"

;; Qualifier variables imply corresponding stem variables for drug abuse
(assert
(! (=> patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthepast2years@@known_history
      patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthepast2years)
    :named REQ10_AUXILIARY2)) ;; "known history of drug abuse within the last 2 years"

(assert
(! (=> patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthepast2years@@suspected_history
      patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthepast2years)
    :named REQ10_AUXILIARY3)) ;; "suspected history of drug abuse within the last 2 years"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Exclusion: patient must NOT have any of the following within the last 2 years:
;; (known or suspected history of alcohol abuse) OR (known or suspected history of drug abuse)
(assert
(! (not (or patient_has_finding_of_alcohol_abuse_inthepast2years@@known_history
            patient_has_finding_of_alcohol_abuse_inthepast2years@@suspected_history
            patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthepast2years@@known_history
            patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthepast2years@@suspected_history))
    :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a known history of alcohol abuse within the last 2 years) OR (the patient has a suspected history of alcohol abuse within the last 2 years) OR (the patient has a known history of drug abuse within the last 2 years) OR (the patient has a suspected history of drug abuse within the last 2 years))."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_is_undergoing_long_term_oxygen_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving treatment with long-term oxygen therapy.","when_to_set_to_false":"Set to false if the patient is currently not receiving treatment with long-term oxygen therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving long-term oxygen therapy.","meaning":"Boolean indicating whether the patient is currently receiving long-term oxygen therapy."} ;; "the patient is receiving treatment with long-term oxygen therapy"

(declare-const patient_is_undergoing_oxygen_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving treatment with oxygen therapy.","when_to_set_to_false":"Set to false if the patient is currently not receiving treatment with oxygen therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving oxygen therapy.","meaning":"Boolean indicating whether the patient is currently receiving oxygen therapy."} ;; "the patient is receiving treatment with oxygen therapy"

(declare-const patient_is_undergoing_oxygen_therapy_now@@nocturnal Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving oxygen therapy and the therapy is nocturnal.","when_to_set_to_false":"Set to false if the patient is currently receiving oxygen therapy and the therapy is not nocturnal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the oxygen therapy is nocturnal.","meaning":"Boolean indicating whether the patient is currently receiving oxygen therapy and the therapy is nocturnal."} ;; "the patient is receiving treatment with nocturnal oxygen therapy"

(declare-const patient_is_undergoing_oxygen_therapy_now@@required_for_greater_than_12_hours_per_day Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving oxygen therapy and the therapy is required for greater than 12 hours per day.","when_to_set_to_false":"Set to false if the patient is currently receiving oxygen therapy and the therapy is not required for greater than 12 hours per day.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the oxygen therapy is required for greater than 12 hours per day.","meaning":"Boolean indicating whether the patient is currently receiving oxygen therapy and the therapy is required for greater than 12 hours per day."} ;; "the patient is receiving treatment with nocturnal oxygen therapy required for greater than 12 hours per day"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable implies corresponding stem variable (nocturnal oxygen therapy)
(assert
(! (=> patient_is_undergoing_oxygen_therapy_now@@nocturnal
     patient_is_undergoing_oxygen_therapy_now)
:named REQ11_AUXILIARY0)) ;; "the patient is receiving treatment with nocturnal oxygen therapy"

;; Qualifier variable implies corresponding stem variable (required for greater than 12 hours per day)
(assert
(! (=> patient_is_undergoing_oxygen_therapy_now@@required_for_greater_than_12_hours_per_day
     patient_is_undergoing_oxygen_therapy_now)
:named REQ11_AUXILIARY1)) ;; "the patient is receiving treatment with nocturnal oxygen therapy required for greater than 12 hours per day"

;; ===================== Constraint Assertions (REQ 11) =====================
;; Exclusion: patient must NOT be receiving long-term oxygen therapy
(assert
(! (not patient_is_undergoing_long_term_oxygen_therapy_now)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient is receiving treatment with long-term oxygen therapy"

;; Exclusion: patient must NOT be receiving nocturnal oxygen therapy required for greater than 12 hours per day
(assert
(! (not (and patient_is_undergoing_oxygen_therapy_now@@nocturnal
             patient_is_undergoing_oxygen_therapy_now@@required_for_greater_than_12_hours_per_day))
:named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient is receiving treatment with nocturnal oxygen therapy required for greater than 12 hours per day"

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_mental_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of mental disorder (psychiatric disease) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of mental disorder (psychiatric disease) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of mental disorder (psychiatric disease) in their history.","meaning":"Boolean indicating whether the patient has ever had a mental disorder (psychiatric disease) in their history."} ;; "the patient has a history of psychiatric disease"
(declare-const patient_has_finding_of_intellectual_disability_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of intellectual disability (intellectual deficiency) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of intellectual disability (intellectual deficiency) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of intellectual disability (intellectual deficiency) in their history.","meaning":"Boolean indicating whether the patient has ever had intellectual disability (intellectual deficiency) in their history."} ;; "the patient has a history of intellectual deficiency"
(declare-const patient_has_finding_of_poor_motivation_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had poor motivation at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had poor motivation in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had poor motivation in their history.","meaning":"Boolean indicating whether the patient has ever had poor motivation in their history."} ;; "the patient has a history of poor motivation"
(declare-const patient_has_finding_of_condition_limiting_validity_of_informed_consent_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had any condition in their history that will limit the validity of informed consent to participate in the study.","when_to_set_to_false":"Set to false if the patient has never had any condition in their history that will limit the validity of informed consent to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had any condition in their history that will limit the validity of informed consent to participate in the study.","meaning":"Boolean indicating whether the patient has ever had any condition in their history that will limit the validity of informed consent to participate in the study."} ;; "the patient has a history of another condition that will limit the validity of informed consent to participate in the study"
(declare-const patient_has_finding_of_condition_limiting_potential_compliance_to_study_procedures_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had any condition in their history that will limit the potential compliance to study procedures.","when_to_set_to_false":"Set to false if the patient has never had any condition in their history that will limit the potential compliance to study procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had any condition in their history that will limit the potential compliance to study procedures.","meaning":"Boolean indicating whether the patient has ever had any condition in their history that will limit the potential compliance to study procedures."} ;; "the patient has a history of another condition that will limit the potential compliance to study procedures"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_finding_of_mental_disorder_inthehistory)
    :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of psychiatric disease."

(assert
(! (not patient_has_finding_of_intellectual_disability_inthehistory)
    :named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of intellectual deficiency."

(assert
(! (not patient_has_finding_of_poor_motivation_inthehistory)
    :named REQ12_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of poor motivation."

(assert
(! (not patient_has_finding_of_condition_limiting_validity_of_informed_consent_inthehistory)
    :named REQ12_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of another condition that will limit the validity of informed consent to participate in the study."

(assert
(! (not patient_has_finding_of_condition_limiting_potential_compliance_to_study_procedures_inthehistory)
    :named REQ12_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of another condition that will limit the potential compliance to study procedures."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_is_study_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a study investigator.","when_to_set_to_false":"Set to false if the patient is not a study investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a study investigator.","meaning":"Boolean indicating whether the patient is a study investigator."} ;; "the patient is a study investigator"
(declare-const patient_is_sub_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a sub-investigator.","when_to_set_to_false":"Set to false if the patient is not a sub-investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a sub-investigator.","meaning":"Boolean indicating whether the patient is a sub-investigator."} ;; "the patient is a sub-investigator"
(declare-const patient_is_study_coordinator Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a study coordinator.","when_to_set_to_false":"Set to false if the patient is not a study coordinator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a study coordinator.","meaning":"Boolean indicating whether the patient is a study coordinator."} ;; "the patient is a study coordinator"
(declare-const patient_is_employee_of_participating_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient is an employee of a participating investigator.","when_to_set_to_false":"Set to false if the patient is not an employee of a participating investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is an employee of a participating investigator.","meaning":"Boolean indicating whether the patient is an employee of a participating investigator."} ;; "the patient is an employee of a participating investigator"
(declare-const patient_is_immediate_family_member_of_study_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient is an immediate family member of a study investigator.","when_to_set_to_false":"Set to false if the patient is not an immediate family member of a study investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is an immediate family member of a study investigator.","meaning":"Boolean indicating whether the patient is an immediate family member of a study investigator."} ;; "the patient is an immediate family member of a study investigator"
(declare-const patient_is_immediate_family_member_of_sub_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient is an immediate family member of a sub-investigator.","when_to_set_to_false":"Set to false if the patient is not an immediate family member of a sub-investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is an immediate family member of a sub-investigator.","meaning":"Boolean indicating whether the patient is an immediate family member of a sub-investigator."} ;; "the patient is an immediate family member of a sub-investigator"
(declare-const patient_is_immediate_family_member_of_study_coordinator Bool) ;; {"when_to_set_to_true":"Set to true if the patient is an immediate family member of a study coordinator.","when_to_set_to_false":"Set to false if the patient is not an immediate family member of a study coordinator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is an immediate family member of a study coordinator.","meaning":"Boolean indicating whether the patient is an immediate family member of a study coordinator."} ;; "the patient is an immediate family member of a study coordinator"
(declare-const patient_is_immediate_family_member_of_employee_of_participating_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient is an immediate family member of an employee of a participating investigator.","when_to_set_to_false":"Set to false if the patient is not an immediate family member of an employee of a participating investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is an immediate family member of an employee of a participating investigator.","meaning":"Boolean indicating whether the patient is an immediate family member of an employee of a participating investigator."} ;; "the patient is an immediate family member of an employee of a participating investigator"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_is_immediate_family_member_of_study_investigator)
    :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is an immediate family member of a study investigator."

(assert
(! (not patient_is_immediate_family_member_of_sub_investigator)
    :named REQ13_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is an immediate family member of a sub-investigator."

(assert
(! (not patient_is_immediate_family_member_of_study_coordinator)
    :named REQ13_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is an immediate family member of a study coordinator."

(assert
(! (not patient_is_immediate_family_member_of_employee_of_participating_investigator)
    :named REQ13_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is an immediate family member of an employee of a participating investigator."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_grapefruit_consumption_per_day_after_visit_1_in_count Real) ;; {"when_to_set_to_value":"Set to the number of whole grapefruits the patient consumes per day after Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many whole grapefruits the patient consumes per day after Visit 1.","meaning":"Numeric value indicating the number of whole grapefruits the patient consumes per day after Visit 1."} ;; "the patient consumes more than one grapefruit per day after Visit 1"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not (> patient_grapefruit_consumption_per_day_after_visit_1_in_count 1))
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient consumes more than one grapefruit per day after Visit 1."
