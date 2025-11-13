;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_kidney_disease_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's kidney disease is clinically significant.","when_to_set_to_false":"Set to false if the patient's kidney disease is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's kidney disease is clinically significant.","meaning":"Boolean indicating whether the patient's kidney disease is clinically significant."} ;; "clinically significant renal disease"
(declare-const patient_has_finding_of_disease_of_liver_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's liver disease is clinically significant.","when_to_set_to_false":"Set to false if the patient's liver disease is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's liver disease is clinically significant.","meaning":"Boolean indicating whether the patient's liver disease is clinically significant."} ;; "clinically significant hepatic disease"
(declare-const patient_has_finding_of_disorder_of_nervous_system_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's nervous system disorder is clinically significant.","when_to_set_to_false":"Set to false if the patient's nervous system disorder is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's nervous system disorder is clinically significant.","meaning":"Boolean indicating whether the patient's nervous system disorder is clinically significant."} ;; "clinically significant neurological disease"
(declare-const patient_has_finding_of_disorder_of_cardiovascular_system_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cardiovascular system disorder is clinically significant.","when_to_set_to_false":"Set to false if the patient's cardiovascular system disorder is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cardiovascular system disorder is clinically significant.","meaning":"Boolean indicating whether the patient's cardiovascular system disorder is clinically significant."} ;; "clinically significant cardiovascular disease"
(declare-const patient_has_finding_of_disorder_of_lung_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's lung disorder is clinically significant.","when_to_set_to_false":"Set to false if the patient's lung disorder is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's lung disorder is clinically significant.","meaning":"Boolean indicating whether the patient's lung disorder is clinically significant."} ;; "clinically significant pulmonary disease"
(declare-const patient_has_finding_of_disorder_of_endocrine_system_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's endocrine system disorder is clinically significant.","when_to_set_to_false":"Set to false if the patient's endocrine system disorder is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's endocrine system disorder is clinically significant.","meaning":"Boolean indicating whether the patient's endocrine system disorder is clinically significant."} ;; "clinically significant endocrinologic disease"
(declare-const patient_has_finding_of_mental_disorder_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's mental disorder is clinically significant.","when_to_set_to_false":"Set to false if the patient's mental disorder is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's mental disorder is clinically significant.","meaning":"Boolean indicating whether the patient's mental disorder is clinically significant."} ;; "clinically significant psychiatric disease"
(declare-const patient_has_finding_of_disorder_of_cellular_component_of_blood_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's blood cell disorder is clinically significant.","when_to_set_to_false":"Set to false if the patient's blood cell disorder is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's blood cell disorder is clinically significant.","meaning":"Boolean indicating whether the patient's blood cell disorder is clinically significant."} ;; "clinically significant hematologic disease"
(declare-const patient_has_finding_of_disorder_of_urinary_tract_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's urinary tract disorder is clinically significant.","when_to_set_to_false":"Set to false if the patient's urinary tract disorder is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's urinary tract disorder is clinically significant.","meaning":"Boolean indicating whether the patient's urinary tract disorder is clinically significant."} ;; "clinically significant urologic disease"
(declare-const patient_has_finding_of_acute_disease_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's acute illness is clinically significant.","when_to_set_to_false":"Set to false if the patient's acute illness is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's acute illness is clinically significant.","meaning":"Boolean indicating whether the patient's acute illness is clinically significant."} ;; "clinically significant acute illness"
(declare-const patient_has_finding_of_acute_disease_now@@unsuitable_for_trial_in_investigator_opinion Bool) ;; {"when_to_set_to_true":"Set to true if, in the investigator's opinion, the patient's acute illness would make the patient unsuitable for the trial.","when_to_set_to_false":"Set to false if, in the investigator's opinion, the patient's acute illness would not make the patient unsuitable for the trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether, in the investigator's opinion, the patient's acute illness would make the patient unsuitable for the trial.","meaning":"Boolean indicating whether, in the investigator's opinion, the patient's acute illness would make the patient unsuitable for the trial."} ;; "any other clinically significant acute illness that in the opinion of the investigator would make the patient an unsuitable candidate for this trial"
(declare-const patient_has_finding_of_chronic_disease_now@@unsuitable_for_trial_in_investigator_opinion Bool) ;; {"when_to_set_to_true":"Set to true if, in the investigator's opinion, the patient's chronic illness would make the patient unsuitable for the trial.","when_to_set_to_false":"Set to false if, in the investigator's opinion, the patient's chronic illness would not make the patient unsuitable for the trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether, in the investigator's opinion, the patient's chronic illness would make the patient unsuitable for the trial.","meaning":"Boolean indicating whether, in the investigator's opinion, the patient's chronic illness would make the patient unsuitable for the trial."} ;; "any other clinically significant chronic illness that in the opinion of the investigator would make the patient an unsuitable candidate for this trial"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_kidney_disease_now@@clinically_significant)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any clinically significant renal disease."

(assert
(! (not patient_has_finding_of_disease_of_liver_now@@clinically_significant)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any clinically significant hepatic disease."

(assert
(! (not patient_has_finding_of_disorder_of_nervous_system_now@@clinically_significant)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any clinically significant neurological disease."

(assert
(! (not patient_has_finding_of_disorder_of_cardiovascular_system_now@@clinically_significant)
:named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any clinically significant cardiovascular disease."

(assert
(! (not patient_has_finding_of_disorder_of_lung_now@@clinically_significant)
:named REQ0_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any clinically significant pulmonary disease."

(assert
(! (not patient_has_finding_of_disorder_of_endocrine_system_now@@clinically_significant)
:named REQ0_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any clinically significant endocrinologic disease."

(assert
(! (not patient_has_finding_of_mental_disorder_now@@clinically_significant)
:named REQ0_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any clinically significant psychiatric disease."

(assert
(! (not patient_has_finding_of_disorder_of_cellular_component_of_blood_now@@clinically_significant)
:named REQ0_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any clinically significant hematologic disease."

(assert
(! (not patient_has_finding_of_disorder_of_urinary_tract_now@@clinically_significant)
:named REQ0_COMPONENT8_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any clinically significant urologic disease."

(assert
(! (not (and patient_has_finding_of_acute_disease_now@@clinically_significant
             patient_has_finding_of_acute_disease_now@@unsuitable_for_trial_in_investigator_opinion))
:named REQ0_COMPONENT9_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any other clinically significant acute illness that in the opinion of the investigator would make the patient an unsuitable candidate for this trial."

(assert
(! (not patient_has_finding_of_chronic_disease_now@@unsuitable_for_trial_in_investigator_opinion)
:named REQ0_COMPONENT10_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any other clinically significant chronic illness that in the opinion of the investigator would make the patient an unsuitable candidate for this trial."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if there is documented evidence that the patient is currently pregnant (e.g., positive serum pregnancy test).","when_to_set_to_false":"Set to false if there is documented evidence that the patient is currently not pregnant (e.g., negative serum pregnancy test).","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "has a positive serum pregnancy test"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} ;; "the patient is a woman"
(declare-const serum_pregnancy_test_result_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current serum pregnancy test result is positive.","when_to_set_to_false":"Set to false if the patient's current serum pregnancy test result is negative.","when_to_set_to_null":"Set to null if the patient's current serum pregnancy test result is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient's current serum pregnancy test result is positive."} ;; "serum pregnancy test result"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: patient_is_pregnant_now is true if serum_pregnancy_test_result_now is positive
(assert
(! (= patient_is_pregnant_now serum_pregnancy_test_result_now)
:named REQ1_AUXILIARY0)) ;; "has a positive serum pregnancy test"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient is a woman AND has a positive serum pregnancy test
(assert
(! (not (and patient_sex_is_female_now patient_is_pregnant_now))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman who has a positive serum pregnancy test."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breast-feeding as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not breast-feeding as documented or reported.","when_to_set_to_null":"Set to null if the patient's current breast-feeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breast-feeding."} ;; "the patient is breast-feeding"
(declare-const patients_breastfeeding_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breast-feeding.","when_to_set_to_false":"Set to false if the patient is currently not breast-feeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently breast-feeding.","meaning":"Boolean indicating whether the patient is currently breast-feeding."} ;; "breast-feeding"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Link observable entity to main variable
(assert
(! (= patient_is_breastfeeding_now patients_breastfeeding_is_positive_now)
:named REQ2_AUXILIARY0)) ;; "the patient is breast-feeding"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient is a woman AND is breast-feeding
(assert
(! (not (and patient_sex_is_female_now patient_is_breastfeeding_now))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman who is breast-feeding."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently capable of becoming pregnant (i.e., has childbearing potential).","when_to_set_to_false":"Set to false if the patient is currently not capable of becoming pregnant (e.g., postmenopausal, surgically sterile, or otherwise lacks childbearing potential).","when_to_set_to_null":"Set to null if the patient's current childbearing potential status is unknown or cannot be determined.","meaning":"Boolean indicating whether the patient currently has childbearing potential."} ;; "woman of childbearing potential"
(declare-const patient_has_finding_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently agrees to use contraception.","when_to_set_to_false":"Set to false if the patient currently does not agree to use contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently agrees to use contraception.","meaning":"Boolean indicating whether the patient currently agrees to use contraception."} ;; "contraception"
(declare-const patient_has_finding_of_contraception_now@@two_forms_used Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently agrees to use two forms of contraception.","when_to_set_to_false":"Set to false if the patient currently does not agree to use two forms of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently agrees to use two forms of contraception.","meaning":"Boolean indicating whether the patient currently agrees to use two forms of contraception."} ;; "two forms of contraception"
(declare-const patient_has_finding_of_contraception_now@@used_during_study_and_followup_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently agrees to use contraception during the course of the study and follow-up period.","when_to_set_to_false":"Set to false if the patient currently does not agree to use contraception during the course of the study and follow-up period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently agrees to use contraception during the course of the study and follow-up period.","meaning":"Boolean indicating whether the patient currently agrees to use contraception during the course of the study and follow-up period."} ;; "contraception during the course of the study and follow-up period"
(declare-const patient_has_finding_of_contraception_now@@two_forms_used@@used_during_study_and_followup_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently agrees to use two forms of contraception during the course of the study and follow-up period.","when_to_set_to_false":"Set to false if the patient currently does not agree to use two forms of contraception during the course of the study and follow-up period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently agrees to use two forms of contraception during the course of the study and follow-up period.","meaning":"Boolean indicating whether the patient currently agrees to use two forms of contraception during the course of the study and follow-up period."} ;; "two forms of contraception during the course of the study and follow-up period"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently male.","when_to_set_to_false":"Set to false if the patient is currently not male.","when_to_set_to_null":"Set to null if the patient's current sex is unknown or cannot be determined.","meaning":"Boolean indicating whether the patient is currently male."} ;; "the patient is a man"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} ;; "the patient is a woman"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_contraception_now@@two_forms_used
      patient_has_finding_of_contraception_now)
:named REQ3_AUXILIARY0)) ;; "two forms of contraception"

(assert
(! (=> patient_has_finding_of_contraception_now@@used_during_study_and_followup_period
      patient_has_finding_of_contraception_now)
:named REQ3_AUXILIARY1)) ;; "contraception during the course of the study and follow-up period"

(assert
(! (=> patient_has_finding_of_contraception_now@@two_forms_used@@used_during_study_and_followup_period
      (and patient_has_finding_of_contraception_now@@two_forms_used
           patient_has_finding_of_contraception_now@@used_during_study_and_followup_period))
:named REQ3_AUXILIARY2)) ;; "two forms of contraception during the course of the study and follow-up period"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion for women of childbearing potential who do NOT agree to use two forms of contraception during the study and follow-up period
(assert
(! (not (and patient_sex_is_female_now
             patient_has_childbearing_potential_now
             (not patient_has_finding_of_contraception_now@@two_forms_used@@used_during_study_and_followup_period)))
:named REQ3_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is a woman of childbearing potential who does NOT agree to use two forms of contraception during the course of the study and follow-up period."

;; Exclusion for men who do NOT agree to use two forms of contraception during the study and follow-up period
(assert
(! (not (and patient_sex_is_male_now
             (not patient_has_finding_of_contraception_now@@two_forms_used@@used_during_study_and_followup_period)))
:named REQ3_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is a man who does NOT agree to use two forms of contraception during the course of the study and follow-up period."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_hypersensitivity_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypersensitivity (of any cause).","when_to_set_to_false":"Set to false if the patient currently does not have hypersensitivity (of any cause).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypersensitivity.","meaning":"Boolean indicating whether the patient currently has hypersensitivity (of any cause) now."} ;; "hypersensitivity"
(declare-const patient_has_finding_of_hypersensitivity_condition_now@@to_any_component_of_sta_5326_mesylate_drug_product Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hypersensitivity is specifically to any component of STA-5326 mesylate drug product.","when_to_set_to_false":"Set to false if the patient's current hypersensitivity is not to any component of STA-5326 mesylate drug product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hypersensitivity is to any component of STA-5326 mesylate drug product.","meaning":"Boolean indicating whether the patient's current hypersensitivity is specifically to any component of STA-5326 mesylate drug product."} ;; "hypersensitivity to any component of STA-5326 mesylate drug product"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_finding_of_hypersensitivity_condition_now@@to_any_component_of_sta_5326_mesylate_drug_product
       patient_has_finding_of_hypersensitivity_condition_now)
   :named REQ4_AUXILIARY0)) ;; "hypersensitivity to any component of STA-5326 mesylate drug product" implies "hypersensitivity"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_hypersensitivity_condition_now@@to_any_component_of_sta_5326_mesylate_drug_product)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypersensitivity to any component of STA-5326 mesylate drug product."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_blood_chemistry_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any abnormal clinical chemistry value.","when_to_set_to_false":"Set to false if the patient currently does not have any abnormal clinical chemistry value.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any abnormal clinical chemistry value.","meaning":"Boolean indicating whether the patient currently has any abnormal clinical chemistry value."} ;; "abnormal clinical chemistry value"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_blood_chemistry_abnormal_now)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has any abnormal clinical chemistry value as specified below)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const aspartate_aminotransferase_value_recorded_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the patient's current aspartate aminotransferase (AST) value in U/L if measured and available.","when_to_set_to_null":"Set to null if the patient's current AST value is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current aspartate aminotransferase (AST) level in U/L."} ;; "aspartate aminotransferase level"

(declare-const upper_limit_of_normal_for_aspartate_aminotransferase_value_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the laboratory-defined upper limit of normal for AST in U/L if available.","when_to_set_to_null":"Set to null if the upper limit of normal for AST is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the laboratory-defined upper limit of normal for AST in U/L."} ;; "upper limit of normal for aspartate aminotransferase"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not (> aspartate_aminotransferase_value_recorded_now_withunit_u_per_l
             (* 2.5 upper_limit_of_normal_for_aspartate_aminotransferase_value_withunit_u_per_l)))
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an aspartate aminotransferase level > 2.5 × the upper limit of normal."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric alanine aminotransferase (ALT) measurement is recorded for the patient now, in the specified unit.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current alanine aminotransferase (ALT) measurement in the specified unit."} ;; "alanine aminotransferase level"
(declare-const upper_limit_of_normal_for_alanine_aminotransferase_value_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the reference value for the upper limit of normal for ALT if available for the patient now, in the specified unit.","when_to_set_to_null":"Set to null if the reference value is not available or indeterminate.","meaning":"Numeric value representing the current upper limit of normal for ALT in the specified unit."} ;; "upper limit of normal for alanine aminotransferase"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not (> patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_unit
             (* 2.5 upper_limit_of_normal_for_alanine_aminotransferase_value_now_withunit_unit)))
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an alanine aminotransferase level > 2.5 × the upper limit of normal."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_serum_bilirubin_level_finding_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current serum bilirubin level in mg/dL is available.","when_to_set_to_null":"Set to null if no current serum bilirubin level measurement in mg/dL is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum bilirubin level in mg/dL."} ;; "serum bilirubin level"
(declare-const upper_limit_of_normal_for_serum_bilirubin_level_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the laboratory reference value for the upper limit of normal for serum bilirubin level in mg/dL if available.","when_to_set_to_null":"Set to null if the laboratory reference value for the upper limit of normal for serum bilirubin level in mg/dL is not available or indeterminate.","meaning":"Numeric value representing the current upper limit of normal for serum bilirubin level in mg/dL."} ;; "upper limit of normal for serum bilirubin level"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (not (> patient_serum_bilirubin_level_finding_value_recorded_now_withunit_mg_per_dl
             (* 1.5 upper_limit_of_normal_for_serum_bilirubin_level_now_withunit_mg_per_dl)))
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a serum bilirubin level > 1.5 × the upper limit of normal."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_serum_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's serum creatinine level is recorded now in mg/dL.","when_to_set_to_null":"Set to null if no current serum creatinine measurement in mg/dL is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum creatinine level in mg/dL."} ;; "serum creatinine level"
(declare-const upper_limit_of_normal_for_serum_creatinine_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the laboratory-defined upper limit of normal for serum creatinine in mg/dL if available for the patient at the current time.","when_to_set_to_null":"Set to null if the laboratory reference range for serum creatinine is not available or indeterminate for the patient at the current time.","meaning":"Numeric value representing the current upper limit of normal for serum creatinine in mg/dL."} ;; "upper limit of normal for serum creatinine"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (not (> patient_serum_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl
             (* 1.5 upper_limit_of_normal_for_serum_creatinine_now_withunit_mg_per_dl)))
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a serum creatinine level > 1.5 × the upper limit of normal."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_alkaline_phosphatase_level_finding_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's alkaline phosphatase level is recorded now in the specified unit.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current alkaline phosphatase level measurement, recorded now, in the specified unit."} ;; "alkaline phosphatase level"
(declare-const upper_limit_of_normal_for_alkaline_phosphatase_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the reference value for the upper limit of normal for alkaline phosphatase if available for the current measurement and in the specified unit.","when_to_set_to_null":"Set to null if the reference value for the upper limit of normal is not available or indeterminate.","meaning":"Numeric value representing the current upper limit of normal (ULN) for alkaline phosphatase, in the specified unit."} ;; "upper limit of normal (ULN) for alkaline phosphatase"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not (> patient_alkaline_phosphatase_level_finding_value_recorded_now_withunit_unit
           (* 2.5 upper_limit_of_normal_for_alkaline_phosphatase_now_withunit_unit)))
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has an alkaline phosphatase level greater than 2.5 times the upper limit of normal (ULN)."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_hemoglobin_finding_value_recorded_now_withunit_grams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's hemoglobin concentration in grams per deciliter is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current hemoglobin concentration in grams per deciliter."} ;; "hemoglobin level < 9 grams per deciliter"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! (not (< patient_hemoglobin_finding_value_recorded_now_withunit_grams_per_deciliter 9))
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a hemoglobin level < 9 grams per deciliter."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_hematocrit_pcv_level_finding_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a current hematocrit (packed cell volume) level is available for the patient.","when_to_set_to_null":"Set to null if no current hematocrit (packed cell volume) percentage measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current hematocrit (packed cell volume) level."} ;; "hematocrit level < 30 percent."

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not (< patient_hematocrit_pcv_level_finding_value_recorded_now_withunit_percent 30))
    :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a hematocrit level < 30 percent."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_international_normalized_ratio_value_recorded_now_withunit_none Real) ;; {"when_to_set_to_value":"Set to the measured INR value if a current prothrombin time international normalized ratio (INR) is available for the patient.","when_to_set_to_null":"Set to null if no current INR measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current prothrombin time international normalized ratio (INR)."} ;; "international normalized ratio"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
  (! (not (> patient_international_normalized_ratio_value_recorded_now_withunit_none 1.3))
     :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a prothrombin time international normalized ratio > 1.3."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const control_partial_thromboplastin_time_value_recorded_now_withunit_seconds Real) ;; {"when_to_set_to_value":"Set to the measured value in seconds if the control partial thromboplastin time is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the control partial thromboplastin time in seconds, recorded at the current time."} ;; "control value"
(declare-const patient_partial_thromboplastin_time_finding_value_recorded_now_withunit_seconds Real) ;; {"when_to_set_to_value":"Set to the measured value in seconds if the patient's partial thromboplastin time is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current partial thromboplastin time in seconds."} ;; "partial thromboplastin time"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not (> (- patient_partial_thromboplastin_time_finding_value_recorded_now_withunit_seconds control_partial_thromboplastin_time_value_recorded_now_withunit_seconds) 3))
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a partial thromboplastin time > 3 seconds compared to control value."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_undergone_cell_count_now_outcome_is_abnormal Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a cell count procedure now and the outcome is abnormal.","when_to_set_to_false":"Set to false if the patient has undergone a cell count procedure now and the outcome is not abnormal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a cell count procedure now with an abnormal outcome.","meaning":"Boolean indicating whether the patient has undergone a cell count procedure now and the outcome is abnormal."} ;; "cell count"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_undergone_cell_count_now_outcome_is_abnormal)
:named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any abnormal cell count as specified below."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_platelet_count_finding_value_recorded_now_withunit_cells_per_microliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's platelet count in cells per microliter is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current platelet count in cells per microliter measured now."} ;; "platelet count < 90,000 cells per microliter"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not (< patient_platelet_count_finding_value_recorded_now_withunit_cells_per_microliter 90000))
    :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a platelet count < 90,000 cells per microliter."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
;; Reuse existing variable for platelet count
;; (already declared)
;; (declare-const patient_platelet_count_finding_value_recorded_now_withunit_cells_per_microliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's platelet count in cells per microliter is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current platelet count in cells per microliter measured now."} ;; "platelet count < 90,000 cells per microliter"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
  (! (not (> patient_platelet_count_finding_value_recorded_now_withunit_cells_per_microliter 800000))
     :named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a platelet count > 800,000 cells per microliter."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_white_blood_cell_number_finding_value_recorded_now_withunit_cells_per_microliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current white blood cell count in cells per microliter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current white blood cell count in cells per microliter."} ;; "white blood cell count < 1,500 cells per microliter."

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
  (! (not (< patient_white_blood_cell_number_finding_value_recorded_now_withunit_cells_per_microliter 1500))
     :named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a white blood cell count < 1,500 cells per microliter."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_neutrophil_count_value_recorded_now_withunit_cells_per_microliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's neutrophil count in cells per microliter is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current neutrophil count in cells per microliter."} ;; "neutrophil count < 900 cells per microliter"

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not (< patient_neutrophil_count_value_recorded_now_withunit_cells_per_microliter 900))
:named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a neutrophil count < 900 cells per microliter."

;; ===================== Declarations for the exclusion criterion (REQ 20) =====================
(declare-const patient_has_current_infection_requiring_intravenous_antibiotic_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an infection and that infection requires intravenous antibiotic therapy.","when_to_set_to_false":"Set to false if the patient currently does not have an infection or the infection does not require intravenous antibiotic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an infection requiring intravenous antibiotic therapy.","meaning":"Boolean indicating whether the patient currently has an infection requiring intravenous antibiotic therapy."} ;; "The patient is excluded if the patient has a current infection requiring intravenous antibiotic therapy."

;; ===================== Constraint Assertions (REQ 20) =====================
(assert
  (! (not patient_has_current_infection_requiring_intravenous_antibiotic_therapy_now)
     :named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current infection requiring intravenous antibiotic therapy."

;; ===================== Declarations for the exclusion criterion (REQ 21) =====================
(declare-const patient_has_diagnosis_of_local_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of local infection.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of local infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of local infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of local infection."} ;; "local infection"
(declare-const patient_has_diagnosis_of_local_infection_now@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of local infection and the infection is serious.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of local infection but it is not serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's local infection is serious.","meaning":"Boolean indicating whether the patient's current local infection diagnosis is serious."} ;; "serious local infection"
(declare-const patient_has_diagnosis_of_cellulitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cellulitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cellulitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cellulitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cellulitis."} ;; "cellulitis"
(declare-const patient_has_diagnosis_of_cellulitis_now@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cellulitis and the cellulitis is serious.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of cellulitis but it is not serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cellulitis is serious.","meaning":"Boolean indicating whether the patient's current cellulitis diagnosis is serious."} ;; "serious cellulitis"
(declare-const patient_has_diagnosis_of_abscess_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of abscess.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of abscess.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of abscess.","meaning":"Boolean indicating whether the patient currently has a diagnosis of abscess."} ;; "abscess"
(declare-const patient_has_diagnosis_of_abscess_now@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of abscess and the abscess is serious.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of abscess but it is not serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's abscess is serious.","meaning":"Boolean indicating whether the patient's current abscess diagnosis is serious."} ;; "serious abscess"

;; ===================== Auxiliary Assertions (REQ 21) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_cellulitis_now@@serious
           patient_has_diagnosis_of_abscess_now@@serious)
       patient_has_diagnosis_of_local_infection_now@@serious)
   :named REQ21_AUXILIARY0)) ;; "with non-exhaustive examples ((cellulitis) OR (abscess))."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_local_infection_now@@serious
       patient_has_diagnosis_of_local_infection_now)
   :named REQ21_AUXILIARY1)) ;; "serious local infection"

(assert
(! (=> patient_has_diagnosis_of_cellulitis_now@@serious
       patient_has_diagnosis_of_cellulitis_now)
   :named REQ21_AUXILIARY2)) ;; "serious cellulitis"

(assert
(! (=> patient_has_diagnosis_of_abscess_now@@serious
       patient_has_diagnosis_of_abscess_now)
   :named REQ21_AUXILIARY3)) ;; "serious abscess"

;; ===================== Constraint Assertions (REQ 21) =====================
(assert
(! (not patient_has_diagnosis_of_local_infection_now@@serious)
   :named REQ21_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a serious local infection with non-exhaustive examples ((cellulitis) OR (abscess))."

;; ===================== Declarations for the exclusion criterion (REQ 22) =====================
(declare-const patient_has_finding_of_systemic_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a systemic infection of any type, regardless of specific diagnosis.","when_to_set_to_false":"Set to false if the patient currently does not have a systemic infection of any type.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a systemic infection.","meaning":"Boolean indicating whether the patient currently has a systemic infection of any type."} ;; "systemic infection"

(declare-const patient_has_finding_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pneumonia.","meaning":"Boolean indicating whether the patient currently has pneumonia."} ;; "pneumonia"

(declare-const patient_has_finding_of_bacterial_sepsis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bacterial sepsis (septicemia).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bacterial sepsis (septicemia).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of bacterial sepsis (septicemia).","meaning":"Boolean indicating whether the patient currently has bacterial sepsis (septicemia)."} ;; "septicemia"

;; ===================== Auxiliary Assertions (REQ 22) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_pneumonia_now
          patient_has_finding_of_bacterial_sepsis_now)
    patient_has_finding_of_systemic_infection_now)
:named REQ22_AUXILIARY0)) ;; "with non-exhaustive examples ((pneumonia) OR (septicemia))."

;; ===================== Constraint Assertions (REQ 22) =====================
(assert
(! (not patient_has_finding_of_systemic_infection_now)
:named REQ22_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a systemic infection with non-exhaustive examples ((pneumonia) OR (septicemia))."

;; ===================== Declarations for the exclusion criterion (REQ 23) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of malignant neoplastic disease (cancer) within the past 5 years.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of malignant neoplastic disease (cancer) within the past 5 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of malignant neoplastic disease (cancer) within the past 5 years.","meaning":"Boolean indicating whether the patient has had a diagnosis of malignant neoplastic disease (cancer) within the past 5 years."} ;; "history of cancer within the past 5 years"

(declare-const patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of basal cell carcinoma of the skin within the past 5 years.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of basal cell carcinoma of the skin within the past 5 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of basal cell carcinoma of the skin within the past 5 years.","meaning":"Boolean indicating whether the patient has had a diagnosis of basal cell carcinoma of the skin within the past 5 years."} ;; "basal cell carcinoma of the skin within the past 5 years"

(declare-const patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_inthepast5years@@excised Bool) ;; {"when_to_set_to_true":"Set to true if the patient's basal cell carcinoma of the skin within the past 5 years was excised.","when_to_set_to_false":"Set to false if the patient's basal cell carcinoma of the skin within the past 5 years was not excised.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the basal cell carcinoma of the skin was excised.","meaning":"Boolean indicating whether the patient's basal cell carcinoma of the skin within the past 5 years was excised."} ;; "excised basal cell carcinoma of the skin within the past 5 years"

(declare-const patient_has_diagnosis_of_squamous_cell_carcinoma_of_skin_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of squamous cell carcinoma of the skin within the past 5 years.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of squamous cell carcinoma of the skin within the past 5 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of squamous cell carcinoma of the skin within the past 5 years.","meaning":"Boolean indicating whether the patient has had a diagnosis of squamous cell carcinoma of the skin within the past 5 years."} ;; "squamous cell carcinoma of the skin within the past 5 years"

(declare-const patient_has_diagnosis_of_squamous_cell_carcinoma_of_skin_inthepast5years@@excised Bool) ;; {"when_to_set_to_true":"Set to true if the patient's squamous cell carcinoma of the skin within the past 5 years was excised.","when_to_set_to_false":"Set to false if the patient's squamous cell carcinoma of the skin within the past 5 years was not excised.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the squamous cell carcinoma of the skin was excised.","meaning":"Boolean indicating whether the patient's squamous cell carcinoma of the skin within the past 5 years was excised."} ;; "excised squamous cell carcinoma of the skin within the past 5 years"

(declare-const patient_has_diagnosis_of_carcinoma_in_situ_of_uterine_cervix_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of carcinoma in situ of the uterine cervix within the past 5 years.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of carcinoma in situ of the uterine cervix within the past 5 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of carcinoma in situ of the uterine cervix within the past 5 years.","meaning":"Boolean indicating whether the patient has had a diagnosis of carcinoma in situ of the uterine cervix within the past 5 years."} ;; "cervical carcinoma in situ within the past 5 years"

;; ===================== Auxiliary Assertions (REQ 23) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_inthepast5years@@excised
       patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_inthepast5years)
   :named REQ23_AUXILIARY0)) ;; "excised basal cell carcinoma of the skin within the past 5 years"

(assert
(! (=> patient_has_diagnosis_of_squamous_cell_carcinoma_of_skin_inthepast5years@@excised
       patient_has_diagnosis_of_squamous_cell_carcinoma_of_skin_inthepast5years)
   :named REQ23_AUXILIARY1)) ;; "excised squamous cell carcinoma of the skin within the past 5 years"

;; ===================== Constraint Assertions (REQ 23) =====================
;; Exclusion: history of cancer within the past 5 years, except if limited to excised basal cell carcinoma, excised squamous cell carcinoma of the skin, or cervical carcinoma in situ
(assert
(! (not
     (and
       patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years
       (or
         (not
           (and
             (or patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_inthepast5years@@excised
                 patient_has_diagnosis_of_squamous_cell_carcinoma_of_skin_inthepast5years@@excised
                 patient_has_diagnosis_of_carcinoma_in_situ_of_uterine_cervix_inthepast5years)
             (= patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years
                (or patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_inthepast5years
                    patient_has_diagnosis_of_squamous_cell_carcinoma_of_skin_inthepast5years
                    patient_has_diagnosis_of_carcinoma_in_situ_of_uterine_cervix_inthepast5years))
           )
         )
       )
     )
   )
   :named REQ23_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of cancer within the past 5 years, EXCEPT if the history is limited to excised basal cell carcinoma, squamous cell carcinoma of the skin, or cervical carcinoma in situ."

;; ===================== Declarations for the exclusion criterion (REQ 24) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to any drug or medicament within the past 5 years.","when_to_set_to_false":"Set to false if the patient was not exposed to any drug or medicament within the past 5 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to any drug or medicament within the past 5 years.","meaning":"Boolean indicating whether the patient was exposed to any drug or medicament within the past 5 years."} ;; "illicit drug within the past 5 years"
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast5years@@dependency Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to any drug or medicament within the past 5 years was due to a dependency.","when_to_set_to_false":"Set to false if the patient's exposure to any drug or medicament within the past 5 years was not due to a dependency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure was due to a dependency.","meaning":"Boolean indicating whether the exposure to drug or medicament within the past 5 years was due to a dependency."} ;; "dependency for any illicit drug within the past 5 years"
(declare-const patient_is_exposed_to_chemical_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to any chemical within the past 5 years.","when_to_set_to_false":"Set to false if the patient was not exposed to any chemical within the past 5 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to any chemical within the past 5 years.","meaning":"Boolean indicating whether the patient was exposed to any chemical within the past 5 years."} ;; "chemical within the past 5 years"
(declare-const patient_is_exposed_to_chemical_inthepast5years@@dependency Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to any chemical within the past 5 years was due to a dependency.","when_to_set_to_false":"Set to false if the patient's exposure to any chemical within the past 5 years was not due to a dependency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure was due to a dependency.","meaning":"Boolean indicating whether the exposure to chemical within the past 5 years was due to a dependency."} ;; "dependency for any chemical within the past 5 years"
(declare-const patient_is_exposed_to_alcohol_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to any alcohol within the past 5 years.","when_to_set_to_false":"Set to false if the patient was not exposed to any alcohol within the past 5 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to any alcohol within the past 5 years.","meaning":"Boolean indicating whether the patient was exposed to any alcohol within the past 5 years."} ;; "alcohol within the past 5 years"
(declare-const patient_is_exposed_to_alcohol_inthepast5years@@dependency Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to any alcohol within the past 5 years was due to a dependency.","when_to_set_to_false":"Set to false if the patient's exposure to any alcohol within the past 5 years was not due to a dependency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure was due to a dependency.","meaning":"Boolean indicating whether the exposure to alcohol within the past 5 years was due to a dependency."} ;; "dependency for any alcohol within the past 5 years"

;; ===================== Auxiliary Assertions (REQ 24) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthepast5years@@dependency
      patient_is_exposed_to_drug_or_medicament_inthepast5years)
    :named REQ24_AUXILIARY0)) ;; "dependency for any illicit drug within the past 5 years"

(assert
(! (=> patient_is_exposed_to_chemical_inthepast5years@@dependency
      patient_is_exposed_to_chemical_inthepast5years)
    :named REQ24_AUXILIARY1)) ;; "dependency for any chemical within the past 5 years"

(assert
(! (=> patient_is_exposed_to_alcohol_inthepast5years@@dependency
      patient_is_exposed_to_alcohol_inthepast5years)
    :named REQ24_AUXILIARY2)) ;; "dependency for any alcohol within the past 5 years"

;; ===================== Constraint Assertions (REQ 24) =====================
(assert
(! (not patient_is_exposed_to_drug_or_medicament_inthepast5years@@dependency)
    :named REQ24_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient had a dependency for any illicit drug within the past 5 years."

(assert
(! (not patient_is_exposed_to_chemical_inthepast5years@@dependency)
    :named REQ24_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient had a dependency for any chemical within the past 5 years."

(assert
(! (not patient_is_exposed_to_alcohol_inthepast5years@@dependency)
    :named REQ24_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient had a dependency for any alcohol within the past 5 years."
