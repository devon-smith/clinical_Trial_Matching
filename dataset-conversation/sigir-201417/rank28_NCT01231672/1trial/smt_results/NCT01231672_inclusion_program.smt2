;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_received_information_notice Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received the information notice.","when_to_set_to_false":"Set to false if the patient has not received the information notice.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received the information notice.","meaning":"Boolean indicating whether the patient has received the information notice."}  ;; "the patient must have received the information notice"
(declare-const representative_of_patient_has_received_information_notice Bool) ;; {"when_to_set_to_true":"Set to true if the representative of the patient has received the information notice.","when_to_set_to_false":"Set to false if the representative of the patient has not received the information notice.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the representative of the patient has received the information notice.","meaning":"Boolean indicating whether the representative of the patient has received the information notice."}  ;; "the representative of the patient must have received the information notice"

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient OR the representative must have received the information notice
(assert
  (! (or patient_has_received_information_notice
         representative_of_patient_has_received_information_notice)
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have received the information notice OR the representative of the patient must have received the information notice"

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_hemodynamic_instability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hemodynamic instability.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hemodynamic instability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hemodynamic instability.","meaning":"Boolean indicating whether the patient currently has hemodynamic instability."}  ;; "hemodynamic insufficiency"
(declare-const patient_has_finding_of_hemodynamic_instability_now@@non_traumatic_origin Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hemodynamic instability of non-traumatic origin.","when_to_set_to_false":"Set to false if the patient currently does not have hemodynamic instability of non-traumatic origin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hemodynamic instability of non-traumatic origin.","meaning":"Boolean indicating whether the patient currently has hemodynamic instability of non-traumatic origin."}  ;; "hemodynamic insufficiency of non-traumatic origin"
(declare-const patient_has_finding_of_hemodynamic_instability_now@@cardiogenic_origin Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hemodynamic instability of cardiogenic origin.","when_to_set_to_false":"Set to false if the patient currently does not have hemodynamic instability of cardiogenic origin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hemodynamic instability of cardiogenic origin.","meaning":"Boolean indicating whether the patient currently has hemodynamic instability of cardiogenic origin."}  ;; "hemodynamic insufficiency of cardiogenic origin"
(declare-const patient_has_finding_of_sepsis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of sepsis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of sepsis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of sepsis.","meaning":"Boolean indicating whether the patient currently has sepsis."}  ;; "severe sepsis"
(declare-const patient_has_finding_of_sepsis_now@@treated_with_noradrenaline Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sepsis is currently treated with noradrenaline.","when_to_set_to_false":"Set to false if the patient's sepsis is currently not treated with noradrenaline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's sepsis is treated with noradrenaline.","meaning":"Boolean indicating whether the patient's sepsis is treated with noradrenaline."}  ;; "severe sepsis (treated with noradrenaline)"
(declare-const patient_has_finding_of_organ_dysfunction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has organ dysfunction.","when_to_set_to_false":"Set to false if the patient currently does not have organ dysfunction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has organ dysfunction.","meaning":"Boolean indicating whether the patient currently has organ dysfunction."}  ;; "organ dysfunction"
(declare-const patient_has_finding_of_ineffective_tissue_perfusion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of ineffective tissue perfusion.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of ineffective tissue perfusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of ineffective tissue perfusion.","meaning":"Boolean indicating whether the patient currently has ineffective tissue perfusion."}  ;; "hypoperfusion"
(declare-const patient_has_finding_of_low_blood_pressure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of low blood pressure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of low blood pressure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of low blood pressure.","meaning":"Boolean indicating whether the patient currently has low blood pressure."}  ;; "hypotension"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_hemodynamic_instability_now@@non_traumatic_origin
         patient_has_finding_of_hemodynamic_instability_now)
     :named REQ1_AUXILIARY0)) ;; "hemodynamic insufficiency of non-traumatic origin"

(assert
  (! (=> patient_has_finding_of_hemodynamic_instability_now@@cardiogenic_origin
         patient_has_finding_of_hemodynamic_instability_now)
     :named REQ1_AUXILIARY1)) ;; "hemodynamic insufficiency of cardiogenic origin"

(assert
  (! (=> patient_has_finding_of_sepsis_now@@treated_with_noradrenaline
         patient_has_finding_of_sepsis_now)
     :named REQ1_AUXILIARY2)) ;; "severe sepsis (treated with noradrenaline)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; To be included, the patient must have (hemodynamic insufficiency of non-traumatic origin)
;; OR ((hemodynamic insufficiency of cardiogenic origin) AND (severe sepsis (treated with noradrenaline)) AND (organ dysfunction OR hypoperfusion OR hypotension)).
(assert
  (! (or
        patient_has_finding_of_hemodynamic_instability_now@@non_traumatic_origin
        (and
          patient_has_finding_of_hemodynamic_instability_now@@cardiogenic_origin
          patient_has_finding_of_sepsis_now@@treated_with_noradrenaline
          (or patient_has_finding_of_organ_dysfunction_now
              patient_has_finding_of_ineffective_tissue_perfusion_now
              patient_has_finding_of_low_blood_pressure_now)))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (hemodynamic insufficiency of non-traumatic origin) OR ((hemodynamic insufficiency of cardiogenic origin) AND (severe sepsis (treated with noradrenaline)) AND (organ dysfunction OR hypoperfusion OR hypotension))."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_body_temperature_value_recorded_now_withunit_degrees_celsius Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body temperature in degrees Celsius is recorded now.","when_to_set_to_null":"Set to null if no body temperature measurement in degrees Celsius is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's body temperature measured now in degrees Celsius."}  ;; "body temperature > 38.3 degrees Celsius" or "body temperature < 36 degrees Celsius"

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must have (body temperature > 38.3 degrees Celsius) OR (body temperature < 36 degrees Celsius).
(assert
  (! (or (> patient_body_temperature_value_recorded_now_withunit_degrees_celsius 38.3)
         (< patient_body_temperature_value_recorded_now_withunit_degrees_celsius 36.0))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (body temperature > 38.3 degrees Celsius) OR (body temperature < 36 degrees Celsius)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_heart_rate_value_recorded_now_withunit_beats_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's heart rate in beats per minute is recorded now.","when_to_set_to_null":"Set to null if no heart rate measurement in beats per minute is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's current heart rate in beats per minute."}  ;; "heart rate > 90 beats per minute"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (> patient_heart_rate_value_recorded_now_withunit_beats_per_minute 90.0)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have heart rate > 90 beats per minute."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_tachypnea_value_recorded_now_withunit_cycles_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current respiratory rate (cycles per minute) is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current respiratory rate in cycles per minute."}  ;; "tachypnea > 20 cycles per minute"
(declare-const patient_finding_of_arterial_partial_pressure_of_carbon_dioxide_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current arterial partial pressure of carbon dioxide (PaCO2) in millimeters of mercury is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current arterial partial pressure of carbon dioxide in millimeters of mercury."}  ;; "partial pressure of carbon dioxide in arterial blood < 32 millimeters of mercury"
(declare-const patient_is_undergoing_artificial_respiration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing mechanical ventilation.","when_to_set_to_false":"Set to false if the patient is currently not undergoing mechanical ventilation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing mechanical ventilation.","meaning":"Boolean indicating whether the patient is currently undergoing mechanical ventilation."}  ;; "be on mechanical ventilation"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: To be included, the patient must have (tachypnea > 20 cycles per minute) OR (partial pressure of carbon dioxide in arterial blood < 32 millimeters of mercury) OR (be on mechanical ventilation).
(assert
  (! (or
        (> patient_tachypnea_value_recorded_now_withunit_cycles_per_minute 20)
        (< patient_finding_of_arterial_partial_pressure_of_carbon_dioxide_value_recorded_now_withunit_millimeters_of_mercury 32)
        patient_is_undergoing_artificial_respiration_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_white_blood_cell_count_value_recorded_now_withunit_per_microliter Real) ;; {"when_to_set_to_value":"Set to the measured value if a current leukocyte (white blood cell) count per microliter is available for the patient.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current white blood cell (leukocyte) count per microliter."}  ;; "leukocyte count > 12,000 per microliter" or "leukocyte count < 4,000 per microliter"
(declare-const patient_immature_white_blood_cells_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if a current percentage of immature leukocyte forms is available for the patient.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current percentage of immature leukocyte forms."}  ;; "immature leukocyte forms > 10 percent"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: To be included, the patient must have (leukocyte count > 12,000 per microliter) OR (leukocyte count < 4,000 per microliter) OR (immature leukocyte forms > 10 percent).
(assert
  (! (or
        (> patient_white_blood_cell_count_value_recorded_now_withunit_per_microliter 12000.0)
        (< patient_white_blood_cell_count_value_recorded_now_withunit_per_microliter 4000.0)
        (> patient_immature_white_blood_cells_value_recorded_now_withunit_percent 10.0))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (leukocyte count > 12,000 per microliter) OR (leukocyte count < 4,000 per microliter) OR (immature leukocyte forms > 10 percent)."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_oliguria_value_recorded_inthepast2hours_withunit_milliliters_per_kilogram_per_hour Real) ;; {"when_to_set_to_value":"Set to the measured urine output rate in milliliters per kilogram per hour if a numeric measurement recorded over the past 2 hours is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's urine output rate in milliliters per kilogram per hour over the past 2 hours."}  ;; "oliguria < 0.5 milliliters per kilogram per hour for at least 2 hours"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (< patient_oliguria_value_recorded_inthepast2hours_withunit_milliliters_per_kilogram_per_hour 0.5)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "oliguria < 0.5 milliliters per kilogram per hour for at least 2 hours"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_finding_of_disturbance_of_consciousness_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a disturbance of consciousness within the past 24 hours.","when_to_set_to_false":"Set to false if the patient has not had a disturbance of consciousness within the past 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a disturbance of consciousness within the past 24 hours.","meaning":"Boolean indicating whether the patient has had a disturbance of consciousness within the past 24 hours."}  ;; "alteration of consciousness within 24 hours"
(declare-const patient_has_finding_of_disturbance_of_consciousness_inthepast24hours@@abrupt_onset Bool) ;; {"when_to_set_to_true":"Set to true if the disturbance of consciousness within the past 24 hours was abrupt in onset.","when_to_set_to_false":"Set to false if the disturbance of consciousness within the past 24 hours was not abrupt in onset.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disturbance of consciousness within the past 24 hours was abrupt in onset.","meaning":"Boolean indicating whether the disturbance of consciousness within the past 24 hours was abrupt in onset."}  ;; "abrupt alteration of consciousness within 24 hours"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_disturbance_of_consciousness_inthepast24hours@@abrupt_onset
         patient_has_finding_of_disturbance_of_consciousness_inthepast24hours)
     :named REQ7_AUXILIARY0)) ;; "abrupt alteration of consciousness within 24 hours"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: To be included, the patient must have abrupt alteration of consciousness within 24 hours.
(assert
  (! (and patient_has_finding_of_disturbance_of_consciousness_inthepast24hours
          patient_has_finding_of_disturbance_of_consciousness_inthepast24hours@@abrupt_onset)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "abrupt alteration of consciousness within 24 hours"

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_has_finding_of_disseminated_intravascular_coagulation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of disseminated intravascular coagulation.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of disseminated intravascular coagulation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of disseminated intravascular coagulation.","meaning":"Boolean indicating whether the patient currently has disseminated intravascular coagulation."}  ;; "disseminated intravascular coagulation"
(declare-const patient_has_finding_of_thrombocytopenic_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of thrombocytopenia (a thrombocytopenic disorder).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of thrombocytopenia (a thrombocytopenic disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of thrombocytopenia (a thrombocytopenic disorder).","meaning":"Boolean indicating whether the patient currently has thrombocytopenia (a thrombocytopenic disorder)."}  ;; "thrombocytopenia"
(declare-const platelet_count_value_recorded_now_withunit_per_liter Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current platelet count measured in number per liter if available.","when_to_set_to_null":"Set to null if the patient's current platelet count is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current platelet count measured in number per liter."}  ;; "thrombocytopenia < 100,000 per liter"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Definition: thrombocytopenia < 100,000 per liter
(assert
  (! (= patient_has_finding_of_thrombocytopenic_disorder_now
        (< platelet_count_value_recorded_now_withunit_per_liter 100000.0))
     :named REQ8_AUXILIARY0)) ;; "thrombocytopenia < 100,000 per liter"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Component 0: To be included, the patient must have (thrombocytopenia < 100,000 per liter) OR (disseminated intravascular coagulation).
(assert
  (! (or patient_has_finding_of_thrombocytopenic_disorder_now
         patient_has_finding_of_disseminated_intravascular_coagulation_now)
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (thrombocytopenia < 100,000 per liter) OR (disseminated intravascular coagulation)."

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_capillary_filling_value_recorded_now_withunit_seconds Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of capillary refill time in seconds recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current capillary refill time in seconds."}  ;; "capillary refill time > 3 seconds"
(declare-const patient_has_finding_of_mottling_of_skin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of mottling of the skin.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of mottling of the skin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has mottling of the skin.","meaning":"Boolean indicating whether the patient currently has mottling of the skin."}  ;; "mottled skin"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (or patient_has_finding_of_mottling_of_skin_now
         (> patient_capillary_filling_value_recorded_now_withunit_seconds 3.0))
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (mottled skin) OR (capillary refill time > 3 seconds)."

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_ratio_of_arterial_oxygen_tension_to_inspired_oxygen_fraction_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current ratio of partial pressure of oxygen in arterial blood to fraction of inspired oxygen is recorded in millimeters of mercury.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current PaO2/FiO2 ratio in mmHg."}  ;; "ratio of partial pressure of oxygen in arterial blood to fraction of inspired oxygen < 300 millimeters of mercury"
(declare-const patient_ratio_of_arterial_oxygen_tension_to_inspired_oxygen_fraction_value_recorded_now_withunit_kilopascals Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current ratio of partial pressure of oxygen in arterial blood to fraction of inspired oxygen is recorded in kilopascals.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current PaO2/FiO2 ratio in kPa."}  ;; "ratio of partial pressure of oxygen in arterial blood to fraction of inspired oxygen < 40 kilopascals"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Component 0: To be included, the patient must have ((ratio of partial pressure of oxygen in arterial blood to fraction of inspired oxygen < 300 millimeters of mercury) OR (ratio of partial pressure of oxygen in arterial blood to fraction of inspired oxygen < 40 kilopascals)).
(assert
  (! (or (< patient_ratio_of_arterial_oxygen_tension_to_inspired_oxygen_fraction_value_recorded_now_withunit_millimeters_of_mercury 300.0)
         (< patient_ratio_of_arterial_oxygen_tension_to_inspired_oxygen_fraction_value_recorded_now_withunit_kilopascals 40.0))
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "ratio of partial pressure of oxygen in arterial blood to fraction of inspired oxygen < 300 millimeters of mercury OR < 40 kilopascals"

;; ===================== Declarations for the criterion (REQ 11) =====================
(declare-const patient_increased_lactic_acid_level_value_recorded_now_withunit_millimoles_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current lactic acid (lactate) concentration in blood is recorded in millimoles per liter.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current lactic acid (lactate) concentration in blood, measured in millimoles per liter."}  ;; "lactatemia > 2 millimoles per liter"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! (> patient_increased_lactic_acid_level_value_recorded_now_withunit_millimoles_per_liter 2.0)
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (lactatemia > 2 millimoles per liter)."

;; ===================== Declarations for the criterion (REQ 12) =====================
(declare-const patient_has_finding_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hypertension.","meaning":"Boolean indicating whether the patient currently has hypertension."}  ;; "in the patient with hypertension"
(declare-const patient_has_finding_of_septic_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of septic shock.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of septic shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of septic shock.","meaning":"Boolean indicating whether the patient currently has septic shock."}  ;; "septic shock"
(declare-const patient_has_received_macromolecule_fluid_volume_value_prior_withunit_milliliters_per_kilogram Real) ;; {"when_to_set_to_value":"Set to the total volume of macromolecule fluids administered to the patient prior to vasopressor therapy, in milliliters per kilogram, if available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the total volume of macromolecule fluids administered to the patient prior to vasopressor therapy, in milliliters per kilogram."}  ;; "20-30 milliliters per kilogram of macromolecules"
(declare-const patient_has_received_normal_saline_volume_value_prior_withunit_milliliters_per_kilogram Real) ;; {"when_to_set_to_value":"Set to the total volume of normal saline administered to the patient prior to vasopressor therapy, in milliliters per kilogram, if available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the total volume of normal saline administered to the patient prior to vasopressor therapy, in milliliters per kilogram."}  ;; "40-60 milliliters per kilogram of normal saline"
(declare-const patient_is_exposed_to_sodium_chloride_solution_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being administered or has been administered normal saline (sodium chloride solution).","when_to_set_to_false":"Set to false if the patient is not currently being administered and has not been administered normal saline (sodium chloride solution).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being administered or has been administered normal saline (sodium chloride solution).","meaning":"Boolean indicating whether the patient is currently being administered or has been administered normal saline (sodium chloride solution)."}  ;; "normal saline"
(declare-const patient_is_receiving_vasopressor_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving vasopressor therapy.","when_to_set_to_false":"Set to false if the patient is not currently receiving vasopressor therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving vasopressor therapy.","meaning":"Boolean indicating whether the patient is currently receiving vasopressor therapy."}  ;; "need for vasopressors"
(declare-const patient_is_receiving_vasopressor_therapy_now@@to_maintain_systolic_blood_pressure_above_90_millimeters_of_mercury_despite_prior_filling Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving vasopressor therapy specifically to maintain systolic blood pressure above 90 millimeters of mercury despite prior filling with fluids.","when_to_set_to_false":"Set to false if the patient is currently receiving vasopressor therapy but not for this reason, or is not receiving vasopressor therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving vasopressor therapy specifically to maintain systolic blood pressure above 90 millimeters of mercury despite prior filling with fluids.","meaning":"Boolean indicating whether the patient is currently receiving vasopressor therapy specifically to maintain systolic blood pressure above 90 millimeters of mercury despite prior filling with fluids."}  ;; "need for vasopressors to maintain systolic blood pressure > 90 mmHg despite prior filling"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's current systolic blood pressure in millimeters of mercury is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current systolic blood pressure in millimeters of mercury."}  ;; "systolic blood pressure > 90 millimeters of mercury"
(declare-const patient_systolic_blood_pressure_value_recorded_prior_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value of the patient's systolic blood pressure prior to the current time, in millimeters of mercury, if available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's systolic blood pressure measured prior to the current time, in millimeters of mercury."}  ;; "decrease in systolic blood pressure > 40 percent in the patient with hypertension"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Definition: "decrease in systolic blood pressure > 40 percent in the patient with hypertension"
(define-fun patient_has_decrease_in_systolic_blood_pressure_greater_than_40_percent_now_in_patient_with_hypertension () Bool
  (and
    patient_has_finding_of_hypertensive_disorder_now
    (and
      (not (= patient_systolic_blood_pressure_value_recorded_prior_withunit_millimeters_of_mercury 0.0))
      (< patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury
         (* 0.6 patient_systolic_blood_pressure_value_recorded_prior_withunit_millimeters_of_mercury))
    )
  )
) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypertension and the current systolic blood pressure is more than 40% lower than the prior value.","when_to_set_to_false":"Set to false if the patient does not have hypertension or the decrease is not greater than 40%.","when_to_set_to_null":"Set to null if any required measurement is missing or indeterminate.","meaning":"Boolean indicating whether the patient with hypertension has a decrease in systolic blood pressure greater than 40% compared to prior value."}  ;; "decrease in systolic blood pressure > 40 percent in the patient with hypertension"

;; Definition: "need for vasopressors to maintain systolic blood pressure > 90 mmHg despite prior filling (20-30 mL/kg macromolecules OR 40-60 mL/kg normal saline)"
(define-fun patient_has_need_for_vasopressors_to_maintain_sbp_above_90mmHg_despite_prior_filling_now () Bool
  (and
    patient_is_receiving_vasopressor_therapy_now@@to_maintain_systolic_blood_pressure_above_90_millimeters_of_mercury_despite_prior_filling
    (or
      (and (>= patient_has_received_macromolecule_fluid_volume_value_prior_withunit_milliliters_per_kilogram 20.0)
           (<= patient_has_received_macromolecule_fluid_volume_value_prior_withunit_milliliters_per_kilogram 30.0))
      (and (>= patient_has_received_normal_saline_volume_value_prior_withunit_milliliters_per_kilogram 40.0)
           (<= patient_has_received_normal_saline_volume_value_prior_withunit_milliliters_per_kilogram 60.0))
    )
  )
) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving vasopressor therapy specifically to maintain systolic blood pressure above 90 mmHg despite prior filling with either 20-30 mL/kg macromolecules or 40-60 mL/kg normal saline.","when_to_set_to_false":"Set to false if the patient is not receiving vasopressor therapy for this reason or has not received the required prior filling.","when_to_set_to_null":"Set to null if any required measurement is missing or indeterminate.","meaning":"Boolean indicating whether the patient needs vasopressors to maintain systolic blood pressure above 90 mmHg despite prior filling as specified."}  ;; "need for vasopressors to maintain systolic blood pressure > 90 mmHg despite prior filling (20-30 mL/kg macromolecules OR 40-60 mL/kg normal saline)"

;; Definition: "septic shock" as per requirement
(assert
  (! (= patient_has_finding_of_septic_shock_now
        (or
          (> patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 90.0)
          patient_has_need_for_vasopressors_to_maintain_sbp_above_90mmHg_despite_prior_filling_now
          patient_has_decrease_in_systolic_blood_pressure_greater_than_40_percent_now_in_patient_with_hypertension
        ))
     :named REQ12_AUXILIARY0)) ;; "septic shock defined as ((systolic blood pressure > 90 mmHg) OR (need for vasopressors to maintain systolic blood pressure > 90 mmHg despite prior filling (20-30 mL/kg macromolecules OR 40-60 mL/kg normal saline)) OR (decrease in systolic blood pressure > 40 percent in the patient with hypertension))"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_is_receiving_vasopressor_therapy_now@@to_maintain_systolic_blood_pressure_above_90_millimeters_of_mercury_despite_prior_filling
         patient_is_receiving_vasopressor_therapy_now)
     :named REQ12_AUXILIARY1)) ;; "need for vasopressors to maintain systolic blood pressure > 90 mmHg despite prior filling"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
  (! patient_has_finding_of_septic_shock_now
     :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have septic shock as defined"
