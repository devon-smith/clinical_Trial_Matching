;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_core_body_temperature_days_with_value_greater_than_or_equal_to_100_4_degrees_fahrenheit Real) ;; {"when_to_set_to_value":"Set to the number of days on which the patient's core body temperature measurement was greater than or equal to 100.4 degrees Fahrenheit.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the number of days on which the patient's core body temperature was measured to be greater than or equal to 100.4 degrees Fahrenheit."} ;; "core body temperature ≥ 100.4 degrees Fahrenheit on ≥ 2 days"
(declare-const patient_core_body_temperature_value_recorded_inthehistory_withunit_degrees_fahrenheit Real) ;; {"when_to_set_to_value":"Set to the measured value(s) of the patient's core body temperature in degrees Fahrenheit recorded at any time in the patient's history.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value(s) representing the patient's core body temperature in degrees Fahrenheit recorded in the patient's history."} ;; "core body temperature"

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must have had two or more days with core body temperature ≥ 100.4°F
(assert
  (! (>= patient_core_body_temperature_days_with_value_greater_than_or_equal_to_100_4_degrees_fahrenheit 2)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "core body temperature ≥ 100.4 degrees Fahrenheit on ≥ 2 days"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_approval_of_primary_attending_physician_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has approval from their primary attending physician.","when_to_set_to_false":"Set to false if the patient currently does not have approval from their primary attending physician.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has approval from their primary attending physician.","meaning":"Boolean indicating whether the patient currently has approval from their primary attending physician."} ;; "approval of the primary attending physician of the patient"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_approval_of_primary_attending_physician_now
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have approval of the primary attending physician of the patient"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_need_for_core_body_temperature_measurement_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a need for core body temperature measurement.","when_to_set_to_false":"Set to false if the patient currently does not have a need for core body temperature measurement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a need for core body temperature measurement.","meaning":"Boolean indicating whether the patient currently has a need for core body temperature measurement."} ;; "the patient must have a need for core body temperature measurement"
(declare-const patient_has_need_for_core_body_temperature_measurement_now@@independent_of_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's need for core body temperature measurement is independent of the study.","when_to_set_to_false":"Set to false if the patient's need for core body temperature measurement is not independent of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's need for core body temperature measurement is independent of the study.","meaning":"Boolean indicating whether the patient's need for core body temperature measurement is independent of the study."} ;; "need for core body temperature measurement independent of the study"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_need_for_core_body_temperature_measurement_now@@independent_of_study
         patient_has_need_for_core_body_temperature_measurement_now)
     :named REQ2_AUXILIARY0)) ;; "need for core body temperature measurement independent of the study" implies "need for core body temperature measurement"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_need_for_core_body_temperature_measurement_now@@independent_of_study
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have a need for core body temperature measurement independent of the study"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_admission_to_neurological_intensive_care_unit_for_underlying_condition Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been admitted to the neurological intensive care unit for an underlying condition.","when_to_set_to_false":"Set to false if the patient has not been admitted to the neurological intensive care unit for an underlying condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been admitted to the neurological intensive care unit for an underlying condition.","meaning":"Boolean indicating whether the patient has been admitted to the neurological intensive care unit for an underlying condition."} ;; "admission to the neurological intensive care unit for an underlying condition"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_admission_to_neurological_intensive_care_unit_for_underlying_condition
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have admission to the neurological intensive care unit for an underlying condition."
