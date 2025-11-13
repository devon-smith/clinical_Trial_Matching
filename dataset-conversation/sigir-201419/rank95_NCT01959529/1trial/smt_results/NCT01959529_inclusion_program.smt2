;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_type_2_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of type 2 diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of type 2 diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of type 2 diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of type 2 diabetes mellitus."} ;; "To be included, the patient must have type 2 diabetes mellitus."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_type_2_diabetes_mellitus_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have type 2 diabetes mellitus."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged greater than or equal to 50 years"
(declare-const patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of disorder of cardiovascular system (cardiovascular disease) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of disorder of cardiovascular system (cardiovascular disease) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of disorder of cardiovascular system (cardiovascular disease).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of disorder of cardiovascular system (cardiovascular disease) at any time in their history."} ;; "cardiovascular disease"
(declare-const patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory@@predefined Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of disorder of cardiovascular system (cardiovascular disease) in the patient's history is predefined according to study or protocol criteria.","when_to_set_to_false":"Set to false if the diagnosis is not predefined or does not meet the required definition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is predefined.","meaning":"Boolean indicating whether the diagnosis of disorder of cardiovascular system (cardiovascular disease) in the patient's history is predefined."} ;; "predefined previous cardiovascular disease"
(declare-const patient_has_diagnosis_of_kidney_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of kidney disease (renal disease) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of kidney disease (renal disease) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of kidney disease (renal disease).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of kidney disease (renal disease) at any time in their history."} ;; "renal disease"
(declare-const patient_has_diagnosis_of_kidney_disease_inthehistory@@predefined Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of kidney disease (renal disease) in the patient's history is predefined according to study or protocol criteria.","when_to_set_to_false":"Set to false if the diagnosis is not predefined or does not meet the required definition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is predefined.","meaning":"Boolean indicating whether the diagnosis of kidney disease (renal disease) in the patient's history is predefined."} ;; "predefined previous renal disease"
(declare-const patients_risk_factor_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has positive status for risk factor(s).","when_to_set_to_false":"Set to false if the patient currently does not have positive status for risk factor(s).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has positive status for risk factor(s).","meaning":"Boolean indicating whether the patient currently has positive status for risk factor(s)."} ;; "risk factors"
(declare-const patients_risk_factor_is_positive_now@@predefined Bool) ;; {"when_to_set_to_true":"Set to true if the risk factors present in the patient are predefined according to study or protocol criteria.","when_to_set_to_false":"Set to false if the risk factors are not predefined or do not meet the required definition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the risk factors are predefined.","meaning":"Boolean indicating whether the risk factors present in the patient are predefined."} ;; "predefined cardiovascular risk factors"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory@@predefined
         patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory)
     :named REQ1_AUXILIARY0)) ;; "predefined previous cardiovascular disease"

(assert
  (! (=> patient_has_diagnosis_of_kidney_disease_inthehistory@@predefined
         patient_has_diagnosis_of_kidney_disease_inthehistory)
     :named REQ1_AUXILIARY1)) ;; "predefined previous renal disease"

(assert
  (! (=> patients_risk_factor_is_positive_now@@predefined
         patients_risk_factor_is_positive_now)
     :named REQ1_AUXILIARY2)) ;; "predefined cardiovascular risk factors"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: ((age >= 50 AND (predefined previous cardiovascular disease OR predefined previous renal disease)) OR (age >= 60 AND predefined cardiovascular risk factors))
(assert
  (! (or
        (and (>= patient_age_value_recorded_now_in_years 50.0)
             (or patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory@@predefined
                 patient_has_diagnosis_of_kidney_disease_inthehistory@@predefined))
        (and (>= patient_age_value_recorded_now_in_years 60.0)
             patients_risk_factor_is_positive_now@@predefined))
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((be aged greater than or equal to 50 years AND (have predefined previous cardiovascular disease OR have predefined previous renal disease)) OR (be aged greater than or equal to 60 years AND have predefined cardiovascular risk factors))."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_glycosylated_hemoglobin_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a current glycosylated hemoglobin (HbA1c) measurement is available.","when_to_set_to_null":"Set to null if no current glycosylated hemoglobin (HbA1c) measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current glycosylated hemoglobin (HbA1c)."} ;; "glycosylated haemoglobin greater than or equal to 7.0 percent" / "glycosylated haemoglobin less than 7.0 percent"
(declare-const patient_insulin_value_recorded_now_withunit_units_per_day Real) ;; {"when_to_set_to_value":"Set to the measured value if a current daily dose of insulin (units per day) is available.","when_to_set_to_null":"Set to null if no current daily dose of insulin is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current daily dose of insulin in units per day."} ;; "current insulin treatment corresponding to greater than or equal to 20 units of basal insulin per day"
(declare-const patient_insulin_value_recorded_now_withunit_units_per_day@@basal Bool) ;; {"when_to_set_to_true":"Set to true if the insulin value recorded refers specifically to basal insulin.","when_to_set_to_false":"Set to false if the insulin value recorded does not refer to basal insulin.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the insulin value recorded refers to basal insulin.","meaning":"Boolean indicating whether the insulin value recorded refers specifically to basal insulin."} ;; "current insulin treatment corresponding to greater than or equal to 20 units of basal insulin per day"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must ((have glycosylated haemoglobin greater than or equal to 7.0 percent) OR (have glycosylated haemoglobin less than 7.0 percent AND have current insulin treatment corresponding to greater than or equal to 20 units of basal insulin per day)).
(assert
  (! (or
        (>= patient_glycosylated_hemoglobin_value_recorded_now_withunit_percent 7.0)
        (and
          (< patient_glycosylated_hemoglobin_value_recorded_now_withunit_percent 7.0)
          (>= patient_insulin_value_recorded_now_withunit_units_per_day 20.0)
          patient_insulin_value_recorded_now_withunit_units_per_day@@basal
        )
     )
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((have glycosylated haemoglobin greater than or equal to 7.0 percent) OR (have glycosylated haemoglobin less than 7.0 percent AND have current insulin treatment corresponding to greater than or equal to 20 units of basal insulin per day))."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_oral_antidiabetic_agent_count_now Real) ;; {"when_to_set_to_value":"Set to the number of oral antidiabetic agents the patient is currently receiving.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many oral antidiabetic agents the patient is currently receiving.","meaning":"Numeric value for the count of oral antidiabetic agents currently received by the patient."} ;; "the number of oral antidiabetic agents the patient is currently receiving"
(declare-const patient_injectable_antidiabetic_agent_count_now Real) ;; {"when_to_set_to_value":"Set to the number of injectable antidiabetic agents the patient is currently receiving.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many injectable antidiabetic agents the patient is currently receiving.","meaning":"Numeric value for the count of injectable antidiabetic agents currently received by the patient."} ;; "the number of injectable antidiabetic agents the patient is currently receiving"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: To be included, the patient must be receiving at least one oral antidiabetic agent OR at least one injectable antidiabetic agent.
(assert
  (! (or (>= patient_oral_antidiabetic_agent_count_now 1)
         (>= patient_injectable_antidiabetic_agent_count_now 1))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be receiving at least one oral antidiabetic agent OR at least one injectable antidiabetic agent."
