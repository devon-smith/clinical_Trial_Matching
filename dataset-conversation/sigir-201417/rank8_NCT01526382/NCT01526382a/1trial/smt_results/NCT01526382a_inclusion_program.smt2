;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_shock_inthehistory Bool) ;; "shock" {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with shock at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with shock at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with shock.","meaning":"Boolean indicating whether the patient has ever been diagnosed with shock in their medical history."}

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must have been diagnosed with shock.
(assert
  (! patient_has_diagnosis_of_shock_inthehistory
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have been diagnosed with shock."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_heart_rate_value_recorded_now_withunit_beats_per_minute Real) ;; "heart rate ≥ 90 beats per minute" {"when_to_set_to_value":"Set to the measured value if the patient's heart rate is recorded now in beats per minute.","when_to_set_to_null":"Set to null if no heart rate measurement is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's heart rate measured now, in beats per minute."}
(declare-const patient_respiratory_rate_value_recorded_now_withunit_breaths_per_minute Real) ;; "respiratory rate ≥ 20 breaths per minute" {"when_to_set_to_value":"Set to the measured value if the patient's respiratory rate is recorded now in breaths per minute.","when_to_set_to_null":"Set to null if no respiratory rate measurement is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's respiratory rate measured now, in breaths per minute."}
(declare-const patient_partial_pressure_of_carbon_dioxide_in_arterial_blood_value_recorded_now_withunit_millimeters_of_mercury Real) ;; "partial pressure of carbon dioxide in arterial blood ≤ 32 millimeters of mercury" {"when_to_set_to_value":"Set to the measured value if the patient's partial pressure of carbon dioxide in arterial blood is recorded now in millimeters of mercury.","when_to_set_to_null":"Set to null if no measurement is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's partial pressure of carbon dioxide in arterial blood measured now, in millimeters of mercury."}
(declare-const patient_is_receiving_mechanical_ventilation_now Bool) ;; "use of mechanical ventilation" {"when_to_set_to_true":"Set to true if the patient is currently receiving mechanical ventilation.","when_to_set_to_false":"Set to false if the patient is not currently receiving mechanical ventilation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving mechanical ventilation.","meaning":"Boolean indicating whether the patient is currently receiving mechanical ventilation."}
(declare-const patient_is_receiving_vasopressor_now Bool) ;; "use of vasopressors" {"when_to_set_to_true":"Set to true if the patient is currently receiving vasopressor therapy.","when_to_set_to_false":"Set to false if the patient is not currently receiving vasopressor therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving vasopressor therapy.","meaning":"Boolean indicating whether the patient is currently receiving vasopressor therapy."}
(declare-const patient_is_receiving_vasopressor_now@@to_maintain_systolic_blood_pressure_despite_fluid_resuscitation Bool) ;; "use of vasopressors to maintain systolic blood pressure ≥ 90 millimeters of mercury despite fluid resuscitation" {"when_to_set_to_true":"Set to true if the patient's vasopressor therapy is specifically to maintain systolic blood pressure despite fluid resuscitation.","when_to_set_to_false":"Set to false if the patient's vasopressor therapy is not specifically to maintain systolic blood pressure despite fluid resuscitation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's vasopressor therapy is specifically to maintain systolic blood pressure despite fluid resuscitation.","meaning":"Boolean indicating whether the patient's vasopressor therapy is specifically to maintain systolic blood pressure despite fluid resuscitation."}
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; "systolic blood pressure ≥ 90 millimeters of mercury" {"when_to_set_to_value":"Set to the measured value if the patient's systolic blood pressure is recorded now in millimeters of mercury.","when_to_set_to_null":"Set to null if no systolic blood pressure measurement is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's systolic blood pressure measured now, in millimeters of mercury."}
(declare-const patient_has_received_fluid_resuscitation_now Bool) ;; "despite fluid resuscitation" {"when_to_set_to_true":"Set to true if the patient has received fluid resuscitation now.","when_to_set_to_false":"Set to false if the patient has not received fluid resuscitation now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received fluid resuscitation now.","meaning":"Boolean indicating whether the patient has received fluid resuscitation now."}
(declare-const patient_is_receiving_dopamine_now Bool) ;; "use of dopamine" {"when_to_set_to_true":"Set to true if the patient is currently receiving dopamine therapy.","when_to_set_to_false":"Set to false if the patient is not currently receiving dopamine therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving dopamine therapy.","meaning":"Boolean indicating whether the patient is currently receiving dopamine therapy."}
(declare-const patient_is_receiving_dopamine_now@@low_dose_less_than_or_equal_5_micrograms_per_kilogram_per_minute Bool) ;; "low dose dopamine (≤ 5 micrograms per kilogram per minute)" {"when_to_set_to_true":"Set to true if the patient's dopamine therapy is at a low dose (≤ 5 micrograms per kilogram per minute).","when_to_set_to_false":"Set to false if the patient's dopamine therapy is not at a low dose (≤ 5 micrograms per kilogram per minute).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dopamine therapy is at a low dose (≤ 5 micrograms per kilogram per minute).","meaning":"Boolean indicating whether the patient's dopamine therapy is at a low dose (≤ 5 micrograms per kilogram per minute)."}
(declare-const patient_is_receiving_dobutamine_now Bool) ;; "use of dobutamine" {"when_to_set_to_true":"Set to true if the patient is currently receiving dobutamine therapy.","when_to_set_to_false":"Set to false if the patient is not currently receiving dobutamine therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving dobutamine therapy.","meaning":"Boolean indicating whether the patient is currently receiving dobutamine therapy."}
(declare-const patient_urine_output_value_recorded_per_hour_withunit_milliliters_per_kilogram_per_hour Real) ;; "urine output < 0.5 milliliters per kilogram of body weight per hour" {"when_to_set_to_value":"Set to the measured value if the patient's urine output is recorded per hour in milliliters per kilogram of body weight per hour.","when_to_set_to_null":"Set to null if no urine output measurement is available for per hour or the value is indeterminate.","meaning":"Numeric value representing the patient's urine output measured per hour, in milliliters per kilogram of body weight per hour."}
(declare-const patient_urine_output_value_recorded_per_hour_withunit_milliliters_per_kilogram_per_hour@@for_at_least_1_hour Bool) ;; "for ≥ 1 hour" {"when_to_set_to_true":"Set to true if the urine output value is measured for at least 1 hour.","when_to_set_to_false":"Set to false if the urine output value is not measured for at least 1 hour.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the urine output value is measured for at least 1 hour.","meaning":"Boolean indicating whether the urine output value is measured for at least 1 hour."}
(declare-const patient_has_finding_of_neurologic_dysfunction_now Bool) ;; "neurologic dysfunction" {"when_to_set_to_true":"Set to true if the patient currently has neurologic dysfunction.","when_to_set_to_false":"Set to false if the patient currently does not have neurologic dysfunction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has neurologic dysfunction.","meaning":"Boolean indicating whether the patient currently has neurologic dysfunction."}
(declare-const patient_has_finding_of_neurologic_dysfunction_now@@defined_by_confusion_or_psychosis_or_gcs_score_less_than_or_equal_6 Bool) ;; "neurologic dysfunction (defined by confusion OR psychosis OR Glasgow coma scale score ≤ 6)" {"when_to_set_to_true":"Set to true if the patient's neurologic dysfunction is defined by confusion, psychosis, or Glasgow coma scale score ≤ 6.","when_to_set_to_false":"Set to false if the patient's neurologic dysfunction is not defined by confusion, psychosis, or Glasgow coma scale score ≤ 6.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's neurologic dysfunction is defined by confusion, psychosis, or Glasgow coma scale score ≤ 6.","meaning":"Boolean indicating whether the patient's neurologic dysfunction is defined by confusion, psychosis, or Glasgow coma scale score ≤ 6."}
(declare-const patient_has_finding_of_confusion_now Bool) ;; "confusion" {"when_to_set_to_true":"Set to true if the patient currently has confusion.","when_to_set_to_false":"Set to false if the patient currently does not have confusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has confusion.","meaning":"Boolean indicating whether the patient currently has confusion."}
(declare-const patient_has_finding_of_psychosis_now Bool) ;; "psychosis" {"when_to_set_to_true":"Set to true if the patient currently has psychosis.","when_to_set_to_false":"Set to false if the patient currently does not have psychosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has psychosis.","meaning":"Boolean indicating whether the patient currently has psychosis."}
(declare-const patient_glasgow_coma_scale_score_value_recorded_now_withunit_score Real) ;; "Glasgow coma scale score ≤ 6" {"when_to_set_to_value":"Set to the measured value if the patient's Glasgow coma scale score is recorded now.","when_to_set_to_null":"Set to null if no Glasgow coma scale score is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's Glasgow coma scale score measured now."}
(declare-const patient_plasma_lactate_value_recorded_now_withunit_millimoles_per_liter Real) ;; "plasma lactate > upper limit of the normal value" {"when_to_set_to_value":"Set to the measured value if the patient's plasma lactate is recorded now in millimoles per liter.","when_to_set_to_null":"Set to null if no plasma lactate measurement is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's plasma lactate measured now, in millimoles per liter."}
(declare-const patient_plasma_lactate_value_recorded_now_withunit_millimoles_per_liter@@compared_to_upper_limit_of_normal_value Bool) ;; "plasma lactate > upper limit of the normal value" {"when_to_set_to_true":"Set to true if the plasma lactate value is compared to the upper limit of the normal value.","when_to_set_to_false":"Set to false if the plasma lactate value is not compared to the upper limit of the normal value.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the plasma lactate value is compared to the upper limit of the normal value.","meaning":"Boolean indicating whether the plasma lactate value is compared to the upper limit of the normal value."}

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable for vasopressor therapy implies stem variable
(assert
  (! (=> patient_is_receiving_vasopressor_now@@to_maintain_systolic_blood_pressure_despite_fluid_resuscitation
         patient_is_receiving_vasopressor_now)
     :named REQ1_AUXILIARY0)) ;; "use of vasopressors to maintain systolic blood pressure ≥ 90 millimeters of mercury despite fluid resuscitation"

;; Qualifier variable for dopamine therapy implies stem variable
(assert
  (! (=> patient_is_receiving_dopamine_now@@low_dose_less_than_or_equal_5_micrograms_per_kilogram_per_minute
         patient_is_receiving_dopamine_now)
     :named REQ1_AUXILIARY1)) ;; "use of low dose dopamine (≤ 5 micrograms per kilogram per minute)"

;; Qualifier variable for urine output implies stem variable
(assert
  (! (=> patient_urine_output_value_recorded_per_hour_withunit_milliliters_per_kilogram_per_hour@@for_at_least_1_hour
         true)
     :named REQ1_AUXILIARY2)) ;; "urine output < 0.5 milliliters per kilogram of body weight per hour for ≥ 1 hour"

;; Qualifier variable for plasma lactate implies stem variable
(assert
  (! (=> patient_plasma_lactate_value_recorded_now_withunit_millimoles_per_liter@@compared_to_upper_limit_of_normal_value
         true)
     :named REQ1_AUXILIARY3)) ;; "plasma lactate > upper limit of the normal value"

;; Neurologic dysfunction definition: confusion OR psychosis OR GCS ≤ 6
(assert
  (! (= patient_has_finding_of_neurologic_dysfunction_now@@defined_by_confusion_or_psychosis_or_gcs_score_less_than_or_equal_6
        (or patient_has_finding_of_confusion_now
            patient_has_finding_of_psychosis_now
            (<= patient_glasgow_coma_scale_score_value_recorded_now_withunit_score 6.0)))
     :named REQ1_AUXILIARY4)) ;; "neurologic dysfunction (defined by confusion OR psychosis OR Glasgow coma scale score ≤ 6)"

;; Qualifier variable for neurologic dysfunction definition implies stem variable
(assert
  (! (=> patient_has_finding_of_neurologic_dysfunction_now@@defined_by_confusion_or_psychosis_or_gcs_score_less_than_or_equal_6
         patient_has_finding_of_neurologic_dysfunction_now)
     :named REQ1_AUXILIARY5)) ;; "neurologic dysfunction (defined by confusion OR psychosis OR Glasgow coma scale score ≤ 6)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: heart rate ≥ 90 beats per minute
(assert
  (! (>= patient_heart_rate_value_recorded_now_withunit_beats_per_minute 90.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "heart rate ≥ 90 beats per minute"

;; Component 1: (respiratory rate ≥ 20 OR pCO2 ≤ 32 OR mechanical ventilation)
(assert
  (! (or (>= patient_respiratory_rate_value_recorded_now_withunit_breaths_per_minute 20.0)
         (<= patient_partial_pressure_of_carbon_dioxide_in_arterial_blood_value_recorded_now_withunit_millimeters_of_mercury 32.0)
         patient_is_receiving_mechanical_ventilation_now)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "respiratory rate ≥ 20 breaths per minute OR partial pressure of carbon dioxide in arterial blood ≤ 32 mmHg OR use of mechanical ventilation"

;; Component 2: (vasopressors to maintain SBP ≥ 90 despite fluid resuscitation OR low dose dopamine OR dobutamine)
(assert
  (! (or
        (and patient_is_receiving_vasopressor_now@@to_maintain_systolic_blood_pressure_despite_fluid_resuscitation
             (>= patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 90.0)
             patient_has_received_fluid_resuscitation_now)
        patient_is_receiving_dopamine_now@@low_dose_less_than_or_equal_5_micrograms_per_kilogram_per_minute
        patient_is_receiving_dobutamine_now)
     :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "use of vasopressors to maintain systolic blood pressure ≥ 90 mmHg despite fluid resuscitation OR use of low dose dopamine (≤ 5 μg/kg/min) OR use of dobutamine"

;; Component 3: at least one of 3 signs of hypoperfusion
(assert
  (! (or
        (and (< patient_urine_output_value_recorded_per_hour_withunit_milliliters_per_kilogram_per_hour 0.5)
             patient_urine_output_value_recorded_per_hour_withunit_milliliters_per_kilogram_per_hour@@for_at_least_1_hour)
        patient_has_finding_of_neurologic_dysfunction_now@@defined_by_confusion_or_psychosis_or_gcs_score_less_than_or_equal_6
        (and patient_plasma_lactate_value_recorded_now_withunit_millimoles_per_liter@@compared_to_upper_limit_of_normal_value
             ;; The actual upper limit of normal value is not specified, so this is a placeholder for the comparison
             true))
     :named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "at least one of the following 3 signs of hypoperfusion: (urine output < 0.5 mL/kg/hr for ≥ 1 hr OR neurologic dysfunction (defined by confusion OR psychosis OR GCS ≤ 6) OR plasma lactate > upper limit of normal value)"
