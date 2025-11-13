;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_acute_respiratory_infections_value_recorded_now_withunit_days Real) ;; {"when_to_set_to_value":"Set to the number of days if the duration of symptoms of an acute respiratory tract infection is currently known and recorded for the patient.","when_to_set_to_null":"Set to null if the duration of symptoms is unknown, not documented, or cannot be determined for the patient.","meaning":"Numeric value indicating the duration in days of symptoms of an acute respiratory tract infection currently present in the patient."} ;; "duration of symptoms of an acute respiratory tract infection ≥ 5 days"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (>= patient_acute_respiratory_infections_value_recorded_now_withunit_days 5))
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has duration of symptoms of an acute respiratory tract infection greater than or equal to five days (duration of symptoms of an acute respiratory tract infection ≥ 5 days)."
