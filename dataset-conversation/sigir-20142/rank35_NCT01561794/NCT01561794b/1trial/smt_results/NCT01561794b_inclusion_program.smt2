;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is male as currently recorded."}  ;; "the patient must be male"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female as currently recorded."}  ;; "the patient must be female"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently pregnant.","when_to_set_to_false":"Set to false if the patient is documented as currently not pregnant.","when_to_set_to_null":"Set to null if the patient's pregnancy status is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient is currently pregnant."}  ;; "female who is not pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently lactating.","when_to_set_to_false":"Set to false if the patient is documented as currently not lactating.","when_to_set_to_null":"Set to null if the patient's lactation status is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient is currently lactating."}  ;; "female who is not lactating"
(declare-const patient_has_provided_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent.","meaning":"Boolean indicating whether the patient has provided written informed consent."}  ;; "must have provided written informed consent"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "must be 20 years of age or older"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: "To be included, the patient must be male or must be a female who is not pregnant and is not lactating."
(assert
  (! (or patient_sex_is_male_now
         (and patient_sex_is_female_now
              (not patient_is_pregnant_now)
              (not patient_is_lactating_now)))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be male or must be a female who is not pregnant and is not lactating"

;; Component 1: "To be included, the patient must have provided written informed consent."
(assert
  (! patient_has_provided_written_informed_consent
     :named REQ0_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "must have provided written informed consent"

;; Component 2: "To be included, the patient must be 20 years of age or older."
(assert
  (! (>= patient_age_value_recorded_now_in_years 20)
     :named REQ0_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "must be 20 years of age or older"

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_is_exposed_to_microbial_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to microbial agents (pathogens).","when_to_set_to_false":"Set to false if the patient is currently not exposed to microbial agents (pathogens).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to microbial agents (pathogens).","meaning":"Boolean indicating whether the patient is currently exposed to microbial agents (pathogens)."} ;; "the patient must have the pathogens identified with appropriate specimens"
(declare-const patient_is_exposed_to_microbial_agent_now@@identified_with_appropriate_specimens_within_48_hours_prior_to_first_study_drug_administration Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pathogens have been identified with appropriate specimens within 48 hours prior to the first study drug administration.","when_to_set_to_false":"Set to false if the patient's pathogens have not been identified with appropriate specimens within 48 hours prior to the first study drug administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's pathogens have been identified with appropriate specimens within 48 hours prior to the first study drug administration.","meaning":"Boolean indicating whether the patient's pathogens have been identified with appropriate specimens within 48 hours prior to the first study drug administration."} ;; "the patient must have the pathogens identified with appropriate specimens (for example, sputum specimen, tracheal aspirate specimen, bronchoalveolar lavage specimen, protected brushing specimen) within 48 hours prior to the first study drug administration"
(declare-const patient_is_exposed_to_microbial_agent_now@@sampled_with_appropriate_specimens_highly_likely_to_identify_pathogens Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pathogens have been sampled with appropriate specimens highly likely to identify them.","when_to_set_to_false":"Set to false if the patient's pathogens have not been sampled with appropriate specimens highly likely to identify them.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's pathogens have been sampled with appropriate specimens highly likely to identify them.","meaning":"Boolean indicating whether the patient's pathogens have been sampled with appropriate specimens highly likely to identify them."} ;; "or must have appropriate specimens highly likely to identify the pathogens sampled"
(declare-const patient_is_exposed_to_sputum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to sputum (as a specimen).","when_to_set_to_false":"Set to false if the patient is currently not exposed to sputum (as a specimen).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to sputum (as a specimen).","meaning":"Boolean indicating whether the patient is currently exposed to sputum (as a specimen)."} ;; "sputum specimen"
(declare-const patient_is_exposed_to_tracheal_aspirate_specimen_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to tracheal aspirate specimen.","when_to_set_to_false":"Set to false if the patient is currently not exposed to tracheal aspirate specimen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to tracheal aspirate specimen.","meaning":"Boolean indicating whether the patient is currently exposed to tracheal aspirate specimen."} ;; "tracheal aspirate specimen"
(declare-const patient_is_exposed_to_tracheal_aspirate_specimen_now@@obtained_within_48_hours_prior_to_first_study_drug_administration Bool) ;; {"when_to_set_to_true":"Set to true if the tracheal aspirate specimen was obtained within 48 hours prior to the first study drug administration.","when_to_set_to_false":"Set to false if the tracheal aspirate specimen was not obtained within 48 hours prior to the first study drug administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the tracheal aspirate specimen was obtained within 48 hours prior to the first study drug administration.","meaning":"Boolean indicating whether the tracheal aspirate specimen was obtained within 48 hours prior to the first study drug administration."} ;; "tracheal aspirate specimen within 48 hours prior to the first study drug administration"
(declare-const patient_is_exposed_to_bronchoalveolar_lavage_specimen_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to bronchoalveolar lavage specimen.","when_to_set_to_false":"Set to false if the patient is currently not exposed to bronchoalveolar lavage specimen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to bronchoalveolar lavage specimen.","meaning":"Boolean indicating whether the patient is currently exposed to bronchoalveolar lavage specimen."} ;; "bronchoalveolar lavage specimen"
(declare-const patient_is_exposed_to_bronchoalveolar_lavage_specimen_now@@obtained_within_48_hours_prior_to_first_study_drug_administration Bool) ;; {"when_to_set_to_true":"Set to true if the bronchoalveolar lavage specimen was obtained within 48 hours prior to the first study drug administration.","when_to_set_to_false":"Set to false if the bronchoalveolar lavage specimen was not obtained within 48 hours prior to the first study drug administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the bronchoalveolar lavage specimen was obtained within 48 hours prior to the first study drug administration.","meaning":"Boolean indicating whether the bronchoalveolar lavage specimen was obtained within 48 hours prior to the first study drug administration."} ;; "bronchoalveolar lavage specimen within 48 hours prior to the first study drug administration"
(declare-const patient_is_exposed_to_protected_brushing_specimen_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to protected brushing specimen.","when_to_set_to_false":"Set to false if the patient is currently not exposed to protected brushing specimen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to protected brushing specimen.","meaning":"Boolean indicating whether the patient is currently exposed to protected brushing specimen."} ;; "protected brushing specimen"
(declare-const patient_is_exposed_to_protected_brushing_specimen_now@@obtained_within_48_hours_prior_to_first_study_drug_administration Bool) ;; {"when_to_set_to_true":"Set to true if the protected brushing specimen was obtained within 48 hours prior to the first study drug administration.","when_to_set_to_false":"Set to false if the protected brushing specimen was not obtained within 48 hours prior to the first study drug administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the protected brushing specimen was obtained within 48 hours prior to the first study drug administration.","meaning":"Boolean indicating whether the protected brushing specimen was obtained within 48 hours prior to the first study drug administration."} ;; "protected brushing specimen within 48 hours prior to the first study drug administration"
(declare-const patient_has_diagnosis_of_legionella_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of legionella infection (legionellosis).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of legionella infection (legionellosis).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of legionella infection (legionellosis).","meaning":"Boolean indicating whether the patient currently has a diagnosis of legionella infection (legionellosis)."} ;; "if the patient has legionellosis"
(declare-const patients_legionella_ag_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's Legionella antigen test is positive now.","when_to_set_to_false":"Set to false if the patient's Legionella antigen test is not positive now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's Legionella antigen test is positive now.","meaning":"Boolean indicating whether the patient's Legionella antigen test is positive now."} ;; "the test of Legionella antigen is positive"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_is_exposed_to_microbial_agent_now@@identified_with_appropriate_specimens_within_48_hours_prior_to_first_study_drug_administration
         patient_is_exposed_to_microbial_agent_now)
     :named REQ1_AUXILIARY0)) ;; "the patient must have the pathogens identified with appropriate specimens (for example, sputum specimen, tracheal aspirate specimen, bronchoalveolar lavage specimen, protected brushing specimen) within 48 hours prior to the first study drug administration"

(assert
  (! (=> patient_is_exposed_to_microbial_agent_now@@sampled_with_appropriate_specimens_highly_likely_to_identify_pathogens
         patient_is_exposed_to_microbial_agent_now)
     :named REQ1_AUXILIARY1)) ;; "must have appropriate specimens highly likely to identify the pathogens sampled"

;; Non-exhaustive examples: if the patient is exposed to any of the listed specimens within 48 hours, this implies the umbrella of 'appropriate specimens'
(assert
  (! (=> (or patient_is_exposed_to_sputum_now
             patient_is_exposed_to_tracheal_aspirate_specimen_now@@obtained_within_48_hours_prior_to_first_study_drug_administration
             patient_is_exposed_to_bronchoalveolar_lavage_specimen_now@@obtained_within_48_hours_prior_to_first_study_drug_administration
             patient_is_exposed_to_protected_brushing_specimen_now@@obtained_within_48_hours_prior_to_first_study_drug_administration)
         patient_is_exposed_to_microbial_agent_now@@identified_with_appropriate_specimens_within_48_hours_prior_to_first_study_drug_administration)
     :named REQ1_AUXILIARY2)) ;; "for example, sputum specimen, tracheal aspirate specimen, bronchoalveolar lavage specimen, protected brushing specimen"

;; Qualifier variables for specimens imply the stem specimen variable
(assert
  (! (=> patient_is_exposed_to_tracheal_aspirate_specimen_now@@obtained_within_48_hours_prior_to_first_study_drug_administration
         patient_is_exposed_to_tracheal_aspirate_specimen_now)
     :named REQ1_AUXILIARY3)) ;; "tracheal aspirate specimen within 48 hours prior to the first study drug administration"

(assert
  (! (=> patient_is_exposed_to_bronchoalveolar_lavage_specimen_now@@obtained_within_48_hours_prior_to_first_study_drug_administration
         patient_is_exposed_to_bronchoalveolar_lavage_specimen_now)
     :named REQ1_AUXILIARY4)) ;; "bronchoalveolar lavage specimen within 48 hours prior to the first study drug administration"

(assert
  (! (=> patient_is_exposed_to_protected_brushing_specimen_now@@obtained_within_48_hours_prior_to_first_study_drug_administration
         patient_is_exposed_to_protected_brushing_specimen_now)
     :named REQ1_AUXILIARY5)) ;; "protected brushing specimen within 48 hours prior to the first study drug administration"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Main inclusion: Either (A) pathogens identified with appropriate specimens within 48h, (B) appropriate specimens highly likely to identify pathogens sampled, or (C) if legionellosis, positive Legionella antigen test
(assert
  (! (or patient_is_exposed_to_microbial_agent_now@@identified_with_appropriate_specimens_within_48_hours_prior_to_first_study_drug_administration
         patient_is_exposed_to_microbial_agent_now@@sampled_with_appropriate_specimens_highly_likely_to_identify_pathogens
         (and patient_has_diagnosis_of_legionella_infection_now
              patients_legionella_ag_is_positive_now))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, within 48 hours prior to the first study drug administration, the patient must have the pathogens identified with appropriate specimens (for example, sputum specimen, tracheal aspirate specimen, bronchoalveolar lavage specimen, protected brushing specimen), or must have appropriate specimens highly likely to identify the pathogens sampled. However, if the patient has legionellosis, the patient is included when the test of Legionella antigen is positive."

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_secondary_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a secondary infection.","when_to_set_to_false":"Set to false if the patient currently does not have a secondary infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a secondary infection.","meaning":"Boolean indicating whether the patient currently has a secondary infection."} ;; "the patient must have secondary infection of chronic respiratory disease"
(declare-const patient_is_hospitalized_for_treatment_of_secondary_infection_of_chronic_respiratory_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently hospitalized specifically for the treatment of secondary infection of chronic respiratory disease.","when_to_set_to_false":"Set to false if the patient is currently not hospitalized for the treatment of secondary infection of chronic respiratory disease, or is hospitalized for another reason.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently hospitalized for the treatment of secondary infection of chronic respiratory disease.","meaning":"Boolean indicating whether the patient is currently hospitalized specifically for the treatment of secondary infection of chronic respiratory disease."} ;; "the patient must be hospitalized for the treatment of secondary infection of chronic respiratory disease"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_secondary_infection_now
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must have secondary infection of chronic respiratory disease"

(assert
  (! patient_is_hospitalized_for_treatment_of_secondary_infection_of_chronic_respiratory_disease_now
     :named REQ2_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be hospitalized for the treatment of secondary infection of chronic respiratory disease"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_does_not_respond_to_antimicrobials_over_3_days_of_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently does not respond to antimicrobials over 3 days of treatment.","when_to_set_to_false":"Set to false if the patient currently does respond to antimicrobials over 3 days of treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently does not respond to antimicrobials over 3 days of treatment.","meaning":"Boolean indicating whether the patient currently does not respond to antimicrobials over 3 days of treatment."} ;; "who do not respond to other antimicrobials over 3 days of treatment"
(declare-const patient_has_poor_response_to_antimicrobials_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a poor response to antimicrobials.","when_to_set_to_false":"Set to false if the patient currently does not have a poor response to antimicrobials.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a poor response to antimicrobials.","meaning":"Boolean indicating whether the patient currently has a poor response to antimicrobials."} ;; "must have a poor response to other antimicrobials"
(declare-const patient_has_poor_response_to_antimicrobials_now@@over_3_days_of_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's poor response to antimicrobials is observed over 3 days of treatment.","when_to_set_to_false":"Set to false if the patient's poor response to antimicrobials is not observed over 3 days of treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's poor response to antimicrobials is observed over 3 days of treatment.","meaning":"Boolean indicating whether the patient's poor response to antimicrobials is observed over 3 days of treatment."} ;; "poor response to other antimicrobials over 3 days of treatment"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_poor_response_to_antimicrobials_now@@over_3_days_of_treatment
         patient_has_poor_response_to_antimicrobials_now)
     :named REQ3_AUXILIARY0)) ;; "poor response to other antimicrobials over 3 days of treatment" implies "poor response to other antimicrobials"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: Must have secondary infection of chronic respiratory disease
(assert
  (! patient_has_finding_of_secondary_infection_now
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must have secondary infection of chronic respiratory disease"

;; Component 1: Must be hospitalized for treatment of secondary infection of chronic respiratory disease
(assert
  (! patient_is_hospitalized_for_treatment_of_secondary_infection_of_chronic_respiratory_disease_now
     :named REQ3_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be hospitalized for the treatment of secondary infection of chronic respiratory disease"

;; Component 2: Must have poor response to other antimicrobials, limited to those who do not respond to other antimicrobials over 3 days of treatment OR have poor response to other antimicrobials over 3 days of treatment
(assert
  (! (or patient_does_not_respond_to_antimicrobials_over_3_days_of_treatment_now
         patient_has_poor_response_to_antimicrobials_now@@over_3_days_of_treatment)
     :named REQ3_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "limited to patients with secondary infection of chronic respiratory disease who do not respond to other antimicrobials over 3 days of treatment or have a poor response to other antimicrobials over 3 days of treatment"
