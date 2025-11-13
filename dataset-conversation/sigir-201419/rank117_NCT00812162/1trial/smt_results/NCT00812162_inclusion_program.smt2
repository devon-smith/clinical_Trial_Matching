;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age ≥ 21 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 21)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (age ≥ 21 years)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter Real) ;; {"when_to_set_to_value":"Set to the measured BMI value if a numeric measurement of the patient's body mass index (BMI) in kilograms per square meter is recorded now.","when_to_set_to_null":"Set to null if no such BMI measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kilograms per square meter."} // "body mass index"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: "To be included, the patient must have (body mass index ≥ 25.0 kilograms per square meter)."
(assert
  (! (>= patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 25.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "body mass index ≥ 25.0 kilograms per square meter"

;; Component 1: "To be included, the patient must have (body mass index ≤ 39.9 kilograms per square meter)."
(assert
  (! (<= patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 39.9)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "body mass index ≤ 39.9 kilograms per square meter"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_weight_steady_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been weight stable (no significant weight change) at any time within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not been weight stable (i.e., has had significant weight change) at any time within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been weight stable within the past 6 months.","meaning":"Boolean indicating whether the patient has been weight stable within the past 6 months."} // "weight stable (defined as absolute value of weight change < 4.5 kilograms within the last 6 months)"
(declare-const weight_change_value_recorded_in_past_6_months_in_kilograms Real) ;; {"when_to_set_to_value":"Set to the value of the patient's weight change in kilograms if it is recorded within the past 6 months.","when_to_set_to_null":"Set to null if the patient's weight change in kilograms within the past 6 months is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's weight change in kilograms within the past 6 months."} // "weight change < 4.5 kilograms within the last 6 months"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: weight stability is defined as absolute value of weight change < 4.5 kg within the last 6 months
(assert
  (! (= patient_has_finding_of_weight_steady_inthepast6months
        (< (abs weight_change_value_recorded_in_past_6_months_in_kilograms) 4.5))
     :named REQ2_AUXILIARY0)) ;; "weight stable (defined as absolute value of weight change < 4.5 kilograms within the last 6 months)"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_weight_steady_inthepast6months
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have been weight stable (defined as absolute value of weight change < 4.5 kilograms within the last 6 months)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_body_fat_observable_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured body fat percentage value if a numeric measurement of body fat percentage is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current body fat."} // "body fat > 25% assessed by skinfold measurement, or if skinfold measurement is not sufficient, by plethysmography measurement"
(declare-const patient_body_fat_observable_value_recorded_now_withunit_percent@@assessed_by_skinfold_or_plethysmography_measurement Bool) ;; {"when_to_set_to_true":"Set to true if the body fat percentage measurement is assessed by skinfold measurement, or if skinfold measurement is not sufficient, by plethysmography measurement.","when_to_set_to_false":"Set to false if the body fat percentage measurement is assessed by another method or the method does not meet the requirement.","when_to_set_to_null":"Set to null if the method of assessment is unknown or indeterminate.","meaning":"Boolean indicating whether the body fat percentage measurement is assessed by skinfold or, if not sufficient, by plethysmography measurement."} // "assessed by skinfold measurement, or if skinfold measurement is not sufficient, by plethysmography measurement"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: "To be included, the patient must have (body fat > 25% assessed by skinfold measurement, or if skinfold measurement is not sufficient, by plethysmography measurement)."
(assert
  (! (and (> patient_body_fat_observable_value_recorded_now_withunit_percent 25.0)
          patient_body_fat_observable_value_recorded_now_withunit_percent@@assessed_by_skinfold_or_plethysmography_measurement)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "body fat > 25% assessed by skinfold measurement, or if skinfold measurement is not sufficient, by plethysmography measurement"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_non_smoker_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has non-smoking status during the past 6 months.","when_to_set_to_false":"Set to false if the patient does not have non-smoking status during the past 6 months (i.e., has smoked during that period).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has non-smoking status during the past 6 months.","meaning":"Boolean indicating whether the patient has non-smoking status during the past 6 months."} // "non-smoking status within the last 6 months"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_finding_of_non_smoker_inthepast6months
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (non-smoking status within the last 6 months)."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_activity_exercise_pattern_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has habitual activity patterns within the past 3 months.","when_to_set_to_false":"Set to false if the patient does not have habitual activity patterns within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has habitual activity patterns within the past 3 months.","meaning":"Boolean indicating whether the patient has habitual activity patterns within the past 3 months."} // "habitual activity patterns within the last 3 months"
(declare-const patient_has_finding_of_activity_exercise_pattern_inthepast3months@@constant_pattern Bool) ;; {"when_to_set_to_true":"Set to true if the patient's habitual activity patterns within the past 3 months are constant.","when_to_set_to_false":"Set to false if the patient's habitual activity patterns within the past 3 months are not constant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's habitual activity patterns within the past 3 months are constant.","meaning":"Boolean indicating whether the patient's habitual activity patterns within the past 3 months are constant."} // "constant habitual activity patterns within the last 3 months"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_activity_exercise_pattern_inthepast3months@@constant_pattern
         patient_has_finding_of_activity_exercise_pattern_inthepast3months)
     :named REQ5_AUXILIARY0)) ;; "constant habitual activity patterns within the last 3 months"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_finding_of_activity_exercise_pattern_inthepast3months@@constant_pattern
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "constant habitual activity patterns within the last 3 months"

;; ===================== Declarations for the inclusion criterion (REQ 6) =====================
(declare-const patients_liver_function_is_normal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's liver function is normal now.","when_to_set_to_false":"Set to false if the patient's liver function is abnormal now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's liver function is normal now.","meaning":"Boolean indicating whether the patient's liver function is normal at the present time."} // "normal liver function"
(declare-const patients_renal_function_is_normal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's renal function is normal now.","when_to_set_to_false":"Set to false if the patient's renal function is abnormal now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's renal function is normal now.","meaning":"Boolean indicating whether the patient's renal function is normal at the present time."} // "normal kidney function"
(declare-const patient_blood_glucose_level_finding_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's blood glucose level is recorded now in milligrams per deciliter.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's blood glucose level measured now, in milligrams per deciliter."} // "fasting blood glucose < 110 milligrams per deciliter"
(declare-const patient_blood_glucose_level_finding_value_recorded_now_withunit_milligrams_per_deciliter@@fasting_state Bool) ;; {"when_to_set_to_true":"Set to true if the patient's blood glucose measurement was taken in the fasting state.","when_to_set_to_false":"Set to false if the patient's blood glucose measurement was not taken in the fasting state.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was taken in the fasting state.","meaning":"Boolean indicating whether the patient's blood glucose measurement was taken in the fasting state."} // "fasting blood glucose"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: "clinically normal blood profiles (specifically, normal liver function AND normal kidney function)"
(assert
  (! (and patients_liver_function_is_normal_now
          patients_renal_function_is_normal_now)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "clinically normal blood profiles (specifically, normal liver function AND normal kidney function)"

;; Component 1: "fasting blood glucose < 110 milligrams per deciliter"
(assert
  (! (and patient_blood_glucose_level_finding_value_recorded_now_withunit_milligrams_per_deciliter@@fasting_state
          (< patient_blood_glucose_level_finding_value_recorded_now_withunit_milligrams_per_deciliter 110.0))
     :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "fasting blood glucose < 110 milligrams per deciliter"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_is_taking_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not taking any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any drug or medicament.","meaning":"Boolean indicating whether the patient is currently taking any drug or medicament."} // "medications"
(declare-const patient_is_taking_drug_or_medicament_now@@known_to_influence_appetite Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament currently taken by the patient is known to influence appetite.","when_to_set_to_false":"Set to false if the drug or medicament currently taken by the patient is not known to influence appetite.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament currently taken by the patient is known to influence appetite.","meaning":"Boolean indicating whether the drug or medicament currently taken by the patient is known to influence appetite."} // "medications known to influence appetite"
(declare-const patient_is_taking_drug_or_medicament_now@@known_to_influence_metabolism Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament currently taken by the patient is known to influence metabolism.","when_to_set_to_false":"Set to false if the drug or medicament currently taken by the patient is not known to influence metabolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament currently taken by the patient is known to influence metabolism.","meaning":"Boolean indicating whether the drug or medicament currently taken by the patient is known to influence metabolism."} // "medications known to influence metabolism"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply the patient is taking a drug or medicament now
(assert
  (! (=> patient_is_taking_drug_or_medicament_now@@known_to_influence_appetite
         patient_is_taking_drug_or_medicament_now)
     :named REQ7_AUXILIARY0)) ;; "medications known to influence appetite"

(assert
  (! (=> patient_is_taking_drug_or_medicament_now@@known_to_influence_metabolism
         patient_is_taking_drug_or_medicament_now)
     :named REQ7_AUXILIARY1)) ;; "medications known to influence metabolism"

;; ===================== Constraint Assertions (REQ 7) =====================
;; To be included, the patient must NOT be taking (medications known to influence appetite OR medications known to influence metabolism).
(assert
  (! (not (or patient_is_taking_drug_or_medicament_now@@known_to_influence_appetite
              patient_is_taking_drug_or_medicament_now@@known_to_influence_metabolism))
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must NOT be taking (medications known to influence appetite OR medications known to influence metabolism)"

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_has_finding_of_non_diabetic_status_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has non-diabetic status (i.e., is not diagnosed with diabetes mellitus).","when_to_set_to_false":"Set to false if the patient currently does not have non-diabetic status (i.e., is diagnosed with diabetes mellitus).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has non-diabetic status.","meaning":"Boolean indicating whether the patient currently has non-diabetic status (i.e., is not diagnosed with diabetes mellitus)."} // "To be included, the patient must have (non-diabetic status)."

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! patient_has_finding_of_non_diabetic_status_now
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (non-diabetic status)."
