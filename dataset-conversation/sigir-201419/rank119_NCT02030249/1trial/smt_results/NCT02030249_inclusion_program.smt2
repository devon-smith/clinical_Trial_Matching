;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged 25 - 45 years or aged 55 - 70 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must be aged 25 - 45 years or aged 55 - 70 years.
(assert
  (! (or (and (>= patient_age_value_recorded_now_in_years 25.0)
              (<= patient_age_value_recorded_now_in_years 45.0))
         (and (>= patient_age_value_recorded_now_in_years 55.0)
              (<= patient_age_value_recorded_now_in_years 70.0)))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged 25 - 45 years or aged 55 - 70 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter Real) ;; {"when_to_set_to_value":"Set to the measured BMI value in kilograms per square meter if a current measurement is available.","when_to_set_to_null":"Set to null if no current BMI measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kilograms per square meter."}  ;; "body mass index"
(declare-const patient_has_finding_of_obesity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has obesity status.","when_to_set_to_false":"Set to false if the patient currently does not have obesity status.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has obesity status.","meaning":"Boolean indicating whether the patient currently has obesity status."}  ;; "obesity status"
(declare-const patient_has_finding_of_overweight_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has overweight status.","when_to_set_to_false":"Set to false if the patient currently does not have overweight status.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has overweight status.","meaning":"Boolean indicating whether the patient currently has overweight status."}  ;; "overweight status"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition in the requirement: "obesity status, defined as body mass index greater than 25 kilograms per square meter."
(assert
  (! (= patient_has_finding_of_obesity_now
        (> patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 25.0))
     :named REQ1_AUXILIARY0)) ;; "obesity status, defined as body mass index greater than 25 kilograms per square meter."

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: "To be included, the patient must have overweight status or have obesity status, defined as body mass index greater than 25 kilograms per square meter."
(assert
  (! (or patient_has_finding_of_overweight_now
         patient_has_finding_of_obesity_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_prediabetes_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of prediabetes.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of prediabetes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has prediabetes.","meaning":"Boolean indicating whether the patient currently has prediabetes."} ;; "pre-diabetes"
(declare-const patient_has_finding_of_prediabetes_now@@assessed_by_who_or_idf_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's prediabetes is assessed by criteria from the World Health Organization or International Diabetes Foundation.","when_to_set_to_false":"Set to false if the patient's prediabetes is not assessed by these criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's prediabetes is assessed by these criteria.","meaning":"Boolean indicating whether the patient's prediabetes is assessed by WHO or IDF criteria."} ;; "criteria from World Health Organization or International Diabetes Foundation"
(declare-const patient_has_finding_of_impaired_fasting_glycaemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of impaired fasting glycaemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of impaired fasting glycaemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has impaired fasting glycaemia.","meaning":"Boolean indicating whether the patient currently has impaired fasting glycaemia."} ;; "impaired fasting glucose"
(declare-const patient_has_finding_of_impaired_glucose_tolerance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of impaired glucose tolerance.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of impaired glucose tolerance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has impaired glucose tolerance.","meaning":"Boolean indicating whether the patient currently has impaired glucose tolerance."} ;; "impaired glucose tolerance"
(declare-const patient_has_finding_of_impaired_glucose_tolerance_now@@measured_at_2_hours_after_ogtt Bool) ;; {"when_to_set_to_true":"Set to true if the patient's impaired glucose tolerance is measured at 2 hours after oral administration of 75 grams glucose (OGTT).","when_to_set_to_false":"Set to false if the measurement is not at 2 hours after OGTT.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement is at 2 hours after OGTT.","meaning":"Boolean indicating whether the patient's impaired glucose tolerance is measured at 2 hours after OGTT."} ;; "measured at 2 hours after oral administration of 75 grams glucose (oral glucose tolerance test)"
(declare-const patient_plasma_fasting_glucose_measurement_value_recorded_now_withunit_millimoles_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of fasting plasma glucose concentration (in millimoles per liter) recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current fasting plasma glucose concentration in millimoles per liter."} ;; "fasting plasma glucose concentration"
(declare-const patient_plasma_glucose_measurement_value_recorded_now_withunit_millimoles_per_liter_at_2_hours_after_ogtt Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of venous plasma glucose concentration (in millimoles per liter) recorded now is available and measured at 2 hours after oral administration of 75 grams glucose (OGTT).","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current venous plasma glucose concentration in millimoles per liter measured at 2 hours after OGTT."} ;; "venous plasma glucose concentration of 7.8 - 11.0 millimoles per liter at 2 hours after oral administration of 75 grams glucose (oral glucose tolerance test)"
(declare-const patient_has_undergone_hemoglobin_a1c_measurement_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone hemoglobin A1c measurement now.","when_to_set_to_false":"Set to false if the patient has not undergone hemoglobin A1c measurement now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone hemoglobin A1c measurement now.","meaning":"Boolean indicating whether the patient has undergone hemoglobin A1c measurement now."} ;; "Hemoglobin A1c is not used as an inclusion criteria in the screening."

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_prediabetes_now@@assessed_by_who_or_idf_criteria
         patient_has_finding_of_prediabetes_now)
     :named REQ2_AUXILIARY0)) ;; "criteria from World Health Organization or International Diabetes Foundation"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_impaired_glucose_tolerance_now@@measured_at_2_hours_after_ogtt
         patient_has_finding_of_impaired_glucose_tolerance_now)
     :named REQ2_AUXILIARY1)) ;; "measured at 2 hours after oral administration of 75 grams glucose (oral glucose tolerance test)"

;; Impaired fasting glycaemia definition: fasting plasma glucose 5.6 - 6.9 mmol/L
(assert
  (! (= patient_has_finding_of_impaired_fasting_glycaemia_now
        (and (>= patient_plasma_fasting_glucose_measurement_value_recorded_now_withunit_millimoles_per_liter 5.6)
             (<= patient_plasma_fasting_glucose_measurement_value_recorded_now_withunit_millimoles_per_liter 6.9)))
     :named REQ2_AUXILIARY2)) ;; "impaired fasting glucose defined as fasting venous plasma glucose concentration 5.6 - 6.9 millimoles per liter"

;; Impaired glucose tolerance definition: 2h OGTT plasma glucose 7.8 - 11.0 mmol/L AND fasting plasma glucose < 7.0 mmol/L
(assert
  (! (= patient_has_finding_of_impaired_glucose_tolerance_now@@measured_at_2_hours_after_ogtt
        (and (>= patient_plasma_glucose_measurement_value_recorded_now_withunit_millimoles_per_liter_at_2_hours_after_ogtt 7.8)
             (<= patient_plasma_glucose_measurement_value_recorded_now_withunit_millimoles_per_liter_at_2_hours_after_ogtt 11.0)
             (< patient_plasma_fasting_glucose_measurement_value_recorded_now_withunit_millimoles_per_liter 7.0)))
     :named REQ2_AUXILIARY3)) ;; "impaired glucose tolerance defined as venous plasma glucose concentration of 7.8 - 11.0 millimoles per liter at 2 hours after oral administration of 75 grams glucose (oral glucose tolerance test), with fasting plasma glucose less than 7.0 millimoles per liter"

;; Impaired glucose tolerance (stem) is true if the qualifier is true
(assert
  (! (= patient_has_finding_of_impaired_glucose_tolerance_now
        patient_has_finding_of_impaired_glucose_tolerance_now@@measured_at_2_hours_after_ogtt)
     :named REQ2_AUXILIARY4)) ;; "impaired glucose tolerance defined as venous plasma glucose concentration of 7.8 - 11.0 millimoles per liter at 2 hours after oral administration of 75 grams glucose (oral glucose tolerance test), with fasting plasma glucose less than 7.0 millimoles per liter"

;; Prediabetes (stem) is true if assessed by WHO/IDF criteria and either impaired fasting glycaemia or impaired glucose tolerance
(assert
  (! (= patient_has_finding_of_prediabetes_now@@assessed_by_who_or_idf_criteria
        (or patient_has_finding_of_impaired_fasting_glycaemia_now
            patient_has_finding_of_impaired_glucose_tolerance_now))
     :named REQ2_AUXILIARY5)) ;; "pre-diabetes, as assessed by the criteria from World Health Organization or International Diabetes Foundation: impaired fasting glucose ... or impaired glucose tolerance ..."

;; ===================== Constraint Assertions (REQ 2) =====================
;; Inclusion: patient must have prediabetes assessed by WHO/IDF criteria
(assert
  (! patient_has_finding_of_prediabetes_now@@assessed_by_who_or_idf_criteria
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have pre-diabetes, as assessed by the criteria from World Health Organization or International Diabetes Foundation: impaired fasting glucose ... or impaired glucose tolerance ... Hemoglobin A1c is not used as an inclusion criteria in the screening."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_provided_informed_consent_for_inclusion Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided informed consent for inclusion in the study.","when_to_set_to_false":"Set to false if the patient has not provided informed consent for inclusion in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided informed consent for inclusion in the study.","meaning":"Boolean indicating whether the patient has provided informed consent for inclusion in the study."} ;; "To be included, the patient must provide informed consent."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_provided_informed_consent_for_inclusion
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must provide informed consent."

;; ===================== Declarations for the criterion (REQ 4) =====================
;; No new variables are needed for this requirement, as there are no restrictions on ethnic group membership.
;; "To be included, the patient may be a member of any ethnic group; there are no restrictions."

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; No auxiliary assertions are needed, as the requirement is always satisfiable.

;; ===================== Constraint Assertions (REQ 4) =====================
;; The requirement is always satisfiable; no restriction is imposed.
(assert
  (! true
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient may be a member of any ethnic group; there are no restrictions."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a smoker.","when_to_set_to_false":"Set to false if the patient is currently not a smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a smoker.","meaning":"Boolean indicating whether the patient is currently a smoker."}  ;; "smoker"
(declare-const patient_has_finding_of_smoker_now@@no_recent_change_in_smoking_habits_within_1_month Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a smoker and has not changed smoking habits within the past 1 month.","when_to_set_to_false":"Set to false if the patient is currently a smoker but has changed smoking habits within the past 1 month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has changed smoking habits within the past 1 month.","meaning":"Boolean indicating whether the patient is currently a smoker and has not changed smoking habits within the past 1 month."} ;; "has not recently (within 1 month) changed smoking habits"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies stem variable: if the patient is a smoker with no recent change, then the patient is a smoker
(assert
  (! (=> patient_has_finding_of_smoker_now@@no_recent_change_in_smoking_habits_within_1_month
         patient_has_finding_of_smoker_now)
     :named REQ5_AUXILIARY0)) ;; "the patient is currently a smoker and has not changed smoking habits within the past 1 month" implies "the patient is currently a smoker"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Inclusion: patient may be a smoker, provided the patient has not recently (within 1 month) changed smoking habits
(assert
  (! (or (not patient_has_finding_of_smoker_now)
         patient_has_finding_of_smoker_now@@no_recent_change_in_smoking_habits_within_1_month)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient may be a smoker, provided the patient has not recently (within 1 month) changed smoking habits"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_motivation_to_be_randomized_and_follow_protocol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has motivation to be randomized to any of the groups and to do their best to follow the given protocol.","when_to_set_to_false":"Set to false if the patient currently does not have motivation to be randomized to any of the groups and to do their best to follow the given protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has motivation to be randomized to any of the groups and to do their best to follow the given protocol.","meaning":"Boolean indicating whether the patient currently has motivation to be randomized to any of the groups and to do their best to follow the given protocol."} ;; "motivation to be randomized to any of the groups and to do the best to follow the given protocol"
(declare-const patient_has_willingness_to_be_randomized_and_follow_protocol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has willingness to be randomized to any of the groups and to do their best to follow the given protocol.","when_to_set_to_false":"Set to false if the patient currently does not have willingness to be randomized to any of the groups and to do their best to follow the given protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has willingness to be randomized to any of the groups and to do their best to follow the given protocol.","meaning":"Boolean indicating whether the patient currently has willingness to be randomized to any of the groups and to do their best to follow the given protocol."} ;; "willingness to be randomized to any of the groups and to do the best to follow the given protocol"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (and patient_has_motivation_to_be_randomized_and_follow_protocol_now
          patient_has_willingness_to_be_randomized_and_follow_protocol_now)
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have motivation and willingness to be randomized to any of the groups and to do the best to follow the given protocol."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_is_able_to_participate_at_clinical_investigation_departments_during_normal_working_hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to participate at Clinical Investigation Departments during normal working hours.","when_to_set_to_false":"Set to false if the patient is not able to participate at Clinical Investigation Departments during normal working hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to participate at Clinical Investigation Departments during normal working hours.","meaning":"Boolean indicating whether the patient is able to participate at Clinical Investigation Departments during normal working hours."} ;; "To be included, the patient must be able to participate at Clinical Investigation Departments during normal working hours."

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! patient_is_able_to_participate_at_clinical_investigation_departments_during_normal_working_hours
     :named REQ7_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be able to participate at Clinical Investigation Departments during normal working hours."
