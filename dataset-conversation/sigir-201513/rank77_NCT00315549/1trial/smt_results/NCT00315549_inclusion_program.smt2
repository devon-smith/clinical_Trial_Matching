;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "age ≥ 13 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 13.0)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (age ≥ 13 years)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the biological potential to bear children (i.e., is postmenarchal and not surgically incapable of bearing children).","when_to_set_to_false":"Set to false if the patient is premenarchal or surgically incapable of bearing children (e.g., due to hysterectomy, oophorectomy, or other procedures).","when_to_set_to_null":"Set to null if the patient's childbearing potential at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has the potential to bear children."} ;; "premenarchal OR surgically incapable of bearing children"
(declare-const patient_is_premenarchal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently premenarchal (has not yet experienced menarche).","when_to_set_to_false":"Set to false if the patient is currently postmenarchal (has experienced menarche).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently premenarchal.","meaning":"Boolean indicating whether the patient is currently premenarchal (has not yet experienced menarche)."} ;; "premenarchal"
(declare-const patient_is_surgically_incapable_of_bearing_children_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently surgically incapable of bearing children (e.g., due to hysterectomy, oophorectomy, or other procedures).","when_to_set_to_false":"Set to false if the patient is currently not surgically incapable of bearing children.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently surgically incapable of bearing children.","meaning":"Boolean indicating whether the patient is currently surgically incapable of bearing children (e.g., due to hysterectomy, oophorectomy, or other procedures)."} ;; "surgically incapable of bearing children"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (male or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."} ;; "if the patient is female"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: patient has childbearing potential if NOT (premenarchal OR surgically incapable of bearing children)
(assert
  (! (= patient_has_childbearing_potential_now
        (not (or patient_is_premenarchal_now patient_is_surgically_incapable_of_bearing_children_now)))
     :named REQ1_AUXILIARY0)) ;; "premenarchal OR surgically incapable of bearing children"

;; ===================== Constraint Assertions (REQ 1) =====================
;; If the patient is female, she must be premenarchal OR surgically incapable of bearing children
(assert
  (! (or (not patient_sex_is_female_now)
         (or patient_is_premenarchal_now patient_is_surgically_incapable_of_bearing_children_now))
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "if the patient is female, the patient must be (premenarchal) OR (surgically incapable of bearing children)"

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_normal_period_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has normal menstrual flow (normal period).","when_to_set_to_false":"Set to false if the patient currently does not have normal menstrual flow (normal period).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has normal menstrual flow (normal period).","meaning":"Boolean indicating whether the patient currently has normal menstrual flow (normal period)."} ;; "have normal menstrual flow within 1 month before study entry"
(declare-const patient_has_negative_urine_pregnancy_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a negative urine pregnancy test result.","when_to_set_to_false":"Set to false if the patient currently does not have a negative urine pregnancy test result.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a negative urine pregnancy test result.","meaning":"Boolean indicating whether the patient currently has a negative urine pregnancy test result."} ;; "have a negative pregnancy test (urine pregnancy test sensitive to at least 50 milli-international units per milliliter)"
(declare-const patient_has_negative_urine_pregnancy_test_now@@test_is_sensitive_to_at_least_50_milli_international_units_per_milliliter Bool) ;; {"when_to_set_to_true":"Set to true if the negative urine pregnancy test result is from a test sensitive to at least 50 milli-international units per milliliter.","when_to_set_to_false":"Set to false if the negative urine pregnancy test result is from a test not sensitive to at least 50 milli-international units per milliliter.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the urine pregnancy test is sensitive to at least 50 milli-international units per milliliter.","meaning":"Boolean indicating whether the negative urine pregnancy test result is from a test sensitive to at least 50 milli-international units per milliliter."} ;; "urine pregnancy test sensitive to at least 50 milli-international units per milliliter"
(declare-const patient_is_sexually_active_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently sexually active.","when_to_set_to_false":"Set to false if the patient is currently not sexually active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently sexually active.","meaning":"Boolean indicating whether the patient is currently sexually active."} ;; "if sexually active"
(declare-const patient_has_finding_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using an accepted method of contraception.","when_to_set_to_false":"Set to false if the patient is currently not using an accepted method of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using an accepted method of contraception.","meaning":"Boolean indicating whether the patient is currently using an accepted method of contraception."} ;; "agree to use an accepted method of contraception throughout the study"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for pregnancy test sensitivity implies the stem variable
(assert
  (! (=> patient_has_negative_urine_pregnancy_test_now@@test_is_sensitive_to_at_least_50_milli_international_units_per_milliliter
         patient_has_negative_urine_pregnancy_test_now)
     :named REQ2_AUXILIARY0)) ;; "urine pregnancy test sensitive to at least 50 milli-international units per milliliter" implies "negative urine pregnancy test"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: If female and of childbearing potential, must have normal menstrual flow within 1 month before study entry
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         patient_has_finding_of_normal_period_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient is female AND the patient is of childbearing potential, the patient must have normal menstrual flow within 1 month before study entry"

;; Component 1: If female and of childbearing potential, must have a negative pregnancy test (urine pregnancy test sensitive to at least 50 mIU/mL)
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         patient_has_negative_urine_pregnancy_test_now@@test_is_sensitive_to_at_least_50_milli_international_units_per_milliliter)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "if the patient is female AND the patient is of childbearing potential, the patient must have a negative pregnancy test (urine pregnancy test sensitive to at least 50 milli-international units per milliliter)"

;; Component 2: If female, of childbearing potential, and sexually active, must agree to use an accepted method of contraception throughout the study
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now patient_is_sexually_active_now))
         patient_has_finding_of_contraception_now)
     :named REQ2_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if sexually active, agree to use an accepted method of contraception throughout the study"

;; ===================== Declarations for the inclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_acute_tonsillitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of acute tonsillitis.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of acute tonsillitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of acute tonsillitis.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of acute tonsillitis."} ;; "a clinical diagnosis of acute tonsillitis"
(declare-const patient_has_diagnosis_of_acute_tonsillitis_now@@caused_by_streptococcus_pyogenes Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current clinical diagnosis of acute tonsillitis is caused by Streptococcus pyogenes.","when_to_set_to_false":"Set to false if the patient's current clinical diagnosis of acute tonsillitis is not caused by Streptococcus pyogenes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the acute tonsillitis is caused by Streptococcus pyogenes.","meaning":"Boolean indicating whether the patient's current clinical diagnosis of acute tonsillitis is caused by Streptococcus pyogenes."} ;; "a clinical diagnosis of acute tonsillitis caused by Streptococcus pyogenes"
(declare-const patient_has_diagnosis_of_streptococcal_sore_throat_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of streptococcal sore throat (acute pharyngitis caused by Streptococcus pyogenes).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of streptococcal sore throat (acute pharyngitis caused by Streptococcus pyogenes).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of streptococcal sore throat (acute pharyngitis caused by Streptococcus pyogenes).","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of streptococcal sore throat (acute pharyngitis caused by Streptococcus pyogenes)."} ;; "a clinical diagnosis of acute pharyngitis caused by Streptococcus pyogenes"
(declare-const patient_has_undergone_microbial_identification_kit_rapid_strep_method_now_outcome_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently undergone a rapid detection test for Group A streptococcal antigen and the result is positive.","when_to_set_to_false":"Set to false if the patient has currently undergone the test and the result is not positive, or if the test was not performed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone the test and the result is positive.","meaning":"Boolean indicating whether the patient has currently undergone a rapid detection test for Group A streptococcal antigen and the outcome is positive."} ;; "a positive result from a rapid detection test for Group A streptococcal antigen"
(declare-const patient_has_undergone_bacterial_culture_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently undergone bacterial culture.","when_to_set_to_false":"Set to false if the patient has not currently undergone bacterial culture.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has currently undergone bacterial culture.","meaning":"Boolean indicating whether the patient has currently undergone bacterial culture."} ;; "bacterial culture"
(declare-const patient_has_undergone_bacterial_culture_now@@performed_on_throat_swab_specimen_for_culture_identification_and_antibiotic_susceptibility_testing Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current bacterial culture was performed on a throat swab specimen for bacterial culture, identification, and antibiotic-susceptibility testing.","when_to_set_to_false":"Set to false if the patient's current bacterial culture was not performed on a throat swab specimen for these purposes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the bacterial culture was performed on a throat swab specimen for these purposes.","meaning":"Boolean indicating whether the patient's current bacterial culture was performed on a throat swab specimen for bacterial culture, identification, and antibiotic-susceptibility testing."} ;; "submission of a throat swab specimen for bacterial culture, identification, and antibiotic-susceptibility testing"
(declare-const patient_has_undergone_antimicrobial_susceptibility_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently undergone antibiotic-susceptibility testing.","when_to_set_to_false":"Set to false if the patient has not currently undergone antibiotic-susceptibility testing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has currently undergone antibiotic-susceptibility testing.","meaning":"Boolean indicating whether the patient has currently undergone antibiotic-susceptibility testing."} ;; "antibiotic-susceptibility testing"
(declare-const patient_has_undergone_antimicrobial_susceptibility_test_now@@performed_on_throat_swab_specimen_for_culture_identification_and_antibiotic_susceptibility_testing Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current antibiotic-susceptibility testing was performed on a throat swab specimen for bacterial culture, identification, and antibiotic-susceptibility testing.","when_to_set_to_false":"Set to false if the patient's current antibiotic-susceptibility testing was not performed on a throat swab specimen for these purposes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antibiotic-susceptibility testing was performed on a throat swab specimen for these purposes.","meaning":"Boolean indicating whether the patient's current antibiotic-susceptibility testing was performed on a throat swab specimen for bacterial culture, identification, and antibiotic-susceptibility testing."} ;; "submission of a throat swab specimen for bacterial culture, identification, and antibiotic-susceptibility testing"
(declare-const patient_has_undergone_microbial_identification_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently undergone a microbial identification procedure.","when_to_set_to_false":"Set to false if the patient has not currently undergone a microbial identification procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has currently undergone a microbial identification procedure.","meaning":"Boolean indicating whether the patient has currently undergone a microbial identification procedure."} ;; "identification"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable for tonsillitis implies stem variable
(assert
  (! (=> patient_has_diagnosis_of_acute_tonsillitis_now@@caused_by_streptococcus_pyogenes
         patient_has_diagnosis_of_acute_tonsillitis_now)
     :named REQ3_AUXILIARY0)) ;; "a clinical diagnosis of acute tonsillitis caused by Streptococcus pyogenes"

;; Qualifier variable for bacterial culture implies stem variable
(assert
  (! (=> patient_has_undergone_bacterial_culture_now@@performed_on_throat_swab_specimen_for_culture_identification_and_antibiotic_susceptibility_testing
         patient_has_undergone_bacterial_culture_now)
     :named REQ3_AUXILIARY1)) ;; "bacterial culture performed on throat swab specimen for culture, identification, and antibiotic-susceptibility testing"

;; Qualifier variable for antimicrobial susceptibility test implies stem variable
(assert
  (! (=> patient_has_undergone_antimicrobial_susceptibility_test_now@@performed_on_throat_swab_specimen_for_culture_identification_and_antibiotic_susceptibility_testing
         patient_has_undergone_antimicrobial_susceptibility_test_now)
     :named REQ3_AUXILIARY2)) ;; "antibiotic-susceptibility testing performed on throat swab specimen for culture, identification, and antibiotic-susceptibility testing"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: ((a clinical diagnosis of acute tonsillitis caused by Streptococcus pyogenes) OR (a clinical diagnosis of acute pharyngitis caused by Streptococcus pyogenes))
(assert
  (! (or patient_has_diagnosis_of_acute_tonsillitis_now@@caused_by_streptococcus_pyogenes
         patient_has_diagnosis_of_streptococcal_sore_throat_now)
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "((a clinical diagnosis of acute tonsillitis caused by Streptococcus pyogenes) OR (a clinical diagnosis of acute pharyngitis caused by Streptococcus pyogenes))"

;; Component 1: a positive result from a rapid detection test for Group A streptococcal antigen
(assert
  (! patient_has_undergone_microbial_identification_kit_rapid_strep_method_now_outcome_is_positive
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "a positive result from a rapid detection test for Group A streptococcal antigen"

;; Component 2: submission of a throat swab specimen for bacterial culture, identification, and antibiotic-susceptibility testing
(assert
  (! (and patient_has_undergone_bacterial_culture_now@@performed_on_throat_swab_specimen_for_culture_identification_and_antibiotic_susceptibility_testing
         patient_has_undergone_antimicrobial_susceptibility_test_now@@performed_on_throat_swab_specimen_for_culture_identification_and_antibiotic_susceptibility_testing)
     :named REQ3_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "submission of a throat swab specimen for bacterial culture, identification, and antibiotic-susceptibility testing"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_sore_throat_symptom_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a sore throat symptom.","when_to_set_to_false":"Set to false if the patient currently does not have a sore throat symptom.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a sore throat symptom.","meaning":"Boolean indicating whether the patient currently has a sore throat symptom."} ;; "a sore throat"
(declare-const patient_has_finding_of_scratchy_throat_symptom_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a scratchy throat symptom.","when_to_set_to_false":"Set to false if the patient currently does not have a scratchy throat symptom.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a scratchy throat symptom.","meaning":"Boolean indicating whether the patient currently has a scratchy throat symptom."} ;; "a scratchy throat"
(declare-const patient_has_finding_of_swallowing_painful_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has painful swallowing (odynophagia).","when_to_set_to_false":"Set to false if the patient currently does not have painful swallowing (odynophagia).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has painful swallowing (odynophagia).","meaning":"Boolean indicating whether the patient currently has painful swallowing (odynophagia)."} ;; "odynophagia"
(declare-const patient_has_finding_of_erythema_of_tonsils_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has erythema of the tonsils.","when_to_set_to_false":"Set to false if the patient currently does not have erythema of the tonsils.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has erythema of the tonsils.","meaning":"Boolean indicating whether the patient currently has erythema of the tonsils."} ;; "tonsil erythema"
(declare-const patient_has_finding_of_exudate_on_tonsils_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has exudate on the tonsils.","when_to_set_to_false":"Set to false if the patient currently does not have exudate on the tonsils.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has exudate on the tonsils.","meaning":"Boolean indicating whether the patient currently has exudate on the tonsils."} ;; "tonsil exudate"
(declare-const patient_has_finding_of_red_throat_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pharyngeal erythema (red throat).","when_to_set_to_false":"Set to false if the patient currently does not have pharyngeal erythema (red throat).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pharyngeal erythema (red throat).","meaning":"Boolean indicating whether the patient currently has pharyngeal erythema (red throat)."} ;; "pharyngeal erythema"
(declare-const patient_has_finding_of_exudate_on_pharynx_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has exudate on the pharynx.","when_to_set_to_false":"Set to false if the patient currently does not have exudate on the pharynx.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has exudate on the pharynx.","meaning":"Boolean indicating whether the patient currently has exudate on the pharynx."} ;; "pharyngeal exudate"
(declare-const patient_has_finding_of_cervical_lymphadenopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cervical lymphadenopathy.","when_to_set_to_false":"Set to false if the patient currently does not have cervical lymphadenopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cervical lymphadenopathy.","meaning":"Boolean indicating whether the patient currently has cervical lymphadenopathy."} ;; "cervical adenopathy"
(declare-const patient_has_finding_of_edema_of_uvula_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has edema of the uvula.","when_to_set_to_false":"Set to false if the patient currently does not have edema of the uvula.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has edema of the uvula.","meaning":"Boolean indicating whether the patient currently has edema of the uvula."} ;; "uvular edema"
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fever.","when_to_set_to_false":"Set to false if the patient currently does not have fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fever.","meaning":"Boolean indicating whether the patient currently has fever."} ;; "fever"
(declare-const patient_has_finding_of_number_of_clinical_signs_now_withunit_count Int) ;; {"when_to_set_to_value":"Set to the number of the specified clinical signs present now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many of the specified clinical signs are present now.","meaning":"Numeric value indicating the number of the specified clinical signs present now. Unit is count."} ;; "at least 2 of the following clinical signs"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition of number of clinical signs present now
(assert
  (! (= patient_has_finding_of_number_of_clinical_signs_now_withunit_count
        (+ (ite patient_has_finding_of_erythema_of_tonsils_now 1 0)
           (ite patient_has_finding_of_exudate_on_tonsils_now 1 0)
           (ite patient_has_finding_of_red_throat_now 1 0)
           (ite patient_has_finding_of_exudate_on_pharynx_now 1 0)
           (ite patient_has_finding_of_cervical_lymphadenopathy_now 1 0)
           (ite patient_has_finding_of_edema_of_uvula_now 1 0)
           (ite patient_has_finding_of_fever_now 1 0)))
     :named REQ4_AUXILIARY0)) ;; "at least 2 of the following clinical signs: tonsil erythema, tonsil exudate, pharyngeal erythema, pharyngeal exudate, cervical adenopathy, uvular edema, fever"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: "To be included, the patient must have a sore throat."
(assert
  (! patient_has_finding_of_sore_throat_symptom_now
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "a sore throat"

;; Component 1: "To be included, the patient must have (a scratchy throat) OR (odynophagia)."
(assert
  (! (or patient_has_finding_of_scratchy_throat_symptom_now
         patient_has_finding_of_swallowing_painful_now)
     :named REQ4_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "(a scratchy throat) OR (odynophagia)"

;; Component 2: "To be included, the patient must have at least 2 of the following clinical signs: (tonsil erythema) OR (tonsil exudate) OR (pharyngeal erythema) OR (pharyngeal exudate) OR (cervical adenopathy) OR (uvular edema) OR (fever)."
(assert
  (! (>= patient_has_finding_of_number_of_clinical_signs_now_withunit_count 2)
     :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "at least 2 of the following clinical signs: tonsil erythema, tonsil exudate, pharyngeal erythema, pharyngeal exudate, cervical adenopathy, uvular edema, fever"
