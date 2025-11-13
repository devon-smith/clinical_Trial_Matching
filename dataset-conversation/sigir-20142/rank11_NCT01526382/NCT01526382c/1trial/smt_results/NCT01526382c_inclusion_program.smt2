;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of shock.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of shock.","meaning":"Boolean indicating whether the patient currently has a diagnosis of shock."}  ;; "diagnosed shock"
(declare-const patient_has_diagnosis_of_acute_respiratory_distress_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute respiratory distress syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute respiratory distress syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute respiratory distress syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute respiratory distress syndrome."}  ;; "diagnosed acute respiratory distress syndrome"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_shock_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have diagnosed shock."

(assert
  (! patient_has_diagnosis_of_acute_respiratory_distress_syndrome_now
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have diagnosed acute respiratory distress syndrome."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
;; (Do not redeclare variables already in <already_used_variables_in_SMT_program>)

(declare-const patient_heart_rate_value_recorded_now_withunit_beats_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured heart rate value in beats per minute if a current measurement is available.","when_to_set_to_null":"Set to null if no current heart rate measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current heart rate in beats per minute."} ;; "heart rate ≥ 90 per minute"

(declare-const patient_respiratory_rate_value_recorded_now_withunit_breaths_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured respiratory rate value in breaths per minute if a current measurement is available.","when_to_set_to_null":"Set to null if no current respiratory rate measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current respiratory rate in breaths per minute."} ;; "respiratory rate ≥ 20 per minute"

(declare-const patient_finding_of_arterial_partial_pressure_of_carbon_dioxide_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured partial pressure of carbon dioxide in arterial blood in mmHg if a current measurement is available.","when_to_set_to_null":"Set to null if no current measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current partial pressure of carbon dioxide in arterial blood in mmHg."} ;; "partial pressure of carbon dioxide in arterial blood ≤ 32 mmHg"

(declare-const patient_is_undergoing_artificial_respiration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing mechanical ventilation.","when_to_set_to_false":"Set to false if the patient is currently not undergoing mechanical ventilation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing mechanical ventilation.","meaning":"Boolean indicating whether the patient is currently undergoing mechanical ventilation."} ;; "use of mechanical ventilation"

(declare-const patient_is_exposed_to_vasopressor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to vasopressor medications.","when_to_set_to_false":"Set to false if the patient is currently not exposed to vasopressor medications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to vasopressor medications.","meaning":"Boolean indicating whether the patient is currently exposed to vasopressor medications."} ;; "use of vasopressors"

(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured systolic blood pressure value in mmHg if a current measurement is available.","when_to_set_to_null":"Set to null if no current systolic blood pressure measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current systolic blood pressure in mmHg."} ;; "systolic blood pressure ≥ 90 mmHg"

(declare-const patient_has_received_fluid_resuscitation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received fluid resuscitation at the current time.","when_to_set_to_false":"Set to false if the patient has not received fluid resuscitation at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received fluid resuscitation at the current time.","meaning":"Boolean indicating whether the patient has received fluid resuscitation at the current time."} ;; "despite fluid resuscitation"

(declare-const patient_is_exposed_to_dopamine_now_with_dose_low Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to dopamine at a dose less than or equal to 5 micrograms per kilogram per minute.","when_to_set_to_false":"Set to false if the patient is currently exposed to dopamine at a dose greater than 5 micrograms per kilogram per minute or not exposed to dopamine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to dopamine at a low dose.","meaning":"Boolean indicating whether the patient is currently exposed to dopamine at a low dose (≤ 5 micrograms per kilogram per minute)."} ;; "use of low dose dopamine (≤ 5 micrograms per kilogram per minute)"

(declare-const patient_dopamine_value_recorded_now_withunit_micrograms_per_kilogram_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured dose of dopamine in micrograms per kilogram per minute if a current measurement is available.","when_to_set_to_null":"Set to null if no current dopamine dose measurement is available or the value is indeterminate.","meaning":"Numeric value representing the current dose of dopamine administered to the patient in micrograms per kilogram per minute."} ;; "dopamine dose"

(declare-const patient_is_exposed_to_dobutamine_now_with_dose_low Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to dobutamine at a low dose as defined by clinical protocol.","when_to_set_to_false":"Set to false if the patient is currently exposed to dobutamine at a higher dose or not exposed to dobutamine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to dobutamine at a low dose.","meaning":"Boolean indicating whether the patient is currently exposed to dobutamine at a low dose."} ;; "use of low dose dobutamine"

(declare-const patient_is_exposed_to_dobutamine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to dobutamine.","when_to_set_to_false":"Set to false if the patient is currently not exposed to dobutamine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to dobutamine.","meaning":"Boolean indicating whether the patient is currently exposed to dobutamine."} ;; "dobutamine exposure"

(declare-const patient_measure_of_urine_output_value_recorded_now_withunit_milliliters_per_kilogram_per_hour Real) ;; {"when_to_set_to_value":"Set to the measured urine output in milliliters per kilogram per hour if a current measurement is available.","when_to_set_to_null":"Set to null if no current urine output measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current urine output in milliliters per kilogram of body weight per hour."} ;; "urine output < 0.5 milliliters per kilogram of body weight per hour"

(declare-const patient_has_finding_of_confusion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has confusion.","when_to_set_to_false":"Set to false if the patient currently does not have confusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has confusion.","meaning":"Boolean indicating whether the patient currently has confusion."} ;; "confusion"

(declare-const patient_has_finding_of_psychosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has psychosis.","when_to_set_to_false":"Set to false if the patient currently does not have psychosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has psychosis.","meaning":"Boolean indicating whether the patient currently has psychosis."} ;; "psychosis"

(declare-const patient_glasgow_coma_scale_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured Glasgow coma scale score if a current measurement is available.","when_to_set_to_null":"Set to null if no current Glasgow coma scale score measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current Glasgow coma scale score."} ;; "Glasgow coma scale score ≤ 6"

(declare-const patient_lactate_value_recorded_now_withunit_millimoles_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured plasma lactate concentration in millimoles per liter if a current measurement is available.","when_to_set_to_null":"Set to null if no current plasma lactate measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current plasma lactate concentration in millimoles per liter."} ;; "plasma lactate above the upper limit of normal value"

(declare-const patient_lactate_upper_limit_of_normal_value_withunit_millimoles_per_liter Real) ;; {"when_to_set_to_value":"Set to the reference upper limit of normal for plasma lactate concentration in millimoles per liter as defined by the laboratory.","when_to_set_to_null":"Set to null if the reference value is not available or indeterminate.","meaning":"Numeric value representing the upper limit of normal for plasma lactate concentration in millimoles per liter."} ;; "upper limit of normal value for plasma lactate"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Dopamine low dose definition (≤ 5 μg/kg/min)
(assert
  (! (= patient_is_exposed_to_dopamine_now_with_dose_low
        (<= patient_dopamine_value_recorded_now_withunit_micrograms_per_kilogram_per_minute 5.0))
     :named REQ1_AUXILIARY0)) ;; "use of low dose dopamine (≤ 5 micrograms per kilogram per minute)"

;; Neurologic dysfunction definition: confusion, psychosis, or GCS ≤ 6
(define-fun patient_has_neurologic_dysfunction_now () Bool
  (or patient_has_finding_of_confusion_now
      patient_has_finding_of_psychosis_now
      (<= patient_glasgow_coma_scale_score_value_recorded_now_withunit_score 6.0)))
;; "neurologic dysfunction defined by confusion, psychosis, or Glasgow coma scale score ≤ 6"

;; Hypoperfusion: at least one of urine output, neurologic dysfunction, or lactate
(define-fun patient_has_sign_of_hypoperfusion_now () Bool
  (or (< patient_measure_of_urine_output_value_recorded_now_withunit_milliliters_per_kilogram_per_hour 0.5)
      patient_has_neurologic_dysfunction_now
      (> patient_lactate_value_recorded_now_withunit_millimoles_per_liter patient_lactate_upper_limit_of_normal_value_withunit_millimoles_per_liter)))
;; "at least one of the following signs of hypoperfusion: (urine output < 0.5 mL/kg/hr for at least 1 hour) OR (neurologic dysfunction defined by confusion, psychosis, or Glasgow coma scale score ≤ 6) OR (plasma lactate above the upper limit of normal value)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: heart rate ≥ 90 per minute
(assert
  (! (>= patient_heart_rate_value_recorded_now_withunit_beats_per_minute 90.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "heart rate ≥ 90 per minute"

;; Component 1: (respiratory rate ≥ 20 per minute) OR (pCO2 ≤ 32 mmHg) OR (mechanical ventilation)
(assert
  (! (or (>= patient_respiratory_rate_value_recorded_now_withunit_breaths_per_minute 20.0)
         (<= patient_finding_of_arterial_partial_pressure_of_carbon_dioxide_value_recorded_now_withunit_mmhg 32.0)
         patient_is_undergoing_artificial_respiration_now)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "(respiratory rate ≥ 20 per minute) OR (partial pressure of carbon dioxide in arterial blood ≤ 32 mmHg) OR (use of mechanical ventilation)"

;; Component 2: use of vasopressors to maintain SBP ≥ 90 mmHg despite fluid resuscitation, or use of low dose dopamine, or use of low dose dobutamine
(assert
  (! (or
        (and patient_is_exposed_to_vasopressor_now
             (>= patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg 90.0)
             patient_has_received_fluid_resuscitation_now)
        patient_is_exposed_to_dopamine_now_with_dose_low
        patient_is_exposed_to_dobutamine_now_with_dose_low)
     :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "use of vasopressors to maintain systolic blood pressure ≥ 90 mmHg despite fluid resuscitation, or use of low dose dopamine (≤ 5 micrograms per kilogram per minute), or use of low dose dobutamine"

;; Component 3: at least one sign of hypoperfusion
(assert
  (! patient_has_sign_of_hypoperfusion_now
     :named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "at least one of the following signs of hypoperfusion: (urine output < 0.5 mL/kg/hr for at least 1 hour) OR (neurologic dysfunction defined by confusion, psychosis, or Glasgow coma scale score ≤ 6) OR (plasma lactate above the upper limit of normal value)"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_arterial_oxygen_to_inspired_oxygen_ratio_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current PaO2/FiO2 ratio in mmHg is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current PaO2/FiO2 ratio in mmHg."} ;; "presence of an acute decrease in the ratio of partial pressure of oxygen in arterial blood (PaO2) to fraction of inspired oxygen (FiO2) to ≤ 200 mmHg"
(declare-const patient_oxygen_measurement_partial_pressure_arterial_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current partial pressure of oxygen in arterial blood (PaO2) in mmHg is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current PaO2 in mmHg."} ;; "PaO2"
(declare-const patient_inspired_oxygen_concentration_value_recorded_now_withunit_fraction Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current fraction of inspired oxygen (FiO2) is available as a fraction.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current FiO2 as a fraction."} ;; "FiO2"
(declare-const patient_has_finding_of_radiologic_infiltrate_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has radiologic evidence of pulmonary infiltrates.","when_to_set_to_false":"Set to false if the patient currently does not have radiologic evidence of pulmonary infiltrates.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has radiologic evidence of pulmonary infiltrates.","meaning":"Boolean indicating current radiologic pulmonary infiltrates."} ;; "pulmonary infiltrates"
(declare-const patient_has_finding_of_radiologic_infiltrate_of_lung_now@@bilateral Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bilateral radiologic pulmonary infiltrates.","when_to_set_to_false":"Set to false if the patient currently has radiologic pulmonary infiltrates but they are not bilateral.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pulmonary infiltrates are bilateral.","meaning":"Boolean indicating whether the patient's current radiologic pulmonary infiltrates are bilateral."} ;; "bilateral pulmonary infiltrates"
(declare-const patient_has_undergone_plain_chest_x_ray_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a chest radiograph now.","when_to_set_to_false":"Set to false if the patient has not undergone a chest radiograph now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a chest radiograph now.","meaning":"Boolean indicating whether the patient has undergone a chest radiograph now."} ;; "chest radiograph"
(declare-const patient_has_undergone_plain_chest_x_ray_now@@consistent_with_edema Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a chest radiograph now and the radiograph is consistent with edema.","when_to_set_to_false":"Set to false if the patient has undergone a chest radiograph now and the radiograph is not consistent with edema.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chest radiograph is consistent with edema.","meaning":"Boolean indicating whether the patient's current chest radiograph is consistent with edema."} ;; "chest radiograph consistent with edema"
(declare-const patient_has_finding_of_left_atrial_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical evidence of left atrial hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have clinical evidence of left atrial hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical evidence of left atrial hypertension.","meaning":"Boolean indicating whether the patient currently has clinical evidence of left atrial hypertension."} ;; "no clinical evidence of left atrial hypertension"
(declare-const patient_is_receiving_positive_pressure_ventilation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving positive pressure ventilation.","when_to_set_to_false":"Set to false if the patient is not currently receiving positive pressure ventilation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving positive pressure ventilation.","meaning":"Boolean indicating whether the patient is currently receiving positive pressure ventilation."} ;; "requirement for positive pressure ventilation"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: PaO2/FiO2 ratio calculation
(assert
  (! (= patient_arterial_oxygen_to_inspired_oxygen_ratio_value_recorded_now_withunit_mmhg
        (/ patient_oxygen_measurement_partial_pressure_arterial_value_recorded_now_withunit_mmhg
           patient_inspired_oxygen_concentration_value_recorded_now_withunit_fraction))
     :named REQ2_AUXILIARY0)) ;; "ratio of partial pressure of oxygen in arterial blood (PaO2) to fraction of inspired oxygen (FiO2)"

;; Qualifier variable implies stem variable (bilateral pulmonary infiltrates)
(assert
  (! (=> patient_has_finding_of_radiologic_infiltrate_of_lung_now@@bilateral
         patient_has_finding_of_radiologic_infiltrate_of_lung_now)
     :named REQ2_AUXILIARY1)) ;; "bilateral pulmonary infiltrates" implies "pulmonary infiltrates"

;; Qualifier variable implies stem variable (chest radiograph consistent with edema)
(assert
  (! (=> patient_has_undergone_plain_chest_x_ray_now@@consistent_with_edema
         patient_has_undergone_plain_chest_x_ray_now)
     :named REQ2_AUXILIARY2)) ;; "chest radiograph consistent with edema" implies "chest radiograph"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: PaO2/FiO2 ratio ≤ 200 mmHg
(assert
  (! (<= patient_arterial_oxygen_to_inspired_oxygen_ratio_value_recorded_now_withunit_mmhg 200.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "presence of an acute decrease in the ratio of partial pressure of oxygen in arterial blood (PaO2) to fraction of inspired oxygen (FiO2) to ≤ 200 mmHg"

;; Component 1: (bilateral pulmonary infiltrates) OR (chest radiograph consistent with edema)
(assert
  (! (or patient_has_finding_of_radiologic_infiltrate_of_lung_now@@bilateral
         patient_has_undergone_plain_chest_x_ray_now@@consistent_with_edema)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "(bilateral pulmonary infiltrates) OR (chest radiograph consistent with edema)"

;; Component 2: no clinical evidence of left atrial hypertension
(assert
  (! (not patient_has_finding_of_left_atrial_hypertension_now)
     :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "no clinical evidence of left atrial hypertension"

;; Component 3: requirement for positive pressure ventilation
(assert
  (! patient_is_receiving_positive_pressure_ventilation_now
     :named REQ2_COMPONENT3_OTHER_REQUIREMENTS)) ;; "requirement for positive pressure ventilation"
