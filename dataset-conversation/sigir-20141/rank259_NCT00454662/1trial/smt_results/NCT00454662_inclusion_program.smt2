;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_is_outpatient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as an outpatient.","when_to_set_to_false":"Set to false if the patient is currently not classified as an outpatient (i.e., inpatient or other status).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an outpatient.","meaning":"Boolean indicating whether the patient is currently an outpatient."} ;; "To be included, the patient must be an outpatient."
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged ≥ 65 years AND aged < 85 years at the time of informed consent"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_is_outpatient_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be an outpatient."

(assert
  (! (>= patient_age_value_recorded_now_in_years 65)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 65 years at the time of informed consent."

(assert
  (! (< patient_age_value_recorded_now_in_years 85)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged < 85 years at the time of informed consent."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's systolic blood pressure (in millimeters of mercury) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's systolic blood pressure (in millimeters of mercury) measured now."} ;; "systolic blood pressure ≥ 140 millimeters of mercury"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_in_sitting_position Bool) ;; {"when_to_set_to_true":"Set to true if the systolic blood pressure measurement was taken in a sitting position.","when_to_set_to_false":"Set to false if the measurement was not taken in a sitting position.","when_to_set_to_null":"Set to null if it is unknown or not documented whether the measurement was taken in a sitting position.","meaning":"Indicates whether the systolic blood pressure measurement was taken in a sitting position."} ;; "in a sitting position"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_at_clinic Bool) ;; {"when_to_set_to_true":"Set to true if the systolic blood pressure measurement was taken at a clinic.","when_to_set_to_false":"Set to false if the measurement was not taken at a clinic.","when_to_set_to_null":"Set to null if it is unknown or not documented whether the measurement was taken at a clinic.","meaning":"Indicates whether the systolic blood pressure measurement was taken at a clinic."} ;; "at clinic"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@on_two_consecutive_measurements Bool) ;; {"when_to_set_to_true":"Set to true if the systolic blood pressure value reflects two consecutive measurements.","when_to_set_to_false":"Set to false if it does not reflect two consecutive measurements.","when_to_set_to_null":"Set to null if it is unknown or not documented whether the value reflects two consecutive measurements.","meaning":"Indicates whether the systolic blood pressure value reflects two consecutive measurements."} ;; "on two consecutive measurements"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@during_use_of_at_least_one_antihypertensive_medication Bool) ;; {"when_to_set_to_true":"Set to true if the systolic blood pressure measurement was taken during use of at least one antihypertensive medication.","when_to_set_to_false":"Set to false if the measurement was not taken during use of at least one antihypertensive medication.","when_to_set_to_null":"Set to null if it is unknown or not documented whether the measurement was taken during use of at least one antihypertensive medication.","meaning":"Indicates whether the systolic blood pressure measurement was taken during use of at least one antihypertensive medication."} ;; "during use of ≥ 1 antihypertensive medication"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's diastolic blood pressure (in millimeters of mercury) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's diastolic blood pressure (in millimeters of mercury) measured now."} ;; "diastolic blood pressure ≥ 90 millimeters of mercury"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_in_sitting_position Bool) ;; {"when_to_set_to_true":"Set to true if the diastolic blood pressure measurement was taken in a sitting position.","when_to_set_to_false":"Set to false if the measurement was not taken in a sitting position.","when_to_set_to_null":"Set to null if it is unknown or not documented whether the measurement was taken in a sitting position.","meaning":"Indicates whether the diastolic blood pressure measurement was taken in a sitting position."} ;; "in a sitting position"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_at_clinic Bool) ;; {"when_to_set_to_true":"Set to true if the diastolic blood pressure measurement was taken at a clinic.","when_to_set_to_false":"Set to false if the measurement was not taken at a clinic.","when_to_set_to_null":"Set to null if it is unknown or not documented whether the measurement was taken at a clinic.","meaning":"Indicates whether the diastolic blood pressure measurement was taken at a clinic."} ;; "at clinic"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@on_two_consecutive_measurements Bool) ;; {"when_to_set_to_true":"Set to true if the diastolic blood pressure value reflects two consecutive measurements.","when_to_set_to_false":"Set to false if it does not reflect two consecutive measurements.","when_to_set_to_null":"Set to null if it is unknown or not documented whether the value reflects two consecutive measurements.","meaning":"Indicates whether the diastolic blood pressure value reflects two consecutive measurements."} ;; "on two consecutive measurements"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@during_use_of_at_least_one_antihypertensive_medication Bool) ;; {"when_to_set_to_true":"Set to true if the diastolic blood pressure measurement was taken during use of at least one antihypertensive medication.","when_to_set_to_false":"Set to false if the measurement was not taken during use of at least one antihypertensive medication.","when_to_set_to_null":"Set to null if it is unknown or not documented whether the measurement was taken during use of at least one antihypertensive medication.","meaning":"Indicates whether the diastolic blood pressure measurement was taken during use of at least one antihypertensive medication."} ;; "during use of ≥ 1 antihypertensive medication"
(declare-const patient_is_exposed_to_hypotensive_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to (i.e., using) a hypotensive agent (antihypertensive medication).","when_to_set_to_false":"Set to false if the patient is not currently exposed to a hypotensive agent.","when_to_set_to_null":"Set to null if it is unknown or not documented whether the patient is currently exposed to a hypotensive agent (antihypertensive medication).","meaning":"Boolean indicating whether the patient is currently exposed to (i.e., using) a hypotensive agent (antihypertensive medication)."} ;; "during use of ≥ 1 antihypertensive medication"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables for SBP
(assert
  (! (=> patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_in_sitting_position
         true)
     :named REQ1_AUXILIARY0)) ;; "in a sitting position" for SBP

(assert
  (! (=> patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_at_clinic
         true)
     :named REQ1_AUXILIARY1)) ;; "at clinic" for SBP

(assert
  (! (=> patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@on_two_consecutive_measurements
         true)
     :named REQ1_AUXILIARY2)) ;; "on two consecutive measurements" for SBP

(assert
  (! (=> patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@during_use_of_at_least_one_antihypertensive_medication
         patient_is_exposed_to_hypotensive_agent_now)
     :named REQ1_AUXILIARY3)) ;; "during use of ≥ 1 antihypertensive medication" for SBP

;; Qualifier variables imply corresponding stem variables for DBP
(assert
  (! (=> patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_in_sitting_position
         true)
     :named REQ1_AUXILIARY4)) ;; "in a sitting position" for DBP

(assert
  (! (=> patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_at_clinic
         true)
     :named REQ1_AUXILIARY5)) ;; "at clinic" for DBP

(assert
  (! (=> patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@on_two_consecutive_measurements
         true)
     :named REQ1_AUXILIARY6)) ;; "on two consecutive measurements" for DBP

(assert
  (! (=> patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@during_use_of_at_least_one_antihypertensive_medication
         patient_is_exposed_to_hypotensive_agent_now)
     :named REQ1_AUXILIARY7)) ;; "during use of ≥ 1 antihypertensive medication" for DBP

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must have (SBP ≥ 140 OR DBP ≥ 90) in a sitting position, on two consecutive measurements, at clinic, during use of ≥ 1 antihypertensive medication
(assert
  (! (or
        (and
          (>= patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 140.0)
          patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_in_sitting_position
          patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_at_clinic
          patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@on_two_consecutive_measurements
          patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@during_use_of_at_least_one_antihypertensive_medication
        )
        (and
          (>= patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 90.0)
          patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_in_sitting_position
          patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_at_clinic
          patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@on_two_consecutive_measurements
          patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@during_use_of_at_least_one_antihypertensive_medication
        )
     )
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have ((systolic blood pressure ≥ 140 millimeters of mercury OR diastolic blood pressure ≥ 90 millimeters of mercury) in a sitting position on two consecutive measurements at clinic during use of ≥ 1 antihypertensive medication)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_not_taking_antihypertensive_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is not currently taking any antihypertensive medication at the time of blood pressure measurement.","when_to_set_to_false":"Set to false if the patient is currently taking any antihypertensive medication at the time of blood pressure measurement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any antihypertensive medication at the time of blood pressure measurement.","meaning":"Boolean indicating whether the patient is not currently taking any antihypertensive medication at the time of blood pressure measurement."} ;; "without antihypertensive medication"

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must have (SBP ≥ 160 mmHg OR DBP ≥ 100 mmHg) in a sitting position, on two consecutive measurements, at clinic, and without antihypertensive medication.
(assert
  (! (and
        ;; Systolic BP path
        (or
          (and (>= patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 160.0)
               patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_in_sitting_position
               patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_at_clinic
               patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@on_two_consecutive_measurements)
          ;; Diastolic BP path
          (and (>= patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 100.0)
               patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_in_sitting_position
               patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_at_clinic
               patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@on_two_consecutive_measurements))
        patient_is_not_taking_antihypertensive_medication_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have ((systolic blood pressure ≥ 160 millimeters of mercury OR diastolic blood pressure ≥ 100 millimeters of mercury) in a sitting position on two consecutive measurements at clinic without antihypertensive medication)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of cerebrovascular accident at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of cerebrovascular accident.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of cerebrovascular accident.","meaning":"Boolean indicating whether the patient has a history of cerebrovascular accident."} ;; "medical history of cerebrovascular accident"
(declare-const patient_has_diagnosis_of_cerebral_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of cerebral infarction at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of cerebral infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of cerebral infarction.","meaning":"Boolean indicating whether the patient has a history of cerebral infarction."} ;; "medical history of cerebral infarction"
(declare-const patient_has_diagnosis_of_brain_hemorrhage_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of brain hemorrhage at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of brain hemorrhage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of brain hemorrhage.","meaning":"Boolean indicating whether the patient has a history of brain hemorrhage."} ;; "medical history of brain hemorrhage"
(declare-const patient_has_diagnosis_of_subarachnoid_hemorrhage_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of subarachnoid hemorrhage at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of subarachnoid hemorrhage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of subarachnoid hemorrhage.","meaning":"Boolean indicating whether the patient has a history of subarachnoid hemorrhage."} ;; "medical history of subarachnoid hemorrhage"
(declare-const patient_time_since_cerebrovascular_accident_registration_value_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months since the patient's most recent cerebrovascular accident at the time of registration, if known.","when_to_set_to_null":"Set to null if the time since cerebrovascular accident is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of months since the patient's most recent cerebrovascular accident at the time of registration."} ;; "occurring ≥ 6 months prior to registration"
(declare-const patient_time_since_cerebral_infarction_registration_value_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months since the patient's most recent cerebral infarction at the time of registration, if known.","when_to_set_to_null":"Set to null if the time since cerebral infarction is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of months since the patient's most recent cerebral infarction at the time of registration."} ;; "occurring ≥ 6 months prior to registration"
(declare-const patient_time_since_brain_hemorrhage_registration_value_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months since the patient's most recent brain hemorrhage at the time of registration, if known.","when_to_set_to_null":"Set to null if the time since brain hemorrhage is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of months since the patient's most recent brain hemorrhage at the time of registration."} ;; "occurring ≥ 6 months prior to registration"
(declare-const patient_time_since_subarachnoid_hemorrhage_registration_value_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months since the patient's most recent subarachnoid hemorrhage at the time of registration, if known.","when_to_set_to_null":"Set to null if the time since subarachnoid hemorrhage is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of months since the patient's most recent subarachnoid hemorrhage at the time of registration."} ;; "occurring ≥ 6 months prior to registration"

(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of myocardial infarction at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of myocardial infarction.","meaning":"Boolean indicating whether the patient has a history of myocardial infarction."} ;; "medical history of myocardial infarction"
(declare-const patient_time_since_myocardial_infarction_registration_value_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months since the patient's most recent myocardial infarction at the time of registration, if known.","when_to_set_to_null":"Set to null if the time since myocardial infarction is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of months since the patient's most recent myocardial infarction at the time of registration."} ;; "occurring ≥ 6 months prior to registration"

(declare-const patient_has_undergone_coronary_revascularization_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone any coronary revascularization procedure (percutaneous coronary intervention or coronary artery bypass grafting) at any time in the past.","when_to_set_to_false":"Set to false if the patient has not undergone any coronary revascularization procedure in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone coronary revascularization in the past.","meaning":"Boolean indicating whether the patient has undergone coronary revascularization in the past, including percutaneous coronary intervention or coronary artery bypass grafting."} ;; "medical history of coronary revascularization"
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone percutaneous coronary intervention at any time in the past.","when_to_set_to_false":"Set to false if the patient has not undergone percutaneous coronary intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone percutaneous coronary intervention.","meaning":"Boolean indicating whether the patient has undergone percutaneous coronary intervention in the past."} ;; "percutaneous coronary intervention"
(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone coronary artery bypass grafting at any time in the past.","when_to_set_to_false":"Set to false if the patient has not undergone coronary artery bypass grafting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone coronary artery bypass grafting.","meaning":"Boolean indicating whether the patient has undergone coronary artery bypass grafting in the past."} ;; "coronary artery bypass grafting"
(declare-const patient_time_since_percutaneous_coronary_intervention_registration_value_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months since the patient's most recent percutaneous coronary intervention at the time of registration, if known.","when_to_set_to_null":"Set to null if the time since percutaneous coronary intervention is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of months since the patient's most recent percutaneous coronary intervention at the time of registration."} ;; "occurring ≥ 6 months prior to registration"
(declare-const patient_time_since_coronary_artery_bypass_graft_registration_value_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months since the patient's most recent coronary artery bypass grafting at the time of registration, if known.","when_to_set_to_null":"Set to null if the time since coronary artery bypass grafting is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of months since the patient's most recent coronary artery bypass grafting at the time of registration."} ;; "occurring ≥ 6 months prior to registration"

(declare-const patient_has_diagnosis_of_angina_pectoris_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of angina pectoris at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of angina pectoris.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of angina pectoris.","meaning":"Boolean indicating whether the patient has a history of angina pectoris."} ;; "medical history of angina pectoris"
(declare-const patient_has_diagnosis_of_angina_pectoris_hospitalization_within_6_months_prior_to_registration Bool) ;; {"when_to_set_to_true":"Set to true if the patient with a history of angina pectoris has been hospitalized for angina pectoris within 6 months prior to registration.","when_to_set_to_false":"Set to false if the patient with a history of angina pectoris has not been hospitalized for angina pectoris within 6 months prior to registration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient with a history of angina pectoris has been hospitalized for angina pectoris within 6 months prior to registration.","meaning":"Boolean indicating whether the patient with a history of angina pectoris has been hospitalized for angina pectoris within 6 months prior to registration."} ;; "except for patients having medical history of hospitalization within 6 months prior to registration"

(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male (e.g., female or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is male at the current time."} ;; "male sex"
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has diabetes mellitus."} ;; "current diabetes mellitus"
(declare-const patient_glucose_measurement_fasting_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if a fasting glucose concentration (mg/dL) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current fasting glucose concentration in mg/dL."} ;; "fasting glucose concentration ≥ 110 milligrams per deciliter"
(declare-const patient_post_prandial_blood_glucose_measurement_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if a postprandial glucose concentration (mg/dL) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current postprandial glucose concentration in mg/dL."} ;; "postprandial glucose concentration ≥ 140 milligrams per deciliter"
(declare-const patient_has_diagnosis_of_hypercholesterolemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypercholesterolemia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypercholesterolemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypercholesterolemia.","meaning":"Boolean indicating whether the patient currently has hypercholesterolemia."} ;; "hypercholesterolemia"
(declare-const patient_total_cholesterol_measurement_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if a total cholesterol concentration (mg/dL) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current total cholesterol concentration in mg/dL."} ;; "total cholesterol concentration ≥ 260 milligrams per deciliter"
(declare-const patient_hdl_cholesterol_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if a high-density lipoprotein cholesterol concentration (mg/dL) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current high-density lipoprotein cholesterol concentration in mg/dL."} ;; "high-density lipoprotein cholesterol concentration < 40 milligrams per deciliter"
(declare-const patient_has_diagnosis_of_microalbuminuria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of microalbuminuria.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of microalbuminuria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has microalbuminuria.","meaning":"Boolean indicating whether the patient currently has microalbuminuria."} ;; "microalbuminuria"
(declare-const patient_albumin_value_recorded_now_withunit_mg_per_g_creatinine Real) ;; {"when_to_set_to_value":"Set to the measured value if an albumin concentration (mg/g creatinine) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current albumin concentration in mg/g creatinine."} ;; "albumin/creatinine ratio ≥ 30 milligrams per gram creatinine"
(declare-const patient_creatinine_value_recorded_now_withunit_mg_per_g Real) ;; {"when_to_set_to_value":"Set to the measured value if a creatinine concentration (mg/g) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current creatinine concentration in mg/g."} ;; "albumin/creatinine ratio ≥ 30 milligrams per gram creatinine"
(declare-const patient_has_diagnosis_of_proteinuria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of proteinuria.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of proteinuria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has proteinuria.","meaning":"Boolean indicating whether the patient currently has proteinuria."} ;; "proteinuria"
(declare-const patient_protein_value_recorded_now_withunit_semiquantitative Real) ;; {"when_to_set_to_value":"Set to the measured value if a protein concentration (semiquantitative, e.g., 1+) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current protein concentration in semiquantitative units."} ;; "protein concentration ≥ 1+"
(declare-const patient_has_diagnosis_of_left_ventricular_hypertrophy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of left ventricular hypertrophy.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of left ventricular hypertrophy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has left ventricular hypertrophy.","meaning":"Boolean indicating whether the patient currently has left ventricular hypertrophy."} ;; "left ventricular hypertrophy"
(declare-const patient_has_undergone_electrocardiographic_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone electrocardiographic procedure (ECG) now.","when_to_set_to_false":"Set to false if the patient has not undergone electrocardiographic procedure (ECG) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone electrocardiographic procedure (ECG) now.","meaning":"Boolean indicating whether the patient has undergone electrocardiographic procedure (ECG) now."} ;; "ST-T change in the electrocardiogram"
(declare-const patient_s_wave_in_lead_v1_value_recorded_now_withunit_mm Real) ;; {"when_to_set_to_value":"Set to the measured amplitude of the S wave in lead V1 (mm) on the patient's current electrocardiogram, if available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the amplitude of the S wave in lead V1 on the patient's current electrocardiogram, measured in millimeters."} ;; "S wave in lead V1"
(declare-const patient_r_wave_in_lead_v5_value_recorded_now_withunit_mm Real) ;; {"when_to_set_to_value":"Set to the measured amplitude of the R wave in lead V5 (mm) on the patient's current electrocardiogram, if available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the amplitude of the R wave in lead V5 on the patient's current electrocardiogram, measured in millimeters."} ;; "R wave in lead V5"
(declare-const patient_left_ventricular_mass_index_value_recorded_now_withunit_g_per_m2 Real) ;; {"when_to_set_to_value":"Set to the measured value of the patient's current left ventricular mass index (g/m²), if available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current left ventricular mass index measured in grams per square meter."} ;; "left ventricular mass index"
(declare-const patient_left_ventricular_mass_index_value_recorded_now_withunit_g_per_m2@@sex_is_male Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is male and the left ventricular mass index is measured.","when_to_set_to_false":"Set to false if the patient's sex is not male or the left ventricular mass index is not measured.","when_to_set_to_null":"Set to null if the patient's sex or left ventricular mass index is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient's left ventricular mass index measurement applies to male patients."} ;; "left ventricular mass index: male"
(declare-const patient_left_ventricular_mass_index_value_recorded_now_withunit_g_per_m2@@sex_is_female Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is female and the left ventricular mass index is measured.","when_to_set_to_false":"Set to false if the patient's sex is not female or the left ventricular mass index is not measured.","when_to_set_to_null":"Set to null if the patient's sex or left ventricular mass index is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient's left ventricular mass index measurement applies to female patients."} ;; "left ventricular mass index: female"
(declare-const patients_risk_factor_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any risk factor relevant to cardiovascular disease.","when_to_set_to_false":"Set to false if the patient currently does not have any risk factor relevant to cardiovascular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any risk factor.","meaning":"Boolean indicating whether the patient currently has any risk factor."} ;; "risk factors"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Exhaustive subcategories for cerebrovascular accident
(assert
  (! (= patient_has_diagnosis_of_cerebrovascular_accident_inthehistory
        (or patient_has_diagnosis_of_cerebral_infarction_inthehistory
            patient_has_diagnosis_of_brain_hemorrhage_inthehistory
            patient_has_diagnosis_of_subarachnoid_hemorrhage_inthehistory))
     :named REQ3_AUXILIARY0)) ;; "medical history of cerebrovascular accident with exhaustive subcategories (medical history of cerebral infarction OR medical history of brain hemorrhage OR medical history of subarachnoid hemorrhage)"

;; Exhaustive subcategories for coronary revascularization
(assert
  (! (= patient_has_undergone_coronary_revascularization_inthehistory
        (or patient_has_undergone_percutaneous_coronary_intervention_inthehistory
            patient_has_undergone_coronary_artery_bypass_graft_inthehistory))
     :named REQ3_AUXILIARY1)) ;; "medical history of coronary revascularization with exhaustive subcategories (percutaneous coronary intervention OR coronary artery bypass grafting)"

;; Non-exhaustive examples for risk factors
(assert
  (! (=> (or patient_sex_is_male_now
             patient_has_diagnosis_of_diabetes_mellitus_now
             (>= patient_glucose_measurement_fasting_value_recorded_now_withunit_mg_per_dl 110.0)
             (>= patient_post_prandial_blood_glucose_measurement_value_recorded_now_withunit_mg_per_dl 140.0)
             patient_has_diagnosis_of_hypercholesterolemia_now
             (>= patient_total_cholesterol_measurement_value_recorded_now_withunit_mg_per_dl 260.0)
             (< patient_hdl_cholesterol_value_recorded_now_withunit_mg_per_dl 40.0)
             patient_has_diagnosis_of_microalbuminuria_now
             (>= patient_albumin_value_recorded_now_withunit_mg_per_g_creatinine 30.0)
             patient_has_diagnosis_of_proteinuria_now
             (>= patient_protein_value_recorded_now_withunit_semiquantitative 1.0)
             patient_has_diagnosis_of_left_ventricular_hypertrophy_now
             ;; LVH by ECG criteria
             (and patient_has_undergone_electrocardiographic_procedure_now
                  (>= (+ patient_s_wave_in_lead_v1_value_recorded_now_withunit_mm
                         patient_r_wave_in_lead_v5_value_recorded_now_withunit_mm) 35.0))
             ;; LV mass index criteria
             (and patient_left_ventricular_mass_index_value_recorded_now_withunit_g_per_m2@@sex_is_male
                  (>= patient_left_ventricular_mass_index_value_recorded_now_withunit_g_per_m2 125.0))
             (and patient_left_ventricular_mass_index_value_recorded_now_withunit_g_per_m2@@sex_is_female
                  (>= patient_left_ventricular_mass_index_value_recorded_now_withunit_g_per_m2 110.0))
         )
         patients_risk_factor_is_positive_now)
     :named REQ3_AUXILIARY2)) ;; "risk factors with non-exhaustive examples (...)"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Inclusion: at least one of the following medical history or risk factors
(assert
  (! (or
        ;; (medical history of cerebrovascular accident with exhaustive subcategories) occurring ≥ 6 months prior to registration
        (and patient_has_diagnosis_of_cerebrovascular_accident_inthehistory
             (>= patient_time_since_cerebrovascular_accident_registration_value_in_months 6.0))
        ;; (medical history of cerebral infarction) occurring ≥ 6 months prior to registration
        (and patient_has_diagnosis_of_cerebral_infarction_inthehistory
             (>= patient_time_since_cerebral_infarction_registration_value_in_months 6.0))
        ;; (medical history of brain hemorrhage) occurring ≥ 6 months prior to registration
        (and patient_has_diagnosis_of_brain_hemorrhage_inthehistory
             (>= patient_time_since_brain_hemorrhage_registration_value_in_months 6.0))
        ;; (medical history of subarachnoid hemorrhage) occurring ≥ 6 months prior to registration
        (and patient_has_diagnosis_of_subarachnoid_hemorrhage_inthehistory
             (>= patient_time_since_subarachnoid_hemorrhage_registration_value_in_months 6.0))
        ;; (medical history of myocardial infarction) occurring ≥ 6 months prior to registration
        (and patient_has_diagnosis_of_myocardial_infarction_inthehistory
             (>= patient_time_since_myocardial_infarction_registration_value_in_months 6.0))
        ;; (medical history of coronary revascularization with exhaustive subcategories) occurring ≥ 6 months prior to registration
        (and patient_has_undergone_coronary_revascularization_inthehistory
             (or
               (and patient_has_undergone_percutaneous_coronary_intervention_inthehistory
                    (>= patient_time_since_percutaneous_coronary_intervention_registration_value_in_months 6.0))
               (and patient_has_undergone_coronary_artery_bypass_graft_inthehistory
                    (>= patient_time_since_coronary_artery_bypass_graft_registration_value_in_months 6.0))
             ))
        ;; (medical history of angina pectoris except for patients having medical history of hospitalization within 6 months prior to registration)
        (and patient_has_diagnosis_of_angina_pectoris_inthehistory
             (not patient_has_diagnosis_of_angina_pectoris_hospitalization_within_6_months_prior_to_registration))
        ;; (risk factors)
        patients_risk_factor_is_positive_now
     )
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have at least one of the following medical history or risk factors: ..."
