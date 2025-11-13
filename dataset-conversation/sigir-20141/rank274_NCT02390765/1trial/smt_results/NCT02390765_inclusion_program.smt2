;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged greater than or equal to 8 years AND aged less than or equal to 17 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 8)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "aged greater than or equal to 8 years"

(assert
  (! (<= patient_age_value_recorded_now_in_years 17)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "aged less than or equal to 17 years"

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_body_weight_value_recorded_now_withunit_kg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current body weight in kilograms is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body weight in kilograms, recorded now."} // "weight greater than or equal to the 5th percentile for age and sex according to Centers for Disease Control and Prevention 2000 United States standard"
(declare-const patient_body_weight_value_recorded_now_withunit_kg@@percentile_threshold_cdc_2000_us_standard Bool) ;; {"when_to_set_to_true":"Set to true if the patient's body weight is being evaluated against the 5th percentile for age and sex per CDC 2000 US standard.","when_to_set_to_false":"Set to false if the patient's body weight is not being evaluated against this standard.","when_to_set_to_null":"Set to null if it is unknown whether the CDC 2000 US standard is being used for percentile comparison.","meaning":"Boolean indicating whether the patient's body weight is being compared to the 5th percentile for age and sex per CDC 2000 US standard."} // "weight greater than or equal to the 5th percentile for age and sex according to Centers for Disease Control and Prevention 2000 United States standard"

(declare-const patient_body_height_measure_value_recorded_now_withunit_cm Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current body height in centimeters is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body height in centimeters, recorded now."} // "height greater than or equal to the 5th percentile for age and sex according to Centers for Disease Control and Prevention 2000 United States standard"
(declare-const patient_body_height_measure_value_recorded_now_withunit_cm@@percentile_threshold_cdc_2000_us_standard Bool) ;; {"when_to_set_to_true":"Set to true if the patient's body height is being evaluated against the 5th percentile for age and sex per CDC 2000 US standard.","when_to_set_to_false":"Set to false if the patient's body height is not being evaluated against this standard.","when_to_set_to_null":"Set to null if it is unknown whether the CDC 2000 US standard is being used for percentile comparison.","meaning":"Boolean indicating whether the patient's body height is being compared to the 5th percentile for age and sex per CDC 2000 US standard."} // "height greater than or equal to the 5th percentile for age and sex according to Centers for Disease Control and Prevention 2000 United States standard"

(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current body mass index in kilograms per square meter is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index in kilograms per square meter, recorded now."} // "body mass index greater than or equal to the 5th percentile for age and sex according to Centers for Disease Control and Prevention 2000 United States standard"
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2@@percentile_threshold_cdc_2000_us_standard Bool) ;; {"when_to_set_to_true":"Set to true if the patient's body mass index is being evaluated against the 5th percentile for age and sex per CDC 2000 US standard.","when_to_set_to_false":"Set to false if the patient's body mass index is not being evaluated against this standard.","when_to_set_to_null":"Set to null if it is unknown whether the CDC 2000 US standard is being used for percentile comparison.","meaning":"Boolean indicating whether the patient's body mass index is being compared to the 5th percentile for age and sex per CDC 2000 US standard."} // "body mass index greater than or equal to the 5th percentile for age and sex according to Centers for Disease Control and Prevention 2000 United States standard"

;; Declare percentile threshold variables for CDC 2000 US standard (for age and sex)
(declare-const patient_body_weight_percentile_5th_cdc_2000_us_standard_for_age_and_sex Real) ;; {"when_to_set_to_value":"Set to the 5th percentile value for body weight for the patient's age and sex according to CDC 2000 US standard.","when_to_set_to_null":"Set to null if percentile value is unknown or cannot be determined.","meaning":"Numeric value representing the 5th percentile for body weight for the patient's age and sex per CDC 2000 US standard."} // "weight greater than or equal to the 5th percentile for age and sex according to Centers for Disease Control and Prevention 2000 United States standard"
(declare-const patient_body_height_percentile_5th_cdc_2000_us_standard_for_age_and_sex Real) ;; {"when_to_set_to_value":"Set to the 5th percentile value for body height for the patient's age and sex according to CDC 2000 US standard.","when_to_set_to_null":"Set to null if percentile value is unknown or cannot be determined.","meaning":"Numeric value representing the 5th percentile for body height for the patient's age and sex per CDC 2000 US standard."} // "height greater than or equal to the 5th percentile for age and sex according to Centers for Disease Control and Prevention 2000 United States standard"
(declare-const patient_body_mass_index_percentile_5th_cdc_2000_us_standard_for_age_and_sex Real) ;; {"when_to_set_to_value":"Set to the 5th percentile value for body mass index for the patient's age and sex according to CDC 2000 US standard.","when_to_set_to_null":"Set to null if percentile value is unknown or cannot be determined.","meaning":"Numeric value representing the 5th percentile for body mass index for the patient's age and sex per CDC 2000 US standard."} // "body mass index greater than or equal to the 5th percentile for age and sex according to Centers for Disease Control and Prevention 2000 United States standard"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply that the corresponding measurement is being compared to the CDC 2000 US standard 5th percentile
(assert
  (! (=> patient_body_weight_value_recorded_now_withunit_kg@@percentile_threshold_cdc_2000_us_standard
         (and (>= patient_body_weight_value_recorded_now_withunit_kg patient_body_weight_percentile_5th_cdc_2000_us_standard_for_age_and_sex)
              true))
     :named REQ1_AUXILIARY0)) ;; "weight greater than or equal to the 5th percentile for age and sex according to Centers for Disease Control and Prevention 2000 United States standard"

(assert
  (! (=> patient_body_height_measure_value_recorded_now_withunit_cm@@percentile_threshold_cdc_2000_us_standard
         (and (>= patient_body_height_measure_value_recorded_now_withunit_cm patient_body_height_percentile_5th_cdc_2000_us_standard_for_age_and_sex)
              true))
     :named REQ1_AUXILIARY1)) ;; "height greater than or equal to the 5th percentile for age and sex according to Centers for Disease Control and Prevention 2000 United States standard"

(assert
  (! (=> patient_body_mass_index_value_recorded_now_withunit_kg_per_m2@@percentile_threshold_cdc_2000_us_standard
         (and (>= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 patient_body_mass_index_percentile_5th_cdc_2000_us_standard_for_age_and_sex)
              true))
     :named REQ1_AUXILIARY2)) ;; "body mass index greater than or equal to the 5th percentile for age and sex according to Centers for Disease Control and Prevention 2000 United States standard"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Weight >= 5th percentile for age and sex (CDC 2000 US standard)
(assert
  (! (and patient_body_weight_value_recorded_now_withunit_kg@@percentile_threshold_cdc_2000_us_standard
          (>= patient_body_weight_value_recorded_now_withunit_kg patient_body_weight_percentile_5th_cdc_2000_us_standard_for_age_and_sex))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "weight greater than or equal to the 5th percentile for age and sex according to Centers for Disease Control and Prevention 2000 United States standard"

;; Component 1: Height >= 5th percentile for age and sex (CDC 2000 US standard)
(assert
  (! (and patient_body_height_measure_value_recorded_now_withunit_cm@@percentile_threshold_cdc_2000_us_standard
          (>= patient_body_height_measure_value_recorded_now_withunit_cm patient_body_height_percentile_5th_cdc_2000_us_standard_for_age_and_sex))
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "height greater than or equal to the 5th percentile for age and sex according to Centers for Disease Control and Prevention 2000 United States standard"

;; Component 2: BMI >= 5th percentile for age and sex (CDC 2000 US standard)
(assert
  (! (and patient_body_mass_index_value_recorded_now_withunit_kg_per_m2@@percentile_threshold_cdc_2000_us_standard
          (>= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 patient_body_mass_index_percentile_5th_cdc_2000_us_standard_for_age_and_sex))
     :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "body mass index greater than or equal to the 5th percentile for age and sex according to Centers for Disease Control and Prevention 2000 United States standard"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_ability_to_perform_cognitive_activity_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured FSIQ score if a current full scale intelligence quotient value is available for the patient.","when_to_set_to_null":"Set to null if no current FSIQ score is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current full scale intelligence quotient (FSIQ) score."} // "full scale intelligence quotient greater than or equal to 70"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have cognitive capability to complete study procedures, defined as full scale intelligence quotient greater than or equal to 70.
(assert
  (! (>= patient_ability_to_perform_cognitive_activity_value_recorded_now_withunit_score 70)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have cognitive capability to complete study procedures, defined as full scale intelligence quotient greater than or equal to 70."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_general_health_good_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of good general health.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of good general health.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has good general health.","meaning":"Boolean indicating whether the patient currently has good general health."} // "good general health"
(declare-const patient_has_finding_of_general_health_good_now@@based_on_normal_medical_history_and_physical_examination Bool) ;; {"when_to_set_to_true":"Set to true if the patient's good general health is based on both a normal medical history and a normal physical examination.","when_to_set_to_false":"Set to false if the patient's good general health is not based on both a normal medical history and a normal physical examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the assessment is based on both a normal medical history and a normal physical examination.","meaning":"Boolean indicating whether the patient's good general health is based on both a normal medical history and a normal physical examination."} // "good general health based on (a normal medical history AND a normal physical examination)"
(declare-const patient_has_finding_of_general_health_good_now@@abnormality_permitted_only_if_due_to_overweight_or_well_controlled_minor_illness Bool) ;; {"when_to_set_to_true":"Set to true if any abnormality present in the patient's good general health is permitted only if due to overweight or a minor illness that is well controlled.","when_to_set_to_false":"Set to false if any abnormality present in the patient's good general health is not permitted under these conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether any abnormality is permitted only if due to overweight or well-controlled minor illness.","meaning":"Boolean indicating whether any abnormality present in the patient's good general health is permitted only if due to overweight or a minor illness that is well controlled."} // "except if the abnormality is due to (overweight OR minor illness that is well controlled)"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_general_health_good_now@@based_on_normal_medical_history_and_physical_examination
         patient_has_finding_of_general_health_good_now)
     :named REQ3_AUXILIARY0)) ;; "good general health based on (a normal medical history AND a normal physical examination)"

(assert
  (! (=> patient_has_finding_of_general_health_good_now@@abnormality_permitted_only_if_due_to_overweight_or_well_controlled_minor_illness
         patient_has_finding_of_general_health_good_now)
     :named REQ3_AUXILIARY1)) ;; "except if the abnormality is due to (overweight OR minor illness that is well controlled)"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (and patient_has_finding_of_general_health_good_now@@based_on_normal_medical_history_and_physical_examination
          patient_has_finding_of_general_health_good_now@@abnormality_permitted_only_if_due_to_overweight_or_well_controlled_minor_illness)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have good general health based on (a normal medical history AND a normal physical examination), except if the abnormality is due to (overweight OR minor illness that is well controlled)."
