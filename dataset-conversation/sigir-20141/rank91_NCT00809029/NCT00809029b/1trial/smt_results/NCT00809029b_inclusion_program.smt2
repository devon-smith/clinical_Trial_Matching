;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter Real) ;; {"when_to_set_to_value":"Set to the measured BMI value if a numeric measurement of body mass index recorded now is available, in kilograms per square meter.","when_to_set_to_null":"Set to null if no such BMI measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kilograms per square meter."}  // "body mass index > 30 kilograms per square meter"
(declare-const patient_has_finding_of_obesity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of obesity.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has obesity.","meaning":"Boolean indicating whether the patient currently has obesity."}  // "obesity"
(declare-const patient_has_finding_of_normal_glucose_tolerance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has normal glucose tolerance.","when_to_set_to_false":"Set to false if the patient currently does not have normal glucose tolerance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has normal glucose tolerance.","meaning":"Boolean indicating whether the patient currently has normal glucose tolerance."}  // "normal glucose tolerance"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition: Obesity is defined as BMI > 30 kg/m^2
(assert
  (! (= patient_has_finding_of_obesity_now
        (> patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 30.0))
     :named REQ0_AUXILIARY0)) ;; "obesity (body mass index > 30 kilograms per square meter)"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Must have obesity (BMI > 30)
(assert
  (! patient_has_finding_of_obesity_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have obesity (body mass index > 30 kilograms per square meter)."

;; Component 1: Must have normal glucose tolerance
(assert
  (! patient_has_finding_of_normal_glucose_tolerance_now
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have normal glucose tolerance."
