;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as determined by clinical assessment or urine test.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as determined by clinical assessment or urine test.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is in a pregnant state (determined by urine test)"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating as determined by clinical assessment or documentation.","when_to_set_to_false":"Set to false if the patient is currently not lactating as determined by clinical assessment or documentation.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is in a lactating state"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (male or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."} ;; "the patient is a woman"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (and patient_sex_is_female_now patient_is_pregnant_now))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman who is in a pregnant state (determined by urine test)."

(assert
  (! (not (and patient_sex_is_female_now patient_is_lactating_now))
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman who is in a lactating state."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_obstruction_of_bronchus_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of obstruction of bronchus (bronchial obstruction).","when_to_set_to_false":"Set to false if the patient has never had a documented history of obstruction of bronchus (bronchial obstruction).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of obstruction of bronchus.","meaning":"Boolean indicating whether the patient has ever had a history of obstruction of bronchus (bronchial obstruction)."} ;; "bronchial obstruction"

(declare-const patient_has_finding_of_postobstructive_pneumonia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of postobstructive pneumonia.","when_to_set_to_false":"Set to false if the patient has never had a documented history of postobstructive pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of postobstructive pneumonia.","meaning":"Boolean indicating whether the patient has ever had a history of postobstructive pneumonia."} ;; "postobstructive pneumonia"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_obstruction_of_bronchus_inthehistory)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of bronchial obstruction."

(assert
(! (not patient_has_finding_of_postobstructive_pneumonia_inthehistory)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of postobstructive pneumonia."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_neutrophil_count_value_recorded_now_withunit_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value if a current neutrophil count (number per cubic millimeter) is available for the patient.","when_to_set_to_null":"Set to null if no current neutrophil count measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current neutrophil count in number per cubic millimeter."} ;; "neutrophil count less than 1000 per cubic millimeter"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (< patient_neutrophil_count_value_recorded_now_withunit_per_cubic_millimeter 1000))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a neutrophil count less than 1000 per cubic millimeter."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_viral_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pneumonia due to viral infection.","when_to_set_to_false":"Set to false if the patient currently does not have pneumonia due to viral infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pneumonia due to viral infection.","meaning":"Boolean indicating whether the patient currently has pneumonia due to viral infection."} ;; "pneumonia due to viral infection"
(declare-const patient_has_finding_of_fungal_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pneumonia due to fungal infection.","when_to_set_to_false":"Set to false if the patient currently does not have pneumonia due to fungal infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pneumonia due to fungal infection.","meaning":"Boolean indicating whether the patient currently has pneumonia due to fungal infection."} ;; "pneumonia due to fungal infection"
(declare-const patient_has_finding_of_mycobacterial_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pneumonia due to mycobacterial infection.","when_to_set_to_false":"Set to false if the patient currently does not have pneumonia due to mycobacterial infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pneumonia due to mycobacterial infection.","meaning":"Boolean indicating whether the patient currently has pneumonia due to mycobacterial infection."} ;; "pneumonia due to mycobacterial infection"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_viral_pneumonia_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pneumonia due to viral infection."

(assert
(! (not patient_has_finding_of_fungal_pneumonia_now)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pneumonia due to fungal infection."

(assert
(! (not patient_has_finding_of_mycobacterial_pneumonia_now)
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pneumonia due to mycobacterial infection."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_human_immunodeficiency_virus_infection_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of human immunodeficiency virus infection at any time in their history.","when_to_set_to_false":"Set to false if the patient has no documented diagnosis of human immunodeficiency virus infection at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient has ever been diagnosed with human immunodeficiency virus infection."} ;; "human immunodeficiency virus infection"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_human_immunodeficiency_virus_infection_inthehistory)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is known to have been infected with human immunodeficiency virus infection."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_legionella_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of Legionella pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of Legionella pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Legionella pneumonia.","meaning":"Boolean indicating whether the patient currently has Legionella pneumonia."} ;; "Legionella pneumonia"
(declare-const patient_has_finding_of_legionella_pneumonia_now@@documented Bool) ;; {"when_to_set_to_true":"Set to true if the patient's Legionella pneumonia finding is documented.","when_to_set_to_false":"Set to false if the patient's Legionella pneumonia finding is not documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the Legionella pneumonia finding is documented.","meaning":"Boolean indicating whether the patient's Legionella pneumonia finding is documented."} ;; "documented Legionella pneumonia"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_legionella_pneumonia_now@@documented
      patient_has_finding_of_legionella_pneumonia_now)
:named REQ5_AUXILIARY0)) ;; "documented Legionella pneumonia"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_legionella_pneumonia_now@@documented)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has documented Legionella pneumonia."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_exposed_to_microbial_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to (infected with) a microbial agent.","when_to_set_to_false":"Set to false if the patient is currently not exposed to (infected with) a microbial agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to (infected with) a microbial agent.","meaning":"Boolean indicating whether the patient is currently exposed to (infected with) a microbial agent."} ;; "infected with a microorganism"
(declare-const patient_is_exposed_to_microbial_agent_now@@is_gram_negative Bool) ;; {"when_to_set_to_true":"Set to true if the microbial agent to which the patient is currently exposed is gram negative.","when_to_set_to_false":"Set to false if the microbial agent to which the patient is currently exposed is not gram negative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the microbial agent is gram negative.","meaning":"Boolean indicating whether the microbial agent to which the patient is currently exposed is gram negative."} ;; "gram negative microorganism"
(declare-const patient_is_exposed_to_microbial_agent_now@@is_resistant_to_study_antibiotic Bool) ;; {"when_to_set_to_true":"Set to true if the microbial agent to which the patient is currently exposed is known to be resistant to at least one of the study antibiotics.","when_to_set_to_false":"Set to false if the microbial agent to which the patient is currently exposed is not known to be resistant to any of the study antibiotics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the microbial agent is resistant to any of the study antibiotics.","meaning":"Boolean indicating whether the microbial agent to which the patient is currently exposed is known to be resistant to at least one of the study antibiotics."} ;; "known to be resistant to one of the study antibiotics"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_exposed_to_microbial_agent_now@@is_gram_negative
      patient_is_exposed_to_microbial_agent_now)
:named REQ6_AUXILIARY0)) ;; "gram negative microorganism"

(assert
(! (=> patient_is_exposed_to_microbial_agent_now@@is_resistant_to_study_antibiotic
      patient_is_exposed_to_microbial_agent_now)
:named REQ6_AUXILIARY1)) ;; "microorganism known to be resistant to one of the study antibiotics"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (and patient_is_exposed_to_microbial_agent_now
             patient_is_exposed_to_microbial_agent_now@@is_gram_negative
             patient_is_exposed_to_microbial_agent_now@@is_resistant_to_study_antibiotic))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is infected with a gram negative microorganism known to be resistant to one of the study antibiotics during the trial."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_undergone_identification_of_organism_on_gram_stain_of_sputum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a sputum gram stain procedure now.","when_to_set_to_false":"Set to false if the patient has not undergone a sputum gram stain procedure now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a sputum gram stain procedure now.","meaning":"Boolean indicating whether the patient has undergone a sputum gram stain procedure now."} ;; "sputum gram stain"

(declare-const sputum_gram_stain_polymorphonuclear_leukocyte_count_value_recorded_now_withunit_cells_per_low_power_field Real) ;; {"when_to_set_to_value":"Set to the numeric value of polymorphonuclear leukocytes per low power field as recorded in the patient's sputum gram stain performed now.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined from the patient's sputum gram stain performed now.","meaning":"Numeric value indicating the number of polymorphonuclear leukocytes per low power field in the patient's sputum gram stain performed now."} ;; "polymorphonuclear leukocyte count greater than 25"

(declare-const sputum_gram_stain_epithelial_cell_count_value_recorded_now_withunit_cells_per_low_power_field Real) ;; {"when_to_set_to_value":"Set to the numeric value of epithelial cells per low power field as recorded in the patient's sputum gram stain performed now.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined from the patient's sputum gram stain performed now.","meaning":"Numeric value indicating the number of epithelial cells per low power field in the patient's sputum gram stain performed now."} ;; "epithelial cell count less than 10"

(declare-const sputum_gram_stain_gram_positive_cocci_in_cluster_predominant_and_phagocytosis_present_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sputum gram stain performed now shows gram positive cocci in cluster as the predominant organism and evidence of phagocytosis.","when_to_set_to_false":"Set to false if the patient's sputum gram stain performed now does not show gram positive cocci in cluster as the predominant organism and/or does not show evidence of phagocytosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's sputum gram stain performed now shows gram positive cocci in cluster as the predominant organism and evidence of phagocytosis.","meaning":"Boolean indicating whether the patient's sputum gram stain performed now shows gram positive cocci in cluster as the predominant organism and evidence of phagocytosis."} ;; "gram positive cocci in cluster predominant and phagocytosis"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (and
    patient_has_undergone_identification_of_organism_on_gram_stain_of_sputum_now
    (> sputum_gram_stain_polymorphonuclear_leukocyte_count_value_recorded_now_withunit_cells_per_low_power_field 25)
    (< sputum_gram_stain_epithelial_cell_count_value_recorded_now_withunit_cells_per_low_power_field 10)
    sputum_gram_stain_gram_positive_cocci_in_cluster_predominant_and_phagocytosis_present_now
))
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a sputum gram stain showing polymorphonuclear leukocyte count greater than 25) AND (the patient has a sputum gram stain showing epithelial cell count less than 10) AND (the patient has a sputum gram stain showing gram positive cocci in cluster predominant and phagocytosis)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any drug or medicament within the past 30 days prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not been exposed to any drug or medicament within the past 30 days prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any drug or medicament within the past 30 days prior to enrollment.","meaning":"Boolean indicating whether the patient has been exposed to any drug or medicament within the past 30 days."} ;; "has received any ... drug within 30 days prior to enrollment"
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days@@investigational_status Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient was exposed to within the past 30 days is investigational.","when_to_set_to_false":"Set to false if the drug or medicament the patient was exposed to within the past 30 days is not investigational.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is investigational.","meaning":"Boolean indicating whether the drug or medicament to which the patient was exposed within the past 30 days is investigational."} ;; "investigational drug within 30 days prior to enrollment"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthepast30days@@investigational_status
      patient_is_exposed_to_drug_or_medicament_inthepast30days)
:named REQ8_AUXILIARY0)) ;; "investigational drug within 30 days prior to enrollment"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_is_exposed_to_drug_or_medicament_inthepast30days@@investigational_status)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received any other investigational drug within 30 days prior to enrollment."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_is_exposed_to_cefoperazone_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to cefoperazone within the 30 days prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not been exposed to cefoperazone within the 30 days prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to cefoperazone within the 30 days prior to enrollment.","meaning":"Boolean indicating whether the patient has been exposed to cefoperazone in the 30 days prior to enrollment."} ;; "the patient has received cefoperazone within 30 days prior to enrollment"
(declare-const patient_has_taken_cefoperazone_and_sulbactam_containing_product_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any cefoperazone/sulbactam-containing product within the 30 days prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not taken any cefoperazone/sulbactam-containing product within the 30 days prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any cefoperazone/sulbactam-containing product within the 30 days prior to enrollment.","meaning":"Boolean indicating whether the patient has taken any cefoperazone/sulbactam-containing product in the 30 days prior to enrollment."} ;; "the patient has received cefoperazone/sulbactam within 30 days prior to enrollment"
(declare-const patient_is_exposed_to_cefepime_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to cefepime within the 30 days prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not been exposed to cefepime within the 30 days prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to cefepime within the 30 days prior to enrollment.","meaning":"Boolean indicating whether the patient has been exposed to cefepime in the 30 days prior to enrollment."} ;; "the patient has received cefepime within 30 days prior to enrollment"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_is_exposed_to_cefoperazone_inthepast30days)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received cefoperazone within 30 days prior to enrollment."

(assert
(! (not patient_has_taken_cefoperazone_and_sulbactam_containing_product_inthepast30days)
:named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received cefoperazone/sulbactam within 30 days prior to enrollment."

(assert
(! (not patient_is_exposed_to_cefepime_inthepast30days)
:named REQ9_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received cefepime within 30 days prior to enrollment."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_aspartate_transaminase_level_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value of the patient's aspartate aminotransferase (AST) level if a current measurement is available, in the specified unit.","when_to_set_to_null":"Set to null if no current AST measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current aspartate aminotransferase (AST) level in the specified unit."} ;; "aspartate aminotransferase level"
(declare-const patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value of the patient's alanine aminotransferase (ALT) level if a current measurement is available, in the specified unit.","when_to_set_to_null":"Set to null if no current ALT measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current alanine aminotransferase (ALT) level in the specified unit."} ;; "alanine aminotransferase level"
(declare-const patient_serum_creatinine_level_finding_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value of the patient's serum creatinine level if a current measurement is available, in the specified unit.","when_to_set_to_null":"Set to null if no current serum creatinine measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current serum creatinine level in the specified unit."} ;; "serum creatinine level"
(declare-const patient_urea_nitrogen_measurement_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value of the patient's urea nitrogen level if a current measurement is available, in the specified unit.","when_to_set_to_null":"Set to null if no current urea nitrogen measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current urea nitrogen level in the specified unit."} ;; "urea nitrogen level"

(declare-const upper_limit_of_normal_for_aspartate_transaminase_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the reference upper limit of normal for aspartate aminotransferase (AST) in the specified unit, as defined by the laboratory.","when_to_set_to_null":"Set to null if the upper limit of normal for AST is not available or not defined for the laboratory.","meaning":"Numeric value representing the upper limit of normal for aspartate aminotransferase (AST) in the specified unit."} ;; "upper limit of normal for aspartate aminotransferase"
(declare-const upper_limit_of_normal_for_alanine_aminotransferase_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the reference upper limit of normal for alanine aminotransferase (ALT) in the specified unit, as defined by the laboratory.","when_to_set_to_null":"Set to null if the upper limit of normal for ALT is not available or not defined for the laboratory.","meaning":"Numeric value representing the upper limit of normal for alanine aminotransferase (ALT) in the specified unit."} ;; "upper limit of normal for alanine aminotransferase"
(declare-const upper_limit_of_normal_for_serum_creatinine_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the reference upper limit of normal for serum creatinine in the specified unit, as defined by the laboratory.","when_to_set_to_null":"Set to null if the upper limit of normal for serum creatinine is not available or not defined for the laboratory.","meaning":"Numeric value representing the upper limit of normal for serum creatinine in the specified unit."} ;; "upper limit of normal for serum creatinine"
(declare-const upper_limit_of_normal_for_urea_nitrogen_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the reference upper limit of normal for urea nitrogen in the specified unit, as defined by the laboratory.","when_to_set_to_null":"Set to null if the upper limit of normal for urea nitrogen is not available or not defined for the laboratory.","meaning":"Numeric value representing the upper limit of normal for urea nitrogen in the specified unit."} ;; "upper limit of normal for urea nitrogen"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not (>= patient_aspartate_transaminase_level_value_recorded_now_withunit_unit
            (* 3 upper_limit_of_normal_for_aspartate_transaminase_withunit_unit)))
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has aspartate aminotransferase level greater than or equal to 3 times the upper limit of normal."

(assert
(! (not (>= patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_unit
            (* 3 upper_limit_of_normal_for_alanine_aminotransferase_withunit_unit)))
   :named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has alanine aminotransferase level greater than or equal to 3 times the upper limit of normal."

(assert
(! (not (> patient_serum_creatinine_level_finding_value_recorded_now_withunit_unit
           (* 3 upper_limit_of_normal_for_serum_creatinine_withunit_unit)))
   :named REQ10_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has serum creatinine level greater than 3 times the upper limit of normal."

(assert
(! (not (> patient_urea_nitrogen_measurement_value_recorded_now_withunit_unit
           (* 3 upper_limit_of_normal_for_urea_nitrogen_withunit_unit)))
   :named REQ10_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has urea nitrogen level greater than 3 times the upper limit of normal."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_allergy_to_penicillin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of allergy (hypersensitivity) to penicillin.","when_to_set_to_false":"Set to false if the patient has never had a documented history of allergy (hypersensitivity) to penicillin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of allergy to penicillin.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of allergy to penicillin."} ;; "the patient has a history of hypersensitivity to penicillin"
(declare-const patient_has_finding_of_allergy_to_cephalosporin_antibacterial_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of allergy (hypersensitivity) to cephalosporin antibacterial agents.","when_to_set_to_false":"Set to false if the patient has never had a documented history of allergy (hypersensitivity) to cephalosporin antibacterial agents.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of allergy to cephalosporin antibacterial agents.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of allergy to cephalosporin antibacterial agents."} ;; "the patient has a history of hypersensitivity to cephalosporin"
(declare-const patient_has_finding_of_allergy_to_carbapenem_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of allergy (hypersensitivity) to carbapenem.","when_to_set_to_false":"Set to false if the patient has never had a documented history of allergy (hypersensitivity) to carbapenem.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of allergy to carbapenem.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of allergy to carbapenem."} ;; "the patient has a history of hypersensitivity to carbapenem"
(declare-const patient_has_finding_of_allergy_to_beta_lactam_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of allergy (hypersensitivity) to beta-lactam.","when_to_set_to_false":"Set to false if the patient has never had a documented history of allergy (hypersensitivity) to beta-lactam.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of allergy (hypersensitivity) to beta-lactam.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of allergy (hypersensitivity) to beta-lactam."} ;; "the patient has a history of hypersensitivity to beta-lactam"
(declare-const patient_has_finding_of_allergy_to_beta_lactamase_inhibitor_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of allergy (hypersensitivity) to beta-lactamase inhibitor.","when_to_set_to_false":"Set to false if the patient has never had a documented history of allergy (hypersensitivity) to beta-lactamase inhibitor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of allergy (hypersensitivity) to beta-lactamase inhibitor.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of allergy (hypersensitivity) to beta-lactamase inhibitor."} ;; "the patient has a history of hypersensitivity to beta-lactamase inhibitor"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_finding_of_allergy_to_penicillin_inthehistory)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to penicillin."

(assert
(! (not patient_has_finding_of_allergy_to_cephalosporin_antibacterial_inthehistory)
:named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to cephalosporin."

(assert
(! (not patient_has_finding_of_allergy_to_carbapenem_inthehistory)
:named REQ11_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to carbapenem."

(assert
(! (not patient_has_finding_of_allergy_to_beta_lactam_inthehistory)
:named REQ11_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to beta-lactam."

(assert
(! (not patient_has_finding_of_allergy_to_beta_lactamase_inhibitor_inthehistory)
:named REQ11_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to beta-lactamase inhibitor."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_severe_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe disease of any type, as determined by clinical judgment or documentation, regardless of specific examples.","when_to_set_to_false":"Set to false if the patient currently does not have severe disease of any type.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe disease of any type.","meaning":"Boolean indicating whether the patient currently has severe disease of any type (not limited to specific examples)."} ;; "severe disease of any type (not limited to septic shock, acute respiratory distress syndrome, or multiple organ failure)"

(declare-const patient_has_finding_of_severe_disease_now@@may_limit_survival_during_therapy_and_followup_or_confound_study_results_as_judged_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient's severe disease may limit survival during therapy and follow-up period or confound the results of the study as judged by the investigator.","when_to_set_to_false":"Set to false if the patient's severe disease does not limit survival or confound study results as judged by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's severe disease may limit survival or confound study results as judged by the investigator.","meaning":"Boolean indicating whether the patient's severe disease may limit survival during therapy/follow-up or confound study results as judged by the investigator."} ;; "severe disease ... which may limit survival during therapy and follow-up period OR confound the results of the study as judged by the investigator"

(declare-const patient_has_finding_of_septic_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of septic shock.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of septic shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has septic shock.","meaning":"Boolean indicating whether the patient currently has septic shock."} ;; "septic shock"

(declare-const patient_has_finding_of_septic_shock_now@@may_limit_survival_during_therapy_and_followup_or_confound_study_results_as_judged_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient's septic shock may limit survival during therapy and follow-up period or confound the results of the study as judged by the investigator.","when_to_set_to_false":"Set to false if the patient's septic shock does not limit survival or confound study results as judged by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's septic shock may limit survival or confound study results as judged by the investigator.","meaning":"Boolean indicating whether the patient's septic shock may limit survival during therapy/follow-up or confound study results as judged by the investigator."} ;; "septic shock ... which may limit survival during therapy and follow-up period OR confound the results of the study as judged by the investigator"

(declare-const patient_has_finding_of_acute_respiratory_distress_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute respiratory distress syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute respiratory distress syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute respiratory distress syndrome.","meaning":"Boolean indicating whether the patient currently has acute respiratory distress syndrome."} ;; "acute respiratory distress syndrome"

(declare-const patient_has_finding_of_acute_respiratory_distress_syndrome_now@@may_limit_survival_during_therapy_and_followup_or_confound_study_results_as_judged_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient's acute respiratory distress syndrome may limit survival during therapy and follow-up period or confound the results of the study as judged by the investigator.","when_to_set_to_false":"Set to false if the patient's acute respiratory distress syndrome does not limit survival or confound study results as judged by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's acute respiratory distress syndrome may limit survival or confound study results as judged by the investigator.","meaning":"Boolean indicating whether the patient's acute respiratory distress syndrome may limit survival during therapy/follow-up or confound study results as judged by the investigator."} ;; "acute respiratory distress syndrome ... which may limit survival during therapy and follow-up period OR confound the results of the study as judged by the investigator"

(declare-const patient_has_finding_of_multiple_organ_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of multiple organ failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of multiple organ failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has multiple organ failure.","meaning":"Boolean indicating whether the patient currently has multiple organ failure."} ;; "multiple organ failure"

(declare-const patient_has_finding_of_multiple_organ_failure_now@@may_limit_survival_during_therapy_and_followup_or_confound_study_results_as_judged_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient's multiple organ failure may limit survival during therapy and follow-up period or confound the results of the study as judged by the investigator.","when_to_set_to_false":"Set to false if the patient's multiple organ failure does not limit survival or confound study results as judged by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's multiple organ failure may limit survival or confound study results as judged by the investigator.","meaning":"Boolean indicating whether the patient's multiple organ failure may limit survival during therapy/follow-up or confound study results as judged by the investigator."} ;; "multiple organ failure ... which may limit survival during therapy and follow-up period OR confound the results of the study as judged by the investigator"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_septic_shock_now@@may_limit_survival_during_therapy_and_followup_or_confound_study_results_as_judged_by_investigator
          patient_has_finding_of_acute_respiratory_distress_syndrome_now@@may_limit_survival_during_therapy_and_followup_or_confound_study_results_as_judged_by_investigator
          patient_has_finding_of_multiple_organ_failure_now@@may_limit_survival_during_therapy_and_followup_or_confound_study_results_as_judged_by_investigator)
    patient_has_finding_of_severe_disease_now@@may_limit_survival_during_therapy_and_followup_or_confound_study_results_as_judged_by_investigator)
:named REQ12_AUXILIARY0)) ;; "with non-exhaustive examples (septic shock, acute respiratory distress syndrome, multiple organ failure)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_severe_disease_now@@may_limit_survival_during_therapy_and_followup_or_confound_study_results_as_judged_by_investigator
      patient_has_finding_of_severe_disease_now)
:named REQ12_AUXILIARY1)) ;; "severe disease ... which may limit survival during therapy and follow-up period OR confound the results of the study as judged by the investigator"

(assert
(! (=> patient_has_finding_of_septic_shock_now@@may_limit_survival_during_therapy_and_followup_or_confound_study_results_as_judged_by_investigator
      patient_has_finding_of_septic_shock_now)
:named REQ12_AUXILIARY2)) ;; "septic shock ... which may limit survival during therapy and follow-up period OR confound the results of the study as judged by the investigator"

(assert
(! (=> patient_has_finding_of_acute_respiratory_distress_syndrome_now@@may_limit_survival_during_therapy_and_followup_or_confound_study_results_as_judged_by_investigator
      patient_has_finding_of_acute_respiratory_distress_syndrome_now)
:named REQ12_AUXILIARY3)) ;; "acute respiratory distress syndrome ... which may limit survival during therapy and follow-up period OR confound the results of the study as judged by the investigator"

(assert
(! (=> patient_has_finding_of_multiple_organ_failure_now@@may_limit_survival_during_therapy_and_followup_or_confound_study_results_as_judged_by_investigator
      patient_has_finding_of_multiple_organ_failure_now)
:named REQ12_AUXILIARY4)) ;; "multiple organ failure ... which may limit survival during therapy and follow-up period OR confound the results of the study as judged by the investigator"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_finding_of_severe_disease_now@@may_limit_survival_during_therapy_and_followup_or_confound_study_results_as_judged_by_investigator)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has severe disease with non-exhaustive examples (septic shock, acute respiratory distress syndrome, multiple organ failure) which may limit survival during therapy and follow-up period OR confound the results of the study as judged by the investigator)."
