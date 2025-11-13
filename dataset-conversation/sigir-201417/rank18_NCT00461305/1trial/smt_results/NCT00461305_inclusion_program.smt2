;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years at the time of obtaining informed consent if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years at the time of obtaining informed consent is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years at the time of obtaining informed consent."} // "aged ≥ 20 years at the time of obtaining informed consent"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 20)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 20 years at the time of obtaining informed consent."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_normal_menstrual_cycle_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a normal menstrual cycle at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had a normal menstrual cycle in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a normal menstrual cycle.","meaning":"Boolean indicating whether the patient has ever had a normal menstrual cycle in their history."} // "a normal menstrual cycle"
(declare-const patient_has_finding_of_normal_menstrual_cycle_inthehistory@@in_each_of_latest_two_cycles_before_final_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient had a normal menstrual cycle in each of the latest two menstrual cycles before the final enrollment.","when_to_set_to_false":"Set to false if the patient did not have a normal menstrual cycle in each of the latest two menstrual cycles before the final enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had a normal menstrual cycle in each of the latest two menstrual cycles before the final enrollment.","meaning":"Boolean indicating whether the patient had a normal menstrual cycle in each of the latest two menstrual cycles before the final enrollment."} // "a normal menstrual cycle in each of the latest two menstrual cycles before the final enrollment"
(declare-const patient_measure_of_duration_of_menstrual_cycle_value_recorded_inthehistory_withunit_days Real) ;; {"when_to_set_to_value":"Set to the measured value in days if the length of the patient's menstrual cycle was recorded at any point in their history.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the length in days of the patient's menstrual cycle as recorded in their history."} // "cycle length"
(declare-const patient_measure_of_duration_of_menstrual_cycle_value_recorded_inthehistory_withunit_days@@in_each_of_latest_two_cycles_before_final_enrollment Real) ;; {"when_to_set_to_value":"Set to the measured value in days if the length of the patient's menstrual cycle was recorded for each of the latest two cycles before final enrollment.","when_to_set_to_null":"Set to null if no such measurement is available for either of the latest two cycles before final enrollment or the value is indeterminate.","meaning":"Numeric value representing the length in days of the patient's menstrual cycle for each of the latest two cycles before final enrollment."} // "cycle length in each of the latest two cycles before final enrollment"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_normal_menstrual_cycle_inthehistory@@in_each_of_latest_two_cycles_before_final_enrollment
         patient_has_finding_of_normal_menstrual_cycle_inthehistory)
     :named REQ1_AUXILIARY0)) ;; "a normal menstrual cycle in each of the latest two menstrual cycles before the final enrollment" implies "a normal menstrual cycle in history"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Patient must have a normal menstrual cycle in each of the latest two cycles before final enrollment,
;; and for each cycle, the cycle length must be ≥ 25 days AND ≤ 38 days.
(assert
  (! (and patient_has_finding_of_normal_menstrual_cycle_inthehistory@@in_each_of_latest_two_cycles_before_final_enrollment
          (>= patient_measure_of_duration_of_menstrual_cycle_value_recorded_inthehistory_withunit_days@@in_each_of_latest_two_cycles_before_final_enrollment 25.0)
          (<= patient_measure_of_duration_of_menstrual_cycle_value_recorded_inthehistory_withunit_days@@in_each_of_latest_two_cycles_before_final_enrollment 38.0))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "cycle length ≥ 25 days AND cycle length ≤ 38 days in each of the latest two menstrual cycles before the final enrollment"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_dysmenorrhea_value_recorded_inthehistory_withunit_points Real) ;; {"when_to_set_to_value":"Set to the recorded value(s) of the patient's total dysmenorrhea score for each menstrual cycle in the patient's history, measured in points.","when_to_set_to_null":"Set to null if no dysmenorrhea score is recorded in the patient's history or if the value is indeterminate.","meaning":"Numeric value(s) representing the patient's total dysmenorrhea score(s) in history, measured in points."} // "total dysmenorrhea score"
(declare-const patient_dysmenorrhea_value_recorded_inthehistory_withunit_points@@temporalcontext_latest_two_menstrual_cycles_before_final_enrollment Real) ;; {"when_to_set_to_value":"Set to the recorded value(s) of the patient's total dysmenorrhea score for each of the latest two menstrual cycles before final enrollment, measured in points.","when_to_set_to_null":"Set to null if no dysmenorrhea score is recorded for either of the latest two cycles before final enrollment or if the value is indeterminate.","meaning":"Numeric value(s) representing the patient's total dysmenorrhea score(s) in the latest two menstrual cycles before final enrollment, measured in points."} // "total dysmenorrhea score in each of the latest two menstrual cycles before final enrollment"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; The temporal context variable represents the dysmenorrhea score in the latest two menstrual cycles before final enrollment
;; No additional auxiliary assertions are needed for this requirement.

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must have a total dysmenorrhea score ≥ 3 points in each of the latest two menstrual cycles before the final enrollment.
(assert
  (! (>= patient_dysmenorrhea_value_recorded_inthehistory_withunit_points@@temporalcontext_latest_two_menstrual_cycles_before_final_enrollment 3)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "a total dysmenorrhea score ≥ 3 points in each of the latest two menstrual cycles before the final enrollment"
