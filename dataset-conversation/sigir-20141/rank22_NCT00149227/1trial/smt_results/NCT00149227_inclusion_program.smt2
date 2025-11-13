;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of hypertensive disorder (hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of hypertensive disorder (hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of hypertensive disorder (hypertension)."}

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_hypertensive_disorder_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a clinical diagnosis of hypertension."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_cerebrovascular_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of diagnosis of cerebrovascular disease.","when_to_set_to_false":"Set to false if the patient does not have a history of diagnosis of cerebrovascular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of diagnosis of cerebrovascular disease.","meaning":"Boolean indicating whether the patient has a history of diagnosis of cerebrovascular disease."} // "history of cerebrovascular disease"
(declare-const patient_has_diagnosis_of_chronic_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic heart failure.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic heart failure."} // "chronic heart failure"
(declare-const patient_has_diagnosis_of_chronic_heart_failure_now@@nyha_class_ii_or_iii Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chronic heart failure diagnosis is classified as NYHA class II or III.","when_to_set_to_false":"Set to false if the patient's chronic heart failure diagnosis is not classified as NYHA class II or III.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic heart failure diagnosis is classified as NYHA class II or III.","meaning":"Boolean indicating whether the patient's chronic heart failure diagnosis is classified as NYHA class II or III."} // "chronic heart failure (New York Heart Association class II OR New York Heart Association class III)"
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus."} // "diabetes mellitus"
(declare-const patient_has_diagnosis_of_disorder_of_lipid_metabolism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of disorder of lipid metabolism.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of disorder of lipid metabolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of disorder of lipid metabolism.","meaning":"Boolean indicating whether the patient currently has a diagnosis of disorder of lipid metabolism."} // "lipid metabolism abnormality"
(declare-const patient_has_diagnosis_of_ischemic_heart_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of diagnosis of ischemic heart disease.","when_to_set_to_false":"Set to false if the patient does not have a history of diagnosis of ischemic heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of diagnosis of ischemic heart disease.","meaning":"Boolean indicating whether the patient has a history of diagnosis of ischemic heart disease."} // "history of ischemic heart disease"
(declare-const patient_has_finding_of_electrocardiogram_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of abnormal electrocardiogram.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of abnormal electrocardiogram.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of abnormal electrocardiogram.","meaning":"Boolean indicating whether the patient currently has a finding of abnormal electrocardiogram."} // "electrocardiogram abnormality"
(declare-const patient_has_finding_of_left_ventricular_hypertrophy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of left ventricular hypertrophy.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of left ventricular hypertrophy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of left ventricular hypertrophy.","meaning":"Boolean indicating whether the patient currently has a finding of left ventricular hypertrophy."} // "left ventricular hypertrophy"
(declare-const patient_has_finding_of_tobacco_smoking_behavior_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of tobacco smoking behavior.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of tobacco smoking behavior.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of tobacco smoking behavior.","meaning":"Boolean indicating whether the patient currently has a finding of tobacco smoking behavior."} // "smoking habit"
(declare-const patient_obesity_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the measured BMI value in kg/m^2 if available for the patient now.","when_to_set_to_null":"Set to null if no BMI measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kg/m^2."} // "obesity (body mass index > 25)"
(declare-const patients_risk_factor_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive status for any risk factor.","when_to_set_to_false":"Set to false if the patient currently does not have a positive status for any risk factor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive status for any risk factor.","meaning":"Boolean indicating whether the patient currently has a positive status for any risk factor."} // "risk factor"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term (risk factor)
(assert
  (! (=> (or patient_has_diagnosis_of_diabetes_mellitus_now
            patient_has_finding_of_tobacco_smoking_behavior_finding_now
            patient_has_diagnosis_of_disorder_of_lipid_metabolism_now
            patient_has_diagnosis_of_ischemic_heart_disease_inthehistory
            patient_has_diagnosis_of_cerebrovascular_disease_inthehistory
            (> patient_obesity_value_recorded_now_withunit_kg_per_m2 25.0)
            patient_has_diagnosis_of_chronic_heart_failure_now@@nyha_class_ii_or_iii
            (and patient_has_finding_of_electrocardiogram_abnormal_now
                 patient_has_finding_of_left_ventricular_hypertrophy_now))
        patients_risk_factor_is_positive_now)
     :named REQ1_AUXILIARY0)) ;; "such as diabetes mellitus OR smoking habit OR lipid metabolism abnormality OR history of ischemic heart disease OR history of cerebrovascular disease OR obesity (body mass index > 25) OR chronic heart failure (NYHA class II OR III) OR electrocardiogram abnormality (left ventricular hypertrophy)"

;; Qualifier variable implies stem variable for chronic heart failure
(assert
  (! (=> patient_has_diagnosis_of_chronic_heart_failure_now@@nyha_class_ii_or_iii
         patient_has_diagnosis_of_chronic_heart_failure_now)
     :named REQ1_AUXILIARY1)) ;; "chronic heart failure (NYHA class II OR III)"

;; Electrocardiogram abnormality with left ventricular hypertrophy is a specific example
(assert
  (! (=> patient_has_finding_of_left_ventricular_hypertrophy_now
         patient_has_finding_of_electrocardiogram_abnormal_now)
     :named REQ1_AUXILIARY2)) ;; "electrocardiogram abnormality (left ventricular hypertrophy)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Must have a clinical diagnosis of at least one risk factor
(assert
  (! patients_risk_factor_is_positive_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a clinical diagnosis of at least one risk factor"
