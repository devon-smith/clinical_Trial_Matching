;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently male."} // "be a male child"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently female."} // "be a female child"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "have age less than 6 years at the time of admission in hospital"
(declare-const patient_is_undergoing_hospital_admission_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing admission in hospital.","when_to_set_to_false":"Set to false if the patient is not currently undergoing admission in hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing admission in hospital.","meaning":"Boolean indicating whether the patient is currently undergoing admission in hospital."} // "admission in hospital"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: (be a male child OR be a female child)
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must (be a male child OR be a female child)."

;; Component 1: (have age less than 6 years at the time of admission in hospital)
(assert
  (! (and patient_is_undergoing_hospital_admission_now
          (< patient_age_value_recorded_now_in_years 6))
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have age less than 6 years at the time of admission in hospital."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_acute_gastroenteritis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute gastroenteritis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute gastroenteritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute gastroenteritis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute gastroenteritis."} // "acute gastroenteritis"
(declare-const patient_has_diagnosis_of_viral_gastroenteritis_due_to_rotavirus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of rotavirus gastroenteritis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of rotavirus gastroenteritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of rotavirus gastroenteritis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of rotavirus gastroenteritis."} // "rotavirus gastroenteritis"
(declare-const patient_is_hospitalized_during_survey_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient is hospitalized at any time during the survey period.","when_to_set_to_false":"Set to false if the patient is not hospitalized at any time during the survey period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is hospitalized during the survey period.","meaning":"Boolean indicating whether the patient is hospitalized at any time during the survey period."} // "hospitalized ... during the survey period"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must (be hospitalized with any acute gastroenteritis during the survey period OR be hospitalized with rotavirus gastroenteritis during the survey period).
(assert
  (! (or
        (and patient_is_hospitalized_during_survey_period patient_has_diagnosis_of_acute_gastroenteritis_now)
        (and patient_is_hospitalized_during_survey_period patient_has_diagnosis_of_viral_gastroenteritis_due_to_rotavirus_now)
     )
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))
