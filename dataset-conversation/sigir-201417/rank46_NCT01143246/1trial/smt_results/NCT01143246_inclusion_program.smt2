;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_written_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent.","meaning":"Boolean indicating whether the patient currently has provided written informed consent."} // "provided written informed consent"
(declare-const written_informed_consent_provided_by_legally_authorized_representative_now Bool) ;; {"when_to_set_to_true":"Set to true if written informed consent has been provided by a legally authorized representative for the patient.","when_to_set_to_false":"Set to false if written informed consent has not been provided by a legally authorized representative for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether written informed consent has been provided by a legally authorized representative for the patient.","meaning":"Boolean indicating whether written informed consent has been provided by a legally authorized representative for the patient."} // "written informed consent provided by a legally authorized representative"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must have (provided written informed consent) OR (have written informed consent provided by a legally authorized representative).
(assert
  (! (or patient_has_written_informed_consent_now
         written_informed_consent_provided_by_legally_authorized_representative_now)
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have (provided written informed consent) OR (have written informed consent provided by a legally authorized representative)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (aged ≥ 18 years)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_cirrhosis_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cirrhosis of the liver.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cirrhosis of the liver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cirrhosis of the liver.","meaning":"Boolean indicating whether the patient currently has cirrhosis of the liver."} // "cirrhosis"
(declare-const patient_has_finding_of_ascites_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of ascites.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of ascites.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ascites.","meaning":"Boolean indicating whether the patient currently has ascites."} // "ascites"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have cirrhosis.
(assert
  (! patient_has_finding_of_cirrhosis_of_liver_now
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (cirrhosis)."

;; Component 1: To be included, the patient must have ascites.
(assert
  (! patient_has_finding_of_ascites_now
     :named REQ2_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (ascites)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_exposed_to_albumin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to albumin.","when_to_set_to_false":"Set to false if the patient is currently not exposed to albumin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to albumin.","meaning":"Boolean indicating whether the patient is currently exposed to albumin."} // "albumin"
(declare-const patient_renal_function_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of renal function is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's renal function measured now."} // "renal function"
(declare-const patient_serum_creatinine_level_finding_value_recorded_inthepast2weeks_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of serum creatinine concentration in mg/dL is recorded within the past 2 weeks.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's serum creatinine concentration measured within the past 2 weeks in mg/dL."} // "serum creatinine concentration ≥ 2.5 mg/dL"
(declare-const patient_serum_creatinine_level_finding_value_recorded_inthepast48hours_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of serum creatinine concentration in mg/dL is recorded within the past 48 hours.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's serum creatinine concentration measured within the past 48 hours in mg/dL."} // "serum creatinine concentration measured within the past 48 hours"
(declare-const patient_serum_creatinine_level_finding_value_recorded_inthepast48hours_withunit_mg_per_dl@@temporalcontext_within48hours_after_diuretic_withdrawal_and_plasma_volume_expansion_with_albumin Bool) ;; {"when_to_set_to_true":"Set to true if the measurement was taken within 48 hours after both diuretic withdrawal and the beginning of plasma volume expansion with albumin.","when_to_set_to_false":"Set to false if the measurement was not taken within this temporal context.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was taken within this temporal context.","meaning":"Boolean indicating whether the serum creatinine measurement was taken within 48 hours after both diuretic withdrawal and plasma volume expansion with albumin."} // "48 hours after both diuretic withdrawal AND the beginning of plasma volume expansion with albumin"
(declare-const patient_serum_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of serum creatinine concentration in mg/dL is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's serum creatinine concentration measured now in mg/dL."} // "serum creatinine concentration measured now"
(declare-const patient_serum_creatinine_level_finding_value_recorded_over_time_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured values if numeric measurements of serum creatinine concentration in mg/dL are recorded at multiple time points over a defined observation period.","when_to_set_to_null":"Set to null if no such measurements are available or the values are indeterminate.","meaning":"Numeric values representing the patient's serum creatinine concentration measured at multiple time points over a defined observation period, in mg/dL."} // "serum creatinine concentration measured at multiple time points over a defined observation period"
(declare-const patient_serum_creatinine_slope_value_over_time_withunit_mg_per_dl_per_day Real) ;; {"when_to_set_to_value":"Set to the calculated value if the slope of serum creatinine concentration over time in mg/dL per day can be determined from available measurements.","when_to_set_to_null":"Set to null if the slope cannot be calculated or is indeterminate due to insufficient data.","meaning":"Numeric value representing the slope of the patient's serum creatinine concentration over time, in mg/dL per day."} // "slope-based criteria for proportional increases likely to be representative of at least a doubling within 2 weeks"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding temporal context for 48h creatinine measurement
(assert
  (! (=> patient_serum_creatinine_level_finding_value_recorded_inthepast48hours_withunit_mg_per_dl@@temporalcontext_within48hours_after_diuretic_withdrawal_and_plasma_volume_expansion_with_albumin
        true)
     :named REQ3_AUXILIARY0)) ;; "serum creatinine measured within 48 hours after both diuretic withdrawal AND plasma volume expansion with albumin"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: rapidly progressive reduction in renal function characterized by:
;; (1) serum creatinine concentration ≥ 2.5 mg/dL
(assert
  (! (>= patient_serum_creatinine_level_finding_value_recorded_inthepast2weeks_withunit_mg_per_dl 2.5)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "serum creatinine concentration ≥ 2.5 mg/dL"

;; (2) doubling of serum creatinine concentration within 2 weeks OR slope-based criteria for proportional increases likely to be representative of at least a doubling within 2 weeks
(assert
  (! (or
        (>= patient_serum_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl
            (* 2.0 patient_serum_creatinine_level_finding_value_recorded_inthepast2weeks_withunit_mg_per_dl))
        (>= patient_serum_creatinine_slope_value_over_time_withunit_mg_per_dl_per_day
            (/ (- patient_serum_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl
                  patient_serum_creatinine_level_finding_value_recorded_inthepast2weeks_withunit_mg_per_dl)
               14.0)))
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "doubling of serum creatinine concentration within 2 weeks OR slope-based criteria for proportional increases likely to be representative of at least a doubling within 2 weeks"

;; (3) no sustained improvement in renal function defined as < 20% decrease in serum creatinine AND serum creatinine ≥ 2.25 mg/dL 48 hours after both diuretic withdrawal AND plasma volume expansion with albumin
(assert
  (! (and
        (< (- patient_serum_creatinine_level_finding_value_recorded_inthepast2weeks_withunit_mg_per_dl
              patient_serum_creatinine_level_finding_value_recorded_inthepast48hours_withunit_mg_per_dl)
           (* 0.2 patient_serum_creatinine_level_finding_value_recorded_inthepast2weeks_withunit_mg_per_dl))
        (>= patient_serum_creatinine_level_finding_value_recorded_inthepast48hours_withunit_mg_per_dl 2.25)
        patient_serum_creatinine_level_finding_value_recorded_inthepast48hours_withunit_mg_per_dl@@temporalcontext_within48hours_after_diuretic_withdrawal_and_plasma_volume_expansion_with_albumin)
     :named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "no sustained improvement in renal function defined as < 20% decrease in serum creatinine AND serum creatinine ≥ 2.25 mg/dL 48 hours after both diuretic withdrawal AND plasma volume expansion with albumin"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const albumin_dose_administered_daily_value_in_grams Real) ;; {"when_to_set_to_value":"Set to the numeric value of the daily albumin dose administered to the patient after the first day, in grams.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the daily albumin dose administered after the first day was.","meaning":"Numeric value indicating the daily dose of albumin administered to the patient after the first day, in grams."} // "20 - 40 g/day thereafter as clinically indicated"
(declare-const albumin_dose_administered_daily_value_in_grams@@as_clinically_indicated Real) ;; {"when_to_set_to_value":"Set to the numeric value of the daily albumin dose administered after the first day, in grams, as clinically indicated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the daily albumin dose administered as clinically indicated was.","meaning":"Numeric value indicating the daily dose of albumin administered to the patient after the first day, in grams, as clinically indicated."} // "20 - 40 g/day thereafter as clinically indicated"
(declare-const albumin_dose_administered_on_first_day_value_in_grams Real) ;; {"when_to_set_to_value":"Set to the numeric value of the total albumin dose administered to the patient on the first day, in grams.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the total albumin dose administered on the first day was.","meaning":"Numeric value indicating the total dose of albumin administered to the patient on the first day, in grams."} // "1 g/kg on the first day (maximum 100 g)"
(declare-const albumin_dose_administered_on_first_day_value_in_grams@@per_kg_body_weight Real) ;; {"when_to_set_to_value":"Set to the numeric value of the albumin dose administered on the first day per kilogram of body weight, in grams/kg.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the albumin dose per kilogram of body weight was on the first day.","meaning":"Numeric value indicating the total dose of albumin administered to the patient on the first day, in grams, per kilogram of body weight."} // "1 g/kg on the first day"
(declare-const albumin_dose_kept_constant_during_study_drug_administration_period Bool) ;; {"when_to_set_to_true":"Set to true if the albumin dose is kept constant during the study drug administration period.","when_to_set_to_false":"Set to false if the albumin dose is not kept constant during the study drug administration period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the albumin dose is kept constant during the study drug administration period.","meaning":"Boolean indicating whether the albumin dose is kept constant during the study drug administration period."} // "albumin dose is kept constant during the study drug administration period"
(declare-const albumin_dose_kept_constant_during_study_drug_administration_period@@if_clinically_appropriate Bool) ;; {"when_to_set_to_true":"Set to true if the albumin dose is kept constant during the study drug administration period and it is clinically appropriate to do so.","when_to_set_to_false":"Set to false if the albumin dose is not kept constant during the study drug administration period when it would be clinically appropriate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the albumin dose is kept constant during the study drug administration period when clinically appropriate.","meaning":"Boolean indicating whether the albumin dose is kept constant during the study drug administration period, if clinically appropriate."} // "it is recommended (if clinically appropriate) that the albumin dose is kept constant during the study drug administration period"
(declare-const patient_is_exposed_to_albumin_now@@dose_kept_constant_during_study_drug_administration_if_clinically_appropriate Bool) ;; {"when_to_set_to_true":"Set to true if the patient's albumin dose is kept constant during the study drug administration period and it is clinically appropriate to do so.","when_to_set_to_false":"Set to false if the patient's albumin dose is not kept constant during the study drug administration period when it would be clinically appropriate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the albumin dose is kept constant during the study drug administration period when clinically appropriate.","meaning":"Boolean indicating whether the patient's albumin dose is kept constant during the study drug administration period if clinically appropriate."} // "it is recommended (if clinically appropriate) that the albumin dose is kept constant during the study drug administration period"
(declare-const patient_is_exposed_to_albumin_now@@dosing_per_international_ascites_club_recommendations Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current albumin exposure follows the International Ascites Club recommendations for dosing and timing (1 g/kg on the first day, maximum 100 g; 20-40 g/day thereafter as clinically indicated).","when_to_set_to_false":"Set to false if the patient's current albumin exposure does not follow these recommendations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's albumin dosing and timing follow the International Ascites Club recommendations.","meaning":"Boolean indicating whether the patient's current albumin exposure follows the International Ascites Club recommendations for dosing and timing."} // "albumin doses recommended by the International Ascites Club: 1 g/kg on the first day (maximum 100 g) and 20 - 40 g/day thereafter as clinically indicated"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition: albumin dosing per International Ascites Club recommendations
(assert
  (! (= patient_is_exposed_to_albumin_now@@dosing_per_international_ascites_club_recommendations
        (and
          (and (>= albumin_dose_administered_on_first_day_value_in_grams@@per_kg_body_weight 1.0)
               (<= albumin_dose_administered_on_first_day_value_in_grams 100.0))
          (and (>= albumin_dose_administered_daily_value_in_grams@@as_clinically_indicated 20.0)
               (<= albumin_dose_administered_daily_value_in_grams@@as_clinically_indicated 40.0))))
     :named REQ4_AUXILIARY0)) ;; "albumin doses recommended by the International Ascites Club: 1 g/kg on the first day (maximum 100 g) and 20 - 40 g/day thereafter as clinically indicated"

;; Definition: dose kept constant during study drug administration period if clinically appropriate
(assert
  (! (= patient_is_exposed_to_albumin_now@@dose_kept_constant_during_study_drug_administration_if_clinically_appropriate
        albumin_dose_kept_constant_during_study_drug_administration_period@@if_clinically_appropriate)
     :named REQ4_AUXILIARY1)) ;; "it is recommended (if clinically appropriate) that the albumin dose is kept constant during the study drug administration period"

;; Qualifier variable implies stem variable
(assert
  (! (=> albumin_dose_kept_constant_during_study_drug_administration_period@@if_clinically_appropriate
         albumin_dose_kept_constant_during_study_drug_administration_period)
     :named REQ4_AUXILIARY2)) ;; "if clinically appropriate"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Inclusion: patient must have received albumin doses per International Ascites Club recommendations AND (if clinically appropriate) dose kept constant during study drug administration period
(assert
  (! (and patient_is_exposed_to_albumin_now@@dosing_per_international_ascites_club_recommendations
          (or (not albumin_dose_kept_constant_during_study_drug_administration_period@@if_clinically_appropriate)
              patient_is_exposed_to_albumin_now@@dose_kept_constant_during_study_drug_administration_if_clinically_appropriate))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have received albumin doses recommended by the International Ascites Club: 1 g/kg on the first day (maximum 100 g) and 20 - 40 g/day thereafter as clinically indicated, and it is recommended (if clinically appropriate) that the albumin dose is kept constant during the study drug administration period."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_serum_creatinine_level_finding_value_recorded_pre_albumin_fluid_challenge_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if a serum creatinine concentration in mg/dL was recorded prior to the beginning of albumin fluid challenge.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's serum creatinine concentration measured prior to the beginning of albumin fluid challenge, in mg/dL."} // "serum creatinine concentration measured prior to the beginning of albumin fluid challenge"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 1: The qualifying serum creatinine concentration value must be ≥ 2.25 mg/dL.
(assert
  (! (>= patient_serum_creatinine_level_finding_value_recorded_inthepast48hours_withunit_mg_per_dl 2.25)
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the qualifying serum creatinine concentration value must be ≥ 2.25 mg/dL"

;; Component 2: The qualifying serum creatinine concentration value must be ≥ 80% of the diagnostic (pre-fluid challenge) serum creatinine concentration value.
(assert
  (! (>= patient_serum_creatinine_level_finding_value_recorded_inthepast48hours_withunit_mg_per_dl
         (* 0.8 patient_serum_creatinine_level_finding_value_recorded_pre_albumin_fluid_challenge_withunit_mg_per_dl))
     :named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the qualifying serum creatinine concentration value must be ≥ 80% of the diagnostic (pre-fluid challenge) serum creatinine concentration value"

;; Component 0: The qualifying serum creatinine concentration value is the value at least 48 hours after both diuretic withdrawal (if applicable) AND the beginning of albumin fluid challenge.
(assert
  (! patient_serum_creatinine_level_finding_value_recorded_inthepast48hours_withunit_mg_per_dl@@temporalcontext_within48hours_after_diuretic_withdrawal_and_plasma_volume_expansion_with_albumin
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "serum creatinine concentration value at least 48 hours after both diuretic withdrawal (if applicable) AND the beginning of albumin fluid challenge"
