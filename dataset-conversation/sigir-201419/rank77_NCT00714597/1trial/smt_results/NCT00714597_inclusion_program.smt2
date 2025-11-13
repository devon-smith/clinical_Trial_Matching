;; ===================== Declarations for the inclusion criteria (REQ 0) =====================
(declare-const patient_has_finding_of_acute_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute medical condition.","when_to_set_to_false":"Set to false if the patient currently does not have an acute medical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acute medical condition.","meaning":"Boolean indicating whether the patient currently has an acute medical condition."}  ;; "acute medical condition"
(declare-const patient_has_finding_of_acute_disease_now@@requires_bed_rest_for_at_least_3_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient's acute medical condition requires bed rest for at least 3 days.","when_to_set_to_false":"Set to false if the patient's acute medical condition does not require bed rest for at least 3 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's acute medical condition requires bed rest for at least 3 days.","meaning":"Boolean indicating whether the patient's acute medical condition requires bed rest for at least 3 days."}  ;; "acute medical condition requiring bed rest for ≥ 3 days"
(declare-const patient_is_hospitalized_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently hospitalized.","when_to_set_to_false":"Set to false if the patient is not currently hospitalized.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently hospitalized.","meaning":"Boolean indicating whether the patient is currently hospitalized."}  ;; "be hospitalized"
(declare-const patient_is_hospitalized_now@@for_at_least_one_of_specified_medical_conditions Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hospitalization is for at least one of the specified medical conditions.","when_to_set_to_false":"Set to false if the patient's current hospitalization is not for any of the specified medical conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hospitalization is for at least one of the specified medical conditions.","meaning":"Boolean indicating whether the patient's current hospitalization is for at least one of the specified medical conditions."}  ;; "hospitalized for at least one of the following medical conditions"
(declare-const patient_has_finding_of_congestive_heart_failure_now@@nyha_class_iii Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has congestive heart failure classified as NYHA class III.","when_to_set_to_false":"Set to false if the patient currently does not have congestive heart failure classified as NYHA class III.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congestive heart failure classified as NYHA class III.","meaning":"Boolean indicating whether the patient currently has congestive heart failure classified as NYHA class III."}  ;; "congestive heart failure (New York Heart Association class III)"
(declare-const patient_has_finding_of_congestive_heart_failure_now@@nyha_class_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has congestive heart failure classified as NYHA class IV.","when_to_set_to_false":"Set to false if the patient currently does not have congestive heart failure classified as NYHA class IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congestive heart failure classified as NYHA class IV.","meaning":"Boolean indicating whether the patient currently has congestive heart failure classified as NYHA class IV."}  ;; "congestive heart failure (New York Heart Association class IV)"
(declare-const patient_has_finding_of_acute_respiratory_failure_now@@not_requiring_mechanical_ventilation Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acute respiratory failure not requiring mechanical ventilation.","when_to_set_to_false":"Set to false if the patient currently has acute respiratory failure requiring mechanical ventilation or does not have acute respiratory failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute respiratory failure not requiring mechanical ventilation.","meaning":"Boolean indicating whether the patient currently has acute respiratory failure not requiring mechanical ventilation."}  ;; "acute respiratory failure (not requiring mechanical ventilation)"
(declare-const patient_has_finding_of_acute_infection_now@@without_septic_shock Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acute infection without septic shock.","when_to_set_to_false":"Set to false if the patient currently has acute infection with septic shock or does not have acute infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute infection without septic shock.","meaning":"Boolean indicating whether the patient currently has acute infection without septic shock."}  ;; "acute infection (without septic shock)"
(declare-const patient_has_finding_of_acute_rheumatic_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute rheumatic disorder.","when_to_set_to_false":"Set to false if the patient currently does not have an acute rheumatic disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acute rheumatic disorder.","meaning":"Boolean indicating whether the patient currently has an acute rheumatic disorder."}  ;; "acute rheumatic disorder"
(declare-const patient_has_finding_of_inflammatory_bowel_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has inflammatory bowel disease.","when_to_set_to_false":"Set to false if the patient currently does not have inflammatory bowel disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has inflammatory bowel disease.","meaning":"Boolean indicating whether the patient currently has inflammatory bowel disease."}  ;; "inflammatory bowel disease"
(declare-const patient_has_finding_of_inflammatory_bowel_disease_now@@acute_episode Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current episode of inflammatory bowel disease is acute.","when_to_set_to_false":"Set to false if the patient's current episode of inflammatory bowel disease is not acute.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current episode of inflammatory bowel disease is acute.","meaning":"Boolean indicating whether the patient's current episode of inflammatory bowel disease is acute."}  ;; "acute episode of inflammatory bowel disease"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable for acute disease requiring bed rest for ≥ 3 days implies acute disease
(assert
  (! (=> patient_has_finding_of_acute_disease_now@@requires_bed_rest_for_at_least_3_days
         patient_has_finding_of_acute_disease_now)
     :named REQ0_AUXILIARY0)) ;; "acute medical condition requiring bed rest for ≥ 3 days" implies "acute medical condition"

;; Qualifier variable for hospitalization for at least one specified condition implies hospitalization
(assert
  (! (=> patient_is_hospitalized_now@@for_at_least_one_of_specified_medical_conditions
         patient_is_hospitalized_now)
     :named REQ0_AUXILIARY1)) ;; "hospitalized for at least one of the following medical conditions" implies "hospitalized"

;; Exhaustive subcategories for specified medical conditions (umbrella equivalence)
(assert
  (! (= patient_is_hospitalized_now@@for_at_least_one_of_specified_medical_conditions
        (or patient_has_finding_of_congestive_heart_failure_now@@nyha_class_iii
            patient_has_finding_of_congestive_heart_failure_now@@nyha_class_iv
            patient_has_finding_of_acute_respiratory_failure_now@@not_requiring_mechanical_ventilation
            patient_has_finding_of_acute_infection_now@@without_septic_shock
            patient_has_finding_of_acute_rheumatic_disorder_now
            patient_has_finding_of_inflammatory_bowel_disease_now@@acute_episode))
     :named REQ0_AUXILIARY2)) ;; "at least one of the following medical conditions with exhaustive subcategories"

;; Qualifier variable for acute episode of IBD implies IBD
(assert
  (! (=> patient_has_finding_of_inflammatory_bowel_disease_now@@acute_episode
         patient_has_finding_of_inflammatory_bowel_disease_now)
     :named REQ0_AUXILIARY3)) ;; "acute episode of inflammatory bowel disease" implies "inflammatory bowel disease"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: acute medical condition requiring bed rest for ≥ 3 days
(assert
  (! patient_has_finding_of_acute_disease_now@@requires_bed_rest_for_at_least_3_days
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have an acute medical condition requiring bed rest for ≥ 3 days"

;; Component 1: hospitalized for at least one of the specified medical conditions (exhaustive list)
(assert
  (! (and patient_is_hospitalized_now
          patient_is_hospitalized_now@@for_at_least_one_of_specified_medical_conditions)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "be hospitalized for at least one of the following medical conditions with exhaustive subcategories"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "age ≥ 75 years"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had malignant neoplastic disease (cancer) in the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had malignant neoplastic disease (cancer) in the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had malignant neoplastic disease (cancer) in the past 6 months.","meaning":"Boolean indicating whether the patient has had malignant neoplastic disease (cancer) in the past 6 months."}  ;; "active cancer or active myeloproliferative disorder (having received treatment for cancer within the last 6 months)"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has malignant neoplastic disease (cancer).","when_to_set_to_false":"Set to false if the patient currently does not have malignant neoplastic disease (cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient currently has malignant neoplastic disease (cancer)."}  ;; "active cancer"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has active malignant neoplastic disease (cancer).","when_to_set_to_false":"Set to false if the patient currently has malignant neoplastic disease (cancer) but it is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's malignant neoplastic disease (cancer) is active.","meaning":"Boolean indicating whether the patient's malignant neoplastic disease (cancer) is active."}  ;; "active cancer"
(declare-const patient_has_finding_of_myeloproliferative_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has myeloproliferative disorder.","when_to_set_to_false":"Set to false if the patient currently does not have myeloproliferative disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has myeloproliferative disorder.","meaning":"Boolean indicating whether the patient currently has myeloproliferative disorder."}  ;; "active myeloproliferative disorder"
(declare-const patient_has_finding_of_myeloproliferative_disorder_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has active myeloproliferative disorder.","when_to_set_to_false":"Set to false if the patient currently has myeloproliferative disorder but it is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's myeloproliferative disorder is active.","meaning":"Boolean indicating whether the patient's myeloproliferative disorder is active."}  ;; "active myeloproliferative disorder"
(declare-const patient_has_finding_of_thromboembolism_of_vein_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of venous thromboembolism.","when_to_set_to_false":"Set to false if the patient does not have a history of venous thromboembolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of venous thromboembolism.","meaning":"Boolean indicating whether the patient has a history of venous thromboembolism."}  ;; "previous venous thromboembolism"
(declare-const patient_has_finding_of_thromboembolism_of_vein_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has venous thromboembolism.","when_to_set_to_false":"Set to false if the patient currently does not have venous thromboembolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has venous thromboembolism.","meaning":"Boolean indicating whether the patient currently has venous thromboembolism."}  ;; "current venous thromboembolism"
(declare-const patient_has_finding_of_obesity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has obesity.","when_to_set_to_false":"Set to false if the patient currently does not have obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has obesity.","meaning":"Boolean indicating whether the patient currently has obesity."}  ;; "obesity"
(declare-const patient_is_undergoing_androgen_deprivation_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing androgen deprivation therapy.","when_to_set_to_false":"Set to false if the patient is not currently undergoing androgen deprivation therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing androgen deprivation therapy.","meaning":"Boolean indicating whether the patient is currently undergoing androgen deprivation therapy."}  ;; "antiandrogen hormone therapy"
(declare-const patient_is_undergoing_androgen_deprivation_therapy_now@@oral Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing oral androgen deprivation therapy.","when_to_set_to_false":"Set to false if the patient is currently undergoing androgen deprivation therapy but it is not oral.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's androgen deprivation therapy is oral.","meaning":"Boolean indicating whether the patient's androgen deprivation therapy is oral."}  ;; "oral antiandrogen hormone therapy"
(declare-const patient_is_undergoing_estrogen_hormone_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing estrogen hormone therapy.","when_to_set_to_false":"Set to false if the patient is not currently undergoing estrogen hormone therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing estrogen hormone therapy.","meaning":"Boolean indicating whether the patient is currently undergoing estrogen hormone therapy."}  ;; "estrogen hormone therapy"
(declare-const patient_is_undergoing_estrogen_hormone_therapy_now@@oral Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing oral estrogen hormone therapy.","when_to_set_to_false":"Set to false if the patient is currently undergoing estrogen hormone therapy but it is not oral.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's estrogen hormone therapy is oral.","meaning":"Boolean indicating whether the patient's estrogen hormone therapy is oral."}  ;; "oral estrogen hormone therapy"
(declare-const patient_has_finding_of_chronic_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have chronic heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic heart failure.","meaning":"Boolean indicating whether the patient currently has chronic heart failure."}  ;; "chronic heart failure"
(declare-const patient_has_finding_of_chronic_respiratory_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic respiratory failure.","when_to_set_to_false":"Set to false if the patient currently does not have chronic respiratory failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic respiratory failure.","meaning":"Boolean indicating whether the patient currently has chronic respiratory failure."}  ;; "chronic respiratory failure"
(declare-const patients_risk_factor_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has at least one risk factor for venous thromboembolism as specified in the eligibility requirement.","when_to_set_to_false":"Set to false if the patient currently does not have any of the specified risk factors for venous thromboembolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any of the specified risk factors for venous thromboembolism.","meaning":"Boolean indicating whether the patient currently has at least one risk factor for venous thromboembolism."}  ;; "risk factor"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition of "patients_risk_factor_is_positive_now" as at least one of the specified risk factors
(assert
  (! (= patients_risk_factor_is_positive_now
        (or (>= patient_age_value_recorded_now_in_years 75.0) ;; "age ≥ 75 years"
            patient_has_finding_of_malignant_neoplastic_disease_now@@active ;; "active cancer"
            patient_has_finding_of_malignant_neoplastic_disease_inthepast6months ;; "having received treatment for cancer within the last 6 months"
            patient_has_finding_of_myeloproliferative_disorder_now@@active ;; "active myeloproliferative disorder"
            patient_has_finding_of_thromboembolism_of_vein_inthehistory ;; "previous venous thromboembolism"
            patient_has_finding_of_obesity_now ;; "obesity"
            patient_is_undergoing_androgen_deprivation_therapy_now@@oral ;; "oral antiandrogen hormone therapy"
            patient_is_undergoing_estrogen_hormone_therapy_now@@oral ;; "oral estrogen hormone therapy"
            patient_has_finding_of_chronic_heart_failure_now ;; "chronic heart failure"
            patient_has_finding_of_chronic_respiratory_failure_now)) ;; "chronic respiratory failure"
     :named REQ1_AUXILIARY0))

;; Qualifier variables imply their stem variables
(assert
  (! (=> patient_has_finding_of_malignant_neoplastic_disease_now@@active
         patient_has_finding_of_malignant_neoplastic_disease_now)
     :named REQ1_AUXILIARY1))
(assert
  (! (=> patient_has_finding_of_myeloproliferative_disorder_now@@active
         patient_has_finding_of_myeloproliferative_disorder_now)
     :named REQ1_AUXILIARY2))
(assert
  (! (=> patient_is_undergoing_androgen_deprivation_therapy_now@@oral
         patient_is_undergoing_androgen_deprivation_therapy_now)
     :named REQ1_AUXILIARY3))
(assert
  (! (=> patient_is_undergoing_estrogen_hormone_therapy_now@@oral
         patient_is_undergoing_estrogen_hormone_therapy_now)
     :named REQ1_AUXILIARY4))

;; ===================== Constraint Assertions (REQ 1) =====================
;; At least one risk factor must be present
(assert
  (! patients_risk_factor_is_positive_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))
