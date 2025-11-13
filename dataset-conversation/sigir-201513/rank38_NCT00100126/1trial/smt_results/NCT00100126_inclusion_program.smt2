;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_given_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has given informed consent.","when_to_set_to_false":"Set to false if the patient has not given informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has given informed consent.","meaning":"Boolean indicating whether the patient has given informed consent."} // "give informed consent"
(declare-const patient_has_given_assent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has given assent.","when_to_set_to_false":"Set to false if the patient has not given assent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has given assent.","meaning":"Boolean indicating whether the patient has given assent."} // "give assent"
(declare-const patient_has_provided_documentation_of_authorization_for_disclosure_of_study_results Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided documentation of authorization for disclosure of study results.","when_to_set_to_false":"Set to false if the patient has not provided documentation of authorization for disclosure of study results.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided documentation of authorization for disclosure of study results.","meaning":"Boolean indicating whether the patient has provided documentation of authorization for disclosure of study results."} // "provide documentation of patient authorization for disclosure of study results"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_given_informed_consent
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "give informed consent"
(assert
  (! patient_has_given_assent
     :named REQ0_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "give assent"
(assert
  (! patient_has_provided_documentation_of_authorization_for_disclosure_of_study_results
     :named REQ0_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "provide documentation of patient authorization for disclosure of study results"

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "since the patient is below the legal age of consent"
(declare-const patient_assent_applicable_per_state_regulations_now Bool) ;; {"when_to_set_to_true":"Set to true if patient assent is applicable at the current time according to state regulations.","when_to_set_to_false":"Set to false if patient assent is not applicable at the current time according to state regulations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether patient assent is applicable at the current time according to state regulations.","meaning":"Boolean indicating whether patient assent is applicable at the current time according to state regulations."} // "as applicable following state regulations"
(declare-const written_informed_consent_obtained_from_legal_guardian_now Bool) ;; {"when_to_set_to_true":"Set to true if written informed consent has been obtained from the patient's legal guardian at the current time.","when_to_set_to_false":"Set to false if written informed consent has not been obtained from the patient's legal guardian at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether written informed consent has been obtained from the patient's legal guardian at the current time.","meaning":"Boolean indicating whether written informed consent has been obtained from the patient's legal guardian at the current time."} // "written informed consent must be obtained from the legal guardian"
(declare-const written_informed_consent_obtained_from_parent_now Bool) ;; {"when_to_set_to_true":"Set to true if written informed consent has been obtained from the patient's parent at the current time.","when_to_set_to_false":"Set to false if written informed consent has not been obtained from the patient's parent at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether written informed consent has been obtained from the patient's parent at the current time.","meaning":"Boolean indicating whether written informed consent has been obtained from the patient's parent at the current time."} // "written informed consent must be obtained from the parent"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Patient must provide assent (as applicable following state regulations)
(assert
  (! (or (not patient_assent_applicable_per_state_regulations_now)
         patient_has_given_assent)
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must provide assent (as applicable following state regulations)."

;; Component 1: Written informed consent must be obtained from the parent OR legal guardian
(assert
  (! (or written_informed_consent_obtained_from_parent_now
         written_informed_consent_obtained_from_legal_guardian_now)
     :named REQ1_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must ((written informed consent must be obtained from the parent) OR (written informed consent must be obtained from the legal guardian)), since the patient is below the legal age of consent."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's age in months as recorded at the current time.","when_to_set_to_null":"Set to null if the patient's age in months at the current time is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's age in months, recorded now."} // "be aged greater than or equal to 6 months"
;; patient_age_value_recorded_now_in_years is already declared in previous SMT program

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: patient must be aged greater than or equal to 6 months
(assert
  (! (>= patient_age_value_recorded_now_in_months 6.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "be aged greater than or equal to 6 months"

;; Component 1: patient must be aged less than or equal to 12 years
(assert
  (! (<= patient_age_value_recorded_now_in_years 12.0)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "be aged less than or equal to 12 years"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_clinical_signs_and_symptoms_compatible_with_pharyngitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical signs and symptoms compatible with pharyngitis.","when_to_set_to_false":"Set to false if the patient currently does not have clinical signs and symptoms compatible with pharyngitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical signs and symptoms compatible with pharyngitis.","meaning":"Boolean indicating whether the patient currently has clinical signs and symptoms compatible with pharyngitis."} // "clinical signs and symptoms compatible with pharyngitis"
(declare-const patient_has_clinical_signs_and_symptoms_compatible_with_tonsillitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical signs and symptoms compatible with tonsillitis.","when_to_set_to_false":"Set to false if the patient currently does not have clinical signs and symptoms compatible with tonsillitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical signs and symptoms compatible with tonsillitis.","meaning":"Boolean indicating whether the patient currently has clinical signs and symptoms compatible with tonsillitis."} // "clinical signs and symptoms compatible with tonsillitis"
(declare-const patient_has_diagnosis_of_acute_tonsillitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of acute tonsillitis.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of acute tonsillitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of acute tonsillitis.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of acute tonsillitis."} // "clinical diagnosis of acute tonsillitis"
(declare-const patient_has_diagnosis_of_pharyngitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of pharyngitis.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of pharyngitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of pharyngitis.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of pharyngitis."} // "clinical diagnosis of pharyngitis"
(declare-const patient_has_difficulty_feeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has difficulty feeding.","when_to_set_to_false":"Set to false if the patient currently does not have difficulty feeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has difficulty feeding.","meaning":"Boolean indicating whether the patient currently has difficulty feeding."} // "difficulty feeding"
(declare-const patient_has_difficulty_swallowing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has difficulty swallowing.","when_to_set_to_false":"Set to false if the patient currently does not have difficulty swallowing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has difficulty swallowing.","meaning":"Boolean indicating whether the patient currently has difficulty swallowing."} // "difficulty swallowing"
(declare-const patient_has_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fever.","when_to_set_to_false":"Set to false if the patient currently does not have fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fever.","meaning":"Boolean indicating whether the patient currently has fever."} // "fever"
(declare-const patient_has_history_of_fever_treated_with_antipyretics Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of fever that was treated with antipyretics.","when_to_set_to_false":"Set to false if the patient does not have a history of fever that was treated with antipyretics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of fever that was treated with antipyretics.","meaning":"Boolean indicating whether the patient has a history of fever that was treated with antipyretics."} // "history of fever treated with antipyretics"
(declare-const patient_has_irritability_suggesting_sore_throat_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has irritability that suggests the presence of a sore throat.","when_to_set_to_false":"Set to false if the patient currently does not have irritability that suggests the presence of a sore throat.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has irritability that suggests the presence of a sore throat.","meaning":"Boolean indicating whether the patient currently has irritability that suggests the presence of a sore throat."} // "irritability that suggests the presence of a sore throat"
(declare-const patient_has_odynophagia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has odynophagia.","when_to_set_to_false":"Set to false if the patient currently does not have odynophagia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has odynophagia.","meaning":"Boolean indicating whether the patient currently has odynophagia."} // "odynophagia"
(declare-const patient_has_pharyngeal_erythema_of_moderate_or_greater_intensity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pharyngeal erythema of moderate or greater intensity.","when_to_set_to_false":"Set to false if the patient currently does not have pharyngeal erythema of moderate or greater intensity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pharyngeal erythema of moderate or greater intensity.","meaning":"Boolean indicating whether the patient currently has pharyngeal erythema of moderate or greater intensity."} // "pharyngeal erythema of moderate or greater intensity"
(declare-const patient_has_pharyngeal_exudate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pharyngeal exudate.","when_to_set_to_false":"Set to false if the patient currently does not have pharyngeal exudate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pharyngeal exudate.","meaning":"Boolean indicating whether the patient currently has pharyngeal exudate."} // "pharyngeal exudate"
(declare-const patient_has_red_tongue_and_prominent_papillae_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a red tongue and prominent papillae (strawberry tongue).","when_to_set_to_false":"Set to false if the patient currently does not have a red tongue and prominent papillae (strawberry tongue).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a red tongue and prominent papillae (strawberry tongue).","meaning":"Boolean indicating whether the patient currently has a red tongue and prominent papillae (strawberry tongue)."} // "red tongue and prominent papillae (strawberry tongue)"
(declare-const patient_has_sore_throat_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a sore throat.","when_to_set_to_false":"Set to false if the patient currently does not have a sore throat.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a sore throat.","meaning":"Boolean indicating whether the patient currently has a sore throat."} // "sore throat"
(declare-const patient_has_tender_cervical_lymph_nodes_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tender cervical lymph nodes.","when_to_set_to_false":"Set to false if the patient currently does not have tender cervical lymph nodes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tender cervical lymph nodes.","meaning":"Boolean indicating whether the patient currently has tender cervical lymph nodes."} // "tender cervical lymph nodes"
(declare-const patient_has_tonsillar_exudate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tonsillar exudate.","when_to_set_to_false":"Set to false if the patient currently does not have tonsillar exudate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tonsillar exudate.","meaning":"Boolean indicating whether the patient currently has tonsillar exudate."} // "tonsillar exudate"
(declare-const patient_has_uvular_edema_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has uvular edema.","when_to_set_to_false":"Set to false if the patient currently does not have uvular edema.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has uvular edema.","meaning":"Boolean indicating whether the patient currently has uvular edema."} // "uvular edema"
(declare-const white_blood_cell_count_percent_bands_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the numeric value of the percentage of bands in the patient's current white blood cell count if available.","when_to_set_to_null":"Set to null if the percentage of bands in the patient's current white blood cell count is not available, not documented, or cannot be determined.","meaning":"Numeric value indicating the percentage of bands in the patient's current white blood cell count, recorded in percent."} // "white blood cell count with greater than or equal to 10 percent bands"
(declare-const white_blood_cell_count_value_recorded_now_withunit_per_mm3 Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current white blood cell count in per mm3 if available.","when_to_set_to_null":"Set to null if the patient's current white blood cell count in per mm3 is not available, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current white blood cell count, recorded in per mm3."} // "white blood cell count greater than 12,000 per mm3"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition: elevated white blood cell count > 12,000 per mm3
(assert
  (! (= (exists ((x Real)) (and (= x white_blood_cell_count_value_recorded_now_withunit_per_mm3) (> x 12000.0)))
        (> white_blood_cell_count_value_recorded_now_withunit_per_mm3 12000.0))
     :named REQ3_AUXILIARY0)) ;; "elevated white blood cell count greater than 12,000 per mm3"

;; Definition: elevated white blood cell count with >= 10% bands
(assert
  (! (= (exists ((y Real)) (and (= y white_blood_cell_count_percent_bands_value_recorded_now_withunit_percent) (>= y 10.0)))
        (>= white_blood_cell_count_percent_bands_value_recorded_now_withunit_percent 10.0))
     :named REQ3_AUXILIARY1)) ;; "elevated white blood cell count with greater than or equal to 10 percent bands"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: To be included, the patient must ((have a clinical diagnosis of acute tonsillitis) OR (have a clinical diagnosis of pharyngitis defined as (having the clinical signs and symptoms compatible with tonsillitis OR having the clinical signs and symptoms compatible with pharyngitis) AND (sore throat OR difficulty feeding OR difficulty swallowing OR irritability that suggests the presence of a sore throat) AND (at least one of the following: tonsillar exudate OR pharyngeal exudate OR tender cervical lymph nodes OR fever OR history of fever treated with antipyretics OR odynophagia OR uvular edema OR pharyngeal erythema of moderate or greater intensity OR elevated white blood cell count greater than 12,000 per mm3 OR elevated white blood cell count with greater than or equal to 10 percent bands OR red tongue and prominent papillae (strawberry tongue)))).

(assert
  (! (or
      patient_has_diagnosis_of_acute_tonsillitis_now
      (and
        patient_has_diagnosis_of_pharyngitis_now
        (or patient_has_clinical_signs_and_symptoms_compatible_with_tonsillitis_now
            patient_has_clinical_signs_and_symptoms_compatible_with_pharyngitis_now)
        (or patient_has_sore_throat_now
            patient_has_difficulty_feeding_now
            patient_has_difficulty_swallowing_now
            patient_has_irritability_suggesting_sore_throat_now)
        (or patient_has_tonsillar_exudate_now
            patient_has_pharyngeal_exudate_now
            patient_has_tender_cervical_lymph_nodes_now
            patient_has_fever_now
            patient_has_history_of_fever_treated_with_antipyretics
            patient_has_odynophagia_now
            patient_has_uvular_edema_now
            patient_has_pharyngeal_erythema_of_moderate_or_greater_intensity_now
            (> white_blood_cell_count_value_recorded_now_withunit_per_mm3 12000.0)
            (>= white_blood_cell_count_percent_bands_value_recorded_now_withunit_percent 10.0)
            patient_has_red_tongue_and_prominent_papillae_now)))
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((have a clinical diagnosis of acute tonsillitis) OR (have a clinical diagnosis of pharyngitis defined as ...))"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_positive_result_on_enzyme_immunoassay_now@@using_signify_strep_a_test Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive result on an enzyme immunoassay performed using the SiGNIFY Strep A Test.","when_to_set_to_false":"Set to false if the patient currently does not have a positive result on an enzyme immunoassay performed using the SiGNIFY Strep A Test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive result on an enzyme immunoassay performed using the SiGNIFY Strep A Test.","meaning":"Boolean indicating whether the patient currently has a positive result on an enzyme immunoassay performed using the SiGNIFY Strep A Test."} // "positive rapid screening test for Streptococcus pyogenes (enzyme immunoassay; SiGNIFY Strep A Test)"
(declare-const patient_has_undergone_enzyme_immunoassay_method_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently undergone an enzyme immunoassay method.","when_to_set_to_false":"Set to false if the patient has not currently undergone an enzyme immunoassay method.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has currently undergone an enzyme immunoassay method.","meaning":"Boolean indicating whether the patient has currently undergone an enzyme immunoassay method."} // "enzyme immunoassay"
(declare-const patient_has_undergone_enzyme_immunoassay_method_now@@used_as_rapid_screening_test_for_streptococcus_pyogenes Bool) ;; {"when_to_set_to_true":"Set to true if the enzyme immunoassay method was used as a rapid screening test for Streptococcus pyogenes.","when_to_set_to_false":"Set to false if the enzyme immunoassay method was not used as a rapid screening test for Streptococcus pyogenes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the enzyme immunoassay method was used as a rapid screening test for Streptococcus pyogenes.","meaning":"Boolean indicating whether the enzyme immunoassay method was used as a rapid screening test for Streptococcus pyogenes."} // "enzyme immunoassay used as rapid screening test for Streptococcus pyogenes"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_enzyme_immunoassay_method_now@@used_as_rapid_screening_test_for_streptococcus_pyogenes
         patient_has_undergone_enzyme_immunoassay_method_now)
     :named REQ4_AUXILIARY0)) ;; "enzyme immunoassay used as rapid screening test for Streptococcus pyogenes" implies "enzyme immunoassay"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_positive_result_on_enzyme_immunoassay_now@@using_signify_strep_a_test
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must have a positive rapid screening test for Streptococcus pyogenes (enzyme immunoassay; SiGNIFY Strep A Test)"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_can_undergo_oral_antibiotic_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently an appropriate candidate for oral antibiotic therapy (i.e., can undergo oral antibiotic therapy now).","when_to_set_to_false":"Set to false if the patient is currently not an appropriate candidate for oral antibiotic therapy (i.e., cannot undergo oral antibiotic therapy now).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo oral antibiotic therapy.","meaning":"Boolean indicating whether the patient can currently undergo oral antibiotic therapy."} // "be an appropriate candidate for oral antibiotic therapy"
(declare-const patient_can_swallow_study_dosage_forms_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to swallow the study dosage forms.","when_to_set_to_false":"Set to false if the patient is currently unable to swallow the study dosage forms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to swallow the study dosage forms.","meaning":"Boolean indicating whether the patient is currently able to swallow the study dosage forms."} // "be able to swallow the study dosage forms"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: Patient must be an appropriate candidate for oral antibiotic therapy
(assert
  (! patient_can_undergo_oral_antibiotic_therapy_now
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be an appropriate candidate for oral antibiotic therapy."

;; Component 1: Patient must be able to swallow the study dosage forms
(assert
  (! patient_can_swallow_study_dosage_forms_now
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be able to swallow the study dosage forms."

;; ===================== Declarations for the inclusion criterion (REQ 6) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."} // "if the patient is female"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently not lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} // "be non-lactating"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has childbearing potential.","when_to_set_to_false":"Set to false if the patient currently does not have childbearing potential.","when_to_set_to_null":"Set to null if the patient's current childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} // "if of childbearing potential"
(declare-const patient_is_sexually_active_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently sexually active.","when_to_set_to_false":"Set to false if the patient is currently not sexually active.","when_to_set_to_null":"Set to null if the patient's current sexual activity status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently sexually active."} // "sexually active"
(declare-const patient_has_negative_urine_pregnancy_test_prestudy Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a negative urine pregnancy test performed prior to study initiation.","when_to_set_to_false":"Set to false if the patient does not have a negative urine pregnancy test performed prior to study initiation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a negative urine pregnancy test performed prior to study initiation.","meaning":"Boolean value indicating whether the patient has a negative urine pregnancy test performed prior to study initiation."} // "have a negative prestudy urine pregnancy test"
(declare-const patient_is_utilizing_acceptable_birth_control_methods_throughout_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient is utilizing acceptable birth control methods throughout the study period.","when_to_set_to_false":"Set to false if the patient is not utilizing acceptable birth control methods throughout the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is utilizing acceptable birth control methods throughout the study period.","meaning":"Boolean value indicating whether the patient is utilizing acceptable birth control methods throughout the study period."} // "be utilizing acceptable birth control methods throughout the study"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as determined by a urine pregnancy test.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as determined by a urine pregnancy test.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} // "have a negative prestudy urine pregnancy test"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; The requirement states: "if the patient is female, the patient must be non-lactating"
(assert
  (! (=> patient_sex_is_female_now
         (not patient_is_lactating_now))
     :named REQ6_AUXILIARY0)) ;; "if the patient is female, the patient must be non-lactating"

;; The requirement states: "if the patient is female and of childbearing potential and sexually active, the patient must have a negative prestudy urine pregnancy test AND be utilizing acceptable birth control methods throughout the study"
(assert
  (! (=> (and patient_sex_is_female_now
              patient_has_childbearing_potential_now
              patient_is_sexually_active_now)
         (and patient_has_negative_urine_pregnancy_test_prestudy
              patient_is_utilizing_acceptable_birth_control_methods_throughout_study))
     :named REQ6_AUXILIARY1)) ;; "if the patient is female and of childbearing potential and sexually active, the patient must have a negative prestudy urine pregnancy test AND be utilizing acceptable birth control methods throughout the study"

;; The requirement implies that a negative prestudy urine pregnancy test means the patient is not pregnant at the time of the test.
(assert
  (! (=> patient_has_negative_urine_pregnancy_test_prestudy
         (not patient_is_pregnant_now))
     :named REQ6_AUXILIARY2)) ;; "have a negative prestudy urine pregnancy test" implies "not pregnant"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: "if the patient is female, the patient must be non-lactating."
(assert
  (! (or (not patient_sex_is_female_now)
         (not patient_is_lactating_now))
     :named REQ6_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; Component 1: "if the patient is female and of childbearing potential and sexually active, the patient must have a negative prestudy urine pregnancy test AND be utilizing acceptable birth control methods throughout the study."
(assert
  (! (or (not (and patient_sex_is_female_now
                   patient_has_childbearing_potential_now
                   patient_is_sexually_active_now))
         (and patient_has_negative_urine_pregnancy_test_prestudy
              patient_is_utilizing_acceptable_birth_control_methods_throughout_study))
     :named REQ6_COMPONENT1_OTHER_REQUIREMENTS))
