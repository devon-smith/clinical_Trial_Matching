;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_provided_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided informed consent.","when_to_set_to_false":"Set to false if the patient has not provided informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided informed consent.","meaning":"Boolean indicating whether the patient has provided informed consent."} // "provide informed consent"
(declare-const patient_has_provided_informed_assent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided informed assent.","when_to_set_to_false":"Set to false if the patient has not provided informed assent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided informed assent.","meaning":"Boolean indicating whether the patient has provided informed assent."} // "provide informed assent"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_has_provided_informed_consent
         patient_has_provided_informed_assent)
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must (provide informed consent OR provide informed assent)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age ≥ 12 years"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 12)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (age ≥ 12 years)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_acute_pharyngitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of acute pharyngitis.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of acute pharyngitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of acute pharyngitis.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of acute pharyngitis."} // "have a clinical diagnosis of acute pharyngitis"
(declare-const patient_has_diagnosis_of_acute_tonsillitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of acute tonsillitis.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of acute tonsillitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of acute tonsillitis.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of acute tonsillitis."} // "have a clinical diagnosis of acute tonsillitis"
(declare-const patient_has_symptoms_of_tonsillitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms compatible with tonsillitis.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms compatible with tonsillitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms compatible with tonsillitis.","meaning":"Boolean indicating whether the patient currently has symptoms compatible with tonsillitis."} // "clinical signs and symptoms compatible with tonsillitis"
(declare-const patient_has_symptoms_of_pharyngitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms compatible with pharyngitis.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms compatible with pharyngitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms compatible with pharyngitis.","meaning":"Boolean indicating whether the patient currently has symptoms compatible with pharyngitis."} // "clinical signs and symptoms compatible with pharyngitis"
(declare-const patient_has_finding_of_pain_in_throat_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sore throat.","when_to_set_to_false":"Set to false if the patient currently does not have sore throat.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sore throat.","meaning":"Boolean indicating whether the patient currently has sore throat."} // "sore throat"
(declare-const patient_has_finding_of_red_throat_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pharyngeal erythema.","when_to_set_to_false":"Set to false if the patient currently does not have pharyngeal erythema.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pharyngeal erythema.","meaning":"Boolean indicating whether the patient currently has pharyngeal erythema."} // "pharyngeal erythema"
(declare-const patient_has_finding_of_swallowing_painful_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has odynophagia.","when_to_set_to_false":"Set to false if the patient currently does not have odynophagia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has odynophagia.","meaning":"Boolean indicating whether the patient currently has odynophagia."} // "odynophagia"
(declare-const patient_has_finding_of_exudate_on_tonsils_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tonsillar exudates.","when_to_set_to_false":"Set to false if the patient currently does not have tonsillar exudates.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tonsillar exudates.","meaning":"Boolean indicating whether the patient currently has tonsillar exudates."} // "tonsillar exudates"
(declare-const patient_has_finding_of_exudate_on_pharynx_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pharyngeal exudates.","when_to_set_to_false":"Set to false if the patient currently does not have pharyngeal exudates.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pharyngeal exudates.","meaning":"Boolean indicating whether the patient currently has pharyngeal exudates."} // "pharyngeal exudates"
(declare-const patient_has_finding_of_tender_cervical_lymph_nodes_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tender cervical lymph nodes.","when_to_set_to_false":"Set to false if the patient currently does not have tender cervical lymph nodes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tender cervical lymph nodes.","meaning":"Boolean indicating whether the patient currently has tender cervical lymph nodes."} // "tender cervical lymph nodes"
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fever.","when_to_set_to_false":"Set to false if the patient currently does not have fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fever.","meaning":"Boolean indicating whether the patient currently has fever."} // "fever"
(declare-const patient_has_finding_of_history_of_fever_treated_with_antipyretics_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a history of fever treated with antipyretics.","when_to_set_to_false":"Set to false if the patient currently does not have a history of fever treated with antipyretics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a history of fever treated with antipyretics.","meaning":"Boolean indicating whether the patient currently has a history of fever treated with antipyretics."} // "history of fever treated with antipyretics"
(declare-const patient_has_finding_of_chill_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chills.","when_to_set_to_false":"Set to false if the patient currently does not have chills.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chills.","meaning":"Boolean indicating whether the patient currently has chills."} // "chills"
(declare-const patient_has_finding_of_edema_of_uvula_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has uvular edema.","when_to_set_to_false":"Set to false if the patient currently does not have uvular edema.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has uvular edema.","meaning":"Boolean indicating whether the patient currently has uvular edema."} // "uvular edema"
(declare-const patient_has_finding_of_increased_blood_leukocyte_number_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an elevated white blood cell count.","when_to_set_to_false":"Set to false if the patient currently does not have an elevated white blood cell count.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an elevated white blood cell count.","meaning":"Boolean indicating whether the patient currently has an elevated white blood cell count."} // "elevated white blood cell count"
(declare-const patient_has_finding_of_red_tongue_and_prominent_papillae_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has red tongue and prominent papillae.","when_to_set_to_false":"Set to false if the patient currently does not have red tongue and prominent papillae.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has red tongue and prominent papillae.","meaning":"Boolean indicating whether the patient currently has red tongue and prominent papillae."} // "red tongue and prominent papillae"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition of "clinical diagnosis of acute pharyngitis" as per requirement
(assert
  (! (= patient_has_diagnosis_of_acute_pharyngitis_now
        (and
          (or patient_has_symptoms_of_tonsillitis_now
              patient_has_symptoms_of_pharyngitis_now) ;; "clinical signs and symptoms compatible with tonsillitis OR compatible with pharyngitis"
          patient_has_finding_of_pain_in_throat_now ;; "sore throat"
          patient_has_finding_of_red_throat_now ;; "pharyngeal erythema"
          (or
            patient_has_finding_of_swallowing_painful_now ;; "odynophagia"
            patient_has_finding_of_exudate_on_tonsils_now ;; "tonsillar exudates"
            patient_has_finding_of_exudate_on_pharynx_now ;; "pharyngeal exudates"
            patient_has_finding_of_tender_cervical_lymph_nodes_now ;; "tender cervical lymph nodes"
            patient_has_finding_of_fever_now ;; "fever"
            patient_has_finding_of_history_of_fever_treated_with_antipyretics_now ;; "history of fever treated with antipyretics"
            patient_has_finding_of_chill_now ;; "chills"
            patient_has_finding_of_edema_of_uvula_now ;; "uvular edema"
            patient_has_finding_of_increased_blood_leukocyte_number_now ;; "elevated white blood cell count"
            patient_has_finding_of_red_tongue_and_prominent_papillae_now ;; "red tongue and prominent papillae"
          )
        )
     )
     :named REQ2_AUXILIARY0)) ;; "have a clinical diagnosis of acute pharyngitis defined as ..."

;; ===================== Constraint Assertions (REQ 2) =====================
;; Inclusion: patient must have clinical diagnosis of acute tonsillitis OR clinical diagnosis of acute pharyngitis (as defined above)
(assert
  (! (or patient_has_diagnosis_of_acute_tonsillitis_now
         patient_has_diagnosis_of_acute_pharyngitis_now)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((have a clinical diagnosis of acute tonsillitis) OR (have a clinical diagnosis of acute pharyngitis defined as ...))"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_undergone_rapid_screening_test_for_streptococcus_pyogenes_and_result_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a rapid screening test for Streptococcus pyogenes and the result is positive.","when_to_set_to_false":"Set to false if the patient has undergone a rapid screening test for Streptococcus pyogenes and the result is negative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a rapid screening test for Streptococcus pyogenes and/or the result is positive.","meaning":"Boolean indicating whether the patient has undergone a rapid screening test for Streptococcus pyogenes and the result is positive."} // "a positive rapid screening test for Streptococcus pyogenes"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_undergone_rapid_screening_test_for_streptococcus_pyogenes_and_result_is_positive
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (a positive rapid screening test for Streptococcus pyogenes)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_can_undergo_oral_antibiotic_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently an appropriate candidate and can undergo oral antibiotic therapy.","when_to_set_to_false":"Set to false if the patient is currently not an appropriate candidate or cannot undergo oral antibiotic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo oral antibiotic therapy.","meaning":"Boolean indicating whether the patient can currently undergo oral antibiotic therapy."} // "be an appropriate candidate for oral antibiotic therapy"
(declare-const patient_can_swallow_study_dosage_forms_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to swallow the study dosage forms.","when_to_set_to_false":"Set to false if the patient is currently unable to swallow the study dosage forms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to swallow the study dosage forms.","meaning":"Boolean indicating whether the patient is currently able to swallow the study dosage forms."} // "be able to swallow the study dosage forms"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: patient must be an appropriate candidate for oral antibiotic therapy
(assert
  (! patient_can_undergo_oral_antibiotic_therapy_now
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "be an appropriate candidate for oral antibiotic therapy"

;; Component 1: patient must be able to swallow the study dosage forms
(assert
  (! patient_can_swallow_study_dosage_forms_now
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "be able to swallow the study dosage forms"

;; ===================== Declarations for the inclusion criterion (REQ 5) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current recorded sex is female.","when_to_set_to_false":"Set to false if the patient's current recorded sex is not female.","when_to_set_to_null":"Set to null if the patient's current recorded sex is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient's current recorded sex is female."} // "if the patient is female"
(declare-const patient_has_finding_of_failure_of_lactation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently non-lactating (has failure of lactation).","when_to_set_to_false":"Set to false if the patient is currently lactating.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently non-lactating.","meaning":"Boolean indicating whether the patient is currently non-lactating (has failure of lactation)."} // "be non-lactating"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently not lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient is currently lactating."} // "be non-lactating"
(declare-const patient_has_finding_of_postmenopausal_state_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in a postmenopausal state.","when_to_set_to_false":"Set to false if the patient is currently not in a postmenopausal state.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in a postmenopausal state.","meaning":"Boolean indicating whether the patient is currently in a postmenopausal state."} // "post-menopausal"
(declare-const patient_has_finding_of_postmenopausal_state_now@@present_for_at_least_1_year Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in a postmenopausal state and this state has been present for at least 1 year.","when_to_set_to_false":"Set to false if the patient is currently in a postmenopausal state but this state has not been present for at least 1 year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the postmenopausal state has been present for at least 1 year.","meaning":"Boolean indicating whether the patient's postmenopausal state has been present for at least 1 year."} // "post-menopausal for ≥ 1 year"
(declare-const patient_has_undergone_hysterectomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone hysterectomy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone hysterectomy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone hysterectomy.","meaning":"Boolean indicating whether the patient has undergone hysterectomy at any time in the past."} // "hysterectomy"
(declare-const patient_has_undergone_ligation_of_fallopian_tube_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone tubal ligation (ligation of fallopian tube) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone tubal ligation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone tubal ligation.","meaning":"Boolean indicating whether the patient has undergone tubal ligation (ligation of fallopian tube) at any time in the past."} // "tubal ligation"
(declare-const patient_is_able_to_be_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to become pregnant.","when_to_set_to_false":"Set to false if the patient is currently not able to become pregnant (e.g., due to menopause, hysterectomy, tubal ligation, or other reasons).","when_to_set_to_null":"Set to null if the patient's current ability to become pregnant is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient is currently able to become pregnant."} // "be at no risk of pregnancy"
(declare-const patient_is_abstinent_from_sexual_activity_that_could_result_in_pregnancy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently abstinent from sexual activity that could result in pregnancy.","when_to_set_to_false":"Set to false if the patient is currently not abstinent from sexual activity that could result in pregnancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently abstinent from sexual activity that could result in pregnancy.","meaning":"Boolean indicating whether the patient is currently abstinent from sexual activity that could result in pregnancy."} // "abstinent from sexual activity that could result in pregnancy"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Non-lactating is the logical negation of lactating
(assert
  (! (= patient_has_finding_of_failure_of_lactation_now
        (not patient_is_lactating_now))
     :named REQ5_AUXILIARY0)) ;; "be non-lactating"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_postmenopausal_state_now@@present_for_at_least_1_year
         patient_has_finding_of_postmenopausal_state_now)
     :named REQ5_AUXILIARY1)) ;; "post-menopausal for ≥ 1 year"

;; "No risk of pregnancy" is defined by at least one of the following reasons
(define-fun patient_is_at_no_risk_of_pregnancy_for_permitted_reason_now () Bool
  (or patient_has_finding_of_postmenopausal_state_now@@present_for_at_least_1_year
      patient_has_undergone_hysterectomy_inthehistory
      patient_has_undergone_ligation_of_fallopian_tube_inthehistory
      patient_is_abstinent_from_sexual_activity_that_could_result_in_pregnancy_now)) ;; "at no risk of pregnancy for at least one of the following reasons: post-menopausal for ≥ 1 year OR hysterectomy OR tubal ligation OR abstinent from sexual activity that could result in pregnancy"

;; If any permitted reason is present, patient is not able to be pregnant
(assert
  (! (=> patient_is_at_no_risk_of_pregnancy_for_permitted_reason_now
         (not patient_is_able_to_be_pregnant_now))
     :named REQ5_AUXILIARY2)) ;; "be at no risk of pregnancy for at least one of the following reasons..."

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: If female, must be non-lactating
(assert
  (! (or (not patient_sex_is_female_now)
         patient_has_finding_of_failure_of_lactation_now)
     :named REQ5_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "if the patient is female, the patient must (be non-lactating)"

;; Component 1: If female, must be at no risk of pregnancy for at least one permitted reason
(assert
  (! (or (not patient_sex_is_female_now)
         patient_is_at_no_risk_of_pregnancy_for_permitted_reason_now)
     :named REQ5_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "if the patient is female, the patient must (be at no risk of pregnancy for at least one of the following reasons...)"

;; ===================== Declarations for the inclusion criterion (REQ 6) =====================
(declare-const patient_has_undergone_urine_pregnancy_test_now_outcome_is_negative Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a urine pregnancy test now and the result is negative.","when_to_set_to_false":"Set to false if the patient has undergone a urine pregnancy test now and the result is not negative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a urine pregnancy test now and the result is negative.","meaning":"Boolean indicating whether the patient has undergone a urine pregnancy test now and the result is negative."} // "have a negative baseline urine pregnancy test"
(declare-const patient_has_undergone_urine_pregnancy_test_now_outcome_is_negative@@performed_at_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the urine pregnancy test was performed at baseline.","when_to_set_to_false":"Set to false if the urine pregnancy test was not performed at baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the urine pregnancy test was performed at baseline.","meaning":"Boolean indicating whether the urine pregnancy test was performed at baseline."} // "baseline urine pregnancy test"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as determined by a baseline urine pregnancy test.","when_to_set_to_false":"Set to false if the patient is not currently pregnant as determined by a baseline urine pregnancy test.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined by a baseline urine pregnancy test.","meaning":"Indicates whether the patient is currently pregnant."} // "have a negative baseline urine pregnancy test"
(declare-const patient_is_utilizing_acceptable_contraceptives_throughout_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient is utilizing acceptable contraceptives throughout the study.","when_to_set_to_false":"Set to false if the patient is not utilizing acceptable contraceptives throughout the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is utilizing acceptable contraceptives throughout the study.","meaning":"Boolean indicating whether the patient is utilizing acceptable contraceptives throughout the study."} // "be utilizing acceptable contraceptives throughout the study"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable for baseline urine pregnancy test implies the test was performed and was negative
(assert
  (! (=> patient_has_undergone_urine_pregnancy_test_now_outcome_is_negative@@performed_at_baseline
         patient_has_undergone_urine_pregnancy_test_now_outcome_is_negative)
     :named REQ6_AUXILIARY0)) ;; "baseline urine pregnancy test"

;; Negative baseline urine pregnancy test implies not currently pregnant
(assert
  (! (=> patient_has_undergone_urine_pregnancy_test_now_outcome_is_negative@@performed_at_baseline
         (not patient_is_pregnant_now))
     :named REQ6_AUXILIARY1)) ;; "have a negative baseline urine pregnancy test"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: If the patient is female AND of child-bearing potential AND sexually active, must have a negative baseline urine pregnancy test
(assert
  (! (=> (and patient_sex_is_female_now
              patient_is_able_to_be_pregnant_now
              (not patient_is_abstinent_from_sexual_activity_that_could_result_in_pregnancy_now))
         patient_has_undergone_urine_pregnancy_test_now_outcome_is_negative@@performed_at_baseline)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient is female AND of child-bearing potential AND sexually active, the patient must have a negative baseline urine pregnancy test"

;; Component 1: If the patient is female AND of child-bearing potential AND sexually active, must be utilizing acceptable contraceptives throughout the study
(assert
  (! (=> (and patient_sex_is_female_now
              patient_is_able_to_be_pregnant_now
              (not patient_is_abstinent_from_sexual_activity_that_could_result_in_pregnancy_now))
         patient_is_utilizing_acceptable_contraceptives_throughout_study)
     :named REQ6_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is female AND of child-bearing potential AND sexually active, the patient must be utilizing acceptable contraceptives throughout the study"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_agrees_to_remain_abstinent_for_duration_of_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to remain abstinent from sexual activity that could result in pregnancy for the entire duration of the study.","when_to_set_to_false":"Set to false if the patient does not agree to remain abstinent from sexual activity that could result in pregnancy for the entire duration of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to remain abstinent for the duration of the study.","meaning":"Boolean indicating whether the patient agrees to remain abstinent from sexual activity that could result in pregnancy for the entire duration of the study."} // "agree to remain abstinent for the duration of the study"
(declare-const patient_agrees_to_use_acceptable_contraception_if_becomes_sexually_active_during_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to use acceptable contraception if the patient decides to become sexually active during the period of the study.","when_to_set_to_false":"Set to false if the patient does not agree to use acceptable contraception if the patient decides to become sexually active during the period of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to use acceptable contraception if the patient decides to become sexually active during the period of the study.","meaning":"Boolean indicating whether the patient agrees to use acceptable contraception if the patient decides to become sexually active during the period of the study."} // "agree to use acceptable contraception if becomes sexually active during the study period"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: If the patient is female AND of child-bearing potential AND NOT currently sexually active, the patient must have a negative baseline urine pregnancy test.
(assert
  (! (=> (and patient_sex_is_female_now
              patient_is_able_to_be_pregnant_now
              (not patient_is_abstinent_from_sexual_activity_that_could_result_in_pregnancy_now))
         patient_has_undergone_urine_pregnancy_test_now_outcome_is_negative@@performed_at_baseline)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient is female AND of child-bearing potential AND NOT currently sexually active, the patient must have a negative baseline urine pregnancy test"

;; Component 1: If the patient is female AND of child-bearing potential AND NOT currently sexually active, the patient must agree to remain abstinent for the duration of the study.
(assert
  (! (=> (and patient_sex_is_female_now
              patient_is_able_to_be_pregnant_now
              (not patient_is_abstinent_from_sexual_activity_that_could_result_in_pregnancy_now))
         patient_agrees_to_remain_abstinent_for_duration_of_study)
     :named REQ7_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is female AND of child-bearing potential AND NOT currently sexually active, the patient must agree to remain abstinent for the duration of the study"

;; Component 2: If the patient is female AND of child-bearing potential AND NOT currently sexually active, and if the patient decides to become sexually active during the period of the study, the patient must agree to use acceptable contraception.
(assert
  (! (=> (and patient_sex_is_female_now
              patient_is_able_to_be_pregnant_now
              (not patient_is_abstinent_from_sexual_activity_that_could_result_in_pregnancy_now))
         patient_agrees_to_use_acceptable_contraception_if_becomes_sexually_active_during_study_period)
     :named REQ7_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is female AND of child-bearing potential AND NOT currently sexually active, if the patient decides to become sexually active during the period of the study, agree to use acceptable contraception"

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_is_able_to_comply_with_protocol_requirements Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to comply with all requirements specified in the study protocol.","when_to_set_to_false":"Set to false if the patient is not able to comply with all requirements specified in the study protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to comply with all requirements specified in the study protocol.","meaning":"Boolean indicating whether the patient is able to comply with all requirements specified in the study protocol."} // "be able to comply with the requirements of the protocol"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! patient_is_able_to_comply_with_protocol_requirements
     :named REQ8_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "be able to comply with the requirements of the protocol"
