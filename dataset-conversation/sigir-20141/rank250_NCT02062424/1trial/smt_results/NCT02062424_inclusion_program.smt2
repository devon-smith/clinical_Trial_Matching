;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 30 years AND ≤ 65 years"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."}  ;; "man aged ≥ 30 years AND ≤ 65 years"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."}  ;; "woman aged ≥ 30 years AND ≤ 65 years"
(declare-const patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current body mass index in kilograms per square meter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kilograms per square meter."}  ;; "overweight", "obese"
(declare-const patient_waist_circumference_value_recorded_now_withunit_centimeters Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current waist circumference in centimeters is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current waist circumference in centimeters."}  ;; "waist circumference"
(declare-const patient_has_finding_of_behavior_showing_reduced_motor_activity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of physical inactivity (reduced motor activity).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of physical inactivity (reduced motor activity).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of physical inactivity (reduced motor activity).","meaning":"Boolean indicating whether the patient currently has the clinical finding of physical inactivity (reduced motor activity)."}  ;; "physical inactivity"
(declare-const patient_has_finding_of_overweight_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of overweight.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of overweight.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of overweight.","meaning":"Boolean indicating whether the patient currently has the clinical finding of overweight."}  ;; "overweight"
(declare-const patient_has_finding_of_obese_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of obesity.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of obesity.","meaning":"Boolean indicating whether the patient currently has the clinical finding of obesity."}  ;; "obese"
(declare-const patients_risk_factor_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive risk factor.","when_to_set_to_false":"Set to false if the patient currently does not have a positive risk factor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive risk factor.","meaning":"Boolean indicating whether the patient currently has a positive risk factor."}  ;; "risk factor"
(declare-const patients_risk_factor_is_positive_now@@self_assessed_at_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's positive risk factor is self-assessed at the screening visit.","when_to_set_to_false":"Set to false if the patient's positive risk factor is not self-assessed at the screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's positive risk factor is self-assessed at screening.","meaning":"Boolean indicating whether the patient's positive risk factor is self-assessed at screening."}  ;; "self-assessed at screening"
;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patients_risk_factor_is_positive_now@@self_assessed_at_screening
         patients_risk_factor_is_positive_now)
     :named REQ0_AUXILIARY0)) ;; "self-assessed at screening" implies "risk factor"

;; Definition of overweight: BMI >= 25
(assert
  (! (= patient_has_finding_of_overweight_now
        (>= patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 25.0))
     :named REQ0_AUXILIARY1)) ;; "overweight (body mass index ≥ 25 kilograms per square meter)"

;; Definition of obese: BMI >= 25
(assert
  (! (= patient_has_finding_of_obese_now
        (>= patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 25.0))
     :named REQ0_AUXILIARY2)) ;; "obese (body mass index ≥ 25 kilograms per square meter)"

;; Definition of increased waist circumference for women: >= 80 cm
(define-fun patient_has_increased_waist_circumference_now_for_women () Bool
  (and patient_sex_is_female_now
       (>= patient_waist_circumference_value_recorded_now_withunit_centimeters 80.0))) ;; "waist circumference ≥ 80 centimeters for women"

;; Definition of increased waist circumference for men: >= 94 cm
(define-fun patient_has_increased_waist_circumference_now_for_men () Bool
  (and patient_sex_is_male_now
       (>= patient_waist_circumference_value_recorded_now_withunit_centimeters 94.0))) ;; "waist circumference ≥ 94 centimeters for men"

;; Definition of increased waist circumference (either sex-specific threshold)
(define-fun patient_has_increased_waist_circumference_now () Bool
  (or patient_has_increased_waist_circumference_now_for_women
      patient_has_increased_waist_circumference_now_for_men)) ;; "increased waist circumference"

;; Exhaustive subcategories for self-assessed ischemic heart disease risk factor at screening
(assert
  (! (= patients_risk_factor_is_positive_now@@self_assessed_at_screening
        (or patient_has_finding_of_behavior_showing_reduced_motor_activity_now
            patient_has_finding_of_overweight_now
            patient_has_finding_of_obese_now
            patient_has_increased_waist_circumference_now))
     :named REQ0_AUXILIARY3)) ;; "at least one self-assessed ischemic heart disease risk factor at screening (with exhaustive subcategories ...)"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: ((be a healthy man aged ≥ 30 years AND ≤ 65 years) OR (be a healthy woman aged ≥ 30 years AND ≤ 65 years))
(assert
  (! (or (and patient_sex_is_male_now
              (>= patient_age_value_recorded_now_in_years 30.0)
              (<= patient_age_value_recorded_now_in_years 65.0))
         (and patient_sex_is_female_now
              (>= patient_age_value_recorded_now_in_years 30.0)
              (<= patient_age_value_recorded_now_in_years 65.0)))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "((be a healthy man aged ≥ 30 years AND ≤ 65 years) OR (be a healthy woman aged ≥ 30 years AND ≤ 65 years))"

;; Component 1: at least one self-assessed ischemic heart disease risk factor at screening (with exhaustive subcategories)
(assert
  (! patients_risk_factor_is_positive_now@@self_assessed_at_screening
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "have at least one self-assessed ischemic heart disease risk factor at screening (with exhaustive subcategories ...)"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_motivation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has motivation to participate in the study.","when_to_set_to_false":"Set to false if the patient currently does not have motivation to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has motivation to participate in the study.","meaning":"Boolean indicating whether the patient currently has motivation to participate in the study."}  ;; "To be included, the patient must have the motivation."
(declare-const patient_has_willingness_to_be_randomized_to_any_of_three_groups_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has willingness to be randomized to any of the three groups in the study.","when_to_set_to_false":"Set to false if the patient currently does not have willingness to be randomized to any of the three groups in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has willingness to be randomized to any of the three groups in the study.","meaning":"Boolean indicating whether the patient currently has willingness to be randomized to any of the three groups in the study."}  ;; "To be included, the patient must have the willingness to be randomized to any of the three groups."
(declare-const patient_has_willingness_to_do_best_to_follow_given_protocol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has willingness to do their best to follow the given protocol.","when_to_set_to_false":"Set to false if the patient currently does not have willingness to do their best to follow the given protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has willingness to do their best to follow the given protocol.","meaning":"Boolean indicating whether the patient currently has willingness to do their best to follow the given protocol."}  ;; "To be included, the patient must have the willingness to do the best to follow the given protocol."

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: "To be included, the patient must have the motivation."
(assert
  (! patient_has_motivation_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have the motivation."

;; Component 1: "To be included, the patient must have the willingness to be randomized to any of the three groups."
(assert
  (! patient_has_willingness_to_be_randomized_to_any_of_three_groups_now
     :named REQ1_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have the willingness to be randomized to any of the three groups."

;; Component 2: "To be included, the patient must have the willingness to do the best to follow the given protocol."
(assert
  (! patient_has_willingness_to_do_best_to_follow_given_protocol_now
     :named REQ1_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have the willingness to do the best to follow the given protocol."
