;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_given_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has given informed consent.","when_to_set_to_false":"Set to false if the patient has not given informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has given informed consent.","meaning":"Boolean indicating whether the patient has given informed consent."} // "To be included, the patient must give informed consent."
(declare-const patient_has_given_assent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has given assent.","when_to_set_to_false":"Set to false if the patient has not given assent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has given assent.","meaning":"Boolean indicating whether the patient has given assent."} // "To be included, the patient must give assent."
(declare-const patient_has_given_patient_authorization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has given patient authorization.","when_to_set_to_false":"Set to false if the patient has not given patient authorization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has given patient authorization.","meaning":"Boolean indicating whether the patient has given patient authorization."} // "To be included, the patient must give patient authorization."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_given_informed_consent
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must give informed consent."
(assert
  (! patient_has_given_assent
     :named REQ0_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must give assent."
(assert
  (! patient_has_given_patient_authorization
     :named REQ0_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must give patient authorization."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "To be included, the patient must be aged ≥ 12 years."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 12.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 12 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_acute_pharyngitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of acute pharyngitis.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of acute pharyngitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of acute pharyngitis.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of acute pharyngitis."} // "have a clinical diagnosis of acute pharyngitis"
(declare-const patient_has_diagnosis_of_acute_tonsillitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of acute tonsillitis.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of acute tonsillitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of acute tonsillitis.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of acute tonsillitis."} // "have a clinical diagnosis of acute tonsillitis"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (or patient_has_diagnosis_of_acute_pharyngitis_now
         patient_has_diagnosis_of_acute_tonsillitis_now)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must (have a clinical diagnosis of acute pharyngitis) OR (have a clinical diagnosis of acute tonsillitis)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patients_streptococcus_pyogenes_antigen_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive Streptococcus pyogenes antigen test result.","when_to_set_to_false":"Set to false if the patient currently has a negative Streptococcus pyogenes antigen test result.","when_to_set_to_null":"Set to null if the Streptococcus pyogenes antigen test result is unknown, not documented, or cannot be determined for the patient at the current time.","meaning":"Boolean indicating whether the patient currently has a positive Streptococcus pyogenes antigen test result."} // "To be included, the patient must have a positive rapid Streptococcus pyogenes antigen test."
(declare-const patients_streptococcus_pyogenes_antigen_is_positive_now@@detected_by_rapid_antigen_test Bool) ;; {"when_to_set_to_true":"Set to true if the positive Streptococcus pyogenes antigen test result was detected by a rapid antigen test.","when_to_set_to_false":"Set to false if the positive Streptococcus pyogenes antigen test result was not detected by a rapid antigen test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the positive Streptococcus pyogenes antigen test result was detected by a rapid antigen test.","meaning":"Boolean indicating whether the positive Streptococcus pyogenes antigen test result was detected by a rapid antigen test."} // "To be included, the patient must have a positive rapid Streptococcus pyogenes antigen test."

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patients_streptococcus_pyogenes_antigen_is_positive_now@@detected_by_rapid_antigen_test
         patients_streptococcus_pyogenes_antigen_is_positive_now)
     :named REQ3_AUXILIARY0)) ;; "positive rapid Streptococcus pyogenes antigen test" means positive Streptococcus pyogenes antigen test detected by rapid antigen test

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patients_streptococcus_pyogenes_antigen_is_positive_now@@detected_by_rapid_antigen_test
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a positive rapid Streptococcus pyogenes antigen test."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_can_undergo_product_manufactured_as_oral_dose_form_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to swallow products manufactured as oral dose forms.","when_to_set_to_false":"Set to false if the patient is currently unable to swallow products manufactured as oral dose forms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to swallow products manufactured as oral dose forms.","meaning":"Boolean indicating whether the patient is currently able to swallow products manufactured as oral dose forms."} // "To be included, the patient must be able to swallow oral study dosage forms."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_can_undergo_product_manufactured_as_oral_dose_form_now
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be able to swallow oral study dosage forms."

;; ===================== Declarations for the inclusion criterion (REQ 5) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."} // "the patient is female"
(declare-const patient_is_sexually_active_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently sexually active as determined by clinical assessment or self-report.","when_to_set_to_false":"Set to false if the patient is currently not sexually active as determined by clinical assessment or self-report.","when_to_set_to_null":"Set to null if the patient's current sexual activity status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently sexually active."} // "the patient is sexually active"
(declare-const urine_pregnancy_test_result_value_recorded_now_withunit_binary Real) ;; {"when_to_set_to_value":"Set to 0 if the urine pregnancy test result is negative at the current time; set to 1 if the result is positive at the current time.","when_to_set_to_null":"Set to null if the urine pregnancy test result at the current time is unknown, not documented, or cannot be determined.","meaning":"Binary value indicating the result of the patient's urine pregnancy test at the current time, where 0 is negative and 1 is positive."} // "the patient must have a negative urine pregnancy test"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as determined by clinical assessment or test.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as determined by clinical assessment or test.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} // "the patient must have a negative urine pregnancy test"
(declare-const patient_has_finding_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using any form of contraception.","when_to_set_to_false":"Set to false if the patient is currently not using any form of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using contraception.","meaning":"Boolean indicating whether the patient is currently using contraception."} // "birth control"
(declare-const patient_has_finding_of_contraception_now@@acceptable Bool) ;; {"when_to_set_to_true":"Set to true if the contraception being used by the patient is considered acceptable according to study criteria.","when_to_set_to_false":"Set to false if the contraception being used by the patient is not considered acceptable according to study criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the contraception being used by the patient is acceptable.","meaning":"Boolean indicating whether the contraception being used by the patient is acceptable."} // "acceptable birth control"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Pregnancy status is defined by urine pregnancy test result
(assert
  (! (= patient_is_pregnant_now
        (= urine_pregnancy_test_result_value_recorded_now_withunit_binary 1))
     :named REQ5_AUXILIARY0)) ;; "the patient must have a negative urine pregnancy test"

;; Acceptable contraception implies contraception
(assert
  (! (=> patient_has_finding_of_contraception_now@@acceptable
         patient_has_finding_of_contraception_now)
     :named REQ5_AUXILIARY1)) ;; "acceptable birth control" implies "birth control"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: If female and sexually active, must have a negative urine pregnancy test
(assert
  (! (or (not (and patient_sex_is_female_now patient_is_sexually_active_now))
         (not patient_is_pregnant_now))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if (the patient is female) AND (the patient is sexually active), then (the patient must have a negative urine pregnancy test)"

;; Component 1: If female and sexually active, must be using acceptable birth control
(assert
  (! (or (not (and patient_sex_is_female_now patient_is_sexually_active_now))
         patient_has_finding_of_contraception_now@@acceptable)
     :named REQ5_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if (the patient is female) AND (the patient is sexually active), then (the patient must be using acceptable birth control)"
