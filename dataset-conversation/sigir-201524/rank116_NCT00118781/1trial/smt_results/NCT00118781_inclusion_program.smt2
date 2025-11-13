;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (age ≥ 18 years)."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_is_undergoing_orotracheal_intubation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently orally intubated (orotracheal intubation) at the time of scheduled randomization.","when_to_set_to_false":"Set to false if the patient is not currently orally intubated at the time of scheduled randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently orally intubated at the time of scheduled randomization.","meaning":"Boolean indicating whether the patient is currently orally intubated (orotracheal intubation) now."} // "orally intubated"
(declare-const patient_is_undergoing_nasotracheal_intubation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently nasally intubated (nasotracheal intubation) at the time of scheduled randomization.","when_to_set_to_false":"Set to false if the patient is not currently nasally intubated at the time of scheduled randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently nasally intubated at the time of scheduled randomization.","meaning":"Boolean indicating whether the patient is currently nasally intubated (nasotracheal intubation) now."} // "nasally intubated"
(declare-const patient_is_undergoing_artificial_respiration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving mechanical ventilation (artificial respiration) at the time of scheduled randomization.","when_to_set_to_false":"Set to false if the patient is not currently receiving mechanical ventilation at the time of scheduled randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving mechanical ventilation at the time of scheduled randomization.","meaning":"Boolean indicating whether the patient is currently receiving mechanical ventilation (artificial respiration) now."} // "receiving mechanical ventilation"
(declare-const patient_is_undergoing_artificial_respiration_now@@received_for_less_than_24_hours_prior_to_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving mechanical ventilation and has received it for less than 24 hours prior to scheduled randomization.","when_to_set_to_false":"Set to false if the patient is currently receiving mechanical ventilation but has received it for 24 hours or more prior to scheduled randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received mechanical ventilation for less than 24 hours prior to scheduled randomization.","meaning":"Boolean indicating whether the patient is currently receiving mechanical ventilation and has received it for less than 24 hours prior to scheduled randomization."} // "receiving mechanical ventilation for < 24 hours prior to scheduled randomization"
(declare-const administration_of_first_dose_of_study_drug_has_occurred Bool) ;; {"when_to_set_to_true":"Set to true if the administration of the first dose of study drug has occurred.","when_to_set_to_false":"Set to false if the administration of the first dose of study drug has not occurred.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the administration of the first dose of study drug has occurred.","meaning":"Boolean indicating whether the administration of the first dose of study drug has occurred."} // "administration of the first dose of study drug"
(declare-const attending_physician_judgment_patient_expected_to_remain_intubated_orally_or_nasally Bool) ;; {"when_to_set_to_true":"Set to true if, in the judgment of the attending physician, the patient is expected to remain orally or nasally intubated.","when_to_set_to_false":"Set to false if, in the judgment of the attending physician, the patient is not expected to remain orally or nasally intubated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether, in the judgment of the attending physician, the patient is expected to remain orally or nasally intubated.","meaning":"Boolean indicating whether, in the judgment of the attending physician, the patient is expected to remain orally or nasally intubated."} // "expected to remain (orally intubated OR nasally intubated)"
(declare-const patient_is_undergoing_artificial_respiration_now@@expected_to_remain_ventilated_for_48_hours_or_more Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving mechanical ventilation and is expected to remain mechanically ventilated for at least 48 hours.","when_to_set_to_false":"Set to false if the patient is currently receiving mechanical ventilation but is not expected to remain mechanically ventilated for at least 48 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is expected to remain mechanically ventilated for at least 48 hours.","meaning":"Boolean indicating whether the patient is currently receiving mechanical ventilation and is expected to remain mechanically ventilated for at least 48 hours."} // "expected to remain mechanically ventilated for ≥ 48 hours"
(declare-const patient_is_undergoing_orotracheal_intubation_now@@expected_to_remain_intubated_for_48_hours_or_more Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently orally intubated and is expected to remain orally intubated for at least 48 hours.","when_to_set_to_false":"Set to false if the patient is currently orally intubated but is not expected to remain orally intubated for at least 48 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is expected to remain orally intubated for at least 48 hours.","meaning":"Boolean indicating whether the patient is currently orally intubated and is expected to remain orally intubated for at least 48 hours."} // "expected to remain orally intubated for ≥ 48 hours"
(declare-const patient_is_undergoing_nasotracheal_intubation_now@@expected_to_remain_intubated_for_48_hours_or_more Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently nasally intubated and is expected to remain nasally intubated for at least 48 hours.","when_to_set_to_false":"Set to false if the patient is currently nasally intubated but is not expected to remain nasally intubated for at least 48 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is expected to remain nasally intubated for at least 48 hours.","meaning":"Boolean indicating whether the patient is currently nasally intubated and is expected to remain nasally intubated for at least 48 hours."} // "expected to remain nasally intubated for ≥ 48 hours"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Attending physician's judgment of expected intubation is satisfied if either expected oral or nasal intubation for ≥ 48 hours
(assert
  (! (= attending_physician_judgment_patient_expected_to_remain_intubated_orally_or_nasally
        (or patient_is_undergoing_orotracheal_intubation_now@@expected_to_remain_intubated_for_48_hours_or_more
            patient_is_undergoing_nasotracheal_intubation_now@@expected_to_remain_intubated_for_48_hours_or_more))
     :named REQ1_AUXILIARY0)) ;; "expected to remain (orally intubated OR nasally intubated) for ≥ 48 hours"

;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_is_undergoing_orotracheal_intubation_now@@expected_to_remain_intubated_for_48_hours_or_more
         patient_is_undergoing_orotracheal_intubation_now)
     :named REQ1_AUXILIARY1)) ;; "expected to remain orally intubated for ≥ 48 hours"

(assert
  (! (=> patient_is_undergoing_nasotracheal_intubation_now@@expected_to_remain_intubated_for_48_hours_or_more
         patient_is_undergoing_nasotracheal_intubation_now)
     :named REQ1_AUXILIARY2)) ;; "expected to remain nasally intubated for ≥ 48 hours"

(assert
  (! (=> patient_is_undergoing_artificial_respiration_now@@expected_to_remain_ventilated_for_48_hours_or_more
         patient_is_undergoing_artificial_respiration_now)
     :named REQ1_AUXILIARY3)) ;; "expected to remain mechanically ventilated for ≥ 48 hours"

(assert
  (! (=> patient_is_undergoing_artificial_respiration_now@@received_for_less_than_24_hours_prior_to_randomization
         patient_is_undergoing_artificial_respiration_now)
     :named REQ1_AUXILIARY4)) ;; "receiving mechanical ventilation for < 24 hours prior to scheduled randomization"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Patient must be orally or nasally intubated
(assert
  (! (or patient_is_undergoing_orotracheal_intubation_now
         patient_is_undergoing_nasotracheal_intubation_now)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "orally intubated OR nasally intubated"

;; Component 1: Patient must be receiving mechanical ventilation for < 24 hours prior to scheduled randomization AND administration of first dose of study drug
(assert
  (! (and patient_is_undergoing_artificial_respiration_now@@received_for_less_than_24_hours_prior_to_randomization
          administration_of_first_dose_of_study_drug_has_occurred)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "receiving mechanical ventilation for < 24 hours prior to scheduled randomization AND administration of the first dose of study drug"

;; Component 2: In the judgment of the attending physician, patient must be expected to remain orally or nasally intubated
(assert
  (! attending_physician_judgment_patient_expected_to_remain_intubated_orally_or_nasally
     :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "expected to remain (orally intubated OR nasally intubated)"

;; Component 3: In the judgment of the attending physician, patient must be expected to remain mechanically ventilated for ≥ 48 hours
(assert
  (! patient_is_undergoing_artificial_respiration_now@@expected_to_remain_ventilated_for_48_hours_or_more
     :named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "expected to remain mechanically ventilated for ≥ 48 hours"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_expected_survival_time_value_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days the patient is expected to survive from the time of enrollment, as estimated by the clinical team.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days the patient is expected to survive from the time of enrollment.","meaning":"Numeric value representing the number of days the patient is expected to survive from the time of enrollment."} // "expected to survive for at least 21 days"
(declare-const patient_is_undergoing_nasotracheal_intubation_now@@must_remain_at_investigational_site_and_not_be_transferred_while_intubated_during_21_day_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing nasotracheal (nasal) intubation and is expected to remain at the investigational site and not be transferred to another institution while intubated during the 21-day study period.","when_to_set_to_false":"Set to false if the patient is currently undergoing nasotracheal (nasal) intubation but is not expected to remain at the investigational site or may be transferred to another institution while intubated during the 21-day study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will remain at the investigational site and not be transferred while intubated during the 21-day study period.","meaning":"Boolean indicating whether the patient, while currently undergoing nasotracheal (nasal) intubation, is expected to remain at the investigational site and not be transferred to another institution during the 21-day study period."} // "expected to remain at the investigational site and not be transferred while nasally intubated during the 21-day study period"
(declare-const patient_is_undergoing_orotracheal_intubation_now@@must_remain_at_investigational_site_and_not_be_transferred_while_intubated_during_21_day_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing orotracheal (oral) intubation and is expected to remain at the investigational site and not be transferred to another institution while intubated during the 21-day study period.","when_to_set_to_false":"Set to false if the patient is currently undergoing orotracheal (oral) intubation but is not expected to remain at the investigational site or may be transferred to another institution while intubated during the 21-day study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will remain at the investigational site and not be transferred while intubated during the 21-day study period.","meaning":"Boolean indicating whether the patient, while currently undergoing orotracheal (oral) intubation, is expected to remain at the investigational site and not be transferred to another institution during the 21-day study period."} // "expected to remain at the investigational site and not be transferred while orally intubated during the 21-day study period"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Patient must be expected to survive for at least 21 days
(assert
  (! (>= patient_expected_survival_time_value_in_days 21.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "expected to survive for at least 21 days"

;; Component 1: Patient must be expected to remain at the investigational site and not be transferred to another institution while orally or nasally intubated during the 21-day study period
(assert
  (! (and
        (or
          (not patient_is_undergoing_orotracheal_intubation_now)
          patient_is_undergoing_orotracheal_intubation_now@@must_remain_at_investigational_site_and_not_be_transferred_while_intubated_during_21_day_study_period)
        (or
          (not patient_is_undergoing_nasotracheal_intubation_now)
          patient_is_undergoing_nasotracheal_intubation_now@@must_remain_at_investigational_site_and_not_be_transferred_while_intubated_during_21_day_study_period)
      )
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "expected to remain at the investigational site and not be transferred to another institution while orally intubated or while nasally intubated during the 21-day study period"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_unconscious_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unconscious.","when_to_set_to_false":"Set to false if the patient is currently not unconscious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unconscious.","meaning":"Boolean indicating whether the patient is currently unconscious."} // "unconscious"
(declare-const patient_has_finding_of_altered_sensorium_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently experiencing altered sensorium.","when_to_set_to_false":"Set to false if the patient is currently not experiencing altered sensorium.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently experiencing altered sensorium.","meaning":"Boolean indicating whether the patient is currently experiencing altered sensorium."} // "has altered sensorium"
(declare-const patient_is_willing_to_provide_written_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently willing to provide written informed consent.","when_to_set_to_false":"Set to false if the patient is currently not willing to provide written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently willing to provide written informed consent.","meaning":"Boolean indicating whether the patient is currently willing to provide written informed consent."} // "willing to provide written informed consent"
(declare-const patient_is_able_to_provide_written_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to provide written informed consent.","when_to_set_to_false":"Set to false if the patient is currently not able to provide written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to provide written informed consent.","meaning":"Boolean indicating whether the patient is currently able to provide written informed consent."} // "able to provide written informed consent"
(declare-const surrogate_has_provided_written_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if a surrogate has currently provided written informed consent for the patient.","when_to_set_to_false":"Set to false if a surrogate has not currently provided written informed consent for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a surrogate has currently provided written informed consent for the patient.","meaning":"Boolean indicating whether a surrogate has currently provided written informed consent for the patient."} // "have a surrogate provide written informed consent"
(declare-const surrogate_has_provided_written_informed_consent_now@@as_approved_by_the_institution Bool) ;; {"when_to_set_to_true":"Set to true if the surrogate's written informed consent is provided as approved by the institution.","when_to_set_to_false":"Set to false if the surrogate's written informed consent is not provided as approved by the institution.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surrogate's written informed consent is provided as approved by the institution.","meaning":"Boolean indicating whether the surrogate's written informed consent is provided as approved by the institution."} // "as approved by the institution"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> surrogate_has_provided_written_informed_consent_now@@as_approved_by_the_institution
        surrogate_has_provided_written_informed_consent_now)
     :named REQ3_AUXILIARY0)) ;; "have a surrogate provide written informed consent as approved by the institution"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: (patient is willing AND able to provide written informed consent) OR ((unconscious OR has altered sensorium) AND surrogate provides written informed consent as approved by the institution)
(assert
  (! (or (and patient_is_willing_to_provide_written_informed_consent_now
              patient_is_able_to_provide_written_informed_consent_now)
         (and (or patient_has_finding_of_unconscious_now
                  patient_has_finding_of_altered_sensorium_now)
              surrogate_has_provided_written_informed_consent_now@@as_approved_by_the_institution))
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be (willing AND able to provide written informed consent) OR ((unconscious OR has altered sensorium) AND have a surrogate provide written informed consent as approved by the institution)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient's current sex is female."} // "female of childbearing potential"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered to have childbearing potential based on clinical assessment.","when_to_set_to_false":"Set to false if the patient is currently considered not to have childbearing potential (e.g., postmenopausal, surgically sterile).","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient currently has childbearing potential."} // "childbearing potential"
(declare-const patient_has_negative_pregnancy_test_within_7_days_prior_to_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented negative pregnancy test (urine or serum) performed within 7 days prior to randomization, regardless of whether the test was performed for the purposes of this study or another reason.","when_to_set_to_false":"Set to false if the patient does not have a documented negative pregnancy test (urine or serum) performed within 7 days prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a negative pregnancy test (urine or serum) performed within 7 days prior to randomization.","meaning":"Boolean indicating whether the patient has a negative pregnancy test (urine or serum) performed within 7 days prior to randomization."} // "negative pregnancy test (urine pregnancy test OR serum pregnancy test) within 7 days prior to randomization"
(declare-const patient_has_negative_pregnancy_test_within_7_days_prior_to_randomization@@test_type_is_urine_or_serum Bool) ;; {"when_to_set_to_true":"Set to true if the negative pregnancy test performed within 7 days prior to randomization is either a urine pregnancy test or a serum pregnancy test.","when_to_set_to_false":"Set to false if the negative pregnancy test performed within 7 days prior to randomization is not a urine or serum pregnancy test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the negative pregnancy test performed within 7 days prior to randomization is a urine or serum pregnancy test.","meaning":"Boolean indicating whether the negative pregnancy test performed within 7 days prior to randomization is a urine or serum pregnancy test."} // "urine pregnancy test OR serum pregnancy test"
(declare-const patient_has_negative_pregnancy_test_within_7_days_prior_to_randomization@@test_performed_for_other_reason_than_study Bool) ;; {"when_to_set_to_true":"Set to true if the negative pregnancy test (urine or serum) performed within 7 days prior to randomization was obtained for a reason other than the purposes of this study.","when_to_set_to_false":"Set to false if the negative pregnancy test (urine or serum) performed within 7 days prior to randomization was obtained for the purposes of this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the negative pregnancy test (urine or serum) performed within 7 days prior to randomization was obtained for a reason other than the purposes of this study.","meaning":"Boolean indicating whether the negative pregnancy test (urine or serum) performed within 7 days prior to randomization was obtained for a reason other than the purposes of this study."} // "negative pregnancy test results ... obtained for reason other than the purposes of this study are acceptable"
(declare-const patient_is_pregnant_inthepast7days Bool) ;; {"when_to_set_to_true":"Set to true if the patient was documented as pregnant at any time during the 7 days prior to randomization.","when_to_set_to_false":"Set to false if the patient was documented as not pregnant at all times during the 7 days prior to randomization (e.g., negative pregnancy test results).","when_to_set_to_null":"Set to null if the patient's pregnancy status during the 7 days prior to randomization is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient was pregnant at any time during the 7 days prior to randomization."} // "negative pregnancy test (urine pregnancy test OR serum pregnancy test) within 7 days prior to randomization"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_negative_pregnancy_test_within_7_days_prior_to_randomization@@test_type_is_urine_or_serum
         patient_has_negative_pregnancy_test_within_7_days_prior_to_randomization)
     :named REQ4_AUXILIARY0)) ;; "urine pregnancy test OR serum pregnancy test"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_negative_pregnancy_test_within_7_days_prior_to_randomization@@test_performed_for_other_reason_than_study
         patient_has_negative_pregnancy_test_within_7_days_prior_to_randomization)
     :named REQ4_AUXILIARY1)) ;; "negative pregnancy test results ... obtained for reason other than the purposes of this study are acceptable"

;; Negative pregnancy test within 7 days prior to randomization implies not pregnant in the past 7 days
(assert
  (! (=> patient_has_negative_pregnancy_test_within_7_days_prior_to_randomization
         (not patient_is_pregnant_inthepast7days))
     :named REQ4_AUXILIARY2)) ;; "negative pregnancy test (urine pregnancy test OR serum pregnancy test) within 7 days prior to randomization"

;; ===================== Constraint Assertions (REQ 4) =====================
;; If the patient is a female of childbearing potential, she must have a negative pregnancy test (urine or serum) within 7 days prior to randomization
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         (and patient_has_negative_pregnancy_test_within_7_days_prior_to_randomization
              patient_has_negative_pregnancy_test_within_7_days_prior_to_randomization@@test_type_is_urine_or_serum))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient is a female of childbearing potential, the patient must have a negative pregnancy test (urine pregnancy test OR serum pregnancy test) within 7 days prior to randomization"
