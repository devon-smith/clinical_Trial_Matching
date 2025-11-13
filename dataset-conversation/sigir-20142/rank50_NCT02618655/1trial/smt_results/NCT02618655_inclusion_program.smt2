;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const fever_duration_value_recorded_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days the patient has had fever, if documented.","when_to_set_to_null":"Set to null if the duration of fever is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration, in days, that the patient has had fever."} // "fever for > 1 week"
(declare-const patient_has_finding_of_fever_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had fever at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had fever in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had fever in their history.","meaning":"Boolean indicating whether the patient has had fever in their history."} // "fever for > 1 week"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (and patient_has_finding_of_fever_inthehistory
          (> fever_duration_value_recorded_in_days 7))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have fever for > 1 week."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_body_temperature_value_recorded_now_withunit_degrees_celsius Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body temperature in degrees Celsius is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's body temperature measured now, in degrees Celsius."} // "body temperature > 38 degrees Celsius"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (> patient_body_temperature_value_recorded_now_withunit_degrees_celsius 38.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have body temperature > 38 degrees Celsius."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_undergone_physical_examination_inthepast1weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a physical examination within the past 1 week.","when_to_set_to_false":"Set to false if the patient has not undergone a physical examination within the past 1 week.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a physical examination within the past 1 week.","meaning":"Boolean indicating whether the patient has undergone a physical examination within the past 1 week."} // "undergone a full physical examination after 1 week"
(declare-const patient_has_undergone_laboratory_test_inthepast1weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a laboratory examination within the past 1 week.","when_to_set_to_false":"Set to false if the patient has not undergone a laboratory examination within the past 1 week.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a laboratory examination within the past 1 week.","meaning":"Boolean indicating whether the patient has undergone a laboratory examination within the past 1 week."} // "undergone a laboratory examination after 1 week"
(declare-const patient_has_diagnosis_of_diagnosis_inthepast1weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis made within the past 1 week.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis made within the past 1 week.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis made within the past 1 week.","meaning":"Boolean indicating whether the patient has had a diagnosis made within the past 1 week."} // "NOT have a definite diagnosis made after 1 week"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Must have undergone a full physical examination after 1 week
(assert
  (! patient_has_undergone_physical_examination_inthepast1weeks
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have undergone a full physical examination after 1 week."

;; Component 1: Must have undergone a laboratory examination after 1 week
(assert
  (! patient_has_undergone_laboratory_test_inthepast1weeks
     :named REQ2_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have undergone a laboratory examination after 1 week."

;; Component 2: Must NOT have a definite diagnosis made after 1 week
(assert
  (! (not patient_has_diagnosis_of_diagnosis_inthepast1weeks)
     :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have a definite diagnosis made after 1 week."
