;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_days Real) ;; {"when_to_set_to_value":"Set to the patient's current age in days if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in days is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in days."} // "aged ≥ 30 days"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≤ 5 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_days 30)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 30 days."

(assert
  (! (<= patient_age_value_recorded_now_in_years 5)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 5 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_time_of_illness_onset_value_recorded_inthehistory_withunit_days Real) ;; {"when_to_set_to_value":"Set to the number of days before now that the patient's illness onset occurred, if this information is recorded in the patient's history.","when_to_set_to_null":"Set to null if the time of illness onset is unknown, not documented, or cannot be determined.","meaning":"Numeric value (in days before now) representing the time of illness onset for the patient."} // "illness onset within the past ≤ 5 days"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (<= patient_time_of_illness_onset_value_recorded_inthehistory_withunit_days 5)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have illness onset within the past ≤ 5 days."

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_has_symptoms_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of fever.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of fever.","meaning":"Boolean indicating whether the patient currently has symptoms of fever."} // "symptoms of fever"
(declare-const patient_temperature_value_recorded_now_withunit_celsius Real) ;; {"when_to_set_to_value":"Set to the measured temperature value in degrees Celsius if a measurement recorded now is available.","when_to_set_to_null":"Set to null if no such temperature measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's temperature recorded now, in degrees Celsius."} // "temperature ≥ 38 degrees Celsius"
(declare-const patient_has_symptoms_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of cough.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of cough.","meaning":"Boolean indicating whether the patient currently has symptoms of cough."} // "cough"
(declare-const patient_has_symptoms_of_runny_nose_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of runny nose.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of runny nose.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of runny nose.","meaning":"Boolean indicating whether the patient currently has symptoms of runny nose."} // "runny nose"
(declare-const patient_has_symptoms_of_nasal_congestion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of nasal congestion.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of nasal congestion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of nasal congestion.","meaning":"Boolean indicating whether the patient currently has symptoms of nasal congestion."} // "nasal congestion"
(declare-const patient_has_symptoms_of_sneezing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of sneezing.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of sneezing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of sneezing.","meaning":"Boolean indicating whether the patient currently has symptoms of sneezing."} // "sneezing"
(declare-const patient_sneezing_value_recorded_now_withunit_times_per_day Real) ;; {"when_to_set_to_value":"Set to the measured frequency value in times per day if a measurement recorded now is available.","when_to_set_to_null":"Set to null if no such frequency measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the frequency of sneezing recorded now, in times per day."} // "sneezing (frequency ≥ 2 times within one day)"
(declare-const patient_has_symptoms_of_fever_now@@present_at_time_of_presentation_or_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient's symptoms of fever are present at the time of presentation to the emergency department or at the time of admission to the hospital.","when_to_set_to_false":"Set to false if the patient's symptoms of fever are not present at the time of presentation to the emergency department or at the time of admission to the hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's symptoms of fever are present at the time of presentation or admission.","meaning":"Boolean indicating whether the patient's symptoms of fever are present at the time of presentation to the emergency department or admission to the hospital."} // "these symptoms are present at the time of presentation to the emergency department OR these symptoms are present at the time of admission to the hospital"
(declare-const patient_has_symptoms_of_cough_now@@present_at_time_of_presentation_or_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient's symptoms of cough are present at the time of presentation to the emergency department or at the time of admission to the hospital.","when_to_set_to_false":"Set to false if the patient's symptoms of cough are not present at the time of presentation to the emergency department or at the time of admission to the hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's symptoms of cough are present at the time of presentation or admission.","meaning":"Boolean indicating whether the patient's symptoms of cough are present at the time of presentation to the emergency department or admission to the hospital."} // "these symptoms are present at the time of presentation to the emergency department OR these symptoms are present at the time of admission to the hospital"
(declare-const patient_has_symptoms_of_runny_nose_now@@present_at_time_of_presentation_or_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient's symptoms of runny nose are present at the time of presentation to the emergency department or at the time of admission to the hospital.","when_to_set_to_false":"Set to false if the patient's symptoms of runny nose are not present at the time of presentation to the emergency department or at the time of admission to the hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's symptoms of runny nose are present at the time of presentation or admission.","meaning":"Boolean indicating whether the patient's symptoms of runny nose are present at the time of presentation to the emergency department or admission to the hospital."} // "these symptoms are present at the time of presentation to the emergency department OR these symptoms are present at the time of admission to the hospital"
(declare-const patient_has_symptoms_of_nasal_congestion_now@@present_at_time_of_presentation_or_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient's symptoms of nasal congestion are present at the time of presentation to the emergency department or at the time of admission to the hospital.","when_to_set_to_false":"Set to false if the patient's symptoms of nasal congestion are not present at the time of presentation to the emergency department or at the time of admission to the hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's symptoms of nasal congestion are present at the time of presentation or admission.","meaning":"Boolean indicating whether the patient's symptoms of nasal congestion are present at the time of presentation to the emergency department or admission to the hospital."} // "these symptoms are present at the time of presentation to the emergency department OR these symptoms are present at the time of admission to the hospital"
(declare-const patient_has_symptoms_of_sneezing_now@@present_at_time_of_presentation_or_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient's symptoms of sneezing are present at the time of presentation to the emergency department or at the time of admission to the hospital.","when_to_set_to_false":"Set to false if the patient's symptoms of sneezing are not present at the time of presentation to the emergency department or at the time of admission to the hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's symptoms of sneezing are present at the time of presentation or admission.","meaning":"Boolean indicating whether the patient's symptoms of sneezing are present at the time of presentation to the emergency department or admission to the hospital."} // "these symptoms are present at the time of presentation to the emergency department OR these symptoms are present at the time of admission to the hospital"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: fever symptom is present if temperature ≥ 38°C
(assert
  (! (= patient_has_symptoms_of_fever_now
        (>= patient_temperature_value_recorded_now_withunit_celsius 38.0))
     :named REQ2_AUXILIARY0)) ;; "symptoms of fever (temperature ≥ 38 degrees Celsius)"

;; Definition: sneezing symptom is present if frequency ≥ 2 times/day
(assert
  (! (= patient_has_symptoms_of_sneezing_now
        (>= patient_sneezing_value_recorded_now_withunit_times_per_day 2.0))
     :named REQ2_AUXILIARY1)) ;; "sneezing (frequency ≥ 2 times within one day)"

;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_symptoms_of_fever_now@@present_at_time_of_presentation_or_admission
         patient_has_symptoms_of_fever_now)
     :named REQ2_AUXILIARY2)) ;; "symptoms of fever present at time of presentation/admission"
(assert
  (! (=> patient_has_symptoms_of_cough_now@@present_at_time_of_presentation_or_admission
         patient_has_symptoms_of_cough_now)
     :named REQ2_AUXILIARY3)) ;; "cough present at time of presentation/admission"
(assert
  (! (=> patient_has_symptoms_of_runny_nose_now@@present_at_time_of_presentation_or_admission
         patient_has_symptoms_of_runny_nose_now)
     :named REQ2_AUXILIARY4)) ;; "runny nose present at time of presentation/admission"
(assert
  (! (=> patient_has_symptoms_of_nasal_congestion_now@@present_at_time_of_presentation_or_admission
         patient_has_symptoms_of_nasal_congestion_now)
     :named REQ2_AUXILIARY5)) ;; "nasal congestion present at time of presentation/admission"
(assert
  (! (=> patient_has_symptoms_of_sneezing_now@@present_at_time_of_presentation_or_admission
         patient_has_symptoms_of_sneezing_now)
     :named REQ2_AUXILIARY6)) ;; "sneezing present at time of presentation/admission"

;; Definition: at least one of the following symptoms present now
(define-fun patient_has_at_least_one_of_cough_runny_nose_nasal_congestion_sneezing_now () Bool
  (or patient_has_symptoms_of_cough_now
      patient_has_symptoms_of_runny_nose_now
      patient_has_symptoms_of_nasal_congestion_now
      patient_has_symptoms_of_sneezing_now)) ;; "at least one of the following: cough OR runny nose OR nasal congestion OR sneezing (frequency ≥ 2 times within one day)"

;; Definition: at least one of the following symptoms present at time of presentation/admission
(define-fun patient_has_at_least_one_of_cough_runny_nose_nasal_congestion_sneezing_present_at_time_of_presentation_or_admission () Bool
  (or patient_has_symptoms_of_cough_now@@present_at_time_of_presentation_or_admission
      patient_has_symptoms_of_runny_nose_now@@present_at_time_of_presentation_or_admission
      patient_has_symptoms_of_nasal_congestion_now@@present_at_time_of_presentation_or_admission
      patient_has_symptoms_of_sneezing_now@@present_at_time_of_presentation_or_admission)) ;; "at least one of the following present at time of presentation/admission"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: fever (temperature ≥ 38°C)
(assert
  (! patient_has_symptoms_of_fever_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "symptoms of fever (temperature ≥ 38 degrees Celsius)"

;; Component 1: at least one of cough/runny nose/nasal congestion/sneezing (frequency ≥ 2/day)
(assert
  (! patient_has_at_least_one_of_cough_runny_nose_nasal_congestion_sneezing_now
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "at least one of the following: cough OR runny nose OR nasal congestion OR sneezing (frequency ≥ 2 times within one day)"

;; Component 2: symptoms present at time of presentation to ED OR admission to hospital
(assert
  (! (and
        (or patient_has_symptoms_of_fever_now@@present_at_time_of_presentation_or_admission
            patient_has_at_least_one_of_cough_runny_nose_nasal_congestion_sneezing_present_at_time_of_presentation_or_admission))
     :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "these symptoms are present at the time of presentation to the emergency department OR these symptoms are present at the time of admission to the hospital"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_able_to_give_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to give informed consent.","when_to_set_to_false":"Set to false if the patient is not able to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to give informed consent.","meaning":"Boolean indicating whether the patient is able to give informed consent."} // "the patient ... must be able to give informed consent"
(declare-const parent_is_able_to_give_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the parent of the patient is able to give informed consent.","when_to_set_to_false":"Set to false if the parent of the patient is not able to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the parent of the patient is able to give informed consent.","meaning":"Boolean indicating whether the parent of the patient is able to give informed consent."} // "the parent ... must be able to give informed consent"
(declare-const guardian_is_able_to_give_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the guardian of the patient is able to give informed consent.","when_to_set_to_false":"Set to false if the guardian of the patient is not able to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the guardian of the patient is able to give informed consent.","meaning":"Boolean indicating whether the guardian of the patient is able to give informed consent."} // "the guardian ... must be able to give informed consent"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: "the patient or the parent or guardian of the patient must be able to give informed consent."
(assert
  (! (or patient_is_able_to_give_informed_consent
         parent_is_able_to_give_informed_consent
         guardian_is_able_to_give_informed_consent)
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient or the parent or guardian of the patient must be able to give informed consent."
