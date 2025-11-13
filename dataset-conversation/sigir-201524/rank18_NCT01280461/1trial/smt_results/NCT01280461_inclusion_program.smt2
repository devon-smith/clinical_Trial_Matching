;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient's current sex is male."} // "male"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient's current sex is female."} // "female"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male or female."

(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_bacterial_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of bacterial pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of bacterial pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of bacterial pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of bacterial pneumonia."} // "bacterial pneumonia"
(declare-const patient_has_diagnosis_of_bacterial_pneumonia_now@@occurred_at_least_48_hours_after_hospitalization Bool) ;; {"when_to_set_to_true":"Set to true if the patient's bacterial pneumonia diagnosis occurred at least 48 hours after hospitalization.","when_to_set_to_false":"Set to false if the patient's bacterial pneumonia diagnosis did not occur at least 48 hours after hospitalization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the bacterial pneumonia diagnosis occurred at least 48 hours after hospitalization.","meaning":"Boolean indicating whether the bacterial pneumonia diagnosis occurred at least 48 hours after hospitalization."} // "nosocomial bacterial pneumonia (defined as pneumonia occurring at least 48 hours after hospitalization)"
(declare-const patient_has_diagnosis_of_healthcare_associated_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of healthcare-associated pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of healthcare-associated pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of healthcare-associated pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of healthcare-associated pneumonia."} // "healthcare-associated pneumonia"
(declare-const patient_has_diagnosis_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of pneumonia."} // "pneumonia"
(declare-const patient_has_diagnosis_of_pneumonia_now@@occurred_at_least_48_hours_after_hospitalization Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pneumonia diagnosis occurred at least 48 hours after hospitalization.","when_to_set_to_false":"Set to false if the patient's pneumonia diagnosis did not occur at least 48 hours after hospitalization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pneumonia diagnosis occurred at least 48 hours after hospitalization.","meaning":"Boolean indicating whether the pneumonia diagnosis occurred at least 48 hours after hospitalization."} // "pneumonia occurring at least 48 hours after hospitalization"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable (nosocomial bacterial pneumonia definition)
(assert
  (! (=> patient_has_diagnosis_of_bacterial_pneumonia_now@@occurred_at_least_48_hours_after_hospitalization
         patient_has_diagnosis_of_bacterial_pneumonia_now)
     :named REQ1_AUXILIARY0)) ;; "nosocomial bacterial pneumonia (defined as pneumonia occurring at least 48 hours after hospitalization)"

;; Qualifier variable implies corresponding stem variable (pneumonia definition)
(assert
  (! (=> patient_has_diagnosis_of_pneumonia_now@@occurred_at_least_48_hours_after_hospitalization
         patient_has_diagnosis_of_pneumonia_now)
     :named REQ1_AUXILIARY1)) ;; "pneumonia occurring at least 48 hours after hospitalization"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Inclusion: patient must have (nosocomial bacterial pneumonia, defined as pneumonia occurring at least 48 hours after hospitalization) OR healthcare-associated pneumonia
(assert
  (! (or patient_has_diagnosis_of_bacterial_pneumonia_now@@occurred_at_least_48_hours_after_hospitalization
         patient_has_diagnosis_of_healthcare_associated_pneumonia_now)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must (have nosocomial bacterial pneumonia (defined as pneumonia occurring at least 48 hours after hospitalization)) OR (have healthcare-associated pneumonia)."

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_axillary_temperature_value_recorded_now_withunit_degrees_celsius Real) ;; {"when_to_set_to_value":"Set to the measured value if a current axillary temperature (in degrees Celsius) is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current axillary temperature in degrees Celsius."} // "axillary temperature"
(declare-const patient_tympanic_temperature_value_recorded_now_withunit_degrees_celsius Real) ;; {"when_to_set_to_value":"Set to the measured value if a current tympanic temperature (in degrees Celsius) is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current tympanic temperature in degrees Celsius."} // "tympanic temperature"
(declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a cough.","when_to_set_to_false":"Set to false if the patient currently does not have a cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a cough.","meaning":"Boolean indicating whether the patient currently has a cough."} // "cough"
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a fever.","when_to_set_to_false":"Set to false if the patient currently does not have a fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a fever.","meaning":"Boolean indicating whether the patient currently has a fever."} // "fever"
(declare-const patient_has_finding_of_hypothermia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypothermia.","when_to_set_to_false":"Set to false if the patient currently does not have hypothermia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypothermia.","meaning":"Boolean indicating whether the patient currently has hypothermia."} // "hypothermia"
(declare-const patient_has_finding_of_purulent_sputum_production_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has purulent sputum production.","when_to_set_to_false":"Set to false if the patient currently does not have purulent sputum production.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has purulent sputum production.","meaning":"Boolean indicating whether the patient currently has purulent sputum production."} // "purulent sputum production"
(declare-const patient_is_exposed_to_respiratory_secretion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to or producing respiratory secretion.","when_to_set_to_false":"Set to false if the patient is not currently exposed to or producing respiratory secretion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to or producing respiratory secretion.","meaning":"Boolean indicating whether the patient is currently exposed to or producing respiratory secretion."} // "respiratory secretion"
(declare-const patient_is_exposed_to_respiratory_secretion_now@@purulent Bool) ;; {"when_to_set_to_true":"Set to true if the respiratory secretion is purulent.","when_to_set_to_false":"Set to false if the respiratory secretion is not purulent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the respiratory secretion is purulent.","meaning":"Boolean indicating whether the respiratory secretion is purulent."} // "purulent respiratory secretion"
(declare-const patient_white_blood_cell_count_value_recorded_now_withunit_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value if a current total peripheral white blood cell count (per cubic millimeter) is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current total peripheral white blood cell count (per cubic millimeter)."} // "total peripheral white blood cell count"
(declare-const patient_neutrophil_band_count_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if a current band form (neutrophil band) count percentage is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current band form (neutrophil band) count as a percentage."} // "band form count"
(declare-const patient_has_finding_of_decreased_blood_leukocyte_number_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has decreased total peripheral white blood cell count (leucopenia).","when_to_set_to_false":"Set to false if the patient currently does not have decreased total peripheral white blood cell count (leucopenia).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has decreased total peripheral white blood cell count (leucopenia).","meaning":"Boolean indicating whether the patient currently has decreased total peripheral white blood cell count (leucopenia)."} // "leucopenia"
(declare-const patient_has_finding_of_respiratory_crackles_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has rales (respiratory crackles) on pulmonary examination.","when_to_set_to_false":"Set to false if the patient currently does not have rales (respiratory crackles) on pulmonary examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has rales (respiratory crackles) on pulmonary examination.","meaning":"Boolean indicating whether the patient currently has rales (respiratory crackles) on pulmonary examination."} // "rales"
(declare-const patient_has_finding_of_lung_consolidation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of pulmonary consolidation on pulmonary examination.","when_to_set_to_false":"Set to false if the patient currently does not have evidence of pulmonary consolidation on pulmonary examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of pulmonary consolidation on pulmonary examination.","meaning":"Boolean indicating whether the patient currently has evidence of pulmonary consolidation on pulmonary examination."} // "pulmonary consolidation"
(declare-const patient_has_finding_of_hypoxemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypoxemia.","when_to_set_to_false":"Set to false if the patient currently does not have hypoxemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypoxemia.","meaning":"Boolean indicating whether the patient currently has hypoxemia."} // "hypoxemia"
(declare-const patient_partial_oxygen_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if a current partial oxygen pressure (in millimeters of mercury) is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current partial oxygen pressure in millimeters of mercury."} // "partial oxygen pressure now"
(declare-const patient_partial_oxygen_pressure_initial_value_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if an initial partial oxygen pressure (in millimeters of mercury) is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's initial partial oxygen pressure in millimeters of mercury."} // "partial oxygen pressure initial"

;; Additional variables for pulmonary consolidation subtypes
(declare-const patient_has_finding_of_dullness_on_percussion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dullness on percussion on pulmonary examination.","when_to_set_to_false":"Set to false if the patient currently does not have dullness on percussion on pulmonary examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dullness on percussion on pulmonary examination.","meaning":"Boolean indicating whether the patient currently has dullness on percussion on pulmonary examination."} // "dullness on percussion"
(declare-const patient_has_finding_of_bronchial_breath_sounds_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bronchial breath sounds on pulmonary examination.","when_to_set_to_false":"Set to false if the patient currently does not have bronchial breath sounds on pulmonary examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bronchial breath sounds on pulmonary examination.","meaning":"Boolean indicating whether the patient currently has bronchial breath sounds on pulmonary examination."} // "bronchial breath sounds"
(declare-const patient_has_finding_of_egophony_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has egophony on pulmonary examination.","when_to_set_to_false":"Set to false if the patient currently does not have egophony on pulmonary examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has egophony on pulmonary examination.","meaning":"Boolean indicating whether the patient currently has egophony on pulmonary examination."} // "egophony"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition of fever based on axillary or tympanic temperature
(assert
  (! (= patient_has_finding_of_fever_now
        (or (> patient_axillary_temperature_value_recorded_now_withunit_degrees_celsius 37.5)
            (> patient_tympanic_temperature_value_recorded_now_withunit_degrees_celsius 38.5)))
     :named REQ2_AUXILIARY0)) ;; "fever (defined as axillary temperature > 37.5°C OR tympanic temperature > 38.5°C)"

;; Definition of hypothermia based on axillary or tympanic temperature
(assert
  (! (= patient_has_finding_of_hypothermia_now
        (or (< patient_axillary_temperature_value_recorded_now_withunit_degrees_celsius 34.0)
            (< patient_tympanic_temperature_value_recorded_now_withunit_degrees_celsius 35.0)))
     :named REQ2_AUXILIARY1)) ;; "hypothermia (defined as axillary temperature < 34°C OR tympanic temperature < 35°C)"

;; Definition of purulent respiratory secretion
(assert
  (! (= patient_is_exposed_to_respiratory_secretion_now@@purulent
        (and patient_is_exposed_to_respiratory_secretion_now
             patient_is_exposed_to_respiratory_secretion_now@@purulent))
     :named REQ2_AUXILIARY2)) ;; "purulent respiratory secretion"

;; Definition of leucopenia based on WBC count
(assert
  (! (= patient_has_finding_of_decreased_blood_leukocyte_number_now
        (< patient_white_blood_cell_count_value_recorded_now_withunit_per_cubic_millimeter 4500.0))
     :named REQ2_AUXILIARY3)) ;; "leucopenia (defined as total peripheral white blood cell count < 4,500 per cubic millimeter)"

;; Definition of pulmonary consolidation based on subtypes
(assert
  (! (= patient_has_finding_of_lung_consolidation_now
        (or patient_has_finding_of_dullness_on_percussion_now
            patient_has_finding_of_bronchial_breath_sounds_now
            patient_has_finding_of_egophony_now))
     :named REQ2_AUXILIARY4)) ;; "pulmonary consolidation (defined as dullness on percussion OR bronchial breath sounds OR egophony)"

;; Definition of hypoxemia based on partial oxygen pressure
(assert
  (! (= patient_has_finding_of_hypoxemia_now
        (or (< patient_partial_oxygen_pressure_value_recorded_now_withunit_millimeters_of_mercury 60.0)
            (and (>= patient_partial_oxygen_pressure_initial_value_withunit_millimeters_of_mercury 0.0)
                 (<= patient_partial_oxygen_pressure_value_recorded_now_withunit_millimeters_of_mercury
                     (- patient_partial_oxygen_pressure_initial_value_withunit_millimeters_of_mercury
                        (* 0.25 patient_partial_oxygen_pressure_initial_value_withunit_millimeters_of_mercury))))))
     :named REQ2_AUXILIARY5)) ;; "hypoxemia (defined as partial oxygen pressure < 60 mmHg OR decrease ≥ 25% from initial value)"

;; Definition of purulent secretion finding (either purulent sputum or purulent respiratory secretion)
(define-fun patient_has_finding_of_purulent_secretion_now () Bool
  (or patient_has_finding_of_purulent_sputum_production_now
      patient_is_exposed_to_respiratory_secretion_now@@purulent)) ;; "purulent sputum production OR purulent respiratory secretion"

;; Definition of pulmonary consolidation finding (dullness, bronchial breath sounds, egophony)
(define-fun patient_has_finding_of_pulmonary_consolidation_now () Bool
  patient_has_finding_of_lung_consolidation_now) ;; "evidence of pulmonary consolidation"

;; Definition of band form count finding
(define-fun patient_has_finding_of_band_form_count_now () Bool
  (> patient_neutrophil_band_count_value_recorded_now_withunit_percent 15.0)) ;; "band form count > 15 percent"

;; Definition of total peripheral white blood cell count finding
(define-fun patient_has_finding_of_elevated_white_blood_cell_count_now () Bool
  (> patient_white_blood_cell_count_value_recorded_now_withunit_per_cubic_millimeter 10000.0)) ;; "total peripheral white blood cell count > 10,000 per cubic millimeter"

;; ===================== Constraint Assertions (REQ 2) =====================
;; At least two of the following clinical findings must be present:
;; (1) cough
;; (2) fever (axillary temp > 37.5°C OR tympanic temp > 38.5°C)
;; (3) hypothermia (axillary temp < 34°C OR tympanic temp < 35°C)
;; (4) purulent sputum production OR purulent respiratory secretion
;; (5) total peripheral white blood cell count > 10,000/mm3
;; (6) band form count > 15%
;; (7) leucopenia (WBC < 4,500/mm3)
;; (8) rales
;; (9) pulmonary consolidation (dullness, bronchial breath sounds, egophony)
;; (10) hypoxemia (PaO2 < 60 mmHg OR decrease ≥ 25% from initial value)

(define-fun REQ2_finding_count () Int
  (+ (ite patient_has_finding_of_cough_now 1 0)
     (ite patient_has_finding_of_fever_now 1 0)
     (ite patient_has_finding_of_hypothermia_now 1 0)
     (ite patient_has_finding_of_purulent_secretion_now 1 0)
     (ite patient_has_finding_of_elevated_white_blood_cell_count_now 1 0)
     (ite patient_has_finding_of_band_form_count_now 1 0)
     (ite patient_has_finding_of_decreased_blood_leukocyte_number_now 1 0)
     (ite patient_has_finding_of_respiratory_crackles_now 1 0)
     (ite patient_has_finding_of_pulmonary_consolidation_now 1 0)
     (ite patient_has_finding_of_hypoxemia_now 1 0)
  )
) ;; "at least two of the following clinical findings"

(assert
  (! (>= REQ2_finding_count 2)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have at least two of the following clinical findings"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_undergone_plain_chest_x_ray_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a plain chest X-ray now.","when_to_set_to_false":"Set to false if the patient has not undergone a plain chest X-ray now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a plain chest X-ray now.","meaning":"Boolean indicating whether the patient has undergone a plain chest X-ray now."} // "chest radiograph"
(declare-const patient_has_undergone_plain_chest_x_ray_now@@shows_presence_of_new_infiltration Bool) ;; {"when_to_set_to_true":"Set to true if the plain chest X-ray now shows the presence of a new infiltration.","when_to_set_to_false":"Set to false if the plain chest X-ray now does not show the presence of a new infiltration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the plain chest X-ray now shows the presence of a new infiltration.","meaning":"Boolean indicating whether the plain chest X-ray now shows the presence of a new infiltration."} // "chest radiograph finding showing the presence of a new infiltration"
(declare-const patient_has_undergone_plain_chest_x_ray_now@@shows_presence_of_progressive_infiltration_on_chest_x_ray_film Bool) ;; {"when_to_set_to_true":"Set to true if the plain chest X-ray now shows the presence of a progressive infiltration on the chest X-ray film.","when_to_set_to_false":"Set to false if the plain chest X-ray now does not show the presence of a progressive infiltration on the chest X-ray film.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the plain chest X-ray now shows the presence of a progressive infiltration on the chest X-ray film.","meaning":"Boolean indicating whether the plain chest X-ray now shows the presence of a progressive infiltration on the chest X-ray film."} // "chest radiograph finding showing the presence of a progressive infiltration on the chest X-ray film"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_undergone_plain_chest_x_ray_now@@shows_presence_of_new_infiltration
         patient_has_undergone_plain_chest_x_ray_now)
     :named REQ3_AUXILIARY0)) ;; "chest radiograph finding showing the presence of a new infiltration"

(assert
  (! (=> patient_has_undergone_plain_chest_x_ray_now@@shows_presence_of_progressive_infiltration_on_chest_x_ray_film
         patient_has_undergone_plain_chest_x_ray_now)
     :named REQ3_AUXILIARY1)) ;; "chest radiograph finding showing the presence of a progressive infiltration on the chest X-ray film"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (or patient_has_undergone_plain_chest_x_ray_now@@shows_presence_of_new_infiltration
         patient_has_undergone_plain_chest_x_ray_now@@shows_presence_of_progressive_infiltration_on_chest_x_ray_film)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (chest radiograph finding showing the presence of a new infiltration) OR (chest radiograph finding showing the presence of a progressive infiltration on the chest X-ray film)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_exposed_to_sputum_now Bool) ;; {"when_to_set_to_true":"Set to true if a sputum specimen is available and collected from the patient at the time of enrollment.","when_to_set_to_false":"Set to false if a sputum specimen is not available and not collected from the patient at the time of enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a sputum specimen is available and collected from the patient at the time of enrollment.","meaning":"Boolean indicating whether a sputum specimen is available and collected from the patient now."} // "if a sputum specimen is available and collected"
(declare-const patient_has_undergone_respiratory_microscopy_culture_and_sensitivities_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone culture and susceptibility testing of respiratory secretions at or within 24 hours prior to enrollment, to study drugs.","when_to_set_to_false":"Set to false if the patient has not undergone culture and susceptibility testing of respiratory secretions at or within 24 hours prior to enrollment, to study drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone culture and susceptibility testing of respiratory secretions at or within 24 hours prior to enrollment, to study drugs.","meaning":"Boolean indicating whether the patient has undergone culture and susceptibility testing of respiratory secretions now."} // "culture and susceptibility testing of respiratory secretions"
(declare-const patient_has_undergone_respiratory_microscopy_culture_and_sensitivities_now@@performed_to_study_drugs Bool) ;; {"when_to_set_to_true":"Set to true if the culture and susceptibility testing of respiratory secretions was performed to study drugs.","when_to_set_to_false":"Set to false if the culture and susceptibility testing of respiratory secretions was not performed to study drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the culture and susceptibility testing of respiratory secretions was performed to study drugs.","meaning":"Boolean indicating whether the culture and susceptibility testing of respiratory secretions was performed to study drugs."} // "to study drugs"
(declare-const patient_has_undergone_respiratory_microscopy_culture_and_sensitivities_now@@temporalcontext_within_24_hours_prior_to_or_at_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the culture and susceptibility testing of respiratory secretions was performed within 24 hours prior to or at the time of enrollment.","when_to_set_to_false":"Set to false if the culture and susceptibility testing of respiratory secretions was not performed within 24 hours prior to or at the time of enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the culture and susceptibility testing of respiratory secretions was performed within 24 hours prior to or at the time of enrollment.","meaning":"Boolean indicating whether the culture and susceptibility testing of respiratory secretions was performed within 24 hours prior to or at the time of enrollment."} // "within 24 hours prior to or at the time of enrollment"
(declare-const patient_has_undergone_microbial_culture_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone microbial culture at or within 24 hours prior to enrollment, to study drugs.","when_to_set_to_false":"Set to false if the patient has not undergone microbial culture at or within 24 hours prior to enrollment, to study drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone microbial culture at or within 24 hours prior to enrollment, to study drugs.","meaning":"Boolean indicating whether the patient has undergone microbial culture now."} // "culture of sputum"
(declare-const patient_has_undergone_microbial_culture_now@@of_sputum Bool) ;; {"when_to_set_to_true":"Set to true if the microbial culture was performed on sputum.","when_to_set_to_false":"Set to false if the microbial culture was not performed on sputum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the microbial culture was performed on sputum.","meaning":"Boolean indicating whether the microbial culture was performed on sputum."} // "of sputum"
(declare-const patient_has_undergone_microbial_culture_now@@performed_to_study_drugs Bool) ;; {"when_to_set_to_true":"Set to true if the microbial culture was performed to study drugs.","when_to_set_to_false":"Set to false if the microbial culture was not performed to study drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the microbial culture was performed to study drugs.","meaning":"Boolean indicating whether the microbial culture was performed to study drugs."} // "to study drugs"
(declare-const patient_has_undergone_microbial_culture_now@@temporalcontext_within_24_hours_prior_to_or_at_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the microbial culture was performed within 24 hours prior to or at the time of enrollment.","when_to_set_to_false":"Set to false if the microbial culture was not performed within 24 hours prior to or at the time of enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the microbial culture was performed within 24 hours prior to or at the time of enrollment.","meaning":"Boolean indicating whether the microbial culture was performed within 24 hours prior to or at the time of enrollment."} // "within 24 hours prior to or at the time of enrollment"
(declare-const patient_has_undergone_antimicrobial_susceptibility_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone antimicrobial susceptibility testing at or within 24 hours prior to enrollment, to study drugs.","when_to_set_to_false":"Set to false if the patient has not undergone antimicrobial susceptibility testing at or within 24 hours prior to enrollment, to study drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone antimicrobial susceptibility testing at or within 24 hours prior to enrollment, to study drugs.","meaning":"Boolean indicating whether the patient has undergone antimicrobial susceptibility testing now."} // "susceptibility testing of sputum"
(declare-const patient_has_undergone_antimicrobial_susceptibility_test_now@@of_sputum Bool) ;; {"when_to_set_to_true":"Set to true if the antimicrobial susceptibility testing was performed on sputum.","when_to_set_to_false":"Set to false if the antimicrobial susceptibility testing was not performed on sputum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antimicrobial susceptibility testing was performed on sputum.","meaning":"Boolean indicating whether the antimicrobial susceptibility testing was performed on sputum."} // "of sputum"
(declare-const patient_has_undergone_antimicrobial_susceptibility_test_now@@performed_to_study_drugs Bool) ;; {"when_to_set_to_true":"Set to true if the antimicrobial susceptibility testing was performed to study drugs.","when_to_set_to_false":"Set to false if the antimicrobial susceptibility testing was not performed to study drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antimicrobial susceptibility testing was performed to study drugs.","meaning":"Boolean indicating whether the antimicrobial susceptibility testing was performed to study drugs."} // "to study drugs"
(declare-const patient_has_undergone_antimicrobial_susceptibility_test_now@@temporalcontext_within_24_hours_prior_to_or_at_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the antimicrobial susceptibility testing was performed within 24 hours prior to or at the time of enrollment.","when_to_set_to_false":"Set to false if the antimicrobial susceptibility testing was not performed within 24 hours prior to or at the time of enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antimicrobial susceptibility testing was performed within 24 hours prior to or at the time of enrollment.","meaning":"Boolean indicating whether the antimicrobial susceptibility testing was performed within 24 hours prior to or at the time of enrollment."} // "within 24 hours prior to or at the time of enrollment"
(declare-const patient_has_undergone_gram_stain_method_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone Gram stain method of respiratory secretions now.","when_to_set_to_false":"Set to false if the patient has not undergone Gram stain method of respiratory secretions now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone Gram stain method of respiratory secretions now.","meaning":"Boolean indicating whether the patient has undergone Gram stain method now."} // "Gram stain of respiratory secretions"
(declare-const patient_has_undergone_gram_stain_method_now@@at_least_one_result_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if at least one result of the Gram stain method is positive.","when_to_set_to_false":"Set to false if none of the results of the Gram stain method are positive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether at least one result of the Gram stain method is positive.","meaning":"Boolean indicating whether at least one result of the Gram stain method is positive."} // "at least one of the results being positive"
(declare-const patient_has_undergone_identification_of_organism_on_gram_stain_of_sputum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone identification of organism on Gram stain of sputum now.","when_to_set_to_false":"Set to false if the patient has not undergone identification of organism on Gram stain of sputum now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone identification of organism on Gram stain of sputum now.","meaning":"Boolean indicating whether the patient has undergone identification of organism on Gram stain of sputum now."} // "Gram stain of sputum"
(declare-const patient_has_undergone_identification_of_organism_on_gram_stain_of_sputum_now@@at_least_one_result_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if at least one result of the identification of organism on Gram stain of sputum is positive.","when_to_set_to_false":"Set to false if none of the results of the identification of organism on Gram stain of sputum are positive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether at least one result of the identification of organism on Gram stain of sputum is positive.","meaning":"Boolean indicating whether at least one result of the identification of organism on Gram stain of sputum is positive."} // "at least one of the results being positive"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_undergone_microbial_culture_now@@of_sputum
         patient_has_undergone_microbial_culture_now)
     :named REQ4_AUXILIARY0)) ;; "microbial culture of sputum"

(assert
  (! (=> patient_has_undergone_microbial_culture_now@@performed_to_study_drugs
         patient_has_undergone_microbial_culture_now)
     :named REQ4_AUXILIARY1)) ;; "microbial culture performed to study drugs"

(assert
  (! (=> patient_has_undergone_microbial_culture_now@@temporalcontext_within_24_hours_prior_to_or_at_enrollment
         patient_has_undergone_microbial_culture_now)
     :named REQ4_AUXILIARY2)) ;; "microbial culture performed within 24 hours prior to or at the time of enrollment"

(assert
  (! (=> patient_has_undergone_antimicrobial_susceptibility_test_now@@of_sputum
         patient_has_undergone_antimicrobial_susceptibility_test_now)
     :named REQ4_AUXILIARY3)) ;; "antimicrobial susceptibility testing of sputum"

(assert
  (! (=> patient_has_undergone_antimicrobial_susceptibility_test_now@@performed_to_study_drugs
         patient_has_undergone_antimicrobial_susceptibility_test_now)
     :named REQ4_AUXILIARY4)) ;; "antimicrobial susceptibility testing performed to study drugs"

(assert
  (! (=> patient_has_undergone_antimicrobial_susceptibility_test_now@@temporalcontext_within_24_hours_prior_to_or_at_enrollment
         patient_has_undergone_antimicrobial_susceptibility_test_now)
     :named REQ4_AUXILIARY5)) ;; "antimicrobial susceptibility testing performed within 24 hours prior to or at the time of enrollment"

(assert
  (! (=> patient_has_undergone_respiratory_microscopy_culture_and_sensitivities_now@@performed_to_study_drugs
         patient_has_undergone_respiratory_microscopy_culture_and_sensitivities_now)
     :named REQ4_AUXILIARY6)) ;; "culture and susceptibility testing of respiratory secretions performed to study drugs"

(assert
  (! (=> patient_has_undergone_respiratory_microscopy_culture_and_sensitivities_now@@temporalcontext_within_24_hours_prior_to_or_at_enrollment
         patient_has_undergone_respiratory_microscopy_culture_and_sensitivities_now)
     :named REQ4_AUXILIARY7)) ;; "culture and susceptibility testing of respiratory secretions performed within 24 hours prior to or at the time of enrollment"

(assert
  (! (=> patient_has_undergone_gram_stain_method_now@@at_least_one_result_is_positive
         patient_has_undergone_gram_stain_method_now)
     :named REQ4_AUXILIARY8)) ;; "Gram stain method with at least one positive result"

(assert
  (! (=> patient_has_undergone_identification_of_organism_on_gram_stain_of_sputum_now@@at_least_one_result_is_positive
         patient_has_undergone_identification_of_organism_on_gram_stain_of_sputum_now)
     :named REQ4_AUXILIARY9)) ;; "Gram stain of sputum with at least one positive result"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: If sputum specimen is available and collected, must have (culture and susceptibility testing of respiratory secretions to study drugs within 24 hours prior to or at the time of enrollment OR culture and susceptibility testing of sputum to study drugs within 24 hours prior to or at the time of enrollment)
(assert
  (! (=> patient_is_exposed_to_sputum_now
         (or
           (and patient_has_undergone_respiratory_microscopy_culture_and_sensitivities_now
                patient_has_undergone_respiratory_microscopy_culture_and_sensitivities_now@@performed_to_study_drugs
                patient_has_undergone_respiratory_microscopy_culture_and_sensitivities_now@@temporalcontext_within_24_hours_prior_to_or_at_enrollment)
           (and patient_has_undergone_microbial_culture_now
                patient_has_undergone_microbial_culture_now@@of_sputum
                patient_has_undergone_microbial_culture_now@@performed_to_study_drugs
                patient_has_undergone_microbial_culture_now@@temporalcontext_within_24_hours_prior_to_or_at_enrollment)
           (and patient_has_undergone_antimicrobial_susceptibility_test_now
                patient_has_undergone_antimicrobial_susceptibility_test_now@@of_sputum
                patient_has_undergone_antimicrobial_susceptibility_test_now@@performed_to_study_drugs
                patient_has_undergone_antimicrobial_susceptibility_test_now@@temporalcontext_within_24_hours_prior_to_or_at_enrollment)
         ))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "culture and susceptibility testing of respiratory secretions or sputum to study drugs within 24 hours prior to or at the time of enrollment"

;; Component 1: If sputum specimen is available and collected, must have (Gram stain of respiratory secretions OR Gram stain of sputum) performed, with at least one of the results being positive.
(assert
  (! (=> patient_is_exposed_to_sputum_now
         (or
           patient_has_undergone_gram_stain_method_now@@at_least_one_result_is_positive
           patient_has_undergone_identification_of_organism_on_gram_stain_of_sputum_now@@at_least_one_result_is_positive
         ))
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "Gram stain of respiratory secretions or sputum performed, with at least one result positive"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_can_sign_written_informed_consent_form_prior_to_start_of_study_procedures Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to personally sign a written informed consent form prior to the start of study procedures.","when_to_set_to_false":"Set to false if the patient is not able to personally sign a written informed consent form prior to the start of study procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to personally sign a written informed consent form prior to the start of study procedures.","meaning":"Boolean indicating whether the patient is able to personally sign a written informed consent form before the start of study procedures."} // "be able to sign a written informed consent form prior to the start of the study procedures"
(declare-const legal_representative_has_signed_written_informed_consent_form_prior_to_start_of_study_procedures Bool) ;; {"when_to_set_to_true":"Set to true if the patient's legal representative has signed a written informed consent form prior to the start of study procedures because the patient is unable to give consent.","when_to_set_to_false":"Set to false if the patient's legal representative has not signed a written informed consent form prior to the start of study procedures when the patient is unable to give consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's legal representative has signed a written informed consent form prior to the start of study procedures when the patient is unable to give consent.","meaning":"Boolean indicating whether the patient's legal representative has signed a written informed consent form before the start of study procedures, in cases where the patient is unable to give consent."} // "written informed consent must be obtained from the patient's legal representative prior to the start of the study procedures"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: To be included, the patient must (be able to sign a written informed consent form prior to the start of the study procedures) OR (if the patient is unable to give consent, written informed consent must be obtained from the patient's legal representative prior to the start of the study procedures).
(assert
  (! (or patient_can_sign_written_informed_consent_form_prior_to_start_of_study_procedures
         legal_representative_has_signed_written_informed_consent_form_prior_to_start_of_study_procedures)
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must (be able to sign a written informed consent form prior to the start of the study procedures) OR (if the patient is unable to give consent, written informed consent must be obtained from the patient's legal representative prior to the start of the study procedures)."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_antibacterial_value_recorded_inthehistory_withunit_hours Real) ;; {"when_to_set_to_value":"Set to the total number of hours the patient has received a parenteral antibacterial drug for the current pneumonia episode prior to inclusion.","when_to_set_to_null":"Set to null if the total duration is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total hours of parenteral antibacterial drug exposure in the patient's history for the current pneumonia episode."} // "received more than 24 hours of a parenteral antibacterial drug for the current pneumonia"
(declare-const patient_antibacterial_value_recorded_inthehistory_withunit_hours@@for_current_pneumonia_episode Bool) ;; {"when_to_set_to_true":"Set to true if the recorded antibacterial drug exposure duration applies specifically to the current pneumonia episode.","when_to_set_to_false":"Set to false if the exposure duration does not apply to the current pneumonia episode.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure duration applies to the current pneumonia episode.","meaning":"Boolean indicating whether the antibacterial drug exposure duration is specific to the current pneumonia episode."} // "for the current pneumonia"
(declare-const patient_is_being_included_as_treatment_failure Bool) ;; {"when_to_set_to_true":"Set to true if the patient is being included in the study as a treatment failure for the current pneumonia episode.","when_to_set_to_false":"Set to false if the patient is not being included as a treatment failure for the current pneumonia episode.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is being included as a treatment failure for the current pneumonia episode.","meaning":"Boolean indicating whether the patient is being included as a treatment failure for the current pneumonia episode."} // "included as a treatment failure"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: To be included, the patient must NOT have received more than 24 hours of a parenteral antibacterial drug for the current pneumonia, UNLESS the patient has received more than 24 hours and is being included as a treatment failure.
(assert
  (! (or
        (and patient_antibacterial_value_recorded_inthehistory_withunit_hours@@for_current_pneumonia_episode
             (<= patient_antibacterial_value_recorded_inthehistory_withunit_hours 24.0))
        (and patient_antibacterial_value_recorded_inthehistory_withunit_hours@@for_current_pneumonia_episode
             (> patient_antibacterial_value_recorded_inthehistory_withunit_hours 24.0)
             patient_is_being_included_as_treatment_failure))
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have received more than 24 hours of a parenteral antibacterial drug for the current pneumonia, UNLESS the patient has received more than 24 hours and is being included as a treatment failure."
