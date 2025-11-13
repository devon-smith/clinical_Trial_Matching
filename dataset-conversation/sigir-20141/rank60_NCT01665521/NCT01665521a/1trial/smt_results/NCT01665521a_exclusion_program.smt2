;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_st_segment_elevation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of ST-segment elevation.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of ST-segment elevation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ST-segment elevation.","meaning":"Boolean indicating whether the patient currently has ST-segment elevation."} ;; "ST-segment elevation"
(declare-const patient_has_finding_of_st_segment_elevation_now@@present_in_contiguous_leads Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current ST-segment elevation is present in contiguous leads.","when_to_set_to_false":"Set to false if the patient's current ST-segment elevation is not present in contiguous leads.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ST-segment elevation is present in contiguous leads.","meaning":"Boolean indicating whether the patient's current ST-segment elevation is present in contiguous leads."} ;; "ST-segment elevation in contiguous leads"
(declare-const patient_has_undergone_electrocardiographic_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone an electrocardiogram (ECG) now.","when_to_set_to_false":"Set to false if the patient has not undergone an electrocardiogram (ECG) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone an electrocardiogram (ECG) now.","meaning":"Boolean indicating whether the patient has undergone an electrocardiogram (ECG) now."} ;; "on any electrocardiogram"
(declare-const patient_st_segment_elevation_value_recorded_now_withunit_millivolt Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of ST-segment elevation (in millivolts) recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current ST-segment elevation in millivolts."} ;; "ST-segment elevation ≥ 1 millivolt"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_st_segment_elevation_now@@present_in_contiguous_leads
      patient_has_finding_of_st_segment_elevation_now)
   :named REQ0_AUXILIARY0)) ;; "ST-segment elevation in contiguous leads"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have new ST-segment elevation in contiguous leads on any ECG (ST-segment elevation ≥ 1 millivolt)
(assert
(! (not (and patient_has_undergone_electrocardiographic_procedure_now
             patient_has_finding_of_st_segment_elevation_now@@present_in_contiguous_leads
             (>= patient_st_segment_elevation_value_recorded_now_withunit_millivolt 1)))
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has new ST-segment elevation in contiguous leads on any electrocardiogram (ST-segment elevation ≥ 1 millivolt)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_low_blood_pressure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypotension (low blood pressure).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypotension (low blood pressure).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hypotension (low blood pressure).","meaning":"Boolean indicating whether the patient currently has hypotension (low blood pressure)."} ;; "hypotension"
(declare-const patient_has_finding_of_low_blood_pressure_now@@at_time_of_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypotension (low blood pressure) at the time of enrollment.","when_to_set_to_false":"Set to false if the patient currently has hypotension (low blood pressure) but not at the time of enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has hypotension (low blood pressure) at the time of enrollment.","meaning":"Boolean indicating whether the patient currently has hypotension (low blood pressure) at the time of enrollment."} ;; "symptomatic hypotension at the time of enrollment"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's systolic blood pressure in millimeters of mercury is available now.","when_to_set_to_null":"Set to null if no such measurement is available now or the value is indeterminate.","meaning":"Numeric value representing the patient's current systolic blood pressure in millimeters of mercury."} ;; "systolic blood pressure < 90 millimeters of mercury"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@at_time_of_enrollment Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's systolic blood pressure in millimeters of mercury is measured at the time of enrollment.","when_to_set_to_null":"Set to null if no such measurement is available at the time of enrollment or the value is indeterminate.","meaning":"Numeric value representing the patient's systolic blood pressure in millimeters of mercury at the time of enrollment."} ;; "systolic blood pressure < 90 millimeters of mercury at the time of enrollment"
(declare-const patient_has_finding_of_tachycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of tachycardia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of tachycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of tachycardia.","meaning":"Boolean indicating whether the patient currently has tachycardia."} ;; "tachycardia"
(declare-const patient_has_finding_of_bradycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bradycardia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bradycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of bradycardia.","meaning":"Boolean indicating whether the patient currently has bradycardia."} ;; "bradycardia"
(declare-const patient_heart_rate_value_recorded_now_withunit_beats_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's heart rate in beats per minute is available now.","when_to_set_to_null":"Set to null if no such measurement is available now or the value is indeterminate.","meaning":"Numeric value representing the patient's current heart rate in beats per minute."} ;; "heart rate > 120 beats per minute" and "heart rate < 40 beats per minute"
(declare-const patient_has_finding_of_hypoxemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypoxemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypoxemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hypoxemia.","meaning":"Boolean indicating whether the patient currently has hypoxemia."} ;; "hypoxemia"
(declare-const patient_pulse_oximetry_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's pulse oximetry in percent is available now.","when_to_set_to_null":"Set to null if no such measurement is available now or the value is indeterminate.","meaning":"Numeric value representing the patient's current pulse oximetry in percent."} ;; "pulse oximetry < 90 percent"
(declare-const patient_pulse_oximetry_value_recorded_now_withunit_percent@@on_room_air Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's pulse oximetry in percent is measured while the patient is breathing room air.","when_to_set_to_null":"Set to null if no such measurement is available while the patient is breathing room air or the value is indeterminate.","meaning":"Numeric value representing the patient's current pulse oximetry in percent on room air."} ;; "pulse oximetry < 90 percent on room air"
(declare-const patient_is_exposed_to_oxygen_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to oxygen.","when_to_set_to_false":"Set to false if the patient is currently not exposed to oxygen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to oxygen.","meaning":"Boolean indicating whether the patient is currently exposed to oxygen."} ;; "on normal home oxygen flow rate"
(declare-const patient_is_exposed_to_oxygen_now@@at_normal_home_oxygen_flow_rate Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to oxygen at their normal home oxygen flow rate.","when_to_set_to_false":"Set to false if the patient is currently exposed to oxygen but not at their normal home oxygen flow rate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to oxygen at their normal home oxygen flow rate.","meaning":"Boolean indicating whether the patient is currently exposed to oxygen at their normal home oxygen flow rate."} ;; "on normal home oxygen flow rate"
(declare-const patient_pulse_oximetry_value_recorded_now_withunit_percent@@on_normal_home_oxygen_flow_rate Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's pulse oximetry in percent is measured while the patient is receiving their normal home oxygen flow rate.","when_to_set_to_null":"Set to null if no such measurement is available while the patient is receiving their normal home oxygen flow rate or the value is indeterminate.","meaning":"Numeric value representing the patient's current pulse oximetry in percent on normal home oxygen flow rate."} ;; "pulse oximetry < 90 percent on normal home oxygen flow rate"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable for hypotension at time of enrollment implies stem variable
(assert
(! (=> patient_has_finding_of_low_blood_pressure_now@@at_time_of_enrollment
      patient_has_finding_of_low_blood_pressure_now)
:named REQ1_AUXILIARY0)) ;; "hypotension at the time of enrollment"

;; Systolic blood pressure at time of enrollment is a measurement of systolic blood pressure
;; (No further linking needed unless specified in requirement)

;; Qualifier variable for oxygen at normal home flow rate implies stem variable
(assert
(! (=> patient_is_exposed_to_oxygen_now@@at_normal_home_oxygen_flow_rate
      patient_is_exposed_to_oxygen_now)
:named REQ1_AUXILIARY1)) ;; "on normal home oxygen flow rate"

;; ===================== Constraint Assertions (REQ 1) =====================
;; 1. Symptomatic hypotension at the time of enrollment (systolic blood pressure < 90 mmHg)
(assert
(! (not (and patient_has_finding_of_low_blood_pressure_now@@at_time_of_enrollment
             (< patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@at_time_of_enrollment 90)))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has symptomatic hypotension at the time of enrollment (systolic blood pressure < 90 millimeters of mercury)."

;; 2. Tachycardia (heart rate > 120 beats per minute)
(assert
(! (not (and patient_has_finding_of_tachycardia_now
             (> patient_heart_rate_value_recorded_now_withunit_beats_per_minute 120)))
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has tachycardia (heart rate > 120 beats per minute)."

;; 3. Bradycardia (heart rate < 40 beats per minute)
(assert
(! (not (and patient_has_finding_of_bradycardia_now
             (< patient_heart_rate_value_recorded_now_withunit_beats_per_minute 40)))
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has bradycardia (heart rate < 40 beats per minute)."

;; 4. Hypoxemia (pulse oximetry < 90 percent on room air OR pulse oximetry < 90 percent on normal home oxygen flow rate)
(assert
(! (not (and patient_has_finding_of_hypoxemia_now
             (or (< patient_pulse_oximetry_value_recorded_now_withunit_percent@@on_room_air 90)
                 (< patient_pulse_oximetry_value_recorded_now_withunit_percent@@on_normal_home_oxygen_flow_rate 90))))
:named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypoxemia (pulse oximetry < 90 percent on room air OR pulse oximetry < 90 percent on normal home oxygen flow rate)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_terminal_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of terminal illness.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of terminal illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of terminal illness.","meaning":"Boolean indicating whether the patient currently has a diagnosis of terminal illness."} ;; "terminal diagnosis"
(declare-const patient_life_expectancy_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the patient's estimated life expectancy in years, as recorded at the current time.","when_to_set_to_null":"Set to null if the patient's estimated life expectancy in years is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric value indicating the patient's estimated life expectancy in years, as recorded at the current time."} ;; "life expectancy < 1 year"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not (and patient_has_diagnosis_of_terminal_illness_now
               (< patient_life_expectancy_value_recorded_now_in_years 1)))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a terminal diagnosis with life expectancy < 1 year."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_non_cardiac_medical_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a non-cardiac medical illness.","when_to_set_to_false":"Set to false if the patient currently does not have a non-cardiac medical illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a non-cardiac medical illness.","meaning":"Boolean indicating whether the patient currently has a non-cardiac medical illness."} ;; "non-cardiac medical illness"
(declare-const patient_has_non_cardiac_medical_illness_now@@determined_by_provider Bool) ;; {"when_to_set_to_true":"Set to true if the non-cardiac medical illness is determined by the provider.","when_to_set_to_false":"Set to false if the non-cardiac medical illness is not determined by the provider.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the non-cardiac medical illness is determined by the provider.","meaning":"Boolean indicating whether the non-cardiac medical illness is determined by the provider."} ;; "determined by the provider"
(declare-const patient_has_non_cardiac_medical_illness_now@@requires_admission_or_increases_risk_of_objective_cardiac_testing_or_prevents_immediate_discharge_following_negative_testing Bool) ;; {"when_to_set_to_true":"Set to true if the non-cardiac medical illness requires admission, increases risk of objective cardiac testing, or prevents immediate discharge following negative testing.","when_to_set_to_false":"Set to false if the non-cardiac medical illness does not require admission, does not increase risk of objective cardiac testing, and does not prevent immediate discharge following negative testing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the non-cardiac medical illness requires admission, increases risk of objective cardiac testing, or prevents immediate discharge following negative testing.","meaning":"Boolean indicating whether the non-cardiac medical illness requires admission, increases risk of objective cardiac testing, or prevents immediate discharge following negative testing."} ;; "requires admission OR increase risk of objective cardiac testing OR prevent immediate discharge following negative testing"

(declare-const patient_has_non_cardiac_surgical_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a non-cardiac surgical illness.","when_to_set_to_false":"Set to false if the patient currently does not have a non-cardiac surgical illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a non-cardiac surgical illness.","meaning":"Boolean indicating whether the patient currently has a non-cardiac surgical illness."} ;; "non-cardiac surgical illness"
(declare-const patient_has_non_cardiac_surgical_illness_now@@determined_by_provider Bool) ;; {"when_to_set_to_true":"Set to true if the non-cardiac surgical illness is determined by the provider.","when_to_set_to_false":"Set to false if the non-cardiac surgical illness is not determined by the provider.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the non-cardiac surgical illness is determined by the provider.","meaning":"Boolean indicating whether the non-cardiac surgical illness is determined by the provider."} ;; "determined by the provider"
(declare-const patient_has_non_cardiac_surgical_illness_now@@requires_admission_or_increases_risk_of_objective_cardiac_testing_or_prevents_immediate_discharge_following_negative_testing Bool) ;; {"when_to_set_to_true":"Set to true if the non-cardiac surgical illness requires admission, increases risk of objective cardiac testing, or prevents immediate discharge following negative testing.","when_to_set_to_false":"Set to false if the non-cardiac surgical illness does not require admission, does not increase risk of objective cardiac testing, and does not prevent immediate discharge following negative testing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the non-cardiac surgical illness requires admission, increases risk of objective cardiac testing, or prevents immediate discharge following negative testing.","meaning":"Boolean indicating whether the non-cardiac surgical illness requires admission, increases risk of objective cardiac testing, or prevents immediate discharge following negative testing."} ;; "requires admission OR increase risk of objective cardiac testing OR prevent immediate discharge following negative testing"

(declare-const patient_has_diagnosis_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of mental disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of mental disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of mental disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of mental disorder."} ;; "psychiatric illness"
(declare-const patient_has_diagnosis_of_mental_disorder_now@@non_cardiac Bool) ;; {"when_to_set_to_true":"Set to true if the mental disorder the patient currently has is non-cardiac.","when_to_set_to_false":"Set to false if the mental disorder the patient currently has is cardiac-related.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the mental disorder is non-cardiac.","meaning":"Boolean indicating whether the mental disorder is non-cardiac."} ;; "non-cardiac psychiatric illness"
(declare-const patient_has_non_cardiac_psychiatric_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a non-cardiac psychiatric illness.","when_to_set_to_false":"Set to false if the patient currently does not have a non-cardiac psychiatric illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a non-cardiac psychiatric illness.","meaning":"Boolean indicating whether the patient currently has a non-cardiac psychiatric illness."} ;; "non-cardiac psychiatric illness"
(declare-const patient_has_non_cardiac_psychiatric_illness_now@@determined_by_provider Bool) ;; {"when_to_set_to_true":"Set to true if the non-cardiac psychiatric illness is determined by the provider.","when_to_set_to_false":"Set to false if the non-cardiac psychiatric illness is not determined by the provider.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the non-cardiac psychiatric illness is determined by the provider.","meaning":"Boolean indicating whether the non-cardiac psychiatric illness is determined by the provider."} ;; "determined by the provider"
(declare-const patient_has_non_cardiac_psychiatric_illness_now@@requires_admission_or_increases_risk_of_objective_cardiac_testing_or_prevents_immediate_discharge_following_negative_testing Bool) ;; {"when_to_set_to_true":"Set to true if the non-cardiac psychiatric illness requires admission, increases risk of objective cardiac testing, or prevents immediate discharge following negative testing.","when_to_set_to_false":"Set to false if the non-cardiac psychiatric illness does not require admission, does not increase risk of objective cardiac testing, and does not prevent immediate discharge following negative testing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the non-cardiac psychiatric illness requires admission, increases risk of objective cardiac testing, or prevents immediate discharge following negative testing.","meaning":"Boolean indicating whether the non-cardiac psychiatric illness requires admission, increases risk of objective cardiac testing, or prevents immediate discharge following negative testing."} ;; "requires admission OR increase risk of objective cardiac testing OR prevent immediate discharge following negative testing"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_non_cardiac_medical_illness_now@@determined_by_provider
      patient_has_non_cardiac_medical_illness_now)
:named REQ3_AUXILIARY0)) ;; "determined by the provider for non-cardiac medical illness"

(assert
(! (=> patient_has_non_cardiac_medical_illness_now@@requires_admission_or_increases_risk_of_objective_cardiac_testing_or_prevents_immediate_discharge_following_negative_testing
      patient_has_non_cardiac_medical_illness_now)
:named REQ3_AUXILIARY1)) ;; "requires admission OR increase risk of objective cardiac testing OR prevent immediate discharge following negative testing for non-cardiac medical illness"

(assert
(! (=> patient_has_non_cardiac_surgical_illness_now@@determined_by_provider
      patient_has_non_cardiac_surgical_illness_now)
:named REQ3_AUXILIARY2)) ;; "determined by the provider for non-cardiac surgical illness"

(assert
(! (=> patient_has_non_cardiac_surgical_illness_now@@requires_admission_or_increases_risk_of_objective_cardiac_testing_or_prevents_immediate_discharge_following_negative_testing
      patient_has_non_cardiac_surgical_illness_now)
:named REQ3_AUXILIARY3)) ;; "requires admission OR increase risk of objective cardiac testing OR prevent immediate discharge following negative testing for non-cardiac surgical illness"

(assert
(! (=> patient_has_non_cardiac_psychiatric_illness_now@@determined_by_provider
      patient_has_non_cardiac_psychiatric_illness_now)
:named REQ3_AUXILIARY4)) ;; "determined by the provider for non-cardiac psychiatric illness"

(assert
(! (=> patient_has_non_cardiac_psychiatric_illness_now@@requires_admission_or_increases_risk_of_objective_cardiac_testing_or_prevents_immediate_discharge_following_negative_testing
      patient_has_non_cardiac_psychiatric_illness_now)
:named REQ3_AUXILIARY5)) ;; "requires admission OR increase risk of objective cardiac testing OR prevent immediate discharge following negative testing for non-cardiac psychiatric illness"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (and patient_has_non_cardiac_medical_illness_now@@determined_by_provider
             patient_has_non_cardiac_medical_illness_now@@requires_admission_or_increases_risk_of_objective_cardiac_testing_or_prevents_immediate_discharge_following_negative_testing))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a non-cardiac medical illness determined by the provider to require admission OR increase risk of objective cardiac testing OR prevent immediate discharge following negative testing."

(assert
(! (not (and patient_has_non_cardiac_surgical_illness_now@@determined_by_provider
             patient_has_non_cardiac_surgical_illness_now@@requires_admission_or_increases_risk_of_objective_cardiac_testing_or_prevents_immediate_discharge_following_negative_testing))
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a non-cardiac surgical illness determined by the provider to require admission OR increase risk of objective cardiac testing OR prevent immediate discharge following negative testing."

(assert
(! (not (and patient_has_non_cardiac_psychiatric_illness_now@@determined_by_provider
             patient_has_non_cardiac_psychiatric_illness_now@@requires_admission_or_increases_risk_of_objective_cardiac_testing_or_prevents_immediate_discharge_following_negative_testing))
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a non-cardiac psychiatric illness determined by the provider to require admission OR increase risk of objective cardiac testing OR prevent immediate discharge following negative testing."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_prior_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has prior enrollment in any relevant study, program, or registry before the current eligibility assessment.","when_to_set_to_false":"Set to false if the patient does not have prior enrollment in any relevant study, program, or registry before the current eligibility assessment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has prior enrollment.","meaning":"Boolean indicating whether the patient has prior enrollment in any relevant study, program, or registry before the current eligibility assessment."} ;; "The patient is excluded if the patient has prior enrollment."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_has_prior_enrollment)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has prior enrollment."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_incapacity_to_provide_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has incapacity to provide consent.","when_to_set_to_false":"Set to false if the patient currently does not have incapacity to provide consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has incapacity to provide consent.","meaning":"Boolean indicating whether the patient currently has incapacity to provide consent."} ;; "incapacity to provide consent"
(declare-const patient_has_unwillingness_to_provide_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has unwillingness to provide consent.","when_to_set_to_false":"Set to false if the patient currently does not have unwillingness to provide consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has unwillingness to provide consent.","meaning":"Boolean indicating whether the patient currently has unwillingness to provide consent."} ;; "unwillingness to provide consent"
(declare-const patient_has_incapacity_to_comply_with_study_procedures_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has incapacity to comply with study procedures.","when_to_set_to_false":"Set to false if the patient currently does not have incapacity to comply with study procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has incapacity to comply with study procedures.","meaning":"Boolean indicating whether the patient currently has incapacity to comply with study procedures."} ;; "incapacity to comply with study procedures"
(declare-const patient_has_unwillingness_to_comply_with_study_procedures_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has unwillingness to comply with study procedures.","when_to_set_to_false":"Set to false if the patient currently does not have unwillingness to comply with study procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has unwillingness to comply with study procedures.","meaning":"Boolean indicating whether the patient currently has unwillingness to comply with study procedures."} ;; "unwillingness to comply with study procedures"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (or patient_has_incapacity_to_provide_consent_now
            patient_has_unwillingness_to_provide_consent_now
            patient_has_incapacity_to_comply_with_study_procedures_now
            patient_has_unwillingness_to_comply_with_study_procedures_now))
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has incapacity to provide consent) OR (the patient has unwillingness to provide consent) OR (the patient has incapacity to comply with study procedures) OR (the patient has unwillingness to comply with study procedures))."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_non_english_speaking Bool) ;; {"when_to_set_to_true":"Set to true if the patient is non-English speaking (i.e., does not speak English as a primary or functional language).","when_to_set_to_false":"Set to false if the patient is English speaking (i.e., speaks English as a primary or functional language).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is non-English speaking.","meaning":"Boolean indicating whether the patient is non-English speaking."} ;; "The patient is excluded if the patient is non-English speaking."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_is_non_english_speaking)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is non-English speaking."
