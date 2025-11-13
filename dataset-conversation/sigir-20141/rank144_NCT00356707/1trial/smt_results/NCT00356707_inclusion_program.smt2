;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_participating_in_black_womens_health_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in the Black Women's Health Study.","when_to_set_to_false":"Set to false if the patient is not currently participating in the Black Women's Health Study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in the Black Women's Health Study.","meaning":"Boolean indicating whether the patient is currently participating in the Black Women's Health Study."} // "To be included, the patient must be participating in the Black Women's Health Study."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_is_participating_in_black_womens_health_study
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be participating in the Black Women's Health Study."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_resides_in_new_york_city_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently resides in New York City.","when_to_set_to_false":"Set to false if the patient currently does not reside in New York City.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently resides in New York City.","meaning":"Boolean indicating whether the patient currently resides in New York City."} // "reside in New York City"
(declare-const patient_resides_in_los_angeles_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently resides in Los Angeles.","when_to_set_to_false":"Set to false if the patient currently does not reside in Los Angeles.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently resides in Los Angeles.","meaning":"Boolean indicating whether the patient currently resides in Los Angeles."} // "reside in Los Angeles"
(declare-const patient_resides_in_chicago_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently resides in Chicago.","when_to_set_to_false":"Set to false if the patient currently does not reside in Chicago.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently resides in Chicago.","meaning":"Boolean indicating whether the patient currently resides in Chicago."} // "reside in Chicago"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (or patient_resides_in_new_york_city_now
         patient_resides_in_los_angeles_now
         patient_resides_in_chicago_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must (reside in New York City OR reside in Los Angeles OR reside in Chicago)."
