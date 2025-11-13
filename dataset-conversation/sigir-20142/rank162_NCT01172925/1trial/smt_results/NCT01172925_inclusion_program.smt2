;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_non_small_cell_carcinoma_of_lung_tnm_stage_3_now Bool) ;; "stage IIIb non-small cell lung cancer" {"when_to_set_to_true":"Set to true if the patient currently has stage IIIb non-small cell lung cancer.","when_to_set_to_false":"Set to false if the patient currently does not have stage IIIb non-small cell lung cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has stage IIIb non-small cell lung cancer.","meaning":"Boolean indicating whether the patient currently has stage IIIb non-small cell lung cancer."}
(declare-const patient_has_finding_of_non_small_cell_carcinoma_of_lung_tnm_stage_3_now@@histologically_proven Bool) ;; "histologically proven incurable stage IIIb non-small cell lung cancer" {"when_to_set_to_true":"Set to true if the diagnosis of stage IIIb non-small cell lung cancer is histologically proven.","when_to_set_to_false":"Set to false if the diagnosis of stage IIIb non-small cell lung cancer is not histologically proven.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is histologically proven.","meaning":"Boolean indicating whether the diagnosis of stage IIIb non-small cell lung cancer is histologically proven."}
(declare-const patient_has_finding_of_non_small_cell_carcinoma_of_lung_tnm_stage_3_now@@cytologically_proven Bool) ;; "cytologically proven incurable stage IIIb non-small cell lung cancer" {"when_to_set_to_true":"Set to true if the diagnosis of stage IIIb non-small cell lung cancer is cytologically proven.","when_to_set_to_false":"Set to false if the diagnosis of stage IIIb non-small cell lung cancer is not cytologically proven.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is cytologically proven.","meaning":"Boolean indicating whether the diagnosis of stage IIIb non-small cell lung cancer is cytologically proven."}
(declare-const patient_has_finding_of_non_small_cell_carcinoma_of_lung_tnm_stage_3_now@@incurable Bool) ;; "incurable stage IIIb non-small cell lung cancer" {"when_to_set_to_true":"Set to true if the stage IIIb non-small cell lung cancer is incurable.","when_to_set_to_false":"Set to false if the stage IIIb non-small cell lung cancer is curable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the stage IIIb non-small cell lung cancer is incurable.","meaning":"Boolean indicating whether the stage IIIb non-small cell lung cancer is incurable."}
(declare-const patient_has_finding_of_non_small_cell_carcinoma_of_lung_tnm_stage_4_now Bool) ;; "stage IV non-small cell lung cancer" {"when_to_set_to_true":"Set to true if the patient currently has stage IV non-small cell lung cancer.","when_to_set_to_false":"Set to false if the patient currently does not have stage IV non-small cell lung cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has stage IV non-small cell lung cancer.","meaning":"Boolean indicating whether the patient currently has stage IV non-small cell lung cancer."}
(declare-const patient_has_finding_of_non_small_cell_carcinoma_of_lung_tnm_stage_4_now@@histologically_proven Bool) ;; "histologically proven incurable stage IV non-small cell lung cancer" {"when_to_set_to_true":"Set to true if the diagnosis of stage IV non-small cell lung cancer is histologically proven.","when_to_set_to_false":"Set to false if the diagnosis of stage IV non-small cell lung cancer is not histologically proven.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is histologically proven.","meaning":"Boolean indicating whether the diagnosis of stage IV non-small cell lung cancer is histologically proven."}
(declare-const patient_has_finding_of_non_small_cell_carcinoma_of_lung_tnm_stage_4_now@@cytologically_proven Bool) ;; "cytologically proven incurable stage IV non-small cell lung cancer" {"when_to_set_to_true":"Set to true if the diagnosis of stage IV non-small cell lung cancer is cytologically proven.","when_to_set_to_false":"Set to false if the diagnosis of stage IV non-small cell lung cancer is not cytologically proven.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is cytologically proven.","meaning":"Boolean indicating whether the diagnosis of stage IV non-small cell lung cancer is cytologically proven."}
(declare-const patient_has_finding_of_non_small_cell_carcinoma_of_lung_tnm_stage_4_now@@incurable Bool) ;; "incurable stage IV non-small cell lung cancer" {"when_to_set_to_true":"Set to true if the stage IV non-small cell lung cancer is incurable.","when_to_set_to_false":"Set to false if the stage IV non-small cell lung cancer is curable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the stage IV non-small cell lung cancer is incurable.","meaning":"Boolean indicating whether the stage IV non-small cell lung cancer is incurable."}

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables for stage IIIb
(assert
  (! (=> patient_has_finding_of_non_small_cell_carcinoma_of_lung_tnm_stage_3_now@@histologically_proven
         patient_has_finding_of_non_small_cell_carcinoma_of_lung_tnm_stage_3_now)
     :named REQ0_AUXILIARY0)) ;; "histologically proven incurable stage IIIb non-small cell lung cancer"

(assert
  (! (=> patient_has_finding_of_non_small_cell_carcinoma_of_lung_tnm_stage_3_now@@cytologically_proven
         patient_has_finding_of_non_small_cell_carcinoma_of_lung_tnm_stage_3_now)
     :named REQ0_AUXILIARY1)) ;; "cytologically proven incurable stage IIIb non-small cell lung cancer"

;; Qualifier variables imply corresponding stem variables for stage IV
(assert
  (! (=> patient_has_finding_of_non_small_cell_carcinoma_of_lung_tnm_stage_4_now@@histologically_proven
         patient_has_finding_of_non_small_cell_carcinoma_of_lung_tnm_stage_4_now)
     :named REQ0_AUXILIARY2)) ;; "histologically proven incurable stage IV non-small cell lung cancer"

(assert
  (! (=> patient_has_finding_of_non_small_cell_carcinoma_of_lung_tnm_stage_4_now@@cytologically_proven
         patient_has_finding_of_non_small_cell_carcinoma_of_lung_tnm_stage_4_now)
     :named REQ0_AUXILIARY3)) ;; "cytologically proven incurable stage IV non-small cell lung cancer"

;; ===================== Constraint Assertions (REQ 0) =====================
;; At least one of the following must be true:
;; (histologically proven incurable stage IIIb NSCLC) OR (cytologically proven incurable stage IIIb NSCLC) OR (histologically proven incurable stage IV NSCLC) OR (cytologically proven incurable stage IV NSCLC)
(assert
  (! (or (and patient_has_finding_of_non_small_cell_carcinoma_of_lung_tnm_stage_3_now@@histologically_proven
              patient_has_finding_of_non_small_cell_carcinoma_of_lung_tnm_stage_3_now@@incurable)
         (and patient_has_finding_of_non_small_cell_carcinoma_of_lung_tnm_stage_3_now@@cytologically_proven
              patient_has_finding_of_non_small_cell_carcinoma_of_lung_tnm_stage_3_now@@incurable)
         (and patient_has_finding_of_non_small_cell_carcinoma_of_lung_tnm_stage_4_now@@histologically_proven
              patient_has_finding_of_non_small_cell_carcinoma_of_lung_tnm_stage_4_now@@incurable)
         (and patient_has_finding_of_non_small_cell_carcinoma_of_lung_tnm_stage_4_now@@cytologically_proven
              patient_has_finding_of_non_small_cell_carcinoma_of_lung_tnm_stage_4_now@@incurable))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have ((histologically proven incurable stage IIIb non-small cell lung cancer) OR (cytologically proven incurable stage IIIb non-small cell lung cancer) OR (histologically proven incurable stage IV non-small cell lung cancer) OR (cytologically proven incurable stage IV non-small cell lung cancer))."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const dyspnea_score_value_recorded_now_withunit_point Real) ;; "dyspnea as defined by a score ≥ 2 on the 10-point dyspnea numeric scale (Appendix 2)" {"when_to_set_to_value":"Set to the value of the patient's current dyspnea score as recorded on the 10-point dyspnea numeric scale (unit: point).","when_to_set_to_null":"Set to null if the patient's current dyspnea score on the 10-point dyspnea numeric scale is unknown, not documented, or cannot be determined.","meaning":"Numeric variable representing the patient's current dyspnea score as recorded on the 10-point dyspnea numeric scale (unit: point)."}

(declare-const patient_has_finding_of_dyspnea_now Bool) ;; "dyspnea as defined by a score ≥ 2 on the 10-point dyspnea numeric scale (Appendix 2)" {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dyspnea.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dyspnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dyspnea.","meaning":"Boolean indicating whether the patient currently has dyspnea."}

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Dyspnea is defined as a score ≥ 2 on the 10-point dyspnea numeric scale (Appendix 2)
(assert
  (! (= patient_has_finding_of_dyspnea_now
        (>= dyspnea_score_value_recorded_now_withunit_point 2.0))
     :named REQ1_AUXILIARY0)) ;; "dyspnea as defined by a score ≥ 2 on the 10-point dyspnea numeric scale (Appendix 2)"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_dyspnea_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (dyspnea as defined by a score ≥ 2 on the 10-point dyspnea numeric scale (Appendix 2))."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_increasing_breathlessness_inthepast6months Bool) ;; "worsening dyspnea within the last 6 months per patient reporting" {"when_to_set_to_true":"Set to true if the patient has experienced increasing breathlessness (worsening dyspnea) within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not experienced increasing breathlessness (worsening dyspnea) within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has experienced increasing breathlessness (worsening dyspnea) within the past 6 months.","meaning":"Boolean indicating whether the patient has experienced increasing breathlessness (worsening dyspnea) within the past 6 months."}
(declare-const patient_has_finding_of_increasing_breathlessness_inthepast6months@@per_patient_reporting Bool) ;; "worsening dyspnea within the last 6 months per patient reporting" {"when_to_set_to_true":"Set to true if the finding of increasing breathlessness within the past 6 months is based on patient self-reporting.","when_to_set_to_false":"Set to false if the finding is not based on patient self-reporting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the finding is based on patient self-reporting.","meaning":"Boolean indicating whether the finding of increasing breathlessness within the past 6 months is based on patient self-reporting."}
(declare-const patient_has_finding_of_new_dyspnea_inthepast6months@@per_patient_reporting Bool) ;; "new dyspnea within the last 6 months per patient reporting" {"when_to_set_to_true":"Set to true if the patient has experienced new dyspnea within the past 6 months, and this is based on patient self-reporting.","when_to_set_to_false":"Set to false if the patient has not experienced new dyspnea within the past 6 months, or if it is not based on patient self-reporting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has experienced new dyspnea within the past 6 months based on patient self-reporting.","meaning":"Boolean indicating whether the patient has experienced new dyspnea within the past 6 months, based on patient self-reporting."}

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable for worsening dyspnea
(assert
  (! (=> patient_has_finding_of_increasing_breathlessness_inthepast6months@@per_patient_reporting
         patient_has_finding_of_increasing_breathlessness_inthepast6months)
     :named REQ2_AUXILIARY0)) ;; "worsening dyspnea within the last 6 months per patient reporting"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have ((new dyspnea within the last 6 months per patient reporting) OR (worsening dyspnea within the last 6 months per patient reporting)).
(assert
  (! (or patient_has_finding_of_new_dyspnea_inthepast6months@@per_patient_reporting
         patient_has_finding_of_increasing_breathlessness_inthepast6months@@per_patient_reporting)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have ((new dyspnea within the last 6 months per patient reporting) OR (worsening dyspnea within the last 6 months per patient reporting))."
