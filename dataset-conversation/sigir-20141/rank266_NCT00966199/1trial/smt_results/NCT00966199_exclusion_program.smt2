;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus."} ;; "diabetes mellitus"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_diabetes_mellitus_now)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diabetes mellitus."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_atrial_fibrillation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of atrial fibrillation.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of atrial fibrillation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of atrial fibrillation.","meaning":"Boolean indicating whether the patient currently has a diagnosis of atrial fibrillation."} ;; "atrial fibrillation"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_atrial_fibrillation_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has atrial fibrillation."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of dementia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of dementia."} ;; "dementia"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_dementia_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has dementia."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_renal_failure_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal failure syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal failure syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal failure syndrome.","meaning":"Boolean indicating whether the patient currently has renal failure syndrome."} ;; "renal failure"
(declare-const patient_has_finding_of_renal_failure_syndrome_now@@requires_dialysis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current renal failure syndrome requires dialysis.","when_to_set_to_false":"Set to false if the patient's current renal failure syndrome does not require dialysis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current renal failure syndrome requires dialysis.","meaning":"Boolean indicating whether the patient's current renal failure syndrome requires dialysis."} ;; "renal failure requiring dialysis"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_renal_failure_syndrome_now@@requires_dialysis
      patient_has_finding_of_renal_failure_syndrome_now)
:named REQ3_AUXILIARY0)) ;; "renal failure requiring dialysis""

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_renal_failure_syndrome_now@@requires_dialysis)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has renal failure requiring dialysis."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_life_expectancy_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current life expectancy in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current life expectancy in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current life expectancy in years."} ;; "life expectancy < 1 year"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (< patient_life_expectancy_value_recorded_now_in_years 1))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a life expectancy < 1 year."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_cerebrovascular_accident_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a stroke (cerebrovascular accident).","when_to_set_to_false":"Set to false if the patient currently does not have a stroke (cerebrovascular accident).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a stroke (cerebrovascular accident).","meaning":"Boolean indicating whether the patient currently has a stroke (cerebrovascular accident)."} ;; "stroke"
(declare-const patient_has_finding_of_cerebrovascular_accident_now@@disabling Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current stroke (cerebrovascular accident) is disabling.","when_to_set_to_false":"Set to false if the patient's current stroke (cerebrovascular accident) is not disabling.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current stroke (cerebrovascular accident) is disabling.","meaning":"Boolean indicating whether the patient's current stroke (cerebrovascular accident) is disabling."} ;; "disabling stroke"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_cerebrovascular_accident_now@@disabling
      patient_has_finding_of_cerebrovascular_accident_now)
:named REQ5_AUXILIARY0)) ;; "disabling stroke" means stroke present and disabling

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_cerebrovascular_accident_now@@disabling)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a disabling stroke."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_can_undergo_magnetic_resonance_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo magnetic resonance imaging (i.e., no contraindication exists).","when_to_set_to_false":"Set to false if the patient currently cannot undergo magnetic resonance imaging due to a contraindication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo magnetic resonance imaging.","meaning":"Boolean indicating whether the patient can currently undergo magnetic resonance imaging (MRI)."} ;; "contraindication for magnetic resonance imaging"
(declare-const patient_can_undergo_hypotensive_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently receive anti-hypertensive medication (i.e., no contraindication exists).","when_to_set_to_false":"Set to false if the patient currently cannot receive anti-hypertensive medication due to a contraindication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently receive anti-hypertensive medication.","meaning":"Boolean indicating whether the patient can currently receive anti-hypertensive medication."} ;; "contraindication for anti-hypertensive medication"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (or (not patient_can_undergo_magnetic_resonance_imaging_now)
            (not patient_can_undergo_hypotensive_agent_now)))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a contraindication for magnetic resonance imaging) OR (the patient has a contraindication for anti-hypertensive medication)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's systolic blood pressure is recorded now in mmHg.","when_to_set_to_null":"Set to null if no systolic blood pressure measurement in mmHg is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's systolic blood pressure measured now in mmHg."} ;; "systolic blood pressure > 220 mmHg"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (> patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg 220))
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has systolic blood pressure > 220 mmHg."
