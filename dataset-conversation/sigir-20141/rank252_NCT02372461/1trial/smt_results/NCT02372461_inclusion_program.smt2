;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_cough_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a history of cough at any time in the past, regardless of duration or context.","when_to_set_to_false":"Set to false if the patient has never had a history of cough at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of cough.","meaning":"Boolean indicating whether the patient has ever had a history of cough at any time in the past."} // "history of cough"
(declare-const patient_has_finding_of_cough_inthehistory@@duration_less_than_14_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of cough episode lasted less than 14 days.","when_to_set_to_false":"Set to false if the patient's history of cough episode lasted 14 days or more.","when_to_set_to_null":"Set to null if the duration of the patient's history of cough episode is unknown or cannot be determined.","meaning":"Boolean indicating whether the patient's history of cough episode lasted less than 14 days."} // "history of cough for less than 14 days"
(declare-const patient_has_finding_of_cough_inthehistory@@observed_or_reported Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of cough was either observed by a clinician or reported by the patient or caregiver.","when_to_set_to_false":"Set to false if the patient's history of cough was neither observed nor reported.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient's history of cough was observed or reported.","meaning":"Boolean indicating whether the patient's history of cough was observed or reported."} // "history of cough (observed or reported)"
(declare-const patient_has_finding_of_cough_inthehistory@@duration_less_than_14_days@@observed_or_reported Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a history of cough at any time in the past, the episode lasted less than 14 days, and the episode was either observed by a clinician or reported by the patient or caregiver.","when_to_set_to_false":"Set to false if the patient has never had a history of cough at any time in the past, or if the episode lasted 14 days or more, or if the episode was neither observed nor reported.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of cough, the duration of the episode, or whether it was observed or reported.","meaning":"Boolean indicating whether the patient has ever had a history of cough at any time in the past, where the episode lasted less than 14 days and was either observed or reported."} // "history of cough for less than 14 days (observed or reported)"
(declare-const patient_has_finding_of_difficulty_breathing_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a history of difficult breathing at any time in the past, regardless of duration or context.","when_to_set_to_false":"Set to false if the patient has never had a history of difficult breathing at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of difficult breathing.","meaning":"Boolean indicating whether the patient has ever had a history of difficult breathing at any time in the past."} // "history of difficult breathing"
(declare-const patient_has_finding_of_difficulty_breathing_inthehistory@@duration_less_than_14_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of difficult breathing episode lasted less than 14 days.","when_to_set_to_false":"Set to false if the patient's history of difficult breathing episode lasted 14 days or more.","when_to_set_to_null":"Set to null if the duration of the patient's history of difficult breathing episode is unknown or cannot be determined.","meaning":"Boolean indicating whether the patient's history of difficult breathing episode lasted less than 14 days."} // "history of difficult breathing for less than 14 days"
(declare-const patient_has_finding_of_difficulty_breathing_inthehistory@@observed_or_reported Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of difficult breathing was either observed by a clinician or reported by the patient or caregiver.","when_to_set_to_false":"Set to false if the patient's history of difficult breathing was neither observed nor reported.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient's history of difficult breathing was observed or reported.","meaning":"Boolean indicating whether the patient's history of difficult breathing was observed or reported."} // "history of difficult breathing (observed or reported)"
(declare-const patient_has_finding_of_difficulty_breathing_inthehistory@@duration_less_than_14_days@@observed_or_reported Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a history of difficult breathing at any time in the past, the episode lasted less than 14 days, and the episode was either observed by a clinician or reported by the patient or caregiver.","when_to_set_to_false":"Set to false if the patient has never had a history of difficult breathing at any time in the past, or if the episode lasted 14 days or more, or if the episode was neither observed nor reported.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of difficult breathing, the duration of the episode, or whether it was observed or reported.","meaning":"Boolean indicating whether the patient has ever had a history of difficult breathing at any time in the past, where the episode lasted less than 14 days and was either observed or reported."} // "history of difficult breathing for less than 14 days (observed or reported)"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_cough_inthehistory@@duration_less_than_14_days
         patient_has_finding_of_cough_inthehistory)
     :named REQ0_AUXILIARY0)) ;; "history of cough for less than 14 days" implies "history of cough"

(assert
  (! (=> patient_has_finding_of_cough_inthehistory@@observed_or_reported
         patient_has_finding_of_cough_inthehistory)
     :named REQ0_AUXILIARY1)) ;; "history of cough (observed or reported)" implies "history of cough"

(assert
  (! (=> patient_has_finding_of_cough_inthehistory@@duration_less_than_14_days@@observed_or_reported
         (and patient_has_finding_of_cough_inthehistory@@duration_less_than_14_days
              patient_has_finding_of_cough_inthehistory@@observed_or_reported))
     :named REQ0_AUXILIARY2)) ;; "history of cough for less than 14 days (observed or reported)" implies both qualifiers

(assert
  (! (=> patient_has_finding_of_difficulty_breathing_inthehistory@@duration_less_than_14_days
         patient_has_finding_of_difficulty_breathing_inthehistory)
     :named REQ0_AUXILIARY3)) ;; "history of difficult breathing for less than 14 days" implies "history of difficult breathing"

(assert
  (! (=> patient_has_finding_of_difficulty_breathing_inthehistory@@observed_or_reported
         patient_has_finding_of_difficulty_breathing_inthehistory)
     :named REQ0_AUXILIARY4)) ;; "history of difficult breathing (observed or reported)" implies "history of difficult breathing"

(assert
  (! (=> patient_has_finding_of_difficulty_breathing_inthehistory@@duration_less_than_14_days@@observed_or_reported
         (and patient_has_finding_of_difficulty_breathing_inthehistory@@duration_less_than_14_days
              patient_has_finding_of_difficulty_breathing_inthehistory@@observed_or_reported))
     :named REQ0_AUXILIARY5)) ;; "history of difficult breathing for less than 14 days (observed or reported)" implies both qualifiers

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must have a history of cough OR a history of difficult breathing for less than 14 days (observed or reported).
(assert
  (! (or patient_has_finding_of_cough_inthehistory
         patient_has_finding_of_difficulty_breathing_inthehistory@@duration_less_than_14_days@@observed_or_reported)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "history of cough OR history of difficult breathing for less than 14 days (observed or reported)"

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's current age in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in months."} // "aged at least two months AND aged less than twelve months"
(declare-const patient_respiratory_rate_value_recorded_now_withunit_breaths_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's respiratory rate (in breaths per minute) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current respiratory rate in breaths per minute."} // "respiratory rate"
(declare-const patient_respiratory_rate_value_recorded_now_withunit_breaths_per_minute@@measured_on_two_consecutive_readings_by_independent_physicians Bool) ;; {"when_to_set_to_true":"Set to true if the respiratory rate value is measured on two consecutive readings by independent physicians.","when_to_set_to_false":"Set to false if the respiratory rate value is not measured on two consecutive readings by independent physicians.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was taken on two consecutive readings by independent physicians.","meaning":"Boolean indicating whether the respiratory rate value was measured on two consecutive readings by independent physicians."} // "respiratory rate ... on two consecutive readings by independent physicians"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must meet one of the following:
;; (1) Age at least 2 months and less than 12 months, and respiratory rate at least 50 breaths/min on two consecutive readings by independent physicians
;; (2) Age at least 12 months and at most 59 months, and respiratory rate at least 40 breaths/min on two consecutive readings by independent physicians
(assert
  (! (or
        (and (>= patient_age_value_recorded_now_in_months 2.0) ;; "aged at least two months"
             (<  patient_age_value_recorded_now_in_months 12.0) ;; "aged less than twelve months"
             (>= patient_respiratory_rate_value_recorded_now_withunit_breaths_per_minute 50.0) ;; "respiratory rate of at least fifty breaths per minute"
             patient_respiratory_rate_value_recorded_now_withunit_breaths_per_minute@@measured_on_two_consecutive_readings_by_independent_physicians) ;; "on two consecutive readings by independent physicians"
        (and (>= patient_age_value_recorded_now_in_months 12.0) ;; "aged at least twelve months"
             (<= patient_age_value_recorded_now_in_months 59.0) ;; "aged at most fifty-nine months"
             (>= patient_respiratory_rate_value_recorded_now_withunit_breaths_per_minute 40.0) ;; "respiratory rate of at least forty breaths per minute"
             patient_respiratory_rate_value_recorded_now_withunit_breaths_per_minute@@measured_on_two_consecutive_readings_by_independent_physicians) ;; "on two consecutive readings by independent physicians"
     )
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_written_informed_consent_provided_by_legal_guardian Bool) ;; {"when_to_set_to_true":"Set to true if the patient has written informed consent and it is provided by a legal guardian.","when_to_set_to_false":"Set to false if the patient does not have written informed consent provided by a legal guardian.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has written informed consent provided by a legal guardian.","meaning":"Boolean indicating whether the patient has written informed consent that is provided by a legal guardian."} // "written informed consent provided by a legal guardian"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_written_informed_consent_provided_by_legal_guardian
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have written informed consent provided by a legal guardian."
