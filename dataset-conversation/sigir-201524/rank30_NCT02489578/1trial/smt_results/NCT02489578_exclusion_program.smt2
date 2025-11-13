;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "less than fourteen years of age"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 14))
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is less than fourteen years of age."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_hospital_acquired_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently meets the criteria for hospital acquired pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not meet the criteria for hospital acquired pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently meets the criteria for hospital acquired pneumonia.","meaning":"Boolean indicating whether the patient currently meets the criteria for hospital acquired pneumonia."} ;; "hospital acquired pneumonia"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_hospital_acquired_pneumonia_now)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient meets the criteria of hospital acquired pneumonia."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_active_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of active tuberculosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of active tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of active tuberculosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of active tuberculosis."} ;; "the patient has known active tuberculosis"
(declare-const patient_has_diagnosis_of_active_tuberculosis_now@@diagnosis_is_known Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of active tuberculosis is known to the patient or provider.","when_to_set_to_false":"Set to false if the diagnosis of active tuberculosis is not known to the patient or provider.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the diagnosis of active tuberculosis is known.","meaning":"Boolean indicating whether the diagnosis of active tuberculosis is known to the patient or provider."} ;; "known active tuberculosis"
(declare-const patient_is_undergoing_tb_chemotherapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing tuberculosis chemotherapy (treatment for tuberculosis).","when_to_set_to_false":"Set to false if the patient is not currently undergoing tuberculosis chemotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing tuberculosis chemotherapy.","meaning":"Boolean indicating whether the patient is currently undergoing tuberculosis chemotherapy (treatment for tuberculosis)."} ;; "currently receiving treatment for tuberculosis"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_active_tuberculosis_now@@diagnosis_is_known
      patient_has_diagnosis_of_active_tuberculosis_now)
    :named REQ2_AUXILIARY0)) ;; "known active tuberculosis"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT have known active tuberculosis OR be currently receiving treatment for tuberculosis
(assert
(! (not (or patient_has_diagnosis_of_active_tuberculosis_now@@diagnosis_is_known
            patient_is_undergoing_tb_chemotherapy_now))
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has known active tuberculosis) OR (the patient is currently receiving treatment for tuberculosis)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_disorder_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disorder of the lung (pulmonary disease).","when_to_set_to_false":"Set to false if the patient currently does not have any disorder of the lung (pulmonary disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disorder of the lung (pulmonary disease).","meaning":"Boolean indicating whether the patient currently has any disorder of the lung (pulmonary disease)."} ;; "pulmonary diseases"
(declare-const patient_has_finding_of_disorder_of_lung_now@@noninfectious Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the lung (pulmonary disease) and the disorder is non-infectious.","when_to_set_to_false":"Set to false if the patient currently has a disorder of the lung (pulmonary disease) and the disorder is infectious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder of the lung (pulmonary disease) is non-infectious.","meaning":"Boolean indicating whether the patient's current disorder of the lung (pulmonary disease) is non-infectious."} ;; "non-infectious pulmonary diseases"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_of_lung_now@@noninfectious
      patient_has_finding_of_disorder_of_lung_now)
:named REQ3_AUXILIARY0)) ;; "non-infectious pulmonary diseases" implies "pulmonary diseases"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_disorder_of_lung_now@@noninfectious)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has non-infectious pulmonary diseases."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_hiv_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently positive for HIV infection.","when_to_set_to_false":"Set to false if the patient is currently not positive for HIV infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently positive for HIV infection.","meaning":"Boolean indicating whether the patient is currently positive for HIV infection."} ;; "positive for human immunodeficiency virus infection"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_has_finding_of_hiv_positive_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is positive for human immunodeficiency virus infection."
