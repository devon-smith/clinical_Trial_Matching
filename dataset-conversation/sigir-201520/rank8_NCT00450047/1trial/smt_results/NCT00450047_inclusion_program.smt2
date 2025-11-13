;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 65 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 65.0)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 65 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of dementia made by a physician.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of dementia made by a physician.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of dementia made by a physician.","meaning":"Boolean indicating whether the patient currently has a diagnosis of dementia."} // "a diagnosis of dementia made by a physician"
(declare-const patient_has_diagnosis_of_dementia_now@@diagnosed_by_physician Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of dementia was made by a physician.","when_to_set_to_false":"Set to false if the patient's current diagnosis of dementia was not made by a physician.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of dementia was made by a physician.","meaning":"Boolean indicating whether the patient's current diagnosis of dementia was made by a physician."} // "diagnosis of dementia made by a physician"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the stem variable (diagnosed by physician ⇒ diagnosis of dementia)
(assert
  (! (=> patient_has_diagnosis_of_dementia_now@@diagnosed_by_physician
         patient_has_diagnosis_of_dementia_now)
     :named REQ1_AUXILIARY0)) ;; "diagnosis of dementia made by a physician" implies "diagnosis of dementia"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Inclusion: patient must have a diagnosis of dementia made by a physician
(assert
  (! patient_has_diagnosis_of_dementia_now@@diagnosed_by_physician
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a diagnosis of dementia made by a physician."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_mini_mental_state_examination_score_value_recorded_now_withunit_points Real) ;; {"when_to_set_to_value":"Set to the measured Mini-Mental State Examination score in points if a numeric measurement recorded now is available.","when_to_set_to_null":"Set to null if no such score is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current Mini-Mental State Examination score in points."} // "Mini-Mental State Examination score ≤ 23 points"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (<= patient_mini_mental_state_examination_score_value_recorded_now_withunit_points 23)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a Mini-Mental State Examination score ≤ 23 points."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_capable_of_participating_in_activity_per_week_for_6_consecutive_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient is capable of participating in the required activity at least once per week for 6 consecutive weeks.","when_to_set_to_false":"Set to false if the patient is not capable of participating in the required activity at least once per week for 6 consecutive weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is capable of participating in the required activity at least once per week for 6 consecutive weeks.","meaning":"Boolean indicating whether the patient is capable of participating in the required activity at least once per week for 6 consecutive weeks."} // "capable of participating at least once per week for 6 consecutive weeks"
(declare-const patient_participation_duration_value_recorded_in_weeks Real) ;; {"when_to_set_to_value":"Set to the total number of consecutive weeks the patient is capable of participating in the required activity.","when_to_set_to_null":"Set to null if the duration in consecutive weeks is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the total number of consecutive weeks the patient is capable of participating in the required activity."} // "for 6 consecutive weeks"
(declare-const patient_participation_frequency_value_recorded_in_weeks Real) ;; {"when_to_set_to_value":"Set to the number of times per week the patient is capable of participating in the required activity.","when_to_set_to_null":"Set to null if the participation frequency per week is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of times per week the patient is capable of participating in the required activity."} // "at least once per week"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; The patient is capable of participating at least once per week for 6 consecutive weeks if and only if the patient can participate at least once per week and for at least 6 consecutive weeks
(assert
  (! (= patient_is_capable_of_participating_in_activity_per_week_for_6_consecutive_weeks
        (and (>= patient_participation_duration_value_recorded_in_weeks 6)
             (>= patient_participation_frequency_value_recorded_in_weeks 1)))
     :named REQ3_AUXILIARY0)) ;; "capable of participating at least once per week for 6 consecutive weeks"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_is_capable_of_participating_in_activity_per_week_for_6_consecutive_weeks
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "capable of participating at least once per week for 6 consecutive weeks"
