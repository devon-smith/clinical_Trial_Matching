;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged greater than or equal to 36 years AND less than or equal to 59 years OR aged less than 18 years OR aged greater than 85 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient is aged 36 to 59 years (inclusive)
(assert
(! (not (and (>= patient_age_value_recorded_now_in_years 36)
             (<= patient_age_value_recorded_now_in_years 59)))
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is aged greater than or equal to 36 years and less than or equal to 59 years."

;; Exclusion: patient is aged less than 18 years
(assert
(! (not (< patient_age_value_recorded_now_in_years 18))
    :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is aged less than 18 years."

;; Exclusion: patient is aged greater than 85 years
(assert
(! (not (> patient_age_value_recorded_now_in_years 85))
    :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is aged greater than 85 years."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter Real) ;; {"when_to_set_to_value":"Set to the measured BMI value if a numeric measurement of the patient's body mass index (BMI) in kilograms per square meter is recorded now.","when_to_set_to_null":"Set to null if no such BMI measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kilograms per square meter."} ;; "body mass index"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (male or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."} ;; "the patient is a woman"
(declare-const patient_weight_value_recorded_now_withunit_pounds Real) ;; {"when_to_set_to_value":"Set to the measured weight value if a numeric measurement of the patient's weight in pounds is recorded now.","when_to_set_to_null":"Set to null if no such weight measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current weight in pounds."} ;; "weighs less than 95 pounds"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: BMI < 18.6 kg/m2
(assert
(! (not (< patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 18.6))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a body mass index less than 18.6 kilograms per square meter."

;; Exclusion: BMI > 30 kg/m2
(assert
(! (not (> patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 30))
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a body mass index greater than 30 kilograms per square meter."

;; Exclusion: woman AND weight < 95 pounds
(assert
(! (not (and patient_sex_is_female_now (< patient_weight_value_recorded_now_withunit_pounds 95)))
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman and the patient weighs less than 95 pounds."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_duration_of_sleep_value_recorded_now_withunit_hours Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's sleep duration in hours is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's sleep duration in hours recorded now."} ;; "sleep duration"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (< patient_duration_of_sleep_value_recorded_now_withunit_hours 5))
:named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has a sleep duration less than 5 hours."

(assert
(! (not (> patient_duration_of_sleep_value_recorded_now_withunit_hours 9))
:named REQ2_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has a sleep duration greater than 9 hours."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_sensitivity_to_sleeping_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sensitivity to sleeping medication.","when_to_set_to_false":"Set to false if the patient currently does not have sensitivity to sleeping medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sensitivity to sleeping medication.","meaning":"Boolean indicating whether the patient currently has sensitivity to sleeping medication."} ;; "The patient is excluded if the patient has sensitivity to sleeping medication."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_sensitivity_to_sleeping_medication_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has sensitivity to sleeping medication."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_performed_night_work_in_preceding_6_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has performed night work at any time in the preceding 6 months.","when_to_set_to_false":"Set to false if the patient has not performed night work at any time in the preceding 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has performed night work in the preceding 6 months.","meaning":"Boolean indicating whether the patient has performed night work in the preceding 6 months."} ;; "The patient is excluded if the patient has performed night work in the preceding 6 months."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_performed_night_work_in_preceding_6_months)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has performed night work in the preceding 6 months."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const number_of_time_zones_crossed_in_last_1_month_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of time zones the patient has crossed due to transmeridian travel in the last 1 month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many time zones the patient has crossed in the last 1 month.","meaning":"Numeric value representing the number of time zones crossed by the patient in the last 1 month (unit: count)."} ;; "has traveled across more than 2 time zones (transmeridian travel) in the last 1 month"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not (> number_of_time_zones_crossed_in_last_1_month_withunit_count 2))
     :named REQ5_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has traveled across more than 2 time zones (transmeridian travel) in the last 1 month."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_bone_density_finding_value_recorded_now_withunit_tscore Real) ;; {"when_to_set_to_value":"Set to the measured T-score value if a bone mineral density T-score from a dual-energy x-ray absorptiometry (DXA) performed now is available.","when_to_set_to_null":"Set to null if no such T-score measurement is available or the value is indeterminate.","meaning":"Numeric T-score representing the patient's current bone mineral density as measured by DXA."} ;; "bone mineral density dual-energy x-ray absorptiometry T-score"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (< patient_bone_density_finding_value_recorded_now_withunit_tscore -1.75))
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a bone mineral density dual-energy x-ray absorptiometry T-score less than -1.75."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_orthostatic_intolerance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has orthostatic intolerance.","when_to_set_to_false":"Set to false if the patient currently does not have orthostatic intolerance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has orthostatic intolerance.","meaning":"Boolean indicating whether the patient currently has orthostatic intolerance."} ;; "The patient is excluded if the patient has orthostatic intolerance."

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not patient_has_finding_of_orthostatic_intolerance_now)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has orthostatic intolerance."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_falls_inthepast1years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had one or more falls within the past 1 year.","when_to_set_to_false":"Set to false if the patient has not had any falls within the past 1 year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had falls within the past 1 year.","meaning":"Boolean indicating whether the patient has had falls within the past 1 year."} ;; "has a prior history of falls in the past 1 year."

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (not patient_has_finding_of_falls_inthepast1years)
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a prior history of falls in the past 1 year."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_falling_injury_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an injurious fall at any time in the past 5 years.","when_to_set_to_false":"Set to false if the patient has not had an injurious fall at any time in the past 5 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an injurious fall in the past 5 years.","meaning":"Boolean indicating whether the patient has had an injurious fall in the past 5 years."} ;; "injurious fall in the past 5 years"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (not patient_has_finding_of_falling_injury_inthepast5years)
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a prior history of injurious fall in the past 5 years."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_fracture_of_proximal_end_of_femur_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of fracture of the proximal end of the femur (hip fracture), regardless of cause or context.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of fracture of the proximal end of the femur (hip fracture).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of fracture of the proximal end of the femur (hip fracture).","meaning":"Boolean indicating whether the patient has ever had a fracture of the proximal end of the femur (hip fracture), regardless of cause or context."} ;; "hip fracture"
(declare-const patient_has_finding_of_fracture_of_proximal_end_of_femur_inthehistory@@following_a_fall Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hip fracture (fracture of the proximal end of the femur) occurred as a result of (following) a fall.","when_to_set_to_false":"Set to false if the patient's hip fracture did not occur as a result of a fall.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hip fracture occurred as a result of a fall.","meaning":"Boolean indicating whether the patient's hip fracture occurred following a fall."} ;; "hip fracture following a fall"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies the stem variable (if hip fracture occurred following a fall, then hip fracture must have occurred)
(assert
(! (=> patient_has_finding_of_fracture_of_proximal_end_of_femur_inthehistory@@following_a_fall
      patient_has_finding_of_fracture_of_proximal_end_of_femur_inthehistory)
    :named REQ10_AUXILIARY0)) ;; "hip fracture following a fall" implies "hip fracture"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_fracture_of_proximal_end_of_femur_inthehistory@@following_a_fall)
    :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a hip fracture following a fall."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_difficulty_standing_from_sitting_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has difficulty rising from a sitting position.","when_to_set_to_false":"Set to false if the patient currently does not have difficulty rising from a sitting position.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has difficulty rising from a sitting position.","meaning":"Boolean indicating whether the patient currently has difficulty rising from a sitting position."} ;; "difficulty rising from a sitting position"
(declare-const patient_has_finding_of_difficulty_standing_from_sitting_now@@without_use_of_hands_to_push_off Bool) ;; {"when_to_set_to_true":"Set to true if the patient's difficulty rising from a sitting position occurs without use of hands to push off.","when_to_set_to_false":"Set to false if the patient's difficulty rising from a sitting position does not occur without use of hands to push off (i.e., the patient uses hands to push off).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the difficulty occurs without use of hands to push off.","meaning":"Boolean indicating whether the patient's difficulty rising from a sitting position occurs without use of hands to push off."} ;; "difficulty rising from a sitting position without use of hands to push off"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_finding_of_difficulty_standing_from_sitting_now@@without_use_of_hands_to_push_off
       patient_has_finding_of_difficulty_standing_from_sitting_now)
   :named REQ11_AUXILIARY0)) ;; "difficulty rising from a sitting position without use of hands to push off" implies "difficulty rising from a sitting position"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_finding_of_difficulty_standing_from_sitting_now@@without_use_of_hands_to_push_off)
   :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has difficulty rising from a sitting position without use of hands to push off."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_needs_to_walk_slowly_to_maintain_balance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently needs to walk slowly to maintain balance.","when_to_set_to_false":"Set to false if the patient currently does not need to walk slowly to maintain balance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently needs to walk slowly to maintain balance.","meaning":"Boolean indicating whether the patient currently needs to walk slowly to maintain balance."} ;; "the patient needs to walk slowly to maintain balance"

(declare-const patient_has_finding_of_wide_base_of_support_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently walks with a wide base of support.","when_to_set_to_false":"Set to false if the patient currently does not walk with a wide base of support.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently walks with a wide base of support.","meaning":"Boolean indicating whether the patient currently walks with a wide base of support."} ;; "the patient needs to walk with a wide base of support to maintain balance"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_needs_to_walk_slowly_to_maintain_balance_now)
    :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient needs to walk slowly to maintain balance."

(assert
(! (not patient_has_finding_of_wide_base_of_support_now)
    :named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient needs to walk with a wide base of support to maintain balance."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_undergone_hormone_replacement_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone hormone replacement therapy at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone hormone replacement therapy at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone hormone replacement therapy.","meaning":"Boolean indicating whether the patient has ever undergone hormone replacement therapy at any time in their history."} ;; "hormone replacement therapy"
(declare-const patient_hormone_replacement_therapy_value_recorded_inthehistory_withunit_months Real) ;; {"when_to_set_to_value":"Set to the total number of months the patient has received hormone replacement therapy at any time in their history, if known.","when_to_set_to_null":"Set to null if the total duration in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total duration in months for which the patient has received hormone replacement therapy at any time in their history."} ;; "hormone replacement therapy for less than three months"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not (and patient_has_undergone_hormone_replacement_therapy_inthehistory
             (< patient_hormone_replacement_therapy_value_recorded_inthehistory_withunit_months 3)))
   :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received hormone replacement therapy for less than three months."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_diagnosis_of_disorder_of_connective_tissue_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a connective tissue disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a connective tissue disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a connective tissue disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a connective tissue disorder."} ;; "connective tissue disorder"
(declare-const patient_has_diagnosis_of_arthropathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a joint disorder (arthropathy).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a joint disorder (arthropathy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a joint disorder (arthropathy).","meaning":"Boolean indicating whether the patient currently has a diagnosis of a joint disorder (arthropathy)."} ;; "joint disorder"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not (or patient_has_diagnosis_of_disorder_of_connective_tissue_now
            patient_has_diagnosis_of_arthropathy_now))
   :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a connective tissue disorder) OR (the patient has a joint disorder)."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_finding_of_disorder_of_nervous_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the nervous system (neurologic disorder).","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the nervous system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the nervous system.","meaning":"Boolean indicating whether the patient currently has a disorder of the nervous system."} ;; "neurologic disorder"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_finding_of_disorder_of_nervous_system_now)
:named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a neurologic disorder."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_diagnosis_of_disorder_of_musculoskeletal_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a disorder of the musculoskeletal system.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a disorder of the musculoskeletal system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a disorder of the musculoskeletal system.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a disorder of the musculoskeletal system."} ;; "musculoskeletal disorder"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not patient_has_diagnosis_of_disorder_of_musculoskeletal_system_now)
:named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a musculoskeletal disorder."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_finding_of_disorder_of_immune_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of disorder of immune function (immune disorder).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of disorder of immune function (immune disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of disorder of immune function (immune disorder).","meaning":"Boolean indicating whether the patient currently has a disorder of immune function (immune disorder)."} ;; "immune disorder"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
  (! (not patient_has_finding_of_disorder_of_immune_function_now)
     :named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an immune disorder."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_has_finding_of_sleep_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a sleep disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a sleep disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a sleep disorder.","meaning":"Boolean indicating whether the patient currently has a sleep disorder."} ;; "sleep disorder"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not patient_has_finding_of_sleep_disorder_now)
:named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a sleep disorder."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_has_finding_of_abnormal_chronobiologic_state_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any abnormal chronobiologic state (chronobiologic disorder).","when_to_set_to_false":"Set to false if the patient currently does not have any abnormal chronobiologic state (chronobiologic disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any abnormal chronobiologic state (chronobiologic disorder).","meaning":"Boolean indicating whether the patient currently has any abnormal chronobiologic state (chronobiologic disorder)."} ;; "chronobiologic disorder"

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not patient_has_finding_of_abnormal_chronobiologic_state_now)
:named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a chronobiologic disorder."

;; ===================== Declarations for the exclusion criterion (REQ 20) =====================
(declare-const patient_has_diagnosis_of_disorder_of_cardiovascular_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a disorder of the cardiovascular system.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a disorder of the cardiovascular system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a disorder of the cardiovascular system.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a disorder of the cardiovascular system."} ;; "cardiovascular disorder"

;; ===================== Constraint Assertions (REQ 20) =====================
(assert
(! (not patient_has_diagnosis_of_disorder_of_cardiovascular_system_now)
:named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a cardiovascular disorder."

;; ===================== Declarations for the exclusion criterion (REQ 21) =====================
(declare-const patient_has_finding_of_disorder_of_respiratory_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disorder of the respiratory system.","when_to_set_to_false":"Set to false if the patient currently does not have any disorder of the respiratory system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disorder of the respiratory system.","meaning":"Boolean indicating whether the patient currently has any disorder of the respiratory system."} ;; "respiratory disorder"

;; ===================== Constraint Assertions (REQ 21) =====================
(assert
(! (not patient_has_finding_of_disorder_of_respiratory_system_now)
:named REQ21_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a respiratory disorder."

;; ===================== Declarations for the exclusion criterion (REQ 22) =====================
(declare-const patient_has_finding_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of kidney disorder (kidney disease).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of kidney disorder (kidney disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of kidney disorder (kidney disease).","meaning":"Boolean indicating whether the patient currently has a kidney disorder (kidney disease)."} ;; "kidney disorder"
(declare-const patient_has_finding_of_disorder_of_urinary_tract_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of urinary tract disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of urinary tract disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of urinary tract disorder.","meaning":"Boolean indicating whether the patient currently has a urinary tract disorder."} ;; "urinary tract disorder"

;; ===================== Constraint Assertions (REQ 22) =====================
(assert
(! (not patient_has_finding_of_kidney_disease_now)
    :named REQ22_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a kidney disorder."

(assert
(! (not patient_has_finding_of_disorder_of_urinary_tract_now)
    :named REQ22_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a urinary tract disorder."

;; ===================== Declarations for the exclusion criterion (REQ 23) =====================
(declare-const patient_has_finding_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of disorder due to infection (infectious disease).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of disorder due to infection (infectious disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of disorder due to infection (infectious disease).","meaning":"Boolean indicating whether the patient currently has a disorder due to infection (infectious disease)."} ;; "infectious disease"

;; ===================== Constraint Assertions (REQ 23) =====================
(assert
  (! (not patient_has_finding_of_disorder_due_to_infection_now)
     :named REQ23_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an infectious disease."

;; ===================== Declarations for the exclusion criterion (REQ 24) =====================
(declare-const patient_has_finding_of_disorder_of_gastrointestinal_tract_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the gastrointestinal tract.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the gastrointestinal tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the gastrointestinal tract.","meaning":"Boolean indicating whether the patient currently has a disorder of the gastrointestinal tract."} ;; "gastrointestinal disorder"

;; ===================== Constraint Assertions (REQ 24) =====================
(assert
(! (not patient_has_finding_of_disorder_of_gastrointestinal_tract_now)
:named REQ24_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a gastrointestinal disorder."
