;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute ST segment elevation myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute ST segment elevation myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute ST segment elevation myocardial infarction.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute ST segment elevation myocardial infarction."} // "To be included, the patient must have high risk ST elevation myocardial infarction"
(declare-const patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_now@@high_risk Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute ST segment elevation myocardial infarction and the STEMI is high risk.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of acute ST segment elevation myocardial infarction but the STEMI is not high risk.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the STEMI is high risk.","meaning":"Boolean indicating whether the patient's STEMI is high risk."} // "high risk ST elevation myocardial infarction"
(declare-const patient_st_elevation_value_recorded_now_withunit_millimeters Real) ;; {"when_to_set_to_value":"Set to the measured value if ST elevation (in millimeters) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's ST elevation in millimeters recorded now."} // "ST elevation ≥ 2 millimeters"
(declare-const patient_st_elevation_value_recorded_now_withunit_millimeters@@in_anterior_leads Bool) ;; {"when_to_set_to_true":"Set to true if the ST elevation measurement is from anterior leads.","when_to_set_to_false":"Set to false if the ST elevation measurement is not from anterior leads.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement is from anterior leads.","meaning":"Boolean indicating whether the ST elevation measurement is from anterior leads."} // "in ≥ 2 anterior leads"
(declare-const patient_st_elevation_value_recorded_now_withunit_millimeters@@in_lateral_leads Bool) ;; {"when_to_set_to_true":"Set to true if the ST elevation measurement is from lateral leads.","when_to_set_to_false":"Set to false if the ST elevation measurement is not from lateral leads.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement is from lateral leads.","meaning":"Boolean indicating whether the ST elevation measurement is from lateral leads."} // "in ≥ 2 lateral leads"
(declare-const patient_st_elevation_value_recorded_now_withunit_millimeters@@in_inferior_leads Bool) ;; {"when_to_set_to_true":"Set to true if the ST elevation measurement is from inferior leads.","when_to_set_to_false":"Set to false if the ST elevation measurement is not from inferior leads.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement is from inferior leads.","meaning":"Boolean indicating whether the ST elevation measurement is from inferior leads."} // "in ≥ 2 inferior leads"
(declare-const patient_st_elevation_value_recorded_now_withunit_millimeters@@concordant Bool) ;; {"when_to_set_to_true":"Set to true if the ST elevation measurement is concordant with the QRS complex.","when_to_set_to_false":"Set to false if the ST elevation measurement is not concordant with the QRS complex.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement is concordant.","meaning":"Boolean indicating whether the ST elevation measurement is concordant with the QRS complex."} // "concordant ST elevation"
(declare-const patient_has_finding_of_left_bundle_branch_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of left bundle branch block.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of left bundle branch block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of left bundle branch block.","meaning":"Boolean indicating whether the patient currently has a finding of left bundle branch block."} // "left bundle branch block"
(declare-const patient_has_finding_of_left_bundle_branch_block_now@@new Bool) ;; {"when_to_set_to_true":"Set to true if the left bundle branch block is new.","when_to_set_to_false":"Set to false if the left bundle branch block is not new.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the block is new.","meaning":"Boolean indicating whether the left bundle branch block is new."} // "new left bundle branch block"
(declare-const patient_has_finding_of_st_segment_depression_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of ST segment depression.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of ST segment depression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of ST segment depression.","meaning":"Boolean indicating whether the patient currently has a finding of ST segment depression."} // "ST depression"
(declare-const patient_has_finding_of_st_segment_depression_now@@in_contiguous_anterior_leads Bool) ;; {"when_to_set_to_true":"Set to true if the ST segment depression finding is in contiguous anterior leads.","when_to_set_to_false":"Set to false if the ST segment depression finding is not in contiguous anterior leads.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the finding is in contiguous anterior leads.","meaning":"Boolean indicating whether the ST segment depression finding is in contiguous anterior leads."} // "in ≥ 2 contiguous anterior leads"
(declare-const patient_total_st_deviation_value_recorded_now_withunit_millimeters Real) ;; {"when_to_set_to_value":"Set to the measured value if total ST deviation in millimeters is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's total ST deviation in millimeters recorded now."} // "total ST deviation ≥ 8 millimeters"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_now@@high_risk
         patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_now)
     :named REQ0_AUXILIARY0)) ;; "high risk STEMI implies STEMI"

(assert
  (! (=> patient_has_finding_of_left_bundle_branch_block_now@@new
         patient_has_finding_of_left_bundle_branch_block_now)
     :named REQ0_AUXILIARY1)) ;; "new LBBB implies LBBB"

(assert
  (! (=> patient_has_finding_of_st_segment_depression_now@@in_contiguous_anterior_leads
         patient_has_finding_of_st_segment_depression_now)
     :named REQ0_AUXILIARY2)) ;; "ST depression in contiguous anterior leads implies ST depression"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Evidence for high risk STEMI: at least one of the following
;; (1) ST elevation ≥ 2 mm in ≥ 2 anterior leads
;; (2) ST elevation ≥ 2 mm in ≥ 2 lateral leads
;; (3) (ST elevation ≥ 2 mm in ≥ 2 inferior leads) AND (ST depression in ≥ 2 contiguous anterior leads) AND (total ST deviation ≥ 8 mm)
;; (4) new left bundle branch block with concordant ST elevation ≥ 1 mm

(assert
  (! (=
        patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_now@@high_risk
        (or
          ;; (1) ST elevation ≥ 2 mm in ≥ 2 anterior leads
          (and (>= patient_st_elevation_value_recorded_now_withunit_millimeters 2.0)
               patient_st_elevation_value_recorded_now_withunit_millimeters@@in_anterior_leads)
          ;; (2) ST elevation ≥ 2 mm in ≥ 2 lateral leads
          (and (>= patient_st_elevation_value_recorded_now_withunit_millimeters 2.0)
               patient_st_elevation_value_recorded_now_withunit_millimeters@@in_lateral_leads)
          ;; (3) ST elevation ≥ 2 mm in ≥ 2 inferior leads AND ST depression in ≥ 2 contiguous anterior leads AND total ST deviation ≥ 8 mm
          (and (>= patient_st_elevation_value_recorded_now_withunit_millimeters 2.0)
               patient_st_elevation_value_recorded_now_withunit_millimeters@@in_inferior_leads
               patient_has_finding_of_st_segment_depression_now@@in_contiguous_anterior_leads
               (>= patient_total_st_deviation_value_recorded_now_withunit_millimeters 8.0))
          ;; (4) new left bundle branch block with concordant ST elevation ≥ 1 mm
          (and patient_has_finding_of_left_bundle_branch_block_now@@new
               patient_st_elevation_value_recorded_now_withunit_millimeters@@concordant
               (>= patient_st_elevation_value_recorded_now_withunit_millimeters 1.0))
        )
     )
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have high risk ST elevation myocardial infarction (with evidence by at least one of the following...)"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_coronary_artery_stenosis_percent_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percent value if a coronary artery stenosis percent is recorded now by visual assessment.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the percent stenosis of a coronary artery recorded now, as assessed by visual assessment."} // "stenosis ≥ 70 percent by visual assessment" and "stenosis between 50 percent and 70 percent"
(declare-const patient_coronary_artery_stenosis_percent_value_recorded_now_withunit_percent@@present_in_non_infarct_related_coronary_artery Bool) ;; {"when_to_set_to_true":"Set to true if the percent stenosis measurement is for a non-infarct related coronary artery.","when_to_set_to_false":"Set to false if the percent stenosis measurement is not for a non-infarct related coronary artery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the percent stenosis measurement is for a non-infarct related coronary artery.","meaning":"Boolean indicating whether the percent stenosis measurement is for a non-infarct related coronary artery."} // "in a non-infarct related coronary artery"
(declare-const patient_fractional_flow_reserve_value_recorded_now_withunit_none Real) ;; {"when_to_set_to_value":"Set to the measured value if a fractional flow reserve measurement recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's fractional flow reserve recorded now."} // "fractional flow reserve < 0.80"
(declare-const patient_has_diagnosis_of_multi_vessel_coronary_artery_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of multivessel coronary artery disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of multivessel coronary artery disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of multivessel coronary artery disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of multivessel coronary artery disease."} // "multivessel coronary artery disease"
(declare-const patient_has_finding_of_coronary_artery_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of coronary artery stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of coronary artery stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of coronary artery stenosis.","meaning":"Boolean indicating whether the patient currently has a finding of coronary artery stenosis."} // "coronary artery stenosis"
(declare-const patient_has_finding_of_coronary_artery_stenosis_now@@assessed_by_visual_assessment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's coronary artery stenosis finding is assessed by visual assessment.","when_to_set_to_false":"Set to false if the patient's coronary artery stenosis finding is not assessed by visual assessment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the coronary artery stenosis finding is assessed by visual assessment.","meaning":"Boolean indicating whether the patient's coronary artery stenosis finding is assessed by visual assessment."} // "by visual assessment"
(declare-const patient_has_finding_of_coronary_artery_stenosis_now@@present_in_non_infarct_related_coronary_artery Bool) ;; {"when_to_set_to_true":"Set to true if the patient's coronary artery stenosis finding is present in a non-infarct related coronary artery.","when_to_set_to_false":"Set to false if the patient's coronary artery stenosis finding is not present in a non-infarct related coronary artery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the coronary artery stenosis finding is present in a non-infarct related coronary artery.","meaning":"Boolean indicating whether the patient's coronary artery stenosis finding is present in a non-infarct related coronary artery."} // "in a non-infarct related coronary artery"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_coronary_artery_stenosis_now@@assessed_by_visual_assessment
         patient_has_finding_of_coronary_artery_stenosis_now)
     :named REQ1_AUXILIARY0)) ;; "assessed by visual assessment" implies "coronary artery stenosis"

(assert
  (! (=> patient_has_finding_of_coronary_artery_stenosis_now@@present_in_non_infarct_related_coronary_artery
         patient_has_finding_of_coronary_artery_stenosis_now)
     :named REQ1_AUXILIARY1)) ;; "present in non-infarct related coronary artery" implies "coronary artery stenosis"

;; Qualifier variable for percent stenosis measurement
(assert
  (! (=> patient_coronary_artery_stenosis_percent_value_recorded_now_withunit_percent@@present_in_non_infarct_related_coronary_artery
         patient_has_finding_of_coronary_artery_stenosis_now)
     :named REQ1_AUXILIARY2)) ;; "percent stenosis in non-infarct related coronary artery" implies "coronary artery stenosis"

;; Definition: significant coronary artery stenosis in a non-infarct related coronary artery
(define-fun patient_has_significant_coronary_artery_stenosis_in_non_infarct_related_coronary_artery_now () Bool
  (or
    ;; (stenosis ≥ 70% by visual assessment in non-infarct related coronary artery)
    (and patient_has_finding_of_coronary_artery_stenosis_now@@assessed_by_visual_assessment
         patient_has_finding_of_coronary_artery_stenosis_now@@present_in_non_infarct_related_coronary_artery
         (>= patient_coronary_artery_stenosis_percent_value_recorded_now_withunit_percent 70.0)
         patient_coronary_artery_stenosis_percent_value_recorded_now_withunit_percent@@present_in_non_infarct_related_coronary_artery)
    ;; (stenosis between 50% and 70% AND FFR < 0.80 in non-infarct related coronary artery)
    (and patient_has_finding_of_coronary_artery_stenosis_now@@assessed_by_visual_assessment
         patient_has_finding_of_coronary_artery_stenosis_now@@present_in_non_infarct_related_coronary_artery
         (>= patient_coronary_artery_stenosis_percent_value_recorded_now_withunit_percent 50.0)
         (< patient_coronary_artery_stenosis_percent_value_recorded_now_withunit_percent 70.0)
         patient_coronary_artery_stenosis_percent_value_recorded_now_withunit_percent@@present_in_non_infarct_related_coronary_artery
         (< patient_fractional_flow_reserve_value_recorded_now_withunit_none 0.80)))
) ;; "significant coronary artery stenosis (defined as stenosis ≥ 70 percent by visual assessment) OR (stenosis between 50 percent and 70 percent AND fractional flow reserve < 0.80) in a non-infarct related coronary artery"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (and patient_has_diagnosis_of_multi_vessel_coronary_artery_disease_now
          patient_has_significant_coronary_artery_stenosis_in_non_infarct_related_coronary_artery_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have multivessel coronary artery disease (with evidence by at least one significant coronary artery stenosis ... in a non-infarct related coronary artery)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_successful_infarct_related_artery_percutaneous_coronary_intervention_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a successful infarct related artery PCI, defined as both residual angiographic stenosis less than 10 percent and thrombolysis in myocardial infarction (TIMI) grade III flow achieved.","when_to_set_to_false":"Set to false if the patient has had an infarct related artery PCI but it was not successful (i.e., either residual angiographic stenosis is 10 percent or greater, or TIMI flow is less than grade III).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a successful infarct related artery PCI.","meaning":"Boolean indicating whether the patient has had a successful infarct related artery PCI, defined by both residual stenosis < 10% and TIMI grade III flow."} // "successful infarct related artery percutaneous coronary intervention (defined as residual angiographic stenosis < 10 percent AND thrombolysis in myocardial infarction grade III flow)"
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone percutaneous coronary intervention (PCI) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone percutaneous coronary intervention (PCI) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone percutaneous coronary intervention (PCI).","meaning":"Boolean indicating whether the patient has ever undergone percutaneous coronary intervention (PCI) in the past."} // "percutaneous coronary intervention"
(declare-const residual_angiographic_stenosis_value_recorded_post_percutaneous_coronary_intervention_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the percent value of residual angiographic stenosis measured after PCI.","when_to_set_to_null":"Set to null if the percent value of residual angiographic stenosis after PCI is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the percent of residual angiographic stenosis after PCI."} // "residual angiographic stenosis < 10 percent"
(declare-const thrombolysis_in_myocardial_infarction_flow_grade_value_recorded_post_percutaneous_coronary_intervention Real) ;; {"when_to_set_to_value":"Set to the TIMI flow grade (integer value, typically 0-3) measured after PCI.","when_to_set_to_null":"Set to null if the TIMI flow grade after PCI is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the TIMI flow grade after PCI."} // "thrombolysis in myocardial infarction grade III flow"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition in the requirement: successful PCI is defined as both residual stenosis < 10% AND TIMI grade III flow
(assert
  (! (= patient_has_successful_infarct_related_artery_percutaneous_coronary_intervention_now
        (and
          (< residual_angiographic_stenosis_value_recorded_post_percutaneous_coronary_intervention_withunit_percent 10.0)
          (= thrombolysis_in_myocardial_infarction_flow_grade_value_recorded_post_percutaneous_coronary_intervention 3.0)))
     :named REQ2_AUXILIARY0)) ;; "successful infarct related artery percutaneous coronary intervention (defined as residual angiographic stenosis < 10 percent AND thrombolysis in myocardial infarction grade III flow)"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: patient must have had successful infarct related artery PCI
(assert
  (! patient_has_successful_infarct_related_artery_percutaneous_coronary_intervention_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_provided_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent.","meaning":"Boolean indicating whether the patient has provided written informed consent."} // "To be included, the patient must have provided written informed consent."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_provided_written_informed_consent
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have provided written informed consent."
