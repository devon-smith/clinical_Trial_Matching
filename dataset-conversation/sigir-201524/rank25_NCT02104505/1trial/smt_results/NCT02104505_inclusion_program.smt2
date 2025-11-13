;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years AND aged ≤ 50 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 18 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 50)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≤ 50 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female as currently documented."} // "the patient is female"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has childbearing potential (i.e., has not had hysterectomy or oophorectomy and is physiologically able to become pregnant).","when_to_set_to_false":"Set to false if the patient does not have childbearing potential (e.g., status post hysterectomy or oophorectomy, or other permanent infertility).","when_to_set_to_null":"Set to null if the patient's childbearing potential is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} // "status post hysterectomy"
(declare-const patient_has_negative_pregnancy_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented negative pregnancy test result.","when_to_set_to_false":"Set to false if the patient currently has a documented positive pregnancy test result.","when_to_set_to_null":"Set to null if the patient's pregnancy test result is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient currently has a negative pregnancy test result."} // "negative pregnancy test"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented by a positive pregnancy test or clinical assessment.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented by a negative pregnancy test or clinical assessment.","when_to_set_to_null":"Set to null if the patient's pregnancy status is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient is currently pregnant."} // "negative pregnancy test"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: negative pregnancy test implies not pregnant
(assert
  (! (=> patient_has_negative_pregnancy_test_now
         (not patient_is_pregnant_now))
     :named REQ1_AUXILIARY0)) ;; "negative pregnancy test" means not pregnant

;; ===================== Constraint Assertions (REQ 1) =====================
;; If patient is female AND has childbearing potential, must have negative pregnancy test
(assert
  (! (=> (and patient_sex_is_female_now
              patient_has_childbearing_potential_now)
         patient_has_negative_pregnancy_test_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if (the patient is female) AND (NOT status post hysterectomy) AND (NOT status post oophorectomy), the patient must have a negative pregnancy test."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_wheezing_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of wheezing at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of wheezing at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of wheezing.","meaning":"Boolean indicating whether the patient has a history of wheezing."} // "a history of episodic wheezing"
(declare-const patient_has_finding_of_wheezing_inthehistory@@episodic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of wheezing is episodic.","when_to_set_to_false":"Set to false if the patient's history of wheezing is not episodic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of wheezing is episodic.","meaning":"Boolean indicating whether the patient's history of wheezing is episodic."} // "a history of episodic wheezing"
(declare-const patient_has_finding_of_tight_chest_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of chest tightness at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of chest tightness at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of chest tightness.","meaning":"Boolean indicating whether the patient has a history of chest tightness."} // "a history of chest tightness"
(declare-const patient_has_finding_of_dyspnea_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of shortness of breath at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of shortness of breath at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of shortness of breath.","meaning":"Boolean indicating whether the patient has a history of shortness of breath."} // "a history of shortness of breath consistent with asthma"
(declare-const patient_has_finding_of_dyspnea_inthehistory@@consistent_with_asthma Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of shortness of breath is consistent with asthma.","when_to_set_to_false":"Set to false if the patient's history of shortness of breath is not consistent with asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of shortness of breath is consistent with asthma.","meaning":"Boolean indicating whether the patient's history of shortness of breath is consistent with asthma."} // "a history of shortness of breath consistent with asthma"
(declare-const patient_has_finding_of_asthma_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of asthma at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of asthma at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of asthma.","meaning":"Boolean indicating whether the patient has a history of asthma."} // "physician diagnosed asthma"
(declare-const patient_has_finding_of_asthma_inthehistory@@physician_diagnosed Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of asthma is physician diagnosed.","when_to_set_to_false":"Set to false if the patient's history of asthma is not physician diagnosed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of asthma is physician diagnosed.","meaning":"Boolean indicating whether the patient's history of asthma is physician diagnosed."} // "physician diagnosed asthma"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable for episodic wheezing
(assert
  (! (=> patient_has_finding_of_wheezing_inthehistory@@episodic
         patient_has_finding_of_wheezing_inthehistory)
     :named REQ2_AUXILIARY0)) ;; "a history of episodic wheezing"

;; Qualifier variable implies corresponding stem variable for dyspnea consistent with asthma
(assert
  (! (=> patient_has_finding_of_dyspnea_inthehistory@@consistent_with_asthma
         patient_has_finding_of_dyspnea_inthehistory)
     :named REQ2_AUXILIARY1)) ;; "a history of shortness of breath consistent with asthma"

;; Qualifier variable implies corresponding stem variable for physician diagnosed asthma
(assert
  (! (=> patient_has_finding_of_asthma_inthehistory@@physician_diagnosed
         patient_has_finding_of_asthma_inthehistory)
     :named REQ2_AUXILIARY2)) ;; "physician diagnosed asthma"

;; ===================== Constraint Assertions (REQ 2) =====================
;; At least one of: (a history of episodic wheezing) OR (a history of chest tightness) OR (a history of shortness of breath consistent with asthma) OR (physician diagnosed asthma)
(assert
  (! (or patient_has_finding_of_wheezing_inthehistory@@episodic
         patient_has_finding_of_tight_chest_inthehistory
         patient_has_finding_of_dyspnea_inthehistory@@consistent_with_asthma
         patient_has_finding_of_asthma_inthehistory@@physician_diagnosed)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (a history of episodic wheezing) OR (a history of chest tightness) OR (a history of shortness of breath consistent with asthma) OR (physician diagnosed asthma)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_liters Real) ;; {"when_to_set_to_value":"Set to the measured value in liters if a current FEV1 measurement is available.","when_to_set_to_null":"Set to null if no current FEV1 measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current forced expiratory volume in 1 second (FEV1), measured in liters."} // "forced expiratory volume in 1 second (FEV1)"
(declare-const patient_has_positive_methacholine_test_screening_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the patient meets the criteria for a positive methacholine test in the screening protocol (provocative concentration ≤ 10 mg/mL and ≥ 20% fall in FEV1).","when_to_set_to_false":"Set to false if the patient does not meet the criteria for a positive methacholine test in the screening protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient meets the criteria for a positive methacholine test in the screening protocol.","meaning":"Boolean indicating whether the patient has a positive methacholine test result, as defined by the provocative concentration of methacholine ≤ 10 milligrams per milliliter producing a 20 percent fall in FEV1, by the method used in a separate screening protocol."} // "positive methacholine test (defined as a provocative concentration of methacholine ≤ 10 milligrams per milliliter producing a 20 percent fall in FEV1 by the method used in a separate screening protocol)"
(declare-const patient_is_exposed_to_methacholine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to methacholine (e.g., during a methacholine challenge test).","when_to_set_to_false":"Set to false if the patient is not currently exposed to methacholine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to methacholine.","meaning":"Boolean indicating whether the patient is currently exposed to methacholine."} // "methacholine"
(declare-const patient_methacholine_test_fev1_percent_fall_value_recorded_screening_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percent fall in FEV1 during the methacholine challenge test if available from the screening protocol.","when_to_set_to_null":"Set to null if no value is available or the value is indeterminate.","meaning":"Numeric value representing the percent fall in FEV1 during the methacholine challenge test, measured in percent, as determined by the method used in the separate screening protocol."} // "20 percent fall in forced expiratory volume in 1 second (FEV1)"
(declare-const patient_methacholine_test_provocative_concentration_value_recorded_screening_withunit_milligrams_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the measured value in milligrams per milliliter if the provocative concentration of methacholine used in the screening protocol is available.","when_to_set_to_null":"Set to null if no value is available or the value is indeterminate.","meaning":"Numeric value representing the provocative concentration of methacholine, measured in milligrams per milliliter, used in the patient's methacholine challenge test during the separate screening protocol."} // "provocative concentration of methacholine ≤ 10 milligrams per milliliter"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition of positive methacholine test per requirement: provocative concentration ≤ 10 mg/mL AND ≥ 20% fall in FEV1 (by screening protocol)
(assert
  (! (= patient_has_positive_methacholine_test_screening_protocol
        (and (<= patient_methacholine_test_provocative_concentration_value_recorded_screening_withunit_milligrams_per_milliliter 10.0)
             (>= patient_methacholine_test_fev1_percent_fall_value_recorded_screening_withunit_percent 20.0)))
     :named REQ3_AUXILIARY0)) ;; "positive methacholine test (defined as a provocative concentration of methacholine ≤ 10 milligrams per milliliter producing a 20 percent fall in FEV1 by the method used in a separate screening protocol)"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_positive_methacholine_test_screening_protocol
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a positive methacholine test (defined as a provocative concentration of methacholine ≤ 10 milligrams per milliliter producing a 20 percent fall in forced expiratory volume in 1 second (FEV1) by the method used in a separate screening protocol)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent_of_predicted Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's FEV1 (percent of predicted) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's FEV1 (percent of predicted) recorded now."} // "forced expiratory volume in 1 second (FEV1) ≥ 80 percent of predicted"
(declare-const patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's FEV1/FVC ratio is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's FEV1/FVC ratio recorded now."} // "forced expiratory volume in 1 second/forced vital capacity ratio ≥ 0.70"
(declare-const patient_is_exposed_to_bronchodilator_inthepast12hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to bronchodilating medication in the past 12 hours.","when_to_set_to_false":"Set to false if the patient has not been exposed to bronchodilating medication in the past 12 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to bronchodilating medication in the past 12 hours.","meaning":"Boolean indicating whether the patient has been exposed to bronchodilating medication in the past 12 hours."} // "without use of bronchodilating medication for ≥ 12 hours"
(declare-const patient_is_exposed_to_long_acting_beta_agonist_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to long acting beta agonist in the past 24 hours.","when_to_set_to_false":"Set to false if the patient has not been exposed to long acting beta agonist in the past 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to long acting beta agonist in the past 24 hours.","meaning":"Boolean indicating whether the patient has been exposed to long acting beta agonist in the past 24 hours."} // "without use of long acting beta agonist for ≥ 24 hours"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: FEV1 ≥ 80 percent of predicted
(assert
  (! (>= patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent_of_predicted 80.0)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "forced expiratory volume in 1 second (FEV1) ≥ 80 percent of predicted"

;; Component 1: FEV1/FVC ratio ≥ 0.70
(assert
  (! (>= patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio 0.70)
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "forced expiratory volume in 1 second/forced vital capacity ratio ≥ 0.70"

;; Component 2: Without use of bronchodilating medication for ≥ 12 hours
(assert
  (! (not patient_is_exposed_to_bronchodilator_inthepast12hours)
     :named REQ4_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "without use of bronchodilating medication for ≥ 12 hours"

;; Component 3: Without use of long acting beta agonist for ≥ 24 hours
(assert
  (! (not patient_is_exposed_to_long_acting_beta_agonist_inthepast24hours)
     :named REQ4_COMPONENT3_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "without use of long acting beta agonist for ≥ 24 hours"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_allergic_sensitization_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of allergic sensitization.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of allergic sensitization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has allergic sensitization.","meaning":"Boolean indicating whether the patient currently has allergic sensitization."} // "allergic sensitization"
(declare-const patient_has_finding_of_allergic_sensitization_now@@confirmed_by_positive_immediate_skin_test_response Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergic sensitization is confirmed by a positive immediate skin test response.","when_to_set_to_false":"Set to false if the patient's allergic sensitization is not confirmed by a positive immediate skin test response.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergic sensitization is confirmed by a positive immediate skin test response.","meaning":"Boolean indicating whether the patient's allergic sensitization is confirmed by a positive immediate skin test response."} // "confirmed by positive immediate skin test response"
(declare-const patient_has_finding_of_allergic_sensitization_now@@to_at_least_one_specified_allergen_preparation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergic sensitization is to at least one of the specified allergen preparations.","when_to_set_to_false":"Set to false if the patient's allergic sensitization is not to any of the specified allergen preparations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergic sensitization is to at least one of the specified allergen preparations.","meaning":"Boolean indicating whether the patient's allergic sensitization is to at least one of the specified allergen preparations."} // "to at least one of the following allergen preparations"
(declare-const patient_has_positive_immediate_skin_test_response_to_house_dust_mite_f_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive immediate skin test response to house dust mite f allergen preparation.","when_to_set_to_false":"Set to false if the patient currently does not have a positive immediate skin test response to house dust mite f allergen preparation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive immediate skin test response to house dust mite f allergen preparation.","meaning":"Boolean indicating whether the patient currently has a positive immediate skin test response to house dust mite f allergen preparation."} // "house dust mite f"
(declare-const patient_has_positive_immediate_skin_test_response_to_house_dust_mite_p_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive immediate skin test response to house dust mite p allergen preparation.","when_to_set_to_false":"Set to false if the patient currently does not have a positive immediate skin test response to house dust mite p allergen preparation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive immediate skin test response to house dust mite p allergen preparation.","meaning":"Boolean indicating whether the patient currently has a positive immediate skin test response to house dust mite p allergen preparation."} // "house dust mite p"
(declare-const patient_has_positive_immediate_skin_test_response_to_cockroach_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive immediate skin test response to cockroach allergen preparation.","when_to_set_to_false":"Set to false if the patient currently does not have a positive immediate skin test response to cockroach allergen preparation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive immediate skin test response to cockroach allergen preparation.","meaning":"Boolean indicating whether the patient currently has a positive immediate skin test response to cockroach allergen preparation."} // "cockroach"
(declare-const patient_has_positive_immediate_skin_test_response_to_tree_mix_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive immediate skin test response to tree mix allergen preparation.","when_to_set_to_false":"Set to false if the patient currently does not have a positive immediate skin test response to tree mix allergen preparation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive immediate skin test response to tree mix allergen preparation.","meaning":"Boolean indicating whether the patient currently has a positive immediate skin test response to tree mix allergen preparation."} // "tree mix"
(declare-const patient_has_positive_immediate_skin_test_response_to_grass_mix_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive immediate skin test response to grass mix allergen preparation.","when_to_set_to_false":"Set to false if the patient currently does not have a positive immediate skin test response to grass mix allergen preparation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive immediate skin test response to grass mix allergen preparation.","meaning":"Boolean indicating whether the patient currently has a positive immediate skin test response to grass mix allergen preparation."} // "grass mix"
(declare-const patient_has_positive_immediate_skin_test_response_to_weed_mix_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive immediate skin test response to weed mix allergen preparation.","when_to_set_to_false":"Set to false if the patient currently does not have a positive immediate skin test response to weed mix allergen preparation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive immediate skin test response to weed mix allergen preparation.","meaning":"Boolean indicating whether the patient currently has a positive immediate skin test response to weed mix allergen preparation."} // "weed mix"
(declare-const patient_has_positive_immediate_skin_test_response_to_mold_mix_1_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive immediate skin test response to mold mix 1 allergen preparation.","when_to_set_to_false":"Set to false if the patient currently does not have a positive immediate skin test response to mold mix 1 allergen preparation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive immediate skin test response to mold mix 1 allergen preparation.","meaning":"Boolean indicating whether the patient currently has a positive immediate skin test response to mold mix 1 allergen preparation."} // "mold mix 1"
(declare-const patient_has_positive_immediate_skin_test_response_to_mold_mix_2_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive immediate skin test response to mold mix 2 allergen preparation.","when_to_set_to_false":"Set to false if the patient currently does not have a positive immediate skin test response to mold mix 2 allergen preparation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive immediate skin test response to mold mix 2 allergen preparation.","meaning":"Boolean indicating whether the patient currently has a positive immediate skin test response to mold mix 2 allergen preparation."} // "mold mix 2"
(declare-const patient_has_positive_immediate_skin_test_response_to_rat_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive immediate skin test response to rat allergen preparation.","when_to_set_to_false":"Set to false if the patient currently does not have a positive immediate skin test response to rat allergen preparation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive immediate skin test response to rat allergen preparation.","meaning":"Boolean indicating whether the patient currently has a positive immediate skin test response to rat allergen preparation."} // "rat"
(declare-const patient_has_positive_immediate_skin_test_response_to_mouse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive immediate skin test response to mouse allergen preparation.","when_to_set_to_false":"Set to false if the patient currently does not have a positive immediate skin test response to mouse allergen preparation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive immediate skin test response to mouse allergen preparation.","meaning":"Boolean indicating whether the patient currently has a positive immediate skin test response to mouse allergen preparation."} // "mouse"
(declare-const patient_has_positive_immediate_skin_test_response_to_guinea_pig_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive immediate skin test response to guinea pig allergen preparation.","when_to_set_to_false":"Set to false if the patient currently does not have a positive immediate skin test response to guinea pig allergen preparation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive immediate skin test response to guinea pig allergen preparation.","meaning":"Boolean indicating whether the patient currently has a positive immediate skin test response to guinea pig allergen preparation."} // "guinea pig"
(declare-const patient_has_positive_immediate_skin_test_response_to_rabbit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive immediate skin test response to rabbit allergen preparation.","when_to_set_to_false":"Set to false if the patient currently does not have a positive immediate skin test response to rabbit allergen preparation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive immediate skin test response to rabbit allergen preparation.","meaning":"Boolean indicating whether the patient currently has a positive immediate skin test response to rabbit allergen preparation."} // "rabbit"
(declare-const patient_has_positive_immediate_skin_test_response_to_cat_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive immediate skin test response to cat allergen preparation.","when_to_set_to_false":"Set to false if the patient currently does not have a positive immediate skin test response to cat allergen preparation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive immediate skin test response to cat allergen preparation.","meaning":"Boolean indicating whether the patient currently has a positive immediate skin test response to cat allergen preparation."} // "cat"
(declare-const patient_has_positive_immediate_skin_test_response_to_dog_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive immediate skin test response to dog allergen preparation.","when_to_set_to_false":"Set to false if the patient currently does not have a positive immediate skin test response to dog allergen preparation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive immediate skin test response to dog allergen preparation.","meaning":"Boolean indicating whether the patient currently has a positive immediate skin test response to dog allergen preparation."} // "dog"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_allergic_sensitization_now@@confirmed_by_positive_immediate_skin_test_response
         patient_has_finding_of_allergic_sensitization_now)
     :named REQ5_AUXILIARY0)) ;; "confirmed by positive immediate skin test response"

(assert
  (! (=> patient_has_finding_of_allergic_sensitization_now@@to_at_least_one_specified_allergen_preparation
         patient_has_finding_of_allergic_sensitization_now)
     :named REQ5_AUXILIARY1)) ;; "to at least one of the following allergen preparations"

;; Definition: allergic sensitization to at least one specified allergen preparation is equivalent to positive immediate skin test response to any listed allergen
(assert
  (! (= patient_has_finding_of_allergic_sensitization_now@@to_at_least_one_specified_allergen_preparation
        (or patient_has_positive_immediate_skin_test_response_to_house_dust_mite_f_now
            patient_has_positive_immediate_skin_test_response_to_house_dust_mite_p_now
            patient_has_positive_immediate_skin_test_response_to_cockroach_now
            patient_has_positive_immediate_skin_test_response_to_tree_mix_now
            patient_has_positive_immediate_skin_test_response_to_grass_mix_now
            patient_has_positive_immediate_skin_test_response_to_weed_mix_now
            patient_has_positive_immediate_skin_test_response_to_mold_mix_1_now
            patient_has_positive_immediate_skin_test_response_to_mold_mix_2_now
            patient_has_positive_immediate_skin_test_response_to_rat_now
            patient_has_positive_immediate_skin_test_response_to_mouse_now
            patient_has_positive_immediate_skin_test_response_to_guinea_pig_now
            patient_has_positive_immediate_skin_test_response_to_rabbit_now
            patient_has_positive_immediate_skin_test_response_to_cat_now
            patient_has_positive_immediate_skin_test_response_to_dog_now))
     :named REQ5_AUXILIARY2)) ;; "at least one of the following allergen preparations, confirmed by positive immediate skin test response"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Inclusion: patient must have allergic sensitization confirmed by positive immediate skin test response to at least one specified allergen preparation
(assert
  (! (and patient_has_finding_of_allergic_sensitization_now@@confirmed_by_positive_immediate_skin_test_response
          patient_has_finding_of_allergic_sensitization_now@@to_at_least_one_specified_allergen_preparation)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have allergic sensitization to at least one of the following allergen preparations, confirmed by positive immediate skin test response"

;; ===================== Declarations for the inclusion criterion (REQ 6) =====================
(declare-const individual_symptom_score_values_recorded_now_withunit_points (Array Int Real)) ;; {"when_to_set_to_value":"Set to the list of values for each individual symptom score for the patient, as recorded now, in points.","when_to_set_to_null":"Set to null if any individual symptom score is unknown, not documented, or cannot be determined.","meaning":"List of numeric values for each individual symptom score for the patient, recorded now, in points."} // "each individual score ≤ 3" and "no more than one score ≥ 3"
(declare-const num_individual_symptom_scores_greater_than_or_equal_3_now Int) ;; {"when_to_set_to_value":"Set to the number of individual symptom scores for the patient, recorded now, that are greater than or equal to 3.","when_to_set_to_null":"Set to null if any individual symptom score is unknown, not documented, or cannot be determined.","meaning":"Number of individual symptom scores for the patient, recorded now, that are greater than or equal to 3."} // "no more than one score ≥ 3"
(declare-const total_symptom_score_value_recorded_now_withunit_points Real) ;; {"when_to_set_to_value":"Set to the value of the total symptom score for the patient, as recorded now, in points.","when_to_set_to_null":"Set to null if the total symptom score is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the total symptom score for the patient, recorded now, in points (maximum possible: 24)."} // "total symptom score ≤ 16 out of a possible 24"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; num_individual_symptom_scores_greater_than_or_equal_3_now is the count of individual scores >= 3
;; Definition in the requirement: "no more than one score ≥ 3"
(define-fun num_scores () Int
  8) ;; Number of individual symptom scores (assumed 8 for a total possible score of 24, i.e., each score max 3 points)

(assert
  (! (= num_individual_symptom_scores_greater_than_or_equal_3_now
        (+
          (ite (>= (select individual_symptom_score_values_recorded_now_withunit_points 0) 3) 1 0)
          (ite (>= (select individual_symptom_score_values_recorded_now_withunit_points 1) 3) 1 0)
          (ite (>= (select individual_symptom_score_values_recorded_now_withunit_points 2) 3) 1 0)
          (ite (>= (select individual_symptom_score_values_recorded_now_withunit_points 3) 3) 1 0)
          (ite (>= (select individual_symptom_score_values_recorded_now_withunit_points 4) 3) 1 0)
          (ite (>= (select individual_symptom_score_values_recorded_now_withunit_points 5) 3) 1 0)
          (ite (>= (select individual_symptom_score_values_recorded_now_withunit_points 6) 3) 1 0)
          (ite (>= (select individual_symptom_score_values_recorded_now_withunit_points 7) 3) 1 0)
        ))
     :named REQ6_AUXILIARY0)) ;; "no more than one score ≥ 3"

;; total_symptom_score_value_recorded_now_withunit_points is the sum of all individual scores
(assert
  (! (= total_symptom_score_value_recorded_now_withunit_points
        (+
          (select individual_symptom_score_values_recorded_now_withunit_points 0)
          (select individual_symptom_score_values_recorded_now_withunit_points 1)
          (select individual_symptom_score_values_recorded_now_withunit_points 2)
          (select individual_symptom_score_values_recorded_now_withunit_points 3)
          (select individual_symptom_score_values_recorded_now_withunit_points 4)
          (select individual_symptom_score_values_recorded_now_withunit_points 5)
          (select individual_symptom_score_values_recorded_now_withunit_points 6)
          (select individual_symptom_score_values_recorded_now_withunit_points 7)
        ))
     :named REQ6_AUXILIARY1)) ;; "total symptom score ≤ 16 out of a possible 24"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: total symptom score ≤ 16 out of a possible 24
(assert
  (! (<= total_symptom_score_value_recorded_now_withunit_points 16)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "total symptom score ≤ 16 out of a possible 24"

;; Component 1: each individual score ≤ 3
(assert
  (! (and
        (<= (select individual_symptom_score_values_recorded_now_withunit_points 0) 3)
        (<= (select individual_symptom_score_values_recorded_now_withunit_points 1) 3)
        (<= (select individual_symptom_score_values_recorded_now_withunit_points 2) 3)
        (<= (select individual_symptom_score_values_recorded_now_withunit_points 3) 3)
        (<= (select individual_symptom_score_values_recorded_now_withunit_points 4) 3)
        (<= (select individual_symptom_score_values_recorded_now_withunit_points 5) 3)
        (<= (select individual_symptom_score_values_recorded_now_withunit_points 6) 3)
        (<= (select individual_symptom_score_values_recorded_now_withunit_points 7) 3)
     )
     :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "each individual score ≤ 3"

;; Component 2: no more than one score ≥ 3
(assert
  (! (<= num_individual_symptom_scores_greater_than_or_equal_3_now 1)
     :named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "no more than one score ≥ 3"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_is_exposed_to_caffeine_inthepast12hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to caffeine in the 12 hours prior to the reference timepoint (such as a study visit).","when_to_set_to_false":"Set to false if the patient has not been exposed to caffeine in the 12 hours prior to the reference timepoint.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to caffeine in the 12 hours prior to the reference timepoint.","meaning":"Boolean indicating whether the patient was exposed to caffeine in the 12 hours prior to the reference timepoint."} // "avoid caffeine for ≥ 12 hours prior to all visits"
(declare-const patient_is_willing_to_avoid_caffeine_prior_to_all_visits Bool) ;; {"when_to_set_to_true":"Set to true if the patient expresses willingness to avoid caffeine for at least 12 hours prior to all study visits.","when_to_set_to_false":"Set to false if the patient does not express willingness to avoid caffeine for at least 12 hours prior to all study visits.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to avoid caffeine for at least 12 hours prior to all study visits.","meaning":"Boolean indicating whether the patient is willing to avoid caffeine for at least 12 hours prior to all study visits."} // "willing to avoid caffeine for ≥ 12 hours prior to all visits"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! patient_is_willing_to_avoid_caffeine_prior_to_all_visits
     :named REQ7_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be willing to avoid caffeine for ≥ 12 hours prior to all visits."
