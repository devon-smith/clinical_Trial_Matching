;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_heart_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of heart disease.","when_to_set_to_false":"Set to false if the patient does not have a documented history of heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of heart disease.","meaning":"Boolean indicating whether the patient has a history of heart disease."} ;; "a history of clinically significant cardiac disease"
(declare-const patient_has_finding_of_heart_disease_inthehistory@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of heart disease is clinically significant.","when_to_set_to_false":"Set to false if the patient's history of heart disease is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of heart disease is clinically significant.","meaning":"Boolean indicating whether the patient's history of heart disease is clinically significant."} ;; "clinically significant cardiac disease"

(declare-const patient_has_finding_of_disorder_of_endocrine_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of disorder of the endocrine system.","when_to_set_to_false":"Set to false if the patient does not have a documented history of disorder of the endocrine system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of disorder of the endocrine system.","meaning":"Boolean indicating whether the patient has a history of disorder of the endocrine system."} ;; "a history of clinically significant endocrinologic disease"
(declare-const patient_has_finding_of_disorder_of_endocrine_system_inthehistory@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of disorder of the endocrine system is clinically significant.","when_to_set_to_false":"Set to false if the patient's history of disorder of the endocrine system is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of disorder of the endocrine system is clinically significant.","meaning":"Boolean indicating whether the patient's history of disorder of the endocrine system is clinically significant."} ;; "clinically significant endocrinologic disease"

(declare-const patient_has_finding_of_disorder_of_lung_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of disorder of the lung.","when_to_set_to_false":"Set to false if the patient does not have a documented history of disorder of the lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of disorder of the lung.","meaning":"Boolean indicating whether the patient has a history of disorder of the lung."} ;; "a history of clinically significant pulmonary disease"
(declare-const patient_has_finding_of_disorder_of_lung_inthehistory@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of disorder of the lung is clinically significant.","when_to_set_to_false":"Set to false if the patient's history of disorder of the lung is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of disorder of the lung is clinically significant.","meaning":"Boolean indicating whether the patient's history of disorder of the lung is clinically significant."} ;; "clinically significant pulmonary disease"

(declare-const patient_has_finding_of_disorder_of_nervous_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of disorder of the nervous system.","when_to_set_to_false":"Set to false if the patient does not have a documented history of disorder of the nervous system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of disorder of the nervous system.","meaning":"Boolean indicating whether the patient has a history of disorder of the nervous system."} ;; "a history of clinically significant neurologic disease"
(declare-const patient_has_finding_of_disorder_of_nervous_system_inthehistory@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of disorder of the nervous system is clinically significant.","when_to_set_to_false":"Set to false if the patient's history of disorder of the nervous system is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of disorder of the nervous system is clinically significant.","meaning":"Boolean indicating whether the patient's history of disorder of the nervous system is clinically significant."} ;; "clinically significant neurologic disease"

(declare-const patient_has_finding_of_mental_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of mental disorder.","when_to_set_to_false":"Set to false if the patient does not have a documented history of mental disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of mental disorder.","meaning":"Boolean indicating whether the patient has a history of mental disorder."} ;; "a history of clinically significant psychiatric disease"
(declare-const patient_has_finding_of_mental_disorder_inthehistory@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of mental disorder is clinically significant.","when_to_set_to_false":"Set to false if the patient's history of mental disorder is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of mental disorder is clinically significant.","meaning":"Boolean indicating whether the patient's history of mental disorder is clinically significant."} ;; "clinically significant psychiatric disease"

(declare-const patient_has_finding_of_disease_of_liver_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of disease of the liver.","when_to_set_to_false":"Set to false if the patient does not have a documented history of disease of the liver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of disease of the liver.","meaning":"Boolean indicating whether the patient has a history of disease of the liver."} ;; "a history of clinically significant hepatic disease"
(declare-const patient_has_finding_of_disease_of_liver_inthehistory@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of disease of the liver is clinically significant.","when_to_set_to_false":"Set to false if the patient's history of disease of the liver is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of disease of the liver is clinically significant.","meaning":"Boolean indicating whether the patient's history of disease of the liver is clinically significant."} ;; "clinically significant hepatic disease"

(declare-const patient_has_finding_of_kidney_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of kidney disease.","when_to_set_to_false":"Set to false if the patient does not have a documented history of kidney disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of kidney disease.","meaning":"Boolean indicating whether the patient has a history of kidney disease."} ;; "a history of clinically significant renal disease"
(declare-const patient_has_finding_of_kidney_disease_inthehistory@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of kidney disease is clinically significant.","when_to_set_to_false":"Set to false if the patient's history of kidney disease is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of kidney disease is clinically significant.","meaning":"Boolean indicating whether the patient's history of kidney disease is clinically significant."} ;; "clinically significant renal disease"

(declare-const patient_has_finding_of_hematologic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hematologic disease.","when_to_set_to_false":"Set to false if the patient does not have a documented history of hematologic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hematologic disease.","meaning":"Boolean indicating whether the patient has a history of hematologic disease."} ;; "a history of clinically significant hematologic disease"
(declare-const patient_has_finding_of_hematologic_disease_inthehistory@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of hematologic disease is clinically significant.","when_to_set_to_false":"Set to false if the patient's history of hematologic disease is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of hematologic disease is clinically significant.","meaning":"Boolean indicating whether the patient's history of hematologic disease is clinically significant."} ;; "clinically significant hematologic disease"

(declare-const patient_has_finding_of_disorder_of_immune_function_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of disorder of immune function.","when_to_set_to_false":"Set to false if the patient does not have a documented history of disorder of immune function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of disorder of immune function.","meaning":"Boolean indicating whether the patient has a history of disorder of immune function."} ;; "a history of clinically significant immunologic disease"
(declare-const patient_has_finding_of_disorder_of_immune_function_inthehistory@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of disorder of immune function is clinically significant.","when_to_set_to_false":"Set to false if the patient's history of disorder of immune function is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of disorder of immune function is clinically significant.","meaning":"Boolean indicating whether the patient's history of disorder of immune function is clinically significant."} ;; "clinically significant immunologic disease"

(declare-const patient_has_finding_of_disease_condition_determination_uncontrolled_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented uncontrolled disease.","when_to_set_to_false":"Set to false if the patient currently does not have a documented uncontrolled disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has uncontrolled disease.","meaning":"Boolean indicating whether the patient currently has uncontrolled disease."} ;; "other major uncontrolled disease"
(declare-const patient_has_finding_of_disease_condition_determination_uncontrolled_now@@major Bool) ;; {"when_to_set_to_true":"Set to true if the patient's uncontrolled disease is major.","when_to_set_to_false":"Set to false if the patient's uncontrolled disease is not major.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's uncontrolled disease is major.","meaning":"Boolean indicating whether the patient's uncontrolled disease is major."} ;; "major uncontrolled disease"
(declare-const patient_has_finding_of_disease_condition_determination_uncontrolled_now@@as_determined_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient's uncontrolled disease is determined by the Investigator.","when_to_set_to_false":"Set to false if the patient's uncontrolled disease is not determined by the Investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's uncontrolled disease is determined by the Investigator.","meaning":"Boolean indicating whether the patient's uncontrolled disease is determined by the Investigator."} ;; "as determined by the Investigator"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_heart_disease_inthehistory@@clinically_significant
      patient_has_finding_of_heart_disease_inthehistory)
    :named REQ0_AUXILIARY0)) ;; "clinically significant cardiac disease"

(assert
(! (=> patient_has_finding_of_disorder_of_endocrine_system_inthehistory@@clinically_significant
      patient_has_finding_of_disorder_of_endocrine_system_inthehistory)
    :named REQ0_AUXILIARY1)) ;; "clinically significant endocrinologic disease"

(assert
(! (=> patient_has_finding_of_disorder_of_lung_inthehistory@@clinically_significant
      patient_has_finding_of_disorder_of_lung_inthehistory)
    :named REQ0_AUXILIARY2)) ;; "clinically significant pulmonary disease"

(assert
(! (=> patient_has_finding_of_disorder_of_nervous_system_inthehistory@@clinically_significant
      patient_has_finding_of_disorder_of_nervous_system_inthehistory)
    :named REQ0_AUXILIARY3)) ;; "clinically significant neurologic disease"

(assert
(! (=> patient_has_finding_of_mental_disorder_inthehistory@@clinically_significant
      patient_has_finding_of_mental_disorder_inthehistory)
    :named REQ0_AUXILIARY4)) ;; "clinically significant psychiatric disease"

(assert
(! (=> patient_has_finding_of_disease_of_liver_inthehistory@@clinically_significant
      patient_has_finding_of_disease_of_liver_inthehistory)
    :named REQ0_AUXILIARY5)) ;; "clinically significant hepatic disease"

(assert
(! (=> patient_has_finding_of_kidney_disease_inthehistory@@clinically_significant
      patient_has_finding_of_kidney_disease_inthehistory)
    :named REQ0_AUXILIARY6)) ;; "clinically significant renal disease"

(assert
(! (=> patient_has_finding_of_hematologic_disease_inthehistory@@clinically_significant
      patient_has_finding_of_hematologic_disease_inthehistory)
    :named REQ0_AUXILIARY7)) ;; "clinically significant hematologic disease"

(assert
(! (=> patient_has_finding_of_disorder_of_immune_function_inthehistory@@clinically_significant
      patient_has_finding_of_disorder_of_immune_function_inthehistory)
    :named REQ0_AUXILIARY8)) ;; "clinically significant immunologic disease"

;; Qualifier variables for uncontrolled disease
(assert
(! (=> patient_has_finding_of_disease_condition_determination_uncontrolled_now@@major
      patient_has_finding_of_disease_condition_determination_uncontrolled_now)
    :named REQ0_AUXILIARY9)) ;; "major uncontrolled disease"

(assert
(! (=> patient_has_finding_of_disease_condition_determination_uncontrolled_now@@as_determined_by_investigator
      patient_has_finding_of_disease_condition_determination_uncontrolled_now)
    :named REQ0_AUXILIARY10)) ;; "as determined by the Investigator"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_heart_disease_inthehistory@@clinically_significant)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "a history of clinically significant cardiac disease"

(assert
(! (not patient_has_finding_of_disorder_of_endocrine_system_inthehistory@@clinically_significant)
    :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "a history of clinically significant endocrinologic disease"

(assert
(! (not patient_has_finding_of_disorder_of_lung_inthehistory@@clinically_significant)
    :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "a history of clinically significant pulmonary disease"

(assert
(! (not patient_has_finding_of_disorder_of_nervous_system_inthehistory@@clinically_significant)
    :named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "a history of clinically significant neurologic disease"

(assert
(! (not patient_has_finding_of_mental_disorder_inthehistory@@clinically_significant)
    :named REQ0_COMPONENT4_OTHER_REQUIREMENTS)) ;; "a history of clinically significant psychiatric disease"

(assert
(! (not patient_has_finding_of_disease_of_liver_inthehistory@@clinically_significant)
    :named REQ0_COMPONENT5_OTHER_REQUIREMENTS)) ;; "a history of clinically significant hepatic disease"

(assert
(! (not patient_has_finding_of_kidney_disease_inthehistory@@clinically_significant)
    :named REQ0_COMPONENT6_OTHER_REQUIREMENTS)) ;; "a history of clinically significant renal disease"

(assert
(! (not patient_has_finding_of_hematologic_disease_inthehistory@@clinically_significant)
    :named REQ0_COMPONENT7_OTHER_REQUIREMENTS)) ;; "a history of clinically significant hematologic disease"

(assert
(! (not patient_has_finding_of_disorder_of_immune_function_inthehistory@@clinically_significant)
    :named REQ0_COMPONENT8_OTHER_REQUIREMENTS)) ;; "a history of clinically significant immunologic disease"

(assert
(! (not (and patient_has_finding_of_disease_condition_determination_uncontrolled_now@@major
             patient_has_finding_of_disease_condition_determination_uncontrolled_now@@as_determined_by_investigator))
    :named REQ0_COMPONENT9_OTHER_REQUIREMENTS)) ;; "other major uncontrolled disease as determined by the Investigator"

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding (including laboratory abnormality).","when_to_set_to_false":"Set to false if the patient currently does not have any disease, condition, or clinical finding (including laboratory abnormality).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease, condition, or clinical finding (including laboratory abnormality).","meaning":"Boolean indicating whether the patient currently has any disease, condition, or clinical finding (including laboratory abnormality)."} ;; "condition (including the presence of laboratory abnormality)"
(declare-const patient_has_finding_of_disease_condition_finding_now@@places_patient_at_unacceptable_risk_if_participate_in_study_or_confounds_data_interpretation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disease, condition, or clinical finding (including laboratory abnormality) either places the patient at unacceptable risk if participating in the study or confounds the ability to interpret data from the study.","when_to_set_to_false":"Set to false if the patient's current disease, condition, or clinical finding (including laboratory abnormality) does not place the patient at unacceptable risk if participating in the study and does not confound the ability to interpret data from the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disease, condition, or clinical finding (including laboratory abnormality) places the patient at unacceptable risk or confounds data interpretation.","meaning":"Boolean indicating that the patient's current disease, condition, or clinical finding (including laboratory abnormality) either places the patient at unacceptable risk if participating in the study or confounds the ability to interpret data from the study."} ;; "condition (including the presence of laboratory abnormality) that (places the patient at unacceptable risk if the patient were to participate in the study) OR (confounds the ability to interpret data from the study)"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@places_patient_at_unacceptable_risk_if_participate_in_study_or_confounds_data_interpretation
      patient_has_finding_of_disease_condition_finding_now)
   :named REQ1_AUXILIARY0)) ;; "condition (including the presence of laboratory abnormality) that (places the patient at unacceptable risk if the patient were to participate in the study) OR (confounds the ability to interpret data from the study)"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_disease_condition_finding_now@@places_patient_at_unacceptable_risk_if_participate_in_study_or_confounds_data_interpretation)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any condition (including the presence of laboratory abnormality) that (places the patient at unacceptable risk if the patient were to participate in the study) OR (confounds the ability to interpret data from the study)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_clinically_significant_abnormality_on_12_lead_electrocardiography_at_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a clinically significant abnormality detected on twelve-lead electrocardiography performed at the screening visit.","when_to_set_to_false":"Set to false if the patient does not have a clinically significant abnormality detected on twelve-lead electrocardiography performed at the screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a clinically significant abnormality detected on twelve-lead electrocardiography performed at the screening visit.","meaning":"Boolean indicating whether the patient has a clinically significant abnormality detected on twelve-lead electrocardiography performed at the screening visit."} ;; "clinically significant abnormality on twelve-lead electrocardiography at screening"
(declare-const patient_has_undergone_12_lead_ecg_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a twelve-lead electrocardiography procedure at the screening visit.","when_to_set_to_false":"Set to false if the patient has not undergone a twelve-lead electrocardiography procedure at the screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a twelve-lead electrocardiography procedure at the screening visit.","meaning":"Boolean indicating whether the patient has undergone a twelve-lead electrocardiography procedure at the screening visit."} ;; "twelve-lead electrocardiography"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_clinically_significant_abnormality_on_12_lead_electrocardiography_at_screening)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a clinically significant abnormality on twelve-lead electrocardiography at screening."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding as documented or reported.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is breast feeding"
(declare-const patients_breastfeeding_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently breastfeeding.","meaning":"Boolean indicating whether the patient is currently breastfeeding."} ;; "breast feeding"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Link observable entity to main breastfeeding variable
(assert
(! (= patient_is_breastfeeding_now patients_breastfeeding_is_positive_now)
:named REQ3_AUXILIARY0)) ;; "breast feeding" and "the patient is breast feeding"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
(! (not patient_is_breastfeeding_now)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is breast feeding."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_history_of_allergy_to_any_component_of_investigational_product Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of allergy to any component of the investigational product.","when_to_set_to_false":"Set to false if the patient does not have a documented history of allergy to any component of the investigational product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of allergy to any component of the investigational product.","meaning":"Boolean indicating whether the patient has a history of allergy to any component of the investigational product."} ;; "has a history of allergy to any component of the investigational product"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_has_history_of_allergy_to_any_component_of_investigational_product)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of allergy to any component of the investigational product."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patients_hepatitis_b_surface_antigen_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently positive for hepatitis B surface antigen.","when_to_set_to_false":"Set to false if the patient is currently negative for hepatitis B surface antigen.","when_to_set_to_null":"Set to null if the patient's hepatitis B surface antigen status is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient is currently positive for hepatitis B surface antigen."} ;; "hepatitis B surface antigen"
(declare-const patients_hepatitis_b_surface_antigen_is_positive_now@@at_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hepatitis B surface antigen positivity is determined at the screening timepoint.","when_to_set_to_false":"Set to false if the patient's hepatitis B surface antigen positivity is not determined at the screening timepoint.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether hepatitis B surface antigen positivity is determined at screening.","meaning":"Boolean indicating whether the patient's hepatitis B surface antigen positivity is determined at screening."} ;; "at screening"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patients_hepatitis_b_surface_antigen_is_positive_now@@at_screening
      patients_hepatitis_b_surface_antigen_is_positive_now)
:named REQ5_AUXILIARY0)) ;; "at screening"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patients_hepatitis_b_surface_antigen_is_positive_now@@at_screening)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is positive for hepatitis B surface antigen at screening."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_positive_hepatitis_c_antibody_at_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient is positive for hepatitis C antibody at the time of screening.","when_to_set_to_false":"Set to false if the patient is negative for hepatitis C antibody at the time of screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is positive for hepatitis C antibody at the time of screening.","meaning":"Boolean indicating whether the patient is positive for hepatitis C antibody at the time of screening."} ;; "The patient is excluded if the patient is positive for hepatitis C antibody at screening."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not patient_has_positive_hepatitis_c_antibody_at_screening)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is positive for hepatitis C antibody at screening."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_aspartate_transaminase_level_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value of the patient's aspartate transaminase (AST) level if a current measurement is available, with the appropriate unit.","when_to_set_to_null":"Set to null if no current AST measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current aspartate transaminase (AST) level."} ;; "aspartate aminotransferase"
(declare-const upper_limit_of_normal_for_aspartate_aminotransferase_value_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the reference value for the upper limit of normal for aspartate aminotransferase (AST), with the appropriate unit, as defined by the laboratory.","when_to_set_to_null":"Set to null if the reference value for the upper limit of normal for AST is not available or indeterminate.","meaning":"Numeric value representing the upper limit of normal for aspartate aminotransferase (AST)."} ;; "upper limit of normal for aspartate aminotransferase"
(declare-const patient_serum_glutamic_oxaloacetic_transaminase_measurement_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value of the patient's serum glutamic oxaloacetic transaminase (SGOT/AST) level if a current measurement is available, with the appropriate unit.","when_to_set_to_null":"Set to null if no current SGOT/AST measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum glutamic oxaloacetic transaminase (SGOT/AST) level."} ;; "serum glutamic oxaloacetic transaminase"
(declare-const upper_limit_of_normal_for_serum_glutamic_oxaloacetic_transaminase_value_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the reference value for the upper limit of normal for serum glutamic oxaloacetic transaminase (SGOT/AST), with the appropriate unit, as defined by the laboratory.","when_to_set_to_null":"Set to null if the reference value for the upper limit of normal for SGOT/AST is not available or indeterminate.","meaning":"Numeric value representing the upper limit of normal for serum glutamic oxaloacetic transaminase (SGOT/AST)."} ;; "upper limit of normal for serum glutamic oxaloacetic transaminase"
(declare-const patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value of the patient's alanine aminotransferase (ALT) level if a current measurement is available, with the appropriate unit.","when_to_set_to_null":"Set to null if no current ALT measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current alanine aminotransferase (ALT) level."} ;; "alanine aminotransferase"
(declare-const upper_limit_of_normal_for_alanine_aminotransferase_value_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the reference value for the upper limit of normal for alanine aminotransferase (ALT), with the appropriate unit, as defined by the laboratory.","when_to_set_to_null":"Set to null if the reference value for the upper limit of normal for ALT is not available or indeterminate.","meaning":"Numeric value representing the upper limit of normal for alanine aminotransferase (ALT)."} ;; "upper limit of normal for alanine aminotransferase"
(declare-const patient_serum_glutamic_pyruvic_transaminase_measurement_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value of the patient's serum glutamic pyruvic transaminase (SGPT/ALT) level if a current measurement is available, with the appropriate unit.","when_to_set_to_null":"Set to null if no current SGPT/ALT measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum glutamic pyruvic transaminase (SGPT/ALT) level."} ;; "serum glutamic pyruvic transaminase"
(declare-const upper_limit_of_normal_for_serum_glutamic_pyruvic_transaminase_value_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the reference value for the upper limit of normal for serum glutamic pyruvic transaminase (SGPT/ALT), with the appropriate unit, as defined by the laboratory.","when_to_set_to_null":"Set to null if the reference value for the upper limit of normal for SGPT/ALT is not available or indeterminate.","meaning":"Numeric value representing the upper limit of normal for serum glutamic pyruvic transaminase (SGPT/ALT)."} ;; "upper limit of normal for serum glutamic pyruvic transaminase"
(declare-const patient_bilirubin_total_measurement_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value of the patient's total bilirubin level if a current measurement is available, with the appropriate unit.","when_to_set_to_null":"Set to null if no current total bilirubin measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current total bilirubin level."} ;; "total bilirubin"
(declare-const upper_limit_of_normal_for_total_bilirubin_value_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the reference value for the upper limit of normal for total bilirubin, with the appropriate unit, as defined by the laboratory.","when_to_set_to_null":"Set to null if the reference value for the upper limit of normal for total bilirubin is not available or indeterminate.","meaning":"Numeric value representing the upper limit of normal for total bilirubin."} ;; "upper limit of normal for total bilirubin"
(declare-const patient_albumin_measurement_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value of the patient's albumin level if a current measurement is available, with the appropriate unit.","when_to_set_to_null":"Set to null if no current albumin measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current albumin level."} ;; "albumin"
(declare-const lower_limit_of_normal_for_albumin_value_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the reference value for the lower limit of normal for albumin, with the appropriate unit, as defined by the laboratory.","when_to_set_to_null":"Set to null if the reference value for the lower limit of normal for albumin is not available or indeterminate.","meaning":"Numeric value representing the lower limit of normal for albumin."} ;; "lower limit of normal for albumin"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (> patient_aspartate_transaminase_level_value_recorded_now_withunit_unit
           (* 1.5 upper_limit_of_normal_for_aspartate_aminotransferase_value_withunit_unit)))
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has aspartate aminotransferase greater than one point five times the upper limit of normal."

(assert
(! (not (> patient_serum_glutamic_oxaloacetic_transaminase_measurement_value_recorded_now_withunit_unit
           (* 1.5 upper_limit_of_normal_for_serum_glutamic_oxaloacetic_transaminase_value_withunit_unit)))
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has serum glutamic oxaloacetic transaminase greater than one point five times the upper limit of normal."

(assert
(! (not (> patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_unit
           (* 1.5 upper_limit_of_normal_for_alanine_aminotransferase_value_withunit_unit)))
:named REQ7_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has alanine aminotransferase greater than one point five times the upper limit of normal."

(assert
(! (not (> patient_serum_glutamic_pyruvic_transaminase_measurement_value_recorded_now_withunit_unit
           (* 1.5 upper_limit_of_normal_for_serum_glutamic_pyruvic_transaminase_value_withunit_unit)))
:named REQ7_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has serum glutamic pyruvic transaminase greater than one point five times the upper limit of normal."

(assert
(! (not (> patient_bilirubin_total_measurement_value_recorded_now_withunit_unit
           upper_limit_of_normal_for_total_bilirubin_value_withunit_unit))
:named REQ7_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has total bilirubin greater than the upper limit of normal."

(assert
(! (not (< patient_albumin_measurement_value_recorded_now_withunit_unit
           lower_limit_of_normal_for_albumin_value_withunit_unit))
:named REQ7_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has albumin less than the lower limit of normal."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_human_immunodeficiency_virus_infection_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of human immunodeficiency virus infection.","when_to_set_to_false":"Set to false if the patient does not have a documented history of human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient has a history of human immunodeficiency virus infection."} ;; "a history of positive human immunodeficiency virus infection"
(declare-const patient_has_finding_of_human_immunodeficiency_virus_infection_inthehistory@@is_positive Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of human immunodeficiency virus infection is positive.","when_to_set_to_false":"Set to false if the patient's history of human immunodeficiency virus infection is not positive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of human immunodeficiency virus infection is positive.","meaning":"Boolean indicating whether the patient's history of human immunodeficiency virus infection is positive."} ;; "positive human immunodeficiency virus infection"
(declare-const patient_has_finding_of_congenital_immunodeficiency_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of congenital immunodeficiency disease.","when_to_set_to_false":"Set to false if the patient does not have a documented history of congenital immunodeficiency disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of congenital immunodeficiency disease.","meaning":"Boolean indicating whether the patient has a history of congenital immunodeficiency disease."} ;; "congenital immunodeficiency disease"
(declare-const patient_has_finding_of_immunodeficiency_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of immunodeficiency disorder.","when_to_set_to_false":"Set to false if the patient does not have a documented history of immunodeficiency disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of immunodeficiency disorder.","meaning":"Boolean indicating whether the patient has a history of immunodeficiency disorder."} ;; "immunodeficiency disease"
(declare-const patient_has_finding_of_immunodeficiency_disorder_inthehistory@@is_acquired Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of immunodeficiency disorder is acquired.","when_to_set_to_false":"Set to false if the patient's history of immunodeficiency disorder is not acquired.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of immunodeficiency disorder is acquired.","meaning":"Boolean indicating whether the patient's history of immunodeficiency disorder is acquired."} ;; "acquired immunodeficiency disease"
(declare-const patient_has_finding_of_common_variable_immunodeficiency_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of common variable immunodeficiency disease.","when_to_set_to_false":"Set to false if the patient does not have a documented history of common variable immunodeficiency disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of common variable immunodeficiency disease.","meaning":"Boolean indicating whether the patient has a history of common variable immunodeficiency disease."} ;; "common variable immunodeficiency disease"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable for HIV infection
(assert
(! (=> patient_has_finding_of_human_immunodeficiency_virus_infection_inthehistory@@is_positive
      patient_has_finding_of_human_immunodeficiency_virus_infection_inthehistory)
    :named REQ8_AUXILIARY0)) ;; "positive human immunodeficiency virus infection"

;; Qualifier variable implies corresponding stem variable for acquired immunodeficiency disorder
(assert
(! (=> patient_has_finding_of_immunodeficiency_disorder_inthehistory@@is_acquired
      patient_has_finding_of_immunodeficiency_disorder_inthehistory)
    :named REQ8_AUXILIARY1)) ;; "acquired immunodeficiency disease"

;; Non-exhaustive example implies acquired immunodeficiency disorder
(assert
(! (=> patient_has_finding_of_common_variable_immunodeficiency_disease_inthehistory
      patient_has_finding_of_immunodeficiency_disorder_inthehistory@@is_acquired)
    :named REQ8_AUXILIARY2)) ;; "with non-exhaustive examples (common variable immunodeficiency disease)"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion: history of positive HIV infection
(assert
(! (not patient_has_finding_of_human_immunodeficiency_virus_infection_inthehistory@@is_positive)
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "a history of positive human immunodeficiency virus infection"

;; Exclusion: history of congenital immunodeficiency disease
(assert
(! (not patient_has_finding_of_congenital_immunodeficiency_disease_inthehistory)
    :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "congenital immunodeficiency disease"

;; Exclusion: history of acquired immunodeficiency disease (with non-exhaustive example)
(assert
(! (not patient_has_finding_of_immunodeficiency_disorder_inthehistory@@is_acquired)
    :named REQ8_COMPONENT2_OTHER_REQUIREMENTS)) ;; "acquired immunodeficiency disease with non-exhaustive examples (common variable immunodeficiency disease)"

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_active_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has active tuberculosis.","when_to_set_to_false":"Set to false if the patient currently does not have active tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has active tuberculosis.","meaning":"Boolean indicating whether the patient currently has active tuberculosis."} ;; "active tuberculosis"
(declare-const patient_has_history_of_incompletely_treated_tuberculosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of incompletely treated tuberculosis.","when_to_set_to_false":"Set to false if the patient does not have a documented history of incompletely treated tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of incompletely treated tuberculosis.","meaning":"Boolean indicating whether the patient has a history of incompletely treated tuberculosis."} ;; "history of incompletely treated tuberculosis"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_active_tuberculosis_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active tuberculosis."

(assert
(! (not patient_has_history_of_incompletely_treated_tuberculosis)
:named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of incompletely treated tuberculosis."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const chest_radiograph_posteroanterior_view_taken_within_twelve_weeks_prior_to_or_during_screening Bool) ;; {"when_to_set_to_true":"Set to true if a chest radiograph with at least posteroanterior view was taken within twelve weeks prior to screening or during the screening visit.","when_to_set_to_false":"Set to false if a chest radiograph with at least posteroanterior view was not taken within twelve weeks prior to screening or during the screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a chest radiograph with at least posteroanterior view was taken within twelve weeks prior to screening or during the screening visit.","meaning":"Boolean indicating whether a chest radiograph with at least posteroanterior view was taken within twelve weeks prior to screening or during the screening visit."} ;; "chest radiograph with at least posteroanterior view (radiograph must be taken within twelve weeks prior to screening or during the screening visit)"

(declare-const patient_has_finding_of_clinically_significant_abnormality_on_chest_radiograph_with_posteroanterior_view_within_twelve_weeks_prior_to_or_during_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a clinically significant abnormality identified on a chest radiograph with at least posteroanterior view, and the radiograph was taken within twelve weeks prior to screening or during the screening visit.","when_to_set_to_false":"Set to false if the patient does not have a clinically significant abnormality identified on a chest radiograph with at least posteroanterior view, or the radiograph was not taken within twelve weeks prior to screening or during the screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a clinically significant abnormality identified on a chest radiograph with at least posteroanterior view within twelve weeks prior to screening or during the screening visit.","meaning":"Boolean indicating whether the patient has a clinically significant abnormality identified on a chest radiograph with at least posteroanterior view, taken within twelve weeks prior to screening or during the screening visit."} ;; "clinically significant abnormality based upon chest radiograph with at least posteroanterior view (radiograph must be taken within twelve weeks prior to screening or during the screening visit)"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_clinically_significant_abnormality_on_chest_radiograph_with_posteroanterior_view_within_twelve_weeks_prior_to_or_during_screening)
    :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a clinically significant abnormality based upon chest radiograph with at least posteroanterior view (where the radiograph must be taken within twelve weeks prior to screening OR during the screening visit)."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_substance_misuse_behavior_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has substance misuse behavior (active substance abuse).","when_to_set_to_false":"Set to false if the patient currently does not have substance misuse behavior (no active substance abuse).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has substance misuse behavior.","meaning":"Boolean indicating whether the patient currently has substance misuse behavior."} ;; "the patient has active substance abuse"

(declare-const patient_has_finding_of_substance_misuse_behavior_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient had substance misuse behavior within the past six months prior to screening.","when_to_set_to_false":"Set to false if the patient did not have substance misuse behavior within the past six months prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had substance misuse behavior within the past six months prior to screening.","meaning":"Boolean indicating whether the patient had substance misuse behavior within the past six months."} ;; "the patient has a history of substance abuse within six months prior to screening"

(declare-const patient_has_finding_of_substance_misuse_behavior_inthepast6months@@temporalcontext_within6months_before_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient had substance misuse behavior within the six months before the screening event.","when_to_set_to_false":"Set to false if the patient did not have substance misuse behavior within the six months before the screening event.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had substance misuse behavior within the six months before the screening event.","meaning":"Boolean indicating whether the patient had substance misuse behavior within the six months before the screening event."} ;; "within six months prior to screening"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_substance_misuse_behavior_inthepast6months@@temporalcontext_within6months_before_screening
      patient_has_finding_of_substance_misuse_behavior_inthepast6months)
:named REQ11_AUXILIARY0)) ;; "history of substance abuse within six months prior to screening"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_finding_of_substance_misuse_behavior_now)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has active substance abuse"

(assert
(! (not patient_has_finding_of_substance_misuse_behavior_inthepast6months@@temporalcontext_within6months_before_screening)
:named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has a history of substance abuse within six months prior to screening"

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_diagnosis_of_bacterial_infectious_disease_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of bacterial infectious disease at any time within the 4 weeks prior to screening.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of bacterial infectious disease within the 4 weeks prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of bacterial infectious disease within the 4 weeks prior to screening.","meaning":"Boolean indicating whether the patient has had a diagnosis of bacterial infectious disease within the past 4 weeks."} ;; "bacterial infection requiring treatment with oral or injectable antibiotic within four weeks of screening"
(declare-const patient_has_diagnosis_of_bacterial_infectious_disease_inthepast4weeks@@required_treatment_with_oral_or_injectable_antibiotic Bool) ;; {"when_to_set_to_true":"Set to true if the bacterial infectious disease within the past 4 weeks required treatment with oral or injectable antibiotics.","when_to_set_to_false":"Set to false if the bacterial infectious disease within the past 4 weeks did not require treatment with oral or injectable antibiotics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the bacterial infectious disease within the past 4 weeks required treatment with oral or injectable antibiotics.","meaning":"Boolean indicating whether the bacterial infectious disease within the past 4 weeks required treatment with oral or injectable antibiotics."} ;; "bacterial infection requiring treatment with oral or injectable antibiotic within four weeks of screening"
(declare-const patient_has_diagnosis_of_bacterial_infectious_disease_inthepast4weeks@@treatment_completed_at_least_4_weeks_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of bacterial infectious disease within the past 4 weeks and treatment for the infection was completed at least four weeks prior to screening.","when_to_set_to_false":"Set to false if the patient has had a diagnosis of bacterial infectious disease within the past 4 weeks and treatment for the infection was not completed at least four weeks prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether treatment for the bacterial infectious disease within the past 4 weeks was completed at least four weeks prior to screening.","meaning":"Boolean indicating whether the patient has had a diagnosis of bacterial infectious disease within the past 4 weeks and treatment for the infection was completed at least four weeks prior to screening."} ;; "unless any treatment for such infection has been completed at least four weeks prior to screening"
(declare-const patient_has_diagnosis_of_viral_disease_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of viral disease at any time within the 4 weeks prior to screening.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of viral disease within the 4 weeks prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of viral disease within the 4 weeks prior to screening.","meaning":"Boolean indicating whether the patient has had a diagnosis of viral disease within the past 4 weeks."} ;; "significant viral infection within four weeks of screening"
(declare-const patient_has_diagnosis_of_viral_disease_inthepast4weeks@@is_significant Bool) ;; {"when_to_set_to_true":"Set to true if the viral disease within the past 4 weeks is significant.","when_to_set_to_false":"Set to false if the viral disease within the past 4 weeks is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the viral disease within the past 4 weeks is significant.","meaning":"Boolean indicating whether the viral disease within the past 4 weeks is significant."} ;; "significant viral infection within four weeks of screening"
(declare-const patient_has_diagnosis_of_viral_disease_inthepast4weeks@@treatment_completed_at_least_4_weeks_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of viral disease within the past 4 weeks and treatment for the infection was completed at least four weeks prior to screening.","when_to_set_to_false":"Set to false if the patient has had a diagnosis of viral disease within the past 4 weeks and treatment for the infection was not completed at least four weeks prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether treatment for the viral disease within the past 4 weeks was completed at least four weeks prior to screening.","meaning":"Boolean indicating whether the patient has had a diagnosis of viral disease within the past 4 weeks and treatment for the infection was completed at least four weeks prior to screening."} ;; "unless any treatment for such infection has been completed at least four weeks prior to screening"
(declare-const patient_has_diagnosis_of_mycosis_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of mycosis (fungal infection) at any time within the 4 weeks prior to screening.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of mycosis (fungal infection) within the 4 weeks prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of mycosis (fungal infection) within the 4 weeks prior to screening.","meaning":"Boolean indicating whether the patient has had a diagnosis of mycosis (fungal infection) within the past 4 weeks."} ;; "significant fungal infection within four weeks of screening"
(declare-const patient_has_diagnosis_of_mycosis_inthepast4weeks@@is_significant Bool) ;; {"when_to_set_to_true":"Set to true if the mycosis (fungal infection) within the past 4 weeks is significant.","when_to_set_to_false":"Set to false if the mycosis (fungal infection) within the past 4 weeks is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the mycosis (fungal infection) within the past 4 weeks is significant.","meaning":"Boolean indicating whether the mycosis (fungal infection) within the past 4 weeks is significant."} ;; "significant fungal infection within four weeks of screening"
(declare-const patient_has_diagnosis_of_mycosis_inthepast4weeks@@treatment_completed_at_least_4_weeks_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of mycosis (fungal infection) within the past 4 weeks and treatment for the infection was completed at least four weeks prior to screening.","when_to_set_to_false":"Set to false if the patient has had a diagnosis of mycosis (fungal infection) within the past 4 weeks and treatment for the infection was not completed at least four weeks prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether treatment for the mycosis (fungal infection) within the past 4 weeks was completed at least four weeks prior to screening.","meaning":"Boolean indicating whether the patient has had a diagnosis of mycosis (fungal infection) within the past 4 weeks and treatment for the infection was completed at least four weeks prior to screening."} ;; "unless any treatment for such infection has been completed at least four weeks prior to screening"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_bacterial_infectious_disease_inthepast4weeks@@required_treatment_with_oral_or_injectable_antibiotic
      patient_has_diagnosis_of_bacterial_infectious_disease_inthepast4weeks)
:named REQ12_AUXILIARY0)) ;; "bacterial infection requiring treatment with oral or injectable antibiotic within four weeks of screening"

(assert
(! (=> patient_has_diagnosis_of_bacterial_infectious_disease_inthepast4weeks@@treatment_completed_at_least_4_weeks_prior_to_screening
      patient_has_diagnosis_of_bacterial_infectious_disease_inthepast4weeks)
:named REQ12_AUXILIARY1)) ;; "unless any treatment for such infection has been completed at least four weeks prior to screening"

(assert
(! (=> patient_has_diagnosis_of_viral_disease_inthepast4weeks@@is_significant
      patient_has_diagnosis_of_viral_disease_inthepast4weeks)
:named REQ12_AUXILIARY2)) ;; "significant viral infection within four weeks of screening"

(assert
(! (=> patient_has_diagnosis_of_viral_disease_inthepast4weeks@@treatment_completed_at_least_4_weeks_prior_to_screening
      patient_has_diagnosis_of_viral_disease_inthepast4weeks)
:named REQ12_AUXILIARY3)) ;; "unless any treatment for such infection has been completed at least four weeks prior to screening"

(assert
(! (=> patient_has_diagnosis_of_mycosis_inthepast4weeks@@is_significant
      patient_has_diagnosis_of_mycosis_inthepast4weeks)
:named REQ12_AUXILIARY4)) ;; "significant fungal infection within four weeks of screening"

(assert
(! (=> patient_has_diagnosis_of_mycosis_inthepast4weeks@@treatment_completed_at_least_4_weeks_prior_to_screening
      patient_has_diagnosis_of_mycosis_inthepast4weeks)
:named REQ12_AUXILIARY5)) ;; "unless any treatment for such infection has been completed at least four weeks prior to screening"

;; ===================== Constraint Assertions (REQ 12) =====================
;; Exclusion: patient must NOT have any of the following within 4 weeks of screening, unless treatment for such infection was completed at least 4 weeks prior to screening:
;; - bacterial infection requiring treatment with oral or injectable antibiotic
;; - significant viral infection
;; - significant fungal infection
(assert
(! (not
    (or
      (and patient_has_diagnosis_of_bacterial_infectious_disease_inthepast4weeks@@required_treatment_with_oral_or_injectable_antibiotic
           (not patient_has_diagnosis_of_bacterial_infectious_disease_inthepast4weeks@@treatment_completed_at_least_4_weeks_prior_to_screening))
      (and patient_has_diagnosis_of_viral_disease_inthepast4weeks@@is_significant
           (not patient_has_diagnosis_of_viral_disease_inthepast4weeks@@treatment_completed_at_least_4_weeks_prior_to_screening))
      (and patient_has_diagnosis_of_mycosis_inthepast4weeks@@is_significant
           (not patient_has_diagnosis_of_mycosis_inthepast4weeks@@treatment_completed_at_least_4_weeks_prior_to_screening))
    ))
:named REQ12_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if ((the patient has bacterial infection requiring treatment with oral or injectable antibiotic within four weeks of screening) OR (the patient has significant viral infection within four weeks of screening) OR (the patient has significant fungal infection within four weeks of screening)), UNLESS any treatment for such infection has been completed at least four weeks prior to screening."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease."} ;; "malignancy"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@excludes_treated_in_situ_exceptions Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of malignant neoplastic disease excludes treated basal cell carcinoma in situ of the skin, treated squamous cell carcinoma in situ of the skin, treated cervical intraepithelial neoplasia, and treated carcinoma in situ of the cervix.","when_to_set_to_false":"Set to false if the diagnosis includes any of these treated in situ cancers.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether these exceptions apply.","meaning":"Boolean indicating that the diagnosis of malignant neoplastic disease excludes the specified treated in situ cancers."} ;; "EXCEPT treated basal cell carcinoma in situ of the skin OR treated squamous cell carcinoma in situ of the skin OR treated cervical intraepithelial neoplasia OR treated carcinoma in situ of the cervix"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of diagnosis of malignant neoplastic disease.","when_to_set_to_false":"Set to false if the patient does not have a history of diagnosis of malignant neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of diagnosis of malignant neoplastic disease.","meaning":"Boolean indicating whether the patient has a history of diagnosis of malignant neoplastic disease."} ;; "malignancy"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@excludes_treated_in_situ_exceptions Bool) ;; {"when_to_set_to_true":"Set to true if the history of malignant neoplastic disease excludes treated basal cell carcinoma in situ of the skin, treated squamous cell carcinoma in situ of the skin, treated cervical intraepithelial neoplasia, and treated carcinoma in situ of the cervix.","when_to_set_to_false":"Set to false if the history includes any of these treated in situ cancers.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether these exceptions apply in the patient's history.","meaning":"Boolean indicating that the history of malignant neoplastic disease excludes the specified treated in situ cancers."} ;; "EXCEPT treated basal cell carcinoma in situ of the skin OR treated squamous cell carcinoma in situ of the skin OR treated cervical intraepithelial neoplasia OR treated carcinoma in situ of the cervix"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variables imply corresponding stem variables (current diagnosis)
(assert
(! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@excludes_treated_in_situ_exceptions
     patient_has_diagnosis_of_malignant_neoplastic_disease_now)
:named REQ13_AUXILIARY0)) ;; "EXCEPT treated basal cell carcinoma in situ of the skin OR treated squamous cell carcinoma in situ of the skin OR treated cervical intraepithelial neoplasia OR treated carcinoma in situ of the cervix"

;; Qualifier variables imply corresponding stem variables (history)
(assert
(! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@excludes_treated_in_situ_exceptions
     patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory)
:named REQ13_AUXILIARY1)) ;; "EXCEPT treated basal cell carcinoma in situ of the skin OR treated squamous cell carcinoma in situ of the skin OR treated cervical intraepithelial neoplasia OR treated carcinoma in situ of the cervix"

;; ===================== Constraint Assertions (REQ 13) =====================
;; Exclusion: patient must NOT have current or historical malignancy except for the specified treated in situ exceptions
(assert
(! (not patient_has_diagnosis_of_malignant_neoplastic_disease_now@@excludes_treated_in_situ_exceptions)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has malignancy EXCEPT treated basal cell carcinoma in situ of the skin OR treated squamous cell carcinoma in situ of the skin OR treated cervical intraepithelial neoplasia OR treated carcinoma in situ of the cervix)."

(assert
(! (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@excludes_treated_in_situ_exceptions)
:named REQ13_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a history of malignancy EXCEPT treated basal cell carcinoma in situ of the skin OR treated squamous cell carcinoma in situ of the skin OR treated cervical intraepithelial neoplasia OR treated carcinoma in situ of the cervix)."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_undergone_surgical_procedure_inthepast8weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a surgical procedure within the past 8 weeks prior to screening.","when_to_set_to_false":"Set to false if the patient has not undergone a surgical procedure within the past 8 weeks prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a surgical procedure within the past 8 weeks prior to screening.","meaning":"Boolean indicating whether the patient has undergone a surgical procedure within the past 8 weeks prior to screening."} ;; "surgery within eight weeks prior to screening"
(declare-const patient_has_undergone_surgical_procedure_inthepast8weeks@@is_major Bool) ;; {"when_to_set_to_true":"Set to true if the surgical procedure undergone within the past 8 weeks is major.","when_to_set_to_false":"Set to false if the surgical procedure undergone within the past 8 weeks is not major.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surgical procedure undergone within the past 8 weeks is major.","meaning":"Boolean indicating whether the surgical procedure undergone within the past 8 weeks is major."} ;; "major surgery within eight weeks prior to screening"
(declare-const patient_will_undergo_surgical_procedure_inthefuture6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a planned surgical procedure within the next 6 months following randomization.","when_to_set_to_false":"Set to false if the patient does not have a planned surgical procedure within the next 6 months following randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a planned surgical procedure within the next 6 months following randomization.","meaning":"Boolean indicating whether the patient has a planned surgical procedure within the next 6 months following randomization."} ;; "planned surgery within six months following randomization"
(declare-const patient_will_undergo_surgical_procedure_inthefuture6months@@is_major Bool) ;; {"when_to_set_to_true":"Set to true if the planned surgical procedure within the next 6 months is major.","when_to_set_to_false":"Set to false if the planned surgical procedure within the next 6 months is not major.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the planned surgical procedure within the next 6 months is major.","meaning":"Boolean indicating whether the planned surgical procedure within the next 6 months is major."} ;; "planned major surgery within six months following randomization"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Non-exhaustive examples: joint surgery is an example of major surgery, but not the only type
;; (No implication needed for non-exhaustive examples, as per instructions, unless a specific variable for joint surgery is present.)

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_undergone_surgical_procedure_inthepast8weeks@@is_major
      patient_has_undergone_surgical_procedure_inthepast8weeks)
:named REQ14_AUXILIARY0)) ;; "major surgery within eight weeks prior to screening"

(assert
(! (=> patient_will_undergo_surgical_procedure_inthefuture6months@@is_major
      patient_will_undergo_surgical_procedure_inthefuture6months)
:named REQ14_AUXILIARY1)) ;; "planned major surgery within six months following randomization"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_undergone_surgical_procedure_inthepast8weeks@@is_major)
    :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had major surgery with non-exhaustive examples (joint surgery) within eight weeks prior to screening."

(assert
(! (not patient_will_undergo_surgical_procedure_inthefuture6months@@is_major)
    :named REQ14_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has planned major surgery with non-exhaustive examples (joint surgery) within six months following randomization."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_finding_of_erythrodermic_psoriasis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of erythrodermic psoriasis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of erythrodermic psoriasis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has erythrodermic psoriasis.","meaning":"Boolean indicating whether the patient currently has erythrodermic psoriasis."} ;; "erythrodermic psoriasis"
(declare-const patient_has_finding_of_guttate_psoriasis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of guttate psoriasis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of guttate psoriasis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has guttate psoriasis.","meaning":"Boolean indicating whether the patient currently has guttate psoriasis."} ;; "guttate psoriasis"
(declare-const patient_has_finding_of_pustular_psoriasis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pustular psoriasis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pustular psoriasis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pustular psoriasis.","meaning":"Boolean indicating whether the patient currently has pustular psoriasis."} ;; "pustular psoriasis"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_finding_of_erythrodermic_psoriasis_now)
:named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has erythrodermic psoriasis."

(assert
(! (not patient_has_finding_of_guttate_psoriasis_now)
:named REQ15_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has guttate psoriasis."

(assert
(! (not patient_has_finding_of_pustular_psoriasis_now)
:named REQ15_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pustular psoriasis."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_used_topical_therapy_for_psoriasis_within_2_weeks_of_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used topical therapy for psoriasis within two weeks prior to randomization.","when_to_set_to_false":"Set to false if the patient has not used topical therapy for psoriasis within two weeks prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used topical therapy for psoriasis within two weeks prior to randomization.","meaning":"Boolean indicating whether the patient has used topical therapy for psoriasis within two weeks prior to randomization."} ;; "has used topical therapy for psoriasis ... within two weeks of randomization"

(declare-const patient_has_used_topical_corticosteroid_therapy_for_psoriasis_within_2_weeks_of_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used topical corticosteroid therapy for psoriasis within two weeks prior to randomization.","when_to_set_to_false":"Set to false if the patient has not used topical corticosteroid therapy for psoriasis within two weeks prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used topical corticosteroid therapy for psoriasis within two weeks prior to randomization.","meaning":"Boolean indicating whether the patient has used topical corticosteroid therapy for psoriasis within two weeks prior to randomization."} ;; "topical corticosteroid therapy ... within two weeks of randomization"

(declare-const patient_has_used_topical_retinoid_therapy_for_psoriasis_within_2_weeks_of_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used topical retinoid therapy for psoriasis within two weeks prior to randomization.","when_to_set_to_false":"Set to false if the patient has not used topical retinoid therapy for psoriasis within two weeks prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used topical retinoid therapy for psoriasis within two weeks prior to randomization.","meaning":"Boolean indicating whether the patient has used topical retinoid therapy for psoriasis within two weeks prior to randomization."} ;; "topical retinoid therapy ... within two weeks of randomization"

(declare-const patient_has_used_topical_vitamin_d_analog_preparation_therapy_for_psoriasis_within_2_weeks_of_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used topical vitamin D analog preparation therapy for psoriasis within two weeks prior to randomization.","when_to_set_to_false":"Set to false if the patient has not used topical vitamin D analog preparation therapy for psoriasis within two weeks prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used topical vitamin D analog preparation therapy for psoriasis within two weeks prior to randomization.","meaning":"Boolean indicating whether the patient has used topical vitamin D analog preparation therapy for psoriasis within two weeks prior to randomization."} ;; "topical vitamin D analog preparation therapy ... within two weeks of randomization"

(declare-const patient_has_used_topical_tacrolimus_therapy_for_psoriasis_within_2_weeks_of_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used topical tacrolimus therapy for psoriasis within two weeks prior to randomization.","when_to_set_to_false":"Set to false if the patient has not used topical tacrolimus therapy for psoriasis within two weeks prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used topical tacrolimus therapy for psoriasis within two weeks prior to randomization.","meaning":"Boolean indicating whether the patient has used topical tacrolimus therapy for psoriasis within two weeks prior to randomization."} ;; "topical tacrolimus therapy ... within two weeks of randomization"

(declare-const patient_has_used_topical_pimecrolimus_therapy_for_psoriasis_within_2_weeks_of_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used topical pimecrolimus therapy for psoriasis within two weeks prior to randomization.","when_to_set_to_false":"Set to false if the patient has not used topical pimecrolimus therapy for psoriasis within two weeks prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used topical pimecrolimus therapy for psoriasis within two weeks prior to randomization.","meaning":"Boolean indicating whether the patient has used topical pimecrolimus therapy for psoriasis within two weeks prior to randomization."} ;; "topical pimecrolimus therapy ... within two weeks of randomization"

(declare-const patient_has_used_topical_anthralin_therapy_for_psoriasis_within_2_weeks_of_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used topical anthralin therapy for psoriasis within two weeks prior to randomization.","when_to_set_to_false":"Set to false if the patient has not used topical anthralin therapy for psoriasis within two weeks prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used topical anthralin therapy for psoriasis within two weeks prior to randomization.","meaning":"Boolean indicating whether the patient has used topical anthralin therapy for psoriasis within two weeks prior to randomization."} ;; "topical anthralin therapy ... within two weeks of randomization"

(declare-const patient_meets_inclusion_criteria_conditions Bool) ;; {"when_to_set_to_true":"Set to true if the patient meets the conditions noted in the inclusion criteria (i.e., is allowed to use topical therapy for psoriasis within two weeks of randomization as per inclusion exceptions).","when_to_set_to_false":"Set to false if the patient does not meet the conditions noted in the inclusion criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient meets the conditions noted in the inclusion criteria.","meaning":"Boolean indicating whether the patient meets the conditions noted in the inclusion criteria."} ;; "the patient does NOT meet the conditions noted in the inclusion criteria"

;; ===================== Auxiliary Assertions (REQ 16) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_used_topical_corticosteroid_therapy_for_psoriasis_within_2_weeks_of_randomization
          patient_has_used_topical_retinoid_therapy_for_psoriasis_within_2_weeks_of_randomization
          patient_has_used_topical_vitamin_d_analog_preparation_therapy_for_psoriasis_within_2_weeks_of_randomization
          patient_has_used_topical_tacrolimus_therapy_for_psoriasis_within_2_weeks_of_randomization
          patient_has_used_topical_pimecrolimus_therapy_for_psoriasis_within_2_weeks_of_randomization
          patient_has_used_topical_anthralin_therapy_for_psoriasis_within_2_weeks_of_randomization)
    patient_has_used_topical_therapy_for_psoriasis_within_2_weeks_of_randomization)
:named REQ16_AUXILIARY0)) ;; "with non-exhaustive examples (topical corticosteroid therapy, topical retinoid therapy, topical vitamin D analog preparation therapy, topical tacrolimus therapy, topical pimecrolimus therapy, topical anthralin therapy)"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not (and patient_has_used_topical_therapy_for_psoriasis_within_2_weeks_of_randomization
             (not patient_meets_inclusion_criteria_conditions)))
:named REQ16_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has used topical therapy for psoriasis ... within two weeks of randomization AND (the patient does NOT meet the conditions noted in the inclusion criteria)."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_finding_of_rheumatic_autoimmune_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a rheumatic autoimmune disease.","when_to_set_to_false":"Set to false if the patient currently does not have a rheumatic autoimmune disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a rheumatic autoimmune disease.","meaning":"Boolean indicating whether the patient currently has a rheumatic autoimmune disease."} ;; "the patient has a rheumatic autoimmune disease"

(declare-const patient_has_finding_of_rheumatic_autoimmune_disease_now@@other_than_psoriatic_arthritis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current rheumatic autoimmune disease is other than psoriatic arthritis.","when_to_set_to_false":"Set to false if the patient's current rheumatic autoimmune disease is psoriatic arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current rheumatic autoimmune disease is other than psoriatic arthritis.","meaning":"Boolean indicating whether the patient's current rheumatic autoimmune disease is other than psoriatic arthritis."} ;; "other than psoriatic arthritis"

(declare-const patient_has_finding_of_systemic_lupus_erythematosus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of systemic lupus erythematosus.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of systemic lupus erythematosus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has systemic lupus erythematosus.","meaning":"Boolean indicating whether the patient currently has systemic lupus erythematosus."} ;; "systemic lupus erythematosus"

(declare-const patient_has_finding_of_mixed_connective_tissue_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of mixed connective tissue disease.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of mixed connective tissue disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has mixed connective tissue disease.","meaning":"Boolean indicating whether the patient currently has mixed connective tissue disease."} ;; "mixed connective tissue disease"

(declare-const patient_has_finding_of_scleroderma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of scleroderma.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of scleroderma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has scleroderma.","meaning":"Boolean indicating whether the patient currently has scleroderma."} ;; "scleroderma"

(declare-const patient_has_finding_of_polymyositis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of polymyositis.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of polymyositis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has polymyositis.","meaning":"Boolean indicating whether the patient currently has polymyositis."} ;; "polymyositis"

;; ===================== Auxiliary Assertions (REQ 17) =====================
;; Non-exhaustive examples imply umbrella term (other than psoriatic arthritis)
(assert
(! (=> (or patient_has_finding_of_systemic_lupus_erythematosus_now
           patient_has_finding_of_mixed_connective_tissue_disease_now
           patient_has_finding_of_scleroderma_now
           patient_has_finding_of_polymyositis_now)
       patient_has_finding_of_rheumatic_autoimmune_disease_now@@other_than_psoriatic_arthritis)
   :named REQ17_AUXILIARY0)) ;; "with non-exhaustive examples (systemic lupus erythematosus, mixed connective tissue disease, scleroderma, polymyositis)."

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_rheumatic_autoimmune_disease_now@@other_than_psoriatic_arthritis
       patient_has_finding_of_rheumatic_autoimmune_disease_now)
   :named REQ17_AUXILIARY1)) ;; "other than psoriatic arthritis"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not patient_has_finding_of_rheumatic_autoimmune_disease_now@@other_than_psoriatic_arthritis)
   :named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a rheumatic autoimmune disease other than psoriatic arthritis with non-exhaustive examples (systemic lupus erythematosus, mixed connective tissue disease, scleroderma, polymyositis))."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_has_diagnosis_of_rheumatoid_arthritis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of rheumatoid arthritis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of rheumatoid arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of rheumatoid arthritis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of rheumatoid arthritis."} ;; "rheumatoid arthritis"
(declare-const patient_is_functional_class_iv_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as functional class IV according to the American College of Rheumatology classification of functional status in rheumatoid arthritis.","when_to_set_to_false":"Set to false if the patient is currently not classified as functional class IV according to the American College of Rheumatology classification of functional status in rheumatoid arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as functional class IV according to the American College of Rheumatology classification of functional status in rheumatoid arthritis.","meaning":"Boolean indicating whether the patient is currently classified as functional class IV according to the American College of Rheumatology classification of functional status in rheumatoid arthritis."} ;; "functional class IV as defined by the American College of Rheumatology classification of functional status in rheumatoid arthritis (Appendix Q)"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
  (! (not (and patient_has_diagnosis_of_rheumatoid_arthritis_now
               patient_is_functional_class_iv_now))
     :named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is functional class IV as defined by the American College of Rheumatology classification of functional status in rheumatoid arthritis (Appendix Q)."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_has_finding_of_inflammatory_joint_disease_inthehistory@@other_than_psoriatic_arthritis Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented prior history of inflammatory joint disease, excluding psoriatic arthritis.","when_to_set_to_false":"Set to false if the patient does not have a documented prior history of inflammatory joint disease, or only has a history of psoriatic arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a prior history of inflammatory joint disease other than psoriatic arthritis.","meaning":"Boolean indicating whether the patient has a prior history of inflammatory joint disease other than psoriatic arthritis."} ;; "prior history of inflammatory joint disease other than psoriatic arthritis"

(declare-const patient_has_finding_of_inflammatory_joint_disease_now@@other_than_psoriatic_arthritis Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has inflammatory joint disease, excluding psoriatic arthritis.","when_to_set_to_false":"Set to false if the patient does not currently have inflammatory joint disease, or only has psoriatic arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has inflammatory joint disease other than psoriatic arthritis.","meaning":"Boolean indicating whether the patient currently has inflammatory joint disease other than psoriatic arthritis."} ;; "current inflammatory joint disease other than psoriatic arthritis"

(declare-const patient_has_finding_of_gout_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented prior history of gout.","when_to_set_to_false":"Set to false if the patient does not have a documented prior history of gout.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a prior history of gout.","meaning":"Boolean indicating whether the patient has a prior history of gout."} ;; "prior history of gout"

(declare-const patient_has_finding_of_gout_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has gout.","when_to_set_to_false":"Set to false if the patient does not currently have gout.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has gout.","meaning":"Boolean indicating whether the patient currently has gout."} ;; "current gout"

(declare-const patient_has_finding_of_reactive_arthritis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented prior history of reactive arthritis.","when_to_set_to_false":"Set to false if the patient does not have a documented prior history of reactive arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a prior history of reactive arthritis.","meaning":"Boolean indicating whether the patient has a prior history of reactive arthritis."} ;; "prior history of reactive arthritis"

(declare-const patient_has_finding_of_reactive_arthritis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has reactive arthritis.","when_to_set_to_false":"Set to false if the patient does not currently have reactive arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has reactive arthritis.","meaning":"Boolean indicating whether the patient currently has reactive arthritis."} ;; "current reactive arthritis"

(declare-const patient_has_finding_of_ankylosing_spondylitis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented prior history of ankylosing spondylitis.","when_to_set_to_false":"Set to false if the patient does not have a documented prior history of ankylosing spondylitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a prior history of ankylosing spondylitis.","meaning":"Boolean indicating whether the patient has a prior history of ankylosing spondylitis."} ;; "prior history of ankylosing spondylitis"

(declare-const patient_has_finding_of_ankylosing_spondylitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ankylosing spondylitis.","when_to_set_to_false":"Set to false if the patient does not currently have ankylosing spondylitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ankylosing spondylitis.","meaning":"Boolean indicating whether the patient currently has ankylosing spondylitis."} ;; "current ankylosing spondylitis"

(declare-const patient_has_finding_of_lyme_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented prior history of Lyme disease.","when_to_set_to_false":"Set to false if the patient does not have a documented prior history of Lyme disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a prior history of Lyme disease.","meaning":"Boolean indicating whether the patient has a prior history of Lyme disease."} ;; "prior history of Lyme disease"

(declare-const patient_has_finding_of_lyme_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has Lyme disease.","when_to_set_to_false":"Set to false if the patient does not currently have Lyme disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Lyme disease.","meaning":"Boolean indicating whether the patient currently has Lyme disease."} ;; "current Lyme disease"

;; ===================== Auxiliary Assertions (REQ 19) =====================
;; Non-exhaustive examples imply umbrella term for prior history
(assert
(! (=> (or patient_has_finding_of_gout_inthehistory
           patient_has_finding_of_reactive_arthritis_inthehistory
           patient_has_diagnosis_of_rheumatoid_arthritis_now
           patient_has_finding_of_ankylosing_spondylitis_inthehistory
           patient_has_finding_of_lyme_disease_inthehistory)
        patient_has_finding_of_inflammatory_joint_disease_inthehistory@@other_than_psoriatic_arthritis)
   :named REQ19_AUXILIARY0)) ;; "with non-exhaustive examples (gout, reactive arthritis, rheumatoid arthritis, ankylosing spondylitis, Lyme disease)" for prior history

;; Non-exhaustive examples imply umbrella term for current disease
(assert
(! (=> (or patient_has_finding_of_gout_now
           patient_has_finding_of_reactive_arthritis_now
           patient_has_diagnosis_of_rheumatoid_arthritis_now
           patient_has_finding_of_ankylosing_spondylitis_now
           patient_has_finding_of_lyme_disease_now)
        patient_has_finding_of_inflammatory_joint_disease_now@@other_than_psoriatic_arthritis)
   :named REQ19_AUXILIARY1)) ;; "with non-exhaustive examples (gout, reactive arthritis, rheumatoid arthritis, ankylosing spondylitis, Lyme disease)" for current disease

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not patient_has_finding_of_inflammatory_joint_disease_inthehistory@@other_than_psoriatic_arthritis)
   :named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a prior history of inflammatory joint disease other than psoriatic arthritis..."

(assert
(! (not patient_has_finding_of_inflammatory_joint_disease_now@@other_than_psoriatic_arthritis)
   :named REQ19_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current inflammatory joint disease other than psoriatic arthritis..."

;; ===================== Declarations for the exclusion criterion (REQ 20) =====================
(declare-const patient_has_prior_use_of_disease_modifying_antirheumatic_drug Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used any disease modifying antirheumatic drug at any time prior to the current time.","when_to_set_to_false":"Set to false if the patient has never used any disease modifying antirheumatic drug prior to the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any disease modifying antirheumatic drug prior to the current time.","meaning":"Boolean indicating whether the patient has prior use of any disease modifying antirheumatic drug before the current time."} ;; "prior use of disease modifying antirheumatic drug"

(declare-const patient_has_prior_use_of_small_molecule_disease_modifying_antirheumatic_drug Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used a small molecule disease modifying antirheumatic drug at any time prior to the current time.","when_to_set_to_false":"Set to false if the patient has never used a small molecule disease modifying antirheumatic drug prior to the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used a small molecule disease modifying antirheumatic drug prior to the current time.","meaning":"Boolean indicating whether the patient has prior use of a small molecule disease modifying antirheumatic drug before the current time."} ;; "small molecule disease modifying antirheumatic drug"

(declare-const patient_has_prior_use_of_biologic_disease_modifying_antirheumatic_drug Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used a biologic disease modifying antirheumatic drug at any time prior to the current time.","when_to_set_to_false":"Set to false if the patient has never used a biologic disease modifying antirheumatic drug prior to the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used a biologic disease modifying antirheumatic drug prior to the current time.","meaning":"Boolean indicating whether the patient has prior use of a biologic disease modifying antirheumatic drug before the current time."} ;; "biologic disease modifying antirheumatic drug"

;; ===================== Auxiliary Assertions (REQ 20) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_prior_use_of_small_molecule_disease_modifying_antirheumatic_drug
           patient_has_prior_use_of_biologic_disease_modifying_antirheumatic_drug)
       patient_has_prior_use_of_disease_modifying_antirheumatic_drug)
   :named REQ20_AUXILIARY0)) ;; "with non-exhaustive examples (small molecule disease modifying antirheumatic drug OR biologic disease modifying antirheumatic drug)."

;; ===================== Constraint Assertions (REQ 20) =====================
(assert
(! (not patient_has_prior_use_of_disease_modifying_antirheumatic_drug)
   :named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has prior use of disease modifying antirheumatic drug with non-exhaustive examples (small molecule disease modifying antirheumatic drug OR biologic disease modifying antirheumatic drug)."

;; ===================== Declarations for the exclusion criterion (REQ 21) =====================
(declare-const patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken a corticosteroid or corticosteroid derivative containing product within the past 4 weeks.","when_to_set_to_false":"Set to false if the patient has not taken a corticosteroid or corticosteroid derivative containing product within the past 4 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken a corticosteroid or corticosteroid derivative containing product within the past 4 weeks.","meaning":"Boolean indicating whether the patient has taken a corticosteroid or corticosteroid derivative containing product within the past 4 weeks."} ;; "systemic corticosteroid therapy (except as noted in inclusion criteria) within four weeks of randomization"
(declare-const patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast4weeks@@systemic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the corticosteroid or corticosteroid derivative containing product taken within the past 4 weeks was administered as systemic therapy.","when_to_set_to_false":"Set to false if the product taken was not administered as systemic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the product was administered as systemic therapy.","meaning":"Boolean indicating whether the corticosteroid or corticosteroid derivative containing product taken within the past 4 weeks was administered as systemic therapy."} ;; "systemic corticosteroid therapy within four weeks of randomization"
(declare-const patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast4weeks@@except_as_noted_in_inclusion_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the use of corticosteroid or corticosteroid derivative containing product within the past 4 weeks is excepted as noted in the inclusion criteria.","when_to_set_to_false":"Set to false if the use is not excepted as noted in the inclusion criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the use is excepted as noted in the inclusion criteria.","meaning":"Boolean indicating whether the use of corticosteroid or corticosteroid derivative containing product within the past 4 weeks is excepted as noted in the inclusion criteria."} ;; "systemic corticosteroid therapy (except as noted in inclusion criteria) within four weeks of randomization"
(declare-const patient_is_exposed_to_retinoid_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to retinoid within the past 4 weeks.","when_to_set_to_false":"Set to false if the patient has not been exposed to retinoid within the past 4 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to retinoid within the past 4 weeks.","meaning":"Boolean indicating whether the patient has been exposed to retinoid within the past 4 weeks."} ;; "oral retinoid therapy within four weeks of randomization"
(declare-const patient_is_exposed_to_retinoid_inthepast4weeks@@oral_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the retinoid exposure within the past 4 weeks was administered as oral therapy.","when_to_set_to_false":"Set to false if the retinoid exposure was not administered as oral therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the retinoid exposure was administered as oral therapy.","meaning":"Boolean indicating whether the retinoid exposure within the past 4 weeks was administered as oral therapy."} ;; "oral retinoid therapy within four weeks of randomization"
(declare-const patient_has_taken_fumaric_acid_ester_therapy_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken fumaric acid ester therapy within the past 4 weeks.","when_to_set_to_false":"Set to false if the patient has not taken fumaric acid ester therapy within the past 4 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken fumaric acid ester therapy within the past 4 weeks.","meaning":"Boolean indicating whether the patient has taken fumaric acid ester therapy within the past 4 weeks."} ;; "fumaric acid ester therapy within four weeks of randomization"
(declare-const patient_has_taken_fumaric_acid_ester_therapy_inthepast4weeks@@systemic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the fumaric acid ester therapy taken within the past 4 weeks was administered as systemic therapy.","when_to_set_to_false":"Set to false if the fumaric acid ester therapy taken within the past 4 weeks was not administered as systemic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the fumaric acid ester therapy taken within the past 4 weeks was administered as systemic therapy.","meaning":"Boolean indicating whether the fumaric acid ester therapy taken within the past 4 weeks was administered as systemic therapy."} ;; "fumaric acid ester therapy within four weeks of randomization"

;; ===================== Auxiliary Assertions (REQ 21) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast4weeks@@systemic_therapy
           patient_is_exposed_to_retinoid_inthepast4weeks@@oral_therapy
           patient_has_taken_fumaric_acid_ester_therapy_inthepast4weeks@@systemic_therapy)
      (or patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast4weeks
          patient_is_exposed_to_retinoid_inthepast4weeks
          patient_has_taken_fumaric_acid_ester_therapy_inthepast4weeks))
:named REQ21_AUXILIARY0)) ;; "with non-exhaustive examples (systemic corticosteroid therapy (except as noted in inclusion criteria) OR oral retinoid therapy OR fumaric acid ester therapy) within four weeks of randomization."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast4weeks@@systemic_therapy
      patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast4weeks)
:named REQ21_AUXILIARY1)) ;; "systemic corticosteroid therapy within four weeks of randomization"

(assert
(! (=> patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast4weeks@@except_as_noted_in_inclusion_criteria
      patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast4weeks)
:named REQ21_AUXILIARY2)) ;; "systemic corticosteroid therapy (except as noted in inclusion criteria) within four weeks of randomization"

(assert
(! (=> patient_is_exposed_to_retinoid_inthepast4weeks@@oral_therapy
      patient_is_exposed_to_retinoid_inthepast4weeks)
:named REQ21_AUXILIARY3)) ;; "oral retinoid therapy within four weeks of randomization"

(assert
(! (=> patient_has_taken_fumaric_acid_ester_therapy_inthepast4weeks@@systemic_therapy
      patient_has_taken_fumaric_acid_ester_therapy_inthepast4weeks)
:named REQ21_AUXILIARY4)) ;; "fumaric acid ester therapy within four weeks of randomization"

;; ===================== Constraint Assertions (REQ 21) =====================
(assert
(! (not (or
         (and patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast4weeks@@systemic_therapy
              (not patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast4weeks@@except_as_noted_in_inclusion_criteria))
         patient_is_exposed_to_retinoid_inthepast4weeks@@oral_therapy
         patient_has_taken_fumaric_acid_ester_therapy_inthepast4weeks@@systemic_therapy))
:named REQ21_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used at least one systemic therapy with non-exhaustive examples (systemic corticosteroid therapy (except as noted in inclusion criteria) OR oral retinoid therapy OR fumaric acid ester therapy) within four weeks of randomization."

;; ===================== Declarations for the exclusion criterion (REQ 22) =====================
(declare-const patient_has_undergone_phototherapy_within_4_weeks_before_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone any form of phototherapy within the 4 weeks before randomization.","when_to_set_to_false":"Set to false if the patient has not undergone any form of phototherapy within the 4 weeks before randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone any form of phototherapy within the 4 weeks before randomization.","meaning":"Boolean indicating whether the patient has undergone any form of phototherapy within the 4 weeks before randomization."} ;; "has used at least one phototherapy ... within four weeks of randomization"
(declare-const patient_has_undergone_ultraviolet_b_therapy_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone ultraviolet B phototherapy within the past 4 weeks prior to randomization.","when_to_set_to_false":"Set to false if the patient has not undergone ultraviolet B phototherapy within the past 4 weeks prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone ultraviolet B phototherapy within the past 4 weeks prior to randomization.","meaning":"Boolean indicating whether the patient has undergone ultraviolet B phototherapy within the past 4 weeks."} ;; "ultraviolet B phototherapy ... within four weeks of randomization"
(declare-const patient_has_undergone_ultraviolet_b_therapy_inthepast4weeks@@temporalcontext_within4weeks_before_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone ultraviolet B phototherapy within the 4 weeks before randomization.","when_to_set_to_false":"Set to false if the patient has not undergone ultraviolet B phototherapy within the 4 weeks before randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone ultraviolet B phototherapy within the 4 weeks before randomization.","meaning":"Boolean indicating whether the patient has undergone ultraviolet B phototherapy within the 4 weeks before randomization."} ;; "ultraviolet B phototherapy ... within four weeks of randomization"
(declare-const patient_has_undergone_photochemotherapy_with_psoralens_and_ultraviolet_a_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone psoralen and ultraviolet A phototherapy within the past 4 weeks prior to randomization.","when_to_set_to_false":"Set to false if the patient has not undergone psoralen and ultraviolet A phototherapy within the past 4 weeks prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone psoralen and ultraviolet A phototherapy within the past 4 weeks prior to randomization.","meaning":"Boolean indicating whether the patient has undergone psoralen and ultraviolet A phototherapy within the past 4 weeks."} ;; "psoralen and ultraviolet A phototherapy ... within four weeks of randomization"
(declare-const patient_has_undergone_photochemotherapy_with_psoralens_and_ultraviolet_a_inthepast4weeks@@temporalcontext_within4weeks_before_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone psoralen and ultraviolet A phototherapy within the 4 weeks before randomization.","when_to_set_to_false":"Set to false if the patient has not undergone psoralen and ultraviolet A phototherapy within the 4 weeks before randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone psoralen and ultraviolet A phototherapy within the 4 weeks before randomization.","meaning":"Boolean indicating whether the patient has undergone psoralen and ultraviolet A phototherapy within the 4 weeks before randomization."} ;; "psoralen and ultraviolet A phototherapy ... within four weeks of randomization"

;; ===================== Auxiliary Assertions (REQ 22) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_undergone_ultraviolet_b_therapy_inthepast4weeks@@temporalcontext_within4weeks_before_randomization
          patient_has_undergone_photochemotherapy_with_psoralens_and_ultraviolet_a_inthepast4weeks@@temporalcontext_within4weeks_before_randomization)
     patient_has_undergone_phototherapy_within_4_weeks_before_randomization)
:named REQ22_AUXILIARY0)) ;; "with non-exhaustive examples (ultraviolet B phototherapy OR psoralen and ultraviolet A phototherapy) within four weeks of randomization."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_undergone_ultraviolet_b_therapy_inthepast4weeks@@temporalcontext_within4weeks_before_randomization
      patient_has_undergone_ultraviolet_b_therapy_inthepast4weeks)
:named REQ22_AUXILIARY1)) ;; "ultraviolet B phototherapy within four weeks of randomization"

(assert
(! (=> patient_has_undergone_photochemotherapy_with_psoralens_and_ultraviolet_a_inthepast4weeks@@temporalcontext_within4weeks_before_randomization
      patient_has_undergone_photochemotherapy_with_psoralens_and_ultraviolet_a_inthepast4weeks)
:named REQ22_AUXILIARY2)) ;; "psoralen and ultraviolet A phototherapy within four weeks of randomization"

;; ===================== Constraint Assertions (REQ 22) =====================
(assert
(! (not patient_has_undergone_phototherapy_within_4_weeks_before_randomization)
:named REQ22_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used at least one phototherapy with non-exhaustive examples (ultraviolet B phototherapy OR psoralen and ultraviolet A phototherapy) within four weeks of randomization."

;; ===================== Declarations for the exclusion criterion (REQ 23) =====================
(declare-const patient_is_exposed_to_cell_depleting_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received any cell depleting therapy as previous treatment at any time in the past.","when_to_set_to_false":"Set to false if the patient has never received any cell depleting therapy as previous treatment at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received any cell depleting therapy as previous treatment at any time in the past.","meaning":"Boolean indicating whether the patient has ever received any cell depleting therapy as previous treatment at any time in the past."} ;; "previous treatment with at least one cell depleting therapy"

(declare-const patient_is_exposed_to_investigational_agent_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received any investigational agent as previous treatment at any time in the past.","when_to_set_to_false":"Set to false if the patient has never received any investigational agent as previous treatment at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received any investigational agent as previous treatment at any time in the past.","meaning":"Boolean indicating whether the patient has ever received any investigational agent as previous treatment at any time in the past."} ;; "investigational agent"

(declare-const patient_is_exposed_to_rituximab_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to rituximab at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to rituximab at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to rituximab.","meaning":"Boolean indicating whether the patient has ever been exposed to rituximab at any time in the past."} ;; "rituximab"

(declare-const patient_is_exposed_to_alemtuzumab_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to alemtuzumab at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to alemtuzumab at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to alemtuzumab.","meaning":"Boolean indicating whether the patient has ever been exposed to alemtuzumab at any time in the past."} ;; "alemtuzumab"

(declare-const patient_is_exposed_to_lymphocyte_antigen_cd4_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to anti-CD4 therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to anti-CD4 therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to anti-CD4 therapy.","meaning":"Boolean indicating whether the patient has ever been exposed to anti-CD4 therapy at any time in the past."} ;; "anti-CD4 therapy"

(declare-const patient_is_exposed_to_lymphocyte_antigen_cd5_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to anti-CD5 therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to anti-CD5 therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to anti-CD5 therapy.","meaning":"Boolean indicating whether the patient has ever been exposed to anti-CD5 therapy at any time in the past."} ;; "anti-CD5 therapy"

(declare-const patient_is_exposed_to_lymphocyte_antigen_cd3_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to anti-CD3 therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to anti-CD3 therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to anti-CD3 therapy.","meaning":"Boolean indicating whether the patient has ever been exposed to anti-CD3 therapy at any time in the past."} ;; "anti-CD3 therapy"

(declare-const patient_is_exposed_to_lymphocyte_antigen_cd19_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to anti-CD19 therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to anti-CD19 therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to anti-CD19 therapy.","meaning":"Boolean indicating whether the patient has ever been exposed to anti-CD19 therapy at any time in the past."} ;; "anti-CD19 therapy"

(declare-const patient_is_exposed_to_lymphocyte_antigen_cd20_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to anti-CD20 therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to anti-CD20 therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to anti-CD20 therapy.","meaning":"Boolean indicating whether the patient has ever been exposed to anti-CD20 therapy at any time in the past."} ;; "anti-CD20 therapy"

;; ===================== Auxiliary Assertions (REQ 23) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_is_exposed_to_investigational_agent_inthehistory
          patient_is_exposed_to_rituximab_inthehistory
          patient_is_exposed_to_alemtuzumab_inthehistory
          patient_is_exposed_to_lymphocyte_antigen_cd4_inthehistory
          patient_is_exposed_to_lymphocyte_antigen_cd5_inthehistory
          patient_is_exposed_to_lymphocyte_antigen_cd3_inthehistory
          patient_is_exposed_to_lymphocyte_antigen_cd19_inthehistory
          patient_is_exposed_to_lymphocyte_antigen_cd20_inthehistory)
     patient_is_exposed_to_cell_depleting_therapy_inthehistory)
:named REQ23_AUXILIARY0)) ;; "with non-exhaustive examples (investigational agent OR rituximab OR alemtuzumab OR anti-CD4 therapy OR anti-CD5 therapy OR anti-CD3 therapy OR anti-CD19 therapy OR anti-CD20 therapy)"

;; ===================== Constraint Assertions (REQ 23) =====================
(assert
(! (not patient_is_exposed_to_cell_depleting_therapy_inthehistory)
:named REQ23_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous treatment with at least one cell depleting therapy with non-exhaustive examples (investigational agent OR rituximab OR alemtuzumab OR anti-CD4 therapy OR anti-CD5 therapy OR anti-CD3 therapy OR anti-CD19 therapy OR anti-CD20 therapy)."

;; ===================== Declarations for the exclusion criterion (REQ 24) =====================
(declare-const patient_is_exposed_to_gamma_globulin_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to gamma globulin within the past six months.","when_to_set_to_false":"Set to false if the patient has not been exposed to gamma globulin within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to gamma globulin within the past six months.","meaning":"Boolean indicating whether the patient has been exposed to gamma globulin within the past six months."} ;; "intravenous gamma globulin within six months of baseline"
(declare-const patient_is_exposed_to_gamma_globulin_inthepast6months@@temporalcontext_within6months_of_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the six-month window for gamma globulin exposure is anchored to baseline.","when_to_set_to_false":"Set to false if the six-month window is not anchored to baseline.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the six-month window is anchored to baseline.","meaning":"Boolean indicating whether the six-month window for gamma globulin exposure is anchored to baseline."} ;; "within six months of baseline"
(declare-const patient_has_undergone_plasmapheresis_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone plasmapheresis within the past six months.","when_to_set_to_false":"Set to false if the patient has not undergone plasmapheresis within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone plasmapheresis within the past six months.","meaning":"Boolean indicating whether the patient has undergone plasmapheresis within the past six months."} ;; "plasmapheresis within six months of baseline"
(declare-const patient_has_undergone_plasmapheresis_inthepast6months@@temporalcontext_within6months_of_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the six-month window for plasmapheresis is anchored to baseline.","when_to_set_to_false":"Set to false if the six-month window is not anchored to baseline.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the six-month window is anchored to baseline.","meaning":"Boolean indicating whether the six-month window for plasmapheresis is anchored to baseline."} ;; "within six months of baseline"
(declare-const patient_has_received_prosorba_column_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received treatment with Prosorba column within the past six months.","when_to_set_to_false":"Set to false if the patient has not received treatment with Prosorba column within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received treatment with Prosorba column within the past six months.","meaning":"Boolean indicating whether the patient has received treatment with Prosorba column within the past six months."} ;; "Prosorba column within six months of baseline"
(declare-const patient_has_received_prosorba_column_inthepast6months@@temporalcontext_within6months_of_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the six-month window for Prosorba column treatment is anchored to baseline.","when_to_set_to_false":"Set to false if the six-month window is not anchored to baseline.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the six-month window is anchored to baseline.","meaning":"Boolean indicating whether the six-month window for Prosorba column treatment is anchored to baseline."} ;; "within six months of baseline"

;; ===================== Constraint Assertions (REQ 24) =====================
(assert
(! (not (or patient_is_exposed_to_gamma_globulin_inthepast6months
            patient_has_undergone_plasmapheresis_inthepast6months
            patient_has_received_prosorba_column_inthepast6months))
   :named REQ24_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had treatment with at least one of the following within six months of baseline: intravenous gamma globulin OR plasmapheresis OR Prosorba column."
