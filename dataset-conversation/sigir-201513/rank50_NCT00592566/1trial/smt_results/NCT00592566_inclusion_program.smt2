;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  // "an adult (age > 14 years)"
(declare-const patient_is_adult_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently an adult, defined as age greater than 14 years.","when_to_set_to_false":"Set to false if the patient is currently not an adult, defined as age 14 years or less.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an adult.","meaning":"Boolean indicating whether the patient is currently an adult (age greater than 14 years)."}  // "an adult (age > 14 years)"
(declare-const patient_has_finding_of_leptospirosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of leptospirosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of leptospirosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of leptospirosis.","meaning":"Boolean indicating whether the patient currently has leptospirosis."}  // "leptospirosis"
(declare-const patient_has_finding_of_leptospirosis_now@@suspected Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current clinical finding of leptospirosis is suspected.","when_to_set_to_false":"Set to false if the patient's current clinical finding of leptospirosis is not suspected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current clinical finding of leptospirosis is suspected.","meaning":"Boolean indicating whether the patient's current clinical finding of leptospirosis is suspected."}  // "suspected severe leptospirosis"
(declare-const patient_has_finding_of_leptospirosis_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current clinical finding of leptospirosis is severe.","when_to_set_to_false":"Set to false if the patient's current clinical finding of leptospirosis is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current clinical finding of leptospirosis is severe.","meaning":"Boolean indicating whether the patient's current clinical finding of leptospirosis is severe."}  // "suspected severe leptospirosis"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition: patient_is_adult_now is true iff patient_age_value_recorded_now_in_years > 14
(assert
  (! (= patient_is_adult_now
        (> patient_age_value_recorded_now_in_years 14))
     :named REQ0_AUXILIARY0)) ;; "an adult (age > 14 years)"

;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_leptospirosis_now@@suspected
         patient_has_finding_of_leptospirosis_now)
     :named REQ0_AUXILIARY1)) ;; "suspected severe leptospirosis"

(assert
  (! (=> patient_has_finding_of_leptospirosis_now@@severe
         patient_has_finding_of_leptospirosis_now)
     :named REQ0_AUXILIARY2)) ;; "suspected severe leptospirosis"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: patient must be an adult (age > 14 years)
(assert
  (! patient_is_adult_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "an adult (age > 14 years)"

;; Component 1: patient must have suspected severe leptospirosis
(assert
  (! (and patient_has_finding_of_leptospirosis_now@@suspected
          patient_has_finding_of_leptospirosis_now@@severe)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "suspected severe leptospirosis"

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fever.","when_to_set_to_false":"Set to false if the patient currently does not have fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fever.","meaning":"Boolean indicating whether the patient currently has fever."} // "fever"
(declare-const patient_has_finding_of_fever_now@@acute Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current fever episode is acute.","when_to_set_to_false":"Set to false if the patient's current fever episode is not acute.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current fever episode is acute.","meaning":"Boolean indicating whether the patient's current fever episode is acute."} // "acute fever"
(declare-const patient_has_finding_of_fever_now@@duration_less_than_15_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current fever episode has lasted less than 15 days.","when_to_set_to_false":"Set to false if the patient's current fever episode has lasted 15 days or more.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current fever episode has lasted less than 15 days.","meaning":"Boolean indicating whether the patient's current fever episode has lasted less than 15 days."} // "for < 15 days"
(declare-const patient_oral_temperature_value_recorded_now_withunit_degrees_celsius Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's oral temperature in degrees Celsius recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current oral temperature in degrees Celsius."} // "oral temperature > 38.00 degrees Celsius"
(declare-const patient_has_finding_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder due to infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder due to infection.","meaning":"Boolean indicating whether the patient currently has a disorder due to infection."} // "infection"
(declare-const patient_has_finding_of_disorder_due_to_infection_now@@absence_of_obvious_focus Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection and there is no obvious focus of infection.","when_to_set_to_false":"Set to false if the patient currently has a disorder due to infection and there is an obvious focus of infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is an obvious focus of infection.","meaning":"Boolean indicating whether the patient currently has a disorder due to infection and there is an absence of an obvious focus of infection."} // "absence of an obvious focus of infection"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: oral temperature > 38.00 degrees Celsius implies fever
(assert
  (! (=> (> patient_oral_temperature_value_recorded_now_withunit_degrees_celsius 38.00)
         patient_has_finding_of_fever_now)
     :named REQ1_AUXILIARY0)) ;; "oral temperature > 38.00 degrees Celsius"

;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_fever_now@@acute
         patient_has_finding_of_fever_now)
     :named REQ1_AUXILIARY1)) ;; "acute fever"

(assert
  (! (=> patient_has_finding_of_fever_now@@duration_less_than_15_days
         patient_has_finding_of_fever_now)
     :named REQ1_AUXILIARY2)) ;; "fever for < 15 days"

(assert
  (! (=> patient_has_finding_of_disorder_due_to_infection_now@@absence_of_obvious_focus
         patient_has_finding_of_disorder_due_to_infection_now)
     :named REQ1_AUXILIARY3)) ;; "absence of an obvious focus of infection"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Presented with acute fever (oral temperature > 38.00 degrees Celsius) for < 15 days
(assert
  (! (and (> patient_oral_temperature_value_recorded_now_withunit_degrees_celsius 38.00)
          patient_has_finding_of_fever_now@@acute
          patient_has_finding_of_fever_now@@duration_less_than_15_days)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "presented with acute fever (oral temperature > 38.00 degrees Celsius) for < 15 days"

;; Component 1: Absence of an obvious focus of infection
(assert
  (! patient_has_finding_of_disorder_due_to_infection_now@@absence_of_obvious_focus
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "absence of an obvious focus of infection"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_pulmonary_hemorrhage_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pulmonary hemorrhage, as determined by the attending physician.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pulmonary hemorrhage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pulmonary hemorrhage.","meaning":"Boolean indicating whether the patient currently has pulmonary hemorrhage."} // "possible pulmonary hemorrhage (in the opinion of the attending physician)"
(declare-const patient_has_finding_of_hemoptysis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hemoptysis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hemoptysis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hemoptysis.","meaning":"Boolean indicating whether the patient currently has hemoptysis."} // "history of hemoptysis"
(declare-const patient_has_finding_of_bilateral_nodular_infiltration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bilateral nodular infiltration.","when_to_set_to_false":"Set to false if the patient currently does not have bilateral nodular infiltration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bilateral nodular infiltration.","meaning":"Boolean indicating whether the patient currently has bilateral nodular infiltration."} // "bilateral nodular infiltration"
(declare-const patient_has_finding_of_bilateral_air_space_infiltration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bilateral air space infiltration.","when_to_set_to_false":"Set to false if the patient currently does not have bilateral air space infiltration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bilateral air space infiltration.","meaning":"Boolean indicating whether the patient currently has bilateral air space infiltration."} // "bilateral air space infiltration"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply possible pulmonary hemorrhage
(assert
  (! (=> (or patient_has_finding_of_hemoptysis_now
             patient_has_finding_of_bilateral_nodular_infiltration_now
             patient_has_finding_of_bilateral_air_space_infiltration_now)
         patient_has_finding_of_pulmonary_hemorrhage_now)
     :named REQ2_AUXILIARY0)) ;; "history of hemoptysis OR bilateral nodular infiltration OR bilateral air space infiltration" are non-exhaustive examples of possible pulmonary hemorrhage

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_pulmonary_hemorrhage_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, in the opinion of the attending physician, the patient must have possible pulmonary hemorrhage"
