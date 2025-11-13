;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_malignant_tumor_of_ovary_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant tumor of the ovary.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant tumor of the ovary.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant tumor of the ovary.","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant tumor of the ovary."} ;; "ovarian cancer"
(declare-const patient_has_diagnosis_of_malignant_tumor_of_ovary_now@@persistent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of malignant tumor of the ovary is persistent.","when_to_set_to_false":"Set to false if the patient's diagnosis of malignant tumor of the ovary is not persistent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is persistent.","meaning":"Boolean indicating whether the patient's diagnosis of malignant tumor of the ovary is persistent."} ;; "persistent ovarian cancer"
(declare-const patient_has_diagnosis_of_malignant_tumor_of_ovary_now@@recurrent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of malignant tumor of the ovary is recurrent.","when_to_set_to_false":"Set to false if the patient's diagnosis of malignant tumor of the ovary is not recurrent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is recurrent.","meaning":"Boolean indicating whether the patient's diagnosis of malignant tumor of the ovary is recurrent."} ;; "recurrent ovarian cancer"
(declare-const patient_has_diagnosis_of_malignant_tumor_of_ovary_now@@progressive Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of malignant tumor of the ovary is progressive.","when_to_set_to_false":"Set to false if the patient's diagnosis of malignant tumor of the ovary is not progressive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is progressive.","meaning":"Boolean indicating whether the patient's diagnosis of malignant tumor of the ovary is progressive."} ;; "progressive ovarian cancer"

(declare-const patient_has_diagnosis_of_extraovarian_primary_peritoneal_carcinoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of extraovarian primary peritoneal carcinoma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of extraovarian primary peritoneal carcinoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of extraovarian primary peritoneal carcinoma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of extraovarian primary peritoneal carcinoma."} ;; "persistent primary peritoneal cancer"
(declare-const patient_has_diagnosis_of_extraovarian_primary_peritoneal_carcinoma_now@@persistent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of extraovarian primary peritoneal carcinoma is persistent.","when_to_set_to_false":"Set to false if the patient's diagnosis of extraovarian primary peritoneal carcinoma is not persistent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is persistent.","meaning":"Boolean indicating whether the patient's diagnosis of extraovarian primary peritoneal carcinoma is persistent."} ;; "persistent primary peritoneal cancer"

(declare-const patient_has_diagnosis_of_malignant_peritoneal_local_recurrence_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant peritoneal local recurrence.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant peritoneal local recurrence.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant peritoneal local recurrence.","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant peritoneal local recurrence."} ;; "recurrent primary peritoneal cancer"
(declare-const patient_has_diagnosis_of_malignant_peritoneal_local_recurrence_now@@recurrent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of malignant peritoneal local recurrence is recurrent.","when_to_set_to_false":"Set to false if the patient's diagnosis of malignant peritoneal local recurrence is not recurrent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is recurrent.","meaning":"Boolean indicating whether the patient's diagnosis of malignant peritoneal local recurrence is recurrent."} ;; "recurrent primary peritoneal cancer"

(declare-const patient_has_diagnosis_of_malignant_tumor_of_peritoneum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant tumor of the peritoneum.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant tumor of the peritoneum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant tumor of the peritoneum.","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant tumor of the peritoneum."} ;; "primary peritoneal cancer"
(declare-const patient_has_diagnosis_of_malignant_tumor_of_peritoneum_now@@progressive Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of malignant tumor of the peritoneum is progressive.","when_to_set_to_false":"Set to false if the patient's diagnosis of malignant tumor of the peritoneum is not progressive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is progressive.","meaning":"Boolean indicating whether the patient's diagnosis of malignant tumor of the peritoneum is progressive."} ;; "progressive primary peritoneal cancer"

(declare-const patient_is_exposed_to_platinum_compound_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to a platinum compound.","when_to_set_to_false":"Set to false if the patient has never been exposed to a platinum compound.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to a platinum compound.","meaning":"Boolean indicating whether the patient has ever been exposed to a platinum compound."} ;; "prior treatment with platinum compound"
(declare-const patient_has_taken_paclitaxel_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken a paclitaxel-containing product.","when_to_set_to_false":"Set to false if the patient has never taken a paclitaxel-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken a paclitaxel-containing product.","meaning":"Boolean indicating whether the patient has ever taken a paclitaxel-containing product."} ;; "prior treatment with taxol compound"
(declare-const patient_has_histologic_confirmation_of_original_primary_tumor Bool) ;; {"when_to_set_to_true":"Set to true if the patient has histologic confirmation of the original primary tumor.","when_to_set_to_false":"Set to false if the patient does not have histologic confirmation of the original primary tumor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has histologic confirmation of the original primary tumor.","meaning":"Boolean indicating whether the patient has histologic confirmation of the original primary tumor."} ;; "histologic confirmation of the original primary tumor"
(declare-const patient_has_undergone_bilateral_oophorectomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone bilateral oophorectomy.","when_to_set_to_false":"Set to false if the patient has never undergone bilateral oophorectomy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone bilateral oophorectomy.","meaning":"Boolean indicating whether the patient has ever undergone bilateral oophorectomy."} ;; "prior bilateral oophorectomy"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_malignant_tumor_of_ovary_now@@persistent
         patient_has_diagnosis_of_malignant_tumor_of_ovary_now)
     :named REQ1_AUXILIARY0)) ;; "persistent ovarian cancer"
(assert
  (! (=> patient_has_diagnosis_of_malignant_tumor_of_ovary_now@@recurrent
         patient_has_diagnosis_of_malignant_tumor_of_ovary_now)
     :named REQ1_AUXILIARY1)) ;; "recurrent ovarian cancer"
(assert
  (! (=> patient_has_diagnosis_of_malignant_tumor_of_ovary_now@@progressive
         patient_has_diagnosis_of_malignant_tumor_of_ovary_now)
     :named REQ1_AUXILIARY2)) ;; "progressive ovarian cancer"

(assert
  (! (=> patient_has_diagnosis_of_extraovarian_primary_peritoneal_carcinoma_now@@persistent
         patient_has_diagnosis_of_extraovarian_primary_peritoneal_carcinoma_now)
     :named REQ1_AUXILIARY3)) ;; "persistent primary peritoneal cancer"

(assert
  (! (=> patient_has_diagnosis_of_malignant_peritoneal_local_recurrence_now@@recurrent
         patient_has_diagnosis_of_malignant_peritoneal_local_recurrence_now)
     :named REQ1_AUXILIARY4)) ;; "recurrent primary peritoneal cancer"

(assert
  (! (=> patient_has_diagnosis_of_malignant_tumor_of_peritoneum_now@@progressive
         patient_has_diagnosis_of_malignant_tumor_of_peritoneum_now)
     :named REQ1_AUXILIARY5)) ;; "progressive primary peritoneal cancer"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: (persistent ovarian cancer OR recurrent ovarian cancer OR progressive ovarian cancer OR persistent primary peritoneal cancer OR recurrent primary peritoneal cancer OR progressive primary peritoneal cancer)
(assert
  (! (or patient_has_diagnosis_of_malignant_tumor_of_ovary_now@@persistent
         patient_has_diagnosis_of_malignant_tumor_of_ovary_now@@recurrent
         patient_has_diagnosis_of_malignant_tumor_of_ovary_now@@progressive
         patient_has_diagnosis_of_extraovarian_primary_peritoneal_carcinoma_now@@persistent
         patient_has_diagnosis_of_malignant_peritoneal_local_recurrence_now@@recurrent
         patient_has_diagnosis_of_malignant_tumor_of_peritoneum_now@@progressive)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must (have persistent ovarian cancer OR have recurrent ovarian cancer OR have progressive ovarian cancer OR have persistent primary peritoneal cancer OR have recurrent primary peritoneal cancer OR have progressive primary peritoneal cancer)."

;; Component 1: prior treatment with platinum compound
(assert
  (! patient_is_exposed_to_platinum_compound_inthehistory
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have had prior treatment with platinum compound."

;; Component 2: prior treatment with taxol compound
(assert
  (! patient_has_taken_paclitaxel_containing_product_inthehistory
     :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have had prior treatment with taxol compound."

;; Component 3: histologic confirmation of the original primary tumor
(assert
  (! patient_has_histologic_confirmation_of_original_primary_tumor
     :named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have histologic confirmation of the original primary tumor."

;; Component 4: prior bilateral oophorectomy
(assert
  (! patient_has_undergone_bilateral_oophorectomy_inthehistory
     :named REQ1_COMPONENT4_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have had prior bilateral oophorectomy."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_malignant_adenomatous_neoplasm_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant adenomatous neoplasm (adenocarcinoma).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant adenomatous neoplasm (adenocarcinoma).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant adenomatous neoplasm (adenocarcinoma).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant adenomatous neoplasm (adenocarcinoma)."} ;; "adenocarcinoma"
(declare-const patient_has_diagnosis_of_malignant_epithelial_neoplasm_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant epithelial neoplasm (carcinoma).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant epithelial neoplasm (carcinoma).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant epithelial neoplasm (carcinoma).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant epithelial neoplasm (carcinoma)."} ;; "carcinoma"
(declare-const patient_has_diagnosis_of_malignant_epithelial_neoplasm_now@@serous_adenocarcinoma Bool) ;; {"when_to_set_to_true":"Set to true if the patient's malignant epithelial neoplasm (carcinoma) is serous adenocarcinoma.","when_to_set_to_false":"Set to false if the patient's malignant epithelial neoplasm (carcinoma) is not serous adenocarcinoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the carcinoma is serous adenocarcinoma.","meaning":"Boolean indicating whether the patient's malignant epithelial neoplasm (carcinoma) is serous adenocarcinoma."} ;; "serous adenocarcinoma"
(declare-const patient_has_diagnosis_of_malignant_epithelial_neoplasm_now@@endometroid_adenocarcinoma Bool) ;; {"when_to_set_to_true":"Set to true if the patient's malignant epithelial neoplasm (carcinoma) is endometroid adenocarcinoma.","when_to_set_to_false":"Set to false if the patient's malignant epithelial neoplasm (carcinoma) is not endometroid adenocarcinoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the carcinoma is endometroid adenocarcinoma.","meaning":"Boolean indicating whether the patient's malignant epithelial neoplasm (carcinoma) is endometroid adenocarcinoma."} ;; "endometroid adenocarcinoma"
(declare-const patient_has_diagnosis_of_malignant_epithelial_neoplasm_now@@mucinous_adenocarcinoma Bool) ;; {"when_to_set_to_true":"Set to true if the patient's malignant epithelial neoplasm (carcinoma) is mucinous adenocarcinoma.","when_to_set_to_false":"Set to false if the patient's malignant epithelial neoplasm (carcinoma) is not mucinous adenocarcinoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the carcinoma is mucinous adenocarcinoma.","meaning":"Boolean indicating whether the patient's malignant epithelial neoplasm (carcinoma) is mucinous adenocarcinoma."} ;; "mucinous adenocarcinoma"
(declare-const patient_has_diagnosis_of_malignant_epithelial_neoplasm_now@@undifferentiated Bool) ;; {"when_to_set_to_true":"Set to true if the patient's malignant epithelial neoplasm (carcinoma) is undifferentiated.","when_to_set_to_false":"Set to false if the patient's malignant epithelial neoplasm (carcinoma) is not undifferentiated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the carcinoma is undifferentiated.","meaning":"Boolean indicating whether the patient's malignant epithelial neoplasm (carcinoma) is undifferentiated."} ;; "undifferentiated carcinoma"
(declare-const patient_has_diagnosis_of_malignant_epithelial_neoplasm_now@@clear_cell_adenocarcinoma Bool) ;; {"when_to_set_to_true":"Set to true if the patient's malignant epithelial neoplasm (carcinoma) is clear cell adenocarcinoma.","when_to_set_to_false":"Set to false if the patient's malignant epithelial neoplasm (carcinoma) is not clear cell adenocarcinoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the carcinoma is clear cell adenocarcinoma.","meaning":"Boolean indicating whether the patient's malignant epithelial neoplasm (carcinoma) is clear cell adenocarcinoma."} ;; "clear cell adenocarcinoma"
(declare-const patient_has_diagnosis_of_malignant_epithelial_neoplasm_now@@mixed_epithelial Bool) ;; {"when_to_set_to_true":"Set to true if the patient's malignant epithelial neoplasm (carcinoma) is mixed epithelial.","when_to_set_to_false":"Set to false if the patient's malignant epithelial neoplasm (carcinoma) is not mixed epithelial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the carcinoma is mixed epithelial.","meaning":"Boolean indicating whether the patient's malignant epithelial neoplasm (carcinoma) is mixed epithelial."} ;; "mixed epithelial carcinoma"
(declare-const patient_has_diagnosis_of_malignant_epithelial_neoplasm_now@@transitional_cell Bool) ;; {"when_to_set_to_true":"Set to true if the patient's malignant epithelial neoplasm (carcinoma) is transitional cell.","when_to_set_to_false":"Set to false if the patient's malignant epithelial neoplasm (carcinoma) is not transitional cell.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the carcinoma is transitional cell.","meaning":"Boolean indicating whether the patient's malignant epithelial neoplasm (carcinoma) is transitional cell."} ;; "transitional cell carcinoma"
(declare-const patient_has_diagnosis_of_malignant_epithelial_neoplasm_now@@malignant_brenners_tumor Bool) ;; {"when_to_set_to_true":"Set to true if the patient's malignant epithelial neoplasm (carcinoma) is malignant Brenner's tumor.","when_to_set_to_false":"Set to false if the patient's malignant epithelial neoplasm (carcinoma) is not malignant Brenner's tumor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the carcinoma is malignant Brenner's tumor.","meaning":"Boolean indicating whether the patient's malignant epithelial neoplasm (carcinoma) is malignant Brenner's tumor."} ;; "malignant Brenner's tumor"
(declare-const patient_has_diagnosis_of_malignant_epithelial_neoplasm_now@@adenocarcinoma_not_otherwise_specified Bool) ;; {"when_to_set_to_true":"Set to true if the patient's malignant epithelial neoplasm (carcinoma) is adenocarcinoma not otherwise specified.","when_to_set_to_false":"Set to false if the patient's malignant epithelial neoplasm (carcinoma) is not adenocarcinoma not otherwise specified.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the carcinoma is adenocarcinoma not otherwise specified.","meaning":"Boolean indicating whether the patient's malignant epithelial neoplasm (carcinoma) is adenocarcinoma not otherwise specified."} ;; "adenocarcinoma not otherwise specified"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_malignant_epithelial_neoplasm_now@@serous_adenocarcinoma
         patient_has_diagnosis_of_malignant_epithelial_neoplasm_now)
     :named REQ2_AUXILIARY0)) ;; "serous adenocarcinoma" is a type of malignant epithelial neoplasm

(assert
  (! (=> patient_has_diagnosis_of_malignant_epithelial_neoplasm_now@@endometroid_adenocarcinoma
         patient_has_diagnosis_of_malignant_epithelial_neoplasm_now)
     :named REQ2_AUXILIARY1)) ;; "endometroid adenocarcinoma" is a type of malignant epithelial neoplasm

(assert
  (! (=> patient_has_diagnosis_of_malignant_epithelial_neoplasm_now@@mucinous_adenocarcinoma
         patient_has_diagnosis_of_malignant_epithelial_neoplasm_now)
     :named REQ2_AUXILIARY2)) ;; "mucinous adenocarcinoma" is a type of malignant epithelial neoplasm

(assert
  (! (=> patient_has_diagnosis_of_malignant_epithelial_neoplasm_now@@undifferentiated
         patient_has_diagnosis_of_malignant_epithelial_neoplasm_now)
     :named REQ2_AUXILIARY3)) ;; "undifferentiated carcinoma" is a type of malignant epithelial neoplasm

(assert
  (! (=> patient_has_diagnosis_of_malignant_epithelial_neoplasm_now@@clear_cell_adenocarcinoma
         patient_has_diagnosis_of_malignant_epithelial_neoplasm_now)
     :named REQ2_AUXILIARY4)) ;; "clear cell adenocarcinoma" is a type of malignant epithelial neoplasm

(assert
  (! (=> patient_has_diagnosis_of_malignant_epithelial_neoplasm_now@@mixed_epithelial
         patient_has_diagnosis_of_malignant_epithelial_neoplasm_now)
     :named REQ2_AUXILIARY5)) ;; "mixed epithelial carcinoma" is a type of malignant epithelial neoplasm

(assert
  (! (=> patient_has_diagnosis_of_malignant_epithelial_neoplasm_now@@transitional_cell
         patient_has_diagnosis_of_malignant_epithelial_neoplasm_now)
     :named REQ2_AUXILIARY6)) ;; "transitional cell carcinoma" is a type of malignant epithelial neoplasm

(assert
  (! (=> patient_has_diagnosis_of_malignant_epithelial_neoplasm_now@@malignant_brenners_tumor
         patient_has_diagnosis_of_malignant_epithelial_neoplasm_now)
     :named REQ2_AUXILIARY7)) ;; "malignant Brenner's tumor" is a type of malignant epithelial neoplasm

(assert
  (! (=> patient_has_diagnosis_of_malignant_epithelial_neoplasm_now@@adenocarcinoma_not_otherwise_specified
         patient_has_diagnosis_of_malignant_epithelial_neoplasm_now)
     :named REQ2_AUXILIARY8)) ;; "adenocarcinoma not otherwise specified" is a type of malignant epithelial neoplasm

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exhaustive subcategories: patient must have at least one of the listed histologic epithelial cell types
(assert
  (! (or patient_has_diagnosis_of_malignant_epithelial_neoplasm_now@@serous_adenocarcinoma
         patient_has_diagnosis_of_malignant_epithelial_neoplasm_now@@endometroid_adenocarcinoma
         patient_has_diagnosis_of_malignant_epithelial_neoplasm_now@@mucinous_adenocarcinoma
         patient_has_diagnosis_of_malignant_epithelial_neoplasm_now@@undifferentiated
         patient_has_diagnosis_of_malignant_epithelial_neoplasm_now@@clear_cell_adenocarcinoma
         patient_has_diagnosis_of_malignant_epithelial_neoplasm_now@@mixed_epithelial
         patient_has_diagnosis_of_malignant_epithelial_neoplasm_now@@transitional_cell
         patient_has_diagnosis_of_malignant_epithelial_neoplasm_now@@malignant_brenners_tumor
         patient_has_diagnosis_of_malignant_epithelial_neoplasm_now@@adenocarcinoma_not_otherwise_specified)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "at least one of the following histologic epithelial cell types"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_neutrophil_count_value_recorded_inthepast7days_withunit_cells_per_microliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's absolute neutrophil count was recorded within the past 7 days in cells per microliter.","when_to_set_to_null":"Set to null if no such measurement is available within the past 7 days or the value is indeterminate.","meaning":"Numeric value of the patient's absolute neutrophil count measured within the past 7 days, in cells per microliter."} ;; "absolute neutrophil count ≥ 1500 per microliter, with laboratory value obtained within 7 days prior to registration."
(declare-const patient_platelet_count_value_recorded_inthepast7days_withunit_cells_per_microliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's platelet count was recorded within the past 7 days in cells per microliter.","when_to_set_to_null":"Set to null if no such measurement is available within the past 7 days or the value is indeterminate.","meaning":"Numeric value of the patient's platelet count measured within the past 7 days, in cells per microliter."} ;; "platelet count ≥ 100,000 per microliter, with laboratory value obtained within 7 days prior to registration."
(declare-const patient_bilirubin_total_measurement_value_recorded_inthepast7days_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's total bilirubin concentration was recorded within the past 7 days in milligrams per deciliter.","when_to_set_to_null":"Set to null if no such measurement is available within the past 7 days or the value is indeterminate.","meaning":"Numeric value of the patient's total bilirubin concentration measured within the past 7 days, in milligrams per deciliter."} ;; "total bilirubin concentration ≤ upper normal limit, with laboratory value obtained within 7 days prior to registration."
(declare-const patient_aspartate_transaminase_level_value_recorded_inthepast7days_withunit_units_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's aspartate aminotransferase concentration was recorded within the past 7 days in units per liter.","when_to_set_to_null":"Set to null if no such measurement is available within the past 7 days or the value is indeterminate.","meaning":"Numeric value of the patient's aspartate aminotransferase concentration measured within the past 7 days, in units per liter."} ;; "aspartate aminotransferase concentration ≤ 2 × upper limit of normal, with laboratory value obtained within 7 days prior to registration."
(declare-const patient_creatinine_level_finding_value_recorded_inthepast7days_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's creatinine concentration was recorded within the past 7 days in milligrams per deciliter.","when_to_set_to_null":"Set to null if no such measurement is available within the past 7 days or the value is indeterminate.","meaning":"Numeric value of the patient's creatinine concentration measured within the past 7 days, in milligrams per deciliter."} ;; "creatinine concentration ≤ 1.5 × upper limit of normal, with laboratory value obtained within 7 days prior to registration."
(declare-const patient_hemoglobin_concentration_dipstick_finding_value_recorded_inthepast7days_withunit_g_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's hemoglobin concentration was recorded within the past 7 days in grams per deciliter.","when_to_set_to_null":"Set to null if no such measurement is available within the past 7 days or the value is indeterminate.","meaning":"Numeric value of the patient's hemoglobin concentration measured within the past 7 days, in grams per deciliter."} ;; "hemoglobin concentration ≥ 9.0 grams per deciliter, with laboratory value obtained within 7 days prior to registration."

(declare-const patient_bilirubin_total_upper_normal_limit_value Real) ;; {"when_to_set_to_value":"Set to the reference value for the upper normal limit of total bilirubin concentration for the laboratory performing the test.","when_to_set_to_null":"Set to null if the reference value is unknown, not documented, or indeterminate.","meaning":"Numeric value representing the upper normal limit for total bilirubin concentration (mg/dL) as defined by the laboratory."} ;; "total bilirubin concentration ≤ upper normal limit"
(declare-const patient_aspartate_transaminase_upper_normal_limit_value Real) ;; {"when_to_set_to_value":"Set to the reference value for the upper normal limit of aspartate aminotransferase concentration for the laboratory performing the test.","when_to_set_to_null":"Set to null if the reference value is unknown, not documented, or indeterminate.","meaning":"Numeric value representing the upper normal limit for aspartate aminotransferase concentration (units/L) as defined by the laboratory."} ;; "aspartate aminotransferase concentration ≤ 2 × upper limit of normal"
(declare-const patient_creatinine_upper_normal_limit_value Real) ;; {"when_to_set_to_value":"Set to the reference value for the upper normal limit of creatinine concentration for the laboratory performing the test.","when_to_set_to_null":"Set to null if the reference value is unknown, not documented, or indeterminate.","meaning":"Numeric value representing the upper normal limit for creatinine concentration (mg/dL) as defined by the laboratory."} ;; "creatinine concentration ≤ 1.5 × upper limit of normal"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: absolute neutrophil count ≥ 1500 per microliter, within 7 days prior to registration
(assert
  (! (>= patient_neutrophil_count_value_recorded_inthepast7days_withunit_cells_per_microliter 1500.0)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "absolute neutrophil count ≥ 1500 per microliter, with laboratory value obtained within 7 days prior to registration."

;; Component 1: platelet count ≥ 100,000 per microliter, within 7 days prior to registration
(assert
  (! (>= patient_platelet_count_value_recorded_inthepast7days_withunit_cells_per_microliter 100000.0)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "platelet count ≥ 100,000 per microliter, with laboratory value obtained within 7 days prior to registration."

;; Component 2: total bilirubin concentration ≤ upper normal limit, within 7 days prior to registration
(assert
  (! (<= patient_bilirubin_total_measurement_value_recorded_inthepast7days_withunit_mg_per_dl patient_bilirubin_total_upper_normal_limit_value)
     :named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "total bilirubin concentration ≤ upper normal limit, with laboratory value obtained within 7 days prior to registration."

;; Component 3: aspartate aminotransferase concentration ≤ 2 × upper limit of normal, within 7 days prior to registration
(assert
  (! (<= patient_aspartate_transaminase_level_value_recorded_inthepast7days_withunit_units_per_liter
        (* 2.0 patient_aspartate_transaminase_upper_normal_limit_value))
     :named REQ3_COMPONENT3_OTHER_REQUIREMENTS)) ;; "aspartate aminotransferase concentration ≤ 2 × upper limit of normal, with laboratory value obtained within 7 days prior to registration."

;; Component 4: creatinine concentration ≤ 1.5 × upper limit of normal, within 7 days prior to registration
(assert
  (! (<= patient_creatinine_level_finding_value_recorded_inthepast7days_withunit_mg_per_dl
        (* 1.5 patient_creatinine_upper_normal_limit_value))
     :named REQ3_COMPONENT4_OTHER_REQUIREMENTS)) ;; "creatinine concentration ≤ 1.5 × upper limit of normal, with laboratory value obtained within 7 days prior to registration."

;; Component 5: hemoglobin concentration ≥ 9.0 grams per deciliter, within 7 days prior to registration
(assert
  (! (>= patient_hemoglobin_concentration_dipstick_finding_value_recorded_inthepast7days_withunit_g_per_dl 9.0)
     :named REQ3_COMPONENT5_OTHER_REQUIREMENTS)) ;; "hemoglobin concentration ≥ 9.0 grams per deciliter, with laboratory value obtained within 7 days prior to registration."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_ability_to_provide_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the ability to provide informed consent.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to provide informed consent.","meaning":"Boolean indicating whether the patient currently has the ability to provide informed consent."} ;; "the patient must have the ability to provide informed consent"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_ability_to_provide_informed_consent_now
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have the ability to provide informed consent"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_is_willing_to_return_to_mayo_clinic_rochester_for_follow_up Bool) ;; {"when_to_set_to_true":"Set to true if the patient expresses willingness to return to Mayo Clinic Rochester for follow-up.","when_to_set_to_false":"Set to false if the patient expresses unwillingness to return to Mayo Clinic Rochester for follow-up.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to return to Mayo Clinic Rochester for follow-up.","meaning":"Boolean indicating whether the patient is willing to return to Mayo Clinic Rochester for follow-up."} ;; "the patient must be willing to return to Mayo Clinic Rochester for follow-up"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_is_willing_to_return_to_mayo_clinic_rochester_for_follow_up
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be willing to return to Mayo Clinic Rochester for follow-up"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_longevity_value_recorded_now_withunit_weeks Real) ;; {"when_to_set_to_value":"Set to the estimated number of weeks if the patient's current life expectancy is documented or can be reasonably determined.","when_to_set_to_null":"Set to null if the patient's current life expectancy in weeks is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current life expectancy in weeks."} ;; "life expectancy ≥ 12 weeks"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (>= patient_longevity_value_recorded_now_withunit_weeks 12)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have life expectancy ≥ 12 weeks."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_measles_igg_level_value_recorded_now_withunit_enzyme_units_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's serum immunoglobulin G anti-measles antibody level is recorded now in enzyme units per milliliter.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum immunoglobulin G anti-measles antibody level in enzyme units per milliliter."} ;; "serum immunoglobulin G anti-measles antibody level"
(declare-const patient_measles_igg_level_value_recorded_now_withunit_enzyme_units_per_milliliter@@determined_by_enzyme_immunoassay_diamedix_florida Bool) ;; {"when_to_set_to_true":"Set to true if the patient's serum immunoglobulin G anti-measles antibody level measurement was determined by enzyme immunoassay (Diamedix, Florida).","when_to_set_to_false":"Set to false if the measurement was not determined by enzyme immunoassay (Diamedix, Florida).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was determined by enzyme immunoassay (Diamedix, Florida).","meaning":"Boolean indicating whether the patient's serum immunoglobulin G anti-measles antibody level measurement was determined by enzyme immunoassay (Diamedix, Florida)."} ;; "as determined by enzyme immunoassay (Diamedix, Florida)"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable is measured
(assert
  (! (=> patient_measles_igg_level_value_recorded_now_withunit_enzyme_units_per_milliliter@@determined_by_enzyme_immunoassay_diamedix_florida
         true)
     :named REQ7_AUXILIARY0)) ;; "as determined by enzyme immunoassay (Diamedix, Florida)"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: To be included, the patient must have anti-measles immunity as demonstrated by serum immunoglobulin G anti-measles antibody level ≥ 20.0 enzyme units per milliliter as determined by enzyme immunoassay (Diamedix, Florida).
(assert
  (! (and
        (>= patient_measles_igg_level_value_recorded_now_withunit_enzyme_units_per_milliliter 20.0)
        patient_measles_igg_level_value_recorded_now_withunit_enzyme_units_per_milliliter@@determined_by_enzyme_immunoassay_diamedix_florida)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "serum immunoglobulin G anti-measles antibody level ≥ 20.0 enzyme units per milliliter as determined by enzyme immunoassay (Diamedix, Florida)"

;; ===================== Declarations for the inclusion criterion (REQ 8) =====================
(declare-const patient_is_in_oncolytic_measles_virus_encoding_thyroidal_sodium_iodide_symporter_cohort Bool) ;; {"when_to_set_to_true":"Set to true if the patient is in the oncolytic measles virus encoding thyroidal sodium iodide symporter cohort.","when_to_set_to_false":"Set to false if the patient is not in this cohort.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is in this cohort.","meaning":"Boolean indicating whether the patient is in the oncolytic measles virus encoding thyroidal sodium iodide symporter cohort."} ;; "Not applicable for the oncolytic measles virus encoding thyroidal sodium iodide symporter cohort."
(declare-const serum_carcinoembryonic_antigen_value_recorded_at_study_entry_withunit_mg_per_ml Real) ;; {"when_to_set_to_value":"Set to the measured value of serum carcinoembryonic antigen (mg/mL) at the time of study entry.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined at the time of study entry.","meaning":"Numeric value of serum carcinoembryonic antigen (mg/mL) at study entry."} ;; "serum carcinoembryonic antigen level (< 5 milligrams per milliliter) at the time of study entry"
(declare-const serum_carcinoembryonic_antigen_value_recorded_in_the_history_withunit_mg_per_ml Real) ;; {"when_to_set_to_value":"Set to the measured value of serum carcinoembryonic antigen (mg/mL) from any prior testing before study entry.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined from prior testing.","meaning":"Numeric value of serum carcinoembryonic antigen (mg/mL) from any prior testing before study entry."} ;; "serum carcinoembryonic antigen level (< 5 milligrams per milliliter) in any prior testing"

;; ===================== Constraint Assertions (REQ 8) =====================
;; The patient must have normal serum carcinoembryonic antigen level (< 5 mg/mL) both at study entry AND in any prior testing, unless in the oncolytic measles virus encoding thyroidal sodium iodide symporter cohort.
(assert
  (! (or patient_is_in_oncolytic_measles_virus_encoding_thyroidal_sodium_iodide_symporter_cohort
         (and (< serum_carcinoembryonic_antigen_value_recorded_at_study_entry_withunit_mg_per_ml 5.0)
              (< serum_carcinoembryonic_antigen_value_recorded_in_the_history_withunit_mg_per_ml 5.0)))
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have normal serum carcinoembryonic antigen level (< 5 milligrams per milliliter) both at the time of study entry AND in any prior testing. (NOTE: Not applicable for the oncolytic measles virus encoding thyroidal sodium iodide symporter cohort.)"

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_is_willing_to_provide_all_biologic_specimens_required_by_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to provide all biologic specimens required by the protocol.","when_to_set_to_false":"Set to false if the patient is not willing to provide all biologic specimens required by the protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to provide all biologic specimens required by the protocol.","meaning":"Boolean indicating whether the patient is willing to provide all biologic specimens as required by the study protocol."} ;; "the patient must be willing to provide all biologic specimens as required by the protocol."
(declare-const patient_is_willing_to_provide_all_biologic_specimens_required_by_protocol@@required_by_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the biologic specimens to be provided are those required by the protocol.","when_to_set_to_false":"Set to false if the biologic specimens to be provided are not those required by the protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the biologic specimens to be provided are those required by the protocol.","meaning":"Boolean indicating whether the biologic specimens to be provided are those specifically required by the study protocol."} ;; "as required by the protocol"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_is_willing_to_provide_all_biologic_specimens_required_by_protocol@@required_by_protocol
         patient_is_willing_to_provide_all_biologic_specimens_required_by_protocol)
     :named REQ9_AUXILIARY0)) ;; "as required by the protocol" implies willingness to provide all required specimens

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! patient_is_willing_to_provide_all_biologic_specimens_required_by_protocol
     :named REQ9_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be willing to provide all biologic specimens as required by the protocol."

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_has_finding_of_increased_cancer_antigen_125_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of increased cancer antigen 125 (CA-125) level.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of increased cancer antigen 125 (CA-125) level.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of increased cancer antigen 125 (CA-125) level.","meaning":"Boolean indicating whether the patient currently has an elevated cancer antigen 125 (CA-125) level."} ;; "have cancer antigen 125 elevation"
(declare-const patient_has_measurable_disease_by_computed_tomography_scan_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has measurable disease confirmed by computed tomography scan.","when_to_set_to_false":"Set to false if the patient currently does not have measurable disease confirmed by computed tomography scan.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has measurable disease confirmed by computed tomography scan.","meaning":"Boolean indicating whether the patient currently has measurable disease confirmed by computed tomography scan."} ;; "have measurable disease by computed tomography scan"
(declare-const patient_has_measurable_disease_by_physical_examination_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has measurable disease confirmed by physical examination.","when_to_set_to_false":"Set to false if the patient currently does not have measurable disease confirmed by physical examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has measurable disease confirmed by physical examination.","meaning":"Boolean indicating whether the patient currently has measurable disease confirmed by physical examination."} ;; "have measurable disease by physical examination"
(declare-const patient_has_measurable_disease_on_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has measurable disease detected on imaging.","when_to_set_to_false":"Set to false if the patient currently does not have measurable disease detected on imaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has measurable disease detected on imaging.","meaning":"Boolean indicating whether the patient currently has measurable disease detected on imaging."} ;; "have measurable disease on imaging"
(declare-const patient_has_microscopic_residual_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has microscopic residual disease.","when_to_set_to_false":"Set to false if the patient currently does not have microscopic residual disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has microscopic residual disease.","meaning":"Boolean indicating whether the patient currently has microscopic residual disease."} ;; "have microscopic residual disease"
(declare-const patient_has_radiographic_progression_after_six_treatment_cycles Bool) ;; {"when_to_set_to_true":"Set to true if the patient has radiographic progression after six treatment cycles.","when_to_set_to_false":"Set to false if the patient does not have radiographic progression after six treatment cycles.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has radiographic progression after six treatment cycles.","meaning":"Boolean indicating whether the patient has radiographic progression after six treatment cycles."} ;; "radiographic progression after six treatment cycles"
(declare-const patient_is_willing_to_undergo_laparoscopy_for_evaluation_of_treatment_effect_after_six_treatment_cycles_if_no_radiographic_progression Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to undergo laparoscopy for evaluation of treatment effect after six treatment cycles and the patient does not have radiographic progression.","when_to_set_to_false":"Set to false if the patient is not willing to undergo laparoscopy for evaluation of treatment effect after six treatment cycles and/or the patient has radiographic progression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to undergo laparoscopy for evaluation of treatment effect after six treatment cycles if the patient does not have radiographic progression.","meaning":"Boolean indicating whether the patient is willing to undergo laparoscopy for evaluation of treatment effect after six treatment cycles if the patient does not have radiographic progression."} ;; "be willing to undergo laparoscopy for evaluation of treatment effect if the patient does not have radiographic progression after six treatment cycles"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Definition: "be willing to undergo laparoscopy for evaluation of treatment effect if the patient does not have radiographic progression after six treatment cycles"
(assert
  (! (= patient_is_willing_to_undergo_laparoscopy_for_evaluation_of_treatment_effect_after_six_treatment_cycles_if_no_radiographic_progression
        (and (not patient_has_radiographic_progression_after_six_treatment_cycles)
             patient_is_willing_to_undergo_laparoscopy_for_evaluation_of_treatment_effect_after_six_treatment_cycles_if_no_radiographic_progression))
     :named REQ10_AUXILIARY0)) ;; "be willing to undergo laparoscopy for evaluation of treatment effect if the patient does not have radiographic progression after six treatment cycles"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Component 0: "To be included, the patient must ((have measurable disease by physical examination) OR (have measurable disease by computed tomography scan) OR ((have cancer antigen 125 elevation OR have microscopic residual disease) AND NOT have measurable disease on imaging AND (be willing to undergo laparoscopy for evaluation of treatment effect if the patient does not have radiographic progression after six treatment cycles)))."
(assert
  (! (or patient_has_measurable_disease_by_physical_examination_now
         patient_has_measurable_disease_by_computed_tomography_scan_now
         (and (or patient_has_finding_of_increased_cancer_antigen_125_now
                  patient_has_microscopic_residual_disease_now)
              (not patient_has_measurable_disease_on_imaging_now)
              patient_is_willing_to_undergo_laparoscopy_for_evaluation_of_treatment_effect_after_six_treatment_cycles_if_no_radiographic_progression))
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((have measurable disease by physical examination) OR (have measurable disease by computed tomography scan) OR ((have cancer antigen 125 elevation OR have microscopic residual disease) AND NOT have measurable disease on imaging AND (be willing to undergo laparoscopy for evaluation of treatment effect if the patient does not have radiographic progression after six treatment cycles)))."

;; ===================== Declarations for the criterion (REQ 11) =====================
(declare-const patient_lymphocyte_component_of_blood_value_recorded_now_withunit_cells_per_microliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current CD4-positive T-lymphocyte count per microliter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current count of CD4-positive T-lymphocytes per microliter of blood."} ;; "have a CD4-positive T-lymphocyte count ≥ 200 cells per microliter"
(declare-const patient_lymphocyte_component_of_blood_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current percentage of CD4-positive T-lymphocytes among peripheral blood lymphocytes is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the percentage of CD4-positive T-lymphocytes among peripheral blood lymphocytes measured now."} ;; "have CD4-positive T-lymphocytes comprising ≥ 15 percent of peripheral blood lymphocytes"

;; ===================== Constraint Assertions (REQ 11) =====================
;; The patient must ((have a CD4-positive T-lymphocyte count ≥ 200 cells per microliter) OR (have CD4-positive T-lymphocytes comprising ≥ 15 percent of peripheral blood lymphocytes)).
(assert
  (! (or (>= patient_lymphocyte_component_of_blood_value_recorded_now_withunit_cells_per_microliter 200.0)
         (>= patient_lymphocyte_component_of_blood_value_recorded_now_withunit_percent 15.0))
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS))
