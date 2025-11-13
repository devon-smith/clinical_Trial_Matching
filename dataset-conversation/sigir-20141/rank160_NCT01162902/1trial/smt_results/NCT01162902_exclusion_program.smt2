;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_inthepast1months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of acute ST segment elevation myocardial infarction within the past one month.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of acute ST segment elevation myocardial infarction within the past one month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of acute ST segment elevation myocardial infarction within the past one month.","meaning":"Boolean indicating whether the patient has had a diagnosis of acute ST segment elevation myocardial infarction within the past one month."} ;; "ST elevation myocardial infarction within one month"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_inthepast1months)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had ST elevation myocardial infarction within one month."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_prinzmetal_angina_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Prinzmetal (variant) angina.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Prinzmetal (variant) angina.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Prinzmetal (variant) angina.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Prinzmetal (variant) angina."} ;; "variant angina"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_has_diagnosis_of_prinzmetal_angina_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has variant angina."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_abnormal_liver_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of abnormal liver function.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of abnormal liver function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abnormal liver function.","meaning":"Boolean indicating whether the patient currently has abnormal liver function."} ;; "liver function abnormality"
(declare-const patient_has_finding_of_renal_failure_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal failure.","meaning":"Boolean indicating whether the patient currently has renal failure."} ;; "renal failure"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (or patient_has_finding_of_abnormal_liver_function_now
            patient_has_finding_of_renal_failure_syndrome_now))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has liver function abnormality) OR (the patient has renal failure)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a hypersensitivity condition at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a hypersensitivity condition at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a hypersensitivity condition in their history.","meaning":"Boolean indicating whether the patient has ever had a hypersensitivity condition in their medical history."} ;; "has a history of hypersensitivity"

(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_testing_drugs Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypersensitivity condition in their history was specifically to testing drugs.","when_to_set_to_false":"Set to false if the patient's hypersensitivity condition in their history was not to testing drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypersensitivity condition in the patient's history was to testing drugs.","meaning":"Boolean indicating whether the hypersensitivity condition in the patient's history was specifically to testing drugs."} ;; "has a history of hypersensitivity to testing drugs"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_testing_drugs
       patient_has_finding_of_hypersensitivity_condition_inthehistory)
   :named REQ3_AUXILIARY0)) ;; "hypersensitivity condition in the history was specifically to testing drugs"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_testing_drugs)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to testing drugs."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of heart failure.","meaning":"Boolean indicating whether the patient currently has heart failure."} ;; "heart failure"

(declare-const patient_has_finding_of_heart_failure_now_nyha_class_value_recorded_now_withunit_integer Real) ;; {"when_to_set_to_value":"Set to the integer value of the NYHA class currently recorded for the patient's heart failure status (e.g., 1, 2, 3, 4).","when_to_set_to_null":"Set to null if the NYHA class value is unknown, not documented, or cannot be determined for the patient's current heart failure status.","meaning":"Numeric value representing the NYHA class currently recorded for the patient's heart failure status."} ;; "New York Heart Association class greater than 3"

(declare-const patient_has_finding_of_disorder_of_cellular_component_of_blood_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of a disorder of the cellular component of blood (hematologic disease).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of a disorder of the cellular component of blood (hematologic disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of a disorder of the cellular component of blood (hematologic disease).","meaning":"Boolean indicating whether the patient currently has a disorder of the cellular component of blood (hematologic disease)."} ;; "hematologic disease"

(declare-const patient_has_finding_of_hematologic_disease_uncorrectable_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an uncorrectable hematologic disease.","when_to_set_to_false":"Set to false if the patient currently does not have an uncorrectable hematologic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an uncorrectable hematologic disease.","meaning":"Boolean indicating whether the patient currently has an uncorrectable hematologic disease."} ;; "uncorrectable hematologic disease"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; NYHA class > 3 only applies if patient has heart failure
(assert
(! (=> (> patient_has_finding_of_heart_failure_now_nyha_class_value_recorded_now_withunit_integer 3)
     patient_has_finding_of_heart_failure_now)
:named REQ4_AUXILIARY0)) ;; "NYHA class greater than 3 only applies if patient has heart failure"

;; Uncorrectable hematologic disease implies hematologic disease
(assert
(! (=> patient_has_finding_of_hematologic_disease_uncorrectable_now
     patient_has_finding_of_disorder_of_cellular_component_of_blood_now)
:named REQ4_AUXILIARY1)) ;; "uncorrectable hematologic disease implies hematologic disease"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: severe heart failure (NYHA class > 3) OR uncorrectable hematologic disease
(assert
(! (not (or
        (and patient_has_finding_of_heart_failure_now
             (> patient_has_finding_of_heart_failure_now_nyha_class_value_recorded_now_withunit_integer 3))
        patient_has_finding_of_hematologic_disease_uncorrectable_now))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has severe heart failure (New York Heart Association class greater than 3)) OR (the patient has uncorrectable hematologic disease)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as pregnant.","when_to_set_to_false":"Set to false if the patient is currently documented as not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "possibly pregnant"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} ;; "the patient is a woman"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not (and patient_sex_is_female_now patient_is_pregnant_now))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman who is possibly pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_diabetic_poor_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of uncontrolled diabetes mellitus (poorly controlled diabetes).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of uncontrolled diabetes mellitus (poorly controlled diabetes).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has uncontrolled diabetes mellitus (poorly controlled diabetes).","meaning":"Boolean indicating whether the patient currently has uncontrolled diabetes mellitus (poorly controlled diabetes)."} ;; "uncontrolled diabetes mellitus"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_diabetic_poor_control_now)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled diabetes mellitus."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const expected_life_span_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's expected life span in years, as recorded at the current time.","when_to_set_to_null":"Set to null if the patient's expected life span in years is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric value representing the patient's expected life span in years, recorded now."} ;; "expected life span of less than one year"
(declare-const patient_has_finding_of_limited_life_expectancy_of_approximately_one_year_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of limited life expectancy of approximately one year or less.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of limited life expectancy of approximately one year or less.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a limited life expectancy of approximately one year or less.","meaning":"Boolean indicating whether the patient currently has a limited life expectancy of approximately one year or less."} ;; "expected life span of less than one year"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Numeric value less than 1 year implies limited life expectancy finding
(assert
(! (=> (< expected_life_span_value_recorded_now_in_years 1)
     patient_has_finding_of_limited_life_expectancy_of_approximately_one_year_now)
:named REQ7_AUXILIARY0)) ;; "expected life span of less than one year"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_limited_life_expectancy_of_approximately_one_year_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an expected life span of less than one year."
