;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "younger than nineteen years old"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 19))
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is younger than nineteen years old."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_symptomatic_duration_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours the patient has been symptomatic up to the time of assessment.","when_to_set_to_null":"Set to null if the duration the patient has been symptomatic is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total number of hours the patient has been symptomatic."} ;; "has been symptomatic for more than five hours"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not (> patient_symptomatic_duration_in_hours 5))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been symptomatic for more than five hours."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_inability_to_verify_clear_onset_of_symptoms Bool) ;; {"when_to_set_to_true":"Set to true if the patient cannot verify a clear onset of symptoms.","when_to_set_to_false":"Set to false if the patient can verify a clear onset of symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can verify a clear onset of symptoms.","meaning":"Boolean indicating whether the patient has an inability to verify a clear onset of symptoms."} ;; "has an inability to verify a clear onset of symptoms"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_inability_to_verify_clear_onset_of_symptoms)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an inability to verify a clear onset of symptoms."
