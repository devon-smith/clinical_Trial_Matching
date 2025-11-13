;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged greater than or equal to 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged greater than or equal to 18 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a smoker.","when_to_set_to_false":"Set to false if the patient is currently not a smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a smoker.","meaning":"Boolean indicating whether the patient is currently a smoker."} // "current smoker"
(declare-const patient_cigarette_pack_years_value_recorded_inthehistory_withunit_pack_years Real) ;; {"when_to_set_to_value":"Set to the total number of pack years if the patient's lifetime history of tobacco smoking is documented.","when_to_set_to_null":"Set to null if the patient's lifetime history of tobacco smoking in pack years is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's lifetime history of tobacco smoking in pack years."} // "history of tobacco smoking of greater than or equal to 10 pack years"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: The patient must be a current smoker.
(assert
  (! patient_has_finding_of_smoker_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a current smoker."

;; Component 1: The patient must have a history of tobacco smoking of greater than or equal to 10 pack years.
(assert
  (! (>= patient_cigarette_pack_years_value_recorded_inthehistory_withunit_pack_years 10)
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a history of tobacco smoking of greater than or equal to 10 pack years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent_of_predicted Real) ;; {"when_to_set_to_value":"Set to the most recent measured value of the patient's FEV1 as percent of predicted value, if available now.","when_to_set_to_null":"Set to null if no such measurement is available now or the value is indeterminate.","meaning":"Numeric value representing the patient's most recent FEV1 as percent of predicted value, recorded now."} // "forced expiratory volume in one second greater than 80 percent of predicted value"
(declare-const patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_percent_of_predicted Real) ;; {"when_to_set_to_value":"Set to the most recent measured value of the patient's FEV1/FVC ratio as percent of predicted value, if available now.","when_to_set_to_null":"Set to null if no such measurement is available now or the value is indeterminate.","meaning":"Numeric value representing the patient's most recent FEV1/FVC ratio as percent of predicted value, recorded now."} // "forced expiratory volume in one second divided by forced vital capacity ratio greater than 75 percent of predicted value"
(declare-const patient_has_undergone_spirometry_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone spirometry at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone spirometry at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone spirometry.","meaning":"Boolean indicating whether the patient has ever undergone spirometry."} // "spirometry"

(declare-const patient_has_spirometry_within_normal_limits_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has spirometry within normal limits, as defined by the requirement.","when_to_set_to_false":"Set to false if the patient currently does not have spirometry within normal limits, as defined by the requirement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has spirometry within normal limits.","meaning":"Boolean indicating whether the patient currently has spirometry within normal limits, defined as FEV1 > 80% predicted AND FEV1/FVC ratio > 75% predicted."} // "spirometry within normal limits, defined as (forced expiratory volume in one second greater than 80 percent of predicted value) AND (forced expiratory volume in one second divided by forced vital capacity ratio greater than 75 percent of predicted value)"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition in the requirement: spirometry within normal limits is defined as both FEV1 > 80% predicted AND FEV1/FVC ratio > 75% predicted
(assert
  (! (= patient_has_spirometry_within_normal_limits_now
        (and (> patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent_of_predicted 80.0)
             (> patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_percent_of_predicted 75.0)))
     :named REQ2_AUXILIARY0)) ;; "spirometry within normal limits, defined as (forced expiratory volume in one second greater than 80 percent of predicted value) AND (forced expiratory volume in one second divided by forced vital capacity ratio greater than 75 percent of predicted value)"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have spirometry within normal limits (as defined above)
(assert
  (! patient_has_spirometry_within_normal_limits_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have spirometry within normal limits, defined as (forced expiratory volume in one second greater than 80 percent of predicted value) AND (forced expiratory volume in one second divided by forced vital capacity ratio greater than 75 percent of predicted value)."
