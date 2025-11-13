;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male (e.g., female or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is male as currently recorded."} // "male"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (e.g., male or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female as currently recorded."} // "female"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged > 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be (male OR female).
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (male OR female)."

;; Component 1: To be included, the patient must be aged > 18 years.
(assert
  (! (> patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged > 18 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_diastolic_blood_pressure_value_recorded_past_1_years_in_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the value of the patient's diastolic blood pressure recorded at any time in the past 1 year or longer, in millimeters of mercury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the patient's diastolic blood pressure was recorded as in the past 1 year or longer.","meaning":"Numeric value indicating the patient's diastolic blood pressure recorded at any time in the past 1 year or longer, in millimeters of mercury."} // "diastolic blood pressure > 90 millimeters of mercury for > 1 year"
(declare-const patient_systolic_blood_pressure_value_recorded_past_1_years_in_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the value of the patient's systolic blood pressure recorded at any time in the past 1 year or longer, in millimeters of mercury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the patient's systolic blood pressure was recorded as in the past 1 year or longer.","meaning":"Numeric value indicating the patient's systolic blood pressure recorded at any time in the past 1 year or longer, in millimeters of mercury."} // "systolic blood pressure > 140 millimeters of mercury for > 1 year"
(declare-const patient_has_diagnosis_of_hypertensive_disorder_inthepast1years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of hypertensive disorder (hypertension) documented at any time in the past 1 year or longer.","when_to_set_to_false":"Set to false if the patient does not have a diagnosis of hypertensive disorder (hypertension) documented at any time in the past 1 year or longer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a diagnosis of hypertensive disorder (hypertension) documented at any time in the past 1 year or longer.","meaning":"Boolean indicating whether the patient has a diagnosis of hypertensive disorder (hypertension) documented at any time in the past 1 year or longer."} // "documented hypertension for > 1 year"

(declare-const patient_low_density_lipoprotein_cholesterol_value_recorded_past_1_years_in_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the value of the patient's low-density lipoprotein cholesterol recorded at any time in the past 1 year or longer, in milligrams per deciliter.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the patient's low-density lipoprotein cholesterol was recorded as in the past 1 year or longer.","meaning":"Numeric value indicating the patient's low-density lipoprotein cholesterol recorded at any time in the past 1 year or longer, in milligrams per deciliter."} // "low-density lipoprotein cholesterol > 160 milligrams per deciliter for > 1 year"
(declare-const patient_total_cholesterol_value_recorded_past_1_years_in_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the value of the patient's total cholesterol recorded at any time in the past 1 year or longer, in milligrams per deciliter.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the patient's total cholesterol was recorded as in the past 1 year or longer.","meaning":"Numeric value indicating the patient's total cholesterol recorded at any time in the past 1 year or longer, in milligrams per deciliter."} // "total cholesterol > 240 milligrams per deciliter for > 1 year"
(declare-const patient_total_cholesterol_to_high_density_lipoprotein_cholesterol_ratio_value_recorded_past_1_years Real) ;; {"when_to_set_to_value":"Set to the value of the patient's total cholesterol to high-density lipoprotein cholesterol ratio recorded at any time in the past 1 year or longer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the patient's total cholesterol to high-density lipoprotein cholesterol ratio was recorded as in the past 1 year or longer.","meaning":"Numeric value indicating the patient's total cholesterol to high-density lipoprotein cholesterol ratio recorded at any time in the past 1 year or longer."} // "total cholesterol/high-density lipoprotein cholesterol ratio > 1.6 for > 1 year"
(declare-const patient_has_diagnosis_of_hypercholesterolemia_inthepast1years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of hypercholesterolemia documented at any time in the past 1 year or longer.","when_to_set_to_false":"Set to false if the patient does not have a diagnosis of hypercholesterolemia documented at any time in the past 1 year or longer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a diagnosis of hypercholesterolemia documented at any time in the past 1 year or longer.","meaning":"Boolean indicating whether the patient has a diagnosis of hypercholesterolemia documented at any time in the past 1 year or longer."} // "documented hypercholesterolemia for > 1 year"

(declare-const patient_blood_glucose_value_recorded_past_1_years_in_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the value of the patient's blood glucose recorded at any time in the past 1 year or longer, in milligrams per deciliter.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the patient's blood glucose was recorded as in the past 1 year or longer.","meaning":"Numeric value indicating the patient's blood glucose recorded at any time in the past 1 year or longer, in milligrams per deciliter."} // "blood glucose > 150 milligrams per deciliter for > 1 year"
(declare-const patient_has_diagnosis_of_diabetes_mellitus_inthepast1years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of diabetes mellitus documented at any time in the past 1 year or longer.","when_to_set_to_false":"Set to false if the patient does not have a diagnosis of diabetes mellitus documented at any time in the past 1 year or longer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a diagnosis of diabetes mellitus documented at any time in the past 1 year or longer.","meaning":"Boolean indicating whether the patient has a diagnosis of diabetes mellitus documented at any time in the past 1 year or longer."} // "documented diabetes mellitus for > 1 year"
(declare-const patient_has_insulin_dependence_past_1_years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had insulin dependence at any time in the past 1 year or longer.","when_to_set_to_false":"Set to false if the patient has not had insulin dependence at any time in the past 1 year or longer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had insulin dependence at any time in the past 1 year or longer.","meaning":"Boolean indicating whether the patient has had insulin dependence at any time in the past 1 year or longer."} // "insulin dependence for > 1 year"
(declare-const patient_has_requirement_for_oral_antihyperglycemic_medication_past_1_years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has required oral antihyperglycemic medication at any time in the past 1 year or longer.","when_to_set_to_false":"Set to false if the patient has not required oral antihyperglycemic medication at any time in the past 1 year or longer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has required oral antihyperglycemic medication at any time in the past 1 year or longer.","meaning":"Boolean indicating whether the patient has required oral antihyperglycemic medication at any time in the past 1 year or longer."} // "oral antihyperglycemic medication for > 1 year"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: Documented hypertension for > 1 year
(assert
  (! (= patient_has_diagnosis_of_hypertensive_disorder_inthepast1years
        (or (> patient_diastolic_blood_pressure_value_recorded_past_1_years_in_millimeters_of_mercury 90.0)
            (> patient_systolic_blood_pressure_value_recorded_past_1_years_in_millimeters_of_mercury 140.0)))
     :named REQ1_AUXILIARY0)) ;; "documented hypertension (diastolic blood pressure > 90 mmHg for > 1 year OR systolic blood pressure > 140 mmHg for > 1 year)"

;; Definition: Documented hypercholesterolemia for > 1 year
(assert
  (! (= patient_has_diagnosis_of_hypercholesterolemia_inthepast1years
        (or (> patient_low_density_lipoprotein_cholesterol_value_recorded_past_1_years_in_milligrams_per_deciliter 160.0)
            (> patient_total_cholesterol_value_recorded_past_1_years_in_milligrams_per_deciliter 240.0)
            (> patient_total_cholesterol_to_high_density_lipoprotein_cholesterol_ratio_value_recorded_past_1_years 1.6)))
     :named REQ1_AUXILIARY1)) ;; "documented hypercholesterolemia (LDL > 160 OR total cholesterol > 240 OR total cholesterol/HDL ratio > 1.6 for > 1 year)"

;; Definition: Documented diabetes mellitus for > 1 year
(assert
  (! (= patient_has_diagnosis_of_diabetes_mellitus_inthepast1years
        (or (and (> patient_blood_glucose_value_recorded_past_1_years_in_milligrams_per_deciliter 150.0)
                 patient_has_requirement_for_oral_antihyperglycemic_medication_past_1_years)
            (and (> patient_blood_glucose_value_recorded_past_1_years_in_milligrams_per_deciliter 150.0)
                 patient_has_insulin_dependence_past_1_years)))
     :named REQ1_AUXILIARY2)) ;; "documented diabetes mellitus (blood glucose > 150 mg/dl requiring oral antihyperglycemic medication OR insulin dependence for > 1 year)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Inclusion: patient must have at least one of the following:
;; - documented hypertension for > 1 year
;; - documented hypercholesterolemia for > 1 year
;; - documented diabetes mellitus for > 1 year
;; - any combination of the above (i.e., at least one must be true)
(assert
  (! (or patient_has_diagnosis_of_hypertensive_disorder_inthepast1years
         patient_has_diagnosis_of_hypercholesterolemia_inthepast1years
         patient_has_diagnosis_of_diabetes_mellitus_inthepast1years)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (documented hypertension ... OR documented hypercholesterolemia ... OR documented diabetes mellitus ... OR any combination of ... for > 1 year)"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const ischemic_infarction_confirmed_by_computed_tomography_scan Bool) ;; {"when_to_set_to_true":"Set to true if ischemic infarction is confirmed by computed tomography scan.","when_to_set_to_false":"Set to false if ischemic infarction is not confirmed by computed tomography scan.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether ischemic infarction is confirmed by computed tomography scan.","meaning":"Boolean indicating whether ischemic infarction is confirmed by computed tomography scan."} // "computed tomography scan consistent with ischemic infarction"
(declare-const ischemic_infarction_confirmed_by_magnetic_resonance_imaging_scan Bool) ;; {"when_to_set_to_true":"Set to true if ischemic infarction is confirmed by magnetic resonance imaging scan.","when_to_set_to_false":"Set to false if ischemic infarction is not confirmed by magnetic resonance imaging scan.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether ischemic infarction is confirmed by magnetic resonance imaging scan.","meaning":"Boolean indicating whether ischemic infarction is confirmed by magnetic resonance imaging scan."} // "magnetic resonance imaging scan consistent with ischemic infarction"
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of cerebrovascular accident (stroke) at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented diagnosis of cerebrovascular accident (stroke) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a diagnosis of cerebrovascular accident (stroke) at any time in the past.","meaning":"Boolean indicating whether the patient has a diagnosis of cerebrovascular accident (stroke) at any time in the past."} // "documented cerebrovascular accident"
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_inthehistory@@documented_by_physical_examination Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of cerebrovascular accident (stroke) is documented by physical examination.","when_to_set_to_false":"Set to false if the patient's diagnosis of cerebrovascular accident (stroke) is not documented by physical examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is documented by physical examination.","meaning":"Boolean indicating whether the patient's diagnosis of cerebrovascular accident (stroke) is documented by physical examination."} // "documented cerebrovascular accident by physical examination"
(declare-const patient_has_diagnosis_of_transient_cerebral_ischemia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of transient cerebral ischemia (transient ischemic attack) at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented diagnosis of transient cerebral ischemia (transient ischemic attack) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a diagnosis of transient cerebral ischemia (transient ischemic attack) at any time in the past.","meaning":"Boolean indicating whether the patient has a diagnosis of transient cerebral ischemia (transient ischemic attack) at any time in the past."} // "documented transient ischemic attack"
(declare-const patient_has_diagnosis_of_transient_cerebral_ischemia_inthehistory@@witnessed_and_recorded_by_medical_personnel Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of transient cerebral ischemia (transient ischemic attack) was witnessed and recorded by medical personnel.","when_to_set_to_false":"Set to false if the patient's diagnosis of transient cerebral ischemia (transient ischemic attack) was not witnessed and recorded by medical personnel.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the event was witnessed and recorded by medical personnel.","meaning":"Boolean indicating whether the patient's diagnosis of transient cerebral ischemia (transient ischemic attack) was witnessed and recorded by medical personnel."} // "documented transient ischemic attack witnessed and recorded by medical personnel"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies stem variable for cerebrovascular accident
(assert
  (! (=> patient_has_diagnosis_of_cerebrovascular_accident_inthehistory@@documented_by_physical_examination
         patient_has_diagnosis_of_cerebrovascular_accident_inthehistory)
     :named REQ2_AUXILIARY0)) ;; "documented cerebrovascular accident by physical examination"

;; Qualifier variable implies stem variable for transient ischemic attack
(assert
  (! (=> patient_has_diagnosis_of_transient_cerebral_ischemia_inthehistory@@witnessed_and_recorded_by_medical_personnel
         patient_has_diagnosis_of_transient_cerebral_ischemia_inthehistory)
     :named REQ2_AUXILIARY1)) ;; "documented transient ischemic attack witnessed and recorded by medical personnel"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Risk factor group: (documented hypertension for > 1 year OR documented hypercholesterolemia for > 1 year OR documented diabetes mellitus for > 1 year OR any combination of all three)
(assert
  (! (or
        patient_has_diagnosis_of_hypertensive_disorder_inthepast1years
        patient_has_diagnosis_of_hypercholesterolemia_inthepast1years
        patient_has_diagnosis_of_diabetes_mellitus_inthepast1years
        (and patient_has_diagnosis_of_hypertensive_disorder_inthepast1years
             patient_has_diagnosis_of_hypercholesterolemia_inthepast1years
             patient_has_diagnosis_of_diabetes_mellitus_inthepast1years))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "documented hypertension for > 1 year OR documented hypercholesterolemia for > 1 year OR documented diabetes mellitus for > 1 year OR any combination of all three"

;; Cerebral ischemic event group: (documented cerebrovascular accident by physical examination AND (CT scan consistent with ischemic infarction OR MRI scan consistent with ischemic infarction)) OR (documented transient ischemic attack witnessed and recorded by medical personnel)
(assert
  (! (or
        (and patient_has_diagnosis_of_cerebrovascular_accident_inthehistory@@documented_by_physical_examination
             (or ischemic_infarction_confirmed_by_computed_tomography_scan
                 ischemic_infarction_confirmed_by_magnetic_resonance_imaging_scan))
        patient_has_diagnosis_of_transient_cerebral_ischemia_inthehistory@@witnessed_and_recorded_by_medical_personnel)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "documented cerebrovascular accident by physical examination AND (CT scan consistent with ischemic infarction OR MRI scan consistent with ischemic infarction) OR documented transient ischemic attack witnessed and recorded by medical personnel"
