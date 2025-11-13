;; ===================== Declarations for the inclusion criteria (REQ 0) =====================
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of myocardial infarction at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of myocardial infarction at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of myocardial infarction.","meaning":"Boolean indicating whether the patient has a history of myocardial infarction."} // "have a history of myocardial infarction"
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory@@temporalcontext_within_12_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of myocardial infarction occurred within the prior 12 months.","when_to_set_to_false":"Set to false if the patient's history of myocardial infarction did not occur within the prior 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the myocardial infarction occurred within the prior 12 months.","meaning":"Boolean indicating whether the patient's history of myocardial infarction occurred within the prior 12 months."} // "within the prior 12 months"
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory@@due_to_coronary_artery_event Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of myocardial infarction was due to a coronary artery event.","when_to_set_to_false":"Set to false if the patient's history of myocardial infarction was not due to a coronary artery event.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the myocardial infarction was due to a coronary artery event.","meaning":"Boolean indicating whether the patient's history of myocardial infarction was due to a coronary artery event."} // "due to a coronary artery event"
(declare-const patient_has_diagnosis_of_st_segment_elevation_myocardial_infarction_inthehistory@@temporalcontext_within_12_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of ST-segment elevation myocardial infarction within the prior 12 months.","when_to_set_to_false":"Set to false if the patient does not have a history of ST-segment elevation myocardial infarction within the prior 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of ST-segment elevation myocardial infarction within the prior 12 months.","meaning":"Boolean indicating whether the patient has a history of ST-segment elevation myocardial infarction within the prior 12 months."} // "ST-segment elevation myocardial infarction within the prior 12 months"
(declare-const patient_has_diagnosis_of_non_st_segment_elevation_myocardial_infarction_inthehistory@@temporalcontext_within_12_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of non-ST-segment elevation myocardial infarction within the prior 12 months.","when_to_set_to_false":"Set to false if the patient does not have a history of non-ST-segment elevation myocardial infarction within the prior 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of non-ST-segment elevation myocardial infarction within the prior 12 months.","meaning":"Boolean indicating whether the patient has a history of non-ST-segment elevation myocardial infarction within the prior 12 months."} // "non-ST-segment elevation myocardial infarction within the prior 12 months"
(declare-const patient_has_finding_of_ischemic_symptoms_within_12_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had typical ischemic symptoms within the prior 12 months.","when_to_set_to_false":"Set to false if the patient has not had typical ischemic symptoms within the prior 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had typical ischemic symptoms within the prior 12 months.","meaning":"Boolean indicating whether the patient has had typical ischemic symptoms within the prior 12 months."} // "typical ischemic symptoms within the prior 12 months"
(declare-const patient_has_finding_of_serial_st_t_changes_within_12_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had serial ST-T changes within the prior 12 months.","when_to_set_to_false":"Set to false if the patient has not had serial ST-T changes within the prior 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had serial ST-T changes within the prior 12 months.","meaning":"Boolean indicating whether the patient has had serial ST-T changes within the prior 12 months."} // "serial ST-T changes within the prior 12 months"
(declare-const patient_has_finding_of_serial_st_t_changes_within_12_months@@new_st_elevation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's serial ST-T changes within the prior 12 months include new ST elevation.","when_to_set_to_false":"Set to false if the patient's serial ST-T changes within the prior 12 months do not include new ST elevation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's serial ST-T changes within the prior 12 months include new ST elevation.","meaning":"Boolean indicating whether the patient's serial ST-T changes within the prior 12 months include new ST elevation."} // "new ST elevation"
(declare-const patient_has_finding_of_serial_st_t_changes_within_12_months@@new_left_bundle_branch_block Bool) ;; {"when_to_set_to_true":"Set to true if the patient's serial ST-T changes within the prior 12 months include new left bundle branch block.","when_to_set_to_false":"Set to false if the patient's serial ST-T changes within the prior 12 months do not include new left bundle branch block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's serial ST-T changes within the prior 12 months include new left bundle branch block.","meaning":"Boolean indicating whether the patient's serial ST-T changes within the prior 12 months include new left bundle branch block."} // "new left bundle branch block"
(declare-const troponin_concentration_value_recorded_within_12_months_withunit_ng_per_ml Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's troponin concentration recorded within the prior 12 months, in ng/mL.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's troponin concentration recorded within the prior 12 months, in ng/mL."} // "elevated troponin concentration"
(declare-const creatine_kinase_mb_concentration_value_recorded_within_12_months_withunit_ng_per_ml Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's creatine kinase MB concentration recorded within the prior 12 months, in ng/mL.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's creatine kinase MB concentration recorded within the prior 12 months, in ng/mL."} // "elevated creatine kinase MB concentration"
(declare-const creatine_kinase_mb_upper_limit_of_normal_value_withunit_ng_per_ml Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the upper limit of normal for creatine kinase MB concentration, in ng/mL.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the upper limit of normal for creatine kinase MB concentration, in ng/mL."} // "greater than 5 times the upper limit of normal"
(declare-const patient_has_finding_of_pathological_q_wave_ecg_changes_within_12_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has developed pathological Q wave electrocardiogram changes within the prior 12 months.","when_to_set_to_false":"Set to false if the patient has not developed pathological Q wave electrocardiogram changes within the prior 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has developed pathological Q wave electrocardiogram changes within the prior 12 months.","meaning":"Boolean indicating whether the patient has developed pathological Q wave electrocardiogram changes within the prior 12 months."} // "development of pathological Q wave electrocardiogram changes"
(declare-const patient_has_finding_of_imaging_evidence_of_new_loss_of_viable_myocardium_within_12_months Bool) ;; {"when_to_set_to_true":"Set to true if imaging evidence of new loss of viable myocardium has been found within the prior 12 months.","when_to_set_to_false":"Set to false if imaging evidence of new loss of viable myocardium has not been found within the prior 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether imaging evidence of new loss of viable myocardium has been found within the prior 12 months.","meaning":"Boolean indicating whether imaging evidence of new loss of viable myocardium has been found within the prior 12 months."} // "imaging evidence of new loss of viable myocardium"
(declare-const patient_has_finding_of_new_regional_wall_motion_abnormalities_within_12_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has developed new regional wall motion abnormalities within the prior 12 months.","when_to_set_to_false":"Set to false if the patient has not developed new regional wall motion abnormalities within the prior 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has developed new regional wall motion abnormalities within the prior 12 months.","meaning":"Boolean indicating whether the patient has developed new regional wall motion abnormalities within the prior 12 months."} // "new regional wall motion abnormalities"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Exhaustive subcategories for myocardial infarction
(assert
  (! (= patient_has_diagnosis_of_myocardial_infarction_inthehistory@@temporalcontext_within_12_months
        (or patient_has_diagnosis_of_st_segment_elevation_myocardial_infarction_inthehistory@@temporalcontext_within_12_months
            patient_has_diagnosis_of_non_st_segment_elevation_myocardial_infarction_inthehistory@@temporalcontext_within_12_months))
     :named REQ0_AUXILIARY0)) ;; "with exhaustive subcategories (ST-segment elevation myocardial infarction OR non-ST-segment elevation myocardial infarction) within the prior 12 months"

;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_myocardial_infarction_inthehistory@@temporalcontext_within_12_months
         patient_has_diagnosis_of_myocardial_infarction_inthehistory)
     :named REQ0_AUXILIARY1)) ;; "history of myocardial infarction within the prior 12 months"

(assert
  (! (=> patient_has_diagnosis_of_myocardial_infarction_inthehistory@@due_to_coronary_artery_event
         patient_has_diagnosis_of_myocardial_infarction_inthehistory)
     :named REQ0_AUXILIARY2)) ;; "history of myocardial infarction due to a coronary artery event"

;; Exhaustive subcategories for serial ST-T changes
(assert
  (! (= patient_has_finding_of_serial_st_t_changes_within_12_months
        (or patient_has_finding_of_serial_st_t_changes_within_12_months@@new_st_elevation
            patient_has_finding_of_serial_st_t_changes_within_12_months@@new_left_bundle_branch_block))
     :named REQ0_AUXILIARY3)) ;; "serial ST-T changes (with exhaustive subcategories (new ST elevation OR new left bundle branch block))"

;; Definition for elevated creatine kinase MB concentration
(define-fun patient_has_elevated_creatine_kinase_mb_concentration_within_12_months () Bool
  (> creatine_kinase_mb_concentration_value_recorded_within_12_months_withunit_ng_per_ml
     (* 5.0 creatine_kinase_mb_upper_limit_of_normal_value_withunit_ng_per_ml))) ;; "elevated creatine kinase MB concentration greater than 5 times the upper limit of normal"

;; Definition for elevated troponin concentration (threshold not specified, so presence of value is considered elevated)
(define-fun patient_has_elevated_troponin_concentration_within_12_months () Bool
  (> troponin_concentration_value_recorded_within_12_months_withunit_ng_per_ml 0.0)) ;; "elevated troponin concentration"

;; Evidence list for myocardial infarction (at least two of four)
(define-fun mi_evidence_count () Int
  (+ (ite patient_has_finding_of_ischemic_symptoms_within_12_months 1 0)
     (ite patient_has_finding_of_serial_st_t_changes_within_12_months 1 0)
     (ite patient_has_elevated_troponin_concentration_within_12_months 1 0)
     (ite patient_has_elevated_creatine_kinase_mb_concentration_within_12_months 1 0))) ;; "evidenced by at least two of the following"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: History of MI (STEMI or NSTEMI) within 12 months, due to coronary artery event, AND at least two evidences
(assert
  (! (and patient_has_diagnosis_of_myocardial_infarction_inthehistory@@temporalcontext_within_12_months
          patient_has_diagnosis_of_myocardial_infarction_inthehistory@@due_to_coronary_artery_event
          (>= mi_evidence_count 2))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a history of myocardial infarction (with exhaustive subcategories...) within the prior 12 months due to a coronary artery event AND be evidenced by at least two of the following..."

;; Component 1: At least one of the following: pathological Q wave ECG changes, imaging evidence of new loss of viable myocardium, or new regional wall motion abnormalities
(assert
  (! (or patient_has_finding_of_pathological_q_wave_ecg_changes_within_12_months
         patient_has_finding_of_imaging_evidence_of_new_loss_of_viable_myocardium_within_12_months
         patient_has_finding_of_new_regional_wall_motion_abnormalities_within_12_months)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have at least one of the following: (development of pathological Q wave electrocardiogram changes OR imaging evidence of new loss of viable myocardium OR new regional wall motion abnormalities)."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone percutaneous coronary intervention (PCI) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone percutaneous coronary intervention (PCI) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone percutaneous coronary intervention (PCI).","meaning":"Boolean indicating whether the patient has a history of percutaneous coronary intervention (PCI)."} // "have a history of percutaneous coronary intervention"
(declare-const patient_has_undergone_placement_of_stent_in_coronary_artery_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone placement of a stent in a coronary artery at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone placement of a stent in a coronary artery at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone placement of a stent in a coronary artery.","meaning":"Boolean indicating whether the patient has a history of coronary stent placement."} // "coronary stent placement"
(declare-const patient_has_finding_of_timi_grade_3_complete_perfusion_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a finding of TIMI grade 3 (complete perfusion) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a finding of TIMI grade 3 (complete perfusion) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding of TIMI grade 3 (complete perfusion).","meaning":"Boolean indicating whether the patient has a history of TIMI grade 3 (complete perfusion)."} // "thrombolysis in myocardial infarction flow grade 3"
(declare-const patient_has_undergone_placement_of_stent_in_coronary_artery_inthehistory@@performed_in_coronary_artery_supplying_infarcted_territory Bool) ;; {"when_to_set_to_true":"Set to true if the stent placement was performed in the coronary artery supplying the infarcted territory.","when_to_set_to_false":"Set to false if the stent placement was not performed in the coronary artery supplying the infarcted territory.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the stent placement was performed in the coronary artery supplying the infarcted territory.","meaning":"Boolean indicating whether the stent placement was performed in the coronary artery supplying the infarcted territory."} // "in the coronary artery supplying the infarcted territory"
(declare-const patient_has_undergone_placement_of_stent_in_coronary_artery_inthehistory@@performed_in_coronary_artery_supplying_dysfunctional_territory Bool) ;; {"when_to_set_to_true":"Set to true if the stent placement was performed in the coronary artery supplying the dysfunctional territory.","when_to_set_to_false":"Set to false if the stent placement was not performed in the coronary artery supplying the dysfunctional territory.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the stent placement was performed in the coronary artery supplying the dysfunctional territory.","meaning":"Boolean indicating whether the stent placement was performed in the coronary artery supplying the dysfunctional territory."} // "in the coronary artery supplying the dysfunctional territory"
(declare-const patient_has_undergone_placement_of_stent_in_coronary_artery_inthehistory@@performed_in_coronary_artery_through_which_treatment_will_be_infused Bool) ;; {"when_to_set_to_true":"Set to true if the stent placement was performed in the coronary artery through which the treatment will be infused.","when_to_set_to_false":"Set to false if the stent placement was not performed in the coronary artery through which the treatment will be infused.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the stent placement was performed in the coronary artery through which the treatment will be infused.","meaning":"Boolean indicating whether the stent placement was performed in the coronary artery through which the treatment will be infused."} // "in the coronary artery through which the treatment will be infused"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_undergone_placement_of_stent_in_coronary_artery_inthehistory@@performed_in_coronary_artery_supplying_infarcted_territory
         patient_has_undergone_placement_of_stent_in_coronary_artery_inthehistory)
     :named REQ1_AUXILIARY0)) ;; "in the coronary artery supplying the infarcted territory"

(assert
  (! (=> patient_has_undergone_placement_of_stent_in_coronary_artery_inthehistory@@performed_in_coronary_artery_supplying_dysfunctional_territory
         patient_has_undergone_placement_of_stent_in_coronary_artery_inthehistory)
     :named REQ1_AUXILIARY1)) ;; "in the coronary artery supplying the dysfunctional territory"

(assert
  (! (=> patient_has_undergone_placement_of_stent_in_coronary_artery_inthehistory@@performed_in_coronary_artery_through_which_treatment_will_be_infused
         patient_has_undergone_placement_of_stent_in_coronary_artery_inthehistory)
     :named REQ1_AUXILIARY2)) ;; "in the coronary artery through which the treatment will be infused"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: PCI, stent placement, TIMI 3, in infarcted territory
(assert
  (! (and patient_has_undergone_percutaneous_coronary_intervention_inthehistory
          patient_has_undergone_placement_of_stent_in_coronary_artery_inthehistory@@performed_in_coronary_artery_supplying_infarcted_territory
          patient_has_finding_of_timi_grade_3_complete_perfusion_inthehistory)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "in the coronary artery supplying the infarcted territory"

;; Component 1: PCI, stent placement, TIMI 3, in dysfunctional territory
(assert
  (! (and patient_has_undergone_percutaneous_coronary_intervention_inthehistory
          patient_has_undergone_placement_of_stent_in_coronary_artery_inthehistory@@performed_in_coronary_artery_supplying_dysfunctional_territory
          patient_has_finding_of_timi_grade_3_complete_perfusion_inthehistory)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "in the coronary artery supplying the dysfunctional territory"

;; Component 2: PCI, stent placement, TIMI 3, in artery through which treatment will be infused
(assert
  (! (and patient_has_undergone_percutaneous_coronary_intervention_inthehistory
          patient_has_undergone_placement_of_stent_in_coronary_artery_inthehistory@@performed_in_coronary_artery_through_which_treatment_will_be_infused
          patient_has_finding_of_timi_grade_3_complete_perfusion_inthehistory)
     :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "in the coronary artery through which the treatment will be infused"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_inthehistory_withunit_fraction Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of left ventricular ejection fraction (LVEF) as a fraction is recorded at any time in the patient's history (including prior to or during screening).","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric fraction representing the patient's left ventricular ejection fraction recorded at any time in history."} // "left ventricular ejection fraction"
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_inthehistory_withunit_fraction@@determined_by_standard_imaging_modality Bool) ;; {"when_to_set_to_true":"Set to true if the LVEF measurement was determined by any one of the standard imaging modalities (echocardiography, ventriculography, nuclear imaging, computed tomography, or magnetic resonance imaging).","when_to_set_to_false":"Set to false if the LVEF measurement was not determined by any of the standard imaging modalities listed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was determined by a standard imaging modality.","meaning":"Boolean indicating whether the LVEF measurement was determined by a standard imaging modality (as defined)."} // "as determined by any one of the standard imaging modalities (echocardiography, ventriculography, nuclear imaging, computed tomography, or magnetic resonance imaging)"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; No auxiliary assertions required for umbrella term, as exhaustive subcategories are already encoded in the qualifier variable.

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: At least one assessment of LVEF ≤ 0.45, determined by any standard imaging modality, prior to or during screening.
(assert
  (! (and (<= patient_left_ventricular_ejection_fraction_value_recorded_inthehistory_withunit_fraction 0.45)
          patient_left_ventricular_ejection_fraction_value_recorded_inthehistory_withunit_fraction@@determined_by_standard_imaging_modality)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory@@is_index_event_for_post_reperfusion_assessment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's myocardial infarction is the index event for post-reperfusion assessment.","when_to_set_to_false":"Set to false if the patient's myocardial infarction is not the index event for post-reperfusion assessment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the myocardial infarction is the index event for post-reperfusion assessment.","meaning":"Boolean indicating whether the patient's myocardial infarction is the index event for post-reperfusion assessment."} // "index event for post-reperfusion assessment"
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory@@temporalcontext_within_90_days_prior_to_screening_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient's myocardial infarction occurred within 90 days prior to the screening visit.","when_to_set_to_false":"Set to false if the patient's myocardial infarction did not occur within 90 days prior to the screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the myocardial infarction occurred within 90 days prior to the screening visit.","meaning":"Boolean indicating whether the patient's myocardial infarction occurred within 90 days prior to the screening visit."} // "recent myocardial infarction (defined as within 90 days of myocardial infarction) at time of screening visit"
(declare-const patient_has_undergone_post_reperfusion_assessment_after_index_myocardial_infarction Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a post-reperfusion assessment after the index myocardial infarction.","when_to_set_to_false":"Set to false if the patient has not undergone a post-reperfusion assessment after the index myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a post-reperfusion assessment after the index myocardial infarction.","meaning":"Boolean indicating whether the patient has undergone a post-reperfusion assessment after the index myocardial infarction."} // "assessment must be post-reperfusion after index myocardial infarction"
(declare-const patient_has_undergone_post_reperfusion_assessment_after_index_myocardial_infarction@@is_most_recent_test_prior_to_or_during_screening_period Bool) ;; {"when_to_set_to_true":"Set to true if the post-reperfusion assessment after the index myocardial infarction is the most recent test prior to or during the screening period.","when_to_set_to_false":"Set to false if the post-reperfusion assessment after the index myocardial infarction is not the most recent test prior to or during the screening period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the post-reperfusion assessment after the index myocardial infarction is the most recent test prior to or during the screening period.","meaning":"Boolean indicating whether the post-reperfusion assessment after the index myocardial infarction is the most recent test prior to or during the screening period."} // "assessment must be the most recent test prior to OR during the screening period"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_post_reperfusion_assessment_after_index_myocardial_infarction@@is_most_recent_test_prior_to_or_during_screening_period
         patient_has_undergone_post_reperfusion_assessment_after_index_myocardial_infarction)
     :named REQ3_AUXILIARY0)) ;; "the assessment must be post-reperfusion after index myocardial infarction AND be the most recent test prior to OR during the screening period"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: If the patient fulfills the criteria of recent myocardial infarction (within 90 days prior to screening visit), the assessment must be post-reperfusion after index myocardial infarction.
(assert
  (! (or (not patient_has_diagnosis_of_myocardial_infarction_inthehistory@@temporalcontext_within_90_days_prior_to_screening_visit)
         (and patient_has_diagnosis_of_myocardial_infarction_inthehistory@@is_index_event_for_post_reperfusion_assessment
              patient_has_undergone_post_reperfusion_assessment_after_index_myocardial_infarction))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient fulfills the criteria of recent myocardial infarction ... the assessment must be post-reperfusion after index myocardial infarction"

;; Component 1: If the patient fulfills the criteria of recent myocardial infarction (within 90 days prior to screening visit), the assessment must be the most recent test prior to OR during the screening period.
(assert
  (! (or (not patient_has_diagnosis_of_myocardial_infarction_inthehistory@@temporalcontext_within_90_days_prior_to_screening_visit)
         patient_has_undergone_post_reperfusion_assessment_after_index_myocardial_infarction@@is_most_recent_test_prior_to_or_during_screening_period)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "if the patient fulfills the criteria of recent myocardial infarction ... the assessment must be the most recent test prior to OR during the screening period"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const days_since_index_myocardial_infarction_at_screening_visit_value_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days elapsed since the index myocardial infarction at the time of the screening visit.","when_to_set_to_null":"Set to null if the number of days since index myocardial infarction at screening visit is unknown, not documented, or cannot be determined.","meaning":"Numeric variable representing the number of days elapsed since the index myocardial infarction at the time of the screening visit."} // "greater than 90 days from myocardial infarction at the time of screening visit"
(declare-const days_since_post_reperfusion_assessment_after_index_myocardial_infarction_at_screening_visit_value_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days elapsed since the post-reperfusion assessment after index myocardial infarction at the time of the screening visit.","when_to_set_to_null":"Set to null if the number of days since post-reperfusion assessment after index myocardial infarction at screening visit is unknown, not documented, or cannot be determined.","meaning":"Numeric variable representing the number of days elapsed since the post-reperfusion assessment after index myocardial infarction at the time of the screening visit."} // "at least 21 days post-reperfusion after index myocardial infarction"
(declare-const patient_has_diagnosis_of_old_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of old myocardial infarction at any time in the history (i.e., MI occurred >90 days prior to screening).","when_to_set_to_false":"Set to false if the patient does not have a diagnosis of old myocardial infarction at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a diagnosis of old myocardial infarction in the history.","meaning":"Boolean indicating whether the patient has a diagnosis of old myocardial infarction in the history."} // "chronic myocardial infarction (defined as greater than 90 days from myocardial infarction)"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition: chronic myocardial infarction at screening ≡ >90 days since index MI at screening
(assert
  (! (= patient_has_diagnosis_of_old_myocardial_infarction_inthehistory
        (> days_since_index_myocardial_infarction_at_screening_visit_value_in_days 90.0))
     :named REQ4_AUXILIARY0)) ;; "chronic myocardial infarction (defined as greater than 90 days from myocardial infarction) at the time of screening visit"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: If chronic MI at screening, assessment must be ≥21 days post-reperfusion after index MI
(assert
  (! (or (not patient_has_diagnosis_of_old_myocardial_infarction_inthehistory)
         (>= days_since_post_reperfusion_assessment_after_index_myocardial_infarction_at_screening_visit_value_in_days 21.0))
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "assessment must be at least 21 days post-reperfusion after index myocardial infarction"

;; Component 1: If chronic MI at screening, assessment must be the most recent test prior to OR during screening period
(assert
  (! (or (not patient_has_diagnosis_of_old_myocardial_infarction_inthehistory)
         patient_has_undergone_post_reperfusion_assessment_after_index_myocardial_infarction@@is_most_recent_test_prior_to_or_during_screening_period)
     :named REQ4_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "assessment must be the most recent test prior to OR during the screening period"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const days_since_infusion_date_post_myocardial_infarction_value_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days between the patient's infusion date and the index myocardial infarction event.","when_to_set_to_null":"Set to null if the number of days between infusion date and index myocardial infarction event is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of days between the patient's infusion date and the index myocardial infarction event."} // "if the infusion date is greater than 90 days post-myocardial infarction"
(declare-const patient_has_undergone_infusion_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone an infusion at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone an infusion in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone an infusion.","meaning":"Boolean indicating whether the patient has ever undergone an infusion in the past."} // "infusion"
(declare-const patient_is_randomized_into_chronic_myocardial_infarction_strata_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently randomized into the chronic myocardial infarction strata.","when_to_set_to_false":"Set to false if the patient is not currently randomized into the chronic myocardial infarction strata.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently randomized into the chronic myocardial infarction strata.","meaning":"Boolean indicating whether the patient is currently randomized into the chronic myocardial infarction strata."} // "randomized into the chronic myocardial infarction strata"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definition: If the patient has undergone infusion and the infusion date is >90 days post-MI, then the patient is randomized into the chronic MI strata
(assert
  (! (=> (and patient_has_undergone_infusion_inthehistory
              (> days_since_infusion_date_post_myocardial_infarction_value_in_days 90.0))
         patient_is_randomized_into_chronic_myocardial_infarction_strata_now)
     :named REQ5_AUXILIARY0)) ;; "be randomized into the chronic myocardial infarction strata if the infusion date is greater than 90 days post-myocardial infarction"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Inclusion: If the patient meets the above, they may be included in the chronic MI strata
(assert
  (! (or (not patient_has_undergone_infusion_inthehistory)
         (not (> days_since_infusion_date_post_myocardial_infarction_value_in_days 90.0))
         patient_is_randomized_into_chronic_myocardial_infarction_strata_now)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient may screen as a recent myocardial infarction but be randomized into the chronic myocardial infarction strata if the infusion date is greater than 90 days post-myocardial infarction."

;; ===================== Declarations for the inclusion criterion (REQ 6) =====================
(declare-const patient_left_ventricular_infarct_size_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured value in percent if the patient's left ventricular infarct size is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's left ventricular infarct size in percent recorded now."} // "left ventricular infarct size greater than or equal to 15 percent of left ventricular mass"
(declare-const patient_left_ventricular_infarct_size_value_recorded_now_withunit_percent@@determined_by_centrally_read_screening_magnetic_resonance_imaging Bool) ;; {"when_to_set_to_true":"Set to true if the left ventricular infarct size value was determined by centrally read screening magnetic resonance imaging.","when_to_set_to_false":"Set to false if the left ventricular infarct size value was not determined by centrally read screening magnetic resonance imaging.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the value was determined by centrally read screening magnetic resonance imaging.","meaning":"Boolean indicating whether the left ventricular infarct size value was determined by centrally read screening magnetic resonance imaging."} // "as determined by centrally read screening magnetic resonance imaging"
(declare-const patient_left_ventricular_infarct_size_value_recorded_now_withunit_percent@@in_qualifying_infarct_related_region_to_be_infused Bool) ;; {"when_to_set_to_true":"Set to true if the left ventricular infarct size value pertains to the qualifying infarct-related region to be infused.","when_to_set_to_false":"Set to false if the left ventricular infarct size value does not pertain to the qualifying infarct-related region to be infused.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the value pertains to the qualifying infarct-related region to be infused.","meaning":"Boolean indicating whether the left ventricular infarct size value pertains to the qualifying infarct-related region to be infused."} // "in the qualifying infarct-related region to be infused"
(declare-const patient_left_ventricular_mass_value_recorded_now_withunit_gram Real) ;; {"when_to_set_to_value":"Set to the measured value in grams if the patient's left ventricular mass is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's left ventricular mass in grams recorded now."} // "left ventricular mass"
(declare-const patient_left_ventricular_mass_value_recorded_now_withunit_gram@@determined_by_centrally_read_screening_magnetic_resonance_imaging Bool) ;; {"when_to_set_to_true":"Set to true if the left ventricular mass value was determined by centrally read screening magnetic resonance imaging.","when_to_set_to_false":"Set to false if the left ventricular mass value was not determined by centrally read screening magnetic resonance imaging.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the value was determined by centrally read screening magnetic resonance imaging.","meaning":"Boolean indicating whether the left ventricular mass value was determined by centrally read screening magnetic resonance imaging."} // "as determined by centrally read screening magnetic resonance imaging"
(declare-const patient_left_ventricular_mass_value_recorded_now_withunit_gram@@in_qualifying_infarct_related_region_to_be_infused Bool) ;; {"when_to_set_to_true":"Set to true if the left ventricular mass value pertains to the qualifying infarct-related region to be infused.","when_to_set_to_false":"Set to false if the left ventricular mass value does not pertain to the qualifying infarct-related region to be infused.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the value pertains to the qualifying infarct-related region to be infused.","meaning":"Boolean indicating whether the left ventricular mass value pertains to the qualifying infarct-related region to be infused."} // "in the qualifying infarct-related region to be infused"
(declare-const patient_has_undergone_magnetic_resonance_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone magnetic resonance imaging now.","when_to_set_to_false":"Set to false if the patient has not undergone magnetic resonance imaging now.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the patient has undergone magnetic resonance imaging now.","meaning":"Boolean indicating whether the patient has undergone magnetic resonance imaging now."} // "magnetic resonance imaging"
(declare-const patient_has_undergone_magnetic_resonance_imaging_now@@used_for_centrally_read_screening Bool) ;; {"when_to_set_to_true":"Set to true if the magnetic resonance imaging was used for centrally read screening.","when_to_set_to_false":"Set to false if the magnetic resonance imaging was not used for centrally read screening.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the imaging was used for centrally read screening.","meaning":"Boolean indicating whether the magnetic resonance imaging was used for centrally read screening."} // "centrally read screening"
(declare-const patient_has_finding_of_left_ventricular_wall_thinning_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has left ventricular wall thinning.","when_to_set_to_false":"Set to false if the patient currently does not have left ventricular wall thinning.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the patient currently has left ventricular wall thinning.","meaning":"Boolean indicating whether the patient currently has left ventricular wall thinning."} // "left ventricular wall thinning"
(declare-const patient_has_finding_of_left_ventricular_wall_thinning_now@@associated_with_qualifying_infarct Bool) ;; {"when_to_set_to_true":"Set to true if the left ventricular wall thinning is associated with the qualifying infarct.","when_to_set_to_false":"Set to false if the left ventricular wall thinning is not associated with the qualifying infarct.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the finding is associated with the qualifying infarct.","meaning":"Boolean indicating whether the left ventricular wall thinning is associated with the qualifying infarct."} // "associated left ventricular wall thinning"
(declare-const patient_has_finding_of_left_ventricular_wall_hypokinetic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has left ventricular wall hypokinesis.","when_to_set_to_false":"Set to false if the patient currently does not have left ventricular wall hypokinesis.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the patient currently has left ventricular wall hypokinesis.","meaning":"Boolean indicating whether the patient currently has left ventricular wall hypokinesis."} // "left ventricular wall hypokinesis"
(declare-const patient_has_finding_of_left_ventricular_wall_akinetic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has left ventricular wall akinesis.","when_to_set_to_false":"Set to false if the patient currently does not have left ventricular wall akinesis.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the patient currently has left ventricular wall akinesis.","meaning":"Boolean indicating whether the patient currently has left ventricular wall akinesis."} // "left ventricular wall akinesis"
(declare-const patient_has_finding_of_left_ventricular_wall_akinetic_now@@associated_with_qualifying_infarct Bool) ;; {"when_to_set_to_true":"Set to true if the left ventricular wall akinesis is associated with the qualifying infarct.","when_to_set_to_false":"Set to false if the left ventricular wall akinesis is not associated with the qualifying infarct.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the finding is associated with the qualifying infarct.","meaning":"Boolean indicating whether the left ventricular wall akinesis is associated with the qualifying infarct."} // "associated left ventricular wall akinesis"
(declare-const patient_has_finding_of_left_ventricular_wall_dyskinetic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has left ventricular wall dyskinesis.","when_to_set_to_false":"Set to false if the patient currently does not have left ventricular wall dyskinesis.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the patient currently has left ventricular wall dyskinesis.","meaning":"Boolean indicating whether the patient currently has left ventricular wall dyskinesis."} // "left ventricular wall dyskinesis"
(declare-const patient_has_finding_of_left_ventricular_wall_dyskinetic_now@@associated_with_qualifying_infarct Bool) ;; {"when_to_set_to_true":"Set to true if the left ventricular wall dyskinesis is associated with the qualifying infarct.","when_to_set_to_false":"Set to false if the left ventricular wall dyskinesis is not associated with the qualifying infarct.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the finding is associated with the qualifying infarct.","meaning":"Boolean indicating whether the left ventricular wall dyskinesis is associated with the qualifying infarct."} // "associated left ventricular wall dyskinesis"
(declare-const patient_has_finding_of_large_left_ventricular_aneurysmal_area_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a large left ventricular aneurysmal area.","when_to_set_to_false":"Set to false if the patient currently does not have a large left ventricular aneurysmal area.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the patient currently has a large left ventricular aneurysmal area.","meaning":"Boolean indicating whether the patient currently has a large left ventricular aneurysmal area."} // "large left ventricular aneurysmal area"
(declare-const patient_has_finding_of_large_left_ventricular_aneurysmal_area_now@@in_infarcted_regions Bool) ;; {"when_to_set_to_true":"Set to true if the large left ventricular aneurysmal area is in the infarcted regions.","when_to_set_to_false":"Set to false if the large left ventricular aneurysmal area is not in the infarcted regions.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the large left ventricular aneurysmal area is in the infarcted regions.","meaning":"Boolean indicating whether the large left ventricular aneurysmal area is in the infarcted regions."} // "in the infarcted regions"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_left_ventricular_infarct_size_value_recorded_now_withunit_percent@@determined_by_centrally_read_screening_magnetic_resonance_imaging
         patient_has_undergone_magnetic_resonance_imaging_now)
     :named REQ6_AUXILIARY0)) ;; "as determined by centrally read screening magnetic resonance imaging"

(assert
  (! (=> patient_left_ventricular_infarct_size_value_recorded_now_withunit_percent@@in_qualifying_infarct_related_region_to_be_infused
         true)
     :named REQ6_AUXILIARY1)) ;; "in the qualifying infarct-related region to be infused"

(assert
  (! (=> patient_left_ventricular_mass_value_recorded_now_withunit_gram@@determined_by_centrally_read_screening_magnetic_resonance_imaging
         patient_has_undergone_magnetic_resonance_imaging_now)
     :named REQ6_AUXILIARY2)) ;; "as determined by centrally read screening magnetic resonance imaging"

(assert
  (! (=> patient_left_ventricular_mass_value_recorded_now_withunit_gram@@in_qualifying_infarct_related_region_to_be_infused
         true)
     :named REQ6_AUXILIARY3)) ;; "in the qualifying infarct-related region to be infused"

(assert
  (! (=> patient_has_undergone_magnetic_resonance_imaging_now@@used_for_centrally_read_screening
         patient_has_undergone_magnetic_resonance_imaging_now)
     :named REQ6_AUXILIARY4)) ;; "used for centrally read screening"

(assert
  (! (=> patient_has_finding_of_left_ventricular_wall_thinning_now@@associated_with_qualifying_infarct
         patient_has_finding_of_left_ventricular_wall_thinning_now)
     :named REQ6_AUXILIARY5)) ;; "associated left ventricular wall thinning"

(assert
  (! (=> patient_has_finding_of_left_ventricular_wall_akinetic_now@@associated_with_qualifying_infarct
         patient_has_finding_of_left_ventricular_wall_akinetic_now)
     :named REQ6_AUXILIARY6)) ;; "associated left ventricular wall akinesis"

(assert
  (! (=> patient_has_finding_of_left_ventricular_wall_dyskinetic_now@@associated_with_qualifying_infarct
         patient_has_finding_of_left_ventricular_wall_dyskinetic_now)
     :named REQ6_AUXILIARY7)) ;; "associated left ventricular wall dyskinesis"

(assert
  (! (=> patient_has_finding_of_large_left_ventricular_aneurysmal_area_now@@in_infarcted_regions
         patient_has_finding_of_large_left_ventricular_aneurysmal_area_now)
     :named REQ6_AUXILIARY8)) ;; "large left ventricular aneurysmal area in the infarcted regions"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: left ventricular infarct size >= 15% of left ventricular mass in qualifying region, determined by centrally read screening MRI
(assert
  (! (and
        (>= patient_left_ventricular_infarct_size_value_recorded_now_withunit_percent 15.0)
        patient_left_ventricular_infarct_size_value_recorded_now_withunit_percent@@determined_by_centrally_read_screening_magnetic_resonance_imaging
        patient_left_ventricular_infarct_size_value_recorded_now_withunit_percent@@in_qualifying_infarct_related_region_to_be_infused
        patient_left_ventricular_mass_value_recorded_now_withunit_gram@@determined_by_centrally_read_screening_magnetic_resonance_imaging
        patient_left_ventricular_mass_value_recorded_now_withunit_gram@@in_qualifying_infarct_related_region_to_be_infused
     )
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "left ventricular infarct size greater than or equal to 15 percent of left ventricular mass in the qualifying infarct-related region to be infused as determined by centrally read screening magnetic resonance imaging"

;; Component 1: associated left ventricular wall thinning OR hypokinesis OR akinesis OR dyskinesis
(assert
  (! (or
        patient_has_finding_of_left_ventricular_wall_thinning_now@@associated_with_qualifying_infarct
        patient_has_finding_of_left_ventricular_wall_hypokinetic_now
        patient_has_finding_of_left_ventricular_wall_akinetic_now@@associated_with_qualifying_infarct
        patient_has_finding_of_left_ventricular_wall_dyskinetic_now@@associated_with_qualifying_infarct
     )
     :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "associated left ventricular wall thinning OR left ventricular wall hypokinesis OR left ventricular wall akinesis OR left ventricular wall dyskinesis"

;; Component 2: NOT have large left ventricular aneurysmal area in the infarcted regions
(assert
  (! (not patient_has_finding_of_large_left_ventricular_aneurysmal_area_now@@in_infarcted_regions)
     :named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "NOT have large left ventricular aneurysmal area in the infarcted regions"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_further_coronary_revascularization_clinically_indicated_now Bool) ;; {"when_to_set_to_true":"Set to true if, at the time the patient is assessed for participation in the clinical trial, further coronary revascularization is clinically indicated for the patient.","when_to_set_to_false":"Set to false if, at the time the patient is assessed for participation in the clinical trial, further coronary revascularization is not clinically indicated for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether further coronary revascularization is clinically indicated for the patient at the time of assessment for participation in the clinical trial.","meaning":"Boolean indicating whether further coronary revascularization is clinically indicated for the patient at the time of assessment for participation in the clinical trial."} // "must NOT have further coronary revascularization clinically indicated at the time the patient is assessed for participation in the clinical trial"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not patient_has_further_coronary_revascularization_clinically_indicated_now)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must NOT have further coronary revascularization clinically indicated at the time the patient is assessed for participation in the clinical trial"

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_has_ability_to_provide_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the ability to provide informed consent.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to provide informed consent.","meaning":"Boolean indicating whether the patient currently has the ability to provide informed consent."} // "the patient must have the ability to provide informed consent"
(declare-const patient_has_ability_to_follow_up_with_protocol_procedures_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the ability to follow-up with protocol procedures.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to follow-up with protocol procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to follow-up with protocol procedures.","meaning":"Boolean indicating whether the patient currently has the ability to follow-up with protocol procedures."} // "the patient must have the ability to follow-up with protocol procedures"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! patient_has_ability_to_provide_informed_consent_now
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have the ability to provide informed consent"

(assert
  (! patient_has_ability_to_follow_up_with_protocol_procedures_now
     :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient must have the ability to follow-up with protocol procedures"

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged greater than or equal to 18 years"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ9_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged greater than or equal to 18 years."
