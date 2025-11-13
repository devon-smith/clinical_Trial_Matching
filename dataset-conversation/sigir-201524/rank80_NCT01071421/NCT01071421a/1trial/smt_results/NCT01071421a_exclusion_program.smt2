;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_healthcare_associated_infectious_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a healthcare-associated (nosocomial) infectious disease.","when_to_set_to_false":"Set to false if the patient currently does not have a healthcare-associated (nosocomial) infectious disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a healthcare-associated (nosocomial) infectious disease.","meaning":"Boolean indicating whether the patient currently has a healthcare-associated (nosocomial) infectious disease."} ;; "nosocomial infection"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_healthcare_associated_infectious_disease_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a nosocomial infection."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_conscientiousness_value_recorded_now_withunit_standard_score Real) ;; {"when_to_set_to_value":"Set to the patient's current conscientiousness standardized score if available.","when_to_set_to_null":"Set to null if the patient's current conscientiousness standardized score is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current conscientiousness level as a standardized score."} ;; "conscientiousness level as measured by a standardized score, recorded at the current time."

(declare-const patient_conscientiousness_value_recorded_now_withunit_standard_score@@at_a_low_level Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current conscientiousness standardized score is considered low according to the relevant threshold.","when_to_set_to_false":"Set to false if the patient's current conscientiousness standardized score is not considered low.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current conscientiousness standardized score is at a low level.","meaning":"Boolean indicating whether the patient's current conscientiousness standardized score is at a low level."} ;; "low level of conscientiousness"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_conscientiousness_value_recorded_now_withunit_standard_score@@at_a_low_level)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a low level of conscientiousness."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_disorder_of_nervous_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of disorder of the nervous system (neurological disease).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of disorder of the nervous system (neurological disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of disorder of the nervous system (neurological disease).","meaning":"Boolean indicating whether the patient currently has a disorder of the nervous system (neurological disease)."} ;; "neurological disease"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_disorder_of_nervous_system_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a neurological disease."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_unable_to_complete_questionnaires_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to complete the questionnaires.","when_to_set_to_false":"Set to false if the patient is currently able to complete the questionnaires.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to complete the questionnaires.","meaning":"Boolean indicating whether the patient is currently unable to complete the questionnaires."} ;; "The patient is excluded if the patient is unable to complete the questionnaires."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_unable_to_complete_questionnaires_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to complete the questionnaires."
