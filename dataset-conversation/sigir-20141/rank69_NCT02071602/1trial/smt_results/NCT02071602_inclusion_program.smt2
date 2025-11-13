;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_chest_discomfort_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chest discomfort.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chest discomfort.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of chest discomfort.","meaning":"Boolean indicating whether the patient currently has chest discomfort."}  // "chest discomfort"
(declare-const patient_has_finding_of_chest_discomfort_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chest discomfort is significant in severity.","when_to_set_to_false":"Set to false if the patient's chest discomfort is not significant in severity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chest discomfort is significant in severity.","meaning":"Boolean indicating whether the patient's chest discomfort is significant in severity."}  // "significant chest discomfort"
(declare-const patient_has_finding_of_dyspnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of shortness of breath.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of shortness of breath.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of shortness of breath.","meaning":"Boolean indicating whether the patient currently has shortness of breath."}  // "shortness of breath"
(declare-const patient_has_finding_of_dyspnea_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's shortness of breath is significant in severity.","when_to_set_to_false":"Set to false if the patient's shortness of breath is not significant in severity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's shortness of breath is significant in severity.","meaning":"Boolean indicating whether the patient's shortness of breath is significant in severity."}  // "significant shortness of breath"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable for chest discomfort
(assert
  (! (=> patient_has_finding_of_chest_discomfort_now@@significant
         patient_has_finding_of_chest_discomfort_now)
     :named REQ0_AUXILIARY0)) ;; "significant chest discomfort" implies "chest discomfort"

;; Qualifier variable implies corresponding stem variable for dyspnea
(assert
  (! (=> patient_has_finding_of_dyspnea_now@@significant
         patient_has_finding_of_dyspnea_now)
     :named REQ0_AUXILIARY1)) ;; "significant shortness of breath" implies "shortness of breath"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must (have significant chest discomfort OR have significant shortness of breath).
(assert
  (! (or patient_has_finding_of_chest_discomfort_now@@significant
         patient_has_finding_of_dyspnea_now@@significant)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must (have significant chest discomfort OR have significant shortness of breath)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_st_segment_elevation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of ST segment elevation.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of ST segment elevation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of ST segment elevation.","meaning":"Boolean indicating whether the patient currently has ST segment elevation."}  // "ST segment elevation"
(declare-const patient_has_finding_of_st_segment_elevation_now@@present_in_at_least_2_adjacent_anterior_precordial_leads Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current ST segment elevation is present in at least 2 adjacent anterior precordial leads.","when_to_set_to_false":"Set to false if the patient's current ST segment elevation is not present in at least 2 adjacent anterior precordial leads.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current ST segment elevation is present in at least 2 adjacent anterior precordial leads.","meaning":"Boolean indicating whether the patient's current ST segment elevation is present in at least 2 adjacent anterior precordial leads."}  // "ST segment elevation in ≥ 2 adjacent anterior precordial leads"
(declare-const patient_st_segment_elevation_value_recorded_now_withunit_millivolts Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of total ST segment elevation (in millivolts) recorded now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's total ST segment elevation (in millivolts) recorded now."}  // "total ST segment elevation ≥ 1.5 millivolts"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the stem variable (if ST elevation is present in ≥2 adjacent anterior precordial leads, then ST elevation is present)
(assert
  (! (=> patient_has_finding_of_st_segment_elevation_now@@present_in_at_least_2_adjacent_anterior_precordial_leads
         patient_has_finding_of_st_segment_elevation_now)
     :named REQ1_AUXILIARY0)) ;; "ST segment elevation in ≥ 2 adjacent anterior precordial leads" implies "ST segment elevation"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must have ST segment elevation present in at least 2 adjacent anterior precordial leads AND total ST segment elevation ≥ 1.5 mV
(assert
  (! (and patient_has_finding_of_st_segment_elevation_now@@present_in_at_least_2_adjacent_anterior_precordial_leads
          (>= patient_st_segment_elevation_value_recorded_now_withunit_millivolts 1.5))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "ST segment elevation (total ST segment elevation ≥ 1.5 millivolts) in ≥ 2 adjacent anterior precordial leads"

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_coronary_angiography_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone coronary angiography.","when_to_set_to_false":"Set to false if the patient has never undergone coronary angiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone coronary angiography.","meaning":"Boolean indicating whether the patient has ever undergone coronary angiography."}  // "coronary angiography"
(declare-const patient_has_undergone_thrombolytic_therapy_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone thrombolytic therapy within the past 24 hours.","when_to_set_to_false":"Set to false if the patient has not undergone thrombolytic therapy within the past 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone thrombolytic therapy within the past 24 hours.","meaning":"Boolean indicating whether the patient has undergone thrombolytic therapy within the past 24 hours."}  // "thrombolytic therapy"
(declare-const patient_has_undergone_thrombolytic_therapy_inthepast24hours@@outcome_is_successful_reperfusion_timi_grade_gt_2 Bool) ;; {"when_to_set_to_true":"Set to true if the thrombolytic therapy within the past 24 hours resulted in successful reperfusion (TIMI grade > 2 flow).","when_to_set_to_false":"Set to false if the thrombolytic therapy within the past 24 hours did not result in successful reperfusion (TIMI grade > 2 flow).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the thrombolytic therapy within the past 24 hours resulted in successful reperfusion (TIMI grade > 2 flow).","meaning":"Boolean indicating whether the thrombolytic therapy within the past 24 hours resulted in successful reperfusion (TIMI grade > 2 flow)."}  // "thrombolytic therapy with successful reperfusion"
(declare-const patient_has_undergone_thrombolytic_therapy_inthepast24hours@@documented_by_coronary_angiography Bool) ;; {"when_to_set_to_true":"Set to true if the thrombolytic therapy within the past 24 hours is documented by coronary angiography.","when_to_set_to_false":"Set to false if the thrombolytic therapy within the past 24 hours is not documented by coronary angiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the thrombolytic therapy within the past 24 hours is documented by coronary angiography.","meaning":"Boolean indicating whether the thrombolytic therapy within the past 24 hours is documented by coronary angiography."}  // "thrombolytic therapy documented by coronary angiography"
(declare-const patient_has_undergone_mechanical_revascularization_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone any mechanical form of revascularization (such as stent placement, percutaneous transluminal coronary angioplasty, or thrombectomy) within the past 24 hours.","when_to_set_to_false":"Set to false if the patient has not undergone any mechanical form of revascularization within the past 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone any mechanical form of revascularization within the past 24 hours.","meaning":"Boolean indicating whether the patient has undergone any mechanical form of revascularization within the past 24 hours."}  // "mechanical form of revascularization"
(declare-const patient_has_undergone_mechanical_revascularization_inthepast24hours@@documented_by_coronary_angiography Bool) ;; {"when_to_set_to_true":"Set to true if the mechanical revascularization within the past 24 hours is documented by coronary angiography.","when_to_set_to_false":"Set to false if the mechanical revascularization within the past 24 hours is not documented by coronary angiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the mechanical revascularization within the past 24 hours is documented by coronary angiography.","meaning":"Boolean indicating whether the mechanical revascularization within the past 24 hours is documented by coronary angiography."}  // "mechanical revascularization documented by coronary angiography"
(declare-const patient_has_undergone_mechanical_revascularization_inthepast24hours@@outcome_is_successful_reperfusion_timi_grade_gt_2 Bool) ;; {"when_to_set_to_true":"Set to true if the mechanical revascularization within the past 24 hours resulted in successful reperfusion (TIMI grade > 2 flow).","when_to_set_to_false":"Set to false if the mechanical revascularization within the past 24 hours did not result in successful reperfusion (TIMI grade > 2 flow).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the mechanical revascularization within the past 24 hours resulted in successful reperfusion (TIMI grade > 2 flow).","meaning":"Boolean indicating whether the mechanical revascularization within the past 24 hours resulted in successful reperfusion (TIMI grade > 2 flow)."}  // "mechanical revascularization with successful reperfusion"
(declare-const patient_has_undergone_endovascular_insertion_of_stent_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone endovascular insertion of stent within the past 24 hours.","when_to_set_to_false":"Set to false if the patient has not undergone endovascular insertion of stent within the past 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone endovascular insertion of stent within the past 24 hours.","meaning":"Boolean indicating whether the patient has undergone endovascular insertion of stent within the past 24 hours."}  // "stent placement"
(declare-const patient_has_undergone_coronary_angioplasty_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone percutaneous transluminal coronary angioplasty within the past 24 hours.","when_to_set_to_false":"Set to false if the patient has not undergone percutaneous transluminal coronary angioplasty within the past 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone percutaneous transluminal coronary angioplasty within the past 24 hours.","meaning":"Boolean indicating whether the patient has undergone percutaneous transluminal coronary angioplasty within the past 24 hours."}  // "percutaneous transluminal coronary angioplasty"
(declare-const patient_has_undergone_removal_of_thrombus_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone removal of thrombus within the past 24 hours.","when_to_set_to_false":"Set to false if the patient has not undergone removal of thrombus within the past 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone removal of thrombus within the past 24 hours.","meaning":"Boolean indicating whether the patient has undergone removal of thrombus within the past 24 hours."}  // "thrombectomy"
(declare-const timi_grade_value_recorded_within_24hours_of_onset_of_symptoms_withunit_integer Real) ;; {"when_to_set_to_value":"Set to the integer value of the TIMI grade recorded within 24 hours of onset of symptoms.","when_to_set_to_null":"Set to null if the TIMI grade value within 24 hours of onset of symptoms is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the TIMI grade recorded within 24 hours of onset of symptoms (integer scale)."}  // "TIMI grade value"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply mechanical revascularization
(assert
  (! (=> (or patient_has_undergone_endovascular_insertion_of_stent_inthepast24hours
             patient_has_undergone_coronary_angioplasty_inthepast24hours
             patient_has_undergone_removal_of_thrombus_inthepast24hours)
         patient_has_undergone_mechanical_revascularization_inthepast24hours)
     :named REQ2_AUXILIARY0)) ;; "mechanical form of revascularization (with non-exhaustive examples (stent placement OR percutaneous transluminal coronary angioplasty OR thrombectomy))"

;; Qualifier variables imply corresponding stem variables (mechanical revascularization)
(assert
  (! (=> patient_has_undergone_mechanical_revascularization_inthepast24hours@@documented_by_coronary_angiography
         patient_has_undergone_mechanical_revascularization_inthepast24hours)
     :named REQ2_AUXILIARY1)) ;; "mechanical revascularization documented by coronary angiography"

(assert
  (! (=> patient_has_undergone_mechanical_revascularization_inthepast24hours@@outcome_is_successful_reperfusion_timi_grade_gt_2
         patient_has_undergone_mechanical_revascularization_inthepast24hours)
     :named REQ2_AUXILIARY2)) ;; "mechanical revascularization with successful reperfusion"

;; Qualifier variables imply corresponding stem variables (thrombolytic therapy)
(assert
  (! (=> patient_has_undergone_thrombolytic_therapy_inthepast24hours@@outcome_is_successful_reperfusion_timi_grade_gt_2
         patient_has_undergone_thrombolytic_therapy_inthepast24hours)
     :named REQ2_AUXILIARY3)) ;; "thrombolytic therapy with successful reperfusion"

(assert
  (! (=> patient_has_undergone_thrombolytic_therapy_inthepast24hours@@documented_by_coronary_angiography
         patient_has_undergone_thrombolytic_therapy_inthepast24hours)
     :named REQ2_AUXILIARY4)) ;; "thrombolytic therapy documented by coronary angiography"

;; Successful reperfusion therapy (TIMI grade > 2) with either thrombolytic or mechanical revascularization, documented by coronary angiography, within 24 hours
(define-fun patient_has_received_successful_reperfusion_therapy_within_24hours_documented_by_coronary_angiography () Bool
  (or
    (and patient_has_undergone_thrombolytic_therapy_inthepast24hours
         patient_has_undergone_thrombolytic_therapy_inthepast24hours@@outcome_is_successful_reperfusion_timi_grade_gt_2
         patient_has_undergone_thrombolytic_therapy_inthepast24hours@@documented_by_coronary_angiography)
    (and patient_has_undergone_mechanical_revascularization_inthepast24hours
         patient_has_undergone_mechanical_revascularization_inthepast24hours@@outcome_is_successful_reperfusion_timi_grade_gt_2
         patient_has_undergone_mechanical_revascularization_inthepast24hours@@documented_by_coronary_angiography)
  )
) ;; "received successful reperfusion therapy (Thrombolysis in Myocardial Infarction grade > 2 flow) either with thrombolytic therapy OR with any mechanical form of revascularization ... within 24 hours ... as documented by coronary angiography"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_received_successful_reperfusion_therapy_within_24hours_documented_by_coronary_angiography
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (received successful reperfusion therapy (Thrombolysis in Myocardial Infarction grade > 2 flow) either with thrombolytic therapy OR with any mechanical form of revascularization ... within 24 hours ... as documented by coronary angiography)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_acute_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of acute myocardial infarction at any time in their history.","when_to_set_to_false":"Set to false if the patient does not have a documented diagnosis of acute myocardial infarction at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a diagnosis of acute myocardial infarction in their history.","meaning":"Boolean indicating whether the patient has a diagnosis of acute myocardial infarction in their history."} // "previously known history of acute myocardial infarction (prior to current cardiac event)"
(declare-const patient_has_finding_of_old_acute_myocardial_infarction_on_electrocardiogram_prior_to_current_cardiac_event Bool) ;; {"when_to_set_to_true":"Set to true if the patient has an electrocardiogram performed prior to the current cardiac event that suggests an old acute myocardial infarction (excluding Q wave on presenting electrocardiogram).","when_to_set_to_false":"Set to false if the patient does not have an electrocardiogram performed prior to the current cardiac event that suggests an old acute myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has an electrocardiogram performed prior to the current cardiac event that suggests an old acute myocardial infarction.","meaning":"Boolean indicating whether the patient has an electrocardiogram performed prior to the current cardiac event that suggests an old acute myocardial infarction."} // "previous electrocardiogram (prior to current cardiac event) suggesting an old acute myocardial infarction"
(declare-const patient_has_finding_of_old_acute_myocardial_infarction_on_electrocardiogram_prior_to_current_cardiac_event@@excluding_q_wave_on_presenting_electrocardiogram Bool) ;; {"when_to_set_to_true":"Set to true if the finding of old acute myocardial infarction on electrocardiogram prior to the current cardiac event excludes Q wave on the presenting electrocardiogram as an exclusion.","when_to_set_to_false":"Set to false if the finding of old acute myocardial infarction on electrocardiogram prior to the current cardiac event does not exclude Q wave on the presenting electrocardiogram as an exclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether Q wave on the presenting electrocardiogram is excluded as an exclusion.","meaning":"Boolean indicating whether Q wave on the presenting electrocardiogram is excluded as an exclusion for old acute myocardial infarction on prior electrocardiogram."} // "Q wave on presenting electrocardiogram is NOT an exclusion"
(declare-const patient_has_undergone_electrocardiographic_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone an electrocardiogram at any time in their history.","when_to_set_to_false":"Set to false if the patient has not undergone an electrocardiogram at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone an electrocardiogram in their history.","meaning":"Boolean indicating whether the patient has undergone an electrocardiogram in their history."} // "previous electrocardiogram (prior to current cardiac event)"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_old_acute_myocardial_infarction_on_electrocardiogram_prior_to_current_cardiac_event@@excluding_q_wave_on_presenting_electrocardiogram
         patient_has_finding_of_old_acute_myocardial_infarction_on_electrocardiogram_prior_to_current_cardiac_event)
     :named REQ3_AUXILIARY0)) ;; "Q wave on presenting electrocardiogram is NOT an exclusion"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: To be included, the patient must ((NOT have previously known history of acute myocardial infarction (prior to current cardiac event)) OR (NOT have previous electrocardiogram (prior to current cardiac event) suggesting an old acute myocardial infarction (Q wave on presenting electrocardiogram is NOT an exclusion))).
(assert
  (! (or (not patient_has_diagnosis_of_acute_myocardial_infarction_inthehistory)
         (not patient_has_finding_of_old_acute_myocardial_infarction_on_electrocardiogram_prior_to_current_cardiac_event))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((NOT have previously known history of acute myocardial infarction (prior to current cardiac event)) OR (NOT have previous electrocardiogram (prior to current cardiac event) suggesting an old acute myocardial infarction (Q wave on presenting electrocardiogram is NOT an exclusion)))."
