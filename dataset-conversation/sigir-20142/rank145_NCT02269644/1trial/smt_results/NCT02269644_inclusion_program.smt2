;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 18 years AND ≤ 85 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: patient must be aged ≥ 18 years
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be an adult aged ≥ 18 years."

;; Component 1: patient must be aged ≤ 85 years
(assert
  (! (<= patient_age_value_recorded_now_in_years 85)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be an adult aged ≤ 85 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_given_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent.","meaning":"Boolean indicating whether the patient has provided written informed consent."} ;; "To be included, the patient must have given written informed consent."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_given_written_informed_consent
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have given written informed consent."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_acute_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute illness.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of acute illness.","meaning":"Boolean indicating whether the patient currently has acute illness."} ;; "acute illness"
(declare-const patient_has_finding_of_acute_disease_now@@onset_within_previous_7_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acute illness and the onset of the illness occurred within the previous 7 days.","when_to_set_to_false":"Set to false if the patient currently has acute illness but the onset did not occur within the previous 7 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the onset of acute illness occurred within the previous 7 days.","meaning":"Boolean indicating whether the onset of acute illness occurred within the previous 7 days."} ;; "onset within previous 7 days"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies the stem variable (if onset within previous 7 days, then acute illness is present)
(assert
  (! (=> patient_has_finding_of_acute_disease_now@@onset_within_previous_7_days
         patient_has_finding_of_acute_disease_now)
     :named REQ2_AUXILIARY0)) ;; "onset within previous 7 days" implies "acute illness"

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must have acute illness with onset within the previous 7 days
(assert
  (! patient_has_finding_of_acute_disease_now@@onset_within_previous_7_days
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have acute illness with onset within the previous 7 days."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cough.","when_to_set_to_false":"Set to false if the patient currently does not have cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cough.","meaning":"Boolean indicating whether the patient currently has cough."} ;; "cough"
(declare-const patient_has_finding_of_difficulty_breathing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has difficulty breathing.","when_to_set_to_false":"Set to false if the patient currently does not have difficulty breathing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has difficulty breathing.","meaning":"Boolean indicating whether the patient currently has difficulty breathing."} ;; "difficulty breathing"
(declare-const patient_has_finding_of_dyspnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has shortness of breath (dyspnea).","when_to_set_to_false":"Set to false if the patient currently does not have shortness of breath (dyspnea).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has shortness of breath (dyspnea).","meaning":"Boolean indicating whether the patient currently has shortness of breath (dyspnea)."} ;; "shortness of breath"
(declare-const patient_has_finding_of_pleuritic_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pleuritic chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have pleuritic chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pleuritic chest pain.","meaning":"Boolean indicating whether the patient currently has pleuritic chest pain."} ;; "pleuritic chest pain"
(declare-const patient_has_finding_of_purulent_sputum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has production of purulent sputum.","when_to_set_to_false":"Set to false if the patient currently does not have production of purulent sputum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has production of purulent sputum.","meaning":"Boolean indicating whether the patient currently has production of purulent sputum."} ;; "purulent sputum"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; "difficulty breathing OR shortness of breath" is a grouped symptom for the count
(define-fun patient_has_finding_of_difficulty_breathing_or_dyspnea_now () Bool
  (or patient_has_finding_of_difficulty_breathing_now patient_has_finding_of_dyspnea_now))
;; "To be included, the patient must have at least 2 of the following symptoms: (difficulty breathing OR shortness of breath), cough, production of purulent sputum, or pleuritic chest pain."

;; ===================== Constraint Assertions (REQ 3) =====================
;; At least 2 of the 4 grouped symptoms must be present
(assert
  (! (>=
        (+ (ite patient_has_finding_of_difficulty_breathing_or_dyspnea_now 1 0)
           (ite patient_has_finding_of_cough_now 1 0)
           (ite patient_has_finding_of_purulent_sputum_now 1 0)
           (ite patient_has_finding_of_pleuritic_pain_now 1 0))
        2)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have at least 2 of the following symptoms: (difficulty breathing OR shortness of breath), cough, production of purulent sputum, or pleuritic chest pain."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_body_temperature_value_recorded_now_withunit_degrees_celsius Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body temperature in degrees Celsius is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body temperature in degrees Celsius."} ;; "body temperature > 38 degrees Celsius OR body temperature < 35 degrees Celsius"
(declare-const patient_has_finding_of_abnormal_vital_signs_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any abnormal vital signs.","when_to_set_to_false":"Set to false if the patient currently does not have any abnormal vital signs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abnormal vital signs.","meaning":"Boolean indicating whether the patient currently has abnormal vital signs."} ;; "vital sign abnormalities"
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fever.","when_to_set_to_false":"Set to false if the patient currently does not have fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fever.","meaning":"Boolean indicating whether the patient currently has fever."} ;; "fever"
(declare-const patient_has_finding_of_low_blood_pressure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypotension (low blood pressure).","when_to_set_to_false":"Set to false if the patient currently does not have hypotension (low blood pressure).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypotension (low blood pressure).","meaning":"Boolean indicating whether the patient currently has hypotension (low blood pressure)."} ;; "hypotension"
(declare-const patient_has_finding_of_tachycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tachycardia.","when_to_set_to_false":"Set to false if the patient currently does not have tachycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tachycardia.","meaning":"Boolean indicating whether the patient currently has tachycardia."} ;; "tachycardia"
(declare-const patient_has_finding_of_tachypnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tachypnea.","when_to_set_to_false":"Set to false if the patient currently does not have tachypnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tachypnea.","meaning":"Boolean indicating whether the patient currently has tachypnea."} ;; "tachypnea"
(declare-const patient_heart_rate_value_recorded_now_withunit_beats_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's heart rate in beats per minute is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current heart rate in beats per minute."} ;; "heart rate > 100 beats per minute"
(declare-const patient_respiratory_rate_value_recorded_now_withunit_breaths_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's respiratory rate in breaths per minute is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current respiratory rate in breaths per minute."} ;; "respiratory rate > 24 breaths per minute"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's systolic blood pressure in millimeters of mercury is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current systolic blood pressure in millimeters of mercury."} ;; "systolic blood pressure < 90 millimeters of mercury"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition of fever based on body temperature
(assert
  (! (= patient_has_finding_of_fever_now
        (or (> patient_body_temperature_value_recorded_now_withunit_degrees_celsius 38.0)
            (< patient_body_temperature_value_recorded_now_withunit_degrees_celsius 35.0)))
     :named REQ4_AUXILIARY0)) ;; "fever (body temperature > 38 degrees Celsius OR body temperature < 35 degrees Celsius)"

;; Definition of hypotension based on systolic blood pressure
(assert
  (! (= patient_has_finding_of_low_blood_pressure_now
        (< patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 90.0))
     :named REQ4_AUXILIARY1)) ;; "hypotension (systolic blood pressure < 90 millimeters of mercury)"

;; Definition of tachycardia based on heart rate
(assert
  (! (= patient_has_finding_of_tachycardia_now
        (> patient_heart_rate_value_recorded_now_withunit_beats_per_minute 100.0))
     :named REQ4_AUXILIARY2)) ;; "tachycardia (heart rate > 100 beats per minute)"

;; Definition of tachypnea based on respiratory rate
(assert
  (! (= patient_has_finding_of_tachypnea_now
        (> patient_respiratory_rate_value_recorded_now_withunit_breaths_per_minute 24.0))
     :named REQ4_AUXILIARY3)) ;; "tachypnea (respiratory rate > 24 breaths per minute)"

;; Definition of abnormal vital signs: at least one abnormal vital sign present
(assert
  (! (= patient_has_finding_of_abnormal_vital_signs_now
        (or patient_has_finding_of_fever_now
            patient_has_finding_of_low_blood_pressure_now
            patient_has_finding_of_tachycardia_now
            patient_has_finding_of_tachypnea_now))
     :named REQ4_AUXILIARY4)) ;; "vital sign abnormalities"

;; Count the number of vital sign abnormalities present
(define-fun abnormal_vital_signs_count () Int
  (+ (ite patient_has_finding_of_fever_now 1 0)
     (ite patient_has_finding_of_low_blood_pressure_now 1 0)
     (ite patient_has_finding_of_tachycardia_now 1 0)
     (ite patient_has_finding_of_tachypnea_now 1 0))) ;; "at least 2 of the following vital sign abnormalities"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (>= abnormal_vital_signs_count 2)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have at least 2 of the following vital sign abnormalities: fever, hypotension, tachycardia, tachypnea."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_hypoxemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypoxemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypoxemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypoxemia.","meaning":"Boolean indicating whether the patient currently has hypoxemia."} ;; "hypoxemia"
(declare-const patient_room_air_arterial_oxygen_saturation_value_now_in_percent Real) ;; {"when_to_set_to_value":"Set to the patient's current room air arterial oxygen saturation value in percent if measured and available.","when_to_set_to_null":"Set to null if the patient's current room air arterial oxygen saturation value is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current room air arterial oxygen saturation in percent."} ;; "room air arterial oxygen saturation < 90 percent"
(declare-const patient_has_finding_of_lung_consolidation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pulmonary (lung) consolidation.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pulmonary (lung) consolidation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pulmonary (lung) consolidation.","meaning":"Boolean indicating whether the patient currently has pulmonary (lung) consolidation."} ;; "clinical evidence of pulmonary consolidation"
(declare-const patient_has_finding_of_increased_blood_leukocyte_number_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of increased (elevated) white blood cell count.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of increased (elevated) white blood cell count.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has increased (elevated) white blood cell count.","meaning":"Boolean indicating whether the patient currently has increased (elevated) white blood cell count."} ;; "elevated white blood cell count"
(declare-const patient_has_finding_of_neutropenia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of neutropenia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of neutropenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has neutropenia.","meaning":"Boolean indicating whether the patient currently has neutropenia."} ;; "neutropenia"
(declare-const patient_white_blood_cell_count_value_now_in_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the patient's current white blood cell count value in number per cubic millimeter if measured and available.","when_to_set_to_null":"Set to null if the patient's current white blood cell count value is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current white blood cell count in number per cubic millimeter."} ;; "white blood cell count > 12,000 per cubic millimeter OR white blood cell count < 4,000 per cubic millimeter"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definition in the requirement: hypoxemia is defined as room air arterial oxygen saturation < 90 percent
(assert
  (! (= patient_has_finding_of_hypoxemia_now
        (< patient_room_air_arterial_oxygen_saturation_value_now_in_percent 90.0))
     :named REQ5_AUXILIARY0)) ;; "hypoxemia (room air arterial oxygen saturation < 90 percent)"

;; Definition in the requirement: increased blood leukocyte number is defined as white blood cell count > 12,000 per cubic millimeter
(assert
  (! (= patient_has_finding_of_increased_blood_leukocyte_number_now
        (> patient_white_blood_cell_count_value_now_in_per_cubic_millimeter 12000.0))
     :named REQ5_AUXILIARY1)) ;; "elevated white blood cell count (white blood cell count > 12,000 per cubic millimeter)"

;; Definition in the requirement: neutropenia is defined as white blood cell count < 4,000 per cubic millimeter
(assert
  (! (= patient_has_finding_of_neutropenia_now
        (< patient_white_blood_cell_count_value_now_in_per_cubic_millimeter 4000.0))
     :named REQ5_AUXILIARY2)) ;; "neutropenia (white blood cell count < 4,000 per cubic millimeter)"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: At least one of the following must be true:
;; (hypoxemia) OR (clinical evidence of pulmonary consolidation) OR (elevated white blood cell count OR neutropenia)
(assert
  (! (or patient_has_finding_of_hypoxemia_now
         patient_has_finding_of_lung_consolidation_now
         patient_has_finding_of_increased_blood_leukocyte_number_now
         patient_has_finding_of_neutropenia_now)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "at least one other clinical or laboratory abnormality: (hypoxemia (room air arterial oxygen saturation < 90 percent)) OR (clinical evidence of pulmonary consolidation) OR (elevated white blood cell count or neutropenia (white blood cell count > 12,000 per cubic millimeter OR white blood cell count < 4,000 per cubic millimeter))"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_finding_of_multilobar_lung_infiltrate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a multilobar lung infiltrate.","when_to_set_to_false":"Set to false if the patient currently does not have a multilobar lung infiltrate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a multilobar lung infiltrate.","meaning":"Boolean indicating whether the patient currently has a multilobar lung infiltrate."} ;; "multi-lobar infiltrates"
(declare-const patient_has_finding_of_multilobar_lung_infiltrate_now@@new Bool) ;; {"when_to_set_to_true":"Set to true if the multilobar lung infiltrate is new (recently developed).","when_to_set_to_false":"Set to false if the multilobar lung infiltrate is not new (pre-existing or chronic).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the multilobar lung infiltrate is new.","meaning":"Boolean indicating whether the multilobar lung infiltrate is new."} ;; "new multi-lobar infiltrates"
(declare-const patient_has_finding_of_multilobar_lung_infiltrate_now@@identified_on_chest_radiograph Bool) ;; {"when_to_set_to_true":"Set to true if the multilobar lung infiltrate is identified on chest radiograph.","when_to_set_to_false":"Set to false if the multilobar lung infiltrate is not identified on chest radiograph.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the multilobar lung infiltrate is identified on chest radiograph.","meaning":"Boolean indicating whether the multilobar lung infiltrate is identified on chest radiograph."} ;; "multi-lobar infiltrates on chest radiograph"
(declare-const patient_has_finding_of_single_lobe_lung_infiltrate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a single-lobe lung infiltrate.","when_to_set_to_false":"Set to false if the patient currently does not have a single-lobe lung infiltrate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a single-lobe lung infiltrate.","meaning":"Boolean indicating whether the patient currently has a single-lobe lung infiltrate."} ;; "lobar infiltrates"
(declare-const patient_has_finding_of_single_lobe_lung_infiltrate_now@@new Bool) ;; {"when_to_set_to_true":"Set to true if the single-lobe lung infiltrate is new (recently developed).","when_to_set_to_false":"Set to false if the single-lobe lung infiltrate is not new (pre-existing or chronic).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the single-lobe lung infiltrate is new.","meaning":"Boolean indicating whether the single-lobe lung infiltrate is new."} ;; "new lobar infiltrates"
(declare-const patient_has_finding_of_single_lobe_lung_infiltrate_now@@identified_on_chest_radiograph Bool) ;; {"when_to_set_to_true":"Set to true if the single-lobe lung infiltrate is identified on chest radiograph.","when_to_set_to_false":"Set to false if the single-lobe lung infiltrate is not identified on chest radiograph.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the single-lobe lung infiltrate is identified on chest radiograph.","meaning":"Boolean indicating whether the single-lobe lung infiltrate is identified on chest radiograph."} ;; "lobar infiltrates on chest radiograph"
(declare-const patient_has_finding_of_single_lobe_lung_infiltrate_now@@identified_on_chest_radiograph@@new Bool) ;; {"when_to_set_to_true":"Set to true if the single-lobe lung infiltrate identified on chest radiograph is new (recently developed).","when_to_set_to_false":"Set to false if the single-lobe lung infiltrate identified on chest radiograph is not new (pre-existing or chronic).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the single-lobe lung infiltrate identified on chest radiograph is new.","meaning":"Boolean indicating whether the single-lobe lung infiltrate identified on chest radiograph is new."} ;; "new lobar infiltrates on chest radiograph"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_multilobar_lung_infiltrate_now@@new
         patient_has_finding_of_multilobar_lung_infiltrate_now)
     :named REQ6_AUXILIARY0)) ;; "new multi-lobar infiltrates"

(assert
  (! (=> patient_has_finding_of_multilobar_lung_infiltrate_now@@identified_on_chest_radiograph
         patient_has_finding_of_multilobar_lung_infiltrate_now)
     :named REQ6_AUXILIARY1)) ;; "multi-lobar infiltrates on chest radiograph"

(assert
  (! (=> patient_has_finding_of_single_lobe_lung_infiltrate_now@@new
         patient_has_finding_of_single_lobe_lung_infiltrate_now)
     :named REQ6_AUXILIARY2)) ;; "new lobar infiltrates"

(assert
  (! (=> patient_has_finding_of_single_lobe_lung_infiltrate_now@@identified_on_chest_radiograph
         patient_has_finding_of_single_lobe_lung_infiltrate_now)
     :named REQ6_AUXILIARY3)) ;; "lobar infiltrates on chest radiograph"

(assert
  (! (=> patient_has_finding_of_single_lobe_lung_infiltrate_now@@identified_on_chest_radiograph@@new
         (and patient_has_finding_of_single_lobe_lung_infiltrate_now@@identified_on_chest_radiograph
              patient_has_finding_of_single_lobe_lung_infiltrate_now@@new))
     :named REQ6_AUXILIARY4)) ;; "new lobar infiltrates on chest radiograph"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: To be included, the patient must have (new lobar infiltrates OR new multi-lobar infiltrates on chest radiograph).
(assert
  (! (or patient_has_finding_of_single_lobe_lung_infiltrate_now@@identified_on_chest_radiograph@@new
         (and patient_has_finding_of_multilobar_lung_infiltrate_now@@new
              patient_has_finding_of_multilobar_lung_infiltrate_now@@identified_on_chest_radiograph))
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (new lobar infiltrates OR new multi-lobar infiltrates on chest radiograph)."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const curb_65_risk_category_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's CURB-65 risk category score as recorded now, in units of score.","when_to_set_to_null":"Set to null if the patient's CURB-65 risk category score is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's CURB-65 risk category score recorded now, in units of score."} ;; "CURB-65 risk category ≥ 1 AND ≤ 4"
(declare-const patient_population_count_with_curb_65_risk_category_1_now Real) ;; {"when_to_set_to_value":"Set to the count of patients in the population at the current time whose CURB-65 risk category score is exactly 1.","when_to_set_to_null":"Set to null if the count of patients with CURB-65 risk category 1 is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of patients in the population at the current time whose CURB-65 risk category score is exactly 1."} ;; "Patients with CURB-65 risk category 1 will be limited to 20% of the total patient population."
(declare-const patient_population_total_count_now Real) ;; {"when_to_set_to_value":"Set to the total count of patients in the population at the current time.","when_to_set_to_null":"Set to null if the total patient population count is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total number of patients in the population at the current time."} ;; "total patient population"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: CURB-65 risk category ≥ 1
(assert
  (! (>= curb_65_risk_category_value_recorded_now_withunit_score 1.0)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "CURB-65 risk category ≥ 1"

;; Component 1: CURB-65 risk category ≤ 4
(assert
  (! (<= curb_65_risk_category_value_recorded_now_withunit_score 4.0)
     :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "CURB-65 risk category ≤ 4"

;; ===================== Constraint Assertion for population limit (REQ 7) =====================
;; Patients with CURB-65 risk category 1 will be limited to 20% of the total patient population.
(assert
  (! (<= patient_population_count_with_curb_65_risk_category_1_now
         (* 0.2 patient_population_total_count_now))
     :named REQ7_COMPONENT2_OTHER_REQUIREMENTS)) ;; "Patients with CURB-65 risk category 1 will be limited to 20% of the total patient population."
