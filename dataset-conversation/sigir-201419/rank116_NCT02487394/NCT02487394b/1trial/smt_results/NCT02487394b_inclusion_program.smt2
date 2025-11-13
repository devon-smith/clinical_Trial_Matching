;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_chronic_obstructive_lung_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history consistent with chronic obstructive pulmonary disease (COPD).","when_to_set_to_false":"Set to false if the patient does not have a history consistent with chronic obstructive pulmonary disease (COPD).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history consistent with chronic obstructive pulmonary disease (COPD).","meaning":"Boolean indicating whether the patient has a history of chronic obstructive pulmonary disease (COPD)."} // "a history consistent with chronic obstructive pulmonary disease"
(declare-const patient_has_finding_of_dyspnea_with_exertion_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of dyspnea with exertion.","when_to_set_to_false":"Set to false if the patient does not have a history of dyspnea with exertion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of dyspnea with exertion.","meaning":"Boolean indicating whether the patient has a history of dyspnea with exertion."} // "dyspnea with exertion"
(declare-const patient_has_finding_of_productive_cough_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of productive cough.","when_to_set_to_false":"Set to false if the patient does not have a history of productive cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of productive cough.","meaning":"Boolean indicating whether the patient has a history of productive cough."} // "productive cough"
(declare-const patient_has_finding_of_progressive_course_of_respiratory_symptoms_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of a progressive course of respiratory symptoms.","when_to_set_to_false":"Set to false if the patient does not have a history of a progressive course of respiratory symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of a progressive course of respiratory symptoms.","meaning":"Boolean indicating whether the patient has a history of a progressive course of respiratory symptoms."} // "a progressive course"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples: "including (dyspnea with exertion AND productive cough AND a progressive course)" implies history consistent with COPD
(assert
  (! (=> (and patient_has_finding_of_dyspnea_with_exertion_in_the_history
              patient_has_finding_of_productive_cough_in_the_history
              patient_has_finding_of_progressive_course_of_respiratory_symptoms_in_the_history)
         patient_has_finding_of_chronic_obstructive_lung_disease_inthehistory)
     :named REQ0_AUXILIARY0)) ;; "including (dyspnea with exertion AND productive cough AND a progressive course)"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_chronic_obstructive_lung_disease_inthehistory
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "must have a history consistent with chronic obstructive pulmonary disease"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const smoking_history_value_recorded_lifetime_withunit_pack_years Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the patient's total smoking history in pack years, as recorded over their lifetime.","when_to_set_to_null":"Set to null if the patient's smoking history in pack years is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's cumulative smoking history in pack years over their lifetime."} // "a smoking history of at least 20 pack years"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= smoking_history_value_recorded_lifetime_withunit_pack_years 20.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have a smoking history of at least 20 pack years"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a smoker.","when_to_set_to_false":"Set to false if the patient is currently not a smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a smoker.","meaning":"Boolean indicating whether the patient is currently a smoker."} // "a current smoker"
(declare-const patient_has_finding_of_ex_smoker_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of being a former smoker.","when_to_set_to_false":"Set to false if the patient does not have a history of being a former smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of being a former smoker.","meaning":"Boolean indicating whether the patient has a history of being a former smoker."} // "a former smoker"
(declare-const patient_has_finding_of_ex_smoker_inthehistory@@quit_smoking_at_least_5_years_ago Bool) ;; {"when_to_set_to_true":"Set to true if the patient quit smoking at least 5 years ago.","when_to_set_to_false":"Set to false if the patient quit smoking less than 5 years ago.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined when the patient quit smoking.","meaning":"Boolean indicating whether the patient quit smoking at least 5 years ago."} // "quit smoking at least 5 years ago"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_ex_smoker_inthehistory@@quit_smoking_at_least_5_years_ago
         patient_has_finding_of_ex_smoker_inthehistory)
     :named REQ2_AUXILIARY0)) ;; "a former smoker who quit smoking at least 5 years ago" implies "a former smoker"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must be (a current smoker) OR (a former smoker who quit smoking at least 5 years ago).
(assert
  (! (or patient_has_finding_of_smoker_now
         patient_has_finding_of_ex_smoker_inthehistory@@quit_smoking_at_least_5_years_ago)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (a current smoker) OR (a former smoker who quit smoking at least 5 years ago)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "older than 18 years"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 18)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be older than 18 years."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's forced expiratory volume in 1 second to forced vital capacity ratio is recorded now following administration of 2 puffs of albuterol.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's forced expiratory volume in 1 second to forced vital capacity ratio measured now."} // "forced expiratory volume in 1 second to forced vital capacity ratio"
(declare-const patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio@@measured_following_administration_of_2_puffs_of_albuterol Bool) ;; {"when_to_set_to_true":"Set to true if the measurement of forced expiratory volume in 1 second to forced vital capacity ratio was taken following administration of 2 puffs of albuterol.","when_to_set_to_false":"Set to false if the measurement was not taken following administration of 2 puffs of albuterol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was taken following administration of 2 puffs of albuterol.","meaning":"Boolean indicating whether the measurement was taken following administration of 2 puffs of albuterol."} // "following administration of 2 puffs of albuterol"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies that a measurement exists
(assert
  (! (=> patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio@@measured_following_administration_of_2_puffs_of_albuterol
         (exists ((x Real)) (= x patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio)))
     :named REQ4_AUXILIARY0)) ;; "the measurement was taken following administration of 2 puffs of albuterol" implies a value is present

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: FEV1/FVC ratio < 0.70 following 2 puffs of albuterol
(assert
  (! (and patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio@@measured_following_administration_of_2_puffs_of_albuterol
          (< patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio 0.70))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "forced expiratory volume in 1 second to forced vital capacity ratio less than 0.70 following administration of 2 puffs of albuterol"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent_predicted Real) ;; {"when_to_set_to_value":"Set to the measured percent predicted value if a numeric measurement of the patient's forced expiratory volume in 1 second (FEV1) recorded now is available.","when_to_set_to_null":"Set to null if no such percent predicted measurement recorded now is available or the value is indeterminate.","meaning":"Numeric percent predicted value representing the patient's current forced expiratory volume in 1 second (FEV1)."} // "forced expiratory volume in 1 second greater than 50 percent predicted"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (> patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent_predicted 50.0)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a forced expiratory volume in 1 second greater than 50 percent predicted."
