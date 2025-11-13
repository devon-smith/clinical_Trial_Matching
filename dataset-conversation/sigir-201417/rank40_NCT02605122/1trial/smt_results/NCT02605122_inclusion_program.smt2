;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_fever_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of fever at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of fever.","meaning":"Boolean indicating whether the patient has a history of fever."}  ;; "have a history of fever"
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has documented fever.","when_to_set_to_false":"Set to false if the patient currently does not have documented fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has documented fever.","meaning":"Boolean indicating whether the patient currently has fever."}  ;; "have documented fever"
(declare-const patient_has_finding_of_hypothermia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has documented hypothermia.","when_to_set_to_false":"Set to false if the patient currently does not have documented hypothermia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has documented hypothermia.","meaning":"Boolean indicating whether the patient currently has hypothermia."}  ;; "have hypothermia"
(declare-const rectal_temperature_value_recorded_now_in_degrees_celsius Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's rectal temperature measured at the current time, in degrees Celsius.","when_to_set_to_null":"Set to null if the patient's rectal temperature at the current time is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's rectal temperature measured at the current time, in degrees Celsius."}  ;; "rectal temperature"
(declare-const ear_temperature_value_recorded_now_in_degrees_celsius Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's ear temperature measured at the current time, in degrees Celsius.","when_to_set_to_null":"Set to null if the patient's ear temperature at the current time is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's ear temperature measured at the current time, in degrees Celsius."}  ;; "ear temperature"
(declare-const oral_temperature_value_recorded_now_in_degrees_celsius Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's oral temperature measured at the current time, in degrees Celsius.","when_to_set_to_null":"Set to null if the patient's oral temperature at the current time is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's oral temperature measured at the current time, in degrees Celsius."}  ;; "oral temperature"
(declare-const axillary_temperature_value_recorded_now_in_degrees_celsius Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's axillary temperature measured at the current time, in degrees Celsius.","when_to_set_to_null":"Set to null if the patient's axillary temperature at the current time is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's axillary temperature measured at the current time, in degrees Celsius."}  ;; "axillary temperature"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Documented fever definition: rectal temp ≥ 38 OR ear temp ≥ 38 OR oral temp ≥ 38 OR axillary temp ≥ 37.5
(assert
  (! (= patient_has_finding_of_fever_now
        (or (>= rectal_temperature_value_recorded_now_in_degrees_celsius 38.0)
            (>= ear_temperature_value_recorded_now_in_degrees_celsius 38.0)
            (>= oral_temperature_value_recorded_now_in_degrees_celsius 38.0)
            (>= axillary_temperature_value_recorded_now_in_degrees_celsius 37.5)))
     :named REQ0_AUXILIARY0)) ;; "have documented fever (rectal temperature ≥ 38 degrees Celsius OR ear temperature ≥ 38 degrees Celsius OR oral temperature ≥ 38 degrees Celsius OR axillary temperature ≥ 37.5 degrees Celsius)"

;; Hypothermia definition: rectal temp < 35 OR ear temp < 35 OR oral temp < 35 OR axillary temp < 34.5
(assert
  (! (= patient_has_finding_of_hypothermia_now
        (or (< rectal_temperature_value_recorded_now_in_degrees_celsius 35.0)
            (< ear_temperature_value_recorded_now_in_degrees_celsius 35.0)
            (< oral_temperature_value_recorded_now_in_degrees_celsius 35.0)
            (< axillary_temperature_value_recorded_now_in_degrees_celsius 34.5)))
     :named REQ0_AUXILIARY1)) ;; "have hypothermia (rectal temperature < 35 degrees Celsius OR ear temperature < 35 degrees Celsius OR oral temperature < 35 degrees Celsius OR axillary temperature < 34.5 degrees Celsius)"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Inclusion: must have (history of fever) OR (documented fever) OR (hypothermia)
(assert
  (! (or patient_has_finding_of_fever_inthehistory
         patient_has_finding_of_fever_now
         patient_has_finding_of_hypothermia_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((have a history of fever) OR (have documented fever ...) OR (have hypothermia ...))."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_radiologic_infiltrate_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has radiologic infiltrate of the lung as seen on chest radiograph.","when_to_set_to_false":"Set to false if the patient currently does not have radiologic infiltrate of the lung as seen on chest radiograph.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has radiologic infiltrate of the lung as seen on chest radiograph.","meaning":"Boolean indicating whether the patient currently has radiologic infiltrate of the lung as seen on chest radiograph."}  ;; "have chest radiograph infiltrates"
(declare-const patient_has_finding_of_radiologic_infiltrate_of_lung_now@@consistent_with_bacterial_pneumonia Bool) ;; {"when_to_set_to_true":"Set to true if the radiologic infiltrate of the lung is consistent with bacterial pneumonia.","when_to_set_to_false":"Set to false if the radiologic infiltrate of the lung is not consistent with bacterial pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the radiologic infiltrate of the lung is consistent with bacterial pneumonia.","meaning":"Boolean indicating whether the radiologic infiltrate of the lung is consistent with bacterial pneumonia."}  ;; "chest radiograph infiltrates consistent with bacterial pneumonia"
(declare-const patient_has_finding_of_radiologic_infiltrate_of_lung_now@@consistent_with_pneumonia_caused_by_atypical_bacterial_agents Bool) ;; {"when_to_set_to_true":"Set to true if the radiologic infiltrate of the lung is consistent with pneumonia caused by atypical bacterial agents.","when_to_set_to_false":"Set to false if the radiologic infiltrate of the lung is not consistent with pneumonia caused by atypical bacterial agents.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the radiologic infiltrate of the lung is consistent with pneumonia caused by atypical bacterial agents.","meaning":"Boolean indicating whether the radiologic infiltrate of the lung is consistent with pneumonia caused by atypical bacterial agents."}  ;; "chest radiograph infiltrates consistent with pneumonia caused by atypical bacterial agents"
(declare-const patient_is_outpatient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently an outpatient.","when_to_set_to_false":"Set to false if the patient is currently not an outpatient (i.e., inpatient).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an outpatient.","meaning":"Boolean indicating whether the patient is currently an outpatient."}  ;; "the patient is outpatient"
(declare-const patient_is_starting_oral_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently starting oral therapy.","when_to_set_to_false":"Set to false if the patient is currently not starting oral therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently starting oral therapy.","meaning":"Boolean indicating whether the patient is currently starting oral therapy."}  ;; "the patient is starting on oral therapy"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply the stem variable (radiologic infiltrate of lung)
(assert
  (! (=> patient_has_finding_of_radiologic_infiltrate_of_lung_now@@consistent_with_bacterial_pneumonia
         patient_has_finding_of_radiologic_infiltrate_of_lung_now)
     :named REQ1_AUXILIARY0)) ;; "chest radiograph infiltrates consistent with bacterial pneumonia" implies "chest radiograph infiltrates"

(assert
  (! (=> patient_has_finding_of_radiologic_infiltrate_of_lung_now@@consistent_with_pneumonia_caused_by_atypical_bacterial_agents
         patient_has_finding_of_radiologic_infiltrate_of_lung_now)
     :named REQ1_AUXILIARY1)) ;; "chest radiograph infiltrates consistent with pneumonia caused by atypical bacterial agents" implies "chest radiograph infiltrates"

;; ===================== Constraint Assertions (REQ 1) =====================
;; To be included, the patient must ((have chest radiograph infiltrates consistent with bacterial pneumonia) OR (have chest radiograph infiltrates consistent with pneumonia caused by atypical bacterial agents) OR ((the patient is outpatient) AND (the patient is starting on oral therapy))).
(assert
  (! (or patient_has_finding_of_radiologic_infiltrate_of_lung_now@@consistent_with_bacterial_pneumonia
         patient_has_finding_of_radiologic_infiltrate_of_lung_now@@consistent_with_pneumonia_caused_by_atypical_bacterial_agents
         (and patient_is_outpatient_now patient_is_starting_oral_therapy_now))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((have chest radiograph infiltrates consistent with bacterial pneumonia) OR (have chest radiograph infiltrates consistent with pneumonia caused by atypical bacterial agents) OR ((the patient is outpatient) AND (the patient is starting on oral therapy)))."

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's current age in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in months."} ;; "age 2 months to < 24 months, age 24 months to < 10 years, age 2 months to < 12 months, age 12 months to < 5 years"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "age 2 months to < 24 months, age 24 months to < 10 years, age ≥ 10 years, age 2 months to < 12 months, age 12 months to < 5 years, age ≥ 5 years"
(declare-const patient_has_finding_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chest pain.","meaning":"Boolean indicating whether the patient currently has chest pain."} ;; "chest pain"
(declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cough.","when_to_set_to_false":"Set to false if the patient currently does not have cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cough.","meaning":"Boolean indicating whether the patient currently has cough."} ;; "cough"
(declare-const patient_has_finding_of_difficulty_breathing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has difficulty breathing.","when_to_set_to_false":"Set to false if the patient currently does not have difficulty breathing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has difficulty breathing.","meaning":"Boolean indicating whether the patient currently has difficulty breathing."} ;; "difficulty breathing"
(declare-const patient_has_finding_of_grunting_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has grunting.","when_to_set_to_false":"Set to false if the patient currently does not have grunting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has grunting.","meaning":"Boolean indicating whether the patient currently has grunting."} ;; "grunting"
(declare-const patient_has_finding_of_low_blood_pressure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypotension (low blood pressure).","when_to_set_to_false":"Set to false if the patient currently does not have hypotension (low blood pressure).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypotension (low blood pressure).","meaning":"Boolean indicating whether the patient currently has hypotension (low blood pressure)."} ;; "hypotension"
(declare-const patient_has_finding_of_pulmonary_consolidation_on_physical_examination_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has physical examination findings consistent with pulmonary consolidation.","when_to_set_to_false":"Set to false if the patient currently does not have physical examination findings consistent with pulmonary consolidation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has physical examination findings consistent with pulmonary consolidation.","meaning":"Boolean indicating whether the patient currently has physical examination findings consistent with pulmonary consolidation."} ;; "physical examination findings consistent with pulmonary consolidation"
(declare-const patient_has_finding_of_purulent_sputum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has production of purulent sputum.","when_to_set_to_false":"Set to false if the patient currently does not have production of purulent sputum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has production of purulent sputum.","meaning":"Boolean indicating whether the patient currently has production of purulent sputum."} ;; "purulent sputum"
(declare-const patient_has_finding_of_tachycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tachycardia.","when_to_set_to_false":"Set to false if the patient currently does not have tachycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tachycardia.","meaning":"Boolean indicating whether the patient currently has tachycardia."} ;; "tachycardia"
(declare-const patient_has_finding_of_tachypnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tachypnea.","when_to_set_to_false":"Set to false if the patient currently does not have tachypnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tachypnea.","meaning":"Boolean indicating whether the patient currently has tachypnea."} ;; "tachypnea"
(declare-const patient_heart_rate_value_recorded_now_withunit_beats_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's current heart rate in beats per minute is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current heart rate in beats per minute."} ;; "heart rate"
(declare-const patient_respiratory_rate_value_recorded_now_withunit_breaths_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's current respiratory rate in breaths per minute is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current respiratory rate in breaths per minute."} ;; "respiratory rate"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition of tachycardia by age group
(assert
  (! (= patient_has_finding_of_tachycardia_now
        (or
          (and (>= patient_age_value_recorded_now_in_months 2.0)
               (< patient_age_value_recorded_now_in_months 24.0)
               (>= patient_heart_rate_value_recorded_now_withunit_beats_per_minute 160.0))
          (and (>= patient_age_value_recorded_now_in_months 24.0)
               (< patient_age_value_recorded_now_in_years 10.0)
               (>= patient_heart_rate_value_recorded_now_withunit_beats_per_minute 140.0))
          (and (>= patient_age_value_recorded_now_in_years 10.0)
               (>= patient_heart_rate_value_recorded_now_withunit_beats_per_minute 100.0))))
     :named REQ2_AUXILIARY0)) ;; "tachycardia (defined as: age 2 months to < 24 months: heart rate ≥ 160 beats per minute OR age 24 months to < 10 years: heart rate ≥ 140 beats per minute OR age ≥ 10 years: heart rate ≥ 100 beats per minute)"

;; Definition of tachypnea by age group
(assert
  (! (= patient_has_finding_of_tachypnea_now
        (or
          (and (>= patient_age_value_recorded_now_in_months 2.0)
               (< patient_age_value_recorded_now_in_months 12.0)
               (>= patient_respiratory_rate_value_recorded_now_withunit_breaths_per_minute 50.0))
          (and (>= patient_age_value_recorded_now_in_months 12.0)
               (< patient_age_value_recorded_now_in_years 5.0)
               (>= patient_respiratory_rate_value_recorded_now_withunit_breaths_per_minute 40.0))
          (and (>= patient_age_value_recorded_now_in_years 5.0)
               (>= patient_respiratory_rate_value_recorded_now_withunit_breaths_per_minute 20.0))))
     :named REQ2_AUXILIARY1)) ;; "tachypnea (defined as: age 2 months to < 12 months: respiratory rate ≥ 50 breaths per minute OR age 12 months to < 5 years: respiratory rate ≥ 40 breaths per minute OR age ≥ 5 years: respiratory rate ≥ 20 breaths per minute)"

;; Count of qualifying findings
(define-fun qualifying_findings_count () Int
  (+ (ite patient_has_finding_of_cough_now 1 0)
     (ite patient_has_finding_of_difficulty_breathing_now 1 0)
     (ite patient_has_finding_of_purulent_sputum_now 1 0)
     (ite patient_has_finding_of_chest_pain_now 1 0)
     (ite patient_has_finding_of_grunting_now 1 0)
     (ite patient_has_finding_of_low_blood_pressure_now 1 0)
     (ite patient_has_finding_of_tachycardia_now 1 0)
     (ite patient_has_finding_of_tachypnea_now 1 0)
     (ite patient_has_finding_of_pulmonary_consolidation_on_physical_examination_now 1 0))) ;; "at least 2 of the following (cough OR difficulty breathing OR production of purulent sputum OR chest pain OR grunting OR hypotension OR tachycardia OR tachypnea OR physical examination findings consistent with pulmonary consolidation)"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= qualifying_findings_count 2)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (at least 2 of the following ...)"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_leukocytosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of leukocytosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of leukocytosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has leukocytosis.","meaning":"Boolean indicating whether the patient currently has leukocytosis."} ;; "leukocytosis (white blood cell count ≥ 12,000 per cubic millimeter)"
(declare-const patient_has_finding_of_leukopenia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of leukopenia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of leukopenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has leukopenia.","meaning":"Boolean indicating whether the patient currently has leukopenia."} ;; "leukopenia (white blood cell count < 5,000 per cubic millimeter)"
(declare-const patient_white_blood_cell_count_value_recorded_now_withunit_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's white blood cell count per cubic millimeter recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current white blood cell count per cubic millimeter."} ;; "white blood cell count"
(declare-const patient_immature_neutrophil_bands_percentage_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's percentage of immature neutrophil bands recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current percentage of immature neutrophil bands as measured now, in percent."} ;; "≥ 10 percent immature neutrophils (bands)"
(declare-const patient_has_finding_of_elevated_inflammatory_markers_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has elevated inflammatory markers.","when_to_set_to_false":"Set to false if the patient currently does not have elevated inflammatory markers.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has elevated inflammatory markers.","meaning":"Boolean indicating whether the patient currently has elevated inflammatory markers."} ;; "elevated inflammatory markers (C-reactive protein OR procalcitonin)"
(declare-const patient_has_finding_of_elevated_inflammatory_markers_now@@measured_by_c_reactive_protein_or_procalcitonin Bool) ;; {"when_to_set_to_true":"Set to true if the patient's elevated inflammatory markers are determined by measurement of C-reactive protein or procalcitonin.","when_to_set_to_false":"Set to false if the patient's elevated inflammatory markers are not determined by measurement of C-reactive protein or procalcitonin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's elevated inflammatory markers are determined by measurement of C-reactive protein or procalcitonin.","meaning":"Boolean indicating whether the patient's elevated inflammatory markers are determined by measurement of C-reactive protein or procalcitonin."} ;; "elevated inflammatory markers (C-reactive protein OR procalcitonin)"
(declare-const patient_c_reactive_protein_value_recorded_now_withunit_mg_per_l Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's C-reactive protein level recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current C-reactive protein level as measured now, in milligrams per liter."} ;; "C-reactive protein"
(declare-const patient_procalcitonin_value_recorded_now_withunit_ng_per_ml Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's procalcitonin level recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current procalcitonin level as measured now, in nanograms per milliliter."} ;; "procalcitonin"
(declare-const patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's hemoglobin saturation with oxygen (oxygen saturation) as a percentage recorded now is available and measured on room air.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current hemoglobin saturation with oxygen (oxygen saturation) as a percentage."} ;; "oxygen saturation < 97 percent on room air"
(declare-const patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_on_room_air Bool) ;; {"when_to_set_to_true":"Set to true if the oxygen saturation measurement was performed on room air.","when_to_set_to_false":"Set to false if the oxygen saturation measurement was not performed on room air.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the oxygen saturation measurement was performed on room air.","meaning":"Boolean indicating whether the oxygen saturation measurement was performed on room air."} ;; "oxygen saturation < 97 percent on room air"
(declare-const patient_has_identification_of_typical_respiratory_pathogen_now Bool) ;; {"when_to_set_to_true":"Set to true if an organism consistent with a typical respiratory pathogen has been identified in the patient currently.","when_to_set_to_false":"Set to false if no organism consistent with a typical respiratory pathogen has been identified in the patient currently.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether an organism consistent with a typical respiratory pathogen has been identified in the patient currently.","meaning":"Boolean indicating whether an organism consistent with a typical respiratory pathogen has been identified in the patient currently."} ;; "identification of an organism consistent with a typical respiratory pathogen"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition: leukocytosis is white blood cell count ≥ 12,000 per cubic millimeter
(assert
  (! (= patient_has_finding_of_leukocytosis_now
        (>= patient_white_blood_cell_count_value_recorded_now_withunit_per_cubic_millimeter 12000))
     :named REQ3_AUXILIARY0)) ;; "leukocytosis (white blood cell count ≥ 12,000 per cubic millimeter)"

;; Definition: leukopenia is white blood cell count < 5,000 per cubic millimeter
(assert
  (! (= patient_has_finding_of_leukopenia_now
        (< patient_white_blood_cell_count_value_recorded_now_withunit_per_cubic_millimeter 5000))
     :named REQ3_AUXILIARY1)) ;; "leukopenia (white blood cell count < 5,000 per cubic millimeter)"

;; Definition: elevated inflammatory markers measured by C-reactive protein or procalcitonin implies elevated inflammatory markers
(assert
  (! (=> patient_has_finding_of_elevated_inflammatory_markers_now@@measured_by_c_reactive_protein_or_procalcitonin
         patient_has_finding_of_elevated_inflammatory_markers_now)
     :named REQ3_AUXILIARY2)) ;; "elevated inflammatory markers (C-reactive protein OR procalcitonin)"

;; Definition: oxygen saturation < 97 percent on room air
(define-fun patient_has_finding_of_oxygen_saturation_below_97_percent_on_room_air_now () Bool
  (and patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_on_room_air
       (< patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent 97.0))) ;; "oxygen saturation < 97 percent on room air"

;; Definition: ≥ 10 percent immature neutrophils (bands) regardless of total peripheral white blood cell count
(define-fun patient_has_finding_of_immature_neutrophil_bands_at_least_10_percent_now () Bool
  (>= patient_immature_neutrophil_bands_percentage_value_recorded_now_withunit_percent 10.0)) ;; "≥ 10 percent immature neutrophils (bands)"

;; ===================== Constraint Assertions (REQ 3) =====================
;; At least 1 of the following must be true:
;; - leukocytosis (white blood cell count ≥ 12,000 per cubic millimeter)
;; - leukopenia (white blood cell count < 5,000 per cubic millimeter)
;; - ≥ 10 percent immature neutrophils (bands) regardless of total peripheral white blood cell count
;; - elevated inflammatory markers (C-reactive protein OR procalcitonin)
;; - oxygen saturation < 97 percent on room air
;; - identification of an organism consistent with a typical respiratory pathogen

(assert
  (! (or patient_has_finding_of_leukocytosis_now
         patient_has_finding_of_leukopenia_now
         patient_has_finding_of_immature_neutrophil_bands_at_least_10_percent_now
         patient_has_finding_of_elevated_inflammatory_markers_now
         patient_has_finding_of_oxygen_saturation_below_97_percent_on_room_air_now
         patient_has_identification_of_typical_respiratory_pathogen_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "at least 1 of the following (leukocytosis OR leukopenia OR ≥ 10 percent immature neutrophils (bands) OR elevated inflammatory markers (C-reactive protein OR procalcitonin) OR oxygen saturation < 97 percent on room air OR identification of an organism consistent with a typical respiratory pathogen)"
