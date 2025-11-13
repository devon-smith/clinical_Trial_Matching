;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_asthma_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of asthma documented in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of asthma documented in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of asthma in their medical history.","meaning":"Boolean indicating whether the patient has ever had asthma in their medical history."} // "the patient must have a history consistent with asthma"
(declare-const patient_has_finding_of_wheezing_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of wheezing documented in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of wheezing documented in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of wheezing in their medical history.","meaning":"Boolean indicating whether the patient has ever had wheezing in their medical history."} // "episodic wheezing"
(declare-const patient_has_finding_of_wheezing_inthehistory@@episodic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of wheezing is characterized by episodic occurrences.","when_to_set_to_false":"Set to false if the patient's history of wheezing is not characterized by episodic occurrences.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of wheezing is episodic.","meaning":"Boolean indicating whether the patient's history of wheezing is episodic."} // "episodic wheezing"
(declare-const patient_has_finding_of_dyspnea_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of shortness of breath (dyspnea) documented in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of shortness of breath (dyspnea) documented in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of shortness of breath (dyspnea) in their medical history.","meaning":"Boolean indicating whether the patient has ever had shortness of breath (dyspnea) in their medical history."} // "episodic shortness of breath"
(declare-const patient_has_finding_of_dyspnea_inthehistory@@episodic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of shortness of breath (dyspnea) is characterized by episodic occurrences.","when_to_set_to_false":"Set to false if the patient's history of shortness of breath (dyspnea) is not characterized by episodic occurrences.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of shortness of breath (dyspnea) is episodic.","meaning":"Boolean indicating whether the patient's history of shortness of breath (dyspnea) is episodic."} // "episodic shortness of breath"
(declare-const patient_has_finding_of_paroxysmal_cough_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of paroxysmal (episodic) cough documented in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of paroxysmal (episodic) cough documented in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of paroxysmal (episodic) cough in their medical history.","meaning":"Boolean indicating whether the patient has ever had paroxysmal (episodic) cough in their medical history."} // "episodic cough"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_wheezing_inthehistory@@episodic
         patient_has_finding_of_wheezing_inthehistory)
     :named REQ0_AUXILIARY0)) ;; "episodic wheezing" implies "wheezing"

(assert
  (! (=> patient_has_finding_of_dyspnea_inthehistory@@episodic
         patient_has_finding_of_dyspnea_inthehistory)
     :named REQ0_AUXILIARY1)) ;; "episodic shortness of breath" implies "shortness of breath"

;; Non-exhaustive examples: episodic wheezing, episodic shortness of breath, episodic cough are examples of history consistent with asthma
(assert
  (! (=> (or patient_has_finding_of_wheezing_inthehistory@@episodic
             patient_has_finding_of_dyspnea_inthehistory@@episodic
             patient_has_finding_of_paroxysmal_cough_inthehistory)
         patient_has_finding_of_asthma_inthehistory)
     :named REQ0_AUXILIARY2)) ;; "episodic wheezing OR episodic shortness of breath OR episodic cough" are examples of history consistent with asthma

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_asthma_inthehistory
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must have a history consistent with asthma"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_forced_expired_volume_in_1_second_improvement_percent_after_two_puffs_of_beta2_agonist_now Real) ;; {"when_to_set_to_value":"Set to the measured percent improvement in FEV1 after two puffs of beta2 agonist if available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the percent improvement in FEV1 after two puffs of beta2 agonist measured now."} // "improvement in forced expiratory volume in one second after two puffs of beta2 agonist ≥ 12%"
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_liter Real) ;; {"when_to_set_to_value":"Set to the measured value of FEV1 in liters if the patient has a documented measurement now, specifically after administration of two puffs of beta2 agonist.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's FEV1 (in liters) measured now after two puffs of beta2 agonist."} // "forced expiratory volume in one second"
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_liter@@measured_after_two_puffs_of_beta2_agonist Bool) ;; {"when_to_set_to_true":"Set to true if the FEV1 measurement was taken after administration of two puffs of beta2 agonist.","when_to_set_to_false":"Set to false if the FEV1 measurement was not taken after administration of two puffs of beta2 agonist.","when_to_set_to_null":"Set to null if it is unknown or not documented whether the FEV1 measurement was taken after two puffs of beta2 agonist.","meaning":"Boolean indicating whether the FEV1 measurement was taken after two puffs of beta2 agonist."} // "forced expiratory volume in one second after two puffs of beta2 agonist"
(declare-const patient_has_airway_lability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has airway lability as recognized by clinical assessment or objective measurement.","when_to_set_to_false":"Set to false if the patient currently does not have airway lability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has airway lability.","meaning":"Boolean indicating whether the patient currently has airway lability."} // "the patient must have airway lability"
(declare-const patient_has_airway_lability_now@@recognized_by_improvement_in_fev1_after_two_puffs_of_beta2_agonist_gte_12_percent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's airway lability is recognized by an improvement in FEV1 after two puffs of beta2 agonist that is greater than or equal to 12 percent.","when_to_set_to_false":"Set to false if the patient's airway lability is not recognized by an improvement in FEV1 after two puffs of beta2 agonist that is greater than or equal to 12 percent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's airway lability is recognized by an improvement in FEV1 after two puffs of beta2 agonist that is greater than or equal to 12 percent.","meaning":"Boolean indicating whether the patient's airway lability is recognized by an improvement in FEV1 after two puffs of beta2 agonist that is greater than or equal to 12 percent."} // "airway lability recognized by (improvement in FEV1 after two puffs of beta2 agonist ≥ 12%)"
(declare-const patient_is_exposed_to_selective_beta_2_agonist_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a selective beta2 agonist.","when_to_set_to_false":"Set to false if the patient is currently not exposed to a selective beta2 agonist.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to a selective beta2 agonist.","meaning":"Boolean indicating whether the patient is currently exposed to a selective beta2 agonist."} // "beta2 agonist"
(declare-const patient_is_exposed_to_selective_beta_2_agonist_now@@administered_as_two_puffs Bool) ;; {"when_to_set_to_true":"Set to true if the exposure to selective beta2 agonist is specifically as two puffs.","when_to_set_to_false":"Set to false if the exposure to selective beta2 agonist is not as two puffs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure to selective beta2 agonist is as two puffs.","meaning":"Boolean indicating whether the exposure to selective beta2 agonist is specifically as two puffs."} // "after two puffs of beta2 agonist"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_liter@@measured_after_two_puffs_of_beta2_agonist
         true)
     :named REQ1_AUXILIARY0)) ;; "FEV1 measurement after two puffs of beta2 agonist"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_is_exposed_to_selective_beta_2_agonist_now@@administered_as_two_puffs
         patient_is_exposed_to_selective_beta_2_agonist_now)
     :named REQ1_AUXILIARY1)) ;; "beta2 agonist administered as two puffs"

;; Definitional equality for airway lability recognized by improvement in FEV1 ≥ 12%
(assert
  (! (= patient_has_airway_lability_now@@recognized_by_improvement_in_fev1_after_two_puffs_of_beta2_agonist_gte_12_percent
        (>= patient_forced_expired_volume_in_1_second_improvement_percent_after_two_puffs_of_beta2_agonist_now 12.0))
     :named REQ1_AUXILIARY2)) ;; "airway lability recognized by (improvement in FEV1 after two puffs of beta2 agonist ≥ 12%)"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_airway_lability_now@@recognized_by_improvement_in_fev1_after_two_puffs_of_beta2_agonist_gte_12_percent
         patient_has_airway_lability_now)
     :named REQ1_AUXILIARY3)) ;; "airway lability recognized by improvement in FEV1 after two puffs of beta2 agonist ≥ 12%"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_airway_lability_now@@recognized_by_improvement_in_fev1_after_two_puffs_of_beta2_agonist_gte_12_percent
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have airway lability recognized by (improvement in FEV1 after two puffs of beta2 agonist ≥ 12%)"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age > 18 years"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 18)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (age > 18 years)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_forced_expired_volume_in_1_second_percent_predicted_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's FEV1 as a percent of the predicted value, measured at the current time, with unit percent.","when_to_set_to_null":"Set to null if the FEV1 percent predicted value is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric value representing the patient's FEV1 as a percent of the predicted value, measured now, with unit percent."} // "forced expiratory volume in one second > 40% predicted"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (> patient_forced_expired_volume_in_1_second_percent_predicted_value_recorded_now_withunit_percent 40.0)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (forced expiratory volume in one second > 40% predicted)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_never_smoked_tobacco_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has never smoked tobacco at any point in their life.","when_to_set_to_false":"Set to false if the patient has smoked tobacco at any point in their life.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever smoked tobacco.","meaning":"Boolean indicating whether the patient is a never smoker (has never smoked tobacco)."} // "never smoker"
(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a smoker (actively smokes tobacco now).","when_to_set_to_false":"Set to false if the patient is not currently a smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a smoker.","meaning":"Boolean indicating whether the patient is currently a smoker."} // "current smoker"
(declare-const patient_has_finding_of_ex_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a former smoker (has smoked tobacco in the past but is not currently smoking).","when_to_set_to_false":"Set to false if the patient is not a former smoker (i.e., is a current smoker or never smoked).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a former smoker.","meaning":"Boolean indicating whether the patient is a former smoker (not currently smoking, but has smoked in the past)."} // "former smoker"
(declare-const patient_ex_smoker_value_recorded_now_withunit_years Real) ;; {"when_to_set_to_value":"Set to the number of years since the patient quit smoking if the patient is a former smoker and this information is available.","when_to_set_to_null":"Set to null if the patient is not a former smoker or if the number of years since quitting is unknown or not documented.","meaning":"Numeric value indicating the number of years since the patient quit smoking (for former smokers)."} // "former smoker who quit smoking ≥ 5 years ago"

;; ===================== Constraint Assertions (REQ 4) =====================
;; The patient must be (a never smoker) OR (a current smoker) OR (a former smoker who quit smoking ≥ 5 years ago).
(assert
  (! (or patient_has_finding_of_never_smoked_tobacco_now
         patient_has_finding_of_smoker_now
         (and patient_has_finding_of_ex_smoker_now
              (>= patient_ex_smoker_value_recorded_now_withunit_years 5.0)))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS))
