;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_intubated_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently intubated.","when_to_set_to_false":"Set to false if the patient is currently not intubated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently intubated.","meaning":"Boolean indicating whether the patient is currently intubated."} // "an intubated patient"
(declare-const patient_age_value_recorded_now_in_days Real) ;; {"when_to_set_to_value":"Set to the patient's current age in days if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in days is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in days."} // "age ≥ 1 day"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age ≤ 21 years"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition of pediatric age: age ≥ 1 day AND age ≤ 21 years
(define-fun patient_has_pediatric_age_now () Bool
  (and (>= patient_age_value_recorded_now_in_days 1.0)    ;; "age ≥ 1 day"
       (<= patient_age_value_recorded_now_in_years 21.0))) ;; "age ≤ 21 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: patient must be intubated
(assert
  (! patient_is_intubated_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "an intubated patient"

;; Component 1: patient must have pediatric age (definition: age ≥ 1 day AND age ≤ 21 years)
(assert
  (! patient_has_pediatric_age_now
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "pediatric age (definition: age ≥ 1 day AND age ≤ 21 years)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: "To be included, the patient must be aged ≥ 1 day."
(assert
  (! (>= patient_age_value_recorded_now_in_days 1.0) ;; {"when_to_set_to_value":"Set to the patient's current age in days if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in days is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in days."} // "age ≥ 1 day"
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS))

;; Component 1: "To be included, the patient must be aged ≤ 21 years."
(assert
  (! (<= patient_age_value_recorded_now_in_years 21.0) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age ≤ 21 years"
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS))

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_is_admitted_to_loma_linda_university_childrens_hospital_pediatric_intensive_care_unit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently admitted to Loma Linda University Children's Hospital pediatric intensive care unit.","when_to_set_to_false":"Set to false if the patient is not currently admitted to Loma Linda University Children's Hospital pediatric intensive care unit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently admitted to Loma Linda University Children's Hospital pediatric intensive care unit.","meaning":"Boolean indicating whether the patient is currently admitted to Loma Linda University Children's Hospital pediatric intensive care unit."} // "admitted to Loma Linda University Children's Hospital pediatric intensive care unit"
(declare-const patient_has_finding_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pneumonia.","meaning":"Boolean indicating whether the patient currently has pneumonia."} // "have suspected pneumonia"
(declare-const patient_has_finding_of_pneumonia_now@@suspected Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pneumonia is suspected (not confirmed).","when_to_set_to_false":"Set to false if the patient's current pneumonia is not suspected (i.e., confirmed or ruled out).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pneumonia is suspected.","meaning":"Boolean indicating whether the patient's current pneumonia is suspected."} // "suspected pneumonia"
(declare-const patient_admission_datetime_value_recorded_now_withunit_datetime Real) ;; {"when_to_set_to_value":"Set to the datetime value when the patient was admitted to Loma Linda University Children's Hospital pediatric intensive care unit.","when_to_set_to_null":"Set to null if the admission datetime is unknown, not documented, or cannot be determined.","meaning":"Datetime value indicating the date and time of admission to Loma Linda University Children's Hospital pediatric intensive care unit."} // "admission occurs during the next 6 months"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_pneumonia_now@@suspected
         patient_has_finding_of_pneumonia_now)
     :named REQ2_AUXILIARY0)) ;; "suspected pneumonia" implies "pneumonia"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Patient must be admitted to Loma Linda University Children's Hospital pediatric intensive care unit
(assert
  (! patient_is_admitted_to_loma_linda_university_childrens_hospital_pediatric_intensive_care_unit_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "admitted to Loma Linda University Children's Hospital pediatric intensive care unit"

;; Component 1: Patient must have suspected pneumonia
(assert
  (! patient_has_finding_of_pneumonia_now@@suspected
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "have suspected pneumonia"

;; Component 2: Admission occurs during the next 6 months
;; For SMT, we need a reference datetime for "now". We introduce a variable for current datetime.
(declare-const current_datetime_value_recorded_now_withunit_datetime Real) ;; {"when_to_set_to_value":"Set to the current datetime value at the time of eligibility assessment.","when_to_set_to_null":"Set to null if the current datetime is unknown, not documented, or cannot be determined.","meaning":"Datetime value indicating the current time for eligibility assessment."} // "admission occurs during the next 6 months"

;; Admission must be within [now, now + 6 months]
(assert
  (! (and (>= patient_admission_datetime_value_recorded_now_withunit_datetime current_datetime_value_recorded_now_withunit_datetime)
          (<= patient_admission_datetime_value_recorded_now_withunit_datetime
              (+ current_datetime_value_recorded_now_withunit_datetime (* 6 30.44)))) ;; 6 months ≈ 6*30.44 days
     :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "admission occurs during the next 6 months"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_antibiotic_therapy_value_recorded_now_withunit_hours Real) ;; {"when_to_set_to_value":"Set to the total number of hours the patient has received antibiotic therapy up to the current time, if known.","when_to_set_to_null":"Set to null if the total duration of antibiotic therapy received by the patient up to now is unknown, not documented, or cannot be determined.","meaning":"Numeric value (in hours) representing the total duration of antibiotic therapy the patient has received as of now."} // "have received antibiotic therapy for < 12 hours"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (< patient_antibiotic_therapy_value_recorded_now_withunit_hours 12.0)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "have received antibiotic therapy for < 12 hours"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_intubation_value_recorded_now_withunit_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours the patient has been continuously intubated as of now, if known.","when_to_set_to_null":"Set to null if the duration of intubation as of now is unknown, not documented, or cannot be determined.","meaning":"Numeric value (in hours) representing the duration of the patient's current intubation episode as of now."} // "intubated for < 24 hours"

;; ===================== Constraint Assertions (REQ 4) =====================
;; The patient must have been intubated for less than 24 hours.
(assert
  (! (< patient_intubation_value_recorded_now_withunit_hours 24.0)
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must have been intubated for < 24 hours"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_is_english_speaking_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently speaks English.","when_to_set_to_false":"Set to false if the patient currently does not speak English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently speaks English.","meaning":"Boolean indicating whether the patient currently speaks English."} // "English speaking"
(declare-const patient_is_spanish_speaking_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently speaks Spanish.","when_to_set_to_false":"Set to false if the patient currently does not speak Spanish.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently speaks Spanish.","meaning":"Boolean indicating whether the patient currently speaks Spanish."} // "Spanish speaking"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (or patient_is_english_speaking_now
         patient_is_spanish_speaking_now)
     :named REQ5_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (English speaking) OR (Spanish speaking) (for consent purposes)."
