;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic obstructive pulmonary disease."}  ;; "have a diagnosis of stable moderate chronic obstructive pulmonary disease (as defined by the Global Initiative for Chronic Obstructive Lung Disease guidelines)" and "have a diagnosis of stable severe chronic obstructive pulmonary disease (as defined by the Global Initiative for Chronic Obstructive Lung Disease guidelines)"
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@stable Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of chronic obstructive pulmonary disease is stable.","when_to_set_to_false":"Set to false if the diagnosis of chronic obstructive pulmonary disease is not stable.","when_to_set_to_null":"Set to null if stability of the diagnosis is unknown or indeterminate.","meaning":"Boolean indicating whether the diagnosis of chronic obstructive pulmonary disease is stable."}  ;; "stable"
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@moderate_severity Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of chronic obstructive pulmonary disease is of moderate severity.","when_to_set_to_false":"Set to false if the diagnosis of chronic obstructive pulmonary disease is not of moderate severity.","when_to_set_to_null":"Set to null if severity is unknown or indeterminate.","meaning":"Boolean indicating whether the diagnosis of chronic obstructive pulmonary disease is of moderate severity."}  ;; "moderate"
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@severe_severity Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of chronic obstructive pulmonary disease is of severe severity.","when_to_set_to_false":"Set to false if the diagnosis of chronic obstructive pulmonary disease is not of severe severity.","when_to_set_to_null":"Set to null if severity is unknown or indeterminate.","meaning":"Boolean indicating whether the diagnosis of chronic obstructive pulmonary disease is of severe severity."}  ;; "severe"
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@defined_by_global_initiative_for_chronic_obstructive_lung_disease_guidelines Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of chronic obstructive pulmonary disease is defined by the Global Initiative for Chronic Obstructive Lung Disease guidelines.","when_to_set_to_false":"Set to false if the diagnosis is not defined by these guidelines.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the diagnosis is defined by the guidelines.","meaning":"Boolean indicating whether the diagnosis of chronic obstructive pulmonary disease is defined by the Global Initiative for Chronic Obstructive Lung Disease guidelines."}  ;; "as defined by the Global Initiative for Chronic Obstructive Lung Disease guidelines"
(declare-const patient_forced_expiratory_volume_1_fev1_forced_vital_capacity_fvc_ratio_after_bronchodilator_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a numeric measurement of postbronchodilator FEV1/FVC ratio recorded now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's postbronchodilator FEV1/FVC ratio recorded now."}  ;; "postbronchodilator forced expiratory volume in one second/forced vital capacity ratio < 70 %"
(declare-const patient_fev1_after_bronchodilation_value_recorded_now_withunit_percent_of_predicted Real) ;; {"when_to_set_to_value":"Set to the measured percentage of predicted value if a numeric measurement of postbronchodilator FEV1 recorded now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percentage of predicted value representing the patient's postbronchodilator FEV1 recorded now."}  ;; "postbronchodilator forced expiratory volume in one second ≥ 30 % AND < 80 % of the predicted value"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply the stem variable
(assert
  (! (=> patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@stable
         patient_has_diagnosis_of_chronic_obstructive_lung_disease_now)
     :named REQ0_AUXILIARY0)) ;; "stable"

(assert
  (! (=> patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@moderate_severity
         patient_has_diagnosis_of_chronic_obstructive_lung_disease_now)
     :named REQ0_AUXILIARY1)) ;; "moderate"

(assert
  (! (=> patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@severe_severity
         patient_has_diagnosis_of_chronic_obstructive_lung_disease_now)
     :named REQ0_AUXILIARY2)) ;; "severe"

(assert
  (! (=> patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@defined_by_global_initiative_for_chronic_obstructive_lung_disease_guidelines
         patient_has_diagnosis_of_chronic_obstructive_lung_disease_now)
     :named REQ0_AUXILIARY3)) ;; "as defined by the Global Initiative for Chronic Obstructive Lung Disease guidelines"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: ((stable moderate COPD as defined by GOLD) OR (stable severe COPD as defined by GOLD))
(assert
  (! (or (and patient_has_diagnosis_of_chronic_obstructive_lung_disease_now
              patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@stable
              patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@moderate_severity
              patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@defined_by_global_initiative_for_chronic_obstructive_lung_disease_guidelines)
         (and patient_has_diagnosis_of_chronic_obstructive_lung_disease_now
              patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@stable
              patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@severe_severity
              patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@defined_by_global_initiative_for_chronic_obstructive_lung_disease_guidelines))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "((have a diagnosis of stable moderate chronic obstructive pulmonary disease (as defined by the Global Initiative for Chronic Obstructive Lung Disease guidelines)) OR (have a diagnosis of stable severe chronic obstructive pulmonary disease (as defined by the Global Initiative for Chronic Obstructive Lung Disease guidelines)))"

;; Component 1: postbronchodilator FEV1/FVC ratio < 70%
(assert
  (! (< patient_forced_expiratory_volume_1_fev1_forced_vital_capacity_fvc_ratio_after_bronchodilator_value_recorded_now_withunit_percent 70.0)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "have a postbronchodilator forced expiratory volume in one second/forced vital capacity ratio < 70 %"

;; Component 2: postbronchodilator FEV1 ≥ 30% AND < 80% of predicted
(assert
  (! (and (>= patient_fev1_after_bronchodilation_value_recorded_now_withunit_percent_of_predicted 30.0)
          (< patient_fev1_after_bronchodilation_value_recorded_now_withunit_percent_of_predicted 80.0))
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "have a postbronchodilator forced expiratory volume in one second ≥ 30 % AND < 80 % of the predicted value"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_cigarette_pack_years_value_recorded_inthehistory_withunit_pack_years Real) ;; {"when_to_set_to_value":"Set to the total number of cigarette pack-years if the patient's cumulative smoking history is available.","when_to_set_to_null":"Set to null if the patient's cumulative cigarette pack-years is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total number of cigarette pack-years in the patient's smoking history."}  ;; "have a smoking history of ≥ 10 pack-years"
(declare-const patient_has_finding_of_cigarette_smoker_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of being a cigarette smoker (was a cigarette smoker at any time in the past, but is not currently smoking).","when_to_set_to_false":"Set to false if the patient has never been a cigarette smoker or is currently a cigarette smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of being a cigarette smoker.","meaning":"Boolean indicating whether the patient has a history of being a cigarette smoker."}  ;; "be a former cigarette smoker"
(declare-const patient_has_finding_of_cigarette_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a cigarette smoker (actively smokes cigarettes now).","when_to_set_to_false":"Set to false if the patient is not currently a cigarette smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a cigarette smoker.","meaning":"Boolean indicating whether the patient is currently a cigarette smoker."}  ;; "be a current cigarette smoker"

;; ===================== Constraint Assertions (REQ 1) =====================
;; To be included, the patient must ((be a current cigarette smoker) OR (be a former cigarette smoker AND have a smoking history of ≥ 10 pack-years)).
(assert
  (! (or patient_has_finding_of_cigarette_smoker_now
         (and patient_has_finding_of_cigarette_smoker_inthehistory
              (>= patient_cigarette_pack_years_value_recorded_inthehistory_withunit_pack_years 10.0)))
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))
