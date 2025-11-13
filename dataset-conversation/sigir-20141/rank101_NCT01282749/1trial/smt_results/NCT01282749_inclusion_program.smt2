;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the measured BMI value in kg/m² if a current measurement is available.","when_to_set_to_null":"Set to null if no current BMI measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kg/m²."}  ;; "body mass index"

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must have body mass index ≥ 25.0.
(assert
  (! (>= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 25.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have body mass index ≥ 25.0."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_self_identifies_as_black_person Bool) ;; {"when_to_set_to_true":"Set to true if the patient self-identifies as a Black person.","when_to_set_to_false":"Set to false if the patient does not self-identify as a Black person.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient self-identifies as a Black person.","meaning":"Boolean indicating whether the patient self-identifies as a Black person."}  ;; "self-identify as Black person"
(declare-const patient_self_identifies_as_african_american_person Bool) ;; {"when_to_set_to_true":"Set to true if the patient self-identifies as an African-American person.","when_to_set_to_false":"Set to false if the patient does not self-identify as an African-American person.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient self-identifies as an African-American person.","meaning":"Boolean indicating whether the patient self-identifies as an African-American person."}  ;; "self-identify as African-American person"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (or patient_self_identifies_as_black_person
         patient_self_identifies_as_african_american_person)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must (self-identify as Black person OR self-identify as African-American person)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_can_undergo_physical_activity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to perform any physical activity.","when_to_set_to_false":"Set to false if the patient is currently unable to perform any physical activity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to perform physical activity.","meaning":"Boolean indicating whether the patient is currently able to perform physical activity."}  ;; "physical activity"
(declare-const patient_can_undergo_physical_activity_now@@mild_intensity Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to perform physical activity and the activity is of mild intensity.","when_to_set_to_false":"Set to false if the patient is currently able to perform physical activity but not of mild intensity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the physical activity is of mild intensity.","meaning":"Boolean indicating whether the patient is currently able to perform physical activity of mild intensity."}  ;; "mild physical activity"
(declare-const patient_can_undergo_walking_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to perform walking.","when_to_set_to_false":"Set to false if the patient is currently unable to perform walking.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to perform walking.","meaning":"Boolean indicating whether the patient is currently able to perform walking."}  ;; "walking"
(declare-const patient_can_undergo_chair_exercise_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to perform chair exercise.","when_to_set_to_false":"Set to false if the patient is currently unable to perform chair exercise.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to perform chair exercise.","meaning":"Boolean indicating whether the patient is currently able to perform chair exercise."}  ;; "chair exercise"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for mild intensity implies the stem variable for physical activity
(assert
  (! (=> patient_can_undergo_physical_activity_now@@mild_intensity
         patient_can_undergo_physical_activity_now)
     :named REQ2_AUXILIARY0)) ;; "patient must be able to do mild physical activity"

;; Non-exhaustive examples: walking or chair exercise imply mild physical activity
(assert
  (! (=> (or patient_can_undergo_walking_now
             patient_can_undergo_chair_exercise_now)
         patient_can_undergo_physical_activity_now@@mild_intensity)
     :named REQ2_AUXILIARY1)) ;; "such as walking or chair exercise" (non-exhaustive examples)

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: patient must be able to do mild physical activity
(assert
  (! patient_can_undergo_physical_activity_now@@mild_intensity
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must be able to do mild physical activity"
