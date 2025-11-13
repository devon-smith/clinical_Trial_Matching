;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const cervical_esophagus_length_value_recorded_now_in_centimeters Real) ;; {"when_to_set_to_value":"Set to the numeric value in centimeters if the patient's cervical esophagus length is currently measured and recorded.","when_to_set_to_null":"Set to null if the cervical esophagus length is not measured, not documented, or cannot be determined currently.","meaning":"Numeric value indicating the length of the patient's cervical esophagus, measured in centimeters, as recorded currently."} ;; "where the cervical esophagus length is less than 20 centimeters"

(declare-const patient_has_finding_of_carcinoma_of_cervical_part_of_esophagus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of cancer of the cervical esophagus.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of cancer of the cervical esophagus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cancer of the cervical esophagus.","meaning":"Boolean indicating whether the patient currently has cancer of the cervical esophagus."} ;; "cancer of the cervical esophagus"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (and patient_has_finding_of_carcinoma_of_cervical_part_of_esophagus_now
             (< cervical_esophagus_length_value_recorded_now_in_centimeters 20)))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cancer of the cervical esophagus (where the cervical esophagus length is less than 20 centimeters)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_secondary_malignant_neoplasm_of_cardia_of_stomach_value_recorded_now_withunit_centimeter Real) ;; {"when_to_set_to_value":"Set to the measured value (in centimeters) if the extent of tumor spread into the cardia of the stomach is recorded for the patient at the current time.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value (centimeters) representing the greatest extent of tumor spread into the cardia of the stomach in the patient at the current time."} ;; "tumour with spread into the cardia of the stomach greater than 3 centimeters"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (> patient_secondary_malignant_neoplasm_of_cardia_of_stomach_value_recorded_now_withunit_centimeter 3))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a tumour with spread into the cardia of the stomach greater than 3 centimeters."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_secondary_malignant_neoplasm_of_supraclavicular_lymph_nodes_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of secondary malignant neoplasm of supraclavicular lymph nodes.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of secondary malignant neoplasm of supraclavicular lymph nodes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of secondary malignant neoplasm of supraclavicular lymph nodes.","meaning":"Boolean indicating whether the patient currently has a diagnosis of secondary malignant neoplasm of supraclavicular lymph nodes."} ;; "metastatic supraclavicular nodes"

(declare-const patient_has_diagnosis_of_secondary_malignant_neoplasm_of_supraclavicular_lymph_nodes_now@@proven_by_biopsy_by_endoscopic_ultrasound Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of secondary malignant neoplasm of supraclavicular lymph nodes is proven by biopsy via endoscopic ultrasound.","when_to_set_to_false":"Set to false if the diagnosis is not proven by biopsy via endoscopic ultrasound.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is proven by biopsy via endoscopic ultrasound.","meaning":"Boolean indicating whether the diagnosis is proven by biopsy via endoscopic ultrasound."} ;; "biopsy by endoscopic ultrasound proven metastatic supraclavicular nodes"

(declare-const patient_has_diagnosis_of_secondary_malignant_neoplasm_of_supraclavicular_lymph_nodes_now@@proven_by_biopsy_by_laparoscopy Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of secondary malignant neoplasm of supraclavicular lymph nodes is proven by biopsy via laparoscopy.","when_to_set_to_false":"Set to false if the diagnosis is not proven by biopsy via laparoscopy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is proven by biopsy via laparoscopy.","meaning":"Boolean indicating whether the diagnosis is proven by biopsy via laparoscopy."} ;; "biopsy by laparoscopy proven metastatic supraclavicular nodes"

(declare-const patient_has_diagnosis_of_secondary_malignant_neoplasm_of_supraclavicular_lymph_nodes_now@@proven_by_biopsy_by_laparotomy Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of secondary malignant neoplasm of supraclavicular lymph nodes is proven by biopsy via laparotomy.","when_to_set_to_false":"Set to false if the diagnosis is not proven by biopsy via laparotomy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is proven by biopsy via laparotomy.","meaning":"Boolean indicating whether the diagnosis is proven by biopsy via laparotomy."} ;; "biopsy by laparotomy proven metastatic supraclavicular nodes"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_secondary_malignant_neoplasm_of_supraclavicular_lymph_nodes_now@@proven_by_biopsy_by_endoscopic_ultrasound
      patient_has_diagnosis_of_secondary_malignant_neoplasm_of_supraclavicular_lymph_nodes_now)
:named REQ2_AUXILIARY0)) ;; "biopsy by endoscopic ultrasound proven metastatic supraclavicular nodes"

(assert
(! (=> patient_has_diagnosis_of_secondary_malignant_neoplasm_of_supraclavicular_lymph_nodes_now@@proven_by_biopsy_by_laparoscopy
      patient_has_diagnosis_of_secondary_malignant_neoplasm_of_supraclavicular_lymph_nodes_now)
:named REQ2_AUXILIARY1)) ;; "biopsy by laparoscopy proven metastatic supraclavicular nodes"

(assert
(! (=> patient_has_diagnosis_of_secondary_malignant_neoplasm_of_supraclavicular_lymph_nodes_now@@proven_by_biopsy_by_laparotomy
      patient_has_diagnosis_of_secondary_malignant_neoplasm_of_supraclavicular_lymph_nodes_now)
:named REQ2_AUXILIARY2)) ;; "biopsy by laparotomy proven metastatic supraclavicular nodes"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (or patient_has_diagnosis_of_secondary_malignant_neoplasm_of_supraclavicular_lymph_nodes_now@@proven_by_biopsy_by_endoscopic_ultrasound
            patient_has_diagnosis_of_secondary_malignant_neoplasm_of_supraclavicular_lymph_nodes_now@@proven_by_biopsy_by_laparoscopy
            patient_has_diagnosis_of_secondary_malignant_neoplasm_of_supraclavicular_lymph_nodes_now@@proven_by_biopsy_by_laparotomy))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has biopsy by endoscopic ultrasound proven metastatic supraclavicular nodes) OR (the patient has biopsy by laparoscopy proven metastatic supraclavicular nodes) OR (the patient has biopsy by laparotomy proven metastatic supraclavicular nodes)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_metastatic_celiac_nodes_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has metastatic celiac lymph nodes.","when_to_set_to_false":"Set to false if the patient currently does not have metastatic celiac lymph nodes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has metastatic celiac lymph nodes.","meaning":"Boolean indicating whether the patient currently has metastatic celiac lymph nodes."} ;; "metastatic celiac nodes"
(declare-const patient_has_finding_of_metastatic_celiac_nodes_now@@biopsy_proven Bool) ;; {"when_to_set_to_true":"Set to true if the patient's metastatic celiac lymph nodes are proven by biopsy.","when_to_set_to_false":"Set to false if the patient's metastatic celiac lymph nodes are not proven by biopsy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's metastatic celiac lymph nodes are proven by biopsy.","meaning":"Boolean indicating whether the patient's metastatic celiac lymph nodes are proven by biopsy."} ;; "biopsy proven metastatic celiac nodes"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_metastatic_celiac_nodes_now@@biopsy_proven
      patient_has_finding_of_metastatic_celiac_nodes_now)
:named REQ3_AUXILIARY0)) ;; "biopsy proven metastatic celiac nodes" means metastatic celiac nodes present

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_metastatic_celiac_nodes_now@@biopsy_proven)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has biopsy proven metastatic celiac nodes."
