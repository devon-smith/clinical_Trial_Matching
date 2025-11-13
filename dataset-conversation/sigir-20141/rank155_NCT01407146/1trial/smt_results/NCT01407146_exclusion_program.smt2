;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "younger than twenty-one years old"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 21))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is younger than twenty-one years old."
