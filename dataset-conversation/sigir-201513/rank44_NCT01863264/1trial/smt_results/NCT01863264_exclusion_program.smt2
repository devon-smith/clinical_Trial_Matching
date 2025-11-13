;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const corrected_gestational_age_value_in_weeks Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's corrected gestational age in weeks if available.","when_to_set_to_null":"Set to null if the patient's corrected gestational age in weeks is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's corrected gestational age in weeks."} ;; "corrected gestational age = 43 weeks" / "corrected gestational age > 43 weeks"
(declare-const patient_was_born_prematurely Bool) ;; {"when_to_set_to_true":"Set to true if the patient was born prematurely.","when_to_set_to_false":"Set to false if the patient was not born prematurely.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was born prematurely.","meaning":"Boolean indicating whether the patient was born prematurely."} ;; "the patient was born prematurely"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (and
    patient_was_born_prematurely
    (or
      (= corrected_gestational_age_value_in_weeks 43)
      (> corrected_gestational_age_value_in_weeks 43)
    )
  ))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient was born prematurely) AND ((the patient has a corrected gestational age = 43 weeks) OR (the patient has a corrected gestational age > 43 weeks))."
