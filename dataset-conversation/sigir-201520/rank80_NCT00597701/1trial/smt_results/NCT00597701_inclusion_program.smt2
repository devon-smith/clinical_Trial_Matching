;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_alcohol_withdrawal_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of alcohol withdrawal syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of alcohol withdrawal syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of alcohol withdrawal syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of alcohol withdrawal syndrome."} // "alcohol withdrawal syndrome"
(declare-const patient_has_diagnosis_of_alcohol_withdrawal_syndrome_now@@confirmed_by_dsm_iv_r_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of alcohol withdrawal syndrome is confirmed by DSM-IV-R criteria.","when_to_set_to_false":"Set to false if the patient's diagnosis of alcohol withdrawal syndrome is not confirmed by DSM-IV-R criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether DSM-IV-R criteria confirm the diagnosis.","meaning":"Boolean indicating whether the patient's diagnosis of alcohol withdrawal syndrome is confirmed by DSM-IV-R criteria."} // "confirmed by Diagnostic and Statistical Manual, 4th version, revised criteria"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_alcohol_withdrawal_syndrome_now@@confirmed_by_dsm_iv_r_criteria
         patient_has_diagnosis_of_alcohol_withdrawal_syndrome_now)
     :named REQ0_AUXILIARY0)) ;; "the diagnosis is confirmed by Diagnostic and Statistical Manual, 4th version, revised criteria"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must meet Diagnostic and Statistical Manual, 4th version, revised criteria for alcohol withdrawal syndrome.
(assert
  (! patient_has_diagnosis_of_alcohol_withdrawal_syndrome_now@@confirmed_by_dsm_iv_r_criteria
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "must meet Diagnostic and Statistical Manual, 4th version, revised criteria for alcohol withdrawal syndrome"

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_is_inpatient_at_st_marys_medical_center_at_time_of_study_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient is an inpatient at St. Mary's Medical Center at the time of study enrollment.","when_to_set_to_false":"Set to false if the patient is not an inpatient at St. Mary's Medical Center at the time of study enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is an inpatient at St. Mary's Medical Center at the time of study enrollment.","meaning":"Boolean indicating whether the patient is an inpatient at St. Mary's Medical Center at the time of study enrollment."} // "an inpatient at St. Mary's Medical Center at time of study enrollment"
(declare-const patient_is_inpatient_at_miller_dwan_medical_center_at_time_of_study_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient is an inpatient at Miller Dwan Medical Center at the time of study enrollment.","when_to_set_to_false":"Set to false if the patient is not an inpatient at Miller Dwan Medical Center at the time of study enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is an inpatient at Miller Dwan Medical Center at the time of study enrollment.","meaning":"Boolean indicating whether the patient is an inpatient at Miller Dwan Medical Center at the time of study enrollment."} // "an inpatient at Miller Dwan Medical Center at time of study enrollment"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must be an inpatient at St. Mary's Medical Center OR Miller Dwan Medical Center at time of study enrollment
(assert
  (! (or patient_is_inpatient_at_st_marys_medical_center_at_time_of_study_enrollment
         patient_is_inpatient_at_miller_dwan_medical_center_at_time_of_study_enrollment)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be ((an inpatient at St. Mary's Medical Center at time of study enrollment) OR (an inpatient at Miller Dwan Medical Center at time of study enrollment))."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_alcohol_withdrawal_scale_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured numeric value if the patient's alcohol withdrawal scale score is recorded now using the standard St. Mary's Medical Center inpatient protocol.","when_to_set_to_null":"Set to null if no such score is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's current alcohol withdrawal scale score."} // "alcohol withdrawal score"
(declare-const patient_alcohol_withdrawal_scale_score_value_recorded_now_withunit_score@@measured_by_standard_st_marys_medical_center_inpatient_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the alcohol withdrawal scale score was measured using the standard St. Mary's Medical Center inpatient protocol.","when_to_set_to_false":"Set to false if the score was not measured using this protocol.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether this protocol was used.","meaning":"Boolean indicating whether the alcohol withdrawal scale score was measured by the standard St. Mary's Medical Center inpatient protocol."} // "measured by standard St. Mary's Medical Center inpatient protocol"
(declare-const patient_alcohol_withdrawal_scale_score_value_recorded_now_withunit_score@@measured_by_standard_miller_dwan_medical_center_inpatient_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the alcohol withdrawal scale score was measured using the standard Miller Dwan Medical Center inpatient protocol.","when_to_set_to_false":"Set to false if the score was not measured using this protocol.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether this protocol was used.","meaning":"Boolean indicating whether the alcohol withdrawal scale score was measured by the standard Miller Dwan Medical Center inpatient protocol."} // "measured by standard Miller Dwan Medical Center inpatient protocol"
(declare-const patient_alcohol_withdrawal_scale_score_value_recorded_now_withunit_score@@sufficient_to_trigger_benzodiazepine_withdrawal_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the alcohol withdrawal scale score is sufficient to trigger benzodiazepine withdrawal therapy according to protocol.","when_to_set_to_false":"Set to false if the score is not sufficient to trigger therapy.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the score is sufficient to trigger therapy.","meaning":"Boolean indicating whether the alcohol withdrawal scale score is sufficient to trigger benzodiazepine withdrawal therapy."} // "sufficient to trigger the use of benzodiazepine withdrawal therapy"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_alcohol_withdrawal_scale_score_value_recorded_now_withunit_score@@measured_by_standard_st_marys_medical_center_inpatient_protocol
         (not (= patient_alcohol_withdrawal_scale_score_value_recorded_now_withunit_score 0.0)))
     :named REQ2_AUXILIARY0)) ;; "measured by standard St. Mary's Medical Center inpatient protocol" implies a score is recorded

(assert
  (! (=> patient_alcohol_withdrawal_scale_score_value_recorded_now_withunit_score@@measured_by_standard_miller_dwan_medical_center_inpatient_protocol
         (not (= patient_alcohol_withdrawal_scale_score_value_recorded_now_withunit_score 0.0)))
     :named REQ2_AUXILIARY1)) ;; "measured by standard Miller Dwan Medical Center inpatient protocol" implies a score is recorded

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have (an alcohol withdrawal score as measured by standard St. Mary's Medical Center inpatient protocol sufficient to trigger the use of benzodiazepine withdrawal therapy) OR (an alcohol withdrawal score as measured by standard Miller Dwan Medical Center inpatient protocol sufficient to trigger the use of benzodiazepine withdrawal therapy).
(assert
  (! (or
        (and patient_alcohol_withdrawal_scale_score_value_recorded_now_withunit_score@@measured_by_standard_st_marys_medical_center_inpatient_protocol
             patient_alcohol_withdrawal_scale_score_value_recorded_now_withunit_score@@sufficient_to_trigger_benzodiazepine_withdrawal_therapy)
        (and patient_alcohol_withdrawal_scale_score_value_recorded_now_withunit_score@@measured_by_standard_miller_dwan_medical_center_inpatient_protocol
             patient_alcohol_withdrawal_scale_score_value_recorded_now_withunit_score@@sufficient_to_trigger_benzodiazepine_withdrawal_therapy))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "sufficient alcohol withdrawal score by St. Mary's or Miller Dwan protocol to trigger benzodiazepine withdrawal therapy"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_agrees_to_abstain_from_alcohol_for_study_duration Bool) ;; {"when_to_set_to_true":"Set to true if the patient has explicitly agreed to abstain from alcohol for the entire duration of the study.","when_to_set_to_false":"Set to false if the patient has explicitly refused or has not agreed to abstain from alcohol for the entire duration of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has agreed to abstain from alcohol for the entire duration of the study.","meaning":"Boolean indicating whether the patient has agreed to abstain from alcohol for the entire duration of the study."} // "must agree to abstain from alcohol for the duration of the study"
(declare-const patient_is_exposed_to_alcohol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to alcohol.","when_to_set_to_false":"Set to false if the patient is currently not exposed to alcohol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to alcohol.","meaning":"auto-synthesized variable for alcohol (Substance) with timeframe now"} // "alcohol"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_agrees_to_abstain_from_alcohol_for_study_duration
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must agree to abstain from alcohol for the duration of the study."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_able_to_provide_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to provide informed consent.","when_to_set_to_false":"Set to false if the patient is currently unable to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to provide informed consent.","meaning":"Boolean indicating whether the patient is currently able to provide informed consent."} // "the patient must be able to provide informed consent"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_is_able_to_provide_informed_consent_now
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be able to provide informed consent"
