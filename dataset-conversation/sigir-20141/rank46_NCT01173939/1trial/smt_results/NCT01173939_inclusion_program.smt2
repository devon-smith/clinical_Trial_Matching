;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_given_voluntary_written_consent_for_study_participation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has given voluntary written consent to participate in the study.","when_to_set_to_false":"Set to false if the patient has not given voluntary written consent to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has given voluntary written consent to participate in the study.","meaning":"Boolean indicating whether the patient has given voluntary written consent to participate in the study."} // "To be included, the patient must give voluntary written consent to participate in the study."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_given_voluntary_written_consent_for_study_participation
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must give voluntary written consent to participate in the study."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently female."} // "male or female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently male."} // "male or female"
(declare-const patient_age_value_recorded_at_time_of_informed_consent_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's age in years at the time informed consent is obtained if it is known and documented.","when_to_set_to_null":"Set to null if the patient's age in years at the time of informed consent is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's age in years at the time informed consent is obtained."} // "50 years of age or older at the time of informed consent."
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "50 years of age or older at the time of informed consent."

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: The patient must be male or female.
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male or female."

;; Component 1: The patient must be 50 years of age or older at the time of informed consent.
(assert
  (! (>= patient_age_value_recorded_at_time_of_informed_consent_in_years 50)
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be 50 years of age or older at the time of informed consent."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_hypercholesterolemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypercholesterolemia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypercholesterolemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypercholesterolemia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypercholesterolemia."} // "To be included, the patient must have hypercholesterolemia, defined as either: (if untreated, low-density lipoprotein cholesterol level ≥ 140 milligrams per deciliter) OR (if treated, low-density lipoprotein cholesterol level ≤ 120 milligrams per deciliter)."
(declare-const patient_low_density_lipoprotein_cholesterol_measurement_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current LDL cholesterol measurement in milligrams per deciliter is available and measured now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current LDL cholesterol measurement in milligrams per deciliter."} // "low-density lipoprotein cholesterol level"
(declare-const patient_low_density_lipoprotein_cholesterol_measurement_value_recorded_now_withunit_milligrams_per_deciliter@@measured_in_untreated_patient Bool) ;; {"when_to_set_to_true":"Set to true if the LDL cholesterol measurement was obtained when the patient was untreated (not receiving lipid-lowering therapy).","when_to_set_to_false":"Set to false if the LDL cholesterol measurement was obtained when the patient was treated (receiving lipid-lowering therapy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was obtained in the untreated state.","meaning":"Boolean indicating whether the LDL cholesterol measurement was obtained in the untreated state."} // "if untreated, low-density lipoprotein cholesterol level ≥ 140 milligrams per deciliter"
(declare-const patient_low_density_lipoprotein_cholesterol_measurement_value_recorded_now_withunit_milligrams_per_deciliter@@measured_in_treated_patient Bool) ;; {"when_to_set_to_true":"Set to true if the LDL cholesterol measurement was obtained when the patient was treated (receiving lipid-lowering therapy).","when_to_set_to_false":"Set to false if the LDL cholesterol measurement was obtained when the patient was untreated (not receiving lipid-lowering therapy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was obtained in the treated state.","meaning":"Boolean indicating whether the LDL cholesterol measurement was obtained in the treated state."} // "if treated, low-density lipoprotein cholesterol level ≤ 120 milligrams per deciliter"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply the existence of a measurement
(assert
  (! (=> patient_low_density_lipoprotein_cholesterol_measurement_value_recorded_now_withunit_milligrams_per_deciliter@@measured_in_untreated_patient
         true)
     :named REQ2_AUXILIARY0)) ;; "if untreated, low-density lipoprotein cholesterol level ≥ 140 milligrams per deciliter"

(assert
  (! (=> patient_low_density_lipoprotein_cholesterol_measurement_value_recorded_now_withunit_milligrams_per_deciliter@@measured_in_treated_patient
         true)
     :named REQ2_AUXILIARY1)) ;; "if treated, low-density lipoprotein cholesterol level ≤ 120 milligrams per deciliter"

;; ===================== Auxiliary Assertion: Definition of hypercholesterolemia per requirement
(assert
  (! (= patient_has_diagnosis_of_hypercholesterolemia_now
        (or
          (and patient_low_density_lipoprotein_cholesterol_measurement_value_recorded_now_withunit_milligrams_per_deciliter@@measured_in_untreated_patient
               (>= patient_low_density_lipoprotein_cholesterol_measurement_value_recorded_now_withunit_milligrams_per_deciliter 140.0))
          (and patient_low_density_lipoprotein_cholesterol_measurement_value_recorded_now_withunit_milligrams_per_deciliter@@measured_in_treated_patient
               (<= patient_low_density_lipoprotein_cholesterol_measurement_value_recorded_now_withunit_milligrams_per_deciliter 120.0))))
     :named REQ2_AUXILIARY2)) ;; "hypercholesterolemia, defined as either: (if untreated, LDL ≥ 140 mg/dL) OR (if treated, LDL ≤ 120 mg/dL)"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_diagnosis_of_hypercholesterolemia_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have hypercholesterolemia, defined as either: (if untreated, low-density lipoprotein cholesterol level ≥ 140 milligrams per deciliter) OR (if treated, low-density lipoprotein cholesterol level ≤ 120 milligrams per deciliter)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_type_2_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of type 2 diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of type 2 diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of type 2 diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of type 2 diabetes mellitus."} // "type 2 diabetes"
(declare-const patient_has_undergone_drug_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone drug therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone drug therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone drug therapy.","meaning":"Boolean indicating whether the patient has undergone drug therapy at any time in the past."} // "drug therapy"
(declare-const patient_hemoglobin_a1c_measurement_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current hemoglobin A1c level (percent) is available and measured now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current hemoglobin A1c level in percent."} // "hemoglobin A1c level"
(declare-const patient_hemoglobin_a1c_measurement_value_recorded_now_withunit_percent@@measured_according_to_japan_diabetes_society_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hemoglobin A1c measurement is performed according to Japan Diabetes Society criteria.","when_to_set_to_false":"Set to false if the measurement is not performed according to Japan Diabetes Society criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was performed according to Japan Diabetes Society criteria.","meaning":"Boolean indicating whether the hemoglobin A1c measurement was performed according to Japan Diabetes Society criteria."} // "hemoglobin A1c level ≥ 6.1 percent (Japan Diabetes Society criteria)"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_hemoglobin_a1c_measurement_value_recorded_now_withunit_percent@@measured_according_to_japan_diabetes_society_criteria
         (>= patient_hemoglobin_a1c_measurement_value_recorded_now_withunit_percent 0.0))
     :named REQ3_AUXILIARY0)) ;; "hemoglobin A1c measurement is performed according to Japan Diabetes Society criteria" implies a value is present

;; Definition: diagnosis of type 2 diabetes mellitus (per requirement) is equivalent to hemoglobin A1c ≥ 6.1% (Japan Diabetes Society criteria)
(assert
  (! (= patient_has_diagnosis_of_type_2_diabetes_mellitus_now
        (and patient_hemoglobin_a1c_measurement_value_recorded_now_withunit_percent@@measured_according_to_japan_diabetes_society_criteria
             (>= patient_hemoglobin_a1c_measurement_value_recorded_now_withunit_percent 6.1)))
     :named REQ3_AUXILIARY1)) ;; "type 2 diabetes (defined as hemoglobin A1c level ≥ 6.1 percent (Japan Diabetes Society criteria))"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_diagnosis_of_type_2_diabetes_mellitus_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have type 2 diabetes (defined as hemoglobin A1c level ≥ 6.1 percent (Japan Diabetes Society criteria), with or without history of drug therapy)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypertensive disorder (hypertension)."} // "To be included, the patient must have hypertension (defined as (systolic blood pressure ≥ 130 millimeters of mercury OR diastolic blood pressure ≥ 80 millimeters of mercury), with or without history of drug therapy)."
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current systolic blood pressure in millimeters of mercury is available.","when_to_set_to_null":"Set to null if no current systolic blood pressure measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current systolic blood pressure in millimeters of mercury."} // "systolic blood pressure ≥ 130 millimeters of mercury"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current diastolic blood pressure in millimeters of mercury is available.","when_to_set_to_null":"Set to null if no current diastolic blood pressure measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current diastolic blood pressure in millimeters of mercury."} // "diastolic blood pressure ≥ 80 millimeters of mercury"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Hypertension is defined as (systolic BP ≥ 130 mmHg OR diastolic BP ≥ 80 mmHg)
(assert
  (! (= patient_has_diagnosis_of_hypertensive_disorder_now
        (or (>= patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 130.0)
            (>= patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 80.0)))
     :named REQ4_AUXILIARY0)) ;; "defined as (systolic blood pressure ≥ 130 millimeters of mercury OR diastolic blood pressure ≥ 80 millimeters of mercury)"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_diagnosis_of_hypertensive_disorder_now
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have hypertension (defined as (systolic blood pressure ≥ 130 millimeters of mercury OR diastolic blood pressure ≥ 80 millimeters of mercury), with or without history of drug therapy)."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a smoker.","when_to_set_to_false":"Set to false if the patient is currently not a smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a smoker.","meaning":"Boolean indicating whether the patient is currently a smoker."} // "smoker"
(declare-const patient_cholesterol_hdl_ratio_measurement_value_recorded_now_withunit_ratio Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's LDL/HDL cholesterol ratio is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current LDL/HDL cholesterol ratio."} // "low-density lipoprotein cholesterol/high-density lipoprotein cholesterol ratio ≥ 3.0"
(declare-const patient_has_finding_of_first_degree_family_history_of_major_adverse_cardiac_events_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a first-degree family history of major adverse cardiac events.","when_to_set_to_false":"Set to false if the patient currently does not have a first-degree family history of major adverse cardiac events.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a first-degree family history of major adverse cardiac events.","meaning":"Boolean indicating whether the patient currently has a first-degree family history of major adverse cardiac events."} // "first-degree family history of major adverse cardiac events"
(declare-const patient_has_finding_of_second_degree_family_history_of_major_adverse_cardiac_events_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a second-degree family history of major adverse cardiac events.","when_to_set_to_false":"Set to false if the patient currently does not have a second-degree family history of major adverse cardiac events.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a second-degree family history of major adverse cardiac events.","meaning":"Boolean indicating whether the patient currently has a second-degree family history of major adverse cardiac events."} // "second-degree family history of major adverse cardiac events"
(declare-const patient_microalbuminuria_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's microalbuminuria quantitative test result is recorded now in milligrams per deciliter.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current microalbuminuria quantitative test result in milligrams per deciliter."} // "microalbuminuria (quantitative testing: ≥ 30 milligrams per deciliter)"
(declare-const patient_has_finding_of_proteinuria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has proteinuria as determined by qualitative testing (positive or higher).","when_to_set_to_false":"Set to false if the patient currently does not have proteinuria as determined by qualitative testing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has proteinuria.","meaning":"Boolean indicating whether the patient currently has proteinuria as determined by qualitative testing."} // "proteinuria (qualitative testing: positive or higher)"
(declare-const patient_glomerular_filtration_rate_value_recorded_now_withunit_milliliters_per_minute_per_1_73_square_meters Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's estimated glomerular filtration rate is recorded now in milliliters per minute per 1.73 square meters.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current estimated glomerular filtration rate in milliliters per minute per 1.73 square meters."} // "estimated glomerular filtration rate < 60 milliliters per minute per 1.73 square meters."

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definition: patient is aged 65 years or older
(define-fun patient_is_aged_65_years_or_older_now () Bool
  (>= patient_age_value_recorded_now_in_years 65.0)) ;; "aged 65 years or older"

;; Definition: LDL/HDL ratio risk factor
(define-fun patient_has_ldl_hdl_ratio_risk_factor_now () Bool
  (>= patient_cholesterol_hdl_ratio_measurement_value_recorded_now_withunit_ratio 3.0)) ;; "low-density lipoprotein cholesterol/high-density lipoprotein cholesterol ratio ≥ 3.0"

;; Definition: Hemoglobin A1c risk factor
(define-fun patient_has_hemoglobin_a1c_risk_factor_now () Bool
  (>= patient_hemoglobin_a1c_measurement_value_recorded_now_withunit_percent 8.0)) ;; "hemoglobin A1c level ≥ 8.0 percent"

;; Definition: Microalbuminuria risk factor
(define-fun patient_has_microalbuminuria_risk_factor_now () Bool
  (>= patient_microalbuminuria_value_recorded_now_withunit_milligrams_per_deciliter 30.0)) ;; "microalbuminuria (quantitative testing: ≥ 30 milligrams per deciliter)"

;; Definition: Glomerular filtration rate risk factor
(define-fun patient_has_gfr_risk_factor_now () Bool
  (< patient_glomerular_filtration_rate_value_recorded_now_withunit_milliliters_per_minute_per_1_73_square_meters 60.0)) ;; "estimated glomerular filtration rate < 60 milliliters per minute per 1.73 square meters."

;; Count the number of risk factors present
(define-fun patient_risk_factor_count_now () Int
  (+ (ite patient_is_aged_65_years_or_older_now 1 0)
     (ite patient_has_finding_of_smoker_now 1 0)
     (ite patient_has_ldl_hdl_ratio_risk_factor_now 1 0)
     (ite patient_has_hemoglobin_a1c_risk_factor_now 1 0)
     (ite patient_has_finding_of_left_ventricular_hypertrophy_now 1 0)
     (ite patient_has_finding_of_first_degree_family_history_of_major_adverse_cardiac_events_now 1 0)
     (ite patient_has_finding_of_second_degree_family_history_of_major_adverse_cardiac_events_now 1 0)
     (ite patient_has_microalbuminuria_risk_factor_now 1 0)
     (ite patient_has_finding_of_proteinuria_now 1 0)
     (ite patient_has_gfr_risk_factor_now 1 0))) ;; "at least two of the following risk factors: ..."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (>= patient_risk_factor_count_now 2)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have at least two of the following risk factors: aged 65 years or older, smoker, low-density lipoprotein cholesterol/high-density lipoprotein cholesterol ratio ≥ 3.0, hemoglobin A1c level ≥ 8.0 percent, left ventricular hypertrophy, first-degree family history of major adverse cardiac events, second-degree family history of major adverse cardiac events, microalbuminuria (quantitative testing: ≥ 30 milligrams per deciliter), proteinuria (qualitative testing: positive or higher), or estimated glomerular filtration rate < 60 milliliters per minute per 1.73 square meters."
