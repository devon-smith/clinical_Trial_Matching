;; ===================== Declarations for the inclusion criteria (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."}  ;; "be male"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."}  ;; "be female"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as pregnant.","when_to_set_to_false":"Set to false if the patient is currently documented as not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."}  ;; "be pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as lactating.","when_to_set_to_false":"Set to false if the patient is currently documented as not lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."}  ;; "be lactating"
(declare-const patient_has_provided_written_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent and this is documented at the current time.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent and this is documented at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent at the current time.","meaning":"Boolean indicating whether the patient has provided written informed consent at the current time."}  ;; "have provided written informed consent"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 20 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: ((be male) OR ((be female) AND (NOT be pregnant) AND (NOT be lactating)))
(assert
  (! (or patient_sex_is_male_now
         (and patient_sex_is_female_now
              (not patient_is_pregnant_now)
              (not patient_is_lactating_now)))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((be male) OR ((be female) AND (NOT be pregnant) AND (NOT be lactating)))."

;; Component 1: have provided written informed consent
(assert
  (! patient_has_provided_written_informed_consent_now
     :named REQ0_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have provided written informed consent."

;; Component 2: be aged ≥ 20 years
(assert
  (! (>= patient_age_value_recorded_now_in_years 20)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 20 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_appropriate_specimen_obtained_within_48hours_before_first_study_drug_administration Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had appropriate specimens obtained within 48 hours prior to the first study drug administration.","when_to_set_to_false":"Set to false if the patient has not had appropriate specimens obtained within 48 hours prior to the first study drug administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had appropriate specimens obtained within 48 hours prior to the first study drug administration.","meaning":"Boolean indicating whether the patient has had appropriate specimens obtained within 48 hours prior to the first study drug administration."} ;; "have appropriate specimens obtained within 48 hours prior to the first study drug administration"
(declare-const patient_has_appropriate_specimen_obtained_within_48hours_before_first_study_drug_administration@@highly_likely_to_identify_pathogens_sampled Bool) ;; {"when_to_set_to_true":"Set to true if the appropriate specimens obtained within 48 hours prior to the first study drug administration are highly likely to identify the pathogens sampled.","when_to_set_to_false":"Set to false if the appropriate specimens obtained within 48 hours prior to the first study drug administration are not highly likely to identify the pathogens sampled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the appropriate specimens obtained within 48 hours prior to the first study drug administration are highly likely to identify the pathogens sampled.","meaning":"Boolean indicating whether the appropriate specimens obtained within 48 hours prior to the first study drug administration are highly likely to identify the pathogens sampled."} ;; "appropriate specimens highly likely to identify the pathogens sampled"
(declare-const patient_has_pathogen_identified_with_appropriate_specimen_within_48hours_before_first_study_drug_administration Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had pathogens identified with appropriate specimens within 48 hours prior to the first study drug administration.","when_to_set_to_false":"Set to false if the patient has not had pathogens identified with appropriate specimens within 48 hours prior to the first study drug administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had pathogens identified with appropriate specimens within 48 hours prior to the first study drug administration.","meaning":"Boolean indicating whether the patient has had pathogens identified with appropriate specimens within 48 hours prior to the first study drug administration."} ;; "have the pathogens identified with appropriate specimens within 48 hours prior to the first study drug administration"
(declare-const patient_has_tracheal_aspirate_specimen_obtained_within_48hours_before_first_study_drug_administration Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a tracheal aspirate specimen obtained within 48 hours prior to the first study drug administration.","when_to_set_to_false":"Set to false if the patient has not had a tracheal aspirate specimen obtained within 48 hours prior to the first study drug administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a tracheal aspirate specimen obtained within 48 hours prior to the first study drug administration.","meaning":"Boolean indicating whether the patient has had a tracheal aspirate specimen obtained within 48 hours prior to the first study drug administration."} ;; "tracheal aspirate specimen within 48 hours prior to the first study drug administration"
(declare-const patient_has_undergone_bronchoscopy_and_bronchoalveolar_lavage_inthepast48hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone bronchoscopy and bronchoalveolar lavage within the past 48 hours.","when_to_set_to_false":"Set to false if the patient has not undergone bronchoscopy and bronchoalveolar lavage within the past 48 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone bronchoscopy and bronchoalveolar lavage within the past 48 hours.","meaning":"Boolean indicating whether the patient has undergone bronchoscopy and bronchoalveolar lavage within the past 48 hours."} ;; "bronchoalveolar lavage specimen within 48 hours prior to the first study drug administration"
(declare-const patient_has_undergone_bronchoscopy_and_bronchoalveolar_lavage_inthepast48hours@@temporalcontext_within48hours_before_first_study_drug_administration Bool) ;; {"when_to_set_to_true":"Set to true if the bronchoscopy and bronchoalveolar lavage was performed within 48 hours before the first study drug administration.","when_to_set_to_false":"Set to false if the procedure was not performed within 48 hours before the first study drug administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure was performed within 48 hours before the first study drug administration.","meaning":"Boolean indicating whether the bronchoscopy and bronchoalveolar lavage was performed within 48 hours before the first study drug administration."} ;; "bronchoalveolar lavage specimen within 48 hours prior to the first study drug administration"
(declare-const patient_has_undergone_brushing_inthepast48hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone protected brushing within the past 48 hours.","when_to_set_to_false":"Set to false if the patient has not undergone protected brushing within the past 48 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone protected brushing within the past 48 hours.","meaning":"Boolean indicating whether the patient has undergone protected brushing within the past 48 hours."} ;; "protected brushing specimen within 48 hours prior to the first study drug administration"
(declare-const patient_has_undergone_brushing_inthepast48hours@@temporalcontext_within48hours_before_first_study_drug_administration Bool) ;; {"when_to_set_to_true":"Set to true if the protected brushing was performed within 48 hours before the first study drug administration.","when_to_set_to_false":"Set to false if the protected brushing was not performed within 48 hours before the first study drug administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the protected brushing was performed within 48 hours before the first study drug administration.","meaning":"Boolean indicating whether the protected brushing was performed within 48 hours before the first study drug administration."} ;; "protected brushing specimen within 48 hours prior to the first study drug administration"
(declare-const patient_is_exposed_to_sputum_inthepast48hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a sputum specimen collected within the past 48 hours.","when_to_set_to_false":"Set to false if the patient has not had a sputum specimen collected within the past 48 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a sputum specimen collected within the past 48 hours.","meaning":"Boolean indicating whether the patient has been exposed to a sputum specimen within the past 48 hours."} ;; "sputum specimen within 48 hours prior to the first study drug administration"
(declare-const patient_is_exposed_to_sputum_inthepast48hours@@temporalcontext_within48hours_before_first_study_drug_administration Bool) ;; {"when_to_set_to_true":"Set to true if the sputum specimen was collected within 48 hours before the first study drug administration.","when_to_set_to_false":"Set to false if the sputum specimen was not collected within 48 hours before the first study drug administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the sputum specimen was collected within 48 hours before the first study drug administration.","meaning":"Boolean indicating whether the sputum specimen was collected within 48 hours before the first study drug administration."} ;; "sputum specimen within 48 hours prior to the first study drug administration"
(declare-const patient_has_diagnosis_of_legionella_infection_inthepast48hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of legionella infection within the past 48 hours.","when_to_set_to_false":"Set to false if the patient does not have a diagnosis of legionella infection within the past 48 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a diagnosis of legionella infection within the past 48 hours.","meaning":"Boolean indicating whether the patient has a diagnosis of legionella infection within the past 48 hours."} ;; "have legionellosis within 48 hours prior to the first study drug administration"
(declare-const patient_has_diagnosis_of_legionella_infection_inthepast48hours@@temporalcontext_within48hours_before_first_study_drug_administration Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of legionella infection was made within 48 hours before the first study drug administration.","when_to_set_to_false":"Set to false if the diagnosis was not made within 48 hours before the first study drug administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was made within 48 hours before the first study drug administration.","meaning":"Boolean indicating whether the diagnosis of legionella infection was made within 48 hours before the first study drug administration."} ;; "have legionellosis within 48 hours prior to the first study drug administration"
(declare-const patient_is_exposed_to_legionella_ag_inthepast48hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a positive test for Legionella antigen within the past 48 hours.","when_to_set_to_false":"Set to false if the patient has not had a positive test for Legionella antigen within the past 48 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a positive test for Legionella antigen within the past 48 hours.","meaning":"Boolean indicating whether the patient has been exposed to Legionella antigen within the past 48 hours."} ;; "positive test of Legionella antigen within 48 hours prior to the first study drug administration"
(declare-const patient_is_exposed_to_legionella_ag_inthepast48hours@@test_result_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if the Legionella antigen test result is positive.","when_to_set_to_false":"Set to false if the Legionella antigen test result is not positive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the Legionella antigen test result is positive.","meaning":"Boolean indicating whether the Legionella antigen test result is positive."} ;; "positive test of Legionella antigen"
(declare-const patient_is_exposed_to_legionella_ag_inthepast48hours@@temporalcontext_within48hours_before_first_study_drug_administration Bool) ;; {"when_to_set_to_true":"Set to true if the Legionella antigen test was performed within 48 hours before the first study drug administration.","when_to_set_to_false":"Set to false if the test was not performed within 48 hours before the first study drug administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the test was performed within 48 hours before the first study drug administration.","meaning":"Boolean indicating whether the Legionella antigen test was performed within 48 hours before the first study drug administration."} ;; "positive test of Legionella antigen within 48 hours prior to the first study drug administration"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term for appropriate specimen
(assert
  (! (=> (or patient_is_exposed_to_sputum_inthepast48hours@@temporalcontext_within48hours_before_first_study_drug_administration
            patient_has_tracheal_aspirate_specimen_obtained_within_48hours_before_first_study_drug_administration
            patient_has_undergone_bronchoscopy_and_bronchoalveolar_lavage_inthepast48hours@@temporalcontext_within48hours_before_first_study_drug_administration
            patient_has_undergone_brushing_inthepast48hours@@temporalcontext_within48hours_before_first_study_drug_administration)
        patient_has_appropriate_specimen_obtained_within_48hours_before_first_study_drug_administration)
     :named REQ1_AUXILIARY0)) ;; "appropriate specimens (with non-exhaustive examples: sputum, tracheal aspirate, bronchoalveolar lavage, protected brushing)"

;; Non-exhaustive examples imply umbrella term for pathogen identification with appropriate specimen
(assert
  (! (=> (or patient_is_exposed_to_sputum_inthepast48hours@@temporalcontext_within48hours_before_first_study_drug_administration
            patient_has_tracheal_aspirate_specimen_obtained_within_48hours_before_first_study_drug_administration
            patient_has_undergone_bronchoscopy_and_bronchoalveolar_lavage_inthepast48hours@@temporalcontext_within48hours_before_first_study_drug_administration
            patient_has_undergone_brushing_inthepast48hours@@temporalcontext_within48hours_before_first_study_drug_administration)
        patient_has_pathogen_identified_with_appropriate_specimen_within_48hours_before_first_study_drug_administration)
     :named REQ1_AUXILIARY1)) ;; "pathogen identified with appropriate specimens (with non-exhaustive examples: sputum, tracheal aspirate, bronchoalveolar lavage, protected brushing)"

;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_appropriate_specimen_obtained_within_48hours_before_first_study_drug_administration@@highly_likely_to_identify_pathogens_sampled
        patient_has_appropriate_specimen_obtained_within_48hours_before_first_study_drug_administration)
     :named REQ1_AUXILIARY2)) ;; "appropriate specimens highly likely to identify the pathogens sampled"

(assert
  (! (=> patient_has_undergone_bronchoscopy_and_bronchoalveolar_lavage_inthepast48hours@@temporalcontext_within48hours_before_first_study_drug_administration
        patient_has_undergone_bronchoscopy_and_bronchoalveolar_lavage_inthepast48hours)
     :named REQ1_AUXILIARY3)) ;; "bronchoalveolar lavage specimen within 48 hours prior to the first study drug administration"

(assert
  (! (=> patient_has_undergone_brushing_inthepast48hours@@temporalcontext_within48hours_before_first_study_drug_administration
        patient_has_undergone_brushing_inthepast48hours)
     :named REQ1_AUXILIARY4)) ;; "protected brushing specimen within 48 hours prior to the first study drug administration"

(assert
  (! (=> patient_is_exposed_to_sputum_inthepast48hours@@temporalcontext_within48hours_before_first_study_drug_administration
        patient_is_exposed_to_sputum_inthepast48hours)
     :named REQ1_AUXILIARY5)) ;; "sputum specimen within 48 hours prior to the first study drug administration"

(assert
  (! (=> patient_has_diagnosis_of_legionella_infection_inthepast48hours@@temporalcontext_within48hours_before_first_study_drug_administration
        patient_has_diagnosis_of_legionella_infection_inthepast48hours)
     :named REQ1_AUXILIARY6)) ;; "legionellosis within 48 hours prior to the first study drug administration"

(assert
  (! (=> patient_is_exposed_to_legionella_ag_inthepast48hours@@temporalcontext_within48hours_before_first_study_drug_administration
        patient_is_exposed_to_legionella_ag_inthepast48hours)
     :named REQ1_AUXILIARY7)) ;; "Legionella antigen test within 48 hours prior to the first study drug administration"

(assert
  (! (=> patient_is_exposed_to_legionella_ag_inthepast48hours@@test_result_is_positive
        patient_is_exposed_to_legionella_ag_inthepast48hours)
     :named REQ1_AUXILIARY8)) ;; "positive test of Legionella antigen"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Inclusion: patient must, within 48 hours prior to first study drug administration, 
;; (have pathogens identified with appropriate specimens) OR 
;; (have appropriate specimens highly likely to identify pathogens sampled) OR 
;; (have legionellosis AND have a positive test of Legionella antigen)
(assert
  (! (or patient_has_pathogen_identified_with_appropriate_specimen_within_48hours_before_first_study_drug_administration
        patient_has_appropriate_specimen_obtained_within_48hours_before_first_study_drug_administration@@highly_likely_to_identify_pathogens_sampled
        (and patient_has_diagnosis_of_legionella_infection_inthepast48hours@@temporalcontext_within48hours_before_first_study_drug_administration
             patient_is_exposed_to_legionella_ag_inthepast48hours@@test_result_is_positive
             patient_is_exposed_to_legionella_ag_inthepast48hours@@temporalcontext_within48hours_before_first_study_drug_administration))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must, within 48 hours prior to the first study drug administration, ((have the pathogens identified with appropriate specimens (with non-exhaustive examples (sputum specimen, tracheal aspirate specimen, bronchoalveolar lavage specimen, protected brushing specimen))) OR (have appropriate specimens (with non-exhaustive examples (sputum specimen, tracheal aspirate specimen, bronchoalveolar lavage specimen, protected brushing specimen)) highly likely to identify the pathogens sampled) OR ((have legionellosis) AND (have a positive test of Legionella antigen)))."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_bacterial_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of bacterial pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of bacterial pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of bacterial pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of bacterial pneumonia."} ;; "bacterial pneumonia"
(declare-const patient_has_diagnosis_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of pneumonia."} ;; "diagnostic criteria of pneumonia"
(declare-const patient_has_diagnosis_of_severe_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of severe pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of severe pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of severe pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of severe pneumonia."} ;; "severe pneumonia"
(declare-const patient_has_diagnosis_of_community_acquired_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of community-acquired pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of community-acquired pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of community-acquired pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of community-acquired pneumonia."} ;; "community-acquired pneumonia"
(declare-const pneumonia_severity_index_score_value_recorded_now_withunit_points Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's Pneumonia Severity Index score recorded now, in points.","when_to_set_to_null":"Set to null if the Pneumonia Severity Index score is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's Pneumonia Severity Index score recorded now, in points."} ;; "Pneumonia Severity Index score III, IV, V"
(declare-const patient_has_diagnosis_of_hospital_acquired_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hospital-acquired pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hospital-acquired pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hospital-acquired pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hospital-acquired pneumonia."} ;; "hospital-acquired pneumonia"
(declare-const patient_has_diagnosis_of_hospital_acquired_pneumonia_now@@group_b Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hospital-acquired pneumonia is classified as Group B.","when_to_set_to_false":"Set to false if the patient's hospital-acquired pneumonia is not classified as Group B.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hospital-acquired pneumonia is Group B.","meaning":"Boolean indicating whether the patient's hospital-acquired pneumonia is Group B."} ;; "hospital-acquired pneumonia Group B"
(declare-const patient_has_diagnosis_of_hospital_acquired_pneumonia_now@@low_risk_for_multidrug_resistant_pathogen_infection Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hospital-acquired pneumonia is associated with low risk for multidrug-resistant pathogen infection.","when_to_set_to_false":"Set to false if the patient's hospital-acquired pneumonia is not associated with low risk for multidrug-resistant pathogen infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hospital-acquired pneumonia is associated with low risk for multidrug-resistant pathogen infection.","meaning":"Boolean indicating whether the patient's hospital-acquired pneumonia is associated with low risk for multidrug-resistant pathogen infection."} ;; "low risk for multidrug-resistant pathogen infection"
(declare-const patient_has_diagnosis_of_hospital_acquired_pneumonia_now@@group_a Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hospital-acquired pneumonia is classified as Group A.","when_to_set_to_false":"Set to false if the patient's hospital-acquired pneumonia is not classified as Group A.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hospital-acquired pneumonia is Group A.","meaning":"Boolean indicating whether the patient's hospital-acquired pneumonia is Group A."} ;; "hospital-acquired pneumonia Group A"
(declare-const patient_has_diagnosis_of_hospital_acquired_pneumonia_now@@suspected_pseudomonas_aeruginosa_infection Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hospital-acquired pneumonia is associated with suspected Pseudomonas aeruginosa infection.","when_to_set_to_false":"Set to false if the patient's hospital-acquired pneumonia is not associated with suspected Pseudomonas aeruginosa infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hospital-acquired pneumonia is associated with suspected Pseudomonas aeruginosa infection.","meaning":"Boolean indicating whether the patient's hospital-acquired pneumonia is associated with suspected Pseudomonas aeruginosa infection."} ;; "suspected Pseudomonas aeruginosa infection"
(declare-const patient_is_hospitalized_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently hospitalized.","when_to_set_to_false":"Set to false if the patient is currently not hospitalized.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently hospitalized.","meaning":"Boolean indicating whether the patient is currently hospitalized."} ;; "hospitalized patient"
(declare-const patient_is_undergoing_drug_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing drug therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing drug therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing drug therapy.","meaning":"Boolean indicating whether the patient is currently undergoing drug therapy."} ;; "drug treatment"
(declare-const patient_is_undergoing_drug_therapy_now@@antimicrobial Bool) ;; {"when_to_set_to_true":"Set to true if the patient's drug therapy is antimicrobial.","when_to_set_to_false":"Set to false if the patient's drug therapy is not antimicrobial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's drug therapy is antimicrobial.","meaning":"Boolean indicating whether the patient's drug therapy is antimicrobial."} ;; "antimicrobial drug treatment"
(declare-const patient_is_undergoing_drug_therapy_now@@poor_response Bool) ;; {"when_to_set_to_true":"Set to true if the patient's drug therapy is associated with poor response.","when_to_set_to_false":"Set to false if the patient's drug therapy is not associated with poor response.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's drug therapy is associated with poor response.","meaning":"Boolean indicating whether the patient's drug therapy is associated with poor response."} ;; "poor response to other antimicrobial drug treatment"
(declare-const patient_is_undergoing_drug_therapy_now@@administered_over_greater_than_or_equal_3_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient's drug therapy has been administered over at least 3 days.","when_to_set_to_false":"Set to false if the patient's drug therapy has not been administered over at least 3 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's drug therapy has been administered over at least 3 days.","meaning":"Boolean indicating whether the patient's drug therapy has been administered over at least 3 days."} ;; "poor response to other antimicrobial drug treatment over ≥ 3 days"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_hospital_acquired_pneumonia_now@@group_b
         patient_has_diagnosis_of_hospital_acquired_pneumonia_now)
     :named REQ2_AUXILIARY0)) ;; "hospital-acquired pneumonia Group B"

(assert
  (! (=> patient_has_diagnosis_of_hospital_acquired_pneumonia_now@@group_a
         patient_has_diagnosis_of_hospital_acquired_pneumonia_now)
     :named REQ2_AUXILIARY1)) ;; "hospital-acquired pneumonia Group A"

(assert
  (! (=> patient_has_diagnosis_of_hospital_acquired_pneumonia_now@@low_risk_for_multidrug_resistant_pathogen_infection
         patient_has_diagnosis_of_hospital_acquired_pneumonia_now)
     :named REQ2_AUXILIARY2)) ;; "low risk for multidrug-resistant pathogen infection"

(assert
  (! (=> patient_has_diagnosis_of_hospital_acquired_pneumonia_now@@suspected_pseudomonas_aeruginosa_infection
         patient_has_diagnosis_of_hospital_acquired_pneumonia_now)
     :named REQ2_AUXILIARY3)) ;; "suspected Pseudomonas aeruginosa infection"

(assert
  (! (=> patient_is_undergoing_drug_therapy_now@@antimicrobial
         patient_is_undergoing_drug_therapy_now)
     :named REQ2_AUXILIARY4)) ;; "antimicrobial drug treatment"

(assert
  (! (=> patient_is_undergoing_drug_therapy_now@@poor_response
         patient_is_undergoing_drug_therapy_now)
     :named REQ2_AUXILIARY5)) ;; "poor response to other antimicrobial drug treatment"

(assert
  (! (=> patient_is_undergoing_drug_therapy_now@@administered_over_greater_than_or_equal_3_days
         patient_is_undergoing_drug_therapy_now)
     :named REQ2_AUXILIARY6)) ;; "poor response to other antimicrobial drug treatment over ≥ 3 days"

;; Pneumonia Severity Index score III, IV, V: III (71-90), IV (91-130), V (>130)
(define-fun patient_has_pneumonia_severity_index_score_III_IV_V_now () Bool
  (or (and (>= pneumonia_severity_index_score_value_recorded_now_withunit_points 71)
           (<= pneumonia_severity_index_score_value_recorded_now_withunit_points 90))
      (and (>= pneumonia_severity_index_score_value_recorded_now_withunit_points 91)
           (<= pneumonia_severity_index_score_value_recorded_now_withunit_points 130))
      (> pneumonia_severity_index_score_value_recorded_now_withunit_points 130))) ;; "Pneumonia Severity Index score III, IV, V"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have severe bacterial pneumonia meeting the diagnostic criteria of pneumonia, which includes at least one of the following:
;; (severe pneumonia)
;; OR (community-acquired pneumonia with Pneumonia Severity Index score III OR IV OR V)
;; OR (hospital-acquired pneumonia Group B AND low risk for multidrug-resistant pathogen infection)
;; OR (hospital-acquired pneumonia Group A AND suspected Pseudomonas aeruginosa infection)
;; OR (be a hospitalized patient with bacterial pneumonia AND poor response to other antimicrobial drug treatment, limited to
;;     (community-acquired pneumonia with Pneumonia Severity Index score III OR IV OR V)
;;     OR (hospital-acquired pneumonia Group A OR Group B) AND poor response to other antimicrobial drug treatment over ≥ 3 days)

(assert
  (!
    (and
      patient_has_diagnosis_of_bacterial_pneumonia_now
      patient_has_diagnosis_of_pneumonia_now
      (or
        ;; (severe pneumonia)
        patient_has_diagnosis_of_severe_pneumonia_now

        ;; (community-acquired pneumonia with Pneumonia Severity Index score III OR IV OR V)
        (and patient_has_diagnosis_of_community_acquired_pneumonia_now
             patient_has_pneumonia_severity_index_score_III_IV_V_now)

        ;; (hospital-acquired pneumonia Group B AND low risk for multidrug-resistant pathogen infection)
        (and patient_has_diagnosis_of_hospital_acquired_pneumonia_now@@group_b
             patient_has_diagnosis_of_hospital_acquired_pneumonia_now@@low_risk_for_multidrug_resistant_pathogen_infection)

        ;; (hospital-acquired pneumonia Group A AND suspected Pseudomonas aeruginosa infection)
        (and patient_has_diagnosis_of_hospital_acquired_pneumonia_now@@group_a
             patient_has_diagnosis_of_hospital_acquired_pneumonia_now@@suspected_pseudomonas_aeruginosa_infection)

        ;; (be a hospitalized patient with bacterial pneumonia AND poor response to other antimicrobial drug treatment, limited to ...)
        (and patient_is_hospitalized_now
             patient_has_diagnosis_of_bacterial_pneumonia_now
             patient_is_undergoing_drug_therapy_now@@antimicrobial
             patient_is_undergoing_drug_therapy_now@@poor_response
             (or
               ;; (community-acquired pneumonia with Pneumonia Severity Index score III OR IV OR V)
               (and patient_has_diagnosis_of_community_acquired_pneumonia_now
                    patient_has_pneumonia_severity_index_score_III_IV_V_now)
               ;; (hospital-acquired pneumonia Group A OR Group B) AND poor response to other antimicrobial drug treatment over ≥ 3 days
               (and (or patient_has_diagnosis_of_hospital_acquired_pneumonia_now@@group_a
                        patient_has_diagnosis_of_hospital_acquired_pneumonia_now@@group_b)
                    patient_is_undergoing_drug_therapy_now@@administered_over_greater_than_or_equal_3_days)
             )
        )
      )
    )
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must (have severe bacterial pneumonia meeting the diagnostic criteria of pneumonia, which includes at least one of the following: ...)"
