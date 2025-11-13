;; ===================== Declarations for the inclusion criteria (REQ 0) =====================
(declare-const patient_has_diagnosis_of_non_small_cell_carcinoma_of_lung_tnm_stage_1_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of stage I non-small cell lung cancer.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of stage I non-small cell lung cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of stage I non-small cell lung cancer.","meaning":"Boolean indicating whether the patient currently has a diagnosis of stage I non-small cell lung cancer."}  ;; "have histologically proven stage I non-small cell lung cancer"
(declare-const patient_has_diagnosis_of_non_small_cell_carcinoma_of_lung_tnm_stage_1_now@@histologically_proven Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of stage I non-small cell lung cancer is histologically proven.","when_to_set_to_false":"Set to false if the diagnosis is not histologically proven.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is histologically proven.","meaning":"Boolean indicating whether the diagnosis of stage I non-small cell lung cancer is histologically proven."}  ;; "histologically proven stage I non-small cell lung cancer"

(declare-const patient_has_diagnosis_of_non_small_cell_carcinoma_of_lung_tnm_stage_2_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of stage II non-small cell lung cancer.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of stage II non-small cell lung cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of stage II non-small cell lung cancer.","meaning":"Boolean indicating whether the patient currently has a diagnosis of stage II non-small cell lung cancer."}  ;; "have histologically proven stage II non-small cell lung cancer"
(declare-const patient_has_diagnosis_of_non_small_cell_carcinoma_of_lung_tnm_stage_2_now@@histologically_proven Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of stage II non-small cell lung cancer is histologically proven.","when_to_set_to_false":"Set to false if the diagnosis is not histologically proven.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is histologically proven.","meaning":"Boolean indicating whether the diagnosis of stage II non-small cell lung cancer is histologically proven."}  ;; "histologically proven stage II non-small cell lung cancer"

(declare-const patient_has_diagnosis_of_non_small_cell_carcinoma_of_lung_tnm_stage_3a_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of stage IIIa non-small cell lung cancer.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of stage IIIa non-small cell lung cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of stage IIIa non-small cell lung cancer.","meaning":"Boolean indicating whether the patient currently has a diagnosis of stage IIIa non-small cell lung cancer."}  ;; "have histologically proven stage IIIa non-small cell lung cancer"
(declare-const patient_has_diagnosis_of_non_small_cell_carcinoma_of_lung_tnm_stage_3a_now@@histologically_proven Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of stage IIIa non-small cell lung cancer is histologically proven.","when_to_set_to_false":"Set to false if the diagnosis is not histologically proven.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is histologically proven.","meaning":"Boolean indicating whether the diagnosis of stage IIIa non-small cell lung cancer is histologically proven."}  ;; "histologically proven stage IIIa non-small cell lung cancer"

(declare-const patient_has_diagnosis_of_non_small_cell_lung_cancer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of non-small cell lung cancer.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of non-small cell lung cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of non-small cell lung cancer.","meaning":"Boolean indicating whether the patient currently has a diagnosis of non-small cell lung cancer."}  ;; "non-small cell lung cancer"
(declare-const patient_has_diagnosis_of_non_small_cell_lung_cancer_now@@primary_tumor Bool) ;; {"when_to_set_to_true":"Set to true if the non-small cell lung cancer is the primary tumor.","when_to_set_to_false":"Set to false if the non-small cell lung cancer is not the primary tumor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the non-small cell lung cancer is the primary tumor.","meaning":"Boolean indicating whether the non-small cell lung cancer is the primary tumor."}  ;; "primary non-small cell lung cancer tumor"

(declare-const patient_has_undergone_complete_excision_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a complete surgical excision (resection).","when_to_set_to_false":"Set to false if the patient has never undergone a complete surgical excision (resection).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a complete surgical excision (resection).","meaning":"Boolean indicating whether the patient has ever undergone a complete surgical excision (resection)."}  ;; "have undergone a complete surgical resection"
(declare-const patient_has_undergone_complete_excision_inthehistory@@of_primary_non_small_cell_lung_cancer_tumor Bool) ;; {"when_to_set_to_true":"Set to true if the complete excision was of the primary non-small cell lung cancer tumor.","when_to_set_to_false":"Set to false if the excision was not of the primary non-small cell lung cancer tumor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the excision was of the primary non-small cell lung cancer tumor.","meaning":"Boolean indicating whether the complete excision was of the primary non-small cell lung cancer tumor."}  ;; "complete surgical resection of the primary non-small cell lung cancer tumor"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply their stem variables
(assert
  (! (=> patient_has_diagnosis_of_non_small_cell_carcinoma_of_lung_tnm_stage_1_now@@histologically_proven
         patient_has_diagnosis_of_non_small_cell_carcinoma_of_lung_tnm_stage_1_now)
     :named REQ0_AUXILIARY0)) ;; "histologically proven stage I non-small cell lung cancer"

(assert
  (! (=> patient_has_diagnosis_of_non_small_cell_carcinoma_of_lung_tnm_stage_2_now@@histologically_proven
         patient_has_diagnosis_of_non_small_cell_carcinoma_of_lung_tnm_stage_2_now)
     :named REQ0_AUXILIARY1)) ;; "histologically proven stage II non-small cell lung cancer"

(assert
  (! (=> patient_has_diagnosis_of_non_small_cell_carcinoma_of_lung_tnm_stage_3a_now@@histologically_proven
         patient_has_diagnosis_of_non_small_cell_carcinoma_of_lung_tnm_stage_3a_now)
     :named REQ0_AUXILIARY2)) ;; "histologically proven stage IIIa non-small cell lung cancer"

(assert
  (! (=> patient_has_diagnosis_of_non_small_cell_lung_cancer_now@@primary_tumor
         patient_has_diagnosis_of_non_small_cell_lung_cancer_now)
     :named REQ0_AUXILIARY3)) ;; "primary non-small cell lung cancer tumor"

(assert
  (! (=> patient_has_undergone_complete_excision_inthehistory@@of_primary_non_small_cell_lung_cancer_tumor
         patient_has_undergone_complete_excision_inthehistory)
     :named REQ0_AUXILIARY4)) ;; "complete surgical resection of the primary non-small cell lung cancer tumor"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: ((histologically proven stage I) OR (histologically proven stage II) OR (histologically proven stage IIIa) non-small cell lung cancer)
(assert
  (! (or patient_has_diagnosis_of_non_small_cell_carcinoma_of_lung_tnm_stage_1_now@@histologically_proven
         patient_has_diagnosis_of_non_small_cell_carcinoma_of_lung_tnm_stage_2_now@@histologically_proven
         patient_has_diagnosis_of_non_small_cell_carcinoma_of_lung_tnm_stage_3a_now@@histologically_proven)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "((have histologically proven stage I non-small cell lung cancer) OR (have histologically proven stage II non-small cell lung cancer) OR (have histologically proven stage IIIa non-small cell lung cancer))"

;; Component 1: complete surgical resection of the primary non-small cell lung cancer tumor
(assert
  (! patient_has_undergone_complete_excision_inthehistory@@of_primary_non_small_cell_lung_cancer_tumor
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have undergone a complete surgical resection of the primary non-small cell lung cancer tumor"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_undergone_surgical_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a surgical procedure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a surgical procedure at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a surgical procedure.","meaning":"Boolean indicating whether the patient has ever undergone a surgical procedure at any time in the past."}  ;; "must have undergone surgery"
(declare-const patient_has_undergone_surgical_procedure_inthehistory@@temporalcontext_within_12_months_prior_to_trial_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a surgical procedure and the procedure occurred within 12 months prior to trial enrollment.","when_to_set_to_false":"Set to false if the patient has undergone a surgical procedure but the procedure did not occur within 12 months prior to trial enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure occurred within 12 months prior to trial enrollment.","meaning":"Boolean indicating whether the patient's surgical procedure occurred within 12 months prior to trial enrollment."}  ;; "must have undergone surgery within 12 months prior to trial enrollment"
(declare-const surgical_procedure_date_value_recorded_in_history_withunit_date Real) ;; {"when_to_set_to_value":"Set to the date (YYYY-MM-DD) when the patient's surgical procedure was performed, as recorded in the patient's history.","when_to_set_to_null":"Set to null if the date of the surgical procedure is unknown, not documented, or cannot be determined.","meaning":"The date value (in YYYY-MM-DD format) when the patient's surgical procedure was performed, as recorded in the patient's history."}  ;; "date of surgery"
(declare-const trial_enrollment_date_value_recorded_withunit_date Real) ;; {"when_to_set_to_value":"Set to the date (YYYY-MM-DD) when the patient is enrolled in the trial.","when_to_set_to_null":"Set to null if the date of trial enrollment is unknown, not documented, or cannot be determined.","meaning":"The date value (in YYYY-MM-DD format) when the patient is enrolled in the trial."}  ;; "date of trial enrollment"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_surgical_procedure_inthehistory@@temporalcontext_within_12_months_prior_to_trial_enrollment
         patient_has_undergone_surgical_procedure_inthehistory)
     :named REQ1_AUXILIARY0)) ;; "must have undergone surgery within 12 months prior to trial enrollment"

;; Definition of temporal qualifier: surgery occurred within 12 months prior to trial enrollment
(assert
  (! (= patient_has_undergone_surgical_procedure_inthehistory@@temporalcontext_within_12_months_prior_to_trial_enrollment
        (and patient_has_undergone_surgical_procedure_inthehistory
             (<= (- trial_enrollment_date_value_recorded_withunit_date surgical_procedure_date_value_recorded_in_history_withunit_date) 365)
             (>= (- trial_enrollment_date_value_recorded_withunit_date surgical_procedure_date_value_recorded_in_history_withunit_date) 0)))
     :named REQ1_AUXILIARY1)) ;; "surgery within 12 months prior to trial enrollment"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_undergone_surgical_procedure_inthehistory@@temporalcontext_within_12_months_prior_to_trial_enrollment
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "must have undergone surgery within 12 months prior to trial enrollment"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (cancer)."}  ;; "cancer"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@residual Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of malignant neoplastic disease (cancer) is residual (remaining after initial treatment).","when_to_set_to_false":"Set to false if the patient's current diagnosis of malignant neoplastic disease (cancer) is not residual.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of malignant neoplastic disease (cancer) is residual.","meaning":"Boolean indicating whether the patient's current diagnosis of malignant neoplastic disease (cancer) is residual."}  ;; "residual cancer"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable (residual) implies the stem variable (malignant neoplastic disease)
(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@residual
         patient_has_diagnosis_of_malignant_neoplastic_disease_now)
     :named REQ2_AUXILIARY0)) ;; "residual cancer" implies "cancer"

;; ===================== Constraint Assertions (REQ 2) =====================
;; To be included, the patient must have no evidence of residual cancer.
(assert
  (! (not patient_has_diagnosis_of_malignant_neoplastic_disease_now@@residual)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "no evidence of residual cancer"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const performance_status_value_recorded_now_withunit_zubrod Real) ;; {"when_to_set_to_value":"Set to the patient's current performance status value as measured using the Zubrod scale (0, 1, or 2).","when_to_set_to_null":"Set to null if the patient's current performance status as measured using the Zubrod scale is unknown, not documented, or cannot be determined.","meaning":"Numeric value for the patient's current performance status as measured using the Zubrod scale."}  ;; "have a performance status of 0 (Zubrod)", "have a performance status of 1 (Zubrod)", "have a performance status of 2 (Zubrod)"
(declare-const performance_status_value_recorded_now_withunit_zubrod@@measured_using_zubrod_scale Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current performance status is measured using the Zubrod scale.","when_to_set_to_false":"Set to false if the patient's current performance status is not measured using the Zubrod scale.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current performance status is measured using the Zubrod scale.","meaning":"Boolean indicating whether the patient's current performance status is measured using the Zubrod scale."}  ;; "performance status ... (Zubrod)"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: To be included, the patient must ((have a performance status of 0 (Zubrod)) OR (have a performance status of 1 (Zubrod)) OR (have a performance status of 2 (Zubrod))).
(assert
  (! (and performance_status_value_recorded_now_withunit_zubrod@@measured_using_zubrod_scale
          (or (= performance_status_value_recorded_now_withunit_zubrod 0)
              (= performance_status_value_recorded_now_withunit_zubrod 1)
              (= performance_status_value_recorded_now_withunit_zubrod 2)))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "have a performance status of 0 (Zubrod) OR 1 (Zubrod) OR 2 (Zubrod)"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_can_undergo_bronchoscopy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has no contraindications and is able to undergo bronchoscopy.","when_to_set_to_false":"Set to false if the patient currently has contraindications and cannot undergo bronchoscopy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo bronchoscopy.","meaning":"Boolean indicating whether the patient can currently undergo bronchoscopy (i.e., has no contraindications to the procedure at this time)."}  ;; "must NOT have contraindications for undergoing bronchoscopy"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_can_undergo_bronchoscopy_now
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have contraindications for undergoing bronchoscopy."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_finding_of_infectious_disease_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an infectious disease of the lung (pulmonary infection).","when_to_set_to_false":"Set to false if the patient currently does not have an infectious disease of the lung (pulmonary infection).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an infectious disease of the lung (pulmonary infection).","meaning":"Boolean indicating whether the patient currently has an infectious disease of the lung (pulmonary infection)."}  ;; "active pulmonary infection"
(declare-const patient_has_finding_of_infectious_disease_of_lung_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current infectious disease of the lung (pulmonary infection) is active.","when_to_set_to_false":"Set to false if the patient's current infectious disease of the lung (pulmonary infection) is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current infectious disease of the lung (pulmonary infection) is active.","meaning":"Boolean indicating whether the patient's current infectious disease of the lung (pulmonary infection) is active."}  ;; "active pulmonary infection"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_infectious_disease_of_lung_now@@active
         patient_has_finding_of_infectious_disease_of_lung_now)
     :named REQ6_AUXILIARY0)) ;; "active pulmonary infection" means there is a current pulmonary infection

;; ===================== Constraint Assertions (REQ 6) =====================
;; The patient must NOT have active pulmonary infection
(assert
  (! (not patient_has_finding_of_infectious_disease_of_lung_now@@active)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must NOT have active pulmonary infection"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_granulocyte_count_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's total granulocyte count is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's total granulocyte count measured now."}  ;; "total granulocyte count > 1500"
(declare-const patient_platelet_count_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's platelet count is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's platelet count measured now."}  ;; "platelet count > 100,000"
(declare-const patient_bilirubin_total_measurement_value_recorded_now_withunit_mg_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's total bilirubin level is recorded now in mg%.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's total bilirubin level measured now in mg%."}  ;; "total bilirubin level ≤ 1.5 mg%"
(declare-const patient_creatinine_level_finding_value_recorded_now_withunit_mg_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's creatinine level is recorded now in mg%.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's creatinine level measured now in mg%."}  ;; "creatinine level ≤ 1.5 mg%"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: total granulocyte count > 1500
(assert
  (! (> patient_granulocyte_count_value_recorded_now_withunit_count 1500)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "total granulocyte count > 1500"

;; Component 1: platelet count > 100,000
(assert
  (! (> patient_platelet_count_value_recorded_now_withunit_count 100000)
     :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "platelet count > 100,000"

;; Component 2: total bilirubin level ≤ 1.5 mg%
(assert
  (! (<= patient_bilirubin_total_measurement_value_recorded_now_withunit_mg_percent 1.5)
     :named REQ7_COMPONENT2_OTHER_REQUIREMENTS)) ;; "total bilirubin level ≤ 1.5 mg%"

;; Component 3: creatinine level ≤ 1.5 mg%
(assert
  (! (<= patient_creatinine_level_finding_value_recorded_now_withunit_mg_percent 1.5)
     :named REQ7_COMPONENT3_OTHER_REQUIREMENTS)) ;; "creatinine level ≤ 1.5 mg%"

;; ===================== Declarations for the inclusion criterion (REQ 8) =====================
(declare-const patient_has_completed_pretreatment_evaluation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has completed the pretreatment evaluation now.","when_to_set_to_false":"Set to false if the patient has not completed the pretreatment evaluation now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has completed the pretreatment evaluation now.","meaning":"Boolean indicating whether the patient has completed the pretreatment evaluation now."}  ;; "the patient must complete the pretreatment evaluation"
(declare-const patient_has_undergone_bronchoscopy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone bronchoscopy now.","when_to_set_to_false":"Set to false if the patient has not undergone bronchoscopy now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone bronchoscopy now.","meaning":"Boolean indicating whether the patient has undergone bronchoscopy now."}  ;; "the patient must consent to bronchoscopy"
(declare-const patient_has_undergone_bronchoscopy_now@@patient_consents_to_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the patient consents to bronchoscopy.","when_to_set_to_false":"Set to false if the patient does not consent to bronchoscopy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient consents to bronchoscopy.","meaning":"Boolean indicating whether the patient consents to bronchoscopy."}  ;; "the patient must consent to bronchoscopy"
(declare-const patient_has_undergone_biopsy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone biopsy now.","when_to_set_to_false":"Set to false if the patient has not undergone biopsy now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone biopsy now.","meaning":"Boolean indicating whether the patient has undergone biopsy now."}  ;; "the patient must consent to endobronchial biopsy for biomarker studies"
(declare-const patient_has_undergone_biopsy_now@@patient_consents_to_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the patient consents to biopsy.","when_to_set_to_false":"Set to false if the patient does not consent to biopsy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient consents to biopsy.","meaning":"Boolean indicating whether the patient consents to biopsy."}  ;; "the patient must consent to endobronchial biopsy for biomarker studies"
(declare-const patient_has_undergone_biopsy_now@@performed_for_biomarker_studies Bool) ;; {"when_to_set_to_true":"Set to true if the biopsy is performed for biomarker studies.","when_to_set_to_false":"Set to false if the biopsy is not performed for biomarker studies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the biopsy is performed for biomarker studies.","meaning":"Boolean indicating whether the biopsy is performed for biomarker studies."}  ;; "the patient must consent to endobronchial biopsy for biomarker studies"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable for bronchoscopy consent implies bronchoscopy performed
(assert
  (! (=> patient_has_undergone_bronchoscopy_now@@patient_consents_to_procedure
         patient_has_undergone_bronchoscopy_now)
     :named REQ8_AUXILIARY0)) ;; "the patient must consent to bronchoscopy"

;; Qualifier variable for biopsy consent implies biopsy performed
(assert
  (! (=> patient_has_undergone_biopsy_now@@patient_consents_to_procedure
         patient_has_undergone_biopsy_now)
     :named REQ8_AUXILIARY1)) ;; "the patient must consent to endobronchial biopsy for biomarker studies"

;; Qualifier variable for biopsy performed for biomarker studies implies biopsy performed
(assert
  (! (=> patient_has_undergone_biopsy_now@@performed_for_biomarker_studies
         patient_has_undergone_biopsy_now)
     :named REQ8_AUXILIARY2)) ;; "the patient must consent to endobronchial biopsy for biomarker studies"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Component 0: patient must complete the pretreatment evaluation
(assert
  (! patient_has_completed_pretreatment_evaluation_now
     :named REQ8_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must complete the pretreatment evaluation"

;; Component 1: patient must consent to bronchoscopy
(assert
  (! patient_has_undergone_bronchoscopy_now@@patient_consents_to_procedure
     :named REQ8_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must consent to bronchoscopy"

;; Component 2: patient must consent to endobronchial biopsy for biomarker studies
(assert
  (! (and patient_has_undergone_biopsy_now@@patient_consents_to_procedure
          patient_has_undergone_biopsy_now@@performed_for_biomarker_studies)
     :named REQ8_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must consent to endobronchial biopsy for biomarker studies"

;; ===================== Declarations for the inclusion criterion (REQ 9) =====================
(declare-const patient_has_received_written_and_verbal_explanation_of_study_requirements_prior_to_registration Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been given both a written and verbal explanation of the study requirements prior to registration.","when_to_set_to_false":"Set to false if the patient has not been given both a written and verbal explanation of the study requirements prior to registration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been given both a written and verbal explanation of the study requirements prior to registration.","meaning":"Boolean indicating whether the patient has been given both a written and verbal explanation of the study requirements prior to registration."} ;; "be given a written and verbal explanation of the study requirements"
(declare-const patient_has_signed_consent_form_prior_to_registration Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed the consent form prior to registration.","when_to_set_to_false":"Set to false if the patient has not signed the consent form prior to registration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed the consent form prior to registration.","meaning":"Boolean indicating whether the patient has signed the consent form prior to registration."} ;; "a consent form that is signed prior to registration"
(declare-const patient_is_willing_to_undergo_biopsy_through_bronchoscopy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to undergo biopsies through bronchoscopy.","when_to_set_to_false":"Set to false if the patient is not willing to undergo biopsies through bronchoscopy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to undergo biopsies through bronchoscopy.","meaning":"Boolean indicating whether the patient is willing to undergo biopsies through bronchoscopy."} ;; "be willing to take biopsies through bronchoscopy"
(declare-const patient_can_undergo_collection_of_blood_specimen_for_laboratory_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently willing and able to undergo collection of blood specimen for laboratory purposes.","when_to_set_to_false":"Set to false if the patient is currently unwilling or unable to undergo collection of blood specimen for laboratory purposes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing and able to undergo collection of blood specimen for laboratory purposes.","meaning":"Boolean indicating whether the patient is currently willing and able to undergo collection of blood specimen for laboratory purposes."} ;; "be willing to give blood samples"
(declare-const patient_can_undergo_collection_of_blood_specimen_for_laboratory_now@@at_specified_times Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing and able to undergo collection of blood specimen for laboratory purposes at the specified times.","when_to_set_to_false":"Set to false if the patient is unwilling or unable to undergo collection of blood specimen for laboratory purposes at the specified times.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing and able to undergo collection of blood specimen for laboratory purposes at the specified times.","meaning":"Boolean indicating whether the patient is willing and able to undergo collection of blood specimen for laboratory purposes at the specified times."} ;; "at the specified times"
(declare-const patient_can_undergo_follow_up_visit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently willing and able to undergo follow-up visits.","when_to_set_to_false":"Set to false if the patient is currently unwilling or unable to undergo follow-up visits.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing and able to undergo follow-up visits.","meaning":"Boolean indicating whether the patient is currently willing and able to undergo follow-up visits."} ;; "schedule and keep the specified follow-up visits"
(declare-const patient_can_undergo_follow_up_visit_now@@scheduled_and_kept_as_specified Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing and able to undergo follow-up visits that are scheduled and kept as specified.","when_to_set_to_false":"Set to false if the patient is unwilling or unable to undergo follow-up visits that are scheduled and kept as specified.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing and able to undergo follow-up visits that are scheduled and kept as specified.","meaning":"Boolean indicating whether the patient is willing and able to undergo follow-up visits that are scheduled and kept as specified."} ;; "schedule and keep the specified follow-up visits"
(declare-const patient_can_undergo_follow_up_visit_now@@with_physicians_and_study_clinics Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing and able to undergo follow-up visits with their physicians and the study clinics.","when_to_set_to_false":"Set to false if the patient is unwilling or unable to undergo follow-up visits with their physicians and the study clinics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing and able to undergo follow-up visits with their physicians and the study clinics.","meaning":"Boolean indicating whether the patient is willing and able to undergo follow-up visits with their physicians and the study clinics."} ;; "with their physicians and the study clinics"
(declare-const patient_has_been_informed_that_health_risks_may_occur_as_described_in_informed_consent_form Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been informed that health risks may occur, as described in the informed consent form.","when_to_set_to_false":"Set to false if the patient has not been informed that health risks may occur, as described in the informed consent form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been informed that health risks may occur, as described in the informed consent form.","meaning":"Boolean indicating whether the patient has been informed that health risks may occur, as described in the informed consent form."} ;; "be informed that health risks may occur, as described in the informed consent form"
(declare-const patient_has_been_informed_that_side_effects_may_occur_as_described_in_informed_consent_form Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been informed that side effects may occur, as described in the informed consent form.","when_to_set_to_false":"Set to false if the patient has not been informed that side effects may occur, as described in the informed consent form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been informed that side effects may occur, as described in the informed consent form.","meaning":"Boolean indicating whether the patient has been informed that side effects may occur, as described in the informed consent form."} ;; "be informed that side effects may occur, as described in the informed consent form"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable for blood specimen collection implies stem variable
(assert
  (! (=> patient_can_undergo_collection_of_blood_specimen_for_laboratory_now@@at_specified_times
         patient_can_undergo_collection_of_blood_specimen_for_laboratory_now)
     :named REQ9_AUXILIARY0)) ;; "be willing to give blood samples at the specified times"

;; Qualifier variable for follow-up visits (scheduled and kept as specified) implies stem variable
(assert
  (! (=> patient_can_undergo_follow_up_visit_now@@scheduled_and_kept_as_specified
         patient_can_undergo_follow_up_visit_now)
     :named REQ9_AUXILIARY1)) ;; "schedule and keep the specified follow-up visits"

;; Qualifier variable for follow-up visits (with physicians and study clinics) implies stem variable
(assert
  (! (=> patient_can_undergo_follow_up_visit_now@@with_physicians_and_study_clinics
         patient_can_undergo_follow_up_visit_now)
     :named REQ9_AUXILIARY2)) ;; "with their physicians and the study clinics"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Component 0: patient must be given written and verbal explanation AND signed consent form prior to registration
(assert
  (! (and patient_has_received_written_and_verbal_explanation_of_study_requirements_prior_to_registration
          patient_has_signed_consent_form_prior_to_registration)
     :named REQ9_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "be given a written and verbal explanation of the study requirements AND a consent form that is signed prior to registration"

;; Component 1: patient must be willing to take biopsies through bronchoscopy
(assert
  (! patient_is_willing_to_undergo_biopsy_through_bronchoscopy
     :named REQ9_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "be willing to take biopsies through bronchoscopy"

;; Component 2: patient must be willing to give blood samples at the specified times
(assert
  (! patient_can_undergo_collection_of_blood_specimen_for_laboratory_now@@at_specified_times
     :named REQ9_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "be willing to give blood samples at the specified times"

;; Component 3: patient must schedule and keep the specified follow-up visits with their physicians AND the study clinics
(assert
  (! (and patient_can_undergo_follow_up_visit_now@@scheduled_and_kept_as_specified
          patient_can_undergo_follow_up_visit_now@@with_physicians_and_study_clinics)
     :named REQ9_COMPONENT3_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "schedule and keep the specified follow-up visits with their physicians AND the study clinics"

;; Component 4: patient must be informed that side effects AND health risks may occur, as described in the informed consent form
(assert
  (! (and patient_has_been_informed_that_side_effects_may_occur_as_described_in_informed_consent_form
          patient_has_been_informed_that_health_risks_may_occur_as_described_in_informed_consent_form)
     :named REQ9_COMPONENT4_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "be informed that side effects AND health risks may occur, as described in the informed consent form"

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_cigarette_pack_years_value_recorded_inthehistory_withunit_pack_years Real) ;; {"when_to_set_to_value":"Set to the total number of cigarette pack years if a value is recorded in the patient's history.","when_to_set_to_null":"Set to null if no value for cigarette pack years is recorded in the patient's history or if it is indeterminate.","meaning":"Numeric value representing the patient's total cigarette pack years as recorded at any time in the past."} ;; "have a smoking history of at least 10 pack years"
(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a smoker.","when_to_set_to_false":"Set to false if the patient is currently not a smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a smoker.","meaning":"Boolean indicating whether the patient is currently a smoker."} ;; "be a current smoker"
(declare-const patient_has_finding_of_ex_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as a former smoker (i.e., has smoked in the past but is not currently smoking).","when_to_set_to_false":"Set to false if the patient is not currently classified as a former smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as a former smoker.","meaning":"Boolean indicating whether the patient is currently classified as a former smoker."} ;; "be a former smoker"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Component 0: Patient must have a smoking history of at least 10 pack years
(assert
  (! (>= patient_cigarette_pack_years_value_recorded_inthehistory_withunit_pack_years 10)
     :named REQ10_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have a smoking history of at least 10 pack years"

;; Component 1: Patient must be a current smoker OR a former smoker
(assert
  (! (or patient_has_finding_of_smoker_now
         patient_has_finding_of_ex_smoker_now)
     :named REQ10_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "be a current smoker OR be a former smoker"

;; ===================== Declarations for the criterion (REQ 11) =====================
(declare-const patient_is_legally_capable_of_providing_consent_for_participation_in_this_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient is considered legally capable of providing consent for participation in this study.","when_to_set_to_false":"Set to false if the patient is considered not legally capable of providing consent for participation in this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is legally capable of providing consent for participation in this study.","meaning":"Boolean indicating whether the patient is considered legally capable of providing consent for participation in this study."} ;; "the patient must be considered legally capable of providing consent for participation in this study"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! patient_is_legally_capable_of_providing_consent_for_participation_in_this_study
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be considered legally capable of providing consent for participation in this study"
