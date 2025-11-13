;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_ex_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as a former smoker at present (has quit smoking).","when_to_set_to_false":"Set to false if the patient is documented as not a former smoker at present (e.g., is a current smoker or never smoked).","when_to_set_to_null":"Set to null if former smoking status is unknown, not documented, or indeterminate.","meaning":"Boolean indicating whether the patient is currently a former smoker."}
;; "a former smoker"
(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as a current smoker at present.","when_to_set_to_false":"Set to false if the patient is documented as not a current smoker at present.","when_to_set_to_null":"Set to null if current smoking status is unknown, not documented, or indeterminate.","meaning":"Boolean indicating whether the patient is currently a smoker."}
;; "a current smoker"
(declare-const patient_tobacco_smoking_consumption_value_recorded_inthehistory_withunit_pack_years Real) ;; {"when_to_set_to_value":"Set to the documented pack-year value if the patient's tobacco smoking history (pack-years) is recorded in the medical history.","when_to_set_to_null":"Set to null if no pack-year value is recorded in the history or the value is indeterminate.","meaning":"Numeric pack-years representing the patient's cumulative tobacco smoking history recorded in the history."}
;; "tobacco smoking history ≥ 10 pack-years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or
        (and patient_has_finding_of_smoker_now
             (>= patient_tobacco_smoking_consumption_value_recorded_inthehistory_withunit_pack_years 10.0))
        (and patient_has_finding_of_ex_smoker_now
             (>= patient_tobacco_smoking_consumption_value_recorded_inthehistory_withunit_pack_years 10.0)))
     :named        REQ0_COMPONENT0_OTHER_REQUIREMENTS))
;; "(((a current smoker) AND (tobacco smoking history ≥ 10 pack-years)) OR ((a former smoker) AND (tobacco smoking history ≥ 10 pack-years)))."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years when a precise age is recorded.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown or not recorded.","meaning":"Numeric value indicating the patient's current age in years."}
;; "aged ≥ 40 years"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 40.0)
     :named        REQ1_COMPONENT0_OTHER_REQUIREMENTS))
;; "aged ≥ 40 years"

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const inhaled_corticosteroids_current_use_duration_value_recorded_now_withunit_months Real) ;; {"when_to_set_to_value":"Set to the number of months corresponding to the duration of the patient's current continuous use of inhaled corticosteroids as of now.","when_to_set_to_null":"Set to null if the duration is unknown, not documented, cannot be determined, or if there is no current use of inhaled corticosteroids now.","meaning":"Numeric duration in months of the patient's current continuous use of inhaled corticosteroids as of now."} ;; "have current use of inhaled corticosteroids for duration ≥ 6 months"
(declare-const inhaled_corticosteroids_percent_of_time_used_value_recorded_in_the_history_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the percentage (0-100) representing the proportion of time the patient used inhaled corticosteroids over the assessed historical period.","when_to_set_to_null":"Set to null if the percentage is unknown, not documented, cannot be determined, or the assessment was not performed.","meaning":"Numeric percentage (0-100) representing the proportion of time the patient used inhaled corticosteroids over the assessed historical period."} ;; "have used inhaled corticosteroids for ≥ 75 % of the time on direct questioning"
(declare-const inhaled_corticosteroids_percent_of_time_used_value_recorded_in_the_history_withunit_percent@@assessed_by_direct_questioning Bool) ;; {"when_to_set_to_true":"Set to true if the percentage of time used value was obtained via direct questioning of the patient.","when_to_set_to_false":"Set to false if the percentage of time used value was obtained by a method other than direct questioning.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether direct questioning was the assessment method.","meaning":"Boolean indicating whether the percentage of time used value was assessed by direct questioning."} ;; "on direct questioning"
(declare-const patient_has_current_use_of_inhaled_corticosteroids_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using inhaled corticosteroids now.","when_to_set_to_false":"Set to false if the patient is not currently using inhaled corticosteroids now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using inhaled corticosteroids now.","meaning":"Boolean indicating whether the patient is currently using inhaled corticosteroids now."} ;; "have current use of inhaled corticosteroids"
(declare-const patient_has_prior_use_of_inhaled_corticosteroids_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any documented prior use of inhaled corticosteroids in the history before now.","when_to_set_to_false":"Set to false if it is documented that the patient has not used inhaled corticosteroids prior to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has prior use of inhaled corticosteroids in the history.","meaning":"Boolean indicating whether the patient has prior use of inhaled corticosteroids in the history."} ;; "have prior use of inhaled corticosteroids"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: prior use of inhaled corticosteroids
(assert
  (! patient_has_prior_use_of_inhaled_corticosteroids_in_the_history
     :named        REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "have prior use of inhaled corticosteroids"

;; Component 1: current use with duration ≥ 6 months
(assert
  (! (and patient_has_current_use_of_inhaled_corticosteroids_now
          (>= inhaled_corticosteroids_current_use_duration_value_recorded_now_withunit_months 6.0))
     :named        REQ2_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have current use of inhaled corticosteroids for duration ≥ 6 months"

;; Component 2: ≥ 75% of the time on direct questioning
(assert
  (! (and (>= inhaled_corticosteroids_percent_of_time_used_value_recorded_in_the_history_withunit_percent 75.0)
          inhaled_corticosteroids_percent_of_time_used_value_recorded_in_the_history_withunit_percent@@assessed_by_direct_questioning)
     :named        REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "have used inhaled corticosteroids for ≥ 75 % of the time on direct questioning"

;; ===================== Declarations for the inclusion criterion (REQ 3) =====================
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent_of_predicted Real) ;; {"when_to_set_to_value":"Set to the measured percent-of-predicted value if the patient's FEV1 percent predicted recorded now is available.","when_to_set_to_null":"Set to null if no FEV1 percent predicted value recorded now is available or the value is indeterminate.","meaning":"Numeric value of the patient's FEV1 expressed as percent of predicted recorded now."}
;; "forced expiratory volume in one second < 80 % of predicted"

(declare-const patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percent value if the patient's FEV1/FVC ratio percent recorded now is available.","when_to_set_to_null":"Set to null if no FEV1/FVC ratio percent value recorded now is available or the value is indeterminate.","meaning":"Numeric value of the patient's FEV1/FVC ratio expressed as percent recorded now."}
;; "a ratio of forced expiratory volume in one second to forced vital capacity < 70 %"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (< patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent_of_predicted 80.0)
     :named        REQ3_COMPONENT0_OTHER_REQUIREMENTS))
;; "have forced expiratory volume in one second < 80 % of predicted"

(assert
  (! (< patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_percent 70.0)
     :named        REQ3_COMPONENT1_OTHER_REQUIREMENTS))
;; "have a ratio of forced expiratory volume in one second to forced vital capacity < 70 %"

;; ===================== Declarations for the inclusion criterion (REQ 4) =====================
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_inthehistory_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the recorded percent value corresponding to the patient's forced expiratory volume in one second (FEV1) documented in the history.","when_to_set_to_null":"Set to null if no percent-form measurement of FEV1 is recorded in the history or the value is indeterminate.","meaning":"Numeric percent representing the patient's historical measurement of FEV1."}
;; "change in forced expiratory volume in one second 20 minutes after 5 milligrams nebulised salbutamol < 15 %"
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_inthehistory_withunit_percent@@temporalcontext_20_minutes_after_nebulised_salbutamol_5_milligrams Bool) ;; {"when_to_set_to_true":"Set to true when the percent-form FEV1 measurement pertains to the assessment taken 20 minutes after administration of 5 milligrams nebulised salbutamol.","when_to_set_to_false":"Set to false when the percent-form FEV1 measurement does not pertain to the assessment taken 20 minutes after 5 milligrams nebulised salbutamol.","when_to_set_to_null":"Set to null if it is unknown whether the percent-form FEV1 measurement was taken 20 minutes after 5 milligrams nebulised salbutamol.","meaning":"Indicator that the historical percent-form FEV1 measurement is specifically from 20 minutes post 5 mg nebulised salbutamol."}
;; "20 minutes after 5 milligrams nebulised salbutamol"
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_inthehistory_withunit_percent@@change_from_pre_bronchodilator_baseline Bool) ;; {"when_to_set_to_true":"Set to true when the percent-form FEV1 value represents the change from the pre-bronchodilator baseline.","when_to_set_to_false":"Set to false when the percent-form FEV1 value does not represent change from the pre-bronchodilator baseline (e.g., raw or unrelated measure).","when_to_set_to_null":"Set to null if it is unknown whether the percent-form FEV1 value represents change from the pre-bronchodilator baseline.","meaning":"Indicator that the historical percent-form FEV1 measurement is a change from pre-bronchodilator baseline."}
;; "have a change in forced expiratory volume in one second"

(declare-const patient_forced_expired_volume_in_1_second_value_recorded_inthehistory_withunit_milliliter Real) ;; {"when_to_set_to_value":"Set to the recorded milliliter value corresponding to the patient's forced expiratory volume in one second (FEV1) documented in the history.","when_to_set_to_null":"Set to null if no milliliter-form measurement of FEV1 is recorded in the history or the value is indeterminate.","meaning":"Numeric milliliter value representing the patient's historical measurement of FEV1."}
;; "change in forced expiratory volume in one second 20 minutes after 5 milligrams nebulised salbutamol < 200 milliliters"
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_inthehistory_withunit_milliliter@@temporalcontext_20_minutes_after_nebulised_salbutamol_5_milligrams Bool) ;; {"when_to_set_to_true":"Set to true when the milliliter-form FEV1 measurement pertains to the assessment taken 20 minutes after administration of 5 milligrams nebulised salbutamol.","when_to_set_to_false":"Set to false when the milliliter-form FEV1 measurement does not pertain to the assessment taken 20 minutes after 5 milligrams nebulised salbutamol.","when_to_set_to_null":"Set to null if it is unknown whether the milliliter-form FEV1 measurement was taken 20 minutes after 5 milligrams nebulised salbutamol.","meaning":"Indicator that the historical milliliter-form FEV1 measurement is specifically from 20 minutes post 5 mg nebulised salbutamol."}
;; "20 minutes after 5 milligrams nebulised salbutamol"
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_inthehistory_withunit_milliliter@@change_from_pre_bronchodilator_baseline Bool) ;; {"when_to_set_to_true":"Set to true when the milliliter-form FEV1 value represents the change from the pre-bronchodilator baseline.","when_to_set_to_false":"Set to false when the milliliter-form FEV1 value does not represent change from the pre-bronchodilator baseline (e.g., raw or unrelated measure).","when_to_set_to_null":"Set to null if it is unknown whether the milliliter-form FEV1 value represents change from the pre-bronchodilator baseline.","meaning":"Indicator that the historical milliliter-form FEV1 measurement is a change from pre-bronchodilator baseline."}
;; "have a change in forced expiratory volume in one second"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (and patient_forced_expired_volume_in_1_second_value_recorded_inthehistory_withunit_percent@@change_from_pre_bronchodilator_baseline
          patient_forced_expired_volume_in_1_second_value_recorded_inthehistory_withunit_percent@@temporalcontext_20_minutes_after_nebulised_salbutamol_5_milligrams
          (< patient_forced_expired_volume_in_1_second_value_recorded_inthehistory_withunit_percent 15.0))
     :named        REQ4_COMPONENT0_OTHER_REQUIREMENTS))
;; "have a change in forced expiratory volume in one second 20 minutes after 5 milligrams nebulised salbutamol < 15 %"

(assert
  (! (and patient_forced_expired_volume_in_1_second_value_recorded_inthehistory_withunit_milliliter@@change_from_pre_bronchodilator_baseline
          patient_forced_expired_volume_in_1_second_value_recorded_inthehistory_withunit_milliliter@@temporalcontext_20_minutes_after_nebulised_salbutamol_5_milligrams
          (< patient_forced_expired_volume_in_1_second_value_recorded_inthehistory_withunit_milliliter 200.0))
     :named        REQ4_COMPONENT1_OTHER_REQUIREMENTS))
;; "have a change in forced expiratory volume in one second 20 minutes after 5 milligrams nebulised salbutamol < 200 milliliters"

;; ===================== Declarations for the inclusion criterion (REQ 5) =====================
(declare-const patient_is_included_in_the_trial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently included in the trial.","when_to_set_to_false":"Set to false if the patient is not currently included in the trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently included in the trial.","meaning":"Boolean indicating whether the patient is currently included in the trial."}
;; "To be included, the patient must be included..."

(declare-const total_number_of_patients_in_the_trial_value_recorded_now_withunit_count Int) ;; {"when_to_set_to_value":"Set to the integer count of all patients in the trial.","when_to_set_to_null":"Set to null if the total number of patients in the trial is unknown, not documented, or cannot be determined.","meaning":"Numeric count indicating the total number of patients in the trial. Unit: count."}
;; "the total number of patients in the trial) = 256"

(declare-const total_number_of_patients_in_the_trial_with_previous_exacerbation_of_chronic_obstructive_pulmonary_disease_in_the_past_1_year_value_recorded_now_withunit_count Int) ;; {"when_to_set_to_value":"Set to the integer count of patients in the trial who have had a previous exacerbation of chronic obstructive pulmonary disease in the past 1 year.","when_to_set_to_null":"Set to null if the count of patients in the trial with a previous exacerbation of chronic obstructive pulmonary disease in the past 1 year is unknown, not documented, or cannot be determined.","meaning":"Numeric count indicating the number of patients in the trial who have had a previous exacerbation of chronic obstructive pulmonary disease in the past 1 year. Unit: count."}
;; "the total number of patients in the trial who have had a precious exacerbation of chronic obstructive pulmonary disease in the last year) = 196"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (= total_number_of_patients_in_the_trial_value_recorded_now_withunit_count 256)
     :named        REQ5_COMPONENT0_OTHER_REQUIREMENTS))
;; "((the total number of patients in the trial) = 256)"

(assert
  (! (= total_number_of_patients_in_the_trial_with_previous_exacerbation_of_chronic_obstructive_pulmonary_disease_in_the_past_1_year_value_recorded_now_withunit_count 196)
     :named        REQ5_COMPONENT1_OTHER_REQUIREMENTS))
;; "((the total number of patients in the trial who have had a precious exacerbation of chronic obstructive pulmonary disease in the last year) = 196)"
