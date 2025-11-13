;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "any age"

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must be of any age (always satisfiable for any real value)
(assert
  (! (or (and (>= patient_age_value_recorded_now_in_years 0)
              true)
         (= patient_age_value_recorded_now_in_years patient_age_value_recorded_now_in_years))
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be of any age."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_time_of_illness_onset_value_recorded_inthehistory_withunit_datetime Real) ;; {"when_to_set_to_value":"Set to the date or timestamp of illness onset if it is documented in the patient's history.","when_to_set_to_null":"Set to null if the time of illness onset is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the time (date or timestamp) when the patient's illness began, recorded in the patient's history."} // "illness onset"
(declare-const patient_time_since_illness_onset_value_now_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days between the current date/time and the date/time of illness onset if both are known.","when_to_set_to_null":"Set to null if either the current date/time or the illness onset date/time is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of days since the patient's illness onset as of now."} // "number of days since illness onset"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have illness onset within the past five days.
(assert
  (! (<= patient_time_since_illness_onset_value_now_in_days 5)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have illness onset within the past five days."

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_body_temperature_value_recorded_now_withunit_degrees_celsius Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body temperature in degrees Celsius is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's body temperature in degrees Celsius measured now."} // "body temperature ≥ 38 degrees Celsius"

(declare-const patient_has_symptoms_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of fever.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of fever.","meaning":"Boolean indicating whether the patient currently has symptoms of fever."} // "have symptoms of fever"

(declare-const patient_has_symptoms_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of cough.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of cough.","meaning":"Boolean indicating whether the patient currently has symptoms of cough."} // "cough"

(declare-const patient_has_symptoms_of_runny_nose_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of runny nose.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of runny nose.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of runny nose.","meaning":"Boolean indicating whether the patient currently has symptoms of runny nose."} // "runny nose"

(declare-const patient_has_symptoms_of_nasal_congestion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of nasal congestion.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of nasal congestion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of nasal congestion.","meaning":"Boolean indicating whether the patient currently has symptoms of nasal congestion."} // "nasal congestion"

(declare-const patient_has_symptoms_of_sneezing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of sneezing.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of sneezing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of sneezing.","meaning":"Boolean indicating whether the patient currently has symptoms of sneezing."} // "sneezing"

(declare-const patient_sneezing_value_recorded_now_withunit_times_per_day Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's sneezing frequency (number of times per day) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's sneezing frequency (number of times per day) measured now."} // "sneezing (frequency ≥ two times within one day)"

(declare-const patient_has_symptoms_of_fever_at_presentation_to_emergency_department_or_at_admission_to_hospital Bool) ;; {"when_to_set_to_true":"Set to true if the patient has symptoms of fever present at the time of presentation to the emergency department or at the time of admission to the hospital.","when_to_set_to_false":"Set to false if the patient does not have symptoms of fever present at the time of presentation to the emergency department or at the time of admission to the hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has symptoms of fever present at the time of presentation to the emergency department or at the time of admission to the hospital.","meaning":"Boolean indicating whether the patient has symptoms of fever present at the time of presentation to the emergency department or at the time of admission to the hospital."} // "symptoms must be present at the time of presentation to the emergency department OR at the time of admission to the hospital"

(declare-const patient_has_symptoms_of_cough_at_presentation_to_emergency_department_or_at_admission_to_hospital Bool) ;; {"when_to_set_to_true":"Set to true if the patient has symptoms of cough present at the time of presentation to the emergency department or at the time of admission to the hospital.","when_to_set_to_false":"Set to false if the patient does not have symptoms of cough present at the time of presentation to the emergency department or at the time of admission to the hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has symptoms of cough present at the time of presentation to the emergency department or at the time of admission to the hospital.","meaning":"Boolean indicating whether the patient has symptoms of cough present at the time of presentation to the emergency department or at the time of admission to the hospital."} // "symptoms must be present at the time of presentation to the emergency department OR at the time of admission to the hospital"

(declare-const patient_has_symptoms_of_runny_nose_at_presentation_to_emergency_department_or_at_admission_to_hospital Bool) ;; {"when_to_set_to_true":"Set to true if the patient has symptoms of runny nose present at the time of presentation to the emergency department or at the time of admission to the hospital.","when_to_set_to_false":"Set to false if the patient does not have symptoms of runny nose present at the time of presentation to the emergency department or at the time of admission to the hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has symptoms of runny nose present at the time of presentation to the emergency department or at the time of admission to the hospital.","meaning":"Boolean indicating whether the patient has symptoms of runny nose present at the time of presentation to the emergency department or at the time of admission to the hospital."} // "symptoms must be present at the time of presentation to the emergency department OR at the time of admission to the hospital"

(declare-const patient_has_symptoms_of_nasal_congestion_at_presentation_to_emergency_department_or_at_admission_to_hospital Bool) ;; {"when_to_set_to_true":"Set to true if the patient has symptoms of nasal congestion present at the time of presentation to the emergency department or at the time of admission to the hospital.","when_to_set_to_false":"Set to false if the patient does not have symptoms of nasal congestion present at the time of presentation to the emergency department or at the time of admission to the hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has symptoms of nasal congestion present at the time of presentation to the emergency department or at the time of admission to the hospital.","meaning":"Boolean indicating whether the patient has symptoms of nasal congestion present at the time of presentation to the emergency department or at the time of admission to the hospital."} // "symptoms must be present at the time of presentation to the emergency department OR at the time of admission to the hospital"

(declare-const patient_has_symptoms_of_sneezing_at_presentation_to_emergency_department_or_at_admission_to_hospital Bool) ;; {"when_to_set_to_true":"Set to true if the patient has symptoms of sneezing present at the time of presentation to the emergency department or at the time of admission to the hospital.","when_to_set_to_false":"Set to false if the patient does not have symptoms of sneezing present at the time of presentation to the emergency department or at the time of admission to the hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has symptoms of sneezing present at the time of presentation to the emergency department or at the time of admission to the hospital.","meaning":"Boolean indicating whether the patient has symptoms of sneezing present at the time of presentation to the emergency department or at the time of admission to the hospital."} // "symptoms must be present at the time of presentation to the emergency department OR at the time of admission to the hospital"

(declare-const patient_sneezing_value_recorded_at_presentation_to_emergency_department_or_at_admission_to_hospital_withunit_times_per_day Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's sneezing frequency (number of times per day) is recorded at the time of presentation to the emergency department or at the time of admission to the hospital.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's sneezing frequency (number of times per day) measured at the time of presentation to the emergency department or at the time of admission to the hospital."} // "sneezing (frequency ≥ two times within one day) at presentation/admission"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: fever now means body temperature ≥ 38°C
(assert
  (! (= patient_has_symptoms_of_fever_now
        (>= patient_body_temperature_value_recorded_now_withunit_degrees_celsius 38.0))
     :named REQ2_AUXILIARY0)) ;; "have symptoms of fever (body temperature ≥ 38 degrees Celsius)"

;; Definition: sneezing now means sneezing frequency ≥ 2 times/day
(assert
  (! (= patient_has_symptoms_of_sneezing_now
        (>= patient_sneezing_value_recorded_now_withunit_times_per_day 2.0))
     :named REQ2_AUXILIARY1)) ;; "sneezing (frequency ≥ two times within one day)"

;; Definition: sneezing at presentation/admission means sneezing frequency ≥ 2 times/day at that time
(assert
  (! (= patient_has_symptoms_of_sneezing_at_presentation_to_emergency_department_or_at_admission_to_hospital
        (>= patient_sneezing_value_recorded_at_presentation_to_emergency_department_or_at_admission_to_hospital_withunit_times_per_day 2.0))
     :named REQ2_AUXILIARY2)) ;; "sneezing (frequency ≥ two times within one day) at presentation/admission"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: patient must have symptoms of fever (body temperature ≥ 38°C)
(assert
  (! patient_has_symptoms_of_fever_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "have symptoms of fever (body temperature ≥ 38 degrees Celsius)"

;; Component 1: patient must have at least one of (cough OR runny nose OR nasal congestion OR sneezing (frequency ≥ 2/day))
(assert
  (! (or patient_has_symptoms_of_cough_now
         patient_has_symptoms_of_runny_nose_now
         patient_has_symptoms_of_nasal_congestion_now
         patient_has_symptoms_of_sneezing_now)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "at least one of the following symptoms: (cough OR runny nose OR nasal congestion OR sneezing (frequency ≥ two times within one day))"

;; Component 2: these symptoms must be present at the time of presentation to the emergency department OR at the time of admission to the hospital
(assert
  (! (and patient_has_symptoms_of_fever_at_presentation_to_emergency_department_or_at_admission_to_hospital
          (or patient_has_symptoms_of_cough_at_presentation_to_emergency_department_or_at_admission_to_hospital
              patient_has_symptoms_of_runny_nose_at_presentation_to_emergency_department_or_at_admission_to_hospital
              patient_has_symptoms_of_nasal_congestion_at_presentation_to_emergency_department_or_at_admission_to_hospital
              patient_has_symptoms_of_sneezing_at_presentation_to_emergency_department_or_at_admission_to_hospital))
     :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "these symptoms must be present at the time of presentation to the emergency department OR at the time of admission to the hospital"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_able_to_give_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to give informed consent.","when_to_set_to_false":"Set to false if the patient is not able to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to give informed consent.","meaning":"Boolean indicating whether the patient is able to give informed consent."} // "the patient must be able to give informed consent"
(declare-const parent_is_able_to_give_informed_consent_for_patient Bool) ;; {"when_to_set_to_true":"Set to true if the parent of the patient is able to give informed consent for the patient.","when_to_set_to_false":"Set to false if the parent of the patient is not able to give informed consent for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the parent of the patient is able to give informed consent for the patient.","meaning":"Boolean indicating whether the parent of the patient is able to give informed consent for the patient."} // "the parent ... must be able to give informed consent"
(declare-const guardian_is_able_to_give_informed_consent_for_patient Bool) ;; {"when_to_set_to_true":"Set to true if the guardian of the patient is able to give informed consent for the patient.","when_to_set_to_false":"Set to false if the guardian of the patient is not able to give informed consent for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the guardian of the patient is able to give informed consent for the patient.","meaning":"Boolean indicating whether the guardian of the patient is able to give informed consent for the patient."} // "the guardian ... must be able to give informed consent"

;; ===================== Constraint Assertions (REQ 3) =====================
;; To be included, the patient must be able to give informed consent OR the parent or guardian of the patient must be able to give informed consent.
(assert
  (! (or patient_is_able_to_give_informed_consent
         parent_is_able_to_give_informed_consent_for_patient
         guardian_is_able_to_give_informed_consent_for_patient)
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be able to give informed consent OR the parent or guardian of the patient must be able to give informed consent."
