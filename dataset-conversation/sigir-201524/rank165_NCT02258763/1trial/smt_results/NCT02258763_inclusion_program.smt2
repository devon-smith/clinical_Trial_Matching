;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current age in months is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current age in months."} // "age ≥ 3 months AND age ≤ 59 months"
(declare-const patient_has_finding_of_cough_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of cough.","when_to_set_to_false":"Set to false if the patient does not have a documented history of cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of cough.","meaning":"Boolean indicating whether the patient has a history of cough."} // "history of cough"
(declare-const patient_has_finding_of_shortness_of_breath_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of shortness of breath.","when_to_set_to_false":"Set to false if the patient does not have a documented history of shortness of breath.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of shortness of breath.","meaning":"Boolean indicating whether the patient has a history of shortness of breath."} // "history of shortness of breath"
(declare-const patient_duration_unwell_value_recorded_now_in_days Real) ;; {"when_to_set_to_value":"Set to the measured value if the duration in days that the patient has been unwell is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the duration in days that the patient has been unwell up to now."} // "duration unwell ≤ 7 days"
(declare-const patient_respiratory_rate_value_recorded_now_withunit_breaths_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current respiratory rate in breaths per minute is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current respiratory rate in breaths per minute."} // "respiratory rate"
(declare-const patient_has_finding_of_increased_respiratory_rate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an increased respiratory rate as determined by clinical assessment.","when_to_set_to_false":"Set to false if the patient currently does not have an increased respiratory rate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an increased respiratory rate.","meaning":"Boolean indicating whether the patient currently has an increased respiratory rate."} // "increased respiratory rate"
(declare-const patient_has_finding_of_retraction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has retractions.","when_to_set_to_false":"Set to false if the patient currently does not have retractions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has retractions.","meaning":"Boolean indicating whether the patient currently has retractions."} // "presence of retractions"
(declare-const patient_has_finding_of_chest_wall_retraction_now@@present_at_examination_and_necessitating_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chest wall retractions that are present at examination and necessitate admission.","when_to_set_to_false":"Set to false if the patient currently has chest wall retractions but they are not present at examination or do not necessitate admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chest wall retractions are present at examination and necessitate admission.","meaning":"Boolean indicating whether the patient's current chest wall retractions are present at examination and necessitate admission."} // "presence of chest retractions present at examination and necessitating admission"
(declare-const patient_has_finding_of_cyanosis_now@@present_at_examination_and_necessitating_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cyanosis that is present at examination and necessitates admission.","when_to_set_to_false":"Set to false if the patient currently has cyanosis but it is not present at examination or does not necessitate admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cyanosis is present at examination and necessitates admission.","meaning":"Boolean indicating whether the patient's current cyanosis is present at examination and necessitates admission."} // "presence of cyanosis present at examination and necessitating admission"
(declare-const patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_at_examination_and_necessitating_admission Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current oxygen saturation percentage is measured at examination and necessitates admission.","when_to_set_to_null":"Set to null if no such measurement is available, the value is indeterminate, or it is not measured at examination/does not necessitate admission.","meaning":"Numeric value representing the patient's current oxygen saturation percentage measured at examination and necessitating admission."} // "oxygen saturation < 92 percent on room air present at examination and necessitating admission"
(declare-const patient_has_finding_of_feeding_poor_now@@present_at_examination_and_necessitating_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has poor feeding that is present at examination and necessitates admission.","when_to_set_to_false":"Set to false if the patient currently has poor feeding but it is not present at examination or does not necessitate admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the poor feeding is present at examination and necessitates admission.","meaning":"Boolean indicating whether the patient's current poor feeding is present at examination and necessitates admission."} // "poor feeding present at examination and necessitating admission"
(declare-const patient_has_finding_of_lethargy_now@@present_at_examination_and_necessitating_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has lethargy that is present at examination and necessitates admission.","when_to_set_to_false":"Set to false if the patient currently has lethargy but it is not present at examination or does not necessitate admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lethargy is present at examination and necessitates admission.","meaning":"Boolean indicating whether the patient's current lethargy is present at examination and necessitates admission."} // "lethargy present at examination and necessitating admission"
(declare-const patient_has_finding_of_fever_now@@documented_within_24_hours_of_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fever documented within 24 hours of admission.","when_to_set_to_false":"Set to false if the patient currently has fever but it is not documented within 24 hours of admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the fever is documented within 24 hours of admission.","meaning":"Boolean indicating whether the patient's current fever is documented within 24 hours of admission."} // "documented fever within 24 hours of admission"
(declare-const patient_axillary_temperature_value_recorded_now_withunit_degrees_celsius Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current axillary temperature in degrees Celsius is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current axillary temperature in degrees Celsius."} // "axillary temperature"
(declare-const patient_core_body_temperature_value_recorded_now_withunit_degrees_celsius Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current central (core) body temperature in degrees Celsius is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current central (core) body temperature in degrees Celsius."} // "central temperature"
(declare-const patient_has_undergone_plain_chest_x_ray_now_outcome_is_abnormal@@presence_of_alveolar_infiltrates Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has undergone a chest radiograph with abnormal outcome due to presence of alveolar infiltrates.","when_to_set_to_false":"Set to false if the patient currently has undergone a chest radiograph with abnormal outcome but without alveolar infiltrates.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal outcome is due to alveolar infiltrates.","meaning":"Boolean indicating whether the patient's current abnormal chest radiograph outcome is due to alveolar infiltrates."} // "abnormal chest radiograph with presence of alveolar infiltrates"
(declare-const patient_has_undergone_intravenous_antibiotic_therapy_now@@responded_by_first_72_hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has undergone intravenous antibiotic therapy and responded by the first 72 hours.","when_to_set_to_false":"Set to false if the patient currently has undergone intravenous antibiotic therapy but did not respond by the first 72 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient responded by the first 72 hours.","meaning":"Boolean indicating whether the patient's current intravenous antibiotic therapy resulted in response by the first 72 hours."} // "responds to intravenous antibiotics by the first 72 hours"
(declare-const patient_can_undergo_oral_antibiotic_therapy_now@@no_hypoxia_and_afebrile_and_reduced_respiratory_symptoms Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to go home with oral antibiotic therapy and has no hypoxia, is afebrile, and has reduced respiratory symptoms.","when_to_set_to_false":"Set to false if the patient is currently able to go home with oral antibiotic therapy but does not meet all three constraints.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient meets all three constraints.","meaning":"Boolean indicating whether the patient is currently able to go home with oral antibiotic therapy and meets all three constraints: no hypoxia, afebrile, and reduced respiratory symptoms."} // "able to go home with oral antibiotics (no hypoxia AND afebrile AND reduced respiratory symptoms)"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Documented fever within 24 hours of admission is defined by temperature thresholds
(assert
  (! (= patient_has_finding_of_fever_now@@documented_within_24_hours_of_admission
        (or (>= patient_axillary_temperature_value_recorded_now_withunit_degrees_celsius 38.0)
            (>= patient_core_body_temperature_value_recorded_now_withunit_degrees_celsius 38.5)))
     :named REQ0_AUXILIARY0)) ;; "documented fever (axillary temperature ≥ 38 degrees Celsius OR central temperature ≥ 38.5 degrees Celsius) within 24 hours of admission"

;; Increased respiratory rate is defined by age-specific thresholds
(assert
  (! (= patient_has_finding_of_increased_respiratory_rate_now
        (or (and (<= patient_age_value_recorded_now_in_months 12.0)
                 (>= patient_respiratory_rate_value_recorded_now_withunit_breaths_per_minute 50.0))
            (and (> patient_age_value_recorded_now_in_months 12.0)
                 (>= patient_respiratory_rate_value_recorded_now_withunit_breaths_per_minute 40.0))))
     :named REQ0_AUXILIARY1)) ;; "increased respiratory rate (respiratory rate ≥ 50 per minute if age ≤ 12 months OR respiratory rate ≥ 40 per minute if age > 12 months)"

;; At least one sign or symptom present at examination and necessitating admission
(define-fun admission_sign_present () Bool
  (or patient_has_finding_of_chest_wall_retraction_now@@present_at_examination_and_necessitating_admission
      patient_has_finding_of_cyanosis_now@@present_at_examination_and_necessitating_admission
      (< patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_at_examination_and_necessitating_admission 92.0)
      patient_has_finding_of_feeding_poor_now@@present_at_examination_and_necessitating_admission
      patient_has_finding_of_lethargy_now@@present_at_examination_and_necessitating_admission)) ;; "at least one of the following signs or symptoms present at examination that would necessitate admission"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Age between 3 and 59 months
(assert
  (! (and (>= patient_age_value_recorded_now_in_months 3.0)
          (<= patient_age_value_recorded_now_in_months 59.0))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "age ≥ 3 months AND age ≤ 59 months"

;; Component 1: History of cough OR history of shortness of breath
(assert
  (! (or patient_has_finding_of_cough_inthehistory
         patient_has_finding_of_shortness_of_breath_inthehistory)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "history of cough OR history of shortness of breath"

;; Component 2: Duration unwell ≤ 7 days
(assert
  (! (<= patient_duration_unwell_value_recorded_now_in_days 7.0)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "duration unwell ≤ 7 days"

;; Component 3: Increased respiratory rate OR presence of retractions
(assert
  (! (or patient_has_finding_of_increased_respiratory_rate_now
         patient_has_finding_of_retraction_now)
     :named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "increased respiratory rate ... OR presence of retractions"

;; Component 4: At least one sign or symptom present at examination and necessitating admission
(assert
  (! admission_sign_present
     :named REQ0_COMPONENT4_OTHER_REQUIREMENTS)) ;; "at least one of the following signs or symptoms present at examination that would necessitate admission"

;; Component 5: Documented fever within 24 hours of admission
(assert
  (! patient_has_finding_of_fever_now@@documented_within_24_hours_of_admission
     :named REQ0_COMPONENT5_OTHER_REQUIREMENTS)) ;; "documented fever ... within 24 hours of admission"

;; Component 6: Abnormal chest radiograph with presence of alveolar infiltrates
(assert
  (! patient_has_undergone_plain_chest_x_ray_now_outcome_is_abnormal@@presence_of_alveolar_infiltrates
     :named REQ0_COMPONENT6_OTHER_REQUIREMENTS)) ;; "abnormal chest radiograph with presence of alveolar infiltrates"

;; Component 7: Responds to intravenous antibiotics by first 72 hours AND able to go home with oral antibiotics (no hypoxia AND afebrile AND reduced respiratory symptoms)
(assert
  (! (and patient_has_undergone_intravenous_antibiotic_therapy_now@@responded_by_first_72_hours
          patient_can_undergo_oral_antibiotic_therapy_now@@no_hypoxia_and_afebrile_and_reduced_respiratory_symptoms)
     :named REQ0_COMPONENT7_OTHER_REQUIREMENTS)) ;; "responds to intravenous antibiotics by the first 72 hours AND able to go home with oral antibiotics (no hypoxia AND afebrile AND reduced respiratory symptoms)"
