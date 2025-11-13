;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged greater than or equal to 40 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 40)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged greater than or equal to 40 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic obstructive pulmonary disease."} // "diagnosis of chronic obstructive pulmonary disease"
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@relatively_stable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chronic obstructive pulmonary disease is relatively stable.","when_to_set_to_false":"Set to false if the patient's chronic obstructive pulmonary disease is not relatively stable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic obstructive pulmonary disease is relatively stable.","meaning":"Boolean indicating whether the patient's chronic obstructive pulmonary disease is relatively stable."} // "relatively stable chronic obstructive pulmonary disease"
(declare-const patient_has_diagnosis_of_moderate_chronic_obstructive_pulmonary_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of moderate chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of moderate chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of moderate chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of moderate chronic obstructive pulmonary disease."} // "diagnosis of moderate chronic obstructive pulmonary disease"
(declare-const patient_has_diagnosis_of_severe_chronic_obstructive_pulmonary_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of severe chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of severe chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of severe chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of severe chronic obstructive pulmonary disease."} // "diagnosis of severe chronic obstructive pulmonary disease"
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percent value if a numeric measurement of FEV1 (percent of predicted normal value) recorded now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percent representing the patient's current FEV1 as percent of predicted normal value."} // "screening forced expiratory volume in one second less than or equal to 60 percent of predicted normal value"
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent@@measured_at_screening Bool) ;; {"when_to_set_to_true":"Set to true if the FEV1 measurement was taken at screening.","when_to_set_to_false":"Set to false if the FEV1 measurement was not taken at screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the FEV1 measurement was taken at screening.","meaning":"Boolean indicating whether the FEV1 measurement was taken at screening."} // "screening forced expiratory volume in one second"
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent@@predicted_normal_value_calculated_according_to_european_community_for_coal_and_steel_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the predicted normal value for FEV1 was calculated according to European Community for Coal and Steel criteria.","when_to_set_to_false":"Set to false if the predicted normal value for FEV1 was not calculated according to European Community for Coal and Steel criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the predicted normal value for FEV1 was calculated according to European Community for Coal and Steel criteria.","meaning":"Boolean indicating whether the predicted normal value for FEV1 was calculated according to European Community for Coal and Steel criteria."} // "predicted normal value calculated according to European Community for Coal and Steel criteria"
(declare-const patient_forced_expired_volume_in_1_second_divided_by_forced_vital_capacity_value_recorded_at_screening_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percent value if a numeric measurement of FEV1/FVC (percent) recorded at screening is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percent representing the patient's FEV1/FVC ratio as percent measured at screening."} // "screening forced expiratory volume in one second divided by forced vital capacity less than or equal to 70 percent"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies stem variable (relatively stable COPD)
(assert
  (! (=> patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@relatively_stable
         patient_has_diagnosis_of_chronic_obstructive_lung_disease_now)
     :named REQ1_AUXILIARY0)) ;; "relatively stable chronic obstructive pulmonary disease"

;; Qualifier variable implies stem variable (FEV1 measured at screening)
(assert
  (! (=> patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent@@measured_at_screening
         true)
     :named REQ1_AUXILIARY1)) ;; "screening forced expiratory volume in one second"

;; Qualifier variable implies stem variable (FEV1 predicted normal value calculated by ECCS)
(assert
  (! (=> patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent@@predicted_normal_value_calculated_according_to_european_community_for_coal_and_steel_criteria
         true)
     :named REQ1_AUXILIARY2)) ;; "predicted normal value calculated according to European Community for Coal and Steel criteria"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Must have relatively stable COPD
(assert
  (! patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@relatively_stable
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "diagnosis of relatively stable chronic obstructive pulmonary disease"

;; Component 1: Must have (moderate COPD OR (severe COPD AND FEV1 <= 60% AND FEV1/FVC <= 70%))
(assert
  (! (or patient_has_diagnosis_of_moderate_chronic_obstructive_pulmonary_disease_now
         (and patient_has_diagnosis_of_severe_chronic_obstructive_pulmonary_disease_now
              (<= patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent 60.0)
              patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent@@measured_at_screening
              patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent@@predicted_normal_value_calculated_according_to_european_community_for_coal_and_steel_criteria
              (<= patient_forced_expired_volume_in_1_second_divided_by_forced_vital_capacity_value_recorded_at_screening_withunit_percent 70.0)))
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "diagnosis of moderate chronic obstructive pulmonary disease OR (diagnosis of severe chronic obstructive pulmonary disease AND FEV1 <= 60% AND FEV1/FVC <= 70%)"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_tobacco_smoking_behavior_finding_value_recorded_inthehistory_withunit_pack_years Real) ;; {"when_to_set_to_value":"Set to the measured or calculated pack-years value if the patient's cumulative tobacco smoking exposure over their history is available.","when_to_set_to_null":"Set to null if no such measurement or calculation is available or the value is indeterminate.","meaning":"Numeric value representing the patient's cumulative tobacco smoking exposure in pack-years over their history."} // "smoking history greater than or equal to 10 pack-years (where one pack-year is defined as 20 cigarettes per day for one year or equivalent)"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= patient_tobacco_smoking_behavior_finding_value_recorded_inthehistory_withunit_pack_years 10)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a smoking history greater than or equal to 10 pack-years (where one pack-year is defined as 20 cigarettes per day for one year or equivalent)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_ability_to_be_trained_in_proper_use_of_handihaler_device Bool) ;; {"when_to_set_to_true":"Set to true if the patient has the ability to be trained in the proper use of the HandiHaler device.","when_to_set_to_false":"Set to false if the patient does not have the ability to be trained in the proper use of the HandiHaler device.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has the ability to be trained in the proper use of the HandiHaler device.","meaning":"Boolean indicating whether the patient has the ability to be trained in the proper use of the HandiHaler device."} // "the ability to be trained in the proper use of the HandiHaler device"
(declare-const patient_has_ability_to_be_trained_in_proper_use_of_metered_dose_inhaler Bool) ;; {"when_to_set_to_true":"Set to true if the patient has the ability to be trained in the proper use of the metered dose inhaler.","when_to_set_to_false":"Set to false if the patient does not have the ability to be trained in the proper use of the metered dose inhaler.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has the ability to be trained in the proper use of the metered dose inhaler.","meaning":"Boolean indicating whether the patient has the ability to be trained in the proper use of the metered dose inhaler."} // "the ability to be trained in the proper use of the metered dose inhaler"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_ability_to_be_trained_in_proper_use_of_handihaler_device
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the ability to be trained in the proper use of the HandiHaler device"

(assert
  (! patient_has_ability_to_be_trained_in_proper_use_of_metered_dose_inhaler
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the ability to be trained in the proper use of the metered dose inhaler"

;; ===================== Declarations for the inclusion criterion (REQ 4) =====================
(declare-const patient_can_undergo_shuttle_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to undergo the shuttle walking test.","when_to_set_to_false":"Set to false if the patient is currently unable to undergo the shuttle walking test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo the shuttle walking test.","meaning":"Boolean indicating whether the patient can currently undergo the shuttle walking test."} // "the shuttle walking test"
(declare-const patient_can_undergo_shuttle_test_now@@is_study_related_test Bool) ;; {"when_to_set_to_true":"Set to true if the shuttle walking test is classified as a study related test for this patient.","when_to_set_to_false":"Set to false if the shuttle walking test is not classified as a study related test for this patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the shuttle walking test is a study related test for this patient.","meaning":"Boolean indicating whether the shuttle walking test is a study related test for this patient."} // "the shuttle walking test" is a study related test
(declare-const patient_can_undergo_acceptable_pulmonary_function_tests_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to undergo acceptable pulmonary function tests, including peak expiratory flow rate measurements.","when_to_set_to_false":"Set to false if the patient is currently unable to undergo acceptable pulmonary function tests, including peak expiratory flow rate measurements.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo acceptable pulmonary function tests, including peak expiratory flow rate measurements.","meaning":"Boolean indicating whether the patient can currently undergo acceptable pulmonary function tests, including peak expiratory flow rate measurements."} // "acceptable pulmonary function tests including peak expiratory flow rate measurements"
(declare-const patient_can_maintain_diary_card_records_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to maintain diary card records.","when_to_set_to_false":"Set to false if the patient is currently unable to maintain diary card records.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently maintain diary card records.","meaning":"Boolean indicating whether the patient can currently maintain diary card records."} // "the ability to maintain diary card records"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable for shuttle test implies the patient can undergo the shuttle test
(assert
  (! (=> patient_can_undergo_shuttle_test_now@@is_study_related_test
         patient_can_undergo_shuttle_test_now)
     :named REQ4_AUXILIARY0)) ;; "the shuttle walking test is a study related test"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: Ability to perform all study related tests including (shuttle walking test AND acceptable pulmonary function tests including peak expiratory flow rate measurements)
(assert
  (! (and patient_can_undergo_shuttle_test_now
          patient_can_undergo_acceptable_pulmonary_function_tests_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the ability to perform all study related tests including (the shuttle walking test AND acceptable pulmonary function tests including peak expiratory flow rate measurements)"

;; Component 1: Ability to maintain diary card records
(assert
  (! patient_can_maintain_diary_card_records_now
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the ability to maintain diary card records"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_ability_to_give_written_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the ability to give written informed consent.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to give written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to give written informed consent.","meaning":"Boolean indicating whether the patient currently has the ability to give written informed consent."} // "the ability to give written informed consent"
(declare-const patient_has_ability_to_give_written_informed_consent_now@@in_accordance_with_good_clinical_practice_and_local_regulations Bool) ;; {"when_to_set_to_true":"Set to true if the patient's written informed consent is in accordance with good clinical practice and local regulations.","when_to_set_to_false":"Set to false if the patient's written informed consent is not in accordance with good clinical practice and local regulations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's written informed consent is in accordance with good clinical practice and local regulations.","meaning":"Boolean indicating whether the patient's written informed consent is in accordance with good clinical practice and local regulations."} // "in accordance with good clinical practice and local regulations"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_ability_to_give_written_informed_consent_now@@in_accordance_with_good_clinical_practice_and_local_regulations
         patient_has_ability_to_give_written_informed_consent_now)
     :named REQ5_AUXILIARY0)) ;; "in accordance with good clinical practice and local regulations" implies "ability to give written informed consent"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_ability_to_give_written_informed_consent_now@@in_accordance_with_good_clinical_practice_and_local_regulations
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "ability to give written informed consent in accordance with good clinical practice AND local regulations"
