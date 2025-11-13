;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is currently recorded as male.","when_to_set_to_false":"Set to false if the patient's sex is currently recorded as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is male as currently recorded."}  ;; "male"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is currently recorded as female.","when_to_set_to_false":"Set to false if the patient's sex is currently recorded as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female as currently recorded."}  ;; "female"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: The patient must be male or female.
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male or female."

;; Component 1: The patient must be aged ≥ 18 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_white_blood_cell_count_value_recorded_now_withunit_cells_per_microliter Real) ;; {"when_to_set_to_value":"Set to the measured leukocyte count value in cells per microliter if a current measurement is available.","when_to_set_to_null":"Set to null if no current leukocyte count measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current leukocyte count in cells per microliter."} ;; "leukocyte count ≥ 3000"
(declare-const patient_neutrophil_count_value_recorded_now_withunit_cells_per_microliter Real) ;; {"when_to_set_to_value":"Set to the measured neutrophil count value in cells per microliter if a current measurement is available.","when_to_set_to_null":"Set to null if no current neutrophil count measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current neutrophil count in cells per microliter."} ;; "neutrophil count ≥ 1500"
(declare-const patient_platelet_count_value_recorded_now_withunit_cells_per_microliter Real) ;; {"when_to_set_to_value":"Set to the measured platelet count value in cells per microliter if a current measurement is available.","when_to_set_to_null":"Set to null if no current platelet count measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current platelet count in cells per microliter."} ;; "platelet count ≥ 100,000"
(declare-const patient_aspartate_transaminase_level_value_recorded_now_withunit_units_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured AST level value in units per liter if a current measurement is available.","when_to_set_to_null":"Set to null if no current AST level measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current aspartate aminotransferase (AST) level in units per liter."} ;; "aspartate aminotransferase level ≤ 1.5 times the standard range of the institution"
(declare-const institution_standard_range_upper_limit_for_aspartate_aminotransferase_withunit_units_per_liter Real) ;; {"when_to_set_to_value":"Set to the numeric value of the institution's standard reference range upper limit for AST in units per liter.","when_to_set_to_null":"Set to null if the institution's standard reference range upper limit for AST is not available or indeterminate.","meaning":"Numeric value for the institution's standard reference range upper limit for AST in units per liter."} ;; "standard range of the institution (AST)"
(declare-const patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_units_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured ALT level value in units per liter if a current measurement is available.","when_to_set_to_null":"Set to null if no current ALT level measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current alanine aminotransferase (ALT) level in units per liter."} ;; "alanine aminotransferase level ≤ 1.5 times the standard range of the institution"
(declare-const institution_standard_range_upper_limit_for_alanine_aminotransferase_withunit_units_per_liter Real) ;; {"when_to_set_to_value":"Set to the numeric value of the institution's standard reference range upper limit for ALT in units per liter.","when_to_set_to_null":"Set to null if the institution's standard reference range upper limit for ALT is not available or indeterminate.","meaning":"Numeric value for the institution's standard reference range upper limit for ALT in units per liter."} ;; "standard range of the institution (ALT)"
(declare-const patient_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured creatinine level value in milligrams per deciliter if a current measurement is available.","when_to_set_to_null":"Set to null if no current creatinine level measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current creatinine level in milligrams per deciliter."} ;; "creatinine level ≤ 1.5 milligrams per deciliter"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: leukocyte count ≥ 3000
(assert
  (! (>= patient_white_blood_cell_count_value_recorded_now_withunit_cells_per_microliter 3000)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have leukocyte count ≥ 3000."

;; Component 1: neutrophil count ≥ 1500
(assert
  (! (>= patient_neutrophil_count_value_recorded_now_withunit_cells_per_microliter 1500)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have neutrophil count ≥ 1500."

;; Component 2: platelet count ≥ 100,000
(assert
  (! (>= patient_platelet_count_value_recorded_now_withunit_cells_per_microliter 100000)
     :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have platelet count ≥ 100,000."

;; Component 3: aspartate aminotransferase level ≤ 1.5 times the standard range of the institution
(assert
  (! (<= patient_aspartate_transaminase_level_value_recorded_now_withunit_units_per_liter
         (* 1.5 institution_standard_range_upper_limit_for_aspartate_aminotransferase_withunit_units_per_liter))
     :named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have aspartate aminotransferase level ≤ 1.5 times the standard range of the institution."

;; Component 4: alanine aminotransferase level ≤ 1.5 times the standard range of the institution
(assert
  (! (<= patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_units_per_liter
         (* 1.5 institution_standard_range_upper_limit_for_alanine_aminotransferase_withunit_units_per_liter))
     :named REQ1_COMPONENT4_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have alanine aminotransferase level ≤ 1.5 times the standard range of the institution."

;; Component 5: creatinine level ≤ 1.5 milligrams per deciliter
(assert
  (! (<= patient_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter 1.5)
     :named REQ1_COMPONENT5_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have creatinine level ≤ 1.5 milligrams per deciliter."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_space_occupying_lesion_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a space-occupying lesion of the liver.","when_to_set_to_false":"Set to false if the patient currently does not have a space-occupying lesion of the liver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a space-occupying lesion of the liver.","meaning":"Boolean indicating whether the patient currently has a space-occupying lesion of the liver."} ;; "liver space occupying lesion"
(declare-const patient_has_finding_of_space_occupying_lesion_of_liver_now@@requires_extended_hepatic_resection Bool) ;; {"when_to_set_to_true":"Set to true if the patient's space-occupying lesion of the liver requires extended hepatic resection.","when_to_set_to_false":"Set to false if the patient's space-occupying lesion of the liver does not require extended hepatic resection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's space-occupying lesion of the liver requires extended hepatic resection.","meaning":"Boolean indicating whether the patient's space-occupying lesion of the liver requires extended hepatic resection."} ;; "requires extended hepatic resection"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_space_occupying_lesion_of_liver_now@@requires_extended_hepatic_resection
         patient_has_finding_of_space_occupying_lesion_of_liver_now)
     :named REQ2_AUXILIARY0)) ;; "a liver space occupying lesion that requires extended hepatic resection"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_space_occupying_lesion_of_liver_now@@requires_extended_hepatic_resection
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "a liver space occupying lesion that requires extended hepatic resection"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_liver_damage_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of liver damage.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of liver damage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has liver damage.","meaning":"Boolean indicating whether the patient currently has liver damage."} ;; "To be included, the patient must have at least one of the following five types of liver damage, each of which must be submitted prior to liver volumetry"
(declare-const patient_has_finding_of_metastatic_disease_requiring_subsidiary_right_hepatectomy_extended_to_segment_iv_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has metastatic disease requiring subsidiary right hepatectomy extended to segment IV.","when_to_set_to_false":"Set to false if the patient currently does not have metastatic disease requiring subsidiary right hepatectomy extended to segment IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has metastatic disease requiring subsidiary right hepatectomy extended to segment IV.","meaning":"Boolean indicating whether the patient currently has metastatic disease requiring subsidiary right hepatectomy extended to segment IV."} ;; "(1) metastatic disease requiring subsidiary right hepatectomy extended to segment IV"
(declare-const patient_has_finding_of_metastatic_disease_requiring_subsidiary_right_hepatectomy_with_suspected_diseased_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has metastatic disease requiring subsidiary right hepatectomy with suspected diseased liver.","when_to_set_to_false":"Set to false if the patient currently does not have metastatic disease requiring subsidiary right hepatectomy with suspected diseased liver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has metastatic disease requiring subsidiary right hepatectomy with suspected diseased liver.","meaning":"Boolean indicating whether the patient currently has metastatic disease requiring subsidiary right hepatectomy with suspected diseased liver."} ;; "(2) metastatic disease requiring subsidiary right hepatectomy with suspected diseased liver (neoadjuvant chemotherapy)"
(declare-const patient_has_finding_of_metastatic_disease_requiring_subsidiary_right_hepatectomy_with_suspected_diseased_liver_now@@with_neoadjuvant_chemotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received neoadjuvant chemotherapy for metastatic disease requiring subsidiary right hepatectomy with suspected diseased liver.","when_to_set_to_false":"Set to false if the patient has not received neoadjuvant chemotherapy for metastatic disease requiring subsidiary right hepatectomy with suspected diseased liver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received neoadjuvant chemotherapy for metastatic disease requiring subsidiary right hepatectomy with suspected diseased liver.","meaning":"Boolean indicating whether the patient has received neoadjuvant chemotherapy for metastatic disease requiring subsidiary right hepatectomy with suspected diseased liver."} ;; "(2) ... (neoadjuvant chemotherapy)"
(declare-const patient_has_finding_of_bilobar_liver_metastases_with_multiple_nodules_in_right_lobe_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bilobar liver metastases with multiple nodules in the right lobe.","when_to_set_to_false":"Set to false if the patient currently does not have bilobar liver metastases with multiple nodules in the right lobe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bilobar liver metastases with multiple nodules in the right lobe.","meaning":"Boolean indicating whether the patient currently has bilobar liver metastases with multiple nodules in the right lobe."} ;; "(3) bilobar liver metastases with multiple nodules in the right lobe"
(declare-const patient_has_nodule_count_in_left_hepatic_lobe_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of nodules in the patient's left hepatic lobe recorded now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many nodules are in the patient's left hepatic lobe recorded now.","meaning":"Numeric variable indicating the number of nodules in the patient's left hepatic lobe recorded now, unit: count."} ;; "(3) ... more than 3 nodules ... in the left hepatic lobe"
(declare-const patient_has_nodule_size_in_left_hepatic_lobe_value_recorded_now_withunit_millimeter Real) ;; {"when_to_set_to_value":"Set to the size in millimeters of each nodule in the patient's left hepatic lobe recorded now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the size in millimeters is of each nodule in the patient's left hepatic lobe recorded now.","meaning":"Numeric variable indicating the size in millimeters of each nodule in the patient's left hepatic lobe recorded now."} ;; "(3) ... nodules greater than 30 millimeters in the left hepatic lobe"
(declare-const patient_will_undergo_lumpectomy_of_left_hepatic_lobe_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to undergo lumpectomy of the left hepatic lobe in the future.","when_to_set_to_false":"Set to false if the patient is not scheduled to undergo lumpectomy of the left hepatic lobe in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will undergo lumpectomy of the left hepatic lobe in the future.","meaning":"Boolean indicating whether the patient will undergo lumpectomy of the left hepatic lobe in the future."} ;; "(3) ... will require lumpectomies of the left hepatic lobe"
(declare-const patient_will_undergo_right_portal_branch_ligation_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to undergo right portal branch ligation in the future.","when_to_set_to_false":"Set to false if the patient is not scheduled to undergo right portal branch ligation in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will undergo right portal branch ligation in the future.","meaning":"Boolean indicating whether the patient will undergo right portal branch ligation in the future."} ;; "(3) ... right portal branch ligation"
(declare-const patient_will_undergo_embolization_procedure_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to undergo embolization procedure in the future.","when_to_set_to_false":"Set to false if the patient is not scheduled to undergo embolization procedure in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will undergo embolization procedure in the future.","meaning":"Boolean indicating whether the patient will undergo embolization procedure in the future."} ;; "(3) ... or postoperative percutaneous embolization"
(declare-const patient_will_undergo_right_hepatectomy_in_4_to_6_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to undergo right hepatectomy in 4 to 6 weeks as the second stage of two stage surgery.","when_to_set_to_false":"Set to false if the patient is not scheduled to undergo right hepatectomy in 4 to 6 weeks as the second stage of two stage surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will undergo right hepatectomy in 4 to 6 weeks as the second stage of two stage surgery.","meaning":"Boolean indicating whether the patient will undergo right hepatectomy in 4 to 6 weeks as the second stage of two stage surgery."} ;; "(3) ... right hepatectomy 4-6 weeks later (two stage surgery)"
(declare-const patient_has_finding_of_subsidiary_hepatocarcinoma_requiring_extended_right_hepatectomy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has subsidiary hepatocarcinoma requiring extended right hepatectomy.","when_to_set_to_false":"Set to false if the patient currently does not have subsidiary hepatocarcinoma requiring extended right hepatectomy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has subsidiary hepatocarcinoma requiring extended right hepatectomy.","meaning":"Boolean indicating whether the patient currently has subsidiary hepatocarcinoma requiring extended right hepatectomy."} ;; "(4) subsidiary hepatocarcinoma requiring extended right hepatectomy"
(declare-const patient_has_finding_of_liver_injury_threatening_viability_of_remaining_liver_tissue_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has liver injury (benign or malignant) which by extension threatens the viability of the remaining liver tissue.","when_to_set_to_false":"Set to false if the patient currently does not have liver injury (benign or malignant) which by extension threatens the viability of the remaining liver tissue.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has liver injury (benign or malignant) which by extension threatens the viability of the remaining liver tissue.","meaning":"Boolean indicating whether the patient currently has liver injury (benign or malignant) which by extension threatens the viability of the remaining liver tissue."} ;; "(5) liver injury, benign (e.g., hemangiomas, hydatid cysts) or malignant (e.g., liver tumors, primary bile hepatoblastoma), which by extension threatens the viability of the remaining liver tissue."

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; (2) Neoadjuvant chemotherapy is a qualifier for (2)
(assert
  (! (=> patient_has_finding_of_metastatic_disease_requiring_subsidiary_right_hepatectomy_with_suspected_diseased_liver_now@@with_neoadjuvant_chemotherapy
         patient_has_finding_of_metastatic_disease_requiring_subsidiary_right_hepatectomy_with_suspected_diseased_liver_now)
     :named REQ3_AUXILIARY0)) ;; "metastatic disease requiring subsidiary right hepatectomy with suspected diseased liver (neoadjuvant chemotherapy)"

;; (3) Bilobar liver metastases with multiple nodules in right lobe AND >3 nodules >30mm in left lobe, AND will require lumpectomies of left lobe AND (right portal branch ligation OR embolization), AND right hepatectomy in 4-6 weeks
(define-fun REQ3_bilobar_metastases_complex_condition () Bool
  (and patient_has_finding_of_bilobar_liver_metastases_with_multiple_nodules_in_right_lobe_now
       (> patient_has_nodule_count_in_left_hepatic_lobe_value_recorded_now_withunit_count 3.0)
       (> patient_has_nodule_size_in_left_hepatic_lobe_value_recorded_now_withunit_millimeter 30.0)
       patient_will_undergo_lumpectomy_of_left_hepatic_lobe_inthefuture
       (or patient_will_undergo_right_portal_branch_ligation_inthefuture
           patient_will_undergo_embolization_procedure_inthefuture)
       patient_will_undergo_right_hepatectomy_in_4_to_6_weeks)) ;; "(3) bilobar liver metastases ..."

;; (5) is a specific type of liver damage
(assert
  (! (=> patient_has_finding_of_liver_injury_threatening_viability_of_remaining_liver_tissue_now
         patient_has_finding_of_liver_damage_now)
     :named REQ3_AUXILIARY1)) ;; "(5) liver injury ... threatens the viability of the remaining liver tissue"

;; (1), (2), (3), (4), (5) are exhaustive subcategories of "liver damage" for this criterion
(assert
  (! (= patient_has_finding_of_liver_damage_now
        (or patient_has_finding_of_metastatic_disease_requiring_subsidiary_right_hepatectomy_extended_to_segment_iv_now
            patient_has_finding_of_metastatic_disease_requiring_subsidiary_right_hepatectomy_with_suspected_diseased_liver_now
            REQ3_bilobar_metastases_complex_condition
            patient_has_finding_of_subsidiary_hepatocarcinoma_requiring_extended_right_hepatectomy_now
            patient_has_finding_of_liver_injury_threatening_viability_of_remaining_liver_tissue_now))
     :named REQ3_AUXILIARY2)) ;; "five types of liver damage" are exhaustive for this criterion

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_finding_of_liver_damage_now
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have at least one of the following five types of liver damage, each of which must be submitted prior to liver volumetry"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_given_written_informed_consent_for_study_participation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has given written informed consent for participation in the study.","when_to_set_to_false":"Set to false if the patient has not given written informed consent for participation in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has given written informed consent for participation in the study.","meaning":"Boolean indicating whether the patient has given written informed consent for participation in the study."} ;; "give written informed consent for participation in the study"
(declare-const patient_has_provided_sufficient_guarantees_of_adherence_to_protocol_per_investigator_opinion Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided sufficient guarantees of adherence to protocol, as judged by the investigator in charge of the patient's care.","when_to_set_to_false":"Set to false if the patient has not provided sufficient guarantees of adherence to protocol, as judged by the investigator in charge of the patient's care.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided sufficient guarantees of adherence to protocol, as judged by the investigator in charge of the patient's care.","meaning":"Boolean indicating whether the patient has provided sufficient guarantees of adherence to protocol, according to the opinion of the investigator in charge of the patient's care."} ;; "provide sufficient guarantees of adherence to protocol according to the opinion of the investigator in charge of the patient care"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_given_written_informed_consent_for_study_participation
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "give written informed consent for participation in the study"

(assert
  (! patient_has_provided_sufficient_guarantees_of_adherence_to_protocol_per_investigator_opinion
     :named REQ4_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "provide sufficient guarantees of adherence to protocol according to the opinion of the investigator in charge of the patient care"
