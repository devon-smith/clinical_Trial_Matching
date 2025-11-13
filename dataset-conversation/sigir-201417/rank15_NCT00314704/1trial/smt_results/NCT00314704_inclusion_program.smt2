;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_mean_arterial_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current mean arterial pressure in millimeters of mercury is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current mean arterial pressure in millimeters of mercury."}  ;; "have mean arterial pressure < 70 millimeters of mercury"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current systolic blood pressure in millimeters of mercury is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current systolic blood pressure in millimeters of mercury."}  ;; "have systolic pressure < 100 millimeters of mercury"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@persists_despite_adequate_fluid_loading Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current systolic blood pressure value persists despite adequate fluid loading (e.g., after administration of at least 1000 mL crystalloid or 500 mL colloid fluid).","when_to_set_to_false":"Set to false if the patient's current systolic blood pressure value does not persist after adequate fluid loading.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the low systolic blood pressure persists despite adequate fluid loading.","meaning":"Boolean indicating whether the patient's current low systolic blood pressure persists despite adequate fluid loading."}  ;; "persisting despite adequate fluid loading"
(declare-const patient_crystalloid_fluid_volume_administered_now_withunit_milliliters Real) ;; {"when_to_set_to_value":"Set to the measured value if the volume of crystalloid fluid administered to the patient currently in milliliters is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the volume of crystalloid fluid administered to the patient currently in milliliters."}  ;; "at least 1000 milliliters crystalloid fluid"
(declare-const patient_colloid_fluid_volume_administered_now_withunit_milliliters Real) ;; {"when_to_set_to_value":"Set to the measured value if the volume of colloid fluid administered to the patient currently in milliliters is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the volume of colloid fluid administered to the patient currently in milliliters."}  ;; "at least 500 milliliters colloid fluid"
(declare-const patient_has_finding_of_increased_central_venous_pressure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has increased central venous pressure.","when_to_set_to_false":"Set to false if the patient currently does not have increased central venous pressure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has increased central venous pressure.","meaning":"Boolean indicating whether the patient currently has increased central venous pressure."}  ;; "elevated central venous pressure"
(declare-const patient_pulmonary_artery_wedge_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current pulmonary artery wedge pressure in millimeters of mercury is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current pulmonary artery wedge pressure in millimeters of mercury."}  ;; "pulmonary artery occluded pressure"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples for adequate fluid loading
(assert
  (! (=> (or (>= patient_crystalloid_fluid_volume_administered_now_withunit_milliliters 1000.0)
             (>= patient_colloid_fluid_volume_administered_now_withunit_milliliters 500.0))
         patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@persists_despite_adequate_fluid_loading)
     :named REQ0_AUXILIARY0)) ;; "adequate fluid loading (with non-exhaustive examples (at least 1000 milliliters crystalloid fluid OR at least 500 milliliters colloid fluid))"

;; Non-exhaustive example for increased central venous pressure
(assert
  (! (=> (> patient_pulmonary_artery_wedge_pressure_value_recorded_now_withunit_millimeters_of_mercury 14.0)
         patient_has_finding_of_increased_central_venous_pressure_now)
     :named REQ0_AUXILIARY1)) ;; "central venous pressure > 12 millimeters of mercury" (maps to increased central venous pressure umbrella)

;; Non-exhaustive example for increased pulmonary artery wedge pressure
(assert
  (! (=> (> patient_pulmonary_artery_wedge_pressure_value_recorded_now_withunit_millimeters_of_mercury 14.0)
         patient_has_finding_of_increased_central_venous_pressure_now)
     :named REQ0_AUXILIARY2)) ;; "pulmonary artery occluded pressure > 14 millimeters of mercury" (maps to increased pulmonary artery wedge pressure umbrella)

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: ((mean arterial pressure < 70) OR (systolic pressure < 100 persisting despite adequate fluid loading))
(assert
  (! (or (< patient_mean_arterial_pressure_value_recorded_now_withunit_millimeters_of_mercury 70.0)
         (and (< patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 100.0)
              patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@persists_despite_adequate_fluid_loading))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "mean arterial pressure < 70 OR systolic pressure < 100 persisting despite adequate fluid loading"

;; Component 1: NOT (elevated central venous pressure)
(assert
  (! (not patient_has_finding_of_increased_central_venous_pressure_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "must not have elevated central venous pressure"

;; Component 2: NOT (elevated pulmonary artery occluded pressure)
(assert
  (! (not (> patient_pulmonary_artery_wedge_pressure_value_recorded_now_withunit_millimeters_of_mercury 14.0))
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "must not have elevated pulmonary artery occluded pressure"
