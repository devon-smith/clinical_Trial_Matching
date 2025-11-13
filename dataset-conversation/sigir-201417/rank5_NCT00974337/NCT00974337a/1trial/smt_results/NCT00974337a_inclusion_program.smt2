;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_infant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as an infant.","when_to_set_to_false":"Set to false if the patient is not currently classified as an infant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as an infant.","meaning":"Boolean indicating whether the patient is currently classified as an infant."} // "an infant"
(declare-const patient_has_history_of_preterm_birth Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of preterm birth.","when_to_set_to_false":"Set to false if the patient does not have a documented history of preterm birth.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of preterm birth.","meaning":"Boolean indicating whether the patient has a history of preterm birth."} // "preterm birth"
(declare-const patient_gestational_age_at_birth_value_recorded_in_weeks Real) ;; {"when_to_set_to_value":"Set to the patient's gestational age at birth in weeks if it is known and documented.","when_to_set_to_null":"Set to null if the patient's gestational age at birth in weeks is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's gestational age at birth in weeks."} // "gestational age at birth, recorded in weeks"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: "To be included, the patient must be an infant with preterm birth with gestational age ≥ 28 weeks."
(assert
  (! (and patient_is_infant_now
          patient_has_history_of_preterm_birth
          (>= patient_gestational_age_at_birth_value_recorded_in_weeks 28.0))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "an infant with preterm birth with gestational age ≥ 28 weeks"

;; Component 1: "To be included, the patient must be an infant with preterm birth with gestational age ≤ 34 weeks."
(assert
  (! (and patient_is_infant_now
          patient_has_history_of_preterm_birth
          (<= patient_gestational_age_at_birth_value_recorded_in_weeks 34.0))
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "an infant with preterm birth with gestational age ≤ 34 weeks"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_birth_weight_value_recorded_now_withunit_grams Real) ;; {"when_to_set_to_value":"Set to the measured birth weight in grams if a numeric measurement is available for the patient at birth.","when_to_set_to_null":"Set to null if no birth weight measurement in grams is available or the value is indeterminate.","meaning":"Numeric value representing the patient's birth weight in grams, recorded at birth."} // "birth weight"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have birth weight ≥ 750 grams.
(assert
  (! (>= patient_birth_weight_value_recorded_now_withunit_grams 750.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "birth weight ≥ 750 grams"

;; Component 1: To be included, the patient must have birth weight ≤ 1500 grams.
(assert
  (! (<= patient_birth_weight_value_recorded_now_withunit_grams 1500.0)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "birth weight ≤ 1500 grams"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_shock_inthepast1weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient had a clinical finding of shock at any time during the first week of life.","when_to_set_to_false":"Set to false if the patient did not have a clinical finding of shock during the first week of life.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had shock during the first week of life.","meaning":"Boolean indicating whether the patient had shock during the first week of life."} // "shock in the first week of life"
(declare-const patient_has_undergone_dopamine_therapy_inthepast1weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone dopamine therapy at any time during the first week of life.","when_to_set_to_false":"Set to false if the patient has not undergone dopamine therapy during the first week of life.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone dopamine therapy during the first week of life.","meaning":"Boolean indicating whether the patient has undergone dopamine therapy during the first week of life."} // "dopamine therapy in the first week of life"
(declare-const patient_has_undergone_dobutamine_therapy_inthepast1weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone dobutamine therapy at any time during the first week of life.","when_to_set_to_false":"Set to false if the patient has not undergone dobutamine therapy during the first week of life.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone dobutamine therapy during the first week of life.","meaning":"Boolean indicating whether the patient has undergone dobutamine therapy during the first week of life."} // "dobutamine therapy in the first week of life"
(declare-const dopamine_therapy_dose_value_recorded_inthepast1weeks_withunit_micrograms_per_kilogram_per_minute Real) ;; {"when_to_set_to_value":"Set to the numeric value of dopamine therapy dose administered to the patient during the first week of life, in micrograms per kilogram per minute.","when_to_set_to_null":"Set to null if the dose is unknown, not documented, or cannot be determined.","meaning":"Numeric value of dopamine therapy dose administered during the first week of life, in micrograms per kilogram per minute."} // "dopamine therapy dose > 10 mcg/kg/min in the first week of life"
(declare-const dobutamine_therapy_dose_value_recorded_inthepast1weeks_withunit_micrograms_per_kilogram_per_minute Real) ;; {"when_to_set_to_value":"Set to the numeric value of dobutamine therapy dose administered to the patient during the first week of life, in micrograms per kilogram per minute.","when_to_set_to_null":"Set to null if the dose is unknown, not documented, or cannot be determined.","meaning":"Numeric value of dobutamine therapy dose administered during the first week of life, in micrograms per kilogram per minute."} // "dobutamine therapy dose > 10 mcg/kg/min in the first week of life"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: patient has undergone dopamine therapy in the first week of life if the dose is known and > 0
(assert
  (! (= patient_has_undergone_dopamine_therapy_inthepast1weeks
        (> dopamine_therapy_dose_value_recorded_inthepast1weeks_withunit_micrograms_per_kilogram_per_minute 0.0))
     :named REQ2_AUXILIARY0)) ;; "patient has undergone dopamine therapy in the first week of life"

;; Definition: patient has undergone dobutamine therapy in the first week of life if the dose is known and > 0
(assert
  (! (= patient_has_undergone_dobutamine_therapy_inthepast1weeks
        (> dobutamine_therapy_dose_value_recorded_inthepast1weeks_withunit_micrograms_per_kilogram_per_minute 0.0))
     :named REQ2_AUXILIARY1)) ;; "patient has undergone dobutamine therapy in the first week of life"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: patient must have shock in the first week of life
(assert
  (! patient_has_finding_of_shock_inthepast1weeks
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "shock in the first week of life"

;; Component 1: patient must require vasopressor therapy (dopamine OR dobutamine OR both) in a dose > 10 mcg/kg/min
(assert
  (! (or (> dopamine_therapy_dose_value_recorded_inthepast1weeks_withunit_micrograms_per_kilogram_per_minute 10.0)
         (> dobutamine_therapy_dose_value_recorded_inthepast1weeks_withunit_micrograms_per_kilogram_per_minute 10.0))
     :named REQ2_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "require vasopressor therapy (dopamine therapy OR dobutamine therapy OR both) in a dose > 10 mcg/kg/min in the first week of life"
