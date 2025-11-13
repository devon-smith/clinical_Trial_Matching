;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} // "the patient must be female or male"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} // "the patient must be female or male"
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the measured BMI value in kg/m2 if a BMI measurement for the patient is available now.","when_to_set_to_null":"Set to null if no BMI measurement is available now or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kg/m2."} // "body mass index"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: The patient must be female or male.
(assert
  (! (or patient_sex_is_female_now patient_sex_is_male_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be female or male."

;; Component 1: The patient must have a body mass index of 27 kg/m2 to 45 kg/m2.
(assert
  (! (and (>= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 27.0)
          (<= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 45.0))
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a body mass index of 27 kg/m2 to 45 kg/m2."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age ≥ 18 years AND age ≤ 70 years"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (and (>= patient_age_value_recorded_now_in_years 18.0)
          (<= patient_age_value_recorded_now_in_years 70.0))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (age ≥ 18 years AND age ≤ 70 years)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_major_depressive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of major depressive disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of major depressive disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of major depressive disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of major depressive disorder."} // "current major depressive disorder"
(declare-const patient_has_diagnosis_of_dysthymia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of dysthymia (dysthymic disorder).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of dysthymia (dysthymic disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of dysthymia (dysthymic disorder).","meaning":"Boolean indicating whether the patient currently has a diagnosis of dysthymia (dysthymic disorder)."} // "current dysthymic disorder"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (or patient_has_diagnosis_of_major_depressive_disorder_now
         patient_has_diagnosis_of_dysthymia_now)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (current major depressive disorder OR current dysthymic disorder)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_waist_circumference_value_recorded_now_withunit_centimeters Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's waist circumference in centimeters is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current waist circumference in centimeters."} // "waist circumference ≥ 102 centimeters for males OR waist circumference ≥ 88 centimeters for females"
(declare-const patient_blood_glucose_level_finding_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's fasting blood glucose in milligrams per deciliter is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current fasting blood glucose level in milligrams per deciliter."} // "fasting blood glucose ≥ 100 milligrams per deciliter"
(declare-const patient_blood_glucose_level_finding_value_recorded_now_withunit_milligrams_per_deciliter@@fasting Bool) ;; {"when_to_set_to_true":"Set to true if the blood glucose measurement was taken in the fasting state.","when_to_set_to_false":"Set to false if the blood glucose measurement was not taken in the fasting state.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was taken in the fasting state.","meaning":"Boolean indicating whether the blood glucose measurement was taken in the fasting state."} // "fasting blood glucose"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's systolic blood pressure in millimeters of mercury is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current systolic blood pressure in millimeters of mercury."} // "systolic blood pressure ≥ 130 millimeters of mercury"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's diastolic blood pressure in millimeters of mercury is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current diastolic blood pressure in millimeters of mercury."} // "diastolic blood pressure ≥ 85 millimeters of mercury"
(declare-const patient_triacylglycerol_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's triglyceride level in milligrams per deciliter is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current triglyceride level in milligrams per deciliter."} // "triglycerides ≥ 150 milligrams per deciliter"
(declare-const patient_hdl_cholesterol_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's HDL cholesterol level in milligrams per deciliter is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current HDL cholesterol level in milligrams per deciliter."} // "high-density lipoprotein cholesterol ≤ 40 milligrams per deciliter for males OR ≤ 50 milligrams per deciliter for females"
(declare-const patient_is_taking_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not taking any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any drug or medicament.","meaning":"Boolean indicating whether the patient is currently taking any drug or medicament."} // "use of medications for these conditions"
(declare-const patient_is_taking_drug_or_medicament_now@@for_metabolic_syndrome_risk_factors Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any drug or medicament specifically for the treatment or management of metabolic syndrome risk factors.","when_to_set_to_false":"Set to false if the patient is currently taking medications for other indications or not taking any relevant medications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking medications for metabolic syndrome risk factors.","meaning":"Boolean indicating whether the patient is currently taking medications for metabolic syndrome risk factors."} // "use of medications for these conditions"
(declare-const patient_cardiovascular_disease_risk_factor_count_now Real) ;; {"when_to_set_to_value":"Set to the number of cardiovascular disease risk factors present in the patient now, as characterized by the metabolic syndrome (including but not limited to the specified examples).","when_to_set_to_null":"Set to null if the count cannot be determined, is unknown, or is indeterminate.","meaning":"Numeric value representing the count of cardiovascular disease risk factors the patient currently has, as characterized by the metabolic syndrome."} // "at least 2 cardiovascular disease risk factors as characterized by the metabolic syndrome"
(declare-const patient_cardiovascular_disease_risk_factor_count_now@@characterized_by_metabolic_syndrome Bool) ;; {"when_to_set_to_true":"Set to true if the cardiovascular disease risk factors counted are characterized by the metabolic syndrome definition.","when_to_set_to_false":"Set to false if the cardiovascular disease risk factors counted are not characterized by the metabolic syndrome definition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the risk factors are characterized by the metabolic syndrome definition.","meaning":"Boolean indicating whether the cardiovascular disease risk factors counted are characterized by the metabolic syndrome definition."} // "as characterized by the metabolic syndrome"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} // "the patient must be female or male"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} // "the patient must be female or male"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples imply the umbrella risk factor count
(assert
  (! (=> 
      (or
        (or
          (and patient_sex_is_male_now (>= patient_waist_circumference_value_recorded_now_withunit_centimeters 102.0))
          (and patient_sex_is_female_now (>= patient_waist_circumference_value_recorded_now_withunit_centimeters 88.0))
        )
        (and patient_blood_glucose_level_finding_value_recorded_now_withunit_milligrams_per_deciliter@@fasting
             (>= patient_blood_glucose_level_finding_value_recorded_now_withunit_milligrams_per_deciliter 100.0))
        (or
          (>= patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 130.0)
          (>= patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 85.0)
        )
        (>= patient_triacylglycerol_value_recorded_now_withunit_milligrams_per_deciliter 150.0)
        (or
          (and patient_sex_is_male_now (<= patient_hdl_cholesterol_value_recorded_now_withunit_milligrams_per_deciliter 40.0))
          (and patient_sex_is_female_now (<= patient_hdl_cholesterol_value_recorded_now_withunit_milligrams_per_deciliter 50.0))
        )
        patient_is_taking_drug_or_medicament_now@@for_metabolic_syndrome_risk_factors
      )
      (>= patient_cardiovascular_disease_risk_factor_count_now 1)
    )
     :named REQ3_AUXILIARY0)) ;; "with non-exhaustive examples (elevated waist circumference, elevated fasting blood glucose, elevated blood pressure, elevated triglycerides, reduced high-density lipoprotein cholesterol, use of medications for these conditions)"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_cardiovascular_disease_risk_factor_count_now@@characterized_by_metabolic_syndrome
         (>= patient_cardiovascular_disease_risk_factor_count_now 1))
     :named REQ3_AUXILIARY1)) ;; "risk factors as characterized by the metabolic syndrome"

;; Qualifier variable for medication implies stem variable
(assert
  (! (=> patient_is_taking_drug_or_medicament_now@@for_metabolic_syndrome_risk_factors
         patient_is_taking_drug_or_medicament_now)
     :named REQ3_AUXILIARY2)) ;; "use of medications for these conditions"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (and
        (>= patient_cardiovascular_disease_risk_factor_count_now 2)
        patient_cardiovascular_disease_risk_factor_count_now@@characterized_by_metabolic_syndrome
     )
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "at least 2 cardiovascular disease risk factors as characterized by the metabolic syndrome"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_able_to_comply_with_all_study_procedures_and_study_schedule Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to comply with all study procedures and the study schedule.","when_to_set_to_false":"Set to false if the patient is not able to comply with all study procedures and the study schedule.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to comply with all study procedures and the study schedule.","meaning":"Boolean indicating whether the patient is able to comply with all study procedures and the study schedule."} // "the patient must be able to comply with all study procedures and schedule"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_is_able_to_comply_with_all_study_procedures_and_study_schedule
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be able to comply with all study procedures."
(assert
  (! patient_is_able_to_comply_with_all_study_procedures_and_study_schedule
     :named REQ4_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be able to comply with the study schedule."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_is_able_to_speak_english_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to speak English.","when_to_set_to_false":"Set to false if the patient is currently not able to speak English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to speak English.","meaning":"Boolean indicating whether the patient is currently able to speak English."} // "the patient must be able to speak English"
(declare-const patient_is_able_to_read_english_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to read English.","when_to_set_to_false":"Set to false if the patient is currently not able to read English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to read English.","meaning":"Boolean indicating whether the patient is currently able to read English."} // "the patient must be able to read English"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_is_able_to_speak_english_now
     :named REQ5_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be able to speak English."

(assert
  (! patient_is_able_to_read_english_now
     :named REQ5_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be able to read English."
