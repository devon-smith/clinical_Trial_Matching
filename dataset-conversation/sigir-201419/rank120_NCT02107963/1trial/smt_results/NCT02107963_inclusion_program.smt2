;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_meets_diagnosis_criteria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently meets the diagnosis criteria required for inclusion.","when_to_set_to_false":"Set to false if the patient currently does not meet the diagnosis criteria required for inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently meets the diagnosis criteria required for inclusion.","meaning":"Boolean indicating whether the patient currently meets the diagnosis criteria required for inclusion."} ;; "To be included, the patient must meet the diagnosis criteria."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_meets_diagnosis_criteria_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must meet the diagnosis criteria."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_osteosarcoma_of_bone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of osteosarcoma of bone.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of osteosarcoma of bone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of osteosarcoma of bone.","meaning":"Boolean indicating whether the patient currently has a diagnosis of osteosarcoma of bone."} ;; "have osteosarcoma"
(declare-const patient_has_diagnosis_of_neuroblastoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of neuroblastoma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of neuroblastoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of neuroblastoma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of neuroblastoma."} ;; "have neuroblastoma"
(declare-const patient_has_diagnosis_of_melanoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of melanoma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of melanoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of melanoma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of melanoma."} ;; "have melanoma"
(declare-const patient_has_diagnosis_of_melanoma_now@@treated_with_standard_frontline_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient with melanoma has been treated with standard frontline therapy for melanoma.","when_to_set_to_false":"Set to false if the patient with melanoma has not been treated with standard frontline therapy for melanoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient with melanoma has been treated with standard frontline therapy.","meaning":"Boolean indicating whether the patient with melanoma has been treated with standard frontline therapy."} ;; "has been treated with standard frontline therapy"
(declare-const patient_has_diagnosis_of_melanoma_now@@judged_incurable_with_standard_therapy_due_to_unresectable_or_metastatic_or_progressive_or_persistent_or_recurrent_tumor Bool) ;; {"when_to_set_to_true":"Set to true if the patient with melanoma is judged to be incurable with standard therapy, based upon the tumor being unresectable, metastatic, progressive, persistent, or recurrent.","when_to_set_to_false":"Set to false if the patient with melanoma is not judged to be incurable with standard therapy on the basis of the tumor being unresectable, metastatic, progressive, persistent, or recurrent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient with melanoma is judged to be incurable with standard therapy on the basis of the tumor being unresectable, metastatic, progressive, persistent, or recurrent.","meaning":"Boolean indicating whether the patient with melanoma is judged to be incurable with standard therapy, based upon the tumor being unresectable, metastatic, progressive, persistent, or recurrent."} ;; "is judged to be incurable with standard therapy, based upon (the tumor is unresectable OR the tumor is metastatic OR the tumor is progressive OR the tumor is persistent OR the tumor is recurrent)"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable (melanoma)
(assert
  (! (=> patient_has_diagnosis_of_melanoma_now@@treated_with_standard_frontline_therapy
         patient_has_diagnosis_of_melanoma_now)
     :named REQ1_AUXILIARY0)) ;; "has been treated with standard frontline therapy" implies "have melanoma"

(assert
  (! (=> patient_has_diagnosis_of_melanoma_now@@judged_incurable_with_standard_therapy_due_to_unresectable_or_metastatic_or_progressive_or_persistent_or_recurrent_tumor
         patient_has_diagnosis_of_melanoma_now)
     :named REQ1_AUXILIARY1)) ;; "judged incurable with standard therapy due to unresectable/metastatic/progressive/persistent/recurrent tumor" implies "have melanoma"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must ((have osteosarcoma) OR (have neuroblastoma) OR (have melanoma AND (has been treated with standard frontline therapy) AND (is judged to be incurable with standard therapy, based upon (the tumor is unresectable OR the tumor is metastatic OR the tumor is progressive OR the tumor is persistent OR the tumor is recurrent))))
(assert
  (! (or patient_has_diagnosis_of_osteosarcoma_of_bone_now
         patient_has_diagnosis_of_neuroblastoma_now
         (and patient_has_diagnosis_of_melanoma_now
              patient_has_diagnosis_of_melanoma_now@@treated_with_standard_frontline_therapy
              patient_has_diagnosis_of_melanoma_now@@judged_incurable_with_standard_therapy_due_to_unresectable_or_metastatic_or_progressive_or_persistent_or_recurrent_tumor))
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((have osteosarcoma) OR (have neuroblastoma) OR (have melanoma AND (has been treated with standard frontline therapy) AND (is judged to be incurable with standard therapy, based upon (the tumor is unresectable OR the tumor is metastatic OR the tumor is progressive OR the tumor is persistent OR the tumor is recurrent))))"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_evaluable_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evaluable disease present.","when_to_set_to_false":"Set to false if the patient currently does not have evaluable disease present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evaluable disease present.","meaning":"Boolean indicating whether the patient currently has evaluable disease present."} ;; "To be included, the patient must have evaluable disease present."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_evaluable_disease_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have evaluable disease present."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_gd2_ganglioside_positive_expression_in_tumor_cells_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's tumor tissue currently demonstrates positive expression of disialoganglioside (GD2) as defined by the study (expression ≥ 2 plus on a 0-4 plus scale).","when_to_set_to_false":"Set to false if the patient's tumor tissue currently does not demonstrate positive expression of disialoganglioside (GD2) as defined by the study (expression < 2 plus on a 0-4 plus scale).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's tumor tissue currently demonstrates positive expression of disialoganglioside (GD2) as defined by the study.","meaning":"Boolean indicating whether the patient's tumor tissue currently demonstrates positive expression of disialoganglioside (GD2) as defined by expression ≥ 2 plus on a 0-4 plus scale."} ;; "expression ≥ 2 plus (on a 0-4 plus scale)"
(declare-const patient_gd2_ganglioside_positive_expression_in_tumor_cells_now@@in_proportion_of_tumor_cells_greater_than_50_percent Bool) ;; {"when_to_set_to_true":"Set to true if the positive GD2 expression (as defined) is present in more than 50 percent of tumor cells.","when_to_set_to_false":"Set to false if the positive GD2 expression (as defined) is present in 50 percent or fewer tumor cells.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the positive GD2 expression is present in more than 50 percent of tumor cells.","meaning":"Boolean indicating whether the positive GD2 expression (as defined) is present in more than 50 percent of tumor cells."} ;; "proportion of tumor cells > 50 percent"
(declare-const patient_gd2_ganglioside_value_recorded_now_withunit_plus Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's GD2 ganglioside expression level in tumor tissue now is available on a 0-4 plus scale.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's GD2 ganglioside expression level in tumor tissue now, measured on a 0-4 plus scale."} ;; "expression ≥ 2 plus (on a 0-4 plus scale)"
(declare-const patient_gd2_ganglioside_value_recorded_now_withunit_plus@@measured_with_anti_gd2_monoclonal_antibody_14g2a Bool) ;; {"when_to_set_to_true":"Set to true if the GD2 ganglioside expression measurement was performed using anti-GD2 monoclonal antibody 14G2a.","when_to_set_to_false":"Set to false if the measurement was not performed using anti-GD2 monoclonal antibody 14G2a.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether anti-GD2 monoclonal antibody 14G2a was used for the measurement.","meaning":"Boolean indicating whether the GD2 ganglioside expression measurement was performed using anti-GD2 monoclonal antibody 14G2a."} ;; "using anti-GD2 monoclonal antibody 14G2a"
(declare-const proportion_of_tumor_cells_with_gd2_expression_value_recorded_now_in_percent Real) ;; {"when_to_set_to_value":"Set to the measured percent value if the proportion of tumor cells with GD2 expression is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the proportion (in percent) of tumor cells in the patient's tissue sample that demonstrate GD2 expression now."} ;; "proportion of tumor cells > 50 percent"
(declare-const patient_has_undergone_pathologist_evaluation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a pathologist evaluation (pathologic review) now.","when_to_set_to_false":"Set to false if the patient has not undergone a pathologist evaluation (pathologic review) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a pathologist evaluation (pathologic review) now.","meaning":"Boolean indicating whether the patient has undergone a pathologist evaluation (pathologic review) now."} ;; "pathologic review"
(declare-const patient_has_undergone_pathologist_evaluation_now@@performed_on_frozen_tissue Bool) ;; {"when_to_set_to_true":"Set to true if the pathologist evaluation (pathologic review) was performed on frozen tissue.","when_to_set_to_false":"Set to false if the pathologist evaluation (pathologic review) was not performed on frozen tissue.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pathologist evaluation (pathologic review) was performed on frozen tissue.","meaning":"Boolean indicating whether the pathologist evaluation (pathologic review) was performed on frozen tissue."} ;; "pathologic review of frozen tissue"
(declare-const patient_is_exposed_to_human_tissue_now Bool) ;; {"when_to_set_to_true":"Set to true if adequate archived frozen human tissue is available from the patient now.","when_to_set_to_false":"Set to false if adequate archived frozen human tissue is not available from the patient now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether adequate archived frozen human tissue is available from the patient now.","meaning":"Boolean indicating whether adequate archived frozen human tissue is available from the patient now."} ;; "adequate archived frozen tissue is available"
(declare-const patient_is_exposed_to_human_tissue_now@@adequate_archived_frozen_tissue Bool) ;; {"when_to_set_to_true":"Set to true if the available human tissue is adequate, archived, and frozen.","when_to_set_to_false":"Set to false if the available human tissue is not adequate, not archived, or not frozen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the available human tissue is adequate, archived, and frozen.","meaning":"Boolean indicating whether the available human tissue is adequate, archived, and frozen."} ;; "adequate archived frozen tissue"
(declare-const patient_will_undergo_biopsy_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient will undergo a biopsy in the future.","when_to_set_to_false":"Set to false if the patient will not undergo a biopsy in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will undergo a biopsy in the future.","meaning":"Boolean indicating whether the patient will undergo a biopsy in the future."} ;; "patient may undergo biopsy following enrollment"
(declare-const patient_will_undergo_biopsy_inthefuture@@performed_following_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the biopsy is performed following enrollment.","when_to_set_to_false":"Set to false if the biopsy is not performed following enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the biopsy is performed following enrollment.","meaning":"Boolean indicating whether the biopsy is performed following enrollment."} ;; "biopsy following enrollment"
(declare-const patient_will_undergo_biopsy_inthefuture@@performed_to_obtain_tissue_to_assess_gd2_expression Bool) ;; {"when_to_set_to_true":"Set to true if the biopsy is performed to obtain tissue to assess GD2 expression.","when_to_set_to_false":"Set to false if the biopsy is not performed to obtain tissue to assess GD2 expression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the biopsy is performed to obtain tissue to assess GD2 expression.","meaning":"Boolean indicating whether the biopsy is performed to obtain tissue to assess GD2 expression."} ;; "biopsy to obtain tissue to assess GD2 expression"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_gd2_ganglioside_positive_expression_in_tumor_cells_now@@in_proportion_of_tumor_cells_greater_than_50_percent
         patient_gd2_ganglioside_positive_expression_in_tumor_cells_now)
     :named REQ3_AUXILIARY0)) ;; "proportion of tumor cells > 50 percent"

;; Definition of positive GD2 expression (expression ≥ 2 plus on 0-4 plus scale)
(assert
  (! (= patient_gd2_ganglioside_positive_expression_in_tumor_cells_now
         (and (>= patient_gd2_ganglioside_value_recorded_now_withunit_plus 2.0)
              patient_gd2_ganglioside_value_recorded_now_withunit_plus@@measured_with_anti_gd2_monoclonal_antibody_14g2a))
     :named REQ3_AUXILIARY1)) ;; "expression ≥ 2 plus (on a 0-4 plus scale) using anti-GD2 monoclonal antibody 14G2a"

;; Definition of positive GD2 expression in >50% of tumor cells
(assert
  (! (= patient_gd2_ganglioside_positive_expression_in_tumor_cells_now@@in_proportion_of_tumor_cells_greater_than_50_percent
         (and patient_gd2_ganglioside_positive_expression_in_tumor_cells_now
              (> proportion_of_tumor_cells_with_gd2_expression_value_recorded_now_in_percent 50.0)))
     :named REQ3_AUXILIARY2)) ;; "expression in proportion of tumor cells > 50 percent"

;; Qualifier variable implies corresponding stem variable for pathologist evaluation
(assert
  (! (=> patient_has_undergone_pathologist_evaluation_now@@performed_on_frozen_tissue
         patient_has_undergone_pathologist_evaluation_now)
     :named REQ3_AUXILIARY3)) ;; "pathologic review of frozen tissue"

;; Qualifier variable implies corresponding stem variable for tissue availability
(assert
  (! (=> patient_is_exposed_to_human_tissue_now@@adequate_archived_frozen_tissue
         patient_is_exposed_to_human_tissue_now)
     :named REQ3_AUXILIARY4)) ;; "adequate archived frozen tissue"

;; Qualifier variable implies corresponding stem variable for biopsy following enrollment
(assert
  (! (=> patient_will_undergo_biopsy_inthefuture@@performed_following_enrollment
         patient_will_undergo_biopsy_inthefuture)
     :named REQ3_AUXILIARY5)) ;; "biopsy following enrollment"

;; Qualifier variable implies corresponding stem variable for biopsy to assess GD2 expression
(assert
  (! (=> patient_will_undergo_biopsy_inthefuture@@performed_to_obtain_tissue_to_assess_gd2_expression
         patient_will_undergo_biopsy_inthefuture)
     :named REQ3_AUXILIARY6)) ;; "biopsy to obtain tissue to assess GD2 expression"

;; ===================== Constraint Assertions (REQ 3) =====================
;; For all histologies except osteosarcoma AND neuroblastoma, the patient must have pathologic review of frozen tissue documenting GD2 positive expression (expression ≥ 2 plus on 0-4 plus scale) in >50% of tumor cells using anti-GD2 monoclonal antibody 14G2a.
(assert
  (! (or patient_has_diagnosis_of_osteosarcoma_of_bone_now
         patient_has_diagnosis_of_neuroblastoma_now
         (and patient_has_undergone_pathologist_evaluation_now@@performed_on_frozen_tissue
              (or patient_is_exposed_to_human_tissue_now@@adequate_archived_frozen_tissue
                  (and patient_will_undergo_biopsy_inthefuture@@performed_following_enrollment
                       patient_will_undergo_biopsy_inthefuture@@performed_to_obtain_tissue_to_assess_gd2_expression))
              patient_gd2_ganglioside_positive_expression_in_tumor_cells_now@@in_proportion_of_tumor_cells_greater_than_50_percent))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "for all histologies except osteosarcoma AND neuroblastoma, the patient must have pathologic review of frozen tissue documenting GD2 positive expression, defined as (expression ≥ 2 plus (on a 0-4 plus scale)) in (proportion of tumor cells > 50 percent) using anti-GD2 monoclonal antibody 14G2a"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_histology_other_than_osteosarcoma_and_neuroblastoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a histology diagnosis that is neither osteosarcoma nor neuroblastoma.","when_to_set_to_false":"Set to false if the patient currently has only osteosarcoma or neuroblastoma histology, or both.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a histology diagnosis other than osteosarcoma and neuroblastoma.","meaning":"Boolean indicating whether the patient currently has a histology diagnosis other than osteosarcoma and neuroblastoma."} ;; "if the patient has histologies other than osteosarcoma AND neuroblastoma"
(declare-const patient_has_undergone_biopsy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a biopsy now.","when_to_set_to_false":"Set to false if the patient has not undergone a biopsy now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a biopsy now.","meaning":"Boolean indicating whether the patient has undergone a biopsy now."} ;; "biopsy"
(declare-const tumor_diameter_value_recorded_now_withunit_centimeter Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's accessible tumor diameter for biopsy, recorded now, in centimeters.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the diameter of the patient's accessible tumor for biopsy, recorded now, in centimeters."} ;; "diameter ≥ 1 centimeter"
(declare-const tumor_is_adequately_accessible_for_biopsy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's tumor is adequately accessible for biopsy now.","when_to_set_to_false":"Set to false if the patient's tumor is not adequately accessible for biopsy now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's tumor is adequately accessible for biopsy now.","meaning":"Boolean indicating whether the patient's tumor is adequately accessible for biopsy at the current time."} ;; "adequate accessible tumor for biopsy"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition: adequate accessible tumor for biopsy (diameter ≥ 1 centimeter)
(assert
  (! (= tumor_is_adequately_accessible_for_biopsy_now
        (and patient_has_undergone_biopsy_now
             (>= tumor_diameter_value_recorded_now_withunit_centimeter 1.0)))
     :named REQ4_AUXILIARY0)) ;; "adequate accessible tumor for biopsy (diameter ≥ 1 centimeter)"

;; ===================== Constraint Assertions (REQ 4) =====================
;; If the patient has histologies other than osteosarcoma AND neuroblastoma, must have adequate accessible tumor for biopsy (diameter ≥ 1 centimeter)
(assert
  (! (or (not patient_has_histology_other_than_osteosarcoma_and_neuroblastoma_now)
         tumor_is_adequately_accessible_for_biopsy_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient has histologies other than osteosarcoma AND neuroblastoma, the patient must have adequate accessible tumor for biopsy (diameter ≥ 1 centimeter)"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_lesion_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a pulmonary lesion (lesion of lung).","when_to_set_to_false":"Set to false if the patient currently does not have a pulmonary lesion (lesion of lung).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a pulmonary lesion.","meaning":"Boolean indicating whether the patient currently has a pulmonary lesion (lesion of lung)."} ;; "Pulmonary lesion may be biopsied"
(declare-const patient_has_undergone_biopsy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a biopsy now.","when_to_set_to_false":"Set to false if the patient has not undergone a biopsy now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a biopsy now.","meaning":"Boolean indicating whether the patient has undergone a biopsy now."} ;; "biopsy"
(declare-const patient_has_undergone_biopsy_now@@limited_to_percutaneous_needle_biopsy_or_percutaneous_core_biopsy_or_thoracoscopic_excision_or_open_biopsy_of_readily_accessible_lesion Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a biopsy procedure now and the procedure is one of: percutaneous needle biopsy, percutaneous core biopsy, thoracoscopic excision, or open biopsy of a readily accessible lesion.","when_to_set_to_false":"Set to false if the patient has undergone a biopsy procedure now and the procedure is not one of the allowed types.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the biopsy procedure is of the allowed types.","meaning":"Boolean indicating whether the patient has undergone a biopsy procedure now and the procedure is limited to the allowed types."} ;; "procedures employed to acquire biopsies for tumor lysates must be limited to (percutaneous needle biopsy OR percutaneous core biopsy OR thoracoscopic excision OR open biopsy of readily accessible lesion)"
(declare-const patient_has_undergone_laparotomy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone laparotomy now.","when_to_set_to_false":"Set to false if the patient has not undergone laparotomy now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone laparotomy now.","meaning":"Boolean indicating whether the patient has undergone laparotomy now."} ;; "laparotomy"
(declare-const patient_has_undergone_laparotomy_now@@must_not_be_employed Bool) ;; {"when_to_set_to_true":"Set to true if the patient has NOT undergone laparotomy now.","when_to_set_to_false":"Set to false if the patient HAS undergone laparotomy now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether laparotomy has been employed.","meaning":"Boolean indicating whether laparotomy has NOT been employed now."} ;; "laparotomy must NOT be employed"
(declare-const patient_has_undergone_opening_of_chest_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone thoracotomy (opening of chest) now.","when_to_set_to_false":"Set to false if the patient has not undergone thoracotomy (opening of chest) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone thoracotomy now.","meaning":"Boolean indicating whether the patient has undergone thoracotomy (opening of chest) now."} ;; "thoracotomy"
(declare-const patient_has_undergone_opening_of_chest_now@@must_not_be_employed Bool) ;; {"when_to_set_to_true":"Set to true if the patient has NOT undergone thoracotomy (opening of chest) now.","when_to_set_to_false":"Set to false if the patient HAS undergone thoracotomy (opening of chest) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether thoracotomy has been employed.","meaning":"Boolean indicating whether thoracotomy (opening of chest) has NOT been employed now."} ;; "thoracotomy must NOT be employed"
(declare-const patient_has_undergone_surgical_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a surgical procedure now.","when_to_set_to_false":"Set to false if the patient has not undergone a surgical procedure now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a surgical procedure now.","meaning":"Boolean indicating whether the patient has undergone a surgical procedure now."} ;; "surgery"
(declare-const patient_has_undergone_surgical_procedure_now@@must_not_be_extensive_surgery Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a surgical procedure now and the procedure is NOT extensive surgery.","when_to_set_to_false":"Set to false if the patient has undergone a surgical procedure now and the procedure IS extensive surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surgical procedure is extensive.","meaning":"Boolean indicating whether the patient has undergone a surgical procedure now and the procedure is NOT extensive surgery."} ;; "extensive surgery must NOT be employed"
(declare-const tumor_lysates_acquisition_procedure_is_limited_now Bool) ;; {"when_to_set_to_true":"Set to true if the procedures employed to acquire tumor lysates now are limited to percutaneous needle biopsy, percutaneous core biopsy, thoracoscopic excision, or open biopsy of a readily accessible lesion.","when_to_set_to_false":"Set to false if the procedures employed to acquire tumor lysates now include any other procedure type not listed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedures employed to acquire tumor lysates now are limited to the specified types.","meaning":"Boolean indicating whether the procedures employed to acquire tumor lysates now are limited to the specified types."} ;; "procedures employed to acquire biopsies for tumor lysates must be limited to (percutaneous needle biopsy OR percutaneous core biopsy OR thoracoscopic excision OR open biopsy of readily accessible lesion)"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable for biopsy procedure implies stem variable
(assert
  (! (=> patient_has_undergone_biopsy_now@@limited_to_percutaneous_needle_biopsy_or_percutaneous_core_biopsy_or_thoracoscopic_excision_or_open_biopsy_of_readily_accessible_lesion
        patient_has_undergone_biopsy_now)
     :named REQ5_AUXILIARY0)) ;; "procedures employed to acquire biopsies for tumor lysates must be limited to (percutaneous needle biopsy OR percutaneous core biopsy OR thoracoscopic excision OR open biopsy of readily accessible lesion)"

;; Definition: tumor lysates acquisition procedure is limited if and only if the biopsy procedure is limited to the allowed types
(assert
  (! (= tumor_lysates_acquisition_procedure_is_limited_now
        patient_has_undergone_biopsy_now@@limited_to_percutaneous_needle_biopsy_or_percutaneous_core_biopsy_or_thoracoscopic_excision_or_open_biopsy_of_readily_accessible_lesion)
     :named REQ5_AUXILIARY1)) ;; "procedures employed to acquire biopsies for tumor lysates must be limited to (percutaneous needle biopsy OR percutaneous core biopsy OR thoracoscopic excision OR open biopsy of readily accessible lesion)"

;; Definition: extensive surgery must NOT be employed
(assert
  (! (= patient_has_undergone_surgical_procedure_now@@must_not_be_extensive_surgery
        (and (not patient_has_undergone_opening_of_chest_now)
             (not patient_has_undergone_laparotomy_now)))
     :named REQ5_AUXILIARY2)) ;; "extensive surgery (such as thoracotomy OR laparotomy) must NOT be employed"

;; Definition: thoracotomy must NOT be employed
(assert
  (! (= patient_has_undergone_opening_of_chest_now@@must_not_be_employed
        (not patient_has_undergone_opening_of_chest_now))
     :named REQ5_AUXILIARY3)) ;; "thoracotomy must NOT be employed"

;; Definition: laparotomy must NOT be employed
(assert
  (! (= patient_has_undergone_laparotomy_now@@must_not_be_employed
        (not patient_has_undergone_laparotomy_now))
     :named REQ5_AUXILIARY4)) ;; "laparotomy must NOT be employed"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: Procedures employed to acquire biopsies for tumor lysates must be limited to allowed types AND extensive surgery (thoracotomy or laparotomy) must NOT be employed
(assert
  (! (and tumor_lysates_acquisition_procedure_is_limited_now
          patient_has_undergone_surgical_procedure_now@@must_not_be_extensive_surgery)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "procedures employed to acquire biopsies for tumor lysates must be limited to (percutaneous needle biopsy OR percutaneous core biopsy OR thoracoscopic excision OR open biopsy of readily accessible lesion). Pulmonary lesion may be biopsied, but extensive surgery (such as thoracotomy OR laparotomy) must NOT be employed."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_will_undergo_biopsy_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient will undergo a biopsy in the future.","when_to_set_to_false":"Set to false if the patient will not undergo a biopsy in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will undergo a biopsy in the future.","meaning":"Boolean indicating whether the patient will undergo a biopsy in the future."} ;; "if the patient will require biopsy"
(declare-const patients_tumor_site_is_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if, in the opinion of the principal investigator, the patient's tumor site currently places the patient at substantial risk from the biopsy procedure.","when_to_set_to_false":"Set to false if, in the opinion of the principal investigator, the patient's tumor site does not currently place the patient at substantial risk from the biopsy procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's tumor site currently places the patient at substantial risk from the biopsy procedure.","meaning":"Boolean indicating whether the patient's tumor site is currently considered abnormal in the context of risk from biopsy procedure."} ;; "the tumor site places the patient at substantial risk from the biopsy procedure (in the opinion of the principal investigator)"

;; ===================== Constraint Assertions (REQ 6) =====================
;; If the patient will require biopsy, the patient must NOT be enrolled if, in the opinion of the principal investigator, the tumor site places the patient at substantial risk from the biopsy procedure.
(assert
  (! (not (and patient_will_undergo_biopsy_inthefuture
               patients_tumor_site_is_abnormal_now))
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, if the patient will require biopsy, the patient must NOT be enrolled if, in the opinion of the principal investigator, the tumor site places the patient at substantial risk from the biopsy procedure."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const weight_value_recorded_in_kilograms Real) ;; {"when_to_set_to_value":"Set to the patient's weight in kilograms as recorded in the medical record.","when_to_set_to_null":"Set to null if the patient's weight in kilograms is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's weight in kilograms."} ;; "weight ≥ 15 kilograms"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (>= weight_value_recorded_in_kilograms 15.0)
     :named REQ7_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (weight ≥ 15 kilograms)."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "age ≤ 35 years"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (<= patient_age_value_recorded_now_in_years 35)
     :named REQ8_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (age ≤ 35 years) at the time of enrollment."

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_meets_prior_therapy_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient meets all specified prior therapy criteria for inclusion.","when_to_set_to_false":"Set to false if the patient does not meet all specified prior therapy criteria for inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient meets the prior therapy criteria.","meaning":"Boolean indicating whether the patient meets the prior therapy criteria required for inclusion."} ;; "the patient must meet the prior therapy criteria"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! patient_meets_prior_therapy_criteria
     :named REQ9_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must meet the prior therapy criteria"

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_has_curative_treatment_option_available_at_time_of_study_entry Bool) ;; {"when_to_set_to_true":"Set to true if the patient has at least one curative treatment option available at the time of study entry.","when_to_set_to_false":"Set to false if the patient does not have any curative treatment option available at the time of study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has any curative treatment option available at the time of study entry.","meaning":"Boolean indicating whether the patient has any curative treatment option available at the time of study entry."} ;; "NOT have any curative treatment option available at the time of study entry"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease."} ;; "malignancy"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@relapsed_after_frontline_curative_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient’s malignant neoplastic disease has relapsed after frontline curative therapy.","when_to_set_to_false":"Set to false if the patient’s malignant neoplastic disease has not relapsed after frontline curative therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient’s malignant neoplastic disease has relapsed after frontline curative therapy.","meaning":"Boolean indicating whether the patient’s malignant neoplastic disease has relapsed after frontline curative therapy."} ;; "malignancy that has relapsed after frontline curative therapy"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@failed_to_respond_to_frontline_curative_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient’s malignant neoplastic disease has failed to respond to frontline curative therapy.","when_to_set_to_false":"Set to false if the patient’s malignant neoplastic disease has not failed to respond to frontline curative therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient’s malignant neoplastic disease has failed to respond to frontline curative therapy.","meaning":"Boolean indicating whether the patient’s malignant neoplastic disease has failed to respond to frontline curative therapy."} ;; "malignancy that has failed to respond to frontline curative therapy"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@relapsed_after_frontline_curative_therapy
         patient_has_diagnosis_of_malignant_neoplastic_disease_now)
     :named REQ10_AUXILIARY0)) ;; "malignancy that has relapsed after frontline curative therapy"

(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@failed_to_respond_to_frontline_curative_therapy
         patient_has_diagnosis_of_malignant_neoplastic_disease_now)
     :named REQ10_AUXILIARY1)) ;; "malignancy that has failed to respond to frontline curative therapy"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Component 0: To be included, the patient must have (the patient’s malignancy that has relapsed after frontline curative therapy OR the patient’s malignancy that has failed to respond to frontline curative therapy OR NOT have any curative treatment option available at the time of study entry).
(assert
  (! (or patient_has_diagnosis_of_malignant_neoplastic_disease_now@@relapsed_after_frontline_curative_therapy
         patient_has_diagnosis_of_malignant_neoplastic_disease_now@@failed_to_respond_to_frontline_curative_therapy
         (not patient_has_curative_treatment_option_available_at_time_of_study_entry))
     :named REQ10_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (the patient’s malignancy that has relapsed after frontline curative therapy OR the patient’s malignancy that has failed to respond to frontline curative therapy OR NOT have any curative treatment option available at the time of study entry)."

;; ===================== Declarations for the criterion (REQ 11) =====================
(declare-const patient_has_fully_recovered_from_acute_toxic_effect_of_chemotherapy_prior_to_study_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has fully recovered from the acute toxic effect of prior chemotherapy before study enrollment.","when_to_set_to_false":"Set to false if the patient has not fully recovered from the acute toxic effect of prior chemotherapy before study enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has fully recovered from the acute toxic effect of prior chemotherapy before study enrollment.","meaning":"Boolean indicating whether the patient has fully recovered from the acute toxic effect of prior chemotherapy before study enrollment."} ;; "the patient must have fully recovered from the acute toxic effect of prior chemotherapy prior to study enrollment"
(declare-const patient_has_fully_recovered_from_acute_toxic_effect_of_immunotherapy_prior_to_study_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has fully recovered from the acute toxic effect of prior immunotherapy before study enrollment.","when_to_set_to_false":"Set to false if the patient has not fully recovered from the acute toxic effect of prior immunotherapy before study enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has fully recovered from the acute toxic effect of prior immunotherapy before study enrollment.","meaning":"Boolean indicating whether the patient has fully recovered from the acute toxic effect of prior immunotherapy before study enrollment."} ;; "the patient must have fully recovered from the acute toxic effect of prior immunotherapy prior to study enrollment"
(declare-const patient_has_fully_recovered_from_acute_toxic_effect_of_radiotherapy_prior_to_study_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has fully recovered from the acute toxic effect of prior radiotherapy before study enrollment.","when_to_set_to_false":"Set to false if the patient has not fully recovered from the acute toxic effect of prior radiotherapy before study enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has fully recovered from the acute toxic effect of prior radiotherapy before study enrollment.","meaning":"Boolean indicating whether the patient has fully recovered from the acute toxic effect of prior radiotherapy before study enrollment."} ;; "the patient must have fully recovered from the acute toxic effect of prior radiotherapy prior to study enrollment"
(declare-const non_hematologic_toxicity_grade_value_of_previous_therapy Real) ;; {"when_to_set_to_value":"Set to the numeric grade value of any non-hematologic toxicity resulting from any previous therapy, as per standard toxicity grading scale.","when_to_set_to_null":"Set to null if the grade of non-hematologic toxicity from previous therapy is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the grade of any non-hematologic toxicity resulting from any previous therapy, as per standard toxicity grading scale."} ;; "any grade 3 or 4 non-hematologic toxicity of any previous therapy"
(declare-const non_hematologic_toxicity_grade_value_after_resolution_of_previous_therapy Real) ;; {"when_to_set_to_value":"Set to the numeric grade value of any non-hematologic toxicity after resolution following any previous therapy, as per standard toxicity grading scale.","when_to_set_to_null":"Set to null if the grade of non-hematologic toxicity after resolution from previous therapy is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the grade of any non-hematologic toxicity after resolution following any previous therapy, as per standard toxicity grading scale."} ;; "must have resolved to grade 2 or less"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; No limit to the number of prior treatment regimens: always satisfiable, no constraint needed.
;; "To be included, there is no limit to the number of prior treatment regimens." (NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)

;; ===================== Constraint Assertions (REQ 11) =====================
;; Component 1: Recovery from acute toxic effect of prior therapy (chemotherapy OR immunotherapy OR radiotherapy)
(assert
  (! (or patient_has_fully_recovered_from_acute_toxic_effect_of_chemotherapy_prior_to_study_enrollment
         patient_has_fully_recovered_from_acute_toxic_effect_of_immunotherapy_prior_to_study_enrollment
         patient_has_fully_recovered_from_acute_toxic_effect_of_radiotherapy_prior_to_study_enrollment)
     :named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient must have fully recovered from the acute toxic effect of prior chemotherapy OR ... immunotherapy OR ... radiotherapy prior to study enrollment"

;; Component 2: Any grade 3 non-hematologic toxicity of any previous therapy must have resolved to grade 2 or less
(assert
  (! (=> (= non_hematologic_toxicity_grade_value_of_previous_therapy 3.0)
         (<= non_hematologic_toxicity_grade_value_after_resolution_of_previous_therapy 2.0))
     :named REQ11_COMPONENT2_OTHER_REQUIREMENTS)) ;; "any grade 3 non-hematologic toxicity of any previous therapy must have resolved to grade 2 or less"

;; Component 3: Any grade 4 non-hematologic toxicity of any previous therapy must have resolved to grade 2 or less
(assert
  (! (=> (= non_hematologic_toxicity_grade_value_of_previous_therapy 4.0)
         (<= non_hematologic_toxicity_grade_value_after_resolution_of_previous_therapy 2.0))
     :named REQ11_COMPONENT3_OTHER_REQUIREMENTS)) ;; "any grade 4 non-hematologic toxicity of any previous therapy must have resolved to grade 2 or less"

;; ===================== Declarations for the criterion (REQ 12) =====================
(declare-const patient_has_undergone_chemotherapy_inthepast3weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone chemotherapy within the past 3 weeks prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not undergone chemotherapy within the past 3 weeks prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone chemotherapy within the past 3 weeks prior to enrollment.","meaning":"Boolean indicating whether the patient has undergone chemotherapy within the past 3 weeks."} ;; "To be included, the patient must NOT have received myelosuppressive chemotherapy within 3 weeks of enrollment."
(declare-const patient_is_exposed_to_nitrosurea_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to nitrosourea at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to nitrosourea at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to nitrosourea.","meaning":"Boolean indicating whether the patient has ever been exposed to nitrosourea."} ;; "if the patient received prior nitrosourea"
(declare-const patient_is_exposed_to_nitrosurea_inthepast6weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to nitrosourea within the past 6 weeks prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not been exposed to nitrosourea within the past 6 weeks prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to nitrosourea within the past 6 weeks prior to enrollment.","meaning":"Boolean indicating whether the patient has been exposed to nitrosourea within the past 6 weeks."} ;; "the patient must NOT have received nitrosourea within 6 weeks of enrollment"

;; ===================== Constraint Assertions (REQ 12) =====================
;; Component 0: The patient must NOT have received myelosuppressive chemotherapy within 3 weeks of enrollment.
(assert
  (! (not patient_has_undergone_chemotherapy_inthepast3weeks)
     :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have received myelosuppressive chemotherapy within 3 weeks of enrollment."

;; Component 1: If the patient received prior nitrosourea, the patient must NOT have received nitrosourea within 6 weeks of enrollment.
(assert
  (! (or (not patient_is_exposed_to_nitrosurea_inthehistory)
         (not patient_is_exposed_to_nitrosurea_inthepast6weeks))
     :named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "if the patient received prior nitrosourea, the patient must NOT have received nitrosourea within 6 weeks of enrollment."

;; ===================== Declarations for the criterion (REQ 13) =====================
(declare-const days_since_completion_of_hematopoietic_growth_factor_therapy_value_recorded_now_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days that have elapsed since the completion of therapy with a hematopoietic growth factor, recorded as of now, in days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days have elapsed since the completion of therapy with a hematopoietic growth factor.","meaning":"Numeric value representing the number of days since completion of hematopoietic growth factor therapy, in days."} ;; "at least 7 days must have elapsed since the completion of therapy with a hematopoietic growth factor"
(declare-const days_since_receipt_of_pegfilgrastim_value_recorded_now_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days that have elapsed since the patient received pegfilgrastim, recorded as of now, in days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days have elapsed since the patient received pegfilgrastim.","meaning":"Numeric value representing the number of days since receipt of pegfilgrastim, in days."} ;; "at least 14 days must have elapsed after receiving pegfilgrastim"
(declare-const patient_is_exposed_to_hematopoietic_factor_inthepast7days Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to a hematopoietic growth factor within the past 7 days.","when_to_set_to_false":"Set to false if the patient was not exposed to a hematopoietic growth factor within the past 7 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to a hematopoietic growth factor within the past 7 days.","meaning":"Boolean indicating whether the patient was exposed to a hematopoietic growth factor within the past 7 days."} ;; "at least 7 days must have elapsed since the completion of therapy with a hematopoietic growth factor"
(declare-const patient_is_exposed_to_pegfilgrastim_inthepast14days Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to pegfilgrastim within the past 14 days.","when_to_set_to_false":"Set to false if the patient was not exposed to pegfilgrastim within the past 14 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to pegfilgrastim within the past 14 days.","meaning":"Boolean indicating whether the patient was exposed to pegfilgrastim within the past 14 days."} ;; "at least 14 days must have elapsed after receiving pegfilgrastim"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Definition: patient_is_exposed_to_hematopoietic_factor_inthepast7days is true iff days_since_completion_of_hematopoietic_growth_factor_therapy_value_recorded_now_in_days < 7
(assert
  (! (= patient_is_exposed_to_hematopoietic_factor_inthepast7days
        (< days_since_completion_of_hematopoietic_growth_factor_therapy_value_recorded_now_in_days 7))
     :named REQ13_AUXILIARY0)) ;; "at least 7 days must have elapsed since the completion of therapy with a hematopoietic growth factor"

;; Definition: patient_is_exposed_to_pegfilgrastim_inthepast14days is true iff days_since_receipt_of_pegfilgrastim_value_recorded_now_in_days < 14
(assert
  (! (= patient_is_exposed_to_pegfilgrastim_inthepast14days
        (< days_since_receipt_of_pegfilgrastim_value_recorded_now_in_days 14))
     :named REQ13_AUXILIARY1)) ;; "at least 14 days must have elapsed after receiving pegfilgrastim"

;; ===================== Constraint Assertions (REQ 13) =====================
;; Component 0: At least 7 days must have elapsed since completion of therapy with a hematopoietic growth factor
(assert
  (! (>= days_since_completion_of_hematopoietic_growth_factor_therapy_value_recorded_now_in_days 7)
     :named REQ13_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "at least 7 days must have elapsed since the completion of therapy with a hematopoietic growth factor"

;; Component 1: At least 14 days must have elapsed after receiving pegfilgrastim
(assert
  (! (>= days_since_receipt_of_pegfilgrastim_value_recorded_now_in_days 14)
     :named REQ13_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "at least 14 days must have elapsed after receiving pegfilgrastim"

;; ===================== Declarations for the criterion (REQ 14) =====================
(declare-const days_since_completion_of_therapy_with_biologic_agent_value_recorded_now_withunit_days Real) ;; {"when_to_set_to_value":"Set to the number of days that have elapsed since the completion of therapy with a biologic agent, as of now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days have elapsed since the completion of therapy with a biologic agent.","meaning":"Numeric variable representing the number of days since completion of therapy with a biologic agent, in days."} ;; "at least 7 days must have elapsed since the completion of therapy with a biologic agent"
(declare-const days_since_completion_of_therapy_with_targeted_agent_value_recorded_now_withunit_days Real) ;; {"when_to_set_to_value":"Set to the number of days that have elapsed since the completion of therapy with a targeted agent, as of now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days have elapsed since the completion of therapy with a targeted agent.","meaning":"Numeric variable representing the number of days since completion of therapy with a targeted agent, in days."} ;; "at least 7 days must have elapsed since the completion of therapy with a targeted agent"
(declare-const patient_has_taken_protein_tyrosine_kinase_inhibitor_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken a protein tyrosine kinase inhibitor-containing product at any time in the past.","when_to_set_to_false":"Set to false if the patient has never taken a protein tyrosine kinase inhibitor-containing product at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken a protein tyrosine kinase inhibitor-containing product.","meaning":"Boolean indicating whether the patient has ever taken a protein tyrosine kinase inhibitor-containing product in the past."} ;; "tyrosine kinase inhibitor"
(declare-const days_since_completion_of_therapy_with_metronomic_nonmyelosuppressive_regimen_value_recorded_now_withunit_days Real) ;; {"when_to_set_to_value":"Set to the number of days that have elapsed since the completion of therapy with a metronomic nonmyelosuppressive regimen, as of now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days have elapsed since the completion of therapy with a metronomic nonmyelosuppressive regimen.","meaning":"Numeric variable representing the number of days since completion of therapy with a metronomic nonmyelosuppressive regimen, in days."} ;; "at least 7 days must have elapsed since the completion of therapy with a metronomic nonmyelosuppressive regimen"
(declare-const days_since_completion_of_therapy_with_tyrosine_kinase_inhibitor_value_recorded_now_withunit_days Real) ;; {"when_to_set_to_value":"Set to the number of days that have elapsed since the completion of therapy with a tyrosine kinase inhibitor, as of now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days have elapsed since the completion of therapy with a tyrosine kinase inhibitor.","meaning":"Numeric variable representing the number of days since completion of therapy with a tyrosine kinase inhibitor, in days."} ;; "at least 7 days must have elapsed since the completion of therapy with a tyrosine kinase inhibitor"

;; ===================== Constraint Assertions (REQ 14) =====================
;; At least 7 days must have elapsed since completion of therapy with any of the following: biologic agent, targeted agent, tyrosine kinase inhibitor, or metronomic nonmyelosuppressive regimen.
(assert
  (! (or
        (>= days_since_completion_of_therapy_with_biologic_agent_value_recorded_now_withunit_days 7.0)
        (>= days_since_completion_of_therapy_with_targeted_agent_value_recorded_now_withunit_days 7.0)
        (and patient_has_taken_protein_tyrosine_kinase_inhibitor_containing_product_inthehistory
             (>= days_since_completion_of_therapy_with_tyrosine_kinase_inhibitor_value_recorded_now_withunit_days 7.0))
        (>= days_since_completion_of_therapy_with_metronomic_nonmyelosuppressive_regimen_value_recorded_now_withunit_days 7.0)
     )
     :named REQ14_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, at least 7 days must have elapsed since the completion of therapy with (a biologic agent OR a targeted agent OR a tyrosine kinase inhibitor OR a metronomic nonmyelosuppressive regimen)."

;; ===================== Declarations for the criterion (REQ 15) =====================
(declare-const patient_is_exposed_to_monoclonal_antibody_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to a monoclonal antibody at any time in the past, including as part of prior therapy.","when_to_set_to_false":"Set to false if the patient has never been exposed to a monoclonal antibody at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to a monoclonal antibody.","meaning":"Boolean indicating whether the patient has ever been exposed to a monoclonal antibody at any time in the past."} ;; "prior therapy that included a monoclonal antibody"
(declare-const weeks_elapsed_since_last_therapy_with_monoclonal_antibody_value_recorded_in_weeks Real) ;; {"when_to_set_to_value":"Set to the number of weeks that have elapsed since the patient's most recent prior therapy that included a monoclonal antibody.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many weeks have elapsed since the patient's most recent prior therapy with a monoclonal antibody.","meaning":"Numeric value representing the number of weeks since the patient's most recent prior therapy with a monoclonal antibody."} ;; "at least 4 weeks must have elapsed since prior therapy that included a monoclonal antibody"

;; ===================== Constraint Assertions (REQ 15) =====================
;; Component 0: At least 4 weeks must have elapsed since prior therapy that included a monoclonal antibody.
(assert
  (! (or (not patient_is_exposed_to_monoclonal_antibody_inthehistory)
         (>= weeks_elapsed_since_last_therapy_with_monoclonal_antibody_value_recorded_in_weeks 4))
     :named REQ15_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "at least 4 weeks must have elapsed since prior therapy that included a monoclonal antibody"

;; ===================== Declarations for the criterion (REQ 16) =====================
(declare-const patient_has_undergone_teleradiotherapy_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone teleradiotherapy (external beam radiation therapy) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone teleradiotherapy (external beam radiation therapy) in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone teleradiotherapy (external beam radiation therapy).","meaning":"Boolean indicating whether the patient has ever undergone teleradiotherapy (external beam radiation therapy) in the past."} ;; "external beam radiation therapy"
(declare-const weeks_elapsed_since_last_teleradiotherapy_procedure_value_recorded_in_weeks Real) ;; {"when_to_set_to_value":"Set to the number of weeks that have elapsed since the patient's most recent teleradiotherapy (external beam radiation therapy) procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many weeks have elapsed since the patient's most recent teleradiotherapy (external beam radiation therapy) procedure.","meaning":"Numeric variable indicating the number of weeks that have elapsed since the patient's most recent teleradiotherapy (external beam radiation therapy) procedure."} ;; "at least 3 weeks must have elapsed since radiotherapy (external beam radiation therapy)"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
  (! (or (not patient_has_undergone_teleradiotherapy_procedure_inthehistory)
         (>= weeks_elapsed_since_last_teleradiotherapy_procedure_value_recorded_in_weeks 3.0))
     :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "at least 3 weeks must have elapsed since radiotherapy (external beam radiation therapy)"

;; ===================== Declarations for the criterion (REQ 17) =====================
(declare-const patients_general_physical_performance_status_is_normal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's general physical performance status is currently assessed as normal.","when_to_set_to_false":"Set to false if the patient's general physical performance status is currently assessed as abnormal.","when_to_set_to_null":"Set to null if the patient's general physical performance status is not assessed, unknown, or cannot be determined.","meaning":"Boolean indicating whether the patient's general physical performance status is currently normal."} ;; "performance status"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
  (! patients_general_physical_performance_status_is_normal_now
     :named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must meet the performance status criteria."

;; ===================== Declarations for the criterion (REQ 18) =====================
(declare-const patient_ecog_performance_status_value_recorded_now_withunit_integer Real) ;; {"when_to_set_to_value":"Set to the integer value of the patient's current ECOG performance status (e.g., 0, 1, 2, etc.) as recorded now.","when_to_set_to_null":"Set to null if the patient's current ECOG performance status is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current ECOG performance status as an integer."} ;; "Eastern Cooperative Oncology Group performance status 0 OR 1 OR 2"
(declare-const patient_has_finding_of_ecog_performance_status_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an ECOG performance status finding.","when_to_set_to_false":"Set to false if the patient currently does not have an ECOG performance status finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an ECOG performance status finding.","meaning":"Boolean indicating whether the patient currently has an ECOG performance status finding."} ;; "Eastern Cooperative Oncology Group performance status"
(declare-const patient_lansky_performance_status_value_recorded_now_withunit_integer Real) ;; {"when_to_set_to_value":"Set to the integer value of the patient's current Lansky performance status (e.g., 0-100) as recorded now.","when_to_set_to_null":"Set to null if the patient's current Lansky performance status is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current Lansky performance status as an integer."} ;; "Lansky performance status"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "children less than or equal to 10 years of age"

;; ===================== Constraint Assertions (REQ 18) =====================
;; Component 0: ECOG 0, 1, or 2 OR (if age ≤ 10, Lansky ≥ 60)
(assert
  (! (or
        (and patient_has_finding_of_ecog_performance_status_finding_now
             (or (= patient_ecog_performance_status_value_recorded_now_withunit_integer 0)
                 (= patient_ecog_performance_status_value_recorded_now_withunit_integer 1)
                 (= patient_ecog_performance_status_value_recorded_now_withunit_integer 2)))
        (and (<= patient_age_value_recorded_now_in_years 10)
             (>= patient_lansky_performance_status_value_recorded_now_withunit_integer 60)))
     :named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, (the patient must have Eastern Cooperative Oncology Group performance status 0 OR the patient must have Eastern Cooperative Oncology Group performance status 1 OR the patient must have Eastern Cooperative Oncology Group performance status 2 OR (for children less than or equal to 10 years of age, Lansky performance status greater than or equal to 60))."

;; ===================== Declarations for the criterion (REQ 19) =====================
(declare-const patients_cardiac_function_is_normal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient’s cardiac function is normal now, according to protocol criteria.","when_to_set_to_false":"Set to false if the patient’s cardiac function is abnormal now, according to protocol criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient’s cardiac function is normal now.","meaning":"Boolean indicating whether the patient’s cardiac function is normal now."} ;; "cardiac function criteria"

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
  (! patients_cardiac_function_is_normal_now
     :named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must meet the cardiac function criteria."

;; ===================== Declarations for the criterion (REQ 20) =====================
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a numeric measurement of the patient's left ventricular ejection fraction is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current left ventricular ejection fraction."} ;; "have left ventricular ejection fraction ≥ 40 percent"
(declare-const patient_fractional_shortening_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a numeric measurement of the patient's fractional shortening is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current fractional shortening."} ;; "have fractional shortening ≥ 28 percent"

;; ===================== Constraint Assertions (REQ 20) =====================
(assert
  (! (or (>= patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent 40.0)
         (>= patient_fractional_shortening_value_recorded_now_withunit_percent 28.0))
     :named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((have left ventricular ejection fraction ≥ 40 percent) OR (have fractional shortening ≥ 28 percent))."

;; ===================== Declarations for the criterion (REQ 21) =====================
(declare-const patients_liver_function_is_normal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's liver function is currently within the normal range.","when_to_set_to_false":"Set to false if the patient's liver function is currently outside the normal range (i.e., abnormal).","when_to_set_to_null":"Set to null if the patient's current liver function status is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient's liver function is currently normal."} ;; "To be included, the patient must meet the liver function criteria."

;; ===================== Constraint Assertions (REQ 21) =====================
(assert
  (! patients_liver_function_is_normal_now
     :named REQ21_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must meet the liver function criteria."

;; ===================== Declarations for the criterion (REQ 22) =====================
(declare-const patient_serum_total_bilirubin_measurement_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if a current serum total bilirubin measurement in milligrams per deciliter is available.","when_to_set_to_null":"Set to null if no current serum total bilirubin measurement in milligrams per deciliter is available or the value is indeterminate.","meaning":"Numeric value for the patient's current serum total bilirubin in mg/dL."} ;; "serum total bilirubin less than 2 milligrams per deciliter"
(declare-const patient_ast_serum_measurement_value_recorded_now_withunit_units_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if a current serum AST measurement in units per liter is available.","when_to_set_to_null":"Set to null if no current serum AST measurement in units per liter is available or the value is indeterminate.","meaning":"Numeric value for the patient's current serum AST in U/L."} ;; "serum aspartate aminotransferase less than or equal to 3 times upper limit of normal"
(declare-const patient_alanine_aminotransferase_value_recorded_now_withunit_units_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if a current serum ALT measurement in units per liter is available.","when_to_set_to_null":"Set to null if no current serum ALT measurement in units per liter is available or the value is indeterminate.","meaning":"Numeric value for the patient's current serum ALT in U/L."} ;; "serum alanine aminotransferase less than or equal to 3 times upper limit of normal"
(declare-const patient_has_diagnosis_of_gilbert_s_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Gilbert’s syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Gilbert’s syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Gilbert’s syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Gilbert’s syndrome."} ;; "Patients with Gilbert’s syndrome are excluded from the requirement of a normal bilirubin"
(declare-const patient_has_finding_of_elevated_liver_enzymes_level_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has elevated liver enzyme levels.","when_to_set_to_false":"Set to false if the patient currently does not have elevated liver enzyme levels.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has elevated liver enzyme levels.","meaning":"Boolean indicating whether the patient currently has elevated liver enzyme levels."} ;; "liver enzyme elevation"
(declare-const patient_has_finding_of_elevated_liver_enzymes_level_now@@due_to_tumor_involvement Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current elevated liver enzyme levels are due to tumor involvement.","when_to_set_to_false":"Set to false if the patient's current elevated liver enzyme levels are not due to tumor involvement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the elevated liver enzyme levels are due to tumor involvement.","meaning":"Boolean indicating whether the patient's current elevated liver enzyme levels are due to tumor involvement."} ;; "liver enzyme elevation is due to tumor involvement"
(declare-const patient_has_finding_of_toxic_liver_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatic toxicity.","when_to_set_to_false":"Set to false if the patient currently does not have hepatic toxicity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatic toxicity.","meaning":"Boolean indicating whether the patient currently has hepatic toxicity."} ;; "hepatic toxicity"
(declare-const patient_has_finding_of_toxic_liver_disease_now@@adult_values_used_for_calculation Bool) ;; {"when_to_set_to_true":"Set to true if adult values are used for calculating the patient's hepatic toxicity.","when_to_set_to_false":"Set to false if adult values are not used for calculating the patient's hepatic toxicity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether adult values are used for calculating hepatic toxicity.","meaning":"Boolean indicating whether adult values are used for calculating the patient's hepatic toxicity."} ;; "Adult values will be used for calculating hepatic toxicity and determining eligibility"
;; patients_liver_function_is_normal_now is already declared and reused

;; ===================== Auxiliary Assertions (REQ 22) =====================
;; If qualifier variable is true, stem variable must be true
(assert
  (! (=> patient_has_finding_of_elevated_liver_enzymes_level_now@@due_to_tumor_involvement
         patient_has_finding_of_elevated_liver_enzymes_level_now)
     :named REQ22_AUXILIARY0)) ;; "liver enzyme elevation is due to tumor involvement"

;; If qualifier variable is true, stem variable must be true
(assert
  (! (=> patient_has_finding_of_toxic_liver_disease_now@@adult_values_used_for_calculation
         patient_has_finding_of_toxic_liver_disease_now)
     :named REQ22_AUXILIARY1)) ;; "Adult values will be used for calculating hepatic toxicity and determining eligibility"

;; ===================== Constraint Assertions (REQ 22) =====================
;; Component 0: Bilirubin requirement, with exception for Gilbert's syndrome
(assert
  (! (or (< patient_serum_total_bilirubin_measurement_value_recorded_now_withunit_milligrams_per_deciliter 2.0)
         patient_has_diagnosis_of_gilbert_s_syndrome_now)
     :named REQ22_COMPONENT0_OTHER_REQUIREMENTS)) ;; "serum total bilirubin less than 2 mg/dL, except for patients with Gilbert’s syndrome"

;; Component 1: AST requirement, with exception if elevation is due to tumor involvement
(assert
  (! (or (<= patient_ast_serum_measurement_value_recorded_now_withunit_units_per_liter (* 3.0 1.0)) ;; 3x ULN, ULN assumed as 1.0 for encoding, see note below
         patient_has_finding_of_elevated_liver_enzymes_level_now@@due_to_tumor_involvement)
     :named REQ22_COMPONENT1_OTHER_REQUIREMENTS)) ;; "serum AST ≤ 3x ULN, except if elevation is due to tumor involvement"

;; Component 2: ALT requirement, with exception if elevation is due to tumor involvement
(assert
  (! (or (<= patient_alanine_aminotransferase_value_recorded_now_withunit_units_per_liter (* 3.0 1.0)) ;; 3x ULN, ULN assumed as 1.0 for encoding, see note below
         patient_has_finding_of_elevated_liver_enzymes_level_now@@due_to_tumor_involvement)
     :named REQ22_COMPONENT2_OTHER_REQUIREMENTS)) ;; "serum ALT ≤ 3x ULN, except if elevation is due to tumor involvement"

;; Component 3: Adult values must be used for hepatic toxicity calculation
(assert
  (! patient_has_finding_of_toxic_liver_disease_now@@adult_values_used_for_calculation
     :named REQ22_COMPONENT3_OTHER_REQUIREMENTS)) ;; "Adult values will be used for calculating hepatic toxicity and determining eligibility"

;; Note: The upper limit of normal (ULN) for AST and ALT is protocol-defined and should be encoded as a variable if available. Here, ULN is set as 1.0 for encoding purposes; replace with actual ULN variable if available.

;; ===================== Declarations for the criterion (REQ 23) =====================
(declare-const patient_renal_function_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's renal function is recorded now, with the appropriate unit.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current renal function as measured by a specific test and unit."} ;; "renal function"

(declare-const patient_meets_renal_function_criteria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently meets the renal function criteria required for inclusion.","when_to_set_to_false":"Set to false if the patient currently does not meet the renal function criteria required for inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently meets the renal function criteria required for inclusion.","meaning":"Boolean indicating whether the patient currently meets the renal function criteria required for inclusion."} ;; "must meet the renal function criteria"

;; ===================== Auxiliary Assertions (REQ 23) =====================
;; The renal function criteria is met if and only if the protocol-defined renal function criteria are satisfied.
;; (Note: The specific numeric threshold or formula is not provided in the requirement, so this is a placeholder for protocol logic.)
(assert
  (! (= patient_meets_renal_function_criteria_now
        ;; Placeholder: protocol-specific renal function criteria to be defined here
        true)
     :named REQ23_AUXILIARY0)) ;; "must meet the renal function criteria"

;; ===================== Constraint Assertions (REQ 23) =====================
(assert
  (! patient_meets_renal_function_criteria_now
     :named REQ23_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must meet the renal function criteria."

;; ===================== Declarations for the criterion (REQ 24) =====================
(declare-const patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute_per_1_73_square_meters Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of creatinine clearance in milliliters per minute per 1.73 square meters is available now.","when_to_set_to_null":"Set to null if no such measurement is available now or the value is indeterminate.","meaning":"Numeric value representing the patient's current creatinine clearance in milliliters per minute per 1.73 square meters."} ;; "creatinine clearance ≥ 60 milliliters per minute per 1.73 square meters"
(declare-const patient_has_finding_of_serum_creatinine_level_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a normal serum creatinine level (as defined by age-adjusted criteria).","when_to_set_to_false":"Set to false if the patient currently does not have a normal serum creatinine level (as defined by age-adjusted criteria).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a normal serum creatinine level.","meaning":"Boolean indicating whether the patient currently has a normal serum creatinine level."} ;; "have age-adjusted normal serum creatinine according to the following table"

;; ===================== Constraint Assertions (REQ 24) =====================
;; Component 0: To be included, the patient must ((have age-adjusted normal serum creatinine according to the following table) OR (have creatinine clearance ≥ 60 milliliters per minute per 1.73 square meters)).
(assert
  (! (or patient_has_finding_of_serum_creatinine_level_finding_now
         (>= patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute_per_1_73_square_meters 60.0))
     :named REQ24_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((have age-adjusted normal serum creatinine according to the following table) OR (have creatinine clearance ≥ 60 milliliters per minute per 1.73 square meters))."
