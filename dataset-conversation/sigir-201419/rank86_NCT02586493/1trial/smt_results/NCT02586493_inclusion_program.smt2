;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_at_visit_1_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's age in years as recorded at Visit 1 if it is known and documented.","when_to_set_to_null":"Set to null if the patient's age in years at Visit 1 is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's age in years as recorded at Visit 1."}  // "at least 40 years of age at Visit 1"

(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  // "at least 40 years of age at Visit 1"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_at_visit_1_in_years 40)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be at least 40 years of age at Visit 1."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic obstructive pulmonary disease (COPD).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic obstructive pulmonary disease (COPD).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic obstructive pulmonary disease (COPD).","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic obstructive pulmonary disease (COPD)."} // "a diagnosis of chronic obstructive pulmonary disease"
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of chronic obstructive pulmonary disease (COPD) documented at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of chronic obstructive pulmonary disease (COPD) documented in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of chronic obstructive pulmonary disease (COPD).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of chronic obstructive pulmonary disease (COPD) in their medical history."} // "documented history of chronic obstructive pulmonary disease"
(declare-const patient_has_documented_history_of_chronic_obstructive_lung_disease_duration_in_years Real) ;; {"when_to_set_to_value":"Set to the number of years for which the patient has a documented history of chronic obstructive pulmonary disease (COPD).","when_to_set_to_null":"Set to null if the duration of the patient's documented history of chronic obstructive pulmonary disease (COPD) is unknown, not documented, or cannot be determined.","meaning":"Numeric variable indicating the duration, in years, of the patient's documented history of chronic obstructive pulmonary disease (COPD)."} // "documented history of chronic obstructive pulmonary disease for at least one year"
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_according_to_ats_ers_definition Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of chronic obstructive pulmonary disease (COPD) is in accordance with the definition by the American Thoracic Society/European Respiratory Society (ATS/ERS).","when_to_set_to_false":"Set to false if the patient's diagnosis of chronic obstructive pulmonary disease (COPD) is not in accordance with the definition by the American Thoracic Society/European Respiratory Society (ATS/ERS).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's diagnosis of chronic obstructive pulmonary disease (COPD) is in accordance with the definition by the American Thoracic Society/European Respiratory Society (ATS/ERS).","meaning":"Boolean indicating whether the patient's diagnosis of chronic obstructive pulmonary disease (COPD) is in accordance with the definition by the American Thoracic Society/European Respiratory Society (ATS/ERS)."} // "diagnosis in accordance with the definition by the American Thoracic Society/European Respiratory Society"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_diagnosis_of_chronic_obstructive_lung_disease_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "a diagnosis of chronic obstructive pulmonary disease"

(assert
  (! (and patient_has_diagnosis_of_chronic_obstructive_lung_disease_inthehistory
          (>= patient_has_documented_history_of_chronic_obstructive_lung_disease_duration_in_years 1.0))
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "a documented history of chronic obstructive pulmonary disease for at least one year"

(assert
  (! patient_has_diagnosis_of_chronic_obstructive_lung_disease_according_to_ats_ers_definition
     :named REQ1_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "diagnosis in accordance with the definition by the American Thoracic Society/European Respiratory Society"

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_inthehistory_withunit_ratio Real) ;; {"when_to_set_to_value":"Set to the measured value if a post-albuterol FEV1/FVC ratio measurement is available at any time in the patient's history.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's post-albuterol FEV1/FVC ratio recorded at any time in the patient's history."} // "post albuterol forced expiratory volume in one second/forced vital capacity ratio < 0.70"
(declare-const patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_inthehistory_withunit_ratio@@temporalcontext_within_2_years_of_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the measurement of post-albuterol FEV1/FVC ratio was obtained within two years of Visit 1.","when_to_set_to_false":"Set to false if the measurement was not obtained within two years of Visit 1.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the measurement was obtained within two years of Visit 1.","meaning":"Boolean indicating whether the post-albuterol FEV1/FVC ratio measurement was obtained within two years of Visit 1."} // "these measurements obtained within two years of Visit 1"
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_inthehistory_withunit_percent_of_predicted Real) ;; {"when_to_set_to_value":"Set to the measured value if a post-albuterol FEV1 as percent of predicted measurement is available at any time in the patient's history.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's post-albuterol FEV1 as percent of predicted, recorded at any time in the patient's history."} // "post albuterol forced expiratory volume in one second ≤ 70% of predicted"
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_inthehistory_withunit_percent_of_predicted@@temporalcontext_within_2_years_of_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the measurement of post-albuterol FEV1 as percent of predicted was obtained within two years of Visit 1.","when_to_set_to_false":"Set to false if the measurement was not obtained within two years of Visit 1.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the measurement was obtained within two years of Visit 1.","meaning":"Boolean indicating whether the post-albuterol FEV1 as percent of predicted measurement was obtained within two years of Visit 1."} // "these measurements obtained within two years of Visit 1"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: FEV1/FVC ratio < 0.70, obtained within two years of Visit 1
(assert
  (! (and (< patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_inthehistory_withunit_ratio 0.70)
          patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_inthehistory_withunit_ratio@@temporalcontext_within_2_years_of_visit_1)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "post albuterol forced expiratory volume in one second/forced vital capacity ratio < 0.70" AND "these measurements obtained within two years of Visit 1"

;; Component 1: FEV1 ≤ 70% of predicted, obtained within two years of Visit 1
(assert
  (! (and (<= patient_forced_expired_volume_in_1_second_value_recorded_inthehistory_withunit_percent_of_predicted 70.0)
          patient_forced_expired_volume_in_1_second_value_recorded_inthehistory_withunit_percent_of_predicted@@temporalcontext_within_2_years_of_visit_1)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "post albuterol forced expiratory volume in one second ≤ 70% of predicted" AND "these measurements obtained within two years of Visit 1"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_cigarette_pack_years_value_recorded_inthehistory_withunit_pack_years Real) ;; {"when_to_set_to_value":"Set to the measured or calculated total pack-year value if available for the patient's cigarette smoking history.","when_to_set_to_null":"Set to null if no such measurement or calculation is available or the value is indeterminate.","meaning":"Numeric value representing the patient's total pack-year cigarette smoking history."} // "a greater than 10 pack-year cigarette smoking history"
(declare-const patient_has_finding_of_cigarette_smoker_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient was a cigarette smoker in the past (but is not currently a smoker).","when_to_set_to_false":"Set to false if the patient has never been a cigarette smoker in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was a cigarette smoker in the past.","meaning":"Boolean indicating whether the patient has a history of being a cigarette smoker."} // "a former cigarette smoker"
(declare-const patient_has_finding_of_cigarette_smoker_inthehistory@@quit_for_at_least_three_months_prior_to_screening_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has quit cigarette smoking for at least three months prior to Screening/Visit 1.","when_to_set_to_false":"Set to false if the patient has not quit for at least three months prior to Screening/Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient quit for at least three months prior to Screening/Visit 1.","meaning":"Boolean indicating whether the patient has quit cigarette smoking for at least three months prior to Screening/Visit 1."} // "defined as having quit cigarette smoking for at least three months prior to Screening/Visit 1"
(declare-const patient_has_finding_of_cigarette_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a cigarette smoker.","when_to_set_to_false":"Set to false if the patient is currently not a cigarette smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a cigarette smoker.","meaning":"Boolean indicating whether the patient is currently a cigarette smoker."} // "a current cigarette smoker"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_cigarette_smoker_inthehistory@@quit_for_at_least_three_months_prior_to_screening_visit_1
         patient_has_finding_of_cigarette_smoker_inthehistory)
     :named REQ3_AUXILIARY0)) ;; "defined as having quit cigarette smoking for at least three months prior to Screening/Visit 1"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: Must be a current cigarette smoker OR a former cigarette smoker (who quit for at least three months prior to Screening/Visit 1)
(assert
  (! (or patient_has_finding_of_cigarette_smoker_now
         patient_has_finding_of_cigarette_smoker_inthehistory@@quit_for_at_least_three_months_prior_to_screening_visit_1)
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "current cigarette smoker OR former cigarette smoker (quit for at least three months prior to Screening/Visit 1)"

;; Component 1: Must have a greater than 10 pack-year cigarette smoking history
(assert
  (! (> patient_cigarette_pack_years_value_recorded_inthehistory_withunit_pack_years 10.0)
     :named REQ3_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "greater than 10 pack-year cigarette smoking history"

;; ===================== Declarations for the inclusion criteria (REQ 4) =====================
(declare-const patient_is_receiving_maintenance_therapy_for_chronic_obstructive_pulmonary_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving maintenance therapy for chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient is not currently receiving maintenance therapy for chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving maintenance therapy for chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient is currently receiving maintenance therapy for chronic obstructive pulmonary disease."} // "currently be receiving maintenance therapy for chronic obstructive pulmonary disease"
(declare-const patient_is_receiving_maintenance_therapy_for_chronic_obstructive_pulmonary_disease_now@@with_at_least_one_long_acting_bronchodilator_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current maintenance therapy for chronic obstructive pulmonary disease includes at least one long-acting bronchodilator therapy.","when_to_set_to_false":"Set to false if the patient's current maintenance therapy for chronic obstructive pulmonary disease does not include at least one long-acting bronchodilator therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current maintenance therapy for chronic obstructive pulmonary disease includes at least one long-acting bronchodilator therapy.","meaning":"Boolean indicating whether the patient's current maintenance therapy for chronic obstructive pulmonary disease includes at least one long-acting bronchodilator therapy."} // "with at least one long-acting bronchodilator therapy"
(declare-const patient_has_prior_use_of_ellipta_inhaler Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any prior use of ELLIPTA inhaler.","when_to_set_to_false":"Set to false if the patient has no prior use of ELLIPTA inhaler.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has any prior use of ELLIPTA inhaler.","meaning":"Boolean indicating whether the patient has any prior use of ELLIPTA inhaler."} // "have no prior use of ELLIPTA inhaler"
(declare-const patient_has_ongoing_use_of_ellipta_inhaler_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ongoing use of ELLIPTA inhaler at the current time.","when_to_set_to_false":"Set to false if the patient does not have ongoing use of ELLIPTA inhaler at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ongoing use of ELLIPTA inhaler at the current time.","meaning":"Boolean indicating whether the patient has ongoing use of ELLIPTA inhaler at the current time."} // "have no ongoing use of ELLIPTA inhaler"
(declare-const patient_is_able_to_continue_using_current_copd_maintenance_inhaler_therapy_throughout_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to continue using the currently prescribed chronic obstructive pulmonary disease maintenance inhaler therapy throughout the study.","when_to_set_to_false":"Set to false if the patient is not able to continue using the currently prescribed chronic obstructive pulmonary disease maintenance inhaler therapy throughout the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to continue using the currently prescribed chronic obstructive pulmonary disease maintenance inhaler therapy throughout the study.","meaning":"Boolean indicating whether the patient is able to continue using the currently prescribed chronic obstructive pulmonary disease maintenance inhaler therapy throughout the study."} // "be able to continue using the currently prescribed chronic obstructive pulmonary disease maintenance inhaler therapy throughout the study"
(declare-const patient_is_exposed_to_beta_adrenergic_receptor_agonist_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to beta-adrenergic receptor agonist (i.e., is able to use as-needed short-acting beta-adrenergic agonist therapy for rescue use).","when_to_set_to_false":"Set to false if the patient is not currently exposed to beta-adrenergic receptor agonist (i.e., is unable to use as-needed short-acting beta-adrenergic agonist therapy for rescue use).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to beta-adrenergic receptor agonist.","meaning":"Boolean indicating whether the patient is currently exposed to beta-adrenergic receptor agonist."} // "be able to continue using as needed short acting beta-adrenergic agonist therapy for rescue use"
(declare-const patient_is_exposed_to_beta_adrenergic_receptor_agonist_now@@as_needed_for_rescue_use Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to beta-adrenergic receptor agonist is specifically for as-needed rescue use.","when_to_set_to_false":"Set to false if the patient's current exposure to beta-adrenergic receptor agonist is not for as-needed rescue use.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is for as-needed rescue use.","meaning":"Boolean indicating whether the patient's current exposure to beta-adrenergic receptor agonist is for as-needed rescue use."} // "be able to continue using as needed short acting beta-adrenergic agonist therapy for rescue use"

;; Additional variables for non-exhaustive examples (umbrella term: long-acting bronchodilator therapy)
(declare-const patient_is_receiving_long_acting_muscarinic_antagonist_inhaler_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving long-acting muscarinic antagonist inhaler therapy.","when_to_set_to_false":"Set to false if the patient is not currently receiving long-acting muscarinic antagonist inhaler therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving long-acting muscarinic antagonist inhaler therapy.","meaning":"Boolean indicating whether the patient is currently receiving long-acting muscarinic antagonist inhaler therapy."} // "long-acting muscarinic antagonist inhaler therapy (example of long-acting bronchodilator therapy)"
(declare-const patient_is_receiving_long_acting_beta_2_agonist_inhaler_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving long-acting beta 2-agonist inhaler therapy.","when_to_set_to_false":"Set to false if the patient is not currently receiving long-acting beta 2-agonist inhaler therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving long-acting beta 2-agonist inhaler therapy.","meaning":"Boolean indicating whether the patient is currently receiving long-acting beta 2-agonist inhaler therapy."} // "long-acting beta 2-agonist inhaler therapy (example of long-acting bronchodilator therapy)"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive examples imply umbrella subclass
(assert
  (! (=> (or patient_is_receiving_long_acting_muscarinic_antagonist_inhaler_therapy_now
             patient_is_receiving_long_acting_beta_2_agonist_inhaler_therapy_now)
         patient_is_receiving_maintenance_therapy_for_chronic_obstructive_pulmonary_disease_now@@with_at_least_one_long_acting_bronchodilator_therapy_now)
     :named REQ4_AUXILIARY0)) ;; "long-acting muscarinic antagonist inhaler therapy, long-acting beta 2-agonist inhaler therapy are examples of long-acting bronchodilator therapy"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_is_receiving_maintenance_therapy_for_chronic_obstructive_pulmonary_disease_now@@with_at_least_one_long_acting_bronchodilator_therapy_now
         patient_is_receiving_maintenance_therapy_for_chronic_obstructive_pulmonary_disease_now)
     :named REQ4_AUXILIARY1)) ;; "maintenance therapy for COPD with at least one long-acting bronchodilator therapy"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_is_exposed_to_beta_adrenergic_receptor_agonist_now@@as_needed_for_rescue_use
         patient_is_exposed_to_beta_adrenergic_receptor_agonist_now)
     :named REQ4_AUXILIARY2)) ;; "as needed short acting beta-adrenergic agonist therapy for rescue use"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: Must currently be receiving maintenance therapy for COPD with at least one long-acting bronchodilator therapy
(assert
  (! (and patient_is_receiving_maintenance_therapy_for_chronic_obstructive_pulmonary_disease_now
          patient_is_receiving_maintenance_therapy_for_chronic_obstructive_pulmonary_disease_now@@with_at_least_one_long_acting_bronchodilator_therapy_now)
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "currently be receiving maintenance therapy for COPD with at least one long-acting bronchodilator therapy"

;; Component 1: Must have no prior use of ELLIPTA inhaler
(assert
  (! (not patient_has_prior_use_of_ellipta_inhaler)
     :named REQ4_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have no prior use of ELLIPTA inhaler"

;; Component 2: Must have no ongoing use of ELLIPTA inhaler
(assert
  (! (not patient_has_ongoing_use_of_ellipta_inhaler_now)
     :named REQ4_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have no ongoing use of ELLIPTA inhaler"

;; Component 3: Must be able to continue using currently prescribed COPD maintenance inhaler therapy throughout the study
(assert
  (! patient_is_able_to_continue_using_current_copd_maintenance_inhaler_therapy_throughout_study
     :named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "be able to continue using the currently prescribed chronic obstructive pulmonary disease maintenance inhaler therapy throughout the study"

;; Component 4: Must be able to continue using as needed short acting beta-adrenergic agonist therapy for rescue use
(assert
  (! patient_is_exposed_to_beta_adrenergic_receptor_agonist_now@@as_needed_for_rescue_use
     :named REQ4_COMPONENT4_OTHER_REQUIREMENTS)) ;; "be able to continue using as needed short acting beta-adrenergic agonist therapy for rescue use"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_can_undergo_ellipta_inhaler_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to demonstrate correct use of the ELLIPTA inhaler.","when_to_set_to_false":"Set to false if the patient is currently unable to demonstrate correct use of the ELLIPTA inhaler.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to demonstrate correct use of the ELLIPTA inhaler.","meaning":"Boolean indicating whether the patient is currently able to demonstrate correct use of the ELLIPTA inhaler."} // "able to demonstrate correct use of ELLIPTA inhaler"
(declare-const patient_can_undergo_ellipta_inhaler_now@@demonstrated_within_three_attempts_at_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient demonstrates correct use of the ELLIPTA inhaler within three attempts at Visit 1.","when_to_set_to_false":"Set to false if the patient does not demonstrate correct use of the ELLIPTA inhaler within three attempts at Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient demonstrates correct use of the ELLIPTA inhaler within three attempts at Visit 1.","meaning":"Boolean indicating whether the patient demonstrates correct use of the ELLIPTA inhaler within three attempts at Visit 1."} // "demonstrate correct use of ELLIPTA inhaler within three attempts at Visit 1"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_can_undergo_ellipta_inhaler_now@@demonstrated_within_three_attempts_at_visit_1
         patient_can_undergo_ellipta_inhaler_now)
     :named REQ5_AUXILIARY0)) ;; "demonstrate correct use of ELLIPTA inhaler within three attempts at Visit 1" implies "able to demonstrate correct use of ELLIPTA inhaler"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_can_undergo_ellipta_inhaler_now@@demonstrated_within_three_attempts_at_visit_1
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "must be able to demonstrate correct use of ELLIPTA inhaler within three attempts at Visit 1"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_is_male Bool) ;; {"when_to_set_to_true":"Set to true if the patient is male.","when_to_set_to_false":"Set to false if the patient is not male.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is male.","meaning":"Boolean indicating whether the patient is male."} // "male"
(declare-const patient_is_female Bool) ;; {"when_to_set_to_true":"Set to true if the patient is female.","when_to_set_to_false":"Set to false if the patient is not female.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is female.","meaning":"Boolean indicating whether the patient is female."} // "female"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently pregnant.","meaning":"Boolean indicating whether the patient is currently pregnant."} // "NOT pregnant"
(declare-const patient_is_planning_pregnancy_during_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient is planning to become pregnant during the study period.","when_to_set_to_false":"Set to false if the patient is not planning to become pregnant during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is planning to become pregnant during the study period.","meaning":"Boolean indicating whether the patient is planning to become pregnant during the study period."} // "NOT planning a pregnancy during the study"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently not lactating.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently lactating.","meaning":"Boolean indicating whether the patient is currently lactating."} // "NOT lactating"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: To be included, the patient must be (male) OR (female AND NOT pregnant AND NOT planning a pregnancy during the study AND NOT lactating).
(assert
  (! (or patient_is_male
         (and patient_is_female
              (not patient_is_pregnant_now)
              (not patient_is_planning_pregnancy_during_study)
              (not patient_is_lactating_now)))
     :named REQ6_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (male) OR (female AND NOT pregnant AND NOT planning a pregnancy during the study AND NOT lactating)."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_signed_and_dated_written_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently provided signed and dated written informed consent.","when_to_set_to_false":"Set to false if the patient has not currently provided signed and dated written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has currently provided signed and dated written informed consent.","meaning":"Boolean indicating whether the patient currently has provided signed and dated written informed consent."} // "the patient must be capable of giving signed and dated written informed consent"
(declare-const patient_has_signed_and_dated_written_informed_consent_now@@includes_compliance_with_requirements_and_restrictions_listed_in_consent_form_and_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the patient's signed and dated written informed consent includes compliance with the requirements and restrictions listed in the consent form and in the protocol.","when_to_set_to_false":"Set to false if the patient's signed and dated written informed consent does not include compliance with the requirements and restrictions listed in the consent form and in the protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's signed and dated written informed consent includes compliance with the requirements and restrictions listed in the consent form and in the protocol.","meaning":"Boolean indicating whether the patient's signed and dated written informed consent includes compliance with the requirements and restrictions listed in the consent form and in the protocol."} // "which includes compliance with the requirements and restrictions listed in the consent form and in the protocol"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_signed_and_dated_written_informed_consent_now@@includes_compliance_with_requirements_and_restrictions_listed_in_consent_form_and_protocol
         patient_has_signed_and_dated_written_informed_consent_now)
     :named REQ7_AUXILIARY0)) ;; "which includes compliance with the requirements and restrictions listed in the consent form and in the protocol" implies "signed and dated written informed consent"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (and patient_has_signed_and_dated_written_informed_consent_now
          patient_has_signed_and_dated_written_informed_consent_now@@includes_compliance_with_requirements_and_restrictions_listed_in_consent_form_and_protocol)
     :named REQ7_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be capable of giving signed and dated written informed consent which includes compliance with the requirements and restrictions listed in the consent form and in the protocol"

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_understands_study_procedures_and_restrictions Bool) ;; {"when_to_set_to_true":"Set to true if the patient understands the study procedures and restrictions.","when_to_set_to_false":"Set to false if the patient does not understand the study procedures and restrictions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient understands the study procedures and restrictions.","meaning":"Boolean indicating whether the patient understands the study procedures and restrictions."} // "the patient must understand ... study procedures and restrictions"
(declare-const patient_is_willing_to_comply_with_study_procedures_and_restrictions Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to comply with study procedures and restrictions.","when_to_set_to_false":"Set to false if the patient is not willing to comply with study procedures and restrictions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to comply with study procedures and restrictions.","meaning":"Boolean indicating whether the patient is willing to comply with study procedures and restrictions."} // "the patient must ... be willing ... to comply with study procedures and restrictions"
(declare-const patient_is_able_to_comply_with_study_procedures_and_restrictions Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to comply with study procedures and restrictions.","when_to_set_to_false":"Set to false if the patient is not able to comply with study procedures and restrictions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to comply with study procedures and restrictions.","meaning":"Boolean indicating whether the patient is able to comply with study procedures and restrictions."} // "the patient must ... be able ... to comply with study procedures and restrictions"
(declare-const patient_is_likely_to_comply_with_study_procedures_and_restrictions Bool) ;; {"when_to_set_to_true":"Set to true if the patient is likely to comply with study procedures and restrictions.","when_to_set_to_false":"Set to false if the patient is not likely to comply with study procedures and restrictions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is likely to comply with study procedures and restrictions.","meaning":"Boolean indicating whether the patient is likely to comply with study procedures and restrictions."} // "the patient must ... be likely to comply with study procedures and restrictions"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (and patient_understands_study_procedures_and_restrictions
          patient_is_willing_to_comply_with_study_procedures_and_restrictions
          patient_is_able_to_comply_with_study_procedures_and_restrictions
          patient_is_likely_to_comply_with_study_procedures_and_restrictions)
     :named REQ8_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must (understand) AND (be willing) AND (be able) AND (be likely to comply with study procedures and restrictions)."

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_is_able_to_comprehend_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to comprehend information.","when_to_set_to_false":"Set to false if the patient is currently not able to comprehend information.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to comprehend information.","meaning":"Boolean indicating whether the patient is currently able to comprehend information."} // "the patient must be able to comprehend"
(declare-const patient_is_able_to_read_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to read.","when_to_set_to_false":"Set to false if the patient is currently not able to read.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to read.","meaning":"Boolean indicating whether the patient is currently able to read."} // "the patient must be able to read"
(declare-const patient_is_able_to_record_information_in_english_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to record information in English.","when_to_set_to_false":"Set to false if the patient is currently not able to record information in English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to record information in English.","meaning":"Boolean indicating whether the patient is currently able to record information in English."} // "the patient must be able to record information in English"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (and patient_is_able_to_read_now
          patient_is_able_to_comprehend_now
          patient_is_able_to_record_information_in_english_now)
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be able to (read) AND (comprehend) AND (record information in English)."
