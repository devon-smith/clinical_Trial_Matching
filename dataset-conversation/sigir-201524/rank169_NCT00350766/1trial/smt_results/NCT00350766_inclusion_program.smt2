;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute ST segment elevation myocardial infarction (STEMI).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute ST segment elevation myocardial infarction (STEMI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute ST segment elevation myocardial infarction (STEMI).","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute ST segment elevation myocardial infarction (STEMI)."} ;; "ST segment elevation myocardial infarction"
(declare-const patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_now@@st_elevation_in_at_least_2_contiguous_leads Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute ST segment elevation myocardial infarction (STEMI) and the ST elevation is present in at least 2 contiguous leads.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of acute ST segment elevation myocardial infarction (STEMI) but the ST elevation is not present in at least 2 contiguous leads.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ST elevation is present in at least 2 contiguous leads in the context of STEMI.","meaning":"Boolean indicating whether the patient's STEMI diagnosis is accompanied by ST elevation in at least 2 contiguous leads."} ;; "ST segment elevation myocardial infarction in ≥ 2 contiguous leads"
(declare-const patient_has_finding_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chest pain.","meaning":"Boolean indicating whether the patient currently has chest pain."} ;; "presence of chest pain"
(declare-const patient_has_finding_of_chest_pain_now@@per_world_health_organization_definition Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chest pain and the presence of chest pain is defined according to the World Health Organization definition.","when_to_set_to_false":"Set to false if the patient currently has chest pain but the presence is not defined according to the World Health Organization definition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the presence of chest pain is defined according to the World Health Organization definition.","meaning":"Boolean indicating whether the patient's chest pain is defined according to the World Health Organization definition."} ;; "presence of chest pain per WHO definition"
(declare-const myonecrosis_marker_level_value_now_in_ng_per_ml Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current myonecrosis marker level in ng/mL if available.","when_to_set_to_null":"Set to null if the patient's current myonecrosis marker level in ng/mL is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current myonecrosis marker level in ng/mL."} ;; "elevation of myonecrosis marker levels"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable (STEMI in ≥2 contiguous leads implies STEMI)
(assert
  (! (=> patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_now@@st_elevation_in_at_least_2_contiguous_leads
         patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_now)
     :named REQ0_AUXILIARY0)) ;; "ST segment elevation myocardial infarction in ≥ 2 contiguous leads"

;; Qualifier variable implies corresponding stem variable (chest pain per WHO definition implies chest pain)
(assert
  (! (=> patient_has_finding_of_chest_pain_now@@per_world_health_organization_definition
         patient_has_finding_of_chest_pain_now)
     :named REQ0_AUXILIARY1)) ;; "presence of chest pain per WHO definition"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: STEMI in ≥2 contiguous leads
(assert
  (! patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_now@@st_elevation_in_at_least_2_contiguous_leads
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "ST segment elevation myocardial infarction in ≥ 2 contiguous leads"

;; Component 1: WHO definition requires at least one of (chest pain per WHO definition OR elevated myonecrosis marker levels)
;; For "elevation of myonecrosis marker levels", we need a threshold. Since the requirement does not specify, we must leave the threshold open for downstream configuration.
(declare-const myonecrosis_marker_elevation_threshold_in_ng_per_ml Real) ;; {"when_to_set_to_value":"Set to the numeric threshold value for myonecrosis marker elevation in ng/mL as defined by the World Health Organization or study protocol.","when_to_set_to_null":"Set to null if the threshold is unknown, not documented, or cannot be determined.","meaning":"Threshold value for myonecrosis marker elevation in ng/mL per WHO definition."} ;; "elevation of myonecrosis marker levels per WHO definition"

(assert
  (! (or patient_has_finding_of_chest_pain_now@@per_world_health_organization_definition
         (> myonecrosis_marker_level_value_now_in_ng_per_ml myonecrosis_marker_elevation_threshold_in_ng_per_ml))
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "at least one of the following two: (presence of chest pain) OR (elevation of myonecrosis marker levels) per WHO definition"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged ≥ 30 years old AND aged ≤ 80 years old"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must be aged ≥ 30 years old.
(assert
  (! (>= patient_age_value_recorded_now_in_years 30)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "aged ≥ 30 years old"

;; Component 1: To be included, the patient must be aged ≤ 80 years old.
(assert
  (! (<= patient_age_value_recorded_now_in_years 80)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "aged ≤ 80 years old"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_cardiac_ejection_fraction_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percent value if a cardiac ejection fraction measurement by echocardiogram (Simpson method) is available for the patient now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percent value representing the patient's current cardiac ejection fraction."} ;; "ejection fraction ≤ 50 percent on echocardiogram (Simpson method)"
(declare-const patient_cardiac_ejection_fraction_value_recorded_now_withunit_percent@@measured_by_echocardiogram_simpson_method Bool) ;; {"when_to_set_to_true":"Set to true if the cardiac ejection fraction measurement was performed by echocardiogram using the Simpson method.","when_to_set_to_false":"Set to false if the measurement was not performed by echocardiogram using the Simpson method.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was performed by echocardiogram using the Simpson method.","meaning":"Boolean indicating whether the cardiac ejection fraction measurement was performed by echocardiogram using the Simpson method."} ;; "ejection fraction ≤ 50 percent on echocardiogram (Simpson method)"
(declare-const patient_has_finding_of_segmental_dysfunction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has segmental dysfunction in the infarction area.","when_to_set_to_false":"Set to false if the patient currently does not have segmental dysfunction in the infarction area.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has segmental dysfunction in the infarction area.","meaning":"Boolean indicating whether the patient currently has segmental dysfunction in the infarction area."} ;; "segmentary dysfunction of the infarction area"
(declare-const patient_has_finding_of_segmental_dysfunction_now@@temporalcontext_within_3_to_5_days_after_acute_myocardial_infarction Bool) ;; {"when_to_set_to_true":"Set to true if the segmental dysfunction finding was measured between the third and fifth day after acute myocardial infarction.","when_to_set_to_false":"Set to false if the finding was not measured in this time window.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the finding was measured in this time window.","meaning":"Boolean indicating whether the segmental dysfunction finding was measured between the third and fifth day after acute myocardial infarction."} ;; "segmentary dysfunction of the infarction area, measured between the third day and the fifth day after acute myocardial infarction"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for ejection fraction measurement implies the measurement exists
(assert
  (! (=> patient_cardiac_ejection_fraction_value_recorded_now_withunit_percent@@measured_by_echocardiogram_simpson_method
         true)
     :named REQ2_AUXILIARY0)) ;; "ejection fraction measured by echocardiogram (Simpson method)"

;; Qualifier variable for segmental dysfunction implies the stem variable
(assert
  (! (=> patient_has_finding_of_segmental_dysfunction_now@@temporalcontext_within_3_to_5_days_after_acute_myocardial_infarction
         patient_has_finding_of_segmental_dysfunction_now)
     :named REQ2_AUXILIARY1)) ;; "segmentary dysfunction of the infarction area, measured between the third day and the fifth day after acute myocardial infarction"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: ejection fraction ≤ 50 percent on echocardiogram (Simpson method)
(assert
  (! (and patient_cardiac_ejection_fraction_value_recorded_now_withunit_percent@@measured_by_echocardiogram_simpson_method
          (<= patient_cardiac_ejection_fraction_value_recorded_now_withunit_percent 50.0))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "ejection fraction ≤ 50 percent on echocardiogram (Simpson method)"

;; Component 1: segmentary dysfunction of the infarction area, measured between the third day and the fifth day after acute myocardial infarction
(assert
  (! patient_has_finding_of_segmental_dysfunction_now@@temporalcontext_within_3_to_5_days_after_acute_myocardial_infarction
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "segmentary dysfunction of the infarction area, measured between the third day and the fifth day after acute myocardial infarction"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const angioplasty_time_since_thrombolysis_value_recorded_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours between the completion of thrombolytic therapy and the performance of angioplasty of the related artery.","when_to_set_to_null":"Set to null if the time elapsed between thrombolytic therapy and angioplasty is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of hours elapsed between thrombolytic therapy and angioplasty of the related artery."} ;; "angioplasty of the related artery should be preferably done up to 24 hours after thrombolysis, with a maximum deadline of 72 hours after thrombolysis"
(declare-const patient_has_undergone_thrombolytic_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone thrombolytic therapy in the past.","when_to_set_to_false":"Set to false if the patient has never undergone thrombolytic therapy in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone thrombolytic therapy in the past.","meaning":"Boolean indicating whether the patient has ever undergone thrombolytic therapy in the past."} ;; "if the patient was submitted to thrombolytic therapy"

;; ===================== Constraint Assertions (REQ 3) =====================
;; If the patient was submitted to thrombolytic therapy, angioplasty of the related artery must be done within 72 hours after thrombolysis (maximum deadline).
(assert
  (! (or (not patient_has_undergone_thrombolytic_therapy_inthehistory)
         (and (>= angioplasty_time_since_thrombolysis_value_recorded_in_hours 0)
              (<= angioplasty_time_since_thrombolysis_value_recorded_in_hours 72)))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient was submitted to thrombolytic therapy, angioplasty of the related artery should be preferably done up to 24 hours after thrombolysis, with a maximum deadline of 72 hours after thrombolysis"
