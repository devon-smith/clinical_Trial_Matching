;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_undergoing_clinical_trial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in a clinical trial.","when_to_set_to_false":"Set to false if the patient is currently not participating in a clinical trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in a clinical trial.","meaning":"Boolean indicating whether the patient is currently participating in a clinical trial."} ;; "clinical trial"
(declare-const patient_is_participating_in_intervention_study_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in any intervention study (other than a clinical trial).","when_to_set_to_false":"Set to false if the patient is currently not participating in any intervention study (other than a clinical trial).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in any intervention study (other than a clinical trial).","meaning":"Boolean indicating whether the patient is currently participating in any intervention study (other than a clinical trial)."} ;; "other intervention studies"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (or patient_is_undergoing_clinical_trial_now
              patient_is_participating_in_intervention_study_now))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is participating in a clinical trial) OR (the patient is participating in other intervention studies)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "less than fourteen years of age"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 14))
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is less than fourteen years of age."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_hospital_acquired_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently meets the criteria for hospital acquired pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not meet the criteria for hospital acquired pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently meets the criteria for hospital acquired pneumonia.","meaning":"Boolean indicating whether the patient currently has hospital acquired pneumonia."} ;; "hospital acquired pneumonia"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_hospital_acquired_pneumonia_now)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient meets the criteria of hospital acquired pneumonia."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_active_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of active tuberculosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of active tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of active tuberculosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of active tuberculosis."} ;; "active tuberculosis"
(declare-const patient_is_undergoing_tb_chemotherapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing tuberculosis chemotherapy (treatment for tuberculosis).","when_to_set_to_false":"Set to false if the patient is not currently undergoing tuberculosis chemotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing tuberculosis chemotherapy.","meaning":"Boolean indicating whether the patient is currently undergoing tuberculosis chemotherapy (treatment for tuberculosis)."} ;; "treatment for tuberculosis"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (or patient_has_diagnosis_of_active_tuberculosis_now
            patient_is_undergoing_tb_chemotherapy_now))
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has known active tuberculosis) OR (the patient is currently receiving treatment for tuberculosis)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_interstitial_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding or diagnosis of interstitial pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a finding or diagnosis of interstitial pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding or diagnosis of interstitial pneumonia.","meaning":"Boolean indicating whether the patient currently has a finding or diagnosis of interstitial pneumonia."} ;; "interstitial pneumonia"
(declare-const patient_has_finding_of_interstitial_pneumonia_now@@non_infectious Bool) ;; {"when_to_set_to_true":"Set to true if the patient's interstitial pneumonia is non-infectious.","when_to_set_to_false":"Set to false if the patient's interstitial pneumonia is infectious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's interstitial pneumonia is non-infectious.","meaning":"Boolean indicating whether the patient's interstitial pneumonia is non-infectious."} ;; "interstitial pneumonia (non-infectious)"
(declare-const patient_has_finding_of_pulmonary_edema_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding or diagnosis of pulmonary edema.","when_to_set_to_false":"Set to false if the patient currently does not have a finding or diagnosis of pulmonary edema.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding or diagnosis of pulmonary edema.","meaning":"Boolean indicating whether the patient currently has a finding or diagnosis of pulmonary edema."} ;; "pulmonary edema"
(declare-const patient_has_finding_of_pulmonary_edema_now@@non_infectious Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pulmonary edema is non-infectious.","when_to_set_to_false":"Set to false if the patient's pulmonary edema is infectious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's pulmonary edema is non-infectious.","meaning":"Boolean indicating whether the patient's pulmonary edema is non-infectious."} ;; "pulmonary edema (non-infectious)"
(declare-const patient_has_finding_of_pulmonary_embolism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding or diagnosis of pulmonary embolism.","when_to_set_to_false":"Set to false if the patient currently does not have a finding or diagnosis of pulmonary embolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding or diagnosis of pulmonary embolism.","meaning":"Boolean indicating whether the patient currently has a finding or diagnosis of pulmonary embolism."} ;; "pulmonary embolism"
(declare-const patient_has_finding_of_pulmonary_vasculitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding or diagnosis of pulmonary vasculitis.","when_to_set_to_false":"Set to false if the patient currently does not have a finding or diagnosis of pulmonary vasculitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding or diagnosis of pulmonary vasculitis.","meaning":"Boolean indicating whether the patient currently has a finding or diagnosis of pulmonary vasculitis."} ;; "pulmonary vasculitis"
(declare-const patient_has_finding_of_pulmonary_vasculitis_now@@non_infectious Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pulmonary vasculitis is non-infectious.","when_to_set_to_false":"Set to false if the patient's pulmonary vasculitis is infectious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's pulmonary vasculitis is non-infectious.","meaning":"Boolean indicating whether the patient's pulmonary vasculitis is non-infectious."} ;; "pulmonary vasculitis (non-infectious)"
(declare-const patient_has_finding_of_non_infectious_pulmonary_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any non-infectious pulmonary disease (including but not limited to pulmonary embolism, pulmonary edema, pulmonary vasculitis, or interstitial pneumonia).","when_to_set_to_false":"Set to false if the patient currently does not have any non-infectious pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any non-infectious pulmonary disease.","meaning":"Boolean indicating whether the patient currently has any non-infectious pulmonary disease."} ;; "non-infectious pulmonary diseases"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_pulmonary_embolism_now
           patient_has_finding_of_pulmonary_edema_now@@non_infectious
           patient_has_finding_of_pulmonary_vasculitis_now@@non_infectious
           patient_has_finding_of_interstitial_pneumonia_now@@non_infectious)
        patient_has_finding_of_non_infectious_pulmonary_disease_now)
:named REQ4_AUXILIARY0)) ;; "with non-exhaustive examples (pulmonary embolism, pulmonary edema, pulmonary vasculitis, interstitial pneumonia)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_interstitial_pneumonia_now@@non_infectious
       patient_has_finding_of_interstitial_pneumonia_now)
:named REQ4_AUXILIARY1)) ;; "interstitial pneumonia (non-infectious)"

(assert
(! (=> patient_has_finding_of_pulmonary_edema_now@@non_infectious
       patient_has_finding_of_pulmonary_edema_now)
:named REQ4_AUXILIARY2)) ;; "pulmonary edema (non-infectious)"

(assert
(! (=> patient_has_finding_of_pulmonary_vasculitis_now@@non_infectious
       patient_has_finding_of_pulmonary_vasculitis_now)
:named REQ4_AUXILIARY3)) ;; "pulmonary vasculitis (non-infectious)"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_non_infectious_pulmonary_disease_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has non-infectious pulmonary diseases with non-exhaustive examples (pulmonary embolism, pulmonary edema, pulmonary vasculitis, interstitial pneumonia)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has human immunodeficiency virus infection (HIV infection).","when_to_set_to_false":"Set to false if the patient currently does not have human immunodeficiency virus infection (HIV infection).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has human immunodeficiency virus infection (HIV infection).","meaning":"Boolean indicating whether the patient currently has human immunodeficiency virus infection (HIV infection)."} ;; "human immunodeficiency virus infection"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_human_immunodeficiency_virus_infection_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is positive for human immunodeficiency virus infection."
