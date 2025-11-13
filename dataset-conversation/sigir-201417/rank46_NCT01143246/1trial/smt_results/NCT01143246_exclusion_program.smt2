;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_serum_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's serum creatinine concentration in mg/dL is recorded now.","when_to_set_to_null":"Set to null if no current measurement of serum creatinine concentration in mg/dL is available or the value is indeterminate.","meaning":"Numeric value for the patient's current serum creatinine concentration in mg/dL."} ;; "serum creatinine concentration"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (> patient_serum_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl 7))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has serum creatinine concentration > 7 mg/dL."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const mean_arterial_pressure_value_recorded_now_withunit_mm_hg Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's mean arterial pressure measured now, in mm Hg.","when_to_set_to_null":"Set to null if the patient's mean arterial pressure measured now is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's mean arterial pressure measured now, in mm Hg."} ;; "mean arterial pressure < 70 mm Hg"
(declare-const patient_has_evidence_of_hypoperfusion_abnormalities_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of hypoperfusion abnormalities.","when_to_set_to_false":"Set to false if the patient currently does not have evidence of hypoperfusion abnormalities.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of hypoperfusion abnormalities.","meaning":"Boolean indicating whether the patient currently has evidence of hypoperfusion abnormalities."} ;; "evidence of hypoperfusion abnormalities"
(declare-const patient_has_finding_of_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of shock.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of shock.","meaning":"Boolean indicating whether the patient currently has shock."} ;; "shock"
(declare-const patient_has_received_adequate_fluid_resuscitation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently received adequate fluid resuscitation.","when_to_set_to_false":"Set to false if the patient has not currently received adequate fluid resuscitation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has currently received adequate fluid resuscitation.","meaning":"Boolean indicating whether the patient has currently received adequate fluid resuscitation."} ;; "despite adequate fluid resuscitation"
(declare-const systolic_blood_pressure_value_recorded_baseline_withunit_mm_hg Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's baseline systolic blood pressure, in mm Hg.","when_to_set_to_null":"Set to null if the patient's baseline systolic blood pressure is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's baseline systolic blood pressure, in mm Hg."} ;; "decrease in systolic blood pressure from baseline > 40 mm Hg"
(declare-const systolic_blood_pressure_value_recorded_now_withunit_mm_hg Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's systolic blood pressure measured now, in mm Hg.","when_to_set_to_null":"Set to null if the patient's systolic blood pressure measured now is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's systolic blood pressure measured now, in mm Hg."} ;; "systolic blood pressure measured now"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition of shock per requirement: hypotension (MAP < 70 OR decrease in SBP from baseline > 40) WITH evidence of hypoperfusion abnormalities, despite adequate fluid resuscitation
(assert
(! (= patient_has_finding_of_shock_now
     (and
       (or
         (< mean_arterial_pressure_value_recorded_now_withunit_mm_hg 70) ;; "mean arterial pressure < 70 mm Hg"
         (> (- systolic_blood_pressure_value_recorded_baseline_withunit_mm_hg systolic_blood_pressure_value_recorded_now_withunit_mm_hg) 40) ;; "decrease in systolic blood pressure from baseline > 40 mm Hg"
       )
       patient_has_evidence_of_hypoperfusion_abnormalities_now ;; "WITH evidence of hypoperfusion abnormalities"
       patient_has_received_adequate_fluid_resuscitation_now ;; "despite adequate fluid resuscitation"
     ))
:named REQ1_AUXILIARY0)) ;; "shock (defined as hypotension ((mean arterial pressure < 70 mm Hg) OR (decrease in systolic blood pressure from baseline > 40 mm Hg)) WITH evidence of hypoperfusion abnormalities, despite adequate fluid resuscitation)."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_shock_now)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has shock (defined as hypotension ((mean arterial pressure < 70 mm Hg) OR (decrease in systolic blood pressure from baseline > 40 mm Hg)) WITH evidence of hypoperfusion abnormalities, despite adequate fluid resuscitation)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_sepsis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of sepsis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of sepsis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sepsis.","meaning":"Boolean indicating whether the patient currently has sepsis."} ;; "sepsis"
(declare-const patient_has_finding_of_systemic_inflammatory_response_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of systemic inflammatory response syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of systemic inflammatory response syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has systemic inflammatory response syndrome.","meaning":"Boolean indicating whether the patient currently has systemic inflammatory response syndrome."} ;; "systemic inflammatory response syndrome"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_sepsis_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has sepsis."

(assert
(! (not patient_has_finding_of_systemic_inflammatory_response_syndrome_now)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has systemic inflammatory response syndrome."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
;; All required variables are already declared in <already_used_variables_in_SMT_program>.

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_systemic_inflammatory_response_syndrome_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient meets the definition of systemic inflammatory response syndrome (defined as the presence of ≥ 2 of the following findings)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_body_temperature_value_recorded_now_withunit_celsius Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current body temperature in degrees Celsius is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current body temperature in degrees Celsius."} ;; "body temperature > 38°C" and "body temperature < 36°C"
(declare-const patient_heart_rate_value_recorded_now_withunit_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current heart rate in beats per minute is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current heart rate in beats per minute."} ;; "heart rate > 90/min"
(declare-const patient_respiratory_rate_value_recorded_now_withunit_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current respiratory rate in breaths per minute is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current respiratory rate in breaths per minute."} ;; "respiratory rate > 20/min"
(declare-const patient_carbon_dioxide_value_recorded_now_withunit_mm_hg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current partial pressure of arterial carbon dioxide (PaCO2) in mm Hg is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current partial pressure of arterial carbon dioxide (PaCO2) in mm Hg."} ;; "partial pressure of arterial carbon dioxide < 32 mm Hg"
(declare-const patient_carbon_dioxide_value_recorded_now_withunit_mm_hg@@measured_in_arterial_blood Bool) ;; {"when_to_set_to_true":"Set to true if the partial pressure of carbon dioxide value is measured in arterial blood.","when_to_set_to_false":"Set to false if the partial pressure of carbon dioxide value is not measured in arterial blood.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement is from arterial blood.","meaning":"Indicates whether the partial pressure of carbon dioxide value is measured in arterial blood."} ;; "partial pressure of arterial carbon dioxide < 32 mm Hg"
(declare-const patient_white_blood_cell_count_value_recorded_now_withunit_cells_per_microliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current white blood cell count in cells per microliter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current white blood cell count in cells per microliter."} ;; "white blood cell count > 12,000 cells/μL" and "white blood cell count < 4,000/μL"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Define Boolean indicators for each abnormal finding
(define-fun patient_has_abnormal_body_temperature_high_now () Bool
  (> patient_body_temperature_value_recorded_now_withunit_celsius 38)
) ;; {"when_to_set_to_true":"Set to true if the patient's current body temperature is greater than 38°C.","when_to_set_to_false":"Set to false if the patient's current body temperature is less than or equal to 38°C.","when_to_set_to_null":"Set to null if the patient's current body temperature is unknown or indeterminate.","meaning":"Indicates whether the patient's current body temperature is greater than 38°C."} ;; "body temperature > 38°C"

(define-fun patient_has_abnormal_body_temperature_low_now () Bool
  (< patient_body_temperature_value_recorded_now_withunit_celsius 36)
) ;; {"when_to_set_to_true":"Set to true if the patient's current body temperature is less than 36°C.","when_to_set_to_false":"Set to false if the patient's current body temperature is greater than or equal to 36°C.","when_to_set_to_null":"Set to null if the patient's current body temperature is unknown or indeterminate.","meaning":"Indicates whether the patient's current body temperature is less than 36°C."} ;; "body temperature < 36°C"

(define-fun patient_has_abnormal_heart_rate_high_now () Bool
  (> patient_heart_rate_value_recorded_now_withunit_per_minute 90)
) ;; {"when_to_set_to_true":"Set to true if the patient's current heart rate is greater than 90/min.","when_to_set_to_false":"Set to false if the patient's current heart rate is less than or equal to 90/min.","when_to_set_to_null":"Set to null if the patient's current heart rate is unknown or indeterminate.","meaning":"Indicates whether the patient's current heart rate is greater than 90/min."} ;; "heart rate > 90/min"

(define-fun patient_has_abnormal_respiratory_rate_high_now () Bool
  (> patient_respiratory_rate_value_recorded_now_withunit_per_minute 20)
) ;; {"when_to_set_to_true":"Set to true if the patient's current respiratory rate is greater than 20/min.","when_to_set_to_false":"Set to false if the patient's current respiratory rate is less than or equal to 20/min.","when_to_set_to_null":"Set to null if the patient's current respiratory rate is unknown or indeterminate.","meaning":"Indicates whether the patient's current respiratory rate is greater than 20/min."} ;; "respiratory rate > 20/min"

(define-fun patient_has_abnormal_carbon_dioxide_low_now () Bool
  (and patient_carbon_dioxide_value_recorded_now_withunit_mm_hg@@measured_in_arterial_blood
       (< patient_carbon_dioxide_value_recorded_now_withunit_mm_hg 32))
) ;; {"when_to_set_to_true":"Set to true if the patient's current partial pressure of arterial carbon dioxide (PaCO2) measured in arterial blood is less than 32 mm Hg.","when_to_set_to_false":"Set to false if the patient's current PaCO2 measured in arterial blood is greater than or equal to 32 mm Hg.","when_to_set_to_null":"Set to null if the patient's current PaCO2 or arterial measurement status is unknown or indeterminate.","meaning":"Indicates whether the patient's current PaCO2 measured in arterial blood is less than 32 mm Hg."} ;; "partial pressure of arterial carbon dioxide < 32 mm Hg"

(define-fun patient_has_abnormal_white_blood_cell_count_high_now () Bool
  (> patient_white_blood_cell_count_value_recorded_now_withunit_cells_per_microliter 12000)
) ;; {"when_to_set_to_true":"Set to true if the patient's current white blood cell count is greater than 12,000 cells/μL.","when_to_set_to_false":"Set to false if the patient's current white blood cell count is less than or equal to 12,000 cells/μL.","when_to_set_to_null":"Set to null if the patient's current white blood cell count is unknown or indeterminate.","meaning":"Indicates whether the patient's current white blood cell count is greater than 12,000 cells/μL."} ;; "white blood cell count > 12,000 cells/μL"

(define-fun patient_has_abnormal_white_blood_cell_count_low_now () Bool
  (< patient_white_blood_cell_count_value_recorded_now_withunit_cells_per_microliter 4000)
) ;; {"when_to_set_to_true":"Set to true if the patient's current white blood cell count is less than 4,000 cells/μL.","when_to_set_to_false":"Set to false if the patient's current white blood cell count is greater than or equal to 4,000 cells/μL.","when_to_set_to_null":"Set to null if the patient's current white blood cell count is unknown or indeterminate.","meaning":"Indicates whether the patient's current white blood cell count is less than 4,000 cells/μL."} ;; "white blood cell count < 4,000/μL"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient must NOT have 2 or more of the listed abnormal findings
(assert
(! (not (>=
  (+ (ite patient_has_abnormal_body_temperature_high_now 1 0)
     (ite patient_has_abnormal_body_temperature_low_now 1 0)
     (ite patient_has_abnormal_heart_rate_high_now 1 0)
     (ite patient_has_abnormal_respiratory_rate_high_now 1 0)
     (ite patient_has_abnormal_carbon_dioxide_low_now 1 0)
     (ite patient_has_abnormal_white_blood_cell_count_high_now 1 0)
     (ite patient_has_abnormal_white_blood_cell_count_low_now 1 0))
  2))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has ≥ 2 of the following: (body temperature > 38°C) OR (body temperature < 36°C) OR (heart rate > 90/min) OR (respiratory rate > 20/min) OR (partial pressure of arterial carbon dioxide < 32 mm Hg) OR (white blood cell count > 12,000 cells/μL) OR (white blood cell count < 4,000/μL)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder due to infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder due to infection.","meaning":"Boolean indicating whether the patient currently has a disorder due to infection."} ;; "infection"
(declare-const patient_has_finding_of_disorder_due_to_infection_now@@documented Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder due to infection is documented.","when_to_set_to_false":"Set to false if the patient's current disorder due to infection is not documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disorder due to infection is documented.","meaning":"Boolean indicating whether the patient's current disorder due to infection is documented."} ;; "documented infection"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@documented
       patient_has_finding_of_disorder_due_to_infection_now)
   :named REQ5_AUXILIARY0)) ;; "documented infection"

;; Definition of sepsis as per requirement
(assert
(! (= patient_has_finding_of_sepsis_now
      (and patient_has_finding_of_disorder_due_to_infection_now@@documented
           patient_has_finding_of_systemic_inflammatory_response_syndrome_now))
   :named REQ5_AUXILIARY1)) ;; "sepsis (defined as (documented infection) AND (systemic inflammatory response syndrome))"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_sepsis_now)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has sepsis (defined as (documented infection) AND (systemic inflammatory response syndrome))."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_administration_of_anti_infective_agent_value_recorded_now_withunit_days Real) ;; {"when_to_set_to_value":"Set to the total number of days the patient has received anti-infective therapy up to now.","when_to_set_to_null":"Set to null if the duration of anti-infective therapy received by the patient up to now is unknown or cannot be determined.","meaning":"Numeric value representing the total days of anti-infective therapy received by the patient up to now."} ;; "anti-infective therapy"
(declare-const patient_has_suspicion_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently is suspected to have an infection.","when_to_set_to_false":"Set to false if the patient currently is not suspected to have an infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently is suspected to have an infection.","meaning":"Boolean indicating whether the patient currently is suspected to have an infection."} ;; "suspected infection"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion if patient has received < 2 days of anti-infective therapy for documented infection
(assert
(! (not (and
           (< patient_administration_of_anti_infective_agent_value_recorded_now_withunit_days 2)
           (and patient_has_finding_of_disorder_due_to_infection_now
                patient_has_finding_of_disorder_due_to_infection_now@@documented)))
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received < 2 days of anti-infective therapy for documented infection."

;; Exclusion if patient has received < 2 days of anti-infective therapy for suspected infection
(assert
(! (not (and
           (< patient_administration_of_anti_infective_agent_value_recorded_now_withunit_days 2)
           patient_has_suspicion_of_disorder_due_to_infection_now))
   :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received < 2 days of anti-infective therapy for suspected infection."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_proteinuria_value_recorded_now_withunit_mg_per_day Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's proteinuria in mg/day is recorded now.","when_to_set_to_null":"Set to null if no current measurement of proteinuria in mg/day is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current proteinuria in milligrams per day."} ;; "proteinuria > 500 mg/day"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not (> patient_proteinuria_value_recorded_now_withunit_mg_per_day 500))
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has proteinuria > 500 mg/day."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_hematuria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hematuria.","when_to_set_to_false":"Set to false if the patient currently does not have hematuria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hematuria.","meaning":"Boolean indicating whether the patient currently has hematuria."} ;; "the patient has hematuria"
(declare-const patient_has_finding_of_microscopic_hematuria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of microscopic hematuria.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of microscopic hematuria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of microscopic hematuria.","meaning":"Boolean indicating whether the patient currently has microscopic hematuria."} ;; "the patient has microhematuria"
(declare-const red_blood_cell_count_per_high_power_field_value_recorded_now_withunit_cells_per_hpf Real) ;; {"when_to_set_to_value":"Set to the numeric value of red blood cells per high power field in the patient's urine, recorded now, with unit cells per high power field.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value of red blood cells per high power field in the patient's urine, recorded now, with unit cells per high power field."} ;; "> 50 red blood cells per high power field"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Definition: microhematuria is defined as > 50 red blood cells per high power field
(assert
(! (= patient_has_finding_of_microscopic_hematuria_now
      (> red_blood_cell_count_per_high_power_field_value_recorded_now_withunit_cells_per_hpf 50))
   :named REQ8_AUXILIARY0)) ;; "microhematuria (defined as > 50 red blood cells per high power field)"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion: patient must NOT have hematuria or microhematuria
(assert
(! (not (or patient_has_finding_of_hematuria_now
            patient_has_finding_of_microscopic_hematuria_now))
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has hematuria) OR (the patient has microhematuria (defined as > 50 red blood cells per high power field))."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_urinary_cast_erythrocyte_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of erythrocyte (red blood cell) urinary casts.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of erythrocyte (red blood cell) urinary casts.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of erythrocyte (red blood cell) urinary casts.","meaning":"Boolean indicating whether the patient currently has a finding of erythrocyte (red blood cell) urinary casts."} ;; "red blood cell casts"
(declare-const patient_has_finding_of_urinary_cast_erythrocyte_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the erythrocyte (red blood cell) urinary casts found now are clinically significant.","when_to_set_to_false":"Set to false if the erythrocyte (red blood cell) urinary casts found now are not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the erythrocyte (red blood cell) urinary casts found now are clinically significant.","meaning":"Boolean indicating whether the erythrocyte (red blood cell) urinary casts found now are clinically significant."} ;; "red blood cell casts (clinically significant)"
(declare-const patient_has_finding_of_urinary_cast_granular_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of granular urinary casts.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of granular urinary casts.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of granular urinary casts.","meaning":"Boolean indicating whether the patient currently has a finding of granular urinary casts."} ;; "granular casts"
(declare-const patient_has_finding_of_urinary_cast_granular_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the granular urinary casts found now are clinically significant.","when_to_set_to_false":"Set to false if the granular urinary casts found now are not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the granular urinary casts found now are clinically significant.","meaning":"Boolean indicating whether the granular urinary casts found now are clinically significant."} ;; "granular casts (clinically significant)"
(declare-const patient_has_finding_of_urinary_cast_other_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of other types of urinary casts (excluding granular and erythrocyte casts).","when_to_set_to_false":"Set to false if the patient currently does not have a finding of other types of urinary casts (excluding granular and erythrocyte casts).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of other types of urinary casts (excluding granular and erythrocyte casts).","meaning":"Boolean indicating whether the patient currently has a finding of other types of urinary casts (excluding granular and erythrocyte casts) now."} ;; "other clinically significant casts"
(declare-const patient_has_finding_of_urinary_cast_other_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the other urinary casts found now are clinically significant.","when_to_set_to_false":"Set to false if the other urinary casts found now are not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the other urinary casts found now are clinically significant.","meaning":"Boolean indicating whether the other urinary casts found now are clinically significant."} ;; "other clinically significant casts"
(declare-const patient_has_undergone_urinalysis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone urinalysis now.","when_to_set_to_false":"Set to false if the patient has not undergone urinalysis now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone urinalysis now.","meaning":"Boolean indicating whether the patient has undergone urinalysis now."} ;; "urinalysis"
(declare-const patient_has_undergone_urinalysis_now@@determined_by_urine_sediment_examination Bool) ;; {"when_to_set_to_true":"Set to true if the urinalysis now was determined by urine sediment examination.","when_to_set_to_false":"Set to false if the urinalysis now was not determined by urine sediment examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the urinalysis now was determined by urine sediment examination.","meaning":"Boolean indicating whether the urinalysis now was determined by urine sediment examination."} ;; "as determined by urine sediment examination"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Non-exhaustive examples: granular casts and other clinically significant casts (e.g., red blood cell casts) are examples of clinically significant casts on urinalysis
(assert
(! (=> (or patient_has_finding_of_urinary_cast_granular_now@@clinically_significant
          patient_has_finding_of_urinary_cast_other_now@@clinically_significant)
      (and patient_has_undergone_urinalysis_now@@determined_by_urine_sediment_examination
           ;; umbrella variable for "clinically significant casts on urinalysis" (see below)
           ))
:named REQ9_AUXILIARY0)) ;; "granular casts OR other clinically significant casts (e.g., red blood cell casts) are non-exhaustive examples of clinically significant casts on urinalysis, as determined by urine sediment examination."

;; Non-exhaustive example: red blood cell casts are an example of other clinically significant casts
(assert
(! (=> patient_has_finding_of_urinary_cast_erythrocyte_now@@clinically_significant
      patient_has_finding_of_urinary_cast_other_now@@clinically_significant)
:named REQ9_AUXILIARY1)) ;; "red blood cell casts are a non-exhaustive example of other clinically significant casts"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_urinary_cast_granular_now@@clinically_significant
      patient_has_finding_of_urinary_cast_granular_now)
:named REQ9_AUXILIARY2)) ;; "granular casts (clinically significant) implies granular casts"

(assert
(! (=> patient_has_finding_of_urinary_cast_erythrocyte_now@@clinically_significant
      patient_has_finding_of_urinary_cast_erythrocyte_now)
:named REQ9_AUXILIARY3)) ;; "erythrocyte casts (clinically significant) implies erythrocyte casts"

(assert
(! (=> patient_has_finding_of_urinary_cast_other_now@@clinically_significant
      patient_has_finding_of_urinary_cast_other_now)
:named REQ9_AUXILIARY4)) ;; "other casts (clinically significant) implies other casts"

(assert
(! (=> patient_has_undergone_urinalysis_now@@determined_by_urine_sediment_examination
      patient_has_undergone_urinalysis_now)
:named REQ9_AUXILIARY5)) ;; "urinalysis determined by urine sediment examination implies urinalysis"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Exclusion: patient must NOT have clinically significant casts on urinalysis as determined by urine sediment examination
(assert
(! (not (and patient_has_undergone_urinalysis_now@@determined_by_urine_sediment_examination
             (or patient_has_finding_of_urinary_cast_granular_now@@clinically_significant
                 patient_has_finding_of_urinary_cast_other_now@@clinically_significant)))
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically significant casts on urinalysis with non-exhaustive examples ((granular casts) OR (other clinically significant casts with non-exhaustive examples (red blood cell casts)), as determined by urine sediment examination)."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_intrinsic_renal_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of intrinsic renal disease.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of intrinsic renal disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of intrinsic renal disease.","meaning":"Boolean indicating whether the patient currently has intrinsic renal disease."} ;; "intrinsic renal disease"

(declare-const patient_has_finding_of_disorder_of_renal_parenchyma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of disorder of the renal parenchyma (parenchymal renal disease).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of disorder of the renal parenchyma (parenchymal renal disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of disorder of the renal parenchyma (parenchymal renal disease).","meaning":"Boolean indicating whether the patient currently has a disorder of the renal parenchyma (parenchymal renal disease)."} ;; "parenchymal renal disease"

(declare-const patient_has_finding_of_acute_tubular_necrosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of acute tubular necrosis.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of acute tubular necrosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of acute tubular necrosis.","meaning":"Boolean indicating whether the patient currently has acute tubular necrosis."} ;; "acute tubular necrosis"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Non-exhaustive example: acute tubular necrosis is an example of parenchymal renal disease
(assert
(! (=> patient_has_finding_of_acute_tubular_necrosis_now
      patient_has_finding_of_disorder_of_renal_parenchyma_now)
:named REQ10_AUXILIARY0)) ;; "with non-exhaustive examples (acute tubular necrosis)"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Exclusion: patient must NOT have intrinsic renal disease
(assert
(! (not patient_has_finding_of_intrinsic_renal_disease_now)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of intrinsic renal disease."

;; Exclusion: patient must NOT have parenchymal renal disease
(assert
(! (not patient_has_finding_of_disorder_of_renal_parenchyma_now)
:named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of parenchymal renal disease with non-exhaustive examples (acute tubular necrosis)."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_urinary_tract_obstruction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of obstructive uropathy (urinary tract obstruction).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of obstructive uropathy (urinary tract obstruction).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has obstructive uropathy (urinary tract obstruction).","meaning":"Boolean indicating whether the patient currently has obstructive uropathy (urinary tract obstruction)."} ;; "obstructive uropathy"

(declare-const patient_has_finding_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of kidney disease (renal pathology).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of kidney disease (renal pathology).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has kidney disease (renal pathology).","meaning":"Boolean indicating whether the patient currently has kidney disease (renal pathology)."} ;; "renal pathology"

(declare-const patient_has_finding_of_kidney_disease_now@@detected_on_ultrasound Bool) ;; {"when_to_set_to_true":"Set to true if the patient's kidney disease (renal pathology) is detected on ultrasound.","when_to_set_to_false":"Set to false if the patient's kidney disease (renal pathology) is not detected on ultrasound.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's kidney disease (renal pathology) is detected on ultrasound.","meaning":"Boolean indicating whether the patient's kidney disease (renal pathology) is detected on ultrasound."} ;; "other renal pathology on ultrasound"

(declare-const patient_has_finding_of_kidney_disease_now@@detected_on_other_medical_imaging Bool) ;; {"when_to_set_to_true":"Set to true if the patient's kidney disease (renal pathology) is detected on other medical imaging.","when_to_set_to_false":"Set to false if the patient's kidney disease (renal pathology) is not detected on other medical imaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's kidney disease (renal pathology) is detected on other medical imaging.","meaning":"Boolean indicating whether the patient's kidney disease (renal pathology) is detected on other medical imaging."} ;; "other renal pathology on other medical imaging"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_kidney_disease_now@@detected_on_ultrasound
       patient_has_finding_of_kidney_disease_now)
   :named REQ11_AUXILIARY0)) ;; "other renal pathology on ultrasound"

(assert
(! (=> patient_has_finding_of_kidney_disease_now@@detected_on_other_medical_imaging
       patient_has_finding_of_kidney_disease_now)
   :named REQ11_AUXILIARY1)) ;; "other renal pathology on other medical imaging"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_finding_of_urinary_tract_obstruction_now)
   :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has obstructive uropathy."

(assert
(! (not patient_has_finding_of_kidney_disease_now@@detected_on_ultrasound)
   :named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other renal pathology on ultrasound."

(assert
(! (not patient_has_finding_of_kidney_disease_now@@detected_on_other_medical_imaging)
   :named REQ11_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other renal pathology on other medical imaging."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_is_receiving_treatment_with_nephrotoxic_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving treatment with any nephrotoxic drug (including but not limited to aminoglycoside antibiotics and nonsteroidal anti-inflammatory drugs).","when_to_set_to_false":"Set to false if the patient is not currently receiving treatment with any nephrotoxic drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving treatment with any nephrotoxic drug.","meaning":"Boolean indicating whether the patient is currently receiving treatment with any nephrotoxic drug."} ;; "current treatment with nephrotoxic drugs"
(declare-const patient_is_exposed_to_aminoglycoside_antibacterial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to aminoglycoside antibiotics.","when_to_set_to_false":"Set to false if the patient is not currently exposed to aminoglycoside antibiotics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to aminoglycoside antibiotics.","meaning":"Boolean indicating whether the patient is currently exposed to aminoglycoside antibiotics."} ;; "aminoglycoside antibiotics"
(declare-const patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to nonsteroidal anti-inflammatory drugs.","when_to_set_to_false":"Set to false if the patient is not currently exposed to nonsteroidal anti-inflammatory drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to nonsteroidal anti-inflammatory drugs.","meaning":"Boolean indicating whether the patient is currently exposed to nonsteroidal anti-inflammatory drugs."} ;; "nonsteroidal anti-inflammatory drugs"
(declare-const patient_has_received_treatment_with_nephrotoxic_drug_within_4_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received treatment with any nephrotoxic drug (including but not limited to aminoglycoside antibiotics and nonsteroidal anti-inflammatory drugs) within the past 4 weeks.","when_to_set_to_false":"Set to false if the patient has not received treatment with any nephrotoxic drug within the past 4 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received treatment with any nephrotoxic drug within the past 4 weeks.","meaning":"Boolean indicating whether the patient has received treatment with any nephrotoxic drug within the past 4 weeks."} ;; "recent treatment within 4 weeks with nephrotoxic drugs"
(declare-const patient_has_received_number_of_doses_of_nonsteroidal_anti_inflammatory_drug_within_1_month Real) ;; {"when_to_set_to_value":"Set to the number of doses of nonsteroidal anti-inflammatory drug the patient has received within the prior 1 month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many doses of nonsteroidal anti-inflammatory drug the patient has received within the prior 1 month.","meaning":"Numeric value indicating the number of doses of nonsteroidal anti-inflammatory drug the patient has received within the prior 1 month."} ;; "received up to 3 doses of a nonsteroidal anti-inflammatory drug within the prior month"
(declare-const patient_has_received_short_term_oral_neomycin_for_acute_encephalopathy_within_2_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received short-term (less than 2 weeks) oral neomycin for acute encephalopathy.","when_to_set_to_false":"Set to false if the patient has not received short-term (less than 2 weeks) oral neomycin for acute encephalopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received short-term (less than 2 weeks) oral neomycin for acute encephalopathy.","meaning":"Boolean indicating whether the patient has received short-term (less than 2 weeks) oral neomycin for acute encephalopathy."} ;; "received short-term (less than 2 weeks) oral neomycin for acute encephalopathy"
(declare-const patient_is_taking_neomycin_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a neomycin-containing product.","when_to_set_to_false":"Set to false if the patient is not currently taking a neomycin-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a neomycin-containing product.","meaning":"Boolean indicating whether the patient is currently taking a neomycin-containing product."} ;; "neomycin"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Non-exhaustive examples: aminoglycoside antibiotics and NSAIDs imply nephrotoxic drug exposure
(assert
(! (=> (or patient_is_exposed_to_aminoglycoside_antibacterial_now
           patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_now)
        patient_is_receiving_treatment_with_nephrotoxic_drug_now)
:named REQ12_AUXILIARY0)) ;; "with non-exhaustive examples (aminoglycoside antibiotics, nonsteroidal anti-inflammatory drugs)" for current treatment

;; Non-exhaustive examples: aminoglycoside antibiotics and NSAIDs imply nephrotoxic drug exposure within 4 weeks
(assert
(! (=> (or patient_is_exposed_to_aminoglycoside_antibacterial_now
           patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_now)
        patient_has_received_treatment_with_nephrotoxic_drug_within_4_weeks)
:named REQ12_AUXILIARY1)) ;; "with non-exhaustive examples (aminoglycoside antibiotics, nonsteroidal anti-inflammatory drugs)" for recent treatment

;; ===================== Constraint Assertions (REQ 12) =====================
;; Exclusion: ((current or recent nephrotoxic drug) AND NOT (NSAID ≤ 3 doses in prior month OR short-term neomycin for acute encephalopathy))
(assert
(! (not
      (and
        (or patient_is_receiving_treatment_with_nephrotoxic_drug_now
            patient_has_received_treatment_with_nephrotoxic_drug_within_4_weeks)
        (not
          (or (<= patient_has_received_number_of_doses_of_nonsteroidal_anti_inflammatory_drug_within_1_month 3)
              patient_has_received_short_term_oral_neomycin_for_acute_encephalopathy_within_2_weeks)
        )
      )
   )
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "((the patient has current treatment with nephrotoxic drugs with non-exhaustive examples (aminoglycoside antibiotics, nonsteroidal anti-inflammatory drugs)) OR (the patient has recent treatment within 4 weeks with nephrotoxic drugs with non-exhaustive examples (aminoglycoside antibiotics, nonsteroidal anti-inflammatory drugs))) AND NOT ((the patient has received up to 3 doses of a nonsteroidal anti-inflammatory drug within the prior month) OR (the patient has received short-term (less than 2 weeks) oral neomycin for acute encephalopathy))."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_is_receiving_renal_replacement_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving renal replacement therapy.","when_to_set_to_false":"Set to false if the patient is not currently receiving renal replacement therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving renal replacement therapy.","meaning":"Boolean indicating whether the patient is currently receiving renal replacement therapy."} ;; "the patient has current renal replacement therapy"
(declare-const patient_has_received_renal_replacement_therapy_within_past_4_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received renal replacement therapy within the past 4 weeks.","when_to_set_to_false":"Set to false if the patient has not received renal replacement therapy within the past 4 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received renal replacement therapy within the past 4 weeks.","meaning":"Boolean indicating whether the patient has received renal replacement therapy within the past 4 weeks."} ;; "the patient has recent renal replacement therapy within 4 weeks"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
  (! (not patient_is_receiving_renal_replacement_therapy_now)
     :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current renal replacement therapy."

(assert
  (! (not patient_has_received_renal_replacement_therapy_within_past_4_weeks)
     :named REQ13_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has recent renal replacement therapy within 4 weeks."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_superimposed_acute_liver_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has superimposed acute liver failure.","when_to_set_to_false":"Set to false if the patient currently does not have superimposed acute liver failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has superimposed acute liver failure.","meaning":"Boolean indicating whether the patient currently has superimposed acute liver failure."} ;; "superimposed acute liver failure"

(declare-const patient_has_finding_of_injury_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of injury of liver (liver injury).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of injury of liver (liver injury).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has injury of liver (liver injury).","meaning":"Boolean indicating whether the patient currently has injury of liver (liver injury)."} ;; "liver injury"

(declare-const patient_has_finding_of_injury_of_liver_now@@due_to_factors_other_than_alcoholic_hepatitis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current liver injury is due to factors other than alcoholic hepatitis.","when_to_set_to_false":"Set to false if the patient's current liver injury is due to alcoholic hepatitis or if alcoholic hepatitis cannot be excluded as the cause.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current liver injury is due to factors other than alcoholic hepatitis.","meaning":"Boolean indicating whether the patient's current liver injury is due to factors other than alcoholic hepatitis."} ;; "liver injury due to factors other than alcoholic hepatitis"

(declare-const patient_has_finding_of_acute_liver_injury_now@@due_to_acute_viral_hepatitis Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acute liver injury and the etiology is acute viral hepatitis.","when_to_set_to_false":"Set to false if the patient currently has acute liver injury and the etiology is not acute viral hepatitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current acute liver injury is due to acute viral hepatitis.","meaning":"Boolean indicating whether the patient's current acute liver injury is due to acute viral hepatitis."} ;; "acute liver injury due to acute viral hepatitis"

(declare-const patient_has_finding_of_acute_liver_injury_now@@due_to_drug_or_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acute liver injury and the etiology is drugs or medications.","when_to_set_to_false":"Set to false if the patient currently has acute liver injury and the etiology is not drugs or medications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current acute liver injury is due to drugs or medications.","meaning":"Boolean indicating whether the patient's current acute liver injury is due to drugs or medications."} ;; "acute liver injury due to drugs or medications"

(declare-const patient_has_finding_of_acute_liver_injury_now@@due_to_drug_or_medication@@specifically_due_to_acetaminophen Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current acute liver injury is due to acetaminophen.","when_to_set_to_false":"Set to false if the patient's current acute liver injury is due to drugs or medications other than acetaminophen, or not due to drugs or medications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current acute liver injury is due to acetaminophen.","meaning":"Boolean indicating whether the patient's current acute liver injury is due to acetaminophen."} ;; "acute liver injury due to acetaminophen"

(declare-const patient_has_finding_of_acute_liver_injury_now@@due_to_other_toxins Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acute liver injury and the etiology is other toxins.","when_to_set_to_false":"Set to false if the patient currently has acute liver injury and the etiology is not other toxins.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current acute liver injury is due to other toxins.","meaning":"Boolean indicating whether the patient's current acute liver injury is due to other toxins."} ;; "acute liver injury due to other toxins"

(declare-const patient_has_finding_of_acute_liver_injury_now@@due_to_other_toxins@@specifically_due_to_mushroom_amanita_poisoning Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current acute liver injury is due to mushroom (Amanita) poisoning.","when_to_set_to_false":"Set to false if the patient's current acute liver injury is due to other toxins but not mushroom (Amanita) poisoning, or not due to other toxins.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current acute liver injury is due to mushroom (Amanita) poisoning.","meaning":"Boolean indicating whether the patient's current acute liver injury is due to mushroom (Amanita) poisoning."} ;; "acute liver injury due to mushroom (Amanita) poisoning"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_injury_of_liver_now@@due_to_factors_other_than_alcoholic_hepatitis
      patient_has_finding_of_injury_of_liver_now)
:named REQ14_AUXILIARY0)) ;; "liver injury due to factors other than alcoholic hepatitis"

;; Non-exhaustive examples for factors other than alcoholic hepatitis
(assert
(! (=> (or patient_has_finding_of_acute_liver_injury_now@@due_to_acute_viral_hepatitis
          patient_has_finding_of_acute_liver_injury_now@@due_to_drug_or_medication
          patient_has_finding_of_acute_liver_injury_now@@due_to_other_toxins)
      patient_has_finding_of_injury_of_liver_now@@due_to_factors_other_than_alcoholic_hepatitis)
:named REQ14_AUXILIARY1)) ;; "with non-exhaustive examples (acute viral hepatitis, drugs, medications, other toxins)"

;; Non-exhaustive example: acetaminophen implies drugs/medications
(assert
(! (=> patient_has_finding_of_acute_liver_injury_now@@due_to_drug_or_medication@@specifically_due_to_acetaminophen
      patient_has_finding_of_acute_liver_injury_now@@due_to_drug_or_medication)
:named REQ14_AUXILIARY2)) ;; "medications with non-exhaustive examples (acetaminophen)"

;; Non-exhaustive example: mushroom (Amanita) poisoning implies other toxins
(assert
(! (=> patient_has_finding_of_acute_liver_injury_now@@due_to_other_toxins@@specifically_due_to_mushroom_amanita_poisoning
      patient_has_finding_of_acute_liver_injury_now@@due_to_other_toxins)
:named REQ14_AUXILIARY3)) ;; "other toxins with non-exhaustive examples (mushroom [Amanita] poisoning)"

;; ===================== Constraint Assertions (REQ 14) =====================
;; Exclusion: patient must NOT have superimposed acute liver failure
(assert
(! (not patient_has_finding_of_superimposed_acute_liver_failure_now)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has superimposed acute liver failure."

;; Exclusion: patient must NOT have acute liver injury due to factors other than alcoholic hepatitis (with non-exhaustive examples)
(assert
(! (not patient_has_finding_of_injury_of_liver_now@@due_to_factors_other_than_alcoholic_hepatitis)
:named REQ14_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute liver injury due to factors other than alcoholic hepatitis with non-exhaustive examples (acute viral hepatitis, drugs, medications with non-exhaustive examples (acetaminophen), other toxins with non-exhaustive examples (mushroom [Amanita] poisoning))."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_is_taking_octreotide_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving treatment with an octreotide-containing product.","when_to_set_to_false":"Set to false if the patient is not currently receiving treatment with an octreotide-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving treatment with an octreotide-containing product.","meaning":"Boolean indicating whether the patient is currently taking an octreotide-containing product."} ;; "current treatment with octreotide"
(declare-const patient_is_taking_midodrine_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving treatment with a midodrine-containing product.","when_to_set_to_false":"Set to false if the patient is not currently receiving treatment with a midodrine-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving treatment with a midodrine-containing product.","meaning":"Boolean indicating whether the patient is currently taking a midodrine-containing product."} ;; "current treatment with midodrine"
(declare-const patient_is_taking_vasopressin_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving treatment with a vasopressin-containing product.","when_to_set_to_false":"Set to false if the patient is not currently receiving treatment with a vasopressin-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving treatment with a vasopressin-containing product.","meaning":"Boolean indicating whether the patient is currently taking a vasopressin-containing product."} ;; "current treatment with vasopressin"
(declare-const patient_is_taking_dopamine_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving treatment with a dopamine-containing product.","when_to_set_to_false":"Set to false if the patient is not currently receiving treatment with a dopamine-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving treatment with a dopamine-containing product.","meaning":"Boolean indicating whether the patient is currently taking a dopamine-containing product."} ;; "current treatment with dopamine"
(declare-const patient_is_taking_other_vasopressor_drugs_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving treatment with other vasopressor drugs (not including octreotide, midodrine, vasopressin, or dopamine).","when_to_set_to_false":"Set to false if the patient is not currently receiving treatment with other vasopressor drugs (not including octreotide, midodrine, vasopressin, or dopamine).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving treatment with other vasopressor drugs (not including octreotide, midodrine, vasopressin, or dopamine).","meaning":"Boolean indicating whether the patient is currently receiving treatment with other vasopressor drugs (not including octreotide, midodrine, vasopressin, or dopamine)."} ;; "current treatment with other vasopressor drugs"
(declare-const patient_has_taken_octreotide_containing_product_inthepast48hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received treatment with an octreotide-containing product within the past 48 hours.","when_to_set_to_false":"Set to false if the patient has not received treatment with an octreotide-containing product within the past 48 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received treatment with an octreotide-containing product within the past 48 hours.","meaning":"Boolean indicating whether the patient has taken an octreotide-containing product within the past 48 hours."} ;; "recent treatment within 48 hours with octreotide"
(declare-const patient_has_taken_midodrine_containing_product_inthepast48hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received treatment with a midodrine-containing product within the past 48 hours.","when_to_set_to_false":"Set to false if the patient has not received treatment with a midodrine-containing product within the past 48 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received treatment with a midodrine-containing product within the past 48 hours.","meaning":"Boolean indicating whether the patient has taken a midodrine-containing product within the past 48 hours."} ;; "recent treatment within 48 hours with midodrine"
(declare-const patient_has_taken_vasopressin_containing_product_inthepast48hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received treatment with a vasopressin-containing product within the past 48 hours.","when_to_set_to_false":"Set to false if the patient has not received treatment with a vasopressin-containing product within the past 48 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received treatment with a vasopressin-containing product within the past 48 hours.","meaning":"Boolean indicating whether the patient has taken a vasopressin-containing product within the past 48 hours."} ;; "recent treatment within 48 hours with vasopressin"
(declare-const patient_has_taken_dopamine_containing_product_inthepast48hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received treatment with a dopamine-containing product within the past 48 hours.","when_to_set_to_false":"Set to false if the patient has not received treatment with a dopamine-containing product within the past 48 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received treatment with a dopamine-containing product within the past 48 hours.","meaning":"Boolean indicating whether the patient has taken a dopamine-containing product within the past 48 hours."} ;; "recent treatment within 48 hours with dopamine"
(declare-const patient_has_taken_other_vasopressor_drugs_inthepast48hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received treatment with other vasopressor drugs (not including octreotide, midodrine, vasopressin, or dopamine) within the past 48 hours.","when_to_set_to_false":"Set to false if the patient has not received treatment with other vasopressor drugs (not including octreotide, midodrine, vasopressin, or dopamine) within the past 48 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received treatment with other vasopressor drugs (not including octreotide, midodrine, vasopressin, or dopamine) within the past 48 hours.","meaning":"Boolean indicating whether the patient has received treatment with other vasopressor drugs (not including octreotide, midodrine, vasopressin, or dopamine) within the past 48 hours."} ;; "recent treatment within 48 hours with other vasopressor drugs"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
  (! (not patient_is_taking_octreotide_containing_product_now)
     :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current treatment with octreotide."

(assert
  (! (not patient_is_taking_midodrine_containing_product_now)
     :named REQ15_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current treatment with midodrine."

(assert
  (! (not patient_is_taking_vasopressin_containing_product_now)
     :named REQ15_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current treatment with vasopressin."

(assert
  (! (not patient_is_taking_dopamine_containing_product_now)
     :named REQ15_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current treatment with dopamine."

(assert
  (! (not patient_is_taking_other_vasopressor_drugs_now)
     :named REQ15_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current treatment with other vasopressor drugs."

(assert
  (! (not patient_has_taken_octreotide_containing_product_inthepast48hours)
     :named REQ15_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has recent treatment within 48 hours with octreotide."

(assert
  (! (not patient_has_taken_midodrine_containing_product_inthepast48hours)
     :named REQ15_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has recent treatment within 48 hours with midodrine."

(assert
  (! (not patient_has_taken_vasopressin_containing_product_inthepast48hours)
     :named REQ15_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has recent treatment within 48 hours with vasopressin."

(assert
  (! (not patient_has_taken_dopamine_containing_product_inthepast48hours)
     :named REQ15_COMPONENT8_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has recent treatment within 48 hours with dopamine."

(assert
  (! (not patient_has_taken_other_vasopressor_drugs_inthepast48hours)
     :named REQ15_COMPONENT9_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has recent treatment within 48 hours with other vasopressor drugs."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_finding_of_disorder_of_cardiovascular_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the cardiovascular system (cardiovascular disease).","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the cardiovascular system (cardiovascular disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the cardiovascular system.","meaning":"Boolean indicating whether the patient currently has a disorder of the cardiovascular system (cardiovascular disease)."} ;; "cardiovascular disease"
(declare-const patient_has_finding_of_disorder_of_cardiovascular_system_now@@severity_is_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cardiovascular disease is severe.","when_to_set_to_false":"Set to false if the patient's cardiovascular disease is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cardiovascular disease is severe.","meaning":"Boolean indicating whether the patient's cardiovascular disease is severe."} ;; "severe cardiovascular disease"
(declare-const patient_has_finding_of_disorder_of_cardiovascular_system_now@@severity_judged_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the severity of the patient's cardiovascular disease is judged by the investigator.","when_to_set_to_false":"Set to false if the severity of the patient's cardiovascular disease is not judged by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of the patient's cardiovascular disease is judged by the investigator.","meaning":"Boolean indicating whether the severity of the patient's cardiovascular disease is judged by the investigator."} ;; "as judged by the investigator"

;; ===================== Auxiliary Assertions (REQ 16) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_of_cardiovascular_system_now@@severity_is_severe
      patient_has_finding_of_disorder_of_cardiovascular_system_now)
:named REQ16_AUXILIARY0)) ;; "severe cardiovascular disease"

(assert
(! (=> patient_has_finding_of_disorder_of_cardiovascular_system_now@@severity_judged_by_investigator
      patient_has_finding_of_disorder_of_cardiovascular_system_now)
:named REQ16_AUXILIARY1)) ;; "as judged by the investigator"

;; ===================== Constraint Assertions (REQ 16) =====================
;; Exclusion: patient must NOT have severe cardiovascular disease as judged by the investigator
(assert
(! (not (and patient_has_finding_of_disorder_of_cardiovascular_system_now@@severity_is_severe
             patient_has_finding_of_disorder_of_cardiovascular_system_now@@severity_judged_by_investigator))
   :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe cardiovascular disease as judged by the investigator."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_age_value_recorded_now_in_days Real) ;; {"when_to_set_to_value":"Set to the patient's current age in days if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in days is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in days."} ;; "estimated life expectancy of less than 3 days"
(declare-const patient_longevity_value_recorded_now_withunit_days Real) ;; {"when_to_set_to_value":"Set to the estimated number of days if the patient's life expectancy is assessed and recorded now.","when_to_set_to_null":"Set to null if no estimate of life expectancy in days is available or cannot be determined now.","meaning":"Numeric value representing the patient's estimated life expectancy in days, recorded now."} ;; "life expectancy"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
  (! (not (< patient_longevity_value_recorded_now_withunit_days 3))
     :named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an estimated life expectancy of less than 3 days."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if there is confirmed evidence that the patient is currently pregnant.","when_to_set_to_false":"Set to false if there is confirmed evidence that the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "confirmed pregnancy"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has confirmed pregnancy."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_has_finding_of_allergy_to_terlipressin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergy to terlipressin.","when_to_set_to_false":"Set to false if the patient currently does not have an allergy to terlipressin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to terlipressin.","meaning":"Boolean indicating whether the patient currently has an allergy to terlipressin."} ;; "the patient has a known allergy to terlipressin"
(declare-const patient_has_finding_of_allergy_to_terlipressin_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the allergy to terlipressin is known (documented or reported).","when_to_set_to_false":"Set to false if the allergy to terlipressin is not known (not documented or not reported).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergy to terlipressin is known.","meaning":"Boolean indicating whether the allergy to terlipressin is known."} ;; "the patient has a known allergy to terlipressin"
(declare-const patient_has_finding_of_sensitivity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sensitivity (to any substance).","when_to_set_to_false":"Set to false if the patient currently does not have sensitivity (to any substance).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sensitivity.","meaning":"Boolean indicating whether the patient currently has sensitivity (to any substance)."} ;; "the patient has a known sensitivity to terlipressin" and "the patient has a known sensitivity to another component of the study treatment"
(declare-const patient_has_finding_of_sensitivity_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the sensitivity is known (documented or reported).","when_to_set_to_false":"Set to false if the sensitivity is not known (not documented or not reported).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the sensitivity is known.","meaning":"Boolean indicating whether the sensitivity is known."} ;; "the patient has a known sensitivity to terlipressin" and "the patient has a known sensitivity to another component of the study treatment"
(declare-const patient_has_finding_of_sensitivity_now@@to_terlipressin Bool) ;; {"when_to_set_to_true":"Set to true if the sensitivity is specifically to terlipressin.","when_to_set_to_false":"Set to false if the sensitivity is not to terlipressin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the sensitivity is to terlipressin.","meaning":"Boolean indicating whether the sensitivity is to terlipressin."} ;; "the patient has a known sensitivity to terlipressin"
(declare-const patient_has_finding_of_allergy_to_another_component_of_study_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergy to another component of the study treatment.","when_to_set_to_false":"Set to false if the patient currently does not have an allergy to another component of the study treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to another component of the study treatment.","meaning":"Boolean indicating whether the patient currently has an allergy to another component of the study treatment."} ;; "the patient has a known allergy to another component of the study treatment"
(declare-const patient_has_finding_of_allergy_to_another_component_of_study_treatment_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the allergy to another component of the study treatment is known (documented or reported).","when_to_set_to_false":"Set to false if the allergy to another component of the study treatment is not known (not documented or not reported).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergy to another component of the study treatment is known.","meaning":"Boolean indicating whether the allergy to another component of the study treatment is known."} ;; "the patient has a known allergy to another component of the study treatment"
(declare-const patient_has_finding_of_sensitivity_now@@to_another_component_of_study_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the sensitivity is specifically to another component of the study treatment.","when_to_set_to_false":"Set to false if the sensitivity is not to another component of the study treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the sensitivity is to another component of the study treatment.","meaning":"Boolean indicating whether the sensitivity is to another component of the study treatment."} ;; "the patient has a known sensitivity to another component of the study treatment"

;; ===================== Auxiliary Assertions (REQ 19) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_allergy_to_terlipressin_now@@known
       patient_has_finding_of_allergy_to_terlipressin_now)
:named REQ19_AUXILIARY0)) ;; "the patient has a known allergy to terlipressin"

(assert
(! (=> (and patient_has_finding_of_sensitivity_now@@known
            patient_has_finding_of_sensitivity_now@@to_terlipressin)
       patient_has_finding_of_sensitivity_now)
:named REQ19_AUXILIARY1)) ;; "the patient has a known sensitivity to terlipressin"

(assert
(! (=> patient_has_finding_of_allergy_to_another_component_of_study_treatment_now@@known
       patient_has_finding_of_allergy_to_another_component_of_study_treatment_now)
:named REQ19_AUXILIARY2)) ;; "the patient has a known allergy to another component of the study treatment"

(assert
(! (=> (and patient_has_finding_of_sensitivity_now@@known
            patient_has_finding_of_sensitivity_now@@to_another_component_of_study_treatment)
       patient_has_finding_of_sensitivity_now)
:named REQ19_AUXILIARY3)) ;; "the patient has a known sensitivity to another component of the study treatment"

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not patient_has_finding_of_allergy_to_terlipressin_now@@known)
:named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has a known allergy to terlipressin"

(assert
(! (not (and patient_has_finding_of_sensitivity_now@@known
             patient_has_finding_of_sensitivity_now@@to_terlipressin))
:named REQ19_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has a known sensitivity to terlipressin"

(assert
(! (not patient_has_finding_of_allergy_to_another_component_of_study_treatment_now@@known)
:named REQ19_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient has a known allergy to another component of the study treatment"

(assert
(! (not (and patient_has_finding_of_sensitivity_now@@known
             patient_has_finding_of_sensitivity_now@@to_another_component_of_study_treatment))
:named REQ19_COMPONENT3_OTHER_REQUIREMENTS)) ;; "the patient has a known sensitivity to another component of the study treatment"

;; ===================== Declarations for the exclusion criterion (REQ 20) =====================
(declare-const patient_has_participated_in_clinical_research_study_in_the_past_30_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in any clinical research study within the past 30 days prior to randomization.","when_to_set_to_false":"Set to false if the patient has not participated in any clinical research study within the past 30 days prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in any clinical research study within the past 30 days prior to randomization.","meaning":"Boolean indicating whether the patient has participated in any clinical research study within the past 30 days prior to randomization."} ;; "has participated in other clinical research studies ... within thirty days prior to randomization"

(declare-const patient_has_participated_in_clinical_research_study_in_the_past_30_days@@involving_evaluation_of_other_investigational_drugs_or_investigational_devices Bool) ;; {"when_to_set_to_true":"Set to true if the clinical research study the patient participated in within the past 30 days involved the evaluation of other investigational drugs or investigational devices.","when_to_set_to_false":"Set to false if the clinical research study the patient participated in within the past 30 days did not involve the evaluation of other investigational drugs or investigational devices.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clinical research study the patient participated in within the past 30 days involved the evaluation of other investigational drugs or investigational devices.","meaning":"Boolean indicating whether the clinical research study the patient participated in within the past 30 days involved the evaluation of other investigational drugs or investigational devices."} ;; "involving the evaluation of other investigational drugs OR investigational devices within thirty days prior to randomization"

(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to any drug or medicament within the past 30 days prior to randomization.","when_to_set_to_false":"Set to false if the patient was not exposed to any drug or medicament within the past 30 days prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to any drug or medicament within the past 30 days prior to randomization.","meaning":"Boolean indicating whether the patient was exposed to any drug or medicament in the past 30 days."} ;; "other investigational drugs"

;; ===================== Auxiliary Assertions (REQ 20) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_participated_in_clinical_research_study_in_the_past_30_days@@involving_evaluation_of_other_investigational_drugs_or_investigational_devices
      patient_has_participated_in_clinical_research_study_in_the_past_30_days)
:named REQ20_AUXILIARY0)) ;; "involving the evaluation of other investigational drugs OR investigational devices within thirty days prior to randomization"

;; ===================== Constraint Assertions (REQ 20) =====================
(assert
(! (not patient_has_participated_in_clinical_research_study_in_the_past_30_days@@involving_evaluation_of_other_investigational_drugs_or_investigational_devices)
:named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has participated in other clinical research studies involving the evaluation of other investigational drugs OR investigational devices within thirty days prior to randomization."
