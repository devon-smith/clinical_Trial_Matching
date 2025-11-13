;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged ≥ 21 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 21)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 21 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_chest_discomfort_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chest discomfort.","when_to_set_to_false":"Set to false if the patient currently does not have chest discomfort.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chest discomfort.","meaning":"Boolean indicating whether the patient currently has chest discomfort."} ;; "chest discomfort"
(declare-const patient_has_finding_of_acute_coronary_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms consistent with possible acute coronary syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms consistent with possible acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms consistent with possible acute coronary syndrome.","meaning":"Boolean indicating whether the patient currently has symptoms consistent with possible acute coronary syndrome."} ;; "other symptoms consistent with possible acute coronary syndrome"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must have (chest discomfort) OR (other symptoms consistent with possible acute coronary syndrome).
(assert
  (! (or patient_has_finding_of_chest_discomfort_now
         patient_has_finding_of_acute_coronary_syndrome_now)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of heart disease (cardiac disease).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of heart disease (cardiac disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of heart disease (cardiac disease).","meaning":"Boolean indicating whether the patient currently has a diagnosis of heart disease."} ;; "cardiac disease"
(declare-const treating_physician_feels_patient_could_be_discharged_home_if_cardiac_disease_excluded Bool) ;; {"when_to_set_to_true":"Set to true if the treating physician feels that the patient could be discharged home if cardiac disease was excluded.","when_to_set_to_false":"Set to false if the treating physician does not feel that the patient could be discharged home if cardiac disease was excluded.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the treating physician feels the patient could be discharged home if cardiac disease was excluded.","meaning":"Boolean indicating whether the treating physician feels that the patient could be discharged home if cardiac disease was excluded."} ;; "the treating physician must feel that the patient could be discharged home if cardiac disease was excluded"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! treating_physician_feels_patient_could_be_discharged_home_if_cardiac_disease_excluded
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the treating physician must feel that the patient could be discharged home if cardiac disease was excluded"
