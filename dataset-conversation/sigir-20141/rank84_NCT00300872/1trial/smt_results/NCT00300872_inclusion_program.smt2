;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 20 years AND aged ≤ 80 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 20.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 20 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 80.0)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 80 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_apnea_hypopnea_index_value_recorded_now_withunit_per_hour Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's apnea hypopnea index (AHI) per hour is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's apnea hypopnea index (AHI) per hour, recorded now."} ;; "apnea hypopnea index > 10 per hour on polysomnography"
(declare-const patient_apnea_hypopnea_index_value_recorded_now_withunit_per_hour@@measured_on_polysomnography Bool) ;; {"when_to_set_to_true":"Set to true if the patient's apnea hypopnea index (AHI) per hour value recorded now was measured on polysomnography.","when_to_set_to_false":"Set to false if the patient's apnea hypopnea index (AHI) per hour value recorded now was not measured on polysomnography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the AHI value was measured on polysomnography.","meaning":"Boolean indicating whether the patient's apnea hypopnea index (AHI) per hour value recorded now was measured on polysomnography."} ;; "apnea hypopnea index > 10 per hour on polysomnography"
(declare-const patient_has_symptoms_of_obstructive_sleep_apnea_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of obstructive sleep apnea syndrome, regardless of which specific symptoms are present.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of obstructive sleep apnea syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of obstructive sleep apnea syndrome.","meaning":"Boolean indicating whether the patient currently has symptoms of obstructive sleep apnea syndrome."} ;; "symptoms of obstructive sleep apnea syndrome (with non-exhaustive examples (as described previously))"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Apnea hypopnea index > 10 per hour on polysomnography
(assert
  (! (and
        patient_apnea_hypopnea_index_value_recorded_now_withunit_per_hour@@measured_on_polysomnography
        (> patient_apnea_hypopnea_index_value_recorded_now_withunit_per_hour 10.0))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "apnea hypopnea index > 10 per hour on polysomnography"

;; Component 1: Symptoms of obstructive sleep apnea syndrome
(assert
  (! patient_has_symptoms_of_obstructive_sleep_apnea_syndrome_now
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "symptoms of obstructive sleep apnea syndrome (with non-exhaustive examples (as described previously))"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_ess_epworth_sleepiness_scale_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's Epworth Sleepiness Scale score is recorded now.","when_to_set_to_null":"Set to null if no such score is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's current Epworth Sleepiness Scale score."} ;; "Epworth Sleepiness Scale score"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (> patient_ess_epworth_sleepiness_scale_score_value_recorded_now_withunit_score 10)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have Epworth Sleepiness Scale score > 10."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypertensive disorder (hypertension)."} ;; "hypertension"
(declare-const patient_has_diagnosis_of_hypertensive_disorder_now@@no_alteration_of_antihypertensive_medication_during_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypertensive disorder (hypertension) and there has been no alteration of antihypertensive medication during the study period.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of hypertensive disorder (hypertension) and there has been any alteration of antihypertensive medication during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether antihypertensive medication was altered during the study period for a patient with hypertension.","meaning":"Boolean indicating whether the patient with hypertension has had no alteration of antihypertensive medication during the study period."} ;; "NOT alteration of antihypertensive medication during the study period"
(declare-const patient_is_exposed_to_hypotensive_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to antihypertensive medication.","when_to_set_to_false":"Set to false if the patient is currently not exposed to antihypertensive medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to antihypertensive medication.","meaning":"Boolean indicating whether the patient is currently exposed to antihypertensive medication."} ;; "antihypertensive medication"
(declare-const patient_is_exposed_to_hypotensive_agent_now@@not_altered_during_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to antihypertensive medication and the regimen has not been altered during the study period.","when_to_set_to_false":"Set to false if the patient is currently exposed to antihypertensive medication and the regimen has been altered during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antihypertensive medication regimen was altered during the study period.","meaning":"Boolean indicating whether the patient is currently exposed to antihypertensive medication and the regimen has not been altered during the study period."} ;; "NOT alteration of antihypertensive medication during the study period"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_hypertensive_disorder_now@@no_alteration_of_antihypertensive_medication_during_study_period
         patient_has_diagnosis_of_hypertensive_disorder_now)
     :named REQ3_AUXILIARY0)) ;; "To be included, the patient may have hypertension, provided NOT alteration of antihypertensive medication during the study period."

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_is_exposed_to_hypotensive_agent_now@@not_altered_during_study_period
         patient_is_exposed_to_hypotensive_agent_now)
     :named REQ3_AUXILIARY1)) ;; "To be included, the patient may have hypertension, provided NOT alteration of antihypertensive medication during the study period."

;; ===================== Constraint Assertions (REQ 3) =====================
;; Inclusion: patient may have hypertension, but only if there has been NO alteration of antihypertensive medication during the study period
(assert
  (! (or (not patient_has_diagnosis_of_hypertensive_disorder_now)
         patient_has_diagnosis_of_hypertensive_disorder_now@@no_alteration_of_antihypertensive_medication_during_study_period)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient may have hypertension, provided NOT alteration of antihypertensive medication during the study period."
