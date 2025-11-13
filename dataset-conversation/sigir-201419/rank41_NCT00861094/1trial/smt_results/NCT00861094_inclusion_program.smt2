;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_adenocarcinoma_of_esophagus_now Bool) ;; "adenocarcinoma of the esophagus" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of adenocarcinoma of the esophagus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of adenocarcinoma of the esophagus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of adenocarcinoma of the esophagus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of adenocarcinoma of the esophagus."}
(declare-const patient_has_diagnosis_of_adenocarcinoma_of_esophagus_now@@histologically_proven Bool) ;; "histologically proven adenocarcinoma of the esophagus" {"when_to_set_to_true":"Set to true if the patient's diagnosis of adenocarcinoma of the esophagus is histologically proven.","when_to_set_to_false":"Set to false if the patient's diagnosis of adenocarcinoma of the esophagus is not histologically proven.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is histologically proven.","meaning":"Boolean indicating whether the patient's diagnosis of adenocarcinoma of the esophagus is histologically proven."}
(declare-const patient_has_diagnosis_of_adenosquamous_cell_carcinoma_now Bool) ;; "adenosquamous carcinoma" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of adenosquamous carcinoma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of adenosquamous carcinoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of adenosquamous carcinoma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of adenosquamous carcinoma."}
(declare-const patient_has_diagnosis_of_adenosquamous_cell_carcinoma_now@@histologically_proven Bool) ;; "histologically proven adenosquamous carcinoma" {"when_to_set_to_true":"Set to true if the patient's diagnosis of adenosquamous carcinoma is histologically proven.","when_to_set_to_false":"Set to false if the patient's diagnosis of adenosquamous carcinoma is not histologically proven.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is histologically proven.","meaning":"Boolean indicating whether the patient's diagnosis of adenosquamous carcinoma is histologically proven."}
(declare-const patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now Bool) ;; "squamous cell carcinoma of the esophagus" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of squamous cell carcinoma of the esophagus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of squamous cell carcinoma of the esophagus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of squamous cell carcinoma of the esophagus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of squamous cell carcinoma of the esophagus."}
(declare-const patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now@@histologically_proven Bool) ;; "histologically proven squamous cell carcinoma of the esophagus" {"when_to_set_to_true":"Set to true if the patient's diagnosis of squamous cell carcinoma of the esophagus is histologically proven.","when_to_set_to_false":"Set to false if the patient's diagnosis of squamous cell carcinoma of the esophagus is not histologically proven.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is histologically proven.","meaning":"Boolean indicating whether the patient's diagnosis of squamous cell carcinoma of the esophagus is histologically proven."}

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_adenocarcinoma_of_esophagus_now@@histologically_proven
         patient_has_diagnosis_of_adenocarcinoma_of_esophagus_now)
     :named REQ0_AUXILIARY0)) ;; "histologically proven adenocarcinoma of the esophagus" implies "adenocarcinoma of the esophagus"

(assert
  (! (=> patient_has_diagnosis_of_adenosquamous_cell_carcinoma_now@@histologically_proven
         patient_has_diagnosis_of_adenosquamous_cell_carcinoma_now)
     :named REQ0_AUXILIARY1)) ;; "histologically proven adenosquamous carcinoma" implies "adenosquamous carcinoma"

(assert
  (! (=> patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now@@histologically_proven
         patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now)
     :named REQ0_AUXILIARY2)) ;; "histologically proven squamous cell carcinoma of the esophagus" implies "squamous cell carcinoma of the esophagus"

;; ===================== Constraint Assertions (REQ 0) =====================
;; At least one of the three histologically proven diagnoses must be present
(assert
  (! (or patient_has_diagnosis_of_adenocarcinoma_of_esophagus_now@@histologically_proven
         patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now@@histologically_proven
         patient_has_diagnosis_of_adenosquamous_cell_carcinoma_now@@histologically_proven)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (histologically proven adenocarcinoma of the esophagus OR histologically proven squamous cell carcinoma of the esophagus OR histologically proven adenosquamous carcinoma of the esophagus)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_t_category_value_recorded_now_withunit_none Real) ;; "T stage" {"when_to_set_to_value":"Set to the patient's current T category value if available.","when_to_set_to_null":"Set to null if the patient's current T category is unknown, not documented, or indeterminate.","meaning":"Numeric or categorical value representing the patient's current T category (tumor stage) for esophageal cancer."}
(declare-const patient_n_category_value_recorded_now_withunit_none Real) ;; "N stage" {"when_to_set_to_value":"Set to the patient's current N category value if available.","when_to_set_to_null":"Set to null if the patient's current N category is unknown, not documented, or indeterminate.","meaning":"Numeric or categorical value representing the patient's current N category (nodal stage) for esophageal cancer."}
(declare-const patient_m_category_value_recorded_now_withunit_none Real) ;; "M stage" {"when_to_set_to_value":"Set to the patient's current M category value if available.","when_to_set_to_null":"Set to null if the patient's current M category is unknown, not documented, or indeterminate.","meaning":"Numeric or categorical value representing the patient's current M category (metastasis stage) for esophageal cancer."}

(declare-const patient_has_locally_advanced_esophageal_cancer_now Bool) ;; "locally advanced esophageal cancer" {"when_to_set_to_true":"Set to true if the patient currently has locally advanced esophageal cancer as defined by any T stage AND N stage equal to N0 or N1 AND M stage equal to M0 or M1a.","when_to_set_to_false":"Set to false if the patient does not meet these criteria for locally advanced esophageal cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient meets these criteria.","meaning":"Boolean indicating whether the patient currently has locally advanced esophageal cancer as defined by the protocol."}

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition of locally advanced esophageal cancer per requirement: any T AND (N0 or N1) AND (M0 or M1a)
(assert
  (! (= patient_has_locally_advanced_esophageal_cancer_now
        (and
          ;; any T stage (no restriction, so always true if T is known)
          (not (= patient_t_category_value_recorded_now_withunit_none 0)) ;; "any T stage" (assuming T=0 means unknown/not present)
          ;; N stage must be N0 or N1
          (or (= patient_n_category_value_recorded_now_withunit_none 0)
              (= patient_n_category_value_recorded_now_withunit_none 1))
          ;; M stage must be M0 or M1a
          (or (= patient_m_category_value_recorded_now_withunit_none 0)
              (= patient_m_category_value_recorded_now_withunit_none 1)) ;; "M0 or M1a" (assuming 0=M0, 1=M1a)
        ))
     :named REQ1_AUXILIARY0)) ;; "locally advanced esophageal cancer (defined as any T stage AND N stage equal to N0 OR N1 AND M stage equal to M0 OR M1a)"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_locally_advanced_esophageal_cancer_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have locally advanced esophageal cancer (defined as any T stage AND N stage equal to N0 OR N1 AND M stage equal to M0 OR M1a)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_neoplasm_of_cervical_esophagus_now Bool) ;; "cervical esophageal tumor" {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of cervical esophageal tumor.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of cervical esophageal tumor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of cervical esophageal tumor.","meaning":"Boolean indicating whether the patient currently has a cervical esophageal tumor."}
(declare-const patient_has_finding_of_neoplasm_of_cervical_esophagus_now@@has_regional_lymph_node_involvement Bool) ;; "cervical esophageal tumor with regional lymph node involvement" {"when_to_set_to_true":"Set to true if the patient's cervical esophageal tumor has regional lymph node involvement.","when_to_set_to_false":"Set to false if the patient's cervical esophageal tumor does not have regional lymph node involvement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cervical esophageal tumor has regional lymph node involvement.","meaning":"Boolean indicating whether the patient's cervical esophageal tumor has regional lymph node involvement."}
(declare-const patient_has_finding_of_tumor_involvement_of_lower_third_of_esophagus_now Bool) ;; "tumor involvement of the lower third of the esophagus" {"when_to_set_to_true":"Set to true if the patient currently has tumor involvement of the lower third of the esophagus.","when_to_set_to_false":"Set to false if the patient currently does not have tumor involvement of the lower third of the esophagus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tumor involvement of the lower third of the esophagus.","meaning":"Boolean indicating whether the patient currently has tumor involvement of the lower third of the esophagus."}
(declare-const patient_has_finding_of_tumor_involvement_of_lower_third_of_esophagus_now@@with_celiac_lymph_node_involvement Bool) ;; "tumor involvement of the lower third of the esophagus with celiac lymph node involvement" {"when_to_set_to_true":"Set to true if the patient's tumor involvement of the lower third of the esophagus has celiac lymph node involvement.","when_to_set_to_false":"Set to false if the patient's tumor involvement of the lower third of the esophagus does not have celiac lymph node involvement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's tumor involvement of the lower third of the esophagus has celiac lymph node involvement.","meaning":"Boolean indicating whether the patient's tumor involvement of the lower third of the esophagus has celiac lymph node involvement."}
(declare-const patient_has_finding_of_tumor_involvement_of_upper_third_of_esophagus_now Bool) ;; "tumor involvement of the upper third of the esophagus" {"when_to_set_to_true":"Set to true if the patient currently has tumor involvement of the upper third of the esophagus.","when_to_set_to_false":"Set to false if the patient currently does not have tumor involvement of the upper third of the esophagus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tumor involvement of the upper third of the esophagus.","meaning":"Boolean indicating whether the patient currently has tumor involvement of the upper third of the esophagus."}

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_neoplasm_of_cervical_esophagus_now@@has_regional_lymph_node_involvement
         patient_has_finding_of_neoplasm_of_cervical_esophagus_now)
     :named REQ2_AUXILIARY0)) ;; "cervical esophageal tumor with regional lymph node involvement" implies "cervical esophageal tumor"

(assert
  (! (=> patient_has_finding_of_tumor_involvement_of_lower_third_of_esophagus_now@@with_celiac_lymph_node_involvement
         patient_has_finding_of_tumor_involvement_of_lower_third_of_esophagus_now)
     :named REQ2_AUXILIARY1)) ;; "tumor involvement of the lower third of the esophagus with celiac lymph node involvement" implies "tumor involvement of the lower third of the esophagus"

;; ===================== Constraint Assertions (REQ 2) =====================
;; To be included, the patient must NOT have metastatic disease (defined as any M stage other than M0 or M1a),
;; EXCEPT if the patient has (tumor involvement of the upper third of the esophagus)
;; OR (cervical esophageal tumor with regional lymph node involvement)
;; OR (tumor involvement of the lower third of the esophagus with celiac lymph node involvement (M1a)).

;; We encode: Eligible if (no metastatic disease) OR (exception applies)
(assert
  (! (or
        ;; No metastatic disease: M stage is M0 or M1a
        (or (= patient_m_category_value_recorded_now_withunit_none 0.0) ;; M0
            (= patient_m_category_value_recorded_now_withunit_none 1.0)) ;; M1a
        ;; Exception: any of the three exception conditions
        patient_has_finding_of_tumor_involvement_of_upper_third_of_esophagus_now
        patient_has_finding_of_neoplasm_of_cervical_esophagus_now@@has_regional_lymph_node_involvement
        patient_has_finding_of_tumor_involvement_of_lower_third_of_esophagus_now@@with_celiac_lymph_node_involvement
     )
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have metastatic disease (defined as any M stage other than M0 or M1a), EXCEPT if the patient has (tumor involvement of the upper third of the esophagus) OR (cervical esophageal tumor with regional lymph node involvement) OR (tumor involvement of the lower third of the esophagus with celiac lymph node involvement (M1a))."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_cervical_lymph_node_involvement_n1_now Bool) ;; "cervical lymph node involvement (defined as N1)" {"when_to_set_to_true":"Set to true if the patient currently has cervical lymph node involvement defined as N1 (N1 category involvement).","when_to_set_to_false":"Set to false if the patient currently does not have cervical lymph node involvement defined as N1 (N1 category involvement).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cervical lymph node involvement defined as N1.","meaning":"Boolean indicating whether the patient currently has cervical lymph node involvement defined as N1 (N1 category involvement) at the present time."}
(declare-const patient_has_finding_of_neoplasm_of_cervical_esophagus_now@@has_supraclavicular_lymph_node_involvement Bool) ;; "cervical primary tumor with supraclavicular lymph node involvement" {"when_to_set_to_true":"Set to true if the patient's cervical primary tumor has supraclavicular lymph node involvement.","when_to_set_to_false":"Set to false if the patient's cervical primary tumor does not have supraclavicular lymph node involvement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cervical primary tumor has supraclavicular lymph node involvement.","meaning":"Boolean indicating whether the patient's cervical primary tumor has supraclavicular lymph node involvement."}
(declare-const patient_has_finding_of_secondary_malignant_neoplasm_of_lymph_nodes_of_neck_now Bool) ;; "cervical lymph node involvement" {"when_to_set_to_true":"Set to true if the patient currently has secondary malignant neoplasm involving the lymph nodes of the neck (cervical lymph node involvement).","when_to_set_to_false":"Set to false if the patient currently does not have secondary malignant neoplasm involving the lymph nodes of the neck.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has secondary malignant neoplasm involving the lymph nodes of the neck.","meaning":"Boolean indicating whether the patient currently has secondary malignant neoplasm involving the lymph nodes of the neck (cervical lymph node involvement)."}

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Cervical lymph node involvement defined as N1
(assert
  (! (= patient_has_finding_of_cervical_lymph_node_involvement_n1_now
        (and patient_has_finding_of_secondary_malignant_neoplasm_of_lymph_nodes_of_neck_now
             (= patient_n_category_value_recorded_now_withunit_none 1.0)))
     :named REQ3_AUXILIARY0)) ;; "cervical lymph node involvement (defined as N1)"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_neoplasm_of_cervical_esophagus_now@@has_supraclavicular_lymph_node_involvement
         patient_has_finding_of_neoplasm_of_cervical_esophagus_now)
     :named REQ3_AUXILIARY1)) ;; "cervical primary tumor with supraclavicular lymph node involvement"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: To be included, the patient may have (cervical primary tumor with supraclavicular lymph node involvement) OR (cervical lymph node involvement (defined as N1)).
(assert
  (! (or patient_has_finding_of_neoplasm_of_cervical_esophagus_now@@has_supraclavicular_lymph_node_involvement
         patient_has_finding_of_cervical_lymph_node_involvement_n1_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient may have (cervical primary tumor with supraclavicular lymph node involvement) OR (cervical lymph node involvement (defined as N1))."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const celiac_lymph_node_size_value_recorded_now_withunit_centimeters Real) ;; "celiac lymph node size ≥ 1.5 centimeters by computed tomography scan OR by echography" {"when_to_set_to_value":"Set to the numeric value (in centimeters) of the patient's celiac lymph node size as measured currently by computed tomography scan or echography.","when_to_set_to_null":"Set to null if the celiac lymph node size is unknown, not documented, or cannot be determined currently by computed tomography scan or echography.","meaning":"Numeric value indicating the size of the patient's celiac lymph node(s) in centimeters as measured currently."}
(declare-const celiac_lymph_node_size_value_recorded_now_withunit_centimeters@@measured_by_computed_tomography_or_echography Bool) ;; "celiac lymph node size measured by computed tomography scan OR by echography" {"when_to_set_to_true":"Set to true if the celiac lymph node size measurement is performed by computed tomography scan or by echography.","when_to_set_to_false":"Set to false if the celiac lymph node size measurement is not performed by computed tomography scan or by echography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the celiac lymph node size measurement is performed by computed tomography scan or by echography.","meaning":"Boolean indicating whether the celiac lymph node size measurement is performed by computed tomography scan or by echography."}
(declare-const patient_has_finding_of_celiac_lymphadenopathy_now Bool) ;; "radiographic evidence of enlarged celiac lymph nodes" {"when_to_set_to_true":"Set to true if the patient currently has radiographic evidence of enlarged celiac lymph nodes (celiac lymphadenopathy).","when_to_set_to_false":"Set to false if the patient currently does not have radiographic evidence of enlarged celiac lymph nodes (celiac lymphadenopathy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has radiographic evidence of enlarged celiac lymph nodes (celiac lymphadenopathy).","meaning":"Boolean indicating whether the patient currently has radiographic evidence of celiac lymphadenopathy (enlarged celiac lymph nodes)."}
(declare-const patient_has_finding_of_celiac_lymphadenopathy_now@@detected_by_computed_tomography_or_echography Bool) ;; "radiographic evidence of enlarged celiac lymph nodes detected by computed tomography scan OR by echography" {"when_to_set_to_true":"Set to true if the patient's celiac lymphadenopathy is detected by computed tomography scan or by echography.","when_to_set_to_false":"Set to false if the patient's celiac lymphadenopathy is not detected by computed tomography scan or by echography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's celiac lymphadenopathy is detected by computed tomography scan or by echography.","meaning":"Boolean indicating whether the patient's celiac lymphadenopathy is detected by computed tomography scan or by echography."}

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition: radiographic evidence of enlarged celiac lymph nodes (≥ 1.5 cm by CT or echography)
(assert
  (! (= patient_has_finding_of_celiac_lymphadenopathy_now@@detected_by_computed_tomography_or_echography
        (and celiac_lymph_node_size_value_recorded_now_withunit_centimeters@@measured_by_computed_tomography_or_echography
             (>= celiac_lymph_node_size_value_recorded_now_withunit_centimeters 1.5)))
     :named REQ4_AUXILIARY0)) ;; "radiographic evidence of enlarged celiac lymph nodes (defined as celiac lymph node size ≥ 1.5 centimeters by computed tomography scan OR by echography)"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_celiac_lymphadenopathy_now@@detected_by_computed_tomography_or_echography
         patient_has_finding_of_celiac_lymphadenopathy_now)
     :named REQ4_AUXILIARY1)) ;; "radiographic evidence of enlarged celiac lymph nodes detected by computed tomography scan OR by echography" implies "radiographic evidence of enlarged celiac lymph nodes"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: To be included, the patient must NOT have radiographic evidence of enlarged celiac lymph nodes (≥ 1.5 cm by CT or echography)
(assert
  (! (not patient_has_finding_of_celiac_lymphadenopathy_now@@detected_by_computed_tomography_or_echography)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have (radiographic evidence of enlarged celiac lymph nodes (defined as celiac lymph node size ≥ 1.5 centimeters by computed tomography scan OR by echography))."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_small_cell_carcinoma_now Bool) ;; "small cell carcinoma" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of small cell carcinoma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of small cell carcinoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of small cell carcinoma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of small cell carcinoma."}
(declare-const patient_has_diagnosis_of_small_cell_carcinoma_now@@located_in_esophagus Bool) ;; "small cell carcinoma of the esophagus" {"when_to_set_to_true":"Set to true if the diagnosis of small cell carcinoma is located in the esophagus.","when_to_set_to_false":"Set to false if the diagnosis of small cell carcinoma is not located in the esophagus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of small cell carcinoma is located in the esophagus.","meaning":"Boolean indicating whether the diagnosis of small cell carcinoma is located in the esophagus."}
(declare-const patient_has_diagnosis_of_undifferentiated_carcinoma_now@@located_in_esophagus Bool) ;; "undifferentiated carcinoma of the esophagus" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of undifferentiated carcinoma and the carcinoma is located in the esophagus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of undifferentiated carcinoma located in the esophagus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of undifferentiated carcinoma located in the esophagus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of undifferentiated carcinoma located in the esophagus."}

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_small_cell_carcinoma_now@@located_in_esophagus
         patient_has_diagnosis_of_small_cell_carcinoma_now)
     :named REQ5_AUXILIARY0)) ;; "small cell carcinoma of the esophagus" qualifier implies stem

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: To be included, the patient must NOT have (small cell carcinoma of the esophagus) AND NOT have (undifferentiated carcinoma of the esophagus).
(assert
  (! (and (not patient_has_diagnosis_of_small_cell_carcinoma_now@@located_in_esophagus)
          (not patient_has_diagnosis_of_undifferentiated_carcinoma_now@@located_in_esophagus))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have (small cell carcinoma of the esophagus) AND NOT have (undifferentiated carcinoma of the esophagus)."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const number_of_esophageal_tumors_value_recorded_now_withunit_count Int) ;; "number of esophageal tumors currently present in the patient" {"when_to_set_to_value":"Set to the number of esophageal tumors currently present in the patient, as determined by clinical assessment or imaging.","when_to_set_to_null":"Set to null if the number of esophageal tumors currently present in the patient is unknown, not documented, or cannot be determined.","meaning":"Numeric variable indicating the number of esophageal tumors currently present in the patient, recorded as a count."}
(declare-const patient_has_diagnosis_of_carcinoma_of_esophagus_now Bool) ;; "carcinomas of the esophagus" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of carcinoma of the esophagus (esophageal cancer), regardless of the number of tumors present.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of carcinoma of the esophagus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of carcinoma of the esophagus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of carcinoma of the esophagus (esophageal cancer), regardless of number of tumors."}

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Definition in the requirement: "multiple carcinomas of the esophagus (defined as more than one esophageal tumor)"
(define-fun patient_has_multiple_carcinomas_of_esophagus_now () Bool
  (and patient_has_diagnosis_of_carcinoma_of_esophagus_now
       (> number_of_esophageal_tumors_value_recorded_now_withunit_count 1)))
;; "multiple carcinomas of the esophagus (defined as more than one esophageal tumor)"

;; ===================== Constraint Assertions (REQ 6) =====================
;; To be included, the patient must NOT have multiple carcinomas of the esophagus (i.e., more than one esophageal tumor)
(assert
  (! (not patient_has_multiple_carcinomas_of_esophagus_now)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_finding_of_neoplasm_of_cardia_of_stomach_now Bool) ;; "cardia tumor" {"when_to_set_to_true":"Set to true if the patient currently has a neoplasm of the cardia of the stomach.","when_to_set_to_false":"Set to false if the patient currently does not have a neoplasm of the cardia of the stomach.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a neoplasm of the cardia of the stomach.","meaning":"Boolean indicating whether the patient currently has a neoplasm of the cardia of the stomach."}
(declare-const patient_has_finding_of_neoplasm_of_cardia_of_stomach_now@@classified_as_siewert_ii Bool) ;; "cardia tumor (Siewert II)" {"when_to_set_to_true":"Set to true if the patient's neoplasm of the cardia of the stomach is classified as Siewert II.","when_to_set_to_false":"Set to false if the patient's neoplasm of the cardia of the stomach is not classified as Siewert II.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the neoplasm of the cardia of the stomach is classified as Siewert II.","meaning":"Boolean indicating whether the patient's neoplasm of the cardia of the stomach is classified as Siewert II."}
(declare-const patient_has_finding_of_neoplasm_of_stomach_now Bool) ;; "gastric tumor" {"when_to_set_to_true":"Set to true if the patient currently has a neoplasm of the stomach.","when_to_set_to_false":"Set to false if the patient currently does not have a neoplasm of the stomach.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a neoplasm of the stomach.","meaning":"Boolean indicating whether the patient currently has a neoplasm of the stomach."}
(declare-const patient_has_finding_of_neoplasm_of_stomach_now@@classified_as_siewert_iii Bool) ;; "gastric tumor extension to the esophagus (Siewert III)" {"when_to_set_to_true":"Set to true if the patient's neoplasm of the stomach is classified as Siewert III.","when_to_set_to_false":"Set to false if the patient's neoplasm of the stomach is not classified as Siewert III.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the neoplasm of the stomach is classified as Siewert III.","meaning":"Boolean indicating whether the patient's neoplasm of the stomach is classified as Siewert III."}
(declare-const patient_has_finding_of_neoplasm_of_stomach_now@@extends_to_esophagus Bool) ;; "gastric tumor extension to the esophagus" {"when_to_set_to_true":"Set to true if the patient's neoplasm of the stomach extends to the esophagus.","when_to_set_to_false":"Set to false if the patient's neoplasm of the stomach does not extend to the esophagus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the neoplasm of the stomach extends to the esophagus.","meaning":"Boolean indicating whether the patient's neoplasm of the stomach extends to the esophagus."}

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable: Siewert II cardia tumor
(assert
  (! (=> patient_has_finding_of_neoplasm_of_cardia_of_stomach_now@@classified_as_siewert_ii
         patient_has_finding_of_neoplasm_of_cardia_of_stomach_now)
     :named REQ7_AUXILIARY0)) ;; "cardia tumor (Siewert II)"

;; Qualifier variable implies corresponding stem variable: Siewert III gastric tumor
(assert
  (! (=> patient_has_finding_of_neoplasm_of_stomach_now@@classified_as_siewert_iii
         patient_has_finding_of_neoplasm_of_stomach_now)
     :named REQ7_AUXILIARY1)) ;; "gastric tumor extension to the esophagus (Siewert III)"

;; Qualifier variable implies corresponding stem variable: gastric tumor extension to esophagus
(assert
  (! (=> patient_has_finding_of_neoplasm_of_stomach_now@@extends_to_esophagus
         patient_has_finding_of_neoplasm_of_stomach_now)
     :named REQ7_AUXILIARY2)) ;; "gastric tumor extension to the esophagus"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: To be included, the patient must NOT have (cardia tumor (Siewert II)) AND NOT have (gastric tumor extension to the esophagus (Siewert III)).
(assert
  (! (and (not patient_has_finding_of_neoplasm_of_cardia_of_stomach_now@@classified_as_siewert_ii)
          (not patient_has_finding_of_neoplasm_of_stomach_now@@classified_as_siewert_iii))
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have (cardia tumor (Siewert II)) AND NOT have (gastric tumor extension to the esophagus (Siewert III))."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_has_finding_of_neoplasm_of_esophagus_now Bool) ;; "esophageal tumor" {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of neoplasm of the esophagus (esophageal tumor).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of neoplasm of the esophagus (esophageal tumor).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of neoplasm of the esophagus (esophageal tumor).","meaning":"Boolean indicating whether the patient currently has a neoplasm of the esophagus (esophageal tumor)."}
(declare-const patient_has_finding_of_neoplasm_of_esophagus_now@@extends_to_cardia Bool) ;; "esophageal tumor extension to the cardia" {"when_to_set_to_true":"Set to true if the patient's esophageal tumor extends to the cardia.","when_to_set_to_false":"Set to false if the patient's esophageal tumor does not extend to the cardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's esophageal tumor extends to the cardia.","meaning":"Boolean indicating whether the patient's esophageal tumor extends to the cardia."}
(declare-const patient_has_finding_of_neoplasm_of_esophagus_now@@classified_as_siewert_i Bool) ;; "esophageal tumor classified as Siewert I" {"when_to_set_to_true":"Set to true if the patient's esophageal tumor is classified as Siewert I.","when_to_set_to_false":"Set to false if the patient's esophageal tumor is not classified as Siewert I.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's esophageal tumor is classified as Siewert I.","meaning":"Boolean indicating whether the patient's esophageal tumor is classified as Siewert I."}
(declare-const patient_neoplastic_disease_value_recorded_now_withunit_centimeter Real) ;; "center of the tumor lying > 1 cm to 5 cm above the gastroesophageal junction" {"when_to_set_to_value":"Set to the measured value in centimeters if the position of the center of the patient's tumor above the gastroesophageal junction is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value (centimeters) representing the position of the center of the patient's tumor above the gastroesophageal junction, recorded now."}

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_neoplasm_of_esophagus_now@@extends_to_cardia
         patient_has_finding_of_neoplasm_of_esophagus_now)
     :named REQ8_AUXILIARY0)) ;; "esophageal tumor extension to the cardia (Siewert I)"

(assert
  (! (=> patient_has_finding_of_neoplasm_of_esophagus_now@@classified_as_siewert_i
         patient_has_finding_of_neoplasm_of_esophagus_now)
     :named REQ8_AUXILIARY1)) ;; "esophageal tumor classified as Siewert I"

;; Siewert I definition: center of tumor > 1 cm and ≤ 5 cm above gastroesophageal junction
(assert
  (! (= patient_has_finding_of_neoplasm_of_esophagus_now@@classified_as_siewert_i
        (and (> patient_neoplastic_disease_value_recorded_now_withunit_centimeter 1.0)
             (<= patient_neoplastic_disease_value_recorded_now_withunit_centimeter 5.0)))
     :named REQ8_AUXILIARY2)) ;; "defined as the center of the tumor lying > 1 centimeter to 5 centimeters above the gastroesophageal junction"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! patient_has_finding_of_neoplasm_of_esophagus_now@@classified_as_siewert_i
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient may have esophageal tumor extension to the cardia (Siewert I) (defined as the center of the tumor lying > 1 centimeter to 5 centimeters above the gastroesophageal junction)."

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_has_finding_of_disease_now Bool) ;; "disease" {"when_to_set_to_true":"Set to true if the patient currently has a disease.","when_to_set_to_false":"Set to false if the patient currently does not have a disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disease.","meaning":"Boolean indicating whether the patient currently has a disease."}
(declare-const patient_has_finding_of_disease_now@@inoperable Bool) ;; "inoperable disease" {"when_to_set_to_true":"Set to true if the patient's current disease is inoperable.","when_to_set_to_false":"Set to false if the patient's current disease is operable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disease is inoperable.","meaning":"Boolean indicating whether the patient's current disease is inoperable."}
(declare-const patient_has_finding_of_surgery_contraindicated_now Bool) ;; "surgery contraindicated" {"when_to_set_to_true":"Set to true if surgery is currently contraindicated for the patient.","when_to_set_to_false":"Set to false if surgery is not currently contraindicated for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether surgery is currently contraindicated for the patient.","meaning":"Boolean indicating whether surgery is currently contraindicated for the patient."}
(declare-const patient_can_undergo_surgical_procedure_now Bool) ;; "surgery" {"when_to_set_to_true":"Set to true if the patient can currently undergo a surgical procedure.","when_to_set_to_false":"Set to false if the patient cannot currently undergo a surgical procedure (e.g., surgery is contraindicated).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo a surgical procedure.","meaning":"Boolean indicating whether the patient can currently undergo a surgical procedure."}

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_disease_now@@inoperable
         patient_has_finding_of_disease_now)
     :named REQ9_AUXILIARY0)) ;; "inoperable disease" implies "disease"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Component 0: To be included, the patient must have (inoperable disease) OR (surgery contraindicated).
(assert
  (! (or patient_has_finding_of_disease_now@@inoperable
         patient_has_finding_of_surgery_contraindicated_now)
     :named REQ9_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (inoperable disease) OR (surgery contraindicated)."

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_has_finding_of_tracheoesophageal_fistula_now Bool) ;; "tracheoesophageal fistula" {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of tracheoesophageal fistula.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of tracheoesophageal fistula.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of tracheoesophageal fistula.","meaning":"Boolean indicating whether the patient currently has tracheoesophageal fistula."}
(declare-const patient_has_finding_of_invasion_of_tracheobronchial_tree_now Bool) ;; "invasion of the tracheobronchial tree" {"when_to_set_to_true":"Set to true if the patient currently has invasion of the tracheobronchial tree.","when_to_set_to_false":"Set to false if the patient currently does not have invasion of the tracheobronchial tree.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has invasion of the tracheobronchial tree.","meaning":"Boolean indicating whether the patient currently has invasion of the tracheobronchial tree."}

;; ===================== Constraint Assertions (REQ 10) =====================
;; Component 0: To be included, the patient must (NOT have tracheoesophageal fistula) AND (NOT have invasion of the tracheobronchial tree).
(assert
  (! (and (not patient_has_finding_of_tracheoesophageal_fistula_now)
          (not patient_has_finding_of_invasion_of_tracheobronchial_tree_now))
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must (NOT have tracheoesophageal fistula) AND (NOT have invasion of the tracheobronchial tree)."

;; ===================== Declarations for the criterion (REQ 11) =====================
(declare-const eastern_cooperative_oncology_group_performance_status_value_recorded_now_withunit_none Real) ;; "Eastern Cooperative Oncology Group performance status value" {"when_to_set_to_value":"Set to the integer value of the patient's current ECOG performance status as recorded now (e.g., 0, 1, 2, etc.).","when_to_set_to_null":"Set to null if the patient's current ECOG performance status is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current ECOG performance status (unitless, integer)."}

;; ===================== Constraint Assertions (REQ 11) =====================
;; The patient must have ECOG performance status of 0, 1, or 2
(assert
  (! (or (= eastern_cooperative_oncology_group_performance_status_value_recorded_now_withunit_none 0)
         (= eastern_cooperative_oncology_group_performance_status_value_recorded_now_withunit_none 1)
         (= eastern_cooperative_oncology_group_performance_status_value_recorded_now_withunit_none 2))
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must (have Eastern Cooperative Oncology Group performance status of 0) OR (have Eastern Cooperative Oncology Group performance status of 1) OR (have Eastern Cooperative Oncology Group performance status of 2)."

;; ===================== Declarations for the criterion (REQ 12) =====================
(declare-const patient_age_value_recorded_now_in_months Real) ;; "life expectancy ≥ 3 months" {"when_to_set_to_value":"Set to the patient's current age in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in months."}
(declare-const patient_longevity_value_recorded_now_withunit_months Real) ;; "life expectancy" {"when_to_set_to_value":"Set to the estimated number of months if the patient's current life expectancy is documented or can be reasonably determined.","when_to_set_to_null":"Set to null if the patient's current life expectancy in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current life expectancy in months."}

;; ===================== Constraint Assertions (REQ 12) =====================
;; Component 0: To be included, the patient must have life expectancy ≥ 3 months.
(assert
  (! (>= patient_longevity_value_recorded_now_withunit_months 3.0)
     :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have life expectancy ≥ 3 months."

;; ===================== Declarations for the criterion (REQ 13) =====================
(declare-const absolute_neutrophil_count_value_recorded_now_withunit_per_cubic_millimeter Real) ;; "absolute neutrophil count ≥ 1,500 per cubic millimeter." {"when_to_set_to_value":"Set to the numeric value of the patient's absolute neutrophil count measured at the current time, in units of per cubic millimeter.","when_to_set_to_null":"Set to null if the patient's absolute neutrophil count at the current time is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's absolute neutrophil count measured now, in units of per cubic millimeter."}

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
  (! (>= absolute_neutrophil_count_value_recorded_now_withunit_per_cubic_millimeter 1500.0)
     :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have absolute neutrophil count ≥ 1,500 per cubic millimeter."

;; ===================== Declarations for the criterion (REQ 14) =====================
(declare-const patient_platelet_count_finding_value_recorded_now_withunit_per_cubic_millimeter Real) ;; "platelet count" {"when_to_set_to_value":"Set to the measured value if the patient's platelet count per cubic millimeter is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current platelet count per cubic millimeter."}

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
  (! (>= patient_platelet_count_finding_value_recorded_now_withunit_per_cubic_millimeter 100000)
     :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have platelet count ≥ 100,000 per cubic millimeter."

;; ===================== Declarations for the criterion (REQ 15) =====================
(declare-const patient_hemoglobin_finding_value_recorded_now_withunit_grams_per_deciliter Real) ;; "hemoglobin level" {"when_to_set_to_value":"Set to the measured value if the patient's hemoglobin concentration in grams per deciliter is recorded now, regardless of whether transfusion was used to achieve this value.","when_to_set_to_null":"Set to null if no hemoglobin measurement in grams per deciliter is available for the patient now or the value is indeterminate.","meaning":"Numeric value representing the patient's current hemoglobin concentration in grams per deciliter."}

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
  (! (>= patient_hemoglobin_finding_value_recorded_now_withunit_grams_per_deciliter 10.0)
     :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have hemoglobin level ≥ 10 grams per deciliter (transfusion allowed)."

;; ===================== Declarations for the criterion (REQ 16) =====================
(declare-const patient_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_liter Real) ;; "creatinine level" {"when_to_set_to_value":"Set to the measured value if the patient's creatinine level in milligrams per liter is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current creatinine level in milligrams per liter."}

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
  (! (< patient_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_liter 15.0)
     :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have creatinine level < 15 milligrams per liter."

;; ===================== Declarations for the criterion (REQ 17) =====================
(declare-const patient_bilirubin_total_measurement_value_recorded_now_withunit_unit Real) ;; "total bilirubin level" {"when_to_set_to_value":"Set to the measured value if a total bilirubin measurement is recorded for the patient now, in the specified unit.","when_to_set_to_null":"Set to null if no total bilirubin measurement is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's current total bilirubin measurement in the specified unit."}
(declare-const upper_limit_of_normal_for_total_bilirubin_value_now_withunit_mg_per_dl Real) ;; "upper limit of normal for total bilirubin" {"when_to_set_to_value":"Set to the reference value for the upper limit of normal for total bilirubin in mg/dL as defined by the laboratory or clinical standard.","when_to_set_to_null":"Set to null if the reference value for the upper limit of normal for total bilirubin is not available or indeterminate.","meaning":"Numeric value representing the current upper limit of normal for total bilirubin in mg/dL."}

;; ===================== Constraint Assertions (REQ 17) =====================
;; Component 0: "To be included, the patient must have total bilirubin level < 1.5 × upper limit of normal."
(assert
  (! (< patient_bilirubin_total_measurement_value_recorded_now_withunit_unit
        (* 1.5 upper_limit_of_normal_for_total_bilirubin_value_now_withunit_mg_per_dl))
     :named REQ17_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 18) =====================
(declare-const patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_unit Real) ;; "alanine aminotransferase level" {"when_to_set_to_value":"Set to the measured value if a numeric measurement of alanine aminotransferase (ALT) is recorded now with a known unit.","when_to_set_to_null":"Set to null if no such measurement is available or the value/unit is indeterminate.","meaning":"Numeric value representing the patient's current alanine aminotransferase (ALT) measurement."}
(declare-const patient_aspartate_transaminase_level_value_recorded_now_withunit_unit Real) ;; "aspartate aminotransferase level" {"when_to_set_to_value":"Set to the measured value if a numeric measurement of aspartate aminotransferase (AST) is recorded now with a known unit.","when_to_set_to_null":"Set to null if no such measurement is available or the value/unit is indeterminate.","meaning":"Numeric value representing the patient's current aspartate aminotransferase (AST) measurement."}
(declare-const upper_limit_of_normal_for_alanine_aminotransferase_value_withunit_unit Real) ;; "upper limit of normal for alanine aminotransferase" {"when_to_set_to_value":"Set to the reference value if the upper limit of normal for alanine aminotransferase (ALT) is known and available, with a known unit.","when_to_set_to_null":"Set to null if the upper limit of normal for alanine aminotransferase (ALT) is not available or the value/unit is indeterminate.","meaning":"Numeric value representing the upper limit of normal for alanine aminotransferase (ALT)."}
(declare-const upper_limit_of_normal_for_aspartate_aminotransferase_value_withunit_unit Real) ;; "upper limit of normal for aspartate aminotransferase" {"when_to_set_to_value":"Set to the reference value if the upper limit of normal for aspartate aminotransferase (AST) is known and available, with a known unit.","when_to_set_to_null":"Set to null if the upper limit of normal for aspartate aminotransferase (AST) is not available or the value/unit is indeterminate.","meaning":"Numeric value representing the upper limit of normal for aspartate aminotransferase (AST)."}

;; ===================== Constraint Assertions (REQ 18) =====================
;; "To be included, the patient must (have alanine aminotransferase level < 2.5 × upper limit of normal) AND (have aspartate aminotransferase level < 2.5 × upper limit of normal)."
(assert
  (! (< patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_unit
        (* 2.5 upper_limit_of_normal_for_alanine_aminotransferase_value_withunit_unit))
     :named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "alanine aminotransferase level < 2.5 × upper limit of normal"

(assert
  (! (< patient_aspartate_transaminase_level_value_recorded_now_withunit_unit
        (* 2.5 upper_limit_of_normal_for_aspartate_aminotransferase_value_withunit_unit))
     :named REQ18_COMPONENT1_OTHER_REQUIREMENTS)) ;; "aspartate aminotransferase level < 2.5 × upper limit of normal"

;; ===================== Declarations for the criterion (REQ 19) =====================
(declare-const patient_prothrombin_time_finding_value_recorded_now_withunit_percent Real) ;; "prothrombin time" {"when_to_set_to_value":"Set to the measured percentage value if a current prothrombin time measurement is available.","when_to_set_to_null":"Set to null if no current prothrombin time percentage measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current prothrombin time."}

;; ===================== Constraint Assertions (REQ 19) =====================
;; Component 0: "To be included, the patient must have prothrombin time ≥ 60 percent."
(assert
  (! (>= patient_prothrombin_time_finding_value_recorded_now_withunit_percent 60.0)
     :named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have prothrombin time ≥ 60 percent."

;; ===================== Declarations for the criterion (REQ 20) =====================
(declare-const patient_is_pregnant_now Bool) ;; "must not be pregnant" {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."}
(declare-const patient_is_breastfeeding_now Bool) ;; "must not be nursing" {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."}

;; ===================== Constraint Assertions (REQ 20) =====================
;; To be included, the patient must not be pregnant or must not be nursing.
(assert
  (! (or (not patient_is_pregnant_now)
         (not patient_is_breastfeeding_now))
     :named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must not be pregnant or must not be nursing."

;; ===================== Declarations for the criterion (REQ 21) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; "if the patient is fertile" {"when_to_set_to_true":"Set to true if the patient is currently considered to have childbearing potential (is fertile).","when_to_set_to_false":"Set to false if the patient is currently considered not to have childbearing potential (is not fertile).","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential (is fertile)."}
(declare-const patient_is_using_effective_contraception_now Bool) ;; "the patient must use effective contraception" {"when_to_set_to_true":"Set to true if the patient is currently using contraception that is considered effective.","when_to_set_to_false":"Set to false if the patient is currently not using contraception or is using contraception that is not considered effective.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using effective contraception.","meaning":"Boolean indicating whether the patient is currently using effective contraception."}

;; ===================== Constraint Assertions (REQ 21) =====================
;; If the patient is fertile, the patient must use effective contraception.
(assert
  (! (or (not patient_has_childbearing_potential_now)
         patient_is_using_effective_contraception_now)
     :named REQ21_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, if the patient is fertile, the patient must use effective contraception."

;; ===================== Declarations for the criterion (REQ 22) =====================
(declare-const caloric_intake_value_recorded_per_day_per_square_meter_in_kilocalories Real) ;; "caloric intake > 1,000 kilocalories per square meter per day" {"when_to_set_to_value":"Set to the numeric value of the patient's total caloric intake per day per square meter, measured in kilocalories, if available.","when_to_set_to_null":"Set to null if the caloric intake per day per square meter in kilocalories is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's total caloric intake per day per square meter in kilocalories."}
(declare-const caloric_intake_with_gastrostomy_value_recorded_per_day_per_square_meter_in_kilocalories Real) ;; "caloric intake with gastrostomy" {"when_to_set_to_value":"Set to the numeric value of the patient's caloric intake per day per square meter delivered via gastrostomy, measured in kilocalories, if available.","when_to_set_to_null":"Set to null if the caloric intake via gastrostomy per day per square meter in kilocalories is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's caloric intake per day per square meter via gastrostomy in kilocalories."}
(declare-const oral_caloric_intake_value_recorded_per_day_per_square_meter_in_kilocalories Real) ;; "oral caloric intake" {"when_to_set_to_value":"Set to the numeric value of the patient's oral caloric intake per day per square meter, measured in kilocalories, if available.","when_to_set_to_null":"Set to null if the oral caloric intake per day per square meter in kilocalories is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's oral caloric intake per day per square meter in kilocalories."}

;; ===================== Auxiliary Assertions (REQ 22) =====================
;; The total caloric intake is the sum of oral and gastrostomy intake
(assert
  (! (= caloric_intake_value_recorded_per_day_per_square_meter_in_kilocalories
        (+ oral_caloric_intake_value_recorded_per_day_per_square_meter_in_kilocalories
           caloric_intake_with_gastrostomy_value_recorded_per_day_per_square_meter_in_kilocalories))
     :named REQ22_AUXILIARY0)) ;; "caloric intake may be oral caloric intake OR caloric intake with gastrostomy"

;; ===================== Constraint Assertions (REQ 22) =====================
;; Sufficient caloric intake is defined as > 1,000 kcal/m^2/day, regardless of route
(assert
  (! (> caloric_intake_value_recorded_per_day_per_square_meter_in_kilocalories 1000.0)
     :named REQ22_COMPONENT0_OTHER_REQUIREMENTS)) ;; "sufficient caloric intake (defined as caloric intake > 1,000 kilocalories per square meter per day)"

;; ===================== Declarations for the criterion (REQ 23) =====================
(declare-const patient_body_weight_value_recorded_inthepast3months_withunit_kg Real) ;; "body weight" {"when_to_set_to_value":"Set to the measured value if the patient's body weight (in kilograms) was recorded within the past 3 months.","when_to_set_to_null":"Set to null if no body weight measurement is available within the past 3 months or the value is indeterminate.","meaning":"Numeric value representing the patient's body weight (in kilograms) recorded within the past 3 months."}
(declare-const patient_normal_body_weight_value_withunit_kg Real) ;; "normal body weight" {"when_to_set_to_value":"Set to the measured or estimated value if the patient's normal (baseline) body weight in kilograms is known.","when_to_set_to_null":"Set to null if the patient's normal (baseline) body weight in kilograms is unknown, not documented, or indeterminate.","meaning":"Numeric value representing the patient's normal (baseline) body weight in kilograms."}
(declare-const patient_has_lost_more_than_20_percent_of_normal_body_weight_inthepast3months Bool) ;; "lost > 20 percent of normal body weight within the past 3 months" {"when_to_set_to_true":"Set to true if the patient has lost more than 20 percent of their normal body weight within the past 3 months.","when_to_set_to_false":"Set to false if the patient has not lost more than 20 percent of their normal body weight within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has lost more than 20 percent of their normal body weight within the past 3 months.","meaning":"Boolean indicating whether the patient has lost more than 20 percent of their normal body weight within the past 3 months."}

;; ===================== Auxiliary Assertions (REQ 23) =====================
;; Definition: patient has lost > 20% of normal body weight in past 3 months
(assert
  (! (= patient_has_lost_more_than_20_percent_of_normal_body_weight_inthepast3months
        (> (- patient_normal_body_weight_value_withunit_kg patient_body_weight_value_recorded_inthepast3months_withunit_kg)
           (* 0.20 patient_normal_body_weight_value_withunit_kg)))
     :named REQ23_AUXILIARY0)) ;; "lost > 20 percent of normal body weight within the past 3 months"

;; ===================== Constraint Assertions (REQ 23) =====================
;; Inclusion: patient must NOT have lost > 20% of normal body weight in past 3 months
(assert
  (! (not patient_has_lost_more_than_20_percent_of_normal_body_weight_inthepast3months)
     :named REQ23_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must NOT have lost > 20 percent of normal body weight within the past 3 months"

;; ===================== Declarations for the criterion (REQ 24) =====================
(declare-const patient_has_finding_of_complete_dysphagia_now Bool) ;; "complete dysphagia" {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of complete dysphagia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of complete dysphagia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of complete dysphagia.","meaning":"Boolean indicating whether the patient currently has complete dysphagia."}
(declare-const patient_has_finding_of_dysphagia_now Bool) ;; "dysphagia" {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dysphagia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dysphagia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of dysphagia.","meaning":"Boolean indicating whether the patient currently has dysphagia."}

;; ===================== Constraint Assertions (REQ 24) =====================
;; Component 0: To be included, the patient must NOT have complete dysphagia.
(assert
  (! (not patient_has_finding_of_complete_dysphagia_now)
     :named REQ24_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have complete dysphagia."
