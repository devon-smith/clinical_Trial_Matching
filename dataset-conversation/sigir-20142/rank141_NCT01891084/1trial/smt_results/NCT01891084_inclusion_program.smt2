;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_adult_now Bool) ;; "To be included, the patient must be an adult." {"when_to_set_to_true":"Set to true if the patient is currently considered an adult according to the study's definition (typically age ≥ 18 years, unless otherwise specified).","when_to_set_to_false":"Set to false if the patient is not currently considered an adult according to the study's definition.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient is currently considered an adult.","meaning":"Indicates whether the patient is currently considered an adult."}
(declare-const patient_age_value_recorded_now_in_years Real) ;; "age ≥ 18 years AND age ≤ 30 years" {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Patient must be an adult
(assert
  (! patient_is_adult_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be an adult."

;; Component 1: Patient age must be ≥ 18 years
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have age ≥ 18 years."

;; Component 2: Patient age must be ≤ 30 years
(assert
  (! (<= patient_age_value_recorded_now_in_years 30)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have age ≤ 30 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_body_temperature_value_recorded_now_withunit_celsius Real) ;; "body temperature ≥ 37.8°C" {"when_to_set_to_value":"Set to the measured value if the patient's body temperature in degrees Celsius is recorded now.","when_to_set_to_null":"Set to null if no body temperature measurement in degrees Celsius is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's body temperature recorded now, in degrees Celsius."}
(declare-const patient_has_finding_of_cough_now Bool) ;; "cough" {"when_to_set_to_true":"Set to true if the patient currently has cough.","when_to_set_to_false":"Set to false if the patient currently does not have cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cough.","meaning":"Boolean indicating whether the patient currently has cough."}
(declare-const patient_has_finding_of_headache_now Bool) ;; "headache" {"when_to_set_to_true":"Set to true if the patient currently has headache.","when_to_set_to_false":"Set to false if the patient currently does not have headache.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has headache.","meaning":"Boolean indicating whether the patient currently has headache."}
(declare-const patient_has_finding_of_joint_pain_now Bool) ;; "arthralgia" {"when_to_set_to_true":"Set to true if the patient currently has arthralgia (joint pain).","when_to_set_to_false":"Set to false if the patient currently does not have arthralgia (joint pain).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has arthralgia (joint pain).","meaning":"Boolean indicating whether the patient currently has arthralgia (joint pain)."}
(declare-const patient_has_finding_of_muscle_pain_now Bool) ;; "myalgia" {"when_to_set_to_true":"Set to true if the patient currently has myalgia (muscle pain).","when_to_set_to_false":"Set to false if the patient currently does not have myalgia (muscle pain).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has myalgia (muscle pain).","meaning":"Boolean indicating whether the patient currently has myalgia (muscle pain)."}
(declare-const patient_has_finding_of_nasal_discharge_now Bool) ;; "rhinorrhea" {"when_to_set_to_true":"Set to true if the patient currently has rhinorrhea (nasal discharge).","when_to_set_to_false":"Set to false if the patient currently does not have rhinorrhea (nasal discharge).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has rhinorrhea (nasal discharge).","meaning":"Boolean indicating whether the patient currently has rhinorrhea (nasal discharge)."}
(declare-const patient_has_finding_of_pain_in_throat_now Bool) ;; "sore throat" {"when_to_set_to_true":"Set to true if the patient currently has sore throat (pain in throat).","when_to_set_to_false":"Set to false if the patient currently does not have sore throat (pain in throat).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sore throat (pain in throat).","meaning":"Boolean indicating whether the patient currently has sore throat (pain in throat)."}
(declare-const patient_number_of_qualifying_symptoms_present_now Real) ;; "number of qualifying symptoms (body temperature ≥ 37.8°C, cough, rhinorrhea, sore throat, headache, myalgia, arthralgia) present in the patient now." {"when_to_set_to_value":"Set to the number of qualifying symptoms present in the patient now.","when_to_set_to_null":"Set to null if the number of qualifying symptoms present now cannot be determined or is not documented.","meaning":"Numeric value representing the number of qualifying symptoms (body temperature ≥ 37.8°C, cough, rhinorrhea, sore throat, headache, myalgia, arthralgia) present in the patient now."}
(declare-const patient_time_from_illness_onset_to_presentation_value_recorded_now_in_hours Real) ;; "number of hours from the patient's illness onset to the time of presentation, recorded now." {"when_to_set_to_value":"Set to the measured value if the number of hours from the patient's illness onset to the time of presentation is recorded now.","when_to_set_to_null":"Set to null if the time from illness onset to presentation in hours is not recorded or cannot be determined.","meaning":"Numeric value representing the number of hours from the patient's illness onset to the time of presentation, recorded now."}

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: qualifying symptom for body temperature
(define-fun patient_has_qualifying_body_temperature_now () Bool
  (>= patient_body_temperature_value_recorded_now_withunit_celsius 37.8)) ;; "body temperature ≥ 37.8°C"

;; Definition: number of qualifying symptoms present now
(assert
  (! (= patient_number_of_qualifying_symptoms_present_now
        (+ (ite patient_has_qualifying_body_temperature_now 1 0)
           (ite patient_has_finding_of_cough_now 1 0)
           (ite patient_has_finding_of_nasal_discharge_now 1 0)
           (ite patient_has_finding_of_pain_in_throat_now 1 0)
           (ite patient_has_finding_of_headache_now 1 0)
           (ite patient_has_finding_of_muscle_pain_now 1 0)
           (ite patient_has_finding_of_joint_pain_now 1 0)))
     :named REQ1_AUXILIARY0)) ;; "number of qualifying symptoms (body temperature ≥ 37.8°C, cough, rhinorrhea, sore throat, headache, myalgia, arthralgia) present in the patient now."

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: patient must present within 48 hours of illness onset
(assert
  (! (<= patient_time_from_illness_onset_to_presentation_value_recorded_now_in_hours 48.0)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must present within 48 hours of illness onset."

;; Component 1: patient must have at least two qualifying symptoms
(assert
  (! (>= patient_number_of_qualifying_symptoms_present_now 2)
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have at least two of the following symptoms: (body temperature ≥ 37.8°C), (cough), (rhinorrhea), (sore throat), (headache), (myalgia), (arthralgia)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_positive_measurement_finding_now Bool) ;; "positive result" {"when_to_set_to_true":"Set to true if the patient currently has a positive measurement finding.","when_to_set_to_false":"Set to false if the patient currently does not have a positive measurement finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive measurement finding.","meaning":"Boolean indicating whether the patient currently has a positive measurement finding."}
(declare-const patient_has_finding_of_positive_measurement_finding_now@@obtained_on_quickvue_rapid_influenza_test Bool) ;; "positive result on a QuickVue rapid influenza test" {"when_to_set_to_true":"Set to true if the patient's positive measurement finding was obtained on a QuickVue rapid influenza test.","when_to_set_to_false":"Set to false if the patient's positive measurement finding was not obtained on a QuickVue rapid influenza test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the positive measurement finding was obtained on a QuickVue rapid influenza test.","meaning":"Boolean indicating whether the patient's positive measurement finding was obtained on a QuickVue rapid influenza test."}

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies the corresponding stem variable
(assert
  (! (=> patient_has_finding_of_positive_measurement_finding_now@@obtained_on_quickvue_rapid_influenza_test
         patient_has_finding_of_positive_measurement_finding_now)
     :named REQ2_AUXILIARY0)) ;; "positive result on a QuickVue rapid influenza test" implies "positive result"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_positive_measurement_finding_now@@obtained_on_quickvue_rapid_influenza_test
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a positive result on a QuickVue rapid influenza test."
