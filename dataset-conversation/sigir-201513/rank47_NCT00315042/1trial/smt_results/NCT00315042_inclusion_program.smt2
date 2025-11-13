;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's current age in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in months."} // "aged ≥ 6 months AND aged < 13 years"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 6 months AND aged < 13 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_months 6.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 6 months."
(assert
  (! (< patient_age_value_recorded_now_in_years 13.0)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged < 13 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_acute_tonsillitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of acute tonsillitis.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of acute tonsillitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of acute tonsillitis.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of acute tonsillitis."} // "a clinical diagnosis of acute tonsillitis"
(declare-const patient_has_diagnosis_of_acute_tonsillitis_now@@caused_by_streptococcus_pyogenes Bool) ;; {"when_to_set_to_true":"Set to true if the patient's acute tonsillitis diagnosis is caused by Streptococcus pyogenes.","when_to_set_to_false":"Set to false if the patient's acute tonsillitis diagnosis is not caused by Streptococcus pyogenes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether Streptococcus pyogenes is the cause of the patient's acute tonsillitis diagnosis.","meaning":"Boolean indicating whether the patient's acute tonsillitis diagnosis is caused by Streptococcus pyogenes."} // "caused by Streptococcus pyogenes"
(declare-const patient_has_diagnosis_of_streptococcal_sore_throat_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of streptococcal sore throat (pharyngitis).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of streptococcal sore throat (pharyngitis).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of streptococcal sore throat (pharyngitis).","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of streptococcal sore throat (pharyngitis)."} // "a clinical diagnosis of pharyngitis"
(declare-const patient_has_diagnosis_of_streptococcal_sore_throat_now@@caused_by_streptococcus_pyogenes Bool) ;; {"when_to_set_to_true":"Set to true if the patient's streptococcal sore throat (pharyngitis) diagnosis is caused by Streptococcus pyogenes.","when_to_set_to_false":"Set to false if the patient's streptococcal sore throat (pharyngitis) diagnosis is not caused by Streptococcus pyogenes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether Streptococcus pyogenes is the cause of the patient's streptococcal sore throat (pharyngitis) diagnosis.","meaning":"Boolean indicating whether the patient's streptococcal sore throat (pharyngitis) diagnosis is caused by Streptococcus pyogenes."} // "caused by Streptococcus pyogenes"
(declare-const patient_has_undergone_rapid_detection_throat_swab_test_for_group_a_streptococcal_antigen_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a rapid detection throat swab test for Group A streptococcal antigen now.","when_to_set_to_false":"Set to false if the patient has not undergone a rapid detection throat swab test for Group A streptococcal antigen now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a rapid detection throat swab test for Group A streptococcal antigen now.","meaning":"Boolean indicating whether the patient has undergone a rapid detection throat swab test for Group A streptococcal antigen now."} // "undergone rapid detection throat swab test for Group A streptococcal antigen"
(declare-const patient_has_undergone_rapid_detection_throat_swab_test_for_group_a_streptococcal_antigen_now@@result_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if the result of the rapid detection throat swab test for Group A streptococcal antigen is positive.","when_to_set_to_false":"Set to false if the result of the rapid detection throat swab test for Group A streptococcal antigen is not positive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the result of the rapid detection throat swab test for Group A streptococcal antigen is positive.","meaning":"Boolean indicating whether the result of the rapid detection throat swab test for Group A streptococcal antigen is positive."} // "positive result from a rapid detection throat swab test for Group A streptococcal antigen"
(declare-const patient_has_undergone_bacterial_culture_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone bacterial culture now.","when_to_set_to_false":"Set to false if the patient has not undergone bacterial culture now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone bacterial culture now.","meaning":"Boolean indicating whether the patient has undergone bacterial culture now."} // "bacterial culture"
(declare-const patient_has_undergone_bacterial_culture_now@@performed_on_throat_swab_specimen Bool) ;; {"when_to_set_to_true":"Set to true if the patient's bacterial culture procedure was performed on a throat swab specimen.","when_to_set_to_false":"Set to false if the patient's bacterial culture procedure was not performed on a throat swab specimen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the bacterial culture procedure was performed on a throat swab specimen.","meaning":"Boolean indicating whether the patient's bacterial culture procedure was performed on a throat swab specimen."} // "performed on throat swab specimen"
(declare-const patient_has_undergone_identification_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone identification (microbiological identification) now.","when_to_set_to_false":"Set to false if the patient has not undergone identification (microbiological identification) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone identification (microbiological identification) now.","meaning":"Boolean indicating whether the patient has undergone identification (microbiological identification) now."} // "identification"
(declare-const patient_has_undergone_identification_now@@performed_on_throat_swab_specimen Bool) ;; {"when_to_set_to_true":"Set to true if the identification (microbiological identification) was performed on a throat swab specimen.","when_to_set_to_false":"Set to false if the identification (microbiological identification) was not performed on a throat swab specimen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the identification (microbiological identification) was performed on a throat swab specimen.","meaning":"Boolean indicating whether the identification (microbiological identification) was performed on a throat swab specimen."} // "performed on throat swab specimen"
(declare-const patient_has_undergone_antimicrobial_susceptibility_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone antibiotic-susceptibility testing now.","when_to_set_to_false":"Set to false if the patient has not undergone antibiotic-susceptibility testing now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone antibiotic-susceptibility testing now.","meaning":"Boolean indicating whether the patient has undergone antibiotic-susceptibility testing now."} // "antibiotic-susceptibility testing"
(declare-const patient_has_undergone_antimicrobial_susceptibility_test_now@@performed_on_throat_swab_specimen Bool) ;; {"when_to_set_to_true":"Set to true if the patient's antibiotic-susceptibility testing procedure was performed on a throat swab specimen.","when_to_set_to_false":"Set to false if the patient's antibiotic-susceptibility testing procedure was not performed on a throat swab specimen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antibiotic-susceptibility testing procedure was performed on a throat swab specimen.","meaning":"Boolean indicating whether the patient's antibiotic-susceptibility testing procedure was performed on a throat swab specimen."} // "performed on throat swab specimen"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_acute_tonsillitis_now@@caused_by_streptococcus_pyogenes
         patient_has_diagnosis_of_acute_tonsillitis_now)
     :named REQ1_AUXILIARY0)) ;; "a clinical diagnosis of acute tonsillitis caused by Streptococcus pyogenes"

(assert
  (! (=> patient_has_diagnosis_of_streptococcal_sore_throat_now@@caused_by_streptococcus_pyogenes
         patient_has_diagnosis_of_streptococcal_sore_throat_now)
     :named REQ1_AUXILIARY1)) ;; "a clinical diagnosis of pharyngitis caused by Streptococcus pyogenes"

(assert
  (! (=> patient_has_undergone_rapid_detection_throat_swab_test_for_group_a_streptococcal_antigen_now@@result_is_positive
         patient_has_undergone_rapid_detection_throat_swab_test_for_group_a_streptococcal_antigen_now)
     :named REQ1_AUXILIARY2)) ;; "positive result from a rapid detection throat swab test for Group A streptococcal antigen"

(assert
  (! (=> patient_has_undergone_bacterial_culture_now@@performed_on_throat_swab_specimen
         patient_has_undergone_bacterial_culture_now)
     :named REQ1_AUXILIARY3)) ;; "bacterial culture performed on throat swab specimen"

(assert
  (! (=> patient_has_undergone_identification_now@@performed_on_throat_swab_specimen
         patient_has_undergone_identification_now)
     :named REQ1_AUXILIARY4)) ;; "identification performed on throat swab specimen"

(assert
  (! (=> patient_has_undergone_antimicrobial_susceptibility_test_now@@performed_on_throat_swab_specimen
         patient_has_undergone_antimicrobial_susceptibility_test_now)
     :named REQ1_AUXILIARY5)) ;; "antibiotic-susceptibility testing performed on throat swab specimen"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: ((a clinical diagnosis of acute tonsillitis caused by Streptococcus pyogenes) OR (a clinical diagnosis of pharyngitis caused by Streptococcus pyogenes))
(assert
  (! (or patient_has_diagnosis_of_acute_tonsillitis_now@@caused_by_streptococcus_pyogenes
         patient_has_diagnosis_of_streptococcal_sore_throat_now@@caused_by_streptococcus_pyogenes)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "a clinical diagnosis of acute tonsillitis caused by Streptococcus pyogenes OR a clinical diagnosis of pharyngitis caused by Streptococcus pyogenes"

;; Component 1: a positive result from a rapid detection throat swab test for Group A streptococcal antigen
(assert
  (! patient_has_undergone_rapid_detection_throat_swab_test_for_group_a_streptococcal_antigen_now@@result_is_positive
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "a positive result from a rapid detection throat swab test for Group A streptococcal antigen"

;; Component 2: submission of a throat swab specimen for bacterial culture AND identification AND antibiotic-susceptibility testing
(assert
  (! (and patient_has_undergone_bacterial_culture_now@@performed_on_throat_swab_specimen
          patient_has_undergone_identification_now@@performed_on_throat_swab_specimen
          patient_has_undergone_antimicrobial_susceptibility_test_now@@performed_on_throat_swab_specimen)
     :named REQ1_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "submission of a throat swab specimen for bacterial culture AND identification AND antibiotic-susceptibility testing"

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================

(declare-const patient_has_finding_of_sore_throat_symptom_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a sore throat symptom.","when_to_set_to_false":"Set to false if the patient currently does not have a sore throat symptom.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a sore throat symptom.","meaning":"Boolean indicating whether the patient currently has a sore throat symptom."} // "a sore throat"
(declare-const patient_has_finding_of_scratchy_throat_symptom_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a scratchy throat symptom.","when_to_set_to_false":"Set to false if the patient currently does not have a scratchy throat symptom.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a scratchy throat symptom.","meaning":"Boolean indicating whether the patient currently has a scratchy throat symptom."} // "a scratchy throat"
(declare-const patient_has_finding_of_swallowing_painful_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has painful swallowing (odynophagia).","when_to_set_to_false":"Set to false if the patient currently does not have painful swallowing (odynophagia).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has painful swallowing (odynophagia).","meaning":"Boolean indicating whether the patient currently has painful swallowing (odynophagia)."} // "odynophagia"
(declare-const patient_has_finding_of_erythema_of_tonsils_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has erythema of the tonsils.","when_to_set_to_false":"Set to false if the patient currently does not have erythema of the tonsils.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has erythema of the tonsils.","meaning":"Boolean indicating whether the patient currently has erythema of the tonsils."} // "tonsil erythema"
(declare-const patient_has_finding_of_red_throat_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pharyngeal erythema (red throat).","when_to_set_to_false":"Set to false if the patient currently does not have pharyngeal erythema (red throat).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pharyngeal erythema (red throat).","meaning":"Boolean indicating whether the patient currently has pharyngeal erythema (red throat)."} // "pharyngeal erythema"
(declare-const patient_has_finding_of_exudate_on_tonsils_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has exudate on tonsils.","when_to_set_to_false":"Set to false if the patient currently does not have exudate on tonsils.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has exudate on tonsils.","meaning":"Boolean indicating whether the patient currently has exudate on tonsils."} // "tonsil exudate"
(declare-const patient_has_finding_of_exudate_on_pharynx_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has exudate on the pharynx.","when_to_set_to_false":"Set to false if the patient currently does not have exudate on the pharynx.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has exudate on the pharynx.","meaning":"Boolean indicating whether the patient currently has exudate on the pharynx."} // "pharyngeal exudate"
(declare-const patient_has_finding_of_cervical_lymphadenopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cervical lymphadenopathy.","when_to_set_to_false":"Set to false if the patient currently does not have cervical lymphadenopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cervical lymphadenopathy.","meaning":"Boolean indicating whether the patient currently has cervical lymphadenopathy."} // "cervical adenopathy"
(declare-const patient_has_finding_of_edema_of_uvula_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has edema of the uvula.","when_to_set_to_false":"Set to false if the patient currently does not have edema of the uvula.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has edema of the uvula.","meaning":"Boolean indicating whether the patient currently has edema of the uvula."} // "uvular edema"
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fever.","when_to_set_to_false":"Set to false if the patient currently does not have fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fever.","meaning":"Boolean indicating whether the patient currently has fever."} // "fever"
(declare-const patient_count_of_clinical_signs_present_now Real) ;; {"when_to_set_to_value":"Set to the number of clinical signs present now from the following list: tonsil erythema, pharyngeal erythema, tonsil exudate, pharyngeal exudate, cervical adenopathy, uvular edema, or fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many of the specified clinical signs are present now.","meaning":"Numeric value indicating the count of the specified clinical signs present now."} // "at least 2 of the following clinical signs: tonsil erythema OR pharyngeal erythema OR tonsil exudate OR pharyngeal exudate OR cervical adenopathy OR uvular edema OR fever"

;; ===================== Auxiliary Assertions (REQ 2) =====================

;; Definition of patient_count_of_clinical_signs_present_now as the sum of present clinical signs
(assert
  (! (= patient_count_of_clinical_signs_present_now
        (+ (ite patient_has_finding_of_erythema_of_tonsils_now 1 0)
           (ite patient_has_finding_of_red_throat_now 1 0)
           (ite patient_has_finding_of_exudate_on_tonsils_now 1 0)
           (ite patient_has_finding_of_exudate_on_pharynx_now 1 0)
           (ite patient_has_finding_of_cervical_lymphadenopathy_now 1 0)
           (ite patient_has_finding_of_edema_of_uvula_now 1 0)
           (ite patient_has_finding_of_fever_now 1 0)))
     :named REQ2_AUXILIARY0)) ;; "at least 2 of the following clinical signs: tonsil erythema OR pharyngeal erythema OR tonsil exudate OR pharyngeal exudate OR cervical adenopathy OR uvular edema OR fever"

;; ===================== Constraint Assertions (REQ 2) =====================

;; Component 0: patient must have a sore throat
(assert
  (! patient_has_finding_of_sore_throat_symptom_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have a sore throat"

;; Component 1: patient must have (a scratchy throat) OR (odynophagia)
(assert
  (! (or patient_has_finding_of_scratchy_throat_symptom_now
         patient_has_finding_of_swallowing_painful_now)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient must have (a scratchy throat) OR (odynophagia)"

;; Component 2: patient must have at least 2 of the listed clinical signs
(assert
  (! (>= patient_count_of_clinical_signs_present_now 2)
     :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "at least 2 of the following clinical signs: tonsil erythema OR pharyngeal erythema OR tonsil exudate OR pharyngeal exudate OR cervical adenopathy OR uvular edema OR fever"
