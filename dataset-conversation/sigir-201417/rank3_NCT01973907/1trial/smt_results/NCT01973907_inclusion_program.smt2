;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_days Real) ;; {"when_to_set_to_value":"Set to the patient's current age in days if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in days is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in days."}  ;; "aged ≥ 29 days"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged < 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be aged ≥ 29 days.
(assert
  (! (>= patient_age_value_recorded_now_in_days 29)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 29 days."

;; Component 1: To be included, the patient must be aged < 18 years.
(assert
  (! (< patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged < 18 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_abnormal_capillary_filling_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of abnormal capillary refill.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of abnormal capillary refill.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abnormal capillary refill.","meaning":"Boolean indicating whether the patient currently has abnormal capillary refill."} ;; "abnormal capillary refill"
(declare-const patient_has_finding_of_abnormal_perfusion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abnormal perfusion, as defined by the presence of at least two of the following: abnormal capillary refill, tachycardia, decreased level of consciousness, decreased urine output.","when_to_set_to_false":"Set to false if the patient currently does not have abnormal perfusion, as defined by the absence of at least two of the following: abnormal capillary refill, tachycardia, decreased level of consciousness, decreased urine output.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abnormal perfusion.","meaning":"Boolean indicating whether the patient currently has abnormal perfusion."} ;; "abnormal perfusion (at least two of the following: abnormal capillary refill, tachycardia, decreased level of consciousness, decreased urine output)"
(declare-const patient_has_finding_of_decreased_level_of_consciousness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of decreased level of consciousness.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of decreased level of consciousness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has decreased level of consciousness.","meaning":"Boolean indicating whether the patient currently has decreased level of consciousness."} ;; "decreased level of consciousness"
(declare-const patient_has_finding_of_decreased_urine_output_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of decreased urine output.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of decreased urine output.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has decreased urine output.","meaning":"Boolean indicating whether the patient currently has decreased urine output."} ;; "decreased urine output"
(declare-const patient_has_finding_of_dependence_on_vasoactive_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently requires vasoactive medication to maintain hemodynamic stability.","when_to_set_to_false":"Set to false if the patient currently does not require vasoactive medication to maintain hemodynamic stability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently requires vasoactive medication.","meaning":"Boolean indicating whether the patient currently has dependence on vasoactive medication."} ;; "dependence on vasoactive medication"
(declare-const patient_has_finding_of_low_blood_pressure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypotension (low blood pressure).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypotension (low blood pressure).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypotension (low blood pressure).","meaning":"Boolean indicating whether the patient currently has hypotension (low blood pressure)."} ;; "hypotension"
(declare-const patient_has_finding_of_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of shock.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of shock.","meaning":"Boolean indicating whether the patient currently has shock."} ;; "shock"
(declare-const patient_has_finding_of_shock_now@@persistent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current shock is persistent (i.e., ongoing and not transient).","when_to_set_to_false":"Set to false if the patient's current shock is not persistent (i.e., transient or resolved).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current shock is persistent.","meaning":"Boolean indicating whether the patient's current shock is persistent."} ;; "persistent signs of shock"
(declare-const patient_has_finding_of_tachycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of tachycardia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of tachycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tachycardia.","meaning":"Boolean indicating whether the patient currently has tachycardia."} ;; "tachycardia"
(declare-const patient_mean_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's current mean blood pressure in mmHg is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current mean blood pressure in mmHg."} ;; "mean blood pressure"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's current systolic blood pressure in mmHg is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current systolic blood pressure in mmHg."} ;; "systolic blood pressure"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable for persistent shock implies shock
(assert
  (! (=> patient_has_finding_of_shock_now@@persistent
         patient_has_finding_of_shock_now)
     :named REQ1_AUXILIARY0)) ;; "persistent signs of shock"

;; Hypotension is defined as either systolic or mean BP < 5th percentile for age
;; (Note: The actual 5th percentile thresholds are not specified in the requirement, so we use the Boolean variable for hypotension.)
;; The variable patient_has_finding_of_low_blood_pressure_now is used for "hypotension (systolic blood pressure < 5th percentile for age OR mean blood pressure < 5th percentile for age)"

;; Abnormal perfusion is defined as at least two of: abnormal capillary refill, tachycardia, decreased level of consciousness, decreased urine output
(define-fun abnormal_perfusion_criteria_count () Int
  (+ (ite patient_has_finding_of_abnormal_capillary_filling_now 1 0)
     (ite patient_has_finding_of_tachycardia_now 1 0)
     (ite patient_has_finding_of_decreased_level_of_consciousness_now 1 0)
     (ite patient_has_finding_of_decreased_urine_output_now 1 0))) ;; "abnormal perfusion (at least two of the following: abnormal capillary refill, tachycardia, decreased level of consciousness, decreased urine output)"

(assert
  (! (= patient_has_finding_of_abnormal_perfusion_now
        (>= abnormal_perfusion_criteria_count 2))
     :named REQ1_AUXILIARY1)) ;; "abnormal perfusion (at least two of the following: abnormal capillary refill, tachycardia, decreased level of consciousness, decreased urine output)"

;; Persistent signs of shock are defined as at least one of: dependence on vasoactive medication, hypotension, or abnormal perfusion
(define-fun persistent_signs_of_shock_criteria () Bool
  (or patient_has_finding_of_dependence_on_vasoactive_medication_now
      patient_has_finding_of_low_blood_pressure_now
      patient_has_finding_of_abnormal_perfusion_now)) ;; "at least one of the following: dependence on vasoactive medication OR hypotension ... OR abnormal perfusion ..."

(assert
  (! (= patient_has_finding_of_shock_now@@persistent
        persistent_signs_of_shock_criteria)
     :named REQ1_AUXILIARY2)) ;; "persistent signs of shock, defined as (at least one of the following: ...)"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_shock_now@@persistent
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have persistent signs of shock, defined as (at least one of the following: ...)"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_septic_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has suspected septic shock.","when_to_set_to_false":"Set to false if the patient currently does not have suspected septic shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has suspected septic shock.","meaning":"Boolean indicating whether the patient currently has suspected septic shock."} ;; "septic shock"
(declare-const patient_has_finding_of_septic_shock_now@@suspected Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has septic shock and the finding is suspected.","when_to_set_to_false":"Set to false if the patient currently has septic shock and the finding is not suspected (i.e., confirmed or ruled out).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the finding of septic shock is suspected.","meaning":"Boolean indicating whether the patient's current septic shock finding is suspected."} ;; "suspected septic shock"
(declare-const patient_has_finding_of_septic_shock_now@@confirmed Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has septic shock and the finding is confirmed.","when_to_set_to_false":"Set to false if the patient currently has septic shock and the finding is not confirmed (i.e., suspected or ruled out).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the finding of septic shock is confirmed.","meaning":"Boolean indicating whether the patient's current septic shock finding is confirmed."} ;; "confirmed septic shock"
(declare-const patient_has_finding_of_shock_now@@due_to_suspected_infectious_cause Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has shock and the shock is due to a suspected infectious cause.","when_to_set_to_false":"Set to false if the patient currently has shock and the shock is not due to a suspected infectious cause.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current shock is due to a suspected infectious cause.","meaning":"Boolean indicating whether the patient currently has shock due to a suspected infectious cause."} ;; "shock due to suspected infectious cause"
(declare-const patient_has_finding_of_shock_now@@due_to_confirmed_infectious_cause Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has shock and the shock is due to a confirmed infectious cause.","when_to_set_to_false":"Set to false if the patient currently has shock and the shock is not due to a confirmed infectious cause.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current shock is due to a confirmed infectious cause.","meaning":"Boolean indicating whether the patient currently has shock due to a confirmed infectious cause."} ;; "shock due to confirmed infectious cause"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_septic_shock_now@@suspected
         patient_has_finding_of_septic_shock_now)
     :named REQ2_AUXILIARY0)) ;; "suspected septic shock" implies "septic shock"

(assert
  (! (=> patient_has_finding_of_septic_shock_now@@confirmed
         patient_has_finding_of_septic_shock_now)
     :named REQ2_AUXILIARY1)) ;; "confirmed septic shock" implies "septic shock"

;; Definition: confirmed septic shock is shock due to suspected or confirmed infectious cause
(assert
  (! (= patient_has_finding_of_septic_shock_now@@confirmed
        (or patient_has_finding_of_shock_now@@due_to_suspected_infectious_cause
            patient_has_finding_of_shock_now@@due_to_confirmed_infectious_cause))
     :named REQ2_AUXILIARY2)) ;; "confirmed septic shock (shock due to suspected infectious cause OR confirmed infectious cause)"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have (suspected septic shock OR confirmed septic shock (shock due to suspected infectious cause OR confirmed infectious cause)).
(assert
  (! (or patient_has_finding_of_septic_shock_now@@suspected
         patient_has_finding_of_septic_shock_now@@confirmed)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (suspected septic shock OR confirmed septic shock (shock due to suspected infectious cause OR confirmed infectious cause))."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_undergone_resuscitation_using_intravenous_fluid_inthepast6hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone intravenous fluid resuscitation within the past 6 hours.","when_to_set_to_false":"Set to false if the patient has not undergone intravenous fluid resuscitation within the past 6 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone intravenous fluid resuscitation within the past 6 hours.","meaning":"Boolean indicating whether the patient has undergone intravenous fluid resuscitation within the past 6 hours."} ;; "received initial fluid resuscitation ... as fluid boluses within the previous 6 hours"
(declare-const patient_total_0_9_percent_normal_saline_bolus_volume_administered_past_6_hours_in_ml Real) ;; {"when_to_set_to_value":"Set to the total volume in milliliters of 0.9% normal saline boluses administered to the patient within the past 6 hours.","when_to_set_to_null":"Set to null if the total volume of 0.9% normal saline boluses administered within the past 6 hours is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total volume in milliliters of 0.9% normal saline boluses administered to the patient within the past 6 hours."} ;; "0.9% normal saline ... as fluid boluses within the previous 6 hours"
(declare-const patient_total_ringers_lactate_bolus_volume_administered_past_6_hours_in_ml Real) ;; {"when_to_set_to_value":"Set to the total volume in milliliters of Ringer's lactate boluses administered to the patient within the past 6 hours.","when_to_set_to_null":"Set to null if the total volume of Ringer's lactate boluses administered within the past 6 hours is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total volume in milliliters of Ringer's lactate boluses administered to the patient within the past 6 hours."} ;; "Ringer's lactate ... as fluid boluses within the previous 6 hours"
(declare-const patient_total_isotonic_crystalloid_bolus_volume_administered_past_6_hours_in_ml Real) ;; {"when_to_set_to_value":"Set to the total volume in milliliters of isotonic crystalloid fluid boluses administered to the patient within the past 6 hours.","when_to_set_to_null":"Set to null if the total volume of isotonic crystalloid fluid boluses administered within the past 6 hours is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total volume in milliliters of isotonic crystalloid fluid boluses administered to the patient within the past 6 hours."} ;; "isotonic crystalloid ... as fluid boluses within the previous 6 hours"
(declare-const patient_total_5_percent_albumin_bolus_volume_administered_past_6_hours_in_ml Real) ;; {"when_to_set_to_value":"Set to the total volume in milliliters of 5% albumin boluses administered to the patient within the past 6 hours.","when_to_set_to_null":"Set to null if the total volume of 5% albumin boluses administered within the past 6 hours is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total volume in milliliters of 5% albumin boluses administered to the patient within the past 6 hours."} ;; "5% albumin ... as fluid boluses within the previous 6 hours"
(declare-const patient_total_colloid_bolus_volume_administered_past_6_hours_in_ml Real) ;; {"when_to_set_to_value":"Set to the total volume in milliliters of colloid fluid boluses administered to the patient within the past 6 hours.","when_to_set_to_null":"Set to null if the total volume of colloid fluid boluses administered within the past 6 hours is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total volume in milliliters of colloid fluid boluses administered to the patient within the past 6 hours."} ;; "colloid ... as fluid boluses within the previous 6 hours"
(declare-const patient_weight_value_recorded_past_6_hours_in_kg Real) ;; {"when_to_set_to_value":"Set to the patient's weight in kilograms as recorded within the past 6 hours.","when_to_set_to_null":"Set to null if the patient's weight in kilograms within the past 6 hours is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's weight in kilograms as recorded within the past 6 hours."} ;; "for patients weighing < 50 kg" / "for patients weighing ≥ 50 kg"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Exhaustive subcategories for isotonic crystalloid: 0.9% normal saline, Ringer's lactate
(assert
  (! (= patient_total_isotonic_crystalloid_bolus_volume_administered_past_6_hours_in_ml
        (+ patient_total_0_9_percent_normal_saline_bolus_volume_administered_past_6_hours_in_ml
           patient_total_ringers_lactate_bolus_volume_administered_past_6_hours_in_ml))
     :named REQ3_AUXILIARY0)) ;; "isotonic crystalloid (with exhaustive subcategories (0.9% normal saline, Ringer's lactate))"

;; Exhaustive subcategories for colloid: 5% albumin
(assert
  (! (= patient_total_colloid_bolus_volume_administered_past_6_hours_in_ml
        patient_total_5_percent_albumin_bolus_volume_administered_past_6_hours_in_ml)
     :named REQ3_AUXILIARY1)) ;; "colloid (with exhaustive subcategories (5% albumin))"

;; ===================== Constraint Assertions (REQ 3) =====================
;; For patients weighing < 50 kg: ≥ 40 mL/kg of isotonic crystalloid OR colloid as fluid boluses within the previous 6 hours
;; For patients weighing ≥ 50 kg: ≥ 2000 mL of isotonic crystalloid OR colloid as fluid boluses within the previous 6 hours
(assert
  (! (and
      patient_has_undergone_resuscitation_using_intravenous_fluid_inthepast6hours
      (or
        (and (< patient_weight_value_recorded_past_6_hours_in_kg 50.0)
             (or (>= patient_total_isotonic_crystalloid_bolus_volume_administered_past_6_hours_in_ml
                     (* 40.0 patient_weight_value_recorded_past_6_hours_in_kg))
                 (>= patient_total_colloid_bolus_volume_administered_past_6_hours_in_ml
                     (* 40.0 patient_weight_value_recorded_past_6_hours_in_kg))))
        (and (>= patient_weight_value_recorded_past_6_hours_in_kg 50.0)
             (or (>= patient_total_isotonic_crystalloid_bolus_volume_administered_past_6_hours_in_ml 2000.0)
                 (>= patient_total_colloid_bolus_volume_administered_past_6_hours_in_ml 2000.0)))))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "received initial fluid resuscitation ... for patients weighing < 50 kg: ≥ 40 mL/kg ... OR ... for patients weighing ≥ 50 kg: ≥ 2000 mL ... as fluid boluses within the previous 6 hours"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_septic_shock_now@@fluid_refractory Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current septic shock is fluid refractory.","when_to_set_to_false":"Set to false if the patient's current septic shock is not fluid refractory.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current septic shock is fluid refractory.","meaning":"Boolean indicating whether the patient's current septic shock is fluid refractory."} ;; "fluid refractory septic shock"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition: fluid refractory septic shock is present if ALL of the following:
;;   - persistent signs of shock
;;   - (suspected septic shock OR confirmed septic shock)
;;   - initial fluid resuscitation
(assert
  (! (= patient_has_finding_of_septic_shock_now@@fluid_refractory
        (and patient_has_finding_of_shock_now@@persistent
             (or patient_has_finding_of_septic_shock_now@@suspected
                 patient_has_finding_of_septic_shock_now@@confirmed)
             patient_has_undergone_resuscitation_using_intravenous_fluid_inthepast6hours))
     :named REQ4_AUXILIARY0)) ;; "fluid refractory septic shock, defined as (persistent signs of shock AND (suspected septic shock OR confirmed septic shock) AND initial fluid resuscitation)"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_septic_shock_now@@fluid_refractory
         patient_has_finding_of_septic_shock_now)
     :named REQ4_AUXILIARY1)) ;; "fluid refractory septic shock" implies "septic shock"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Inclusion: patient must have fluid refractory septic shock
(assert
  (! patient_has_finding_of_septic_shock_now@@fluid_refractory
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have fluid refractory septic shock"

;; ===================== Declarations for the inclusion criteria (REQ 5) =====================
;; Age criteria
;; "aged ≥ 29 days"
;; Already declared: (declare-const patient_age_value_recorded_now_in_days Real) ;; {"when_to_set_to_value":"Set to the patient's current age in days if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in days is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in days."}
;; "aged < 18 years"
;; Already declared: (declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}

;; "fluid refractory septic shock, defined as (persistent signs of shock AND (suspected septic shock OR confirmed septic shock) AND initial fluid resuscitation)"
(declare-const patient_has_finding_of_confirmed_septic_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has confirmed septic shock.","when_to_set_to_false":"Set to false if the patient currently does not have confirmed septic shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has confirmed septic shock.","meaning":"Boolean indicating whether the patient currently has confirmed septic shock."} ;; "confirmed septic shock"
(declare-const patient_has_finding_of_persistent_signs_of_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has persistent signs of shock.","when_to_set_to_false":"Set to false if the patient currently does not have persistent signs of shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has persistent signs of shock.","meaning":"Boolean indicating whether the patient currently has persistent signs of shock."} ;; "persistent signs of shock"
(declare-const patient_has_finding_of_suspected_septic_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has suspected septic shock.","when_to_set_to_false":"Set to false if the patient currently does not have suspected septic shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has suspected septic shock.","meaning":"Boolean indicating whether the patient currently has suspected septic shock."} ;; "suspected septic shock"
(declare-const patient_has_undergone_initial_fluid_resuscitation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone initial fluid resuscitation at the current time.","when_to_set_to_false":"Set to false if the patient has not undergone initial fluid resuscitation at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone initial fluid resuscitation at the current time.","meaning":"Boolean indicating whether the patient has undergone initial fluid resuscitation at the current time."} ;; "initial fluid resuscitation"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definition: fluid refractory septic shock is present if all three conditions are met
(assert
  (! (= patient_has_finding_of_septic_shock_now@@fluid_refractory
        (and patient_has_finding_of_persistent_signs_of_shock_now
             (or patient_has_finding_of_suspected_septic_shock_now
                 patient_has_finding_of_confirmed_septic_shock_now)
             patient_has_undergone_initial_fluid_resuscitation_now))
     :named REQ5_AUXILIARY0)) ;; "fluid refractory septic shock, defined as (persistent signs of shock AND (suspected septic shock OR confirmed septic shock) AND initial fluid resuscitation)"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: Age between 29 days and less than 18 years
(assert
  (! (and (>= patient_age_value_recorded_now_in_days 29)
          (< patient_age_value_recorded_now_in_years 18))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "aged ≥ 29 days AND aged < 18 years"

;; Component 1: Must have fluid refractory septic shock as defined above
(assert
  (! patient_has_finding_of_septic_shock_now@@fluid_refractory
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "fluid refractory septic shock, defined as (persistent signs of shock AND (suspected septic shock OR confirmed septic shock) AND initial fluid resuscitation)"
