;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_medullary_thyroid_carcinoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of medullary thyroid carcinoma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of medullary thyroid carcinoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of medullary thyroid carcinoma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of medullary thyroid carcinoma."}  ;; "To be included, the patient must have histologically confirmed medullary thyroid cancer."
(declare-const patient_has_diagnosis_of_medullary_thyroid_carcinoma_now@@histologically_confirmed Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of medullary thyroid carcinoma is histologically confirmed.","when_to_set_to_false":"Set to false if the patient's diagnosis of medullary thyroid carcinoma is not histologically confirmed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is histologically confirmed.","meaning":"Boolean indicating whether the patient's diagnosis of medullary thyroid carcinoma is histologically confirmed."}  ;; "To be included, the patient must have histologically confirmed medullary thyroid cancer."
(declare-const patient_has_signs_of_residual_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has signs of residual disease.","when_to_set_to_false":"Set to false if the patient currently does not have signs of residual disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has signs of residual disease.","meaning":"Boolean indicating whether the patient currently has signs of residual disease."}  ;; "signs of residual disease"
(declare-const patient_has_signs_of_persistent_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has signs of persistent disease.","when_to_set_to_false":"Set to false if the patient currently does not have signs of persistent disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has signs of persistent disease.","meaning":"Boolean indicating whether the patient currently has signs of persistent disease."}  ;; "signs of persistent disease"
(declare-const patient_has_undergone_tumor_marker_measurement_now_outcome_is_abnormal Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone tumor marker measurement now and the outcome is abnormal.","when_to_set_to_false":"Set to false if the patient has undergone tumor marker measurement now and the outcome is not abnormal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone tumor marker measurement now and the outcome is abnormal.","meaning":"Boolean indicating whether the patient has undergone tumor marker measurement now and the outcome is abnormal."}  ;; "signs of persistent disease based on tumor marker levels"
(declare-const patient_has_undergone_radiographic_imaging_procedure_now_outcome_is_abnormal Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone radiographic imaging procedure now and the outcome is abnormal.","when_to_set_to_false":"Set to false if the patient has undergone radiographic imaging procedure now and the outcome is not abnormal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone radiographic imaging procedure now and the outcome is abnormal.","meaning":"Boolean indicating whether the patient has undergone radiographic imaging procedure now and the outcome is abnormal."}  ;; "signs of persistent disease based on radiographic imaging"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (cancer)."}  ;; "malignant neoplastic disease (cancer)"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@diagnosis_confirmed_by_pathologic_review_performed_at_university_of_wisconsin_carbone_cancer_center Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of malignant neoplastic disease (cancer) is confirmed by pathologic review performed at University of Wisconsin Carbone Cancer Center.","when_to_set_to_false":"Set to false if the patient's diagnosis of malignant neoplastic disease (cancer) is not confirmed by pathologic review performed at University of Wisconsin Carbone Cancer Center.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is confirmed by pathologic review performed at University of Wisconsin Carbone Cancer Center.","meaning":"Boolean indicating whether the patient's diagnosis of malignant neoplastic disease (cancer) is confirmed by pathologic review performed at University of Wisconsin Carbone Cancer Center."}  ;; "pathologic diagnosis confirmed by pathologic review performed at University of Wisconsin Carbone Cancer Center"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@grading_confirmed_by_pathologic_review_performed_at_university_of_wisconsin_carbone_cancer_center Bool) ;; {"when_to_set_to_true":"Set to true if the grading of the patient's malignant neoplastic disease (cancer) is confirmed by pathologic review performed at University of Wisconsin Carbone Cancer Center.","when_to_set_to_false":"Set to false if the grading of the patient's malignant neoplastic disease (cancer) is not confirmed by pathologic review performed at University of Wisconsin Carbone Cancer Center.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the grading is confirmed by pathologic review performed at University of Wisconsin Carbone Cancer Center.","meaning":"Boolean indicating whether the grading of the patient's malignant neoplastic disease (cancer) is confirmed by pathologic review performed at University of Wisconsin Carbone Cancer Center."}  ;; "pathologic grading confirmed by pathologic review performed at University of Wisconsin Carbone Cancer Center"
(declare-const patient_has_undergone_pathologist_evaluation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone pathologist evaluation (pathologic review) now.","when_to_set_to_false":"Set to false if the patient has not undergone pathologist evaluation (pathologic review) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone pathologist evaluation (pathologic review) now.","meaning":"Boolean indicating whether the patient has undergone pathologist evaluation (pathologic review) now."}  ;; "pathologic review"
(declare-const patient_has_undergone_pathologist_evaluation_now@@performed_at_university_of_wisconsin_carbone_cancer_center Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pathologist evaluation (pathologic review) was performed at University of Wisconsin Carbone Cancer Center.","when_to_set_to_false":"Set to false if the patient's pathologist evaluation (pathologic review) was not performed at University of Wisconsin Carbone Cancer Center.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pathologist evaluation (pathologic review) was performed at University of Wisconsin Carbone Cancer Center.","meaning":"Boolean indicating whether the patient's pathologist evaluation (pathologic review) was performed at University of Wisconsin Carbone Cancer Center."}  ;; "pathologic review performed at University of Wisconsin Carbone Cancer Center"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable for medullary thyroid carcinoma histologic confirmation
(assert
  (! (=> patient_has_diagnosis_of_medullary_thyroid_carcinoma_now@@histologically_confirmed
         patient_has_diagnosis_of_medullary_thyroid_carcinoma_now)
     :named REQ0_AUXILIARY0)) ;; "histologically confirmed medullary thyroid cancer"

;; Persistent disease based on tumor marker levels or radiographic imaging implies persistent disease umbrella
(assert
  (! (=> (or patient_has_undergone_tumor_marker_measurement_now_outcome_is_abnormal
             patient_has_undergone_radiographic_imaging_procedure_now_outcome_is_abnormal)
         patient_has_signs_of_persistent_disease_now)
     :named REQ0_AUXILIARY1)) ;; "signs of persistent disease based on tumor marker levels or radiographic imaging"

;; Qualifier variable implies stem variable for pathologic review performed at UWCCC
(assert
  (! (=> patient_has_undergone_pathologist_evaluation_now@@performed_at_university_of_wisconsin_carbone_cancer_center
         patient_has_undergone_pathologist_evaluation_now)
     :named REQ0_AUXILIARY2)) ;; "pathologic review performed at University of Wisconsin Carbone Cancer Center"

;; Qualifier variable implies stem variable for diagnosis confirmed by pathologic review at UWCCC
(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@diagnosis_confirmed_by_pathologic_review_performed_at_university_of_wisconsin_carbone_cancer_center
         patient_has_diagnosis_of_malignant_neoplastic_disease_now)
     :named REQ0_AUXILIARY3)) ;; "diagnosis confirmed by pathologic review performed at University of Wisconsin Carbone Cancer Center"

;; Qualifier variable implies stem variable for grading confirmed by pathologic review at UWCCC
(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@grading_confirmed_by_pathologic_review_performed_at_university_of_wisconsin_carbone_cancer_center
         patient_has_diagnosis_of_malignant_neoplastic_disease_now)
     :named REQ0_AUXILIARY4)) ;; "grading confirmed by pathologic review performed at University of Wisconsin Carbone Cancer Center"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: histologically confirmed medullary thyroid cancer
(assert
  (! patient_has_diagnosis_of_medullary_thyroid_carcinoma_now@@histologically_confirmed
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have histologically confirmed medullary thyroid cancer."

;; Component 1: (signs of residual disease) OR (signs of persistent disease based on tumor marker levels) OR (signs of persistent disease based on radiographic imaging)
(assert
  (! (or patient_has_signs_of_residual_disease_now
         patient_has_undergone_tumor_marker_measurement_now_outcome_is_abnormal
         patient_has_undergone_radiographic_imaging_procedure_now_outcome_is_abnormal)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "signs of residual disease OR signs of persistent disease based on tumor marker levels OR signs of persistent disease based on radiographic imaging"

;; Component 2: pathologic diagnosis confirmed by pathologic review performed at University of Wisconsin Carbone Cancer Center
(assert
  (! patient_has_diagnosis_of_malignant_neoplastic_disease_now@@diagnosis_confirmed_by_pathologic_review_performed_at_university_of_wisconsin_carbone_cancer_center
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "pathologic diagnosis confirmed by pathologic review performed at University of Wisconsin Carbone Cancer Center"

;; Component 3: pathologic grading confirmed by pathologic review performed at University of Wisconsin Carbone Cancer Center
(assert
  (! patient_has_diagnosis_of_malignant_neoplastic_disease_now@@grading_confirmed_by_pathologic_review_performed_at_university_of_wisconsin_carbone_cancer_center
     :named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "pathologic grading confirmed by pathologic review performed at University of Wisconsin Carbone Cancer Center"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const neuroendocrine_marker_levels_value_recorded_at_least_1_month_post_operation_withunit_ng_per_ml Real) ;; {"when_to_set_to_value":"Set to the measured value of neuroendocrine marker levels if the measurement was performed at least 1 month post-operation and the value is available, in ng/mL.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or no measurement was performed at least 1 month post-operation.","meaning":"Numeric value of neuroendocrine marker levels measured at least 1 month post-operation, in ng/mL."}  ;; "the value of neuroendocrine marker levels measured at least 1 month after the patient's operation, in ng/mL"

(declare-const patient_has_elevated_neuroendocrine_marker_levels_at_least_1_month_post_operation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has elevated neuroendocrine marker levels measured at least 1 month post-operation.","when_to_set_to_false":"Set to false if the patient does not have elevated neuroendocrine marker levels measured at least 1 month post-operation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has elevated neuroendocrine marker levels at least 1 month post-operation.","meaning":"Boolean indicating whether the patient has elevated neuroendocrine marker levels at least 1 month post-operation."}  ;; "the patient must have elevated neuroendocrine marker levels at least 1 month post-operation"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: patient has elevated neuroendocrine marker levels at least 1 month post-operation if the value is above the reference range (assume > upper limit, e.g., 10 ng/mL as a placeholder threshold)
(assert
  (! (= patient_has_elevated_neuroendocrine_marker_levels_at_least_1_month_post_operation
        (> neuroendocrine_marker_levels_value_recorded_at_least_1_month_post_operation_withunit_ng_per_ml 10.0))
     :named REQ1_AUXILIARY0)) ;; "elevated neuroendocrine marker levels at least 1 month post-operation" (threshold 10 ng/mL as placeholder)

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_elevated_neuroendocrine_marker_levels_at_least_1_month_post_operation
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have elevated neuroendocrine marker levels at least 1 month post-operation."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_disease_progression_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has disease progression.","when_to_set_to_false":"Set to false if the patient currently does not have disease progression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has disease progression.","meaning":"Boolean indicating whether the patient currently has disease progression."}  ;; "To be included, the patient is NOT required to have disease progression for this trial."

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient is NOT required to have disease progression for this trial (no constraint imposed).
(assert
  (! true
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient is NOT required to have disease progression for this trial."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_undergone_surgical_procedure_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has completed a major surgical procedure at least 4 weeks prior to study registration.","when_to_set_to_false":"Set to false if the patient has not completed a major surgical procedure at least 4 weeks prior to study registration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has completed a major surgical procedure at least 4 weeks prior to study registration.","meaning":"Boolean indicating whether the patient has completed a major surgical procedure at least 4 weeks prior to study registration."} ;; "have completed major surgery at least 4 weeks prior to study registration"
(declare-const patient_has_undergone_chemotherapy_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has completed chemotherapy at least 4 weeks prior to study registration.","when_to_set_to_false":"Set to false if the patient has not completed chemotherapy at least 4 weeks prior to study registration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has completed chemotherapy at least 4 weeks prior to study registration.","meaning":"Boolean indicating whether the patient has completed chemotherapy at least 4 weeks prior to study registration."} ;; "have completed chemotherapy at least 4 weeks prior to study registration"
(declare-const patient_has_undergone_systemic_therapy_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has completed systemic therapy at least 4 weeks prior to study registration.","when_to_set_to_false":"Set to false if the patient has not completed systemic therapy at least 4 weeks prior to study registration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has completed systemic therapy at least 4 weeks prior to study registration.","meaning":"Boolean indicating whether the patient has completed systemic therapy at least 4 weeks prior to study registration."} ;; "have completed other systemic therapy at least 4 weeks prior to study registration"
(declare-const patient_has_undergone_local_liver_therapy_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has completed local liver therapy at least 4 weeks prior to study registration.","when_to_set_to_false":"Set to false if the patient has not completed local liver therapy at least 4 weeks prior to study registration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has completed local liver therapy at least 4 weeks prior to study registration.","meaning":"Boolean indicating whether the patient has completed local liver therapy at least 4 weeks prior to study registration."} ;; "have completed local liver therapy at least 4 weeks prior to study registration"
(declare-const patient_has_received_standard_of_care_prior_to_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received standard of care prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not received standard of care prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received standard of care prior to enrollment.","meaning":"Boolean indicating whether the patient has received standard of care prior to enrollment."} ;; "have had standard of care prior to enrollment"
(declare-const patient_has_undergone_total_thyroidectomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone total thyroidectomy at any time prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not undergone total thyroidectomy at any time prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone total thyroidectomy at any time prior to enrollment.","meaning":"Boolean indicating whether the patient has undergone total thyroidectomy at any time in the past."} ;; "total thyroidectomy"
(declare-const patient_has_undergone_central_compartment_level_vi_and_vii_lymph_node_neck_dissection_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone central compartment level VI and VII lymph node neck dissection at any time prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not undergone central compartment level VI and VII lymph node neck dissection at any time prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone central compartment level VI and VII lymph node neck dissection at any time prior to enrollment.","meaning":"Boolean indicating whether the patient has undergone central compartment level VI and VII lymph node neck dissection at any time in the past."} ;; "central lymph node dissection"
(declare-const patient_has_undergone_block_dissection_of_cervical_lymph_nodes_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone block dissection of cervical lymph nodes (neck dissection) at any time prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not undergone block dissection of cervical lymph nodes (neck dissection) at any time prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone block dissection of cervical lymph nodes (neck dissection) at any time prior to enrollment.","meaning":"Boolean indicating whether the patient has undergone block dissection of cervical lymph nodes (neck dissection) at any time in the past."} ;; "ipsilateral radical neck dissection"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples imply the umbrella term "standard of care"
(assert
  (! (=> (or patient_has_undergone_total_thyroidectomy_inthehistory
             patient_has_undergone_central_compartment_level_vi_and_vii_lymph_node_neck_dissection_inthehistory
             patient_has_undergone_block_dissection_of_cervical_lymph_nodes_inthehistory)
         patient_has_received_standard_of_care_prior_to_enrollment)
     :named REQ3_AUXILIARY0)) ;; "standard of care prior to enrollment with non-exhaustive examples (total thyroidectomy, central lymph node dissection, ipsilateral radical neck dissection)"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: At least one of the four therapies completed at least 4 weeks prior to study registration
(assert
  (! (or patient_has_undergone_surgical_procedure_inthepast4weeks
         patient_has_undergone_chemotherapy_inthepast4weeks
         patient_has_undergone_systemic_therapy_inthepast4weeks
         patient_has_undergone_local_liver_therapy_inthepast4weeks)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "have completed major surgery OR chemotherapy OR other systemic therapy OR local liver therapy at least 4 weeks prior to study registration"

;; Component 1: Must have received standard of care prior to enrollment
(assert
  (! patient_has_received_standard_of_care_prior_to_enrollment
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "have had standard of care prior to enrollment"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_completed_radiation_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient has completed radiation therapy at any time prior to study registration.","when_to_set_to_false":"Set to false if the patient has never completed radiation therapy prior to study registration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has completed radiation therapy prior to study registration.","meaning":"Boolean indicating whether the patient has completed radiation therapy at any time prior to study registration."}  ;; "the patient must have completed radiation therapy at least 3 weeks prior to study registration."
(declare-const weeks_since_completion_of_radiation_therapy_prior_to_study_registration_value_recorded_in_weeks Real) ;; {"when_to_set_to_value":"Set to the number of weeks elapsed between the date of completion of radiation therapy and the date of study registration.","when_to_set_to_null":"Set to null if the number of weeks elapsed between completion of radiation therapy and study registration is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of weeks since completion of radiation therapy prior to study registration."}  ;; "at least 3 weeks prior to study registration"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (and patient_has_completed_radiation_therapy
          (>= weeks_since_completion_of_radiation_therapy_prior_to_study_registration_value_recorded_in_weeks 3))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have completed radiation therapy at least 3 weeks prior to study registration."

;; ===================== Declarations for the inclusion criterion (REQ 5) =====================

;; Absolute neutrophil count
(declare-const patient_neutrophil_count_value_recorded_inthepast14days_withunit_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's absolute neutrophil count was recorded within the past 14 days prior to registration, in units of per cubic millimeter.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's absolute neutrophil count measured within the past 14 days, in units of per cubic millimeter."}  ;; "absolute neutrophil count greater than or equal to 1000 per cubic millimeter"

;; Platelet count
(declare-const patient_platelet_count_value_recorded_inthepast14days_withunit_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's platelet count was recorded within the past 14 days prior to registration, in units of per cubic millimeter.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's platelet count measured within the past 14 days, in units of per cubic millimeter."}  ;; "platelet count greater than or equal to 75,000 per cubic millimeter"

;; Hemoglobin concentration
(declare-const patient_hemoglobin_concentration_value_recorded_inthepast14days_withunit_grams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's hemoglobin concentration was recorded within the past 14 days prior to registration, in units of grams per deciliter.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's hemoglobin concentration measured within the past 14 days, in units of grams per deciliter."}  ;; "hemoglobin concentration greater than or equal to 8.0 grams per deciliter"

;; Total bilirubin
(declare-const patient_bilirubin_total_measurement_value_recorded_inthepast14days_withunit_mg_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's total bilirubin concentration was recorded within the past 14 days prior to registration, in units of milligrams per deciliter.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's total bilirubin concentration measured within the past 14 days, in units of milligrams per deciliter."}  ;; "total bilirubin concentration greater than or equal to 2.0 times the upper limit of normal"
(declare-const upper_limit_of_normal_for_total_bilirubin_concentration_withunit_mg_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the reference value for the upper limit of normal for total bilirubin concentration, in units of milligrams per deciliter.","when_to_set_to_null":"Set to null if the reference value is unavailable or indeterminate.","meaning":"Numeric value of the upper limit of normal for total bilirubin concentration, in units of milligrams per deciliter."}  ;; "upper limit of normal for total bilirubin concentration"

;; Aspartate aminotransferase (AST)
(declare-const patient_aspartate_transaminase_level_value_recorded_inthepast14days_withunit_international_unit_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's AST concentration was recorded within the past 14 days prior to registration, in units of international units per liter.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's AST concentration measured within the past 14 days, in units of international units per liter."}  ;; "aspartate aminotransferase concentration greater than or equal to 3 times the upper limit of normal or greater than or equal to 5 times the upper limit of normal if liver metastases are present"
(declare-const upper_limit_of_normal_for_aspartate_aminotransferase_concentration_withunit_international_unit_per_liter Real) ;; {"when_to_set_to_value":"Set to the reference value for the upper limit of normal for AST concentration, in units of international units per liter.","when_to_set_to_null":"Set to null if the reference value is unavailable or indeterminate.","meaning":"Numeric value of the upper limit of normal for AST concentration, in units of international units per liter."}  ;; "upper limit of normal for AST concentration"
(declare-const patient_has_liver_metastases_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has liver metastases.","when_to_set_to_false":"Set to false if the patient currently does not have liver metastases.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has liver metastases.","meaning":"Boolean indicating whether the patient currently has liver metastases."}  ;; "if liver metastases are present"

;; Creatinine
(declare-const patient_creatinine_level_finding_value_recorded_inthepast14days_withunit_mg_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's creatinine concentration was recorded within the past 14 days prior to registration, in units of milligrams per deciliter.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's creatinine concentration measured within the past 14 days, in units of milligrams per deciliter."}  ;; "creatinine concentration greater than or equal to the upper limit of normal"
(declare-const upper_limit_of_normal_for_creatinine_concentration_withunit_mg_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the reference value for the upper limit of normal for creatinine concentration, in units of milligrams per deciliter.","when_to_set_to_null":"Set to null if the reference value is unavailable or indeterminate.","meaning":"Numeric value of the upper limit of normal for creatinine concentration, in units of milligrams per deciliter."}  ;; "upper limit of normal for creatinine concentration"

;; Serum sodium
(declare-const patient_sodium_measurement_serum_value_recorded_inthepast14days_withunit_mmol_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's serum sodium concentration was recorded within the past 14 days prior to registration, in units of millimoles per liter.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's serum sodium concentration measured within the past 14 days, in units of millimoles per liter."}  ;; "serum sodium concentration within normal limits"
(declare-const serum_sodium_normal_range_lower_bound_withunit_mmol_per_liter Real) ;; {"when_to_set_to_value":"Set to the reference value for the lower bound of the normal range for serum sodium concentration, in units of millimoles per liter.","when_to_set_to_null":"Set to null if the reference value is unavailable or indeterminate.","meaning":"Numeric value of the lower bound of the normal range for serum sodium concentration, in units of millimoles per liter."}  ;; "lower bound of the normal range for serum sodium"
(declare-const serum_sodium_normal_range_upper_bound_withunit_mmol_per_liter Real) ;; {"when_to_set_to_value":"Set to the reference value for the upper bound of the normal range for serum sodium concentration, in units of millimoles per liter.","when_to_set_to_null":"Set to null if the reference value is unavailable or indeterminate.","meaning":"Numeric value of the upper bound of the normal range for serum sodium concentration, in units of millimoles per liter."}  ;; "upper bound of the normal range for serum sodium"

;; ===================== Auxiliary Assertions (REQ 5) =====================

;; AST requirement: (AST >= 3x ULN) OR (AST >= 5x ULN if liver metastases present)
(assert
  (! (or 
        (>= patient_aspartate_transaminase_level_value_recorded_inthepast14days_withunit_international_unit_per_liter
            (* 3.0 upper_limit_of_normal_for_aspartate_aminotransferase_concentration_withunit_international_unit_per_liter))
        (and patient_has_liver_metastases_now
             (>= patient_aspartate_transaminase_level_value_recorded_inthepast14days_withunit_international_unit_per_liter
                 (* 5.0 upper_limit_of_normal_for_aspartate_aminotransferase_concentration_withunit_international_unit_per_liter))))
     :named REQ5_AUXILIARY0)) ;; "aspartate aminotransferase concentration greater than or equal to 3 times the upper limit of normal or greater than or equal to 5 times the upper limit of normal if liver metastases are present"

;; Serum sodium requirement: within normal limits
(assert
  (! (and (>= patient_sodium_measurement_serum_value_recorded_inthepast14days_withunit_mmol_per_liter
              serum_sodium_normal_range_lower_bound_withunit_mmol_per_liter)
          (<= patient_sodium_measurement_serum_value_recorded_inthepast14days_withunit_mmol_per_liter
              serum_sodium_normal_range_upper_bound_withunit_mmol_per_liter))
     :named REQ5_AUXILIARY1)) ;; "serum sodium concentration within normal limits"

;; ===================== Constraint Assertions (REQ 5) =====================

;; Component 0: Absolute neutrophil count >= 1000 per cubic millimeter
(assert
  (! (>= patient_neutrophil_count_value_recorded_inthepast14days_withunit_per_cubic_millimeter 1000.0)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "absolute neutrophil count greater than or equal to 1000 per cubic millimeter"

;; Component 1: Platelet count >= 75,000 per cubic millimeter
(assert
  (! (>= patient_platelet_count_value_recorded_inthepast14days_withunit_per_cubic_millimeter 75000.0)
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "platelet count greater than or equal to 75,000 per cubic millimeter"

;; Component 2: Hemoglobin concentration >= 8.0 grams per deciliter
(assert
  (! (>= patient_hemoglobin_concentration_value_recorded_inthepast14days_withunit_grams_per_deciliter 8.0)
     :named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "hemoglobin concentration greater than or equal to 8.0 grams per deciliter"

;; Component 3: Total bilirubin >= 2.0 x ULN
(assert
  (! (>= patient_bilirubin_total_measurement_value_recorded_inthepast14days_withunit_mg_per_deciliter
         (* 2.0 upper_limit_of_normal_for_total_bilirubin_concentration_withunit_mg_per_deciliter))
     :named REQ5_COMPONENT3_OTHER_REQUIREMENTS)) ;; "total bilirubin concentration greater than or equal to 2.0 times the upper limit of normal"

;; Component 4: AST requirement (see auxiliary assertion)
(assert
  (! (or 
        (>= patient_aspartate_transaminase_level_value_recorded_inthepast14days_withunit_international_unit_per_liter
            (* 3.0 upper_limit_of_normal_for_aspartate_aminotransferase_concentration_withunit_international_unit_per_liter))
        (and patient_has_liver_metastases_now
             (>= patient_aspartate_transaminase_level_value_recorded_inthepast14days_withunit_international_unit_per_liter
                 (* 5.0 upper_limit_of_normal_for_aspartate_aminotransferase_concentration_withunit_international_unit_per_liter))))
     :named REQ5_COMPONENT4_OTHER_REQUIREMENTS)) ;; "aspartate aminotransferase concentration greater than or equal to 3 times the upper limit of normal or greater than or equal to 5 times the upper limit of normal if liver metastases are present"

;; Component 5: Creatinine >= ULN
(assert
  (! (>= patient_creatinine_level_finding_value_recorded_inthepast14days_withunit_mg_per_deciliter
         upper_limit_of_normal_for_creatinine_concentration_withunit_mg_per_deciliter)
     :named REQ5_COMPONENT5_OTHER_REQUIREMENTS)) ;; "creatinine concentration greater than or equal to the upper limit of normal"

;; Component 6: Serum sodium within normal limits (see auxiliary assertion)
(assert
  (! (and (>= patient_sodium_measurement_serum_value_recorded_inthepast14days_withunit_mmol_per_liter
              serum_sodium_normal_range_lower_bound_withunit_mmol_per_liter)
          (<= patient_sodium_measurement_serum_value_recorded_inthepast14days_withunit_mmol_per_liter
              serum_sodium_normal_range_upper_bound_withunit_mmol_per_liter))
     :named REQ5_COMPONENT6_OTHER_REQUIREMENTS)) ;; "serum sodium concentration within normal limits"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const eastern_cooperative_oncology_group_performance_status_value_recorded_withunit_integer Real) ;; {"when_to_set_to_value":"Set to the most recent integer value of the patient's ECOG performance status as documented in the medical record (values 0–5).","when_to_set_to_null":"Set to null if the ECOG performance status is not documented, unknown, or cannot be determined.","meaning":"Numeric value representing the patient's most recent ECOG performance status (integer, 0–5)."}  ;; "the patient must have Eastern Cooperative Oncology Group performance status of 2."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (= eastern_cooperative_oncology_group_performance_status_value_recorded_withunit_integer 2)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have Eastern Cooperative Oncology Group performance status of 2."

;; ===================== Declarations for the inclusion criterion (REQ 7) =====================
(declare-const patient_is_capable_of_understanding_investigational_nature_and_potential_risks_and_benefits_of_study_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently capable of understanding the investigational nature, potential risks, and potential benefits of the study.","when_to_set_to_false":"Set to false if the patient is currently not capable of understanding the investigational nature, potential risks, and potential benefits of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently capable of understanding the investigational nature, potential risks, and potential benefits of the study.","meaning":"Boolean indicating whether the patient is currently capable of understanding the investigational nature, potential risks, and potential benefits of the study."}  ;; "the patient must be capable of understanding the investigational nature, potential risks, and potential benefits of the study"
(declare-const patient_is_able_to_provide_valid_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to provide valid informed consent.","when_to_set_to_false":"Set to false if the patient is currently not able to provide valid informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to provide valid informed consent.","meaning":"Boolean indicating whether the patient is currently able to provide valid informed consent."}  ;; "the patient must be able to provide valid informed consent"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: The patient must be capable of understanding the investigational nature, potential risks, and potential benefits of the study.
(assert
  (! patient_is_capable_of_understanding_investigational_nature_and_potential_risks_and_benefits_of_study_now
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be capable of understanding the investigational nature, potential risks, and potential benefits of the study"

;; Component 1: The patient must be able to provide valid informed consent.
(assert
  (! patient_is_able_to_provide_valid_informed_consent_now
     :named REQ7_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be able to provide valid informed consent"

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_has_tissue_specimens_available_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tissue specimens available.","when_to_set_to_false":"Set to false if the patient currently does not have tissue specimens available.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tissue specimens available.","meaning":"Boolean indicating whether the patient currently has tissue specimens available."}  ;; "To be included, the patient must have tissue specimens available to be analyzed for pathologic confirmation."
(declare-const patient_has_tissue_specimens_available_now@@available_to_be_analyzed_for_pathologic_confirmation Bool) ;; {"when_to_set_to_true":"Set to true if the available tissue specimens are suitable to be analyzed for pathologic confirmation.","when_to_set_to_false":"Set to false if the available tissue specimens are not suitable to be analyzed for pathologic confirmation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the available tissue specimens are suitable to be analyzed for pathologic confirmation.","meaning":"Boolean indicating whether the available tissue specimens are suitable to be analyzed for pathologic confirmation."}  ;; "To be included, the patient must have tissue specimens available to be analyzed for pathologic confirmation."

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_tissue_specimens_available_now@@available_to_be_analyzed_for_pathologic_confirmation
         patient_has_tissue_specimens_available_now)
     :named REQ8_AUXILIARY0)) ;; "To be included, the patient must have tissue specimens available to be analyzed for pathologic confirmation."

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! patient_has_tissue_specimens_available_now@@available_to_be_analyzed_for_pathologic_confirmation
     :named REQ8_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have tissue specimens available to be analyzed for pathologic confirmation."

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged greater than or equal to 18 years"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged greater than or equal to 18 years."

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has childbearing potential.","when_to_set_to_false":"Set to false if the patient currently does not have childbearing potential.","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."}  ;; "all females of childbearing potential"
(declare-const patient_has_undergone_blood_pregnancy_test_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a blood pregnancy test within the past 2 weeks.","when_to_set_to_false":"Set to false if the patient has not undergone a blood pregnancy test within the past 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a blood pregnancy test within the past 2 weeks.","meaning":"Boolean indicating whether the patient has undergone a blood pregnancy test within the past 2 weeks."}  ;; "blood pregnancy test"
(declare-const patient_has_undergone_urine_pregnancy_test_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a urine pregnancy test within the past 2 weeks.","when_to_set_to_false":"Set to false if the patient has not undergone a urine pregnancy test within the past 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a urine pregnancy test within the past 2 weeks.","meaning":"Boolean indicating whether the patient has undergone a urine pregnancy test within the past 2 weeks."}  ;; "urine pregnancy test"
(declare-const patient_is_exposed_to_lithium_carbonate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to lithium carbonate.","when_to_set_to_false":"Set to false if the patient is currently not exposed to lithium carbonate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to lithium carbonate.","meaning":"Boolean indicating whether the patient is currently exposed to lithium carbonate."}  ;; "lithium carbonate"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently not lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."}  ;; "must not be lactating"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."}  ;; "patient must not be pregnant"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Pregnancy test requirement applies only to patients with childbearing potential
(assert
  (! (=> patient_has_childbearing_potential_now
         (or patient_has_undergone_blood_pregnancy_test_inthepast2weeks
             patient_has_undergone_urine_pregnancy_test_inthepast2weeks))
     :named REQ10_AUXILIARY0)) ;; "all females of childbearing potential must have a blood pregnancy test or a urine pregnancy test within 2 weeks prior to registration to rule out pregnancy"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Patient must not be pregnant OR must not be lactating (due to lithium carbonate risk)
(assert
  (! (or (not patient_is_pregnant_now)
         (not patient_is_lactating_now))
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must not be pregnant or must not be lactating due to the deleterious effects of lithium carbonate on a fetus or on a small child"

;; Pregnancy test requirement for childbearing potential
(assert
  (! (or (not patient_has_childbearing_potential_now)
         (or patient_has_undergone_blood_pregnancy_test_inthepast2weeks
             patient_has_undergone_urine_pregnancy_test_inthepast2weeks))
     :named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "all females of childbearing potential must have a blood pregnancy test or a urine pregnancy test within 2 weeks prior to registration to rule out pregnancy"

;; ===================== Declarations for the criterion (REQ 11) =====================
(declare-const patient_is_woman_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a woman.","when_to_set_to_false":"Set to false if the patient is currently not a woman.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a woman.","meaning":"Boolean indicating whether the patient is currently a woman."}  ;; "be a woman of childbearing potential"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has childbearing potential.","when_to_set_to_false":"Set to false if the patient currently does not have childbearing potential.","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."}  ;; "be a woman of childbearing potential"
(declare-const patient_is_using_accepted_and_effective_method_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a method of contraception that is both accepted and effective.","when_to_set_to_false":"Set to false if the patient is currently not using a method of contraception that is both accepted and effective.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a method of contraception that is both accepted and effective.","meaning":"Boolean indicating whether the patient is currently using a method of contraception that is both accepted and effective."}  ;; "use an accepted and effective method of contraception"
(declare-const patient_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a male.","when_to_set_to_false":"Set to false if the patient is currently not a male.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a male.","meaning":"Boolean indicating whether the patient is currently a male."}  ;; "be a sexually active male"
(declare-const patient_is_sexually_active_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently sexually active.","when_to_set_to_false":"Set to false if the patient is currently not sexually active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently sexually active.","meaning":"Boolean indicating whether the patient is currently sexually active."}  ;; "be a sexually active male"

;; ===================== Constraint Assertions (REQ 11) =====================
;; Component 0: To be included, the patient must ((be a woman of childbearing potential AND use an accepted and effective method of contraception) OR (be a sexually active male AND use an accepted and effective method of contraception)).
(assert
  (! (or
        (and patient_is_woman_now
             patient_has_childbearing_potential_now
             patient_is_using_accepted_and_effective_method_of_contraception_now)
        (and patient_is_male_now
             patient_is_sexually_active_now
             patient_is_using_accepted_and_effective_method_of_contraception_now))
     :named REQ11_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must ((be a woman of childbearing potential AND use an accepted and effective method of contraception) OR (be a sexually active male AND use an accepted and effective method of contraception))."

;; ===================== Declarations for the criterion (REQ 12) =====================
(declare-const patient_has_finding_of_allergy_to_lithium_compound_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of allergic reactions to lithium compounds at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of allergic reactions to lithium compounds.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of allergic reactions to lithium compounds.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of allergic reaction to lithium compounds in their history."} ;; "known history of allergic reactions to lithium"
(declare-const patient_has_finding_of_allergy_to_lithium_derivative_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of allergic reactions to lithium derivatives at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of allergic reactions to lithium derivatives.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of allergic reactions to lithium derivatives.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of allergic reaction to lithium derivatives in their history."} ;; "known history of allergic reactions to lithium derivatives"
(declare-const patient_has_finding_of_lithium_adverse_reaction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of adverse reactions to lithium at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of adverse reactions to lithium.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of adverse reactions to lithium.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of adverse reaction to lithium in their history."} ;; "known history of adverse reactions to lithium"
(declare-const patient_has_finding_of_lithium_derivative_adverse_reaction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of adverse reactions to lithium derivatives at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of adverse reactions to lithium derivatives.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of adverse reactions to lithium derivatives.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of adverse reaction to lithium derivatives in their history."} ;; "known history of adverse reactions to lithium derivatives"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
  (! (and (not patient_has_finding_of_allergy_to_lithium_compound_inthehistory)
          (not patient_has_finding_of_lithium_adverse_reaction_inthehistory)
          (not patient_has_finding_of_allergy_to_lithium_derivative_inthehistory)
          (not patient_has_finding_of_lithium_derivative_adverse_reaction_inthehistory))
     :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must (NOT have a known history of allergic reactions to lithium) AND (NOT have a known history of adverse reactions to lithium) AND (NOT have a known history of allergic reactions to lithium derivatives) AND (NOT have a known history of adverse reactions to lithium derivatives)."

;; ===================== Declarations for the criterion (REQ 13) =====================
(declare-const patient_is_undergoing_chemotherapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing chemotherapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing chemotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing chemotherapy.","meaning":"Boolean indicating whether the patient is currently undergoing chemotherapy."}  ;; "chemotherapy"
(declare-const patient_is_undergoing_chemotherapy_now@@concurrent Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing chemotherapy and the chemotherapy is concurrent with another therapy.","when_to_set_to_false":"Set to false if the patient is currently undergoing chemotherapy but it is not concurrent with another therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chemotherapy is concurrent with another therapy.","meaning":"Boolean indicating whether the patient's current chemotherapy is concurrent with another therapy."}  ;; "concurrent chemotherapy"
(declare-const patient_is_undergoing_radiation_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing radiation therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing radiation therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing radiation therapy.","meaning":"Boolean indicating whether the patient is currently undergoing radiation therapy."}  ;; "radiation therapy"
(declare-const patient_is_undergoing_radiation_therapy_now@@concurrent Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing radiation therapy and the radiation therapy is concurrent with another therapy.","when_to_set_to_false":"Set to false if the patient is currently undergoing radiation therapy but it is not concurrent with another therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the radiation therapy is concurrent with another therapy.","meaning":"Boolean indicating whether the patient's current radiation therapy is concurrent with another therapy."}  ;; "concurrent radiation therapy"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_is_undergoing_chemotherapy_now@@concurrent
         patient_is_undergoing_chemotherapy_now)
     :named REQ13_AUXILIARY0)) ;; "patient_is_undergoing_chemotherapy_now@@concurrent" implies "patient_is_undergoing_chemotherapy_now"

(assert
  (! (=> patient_is_undergoing_radiation_therapy_now@@concurrent
         patient_is_undergoing_radiation_therapy_now)
     :named REQ13_AUXILIARY1)) ;; "patient_is_undergoing_radiation_therapy_now@@concurrent" implies "patient_is_undergoing_radiation_therapy_now"

;; ===================== Constraint Assertions (REQ 13) =====================
;; Component 0: To be included, the patient must not be on concurrent chemotherapy or must not be on concurrent radiation therapy.
(assert
  (! (or (not patient_is_undergoing_chemotherapy_now@@concurrent)
         (not patient_is_undergoing_radiation_therapy_now@@concurrent))
     :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must not be on concurrent chemotherapy or must not be on concurrent radiation therapy."
