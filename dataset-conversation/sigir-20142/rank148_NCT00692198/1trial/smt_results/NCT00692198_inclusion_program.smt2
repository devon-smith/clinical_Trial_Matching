;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "at least 40 years old"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 40)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be at least 40 years old."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic obstructive pulmonary disease (COPD).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic obstructive pulmonary disease (COPD).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic obstructive pulmonary disease (COPD).","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic obstructive pulmonary disease."} // "To be included, the patient must have chronic obstructive pulmonary disease."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_diagnosis_of_chronic_obstructive_lung_disease_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have chronic obstructive pulmonary disease."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const mmrc_dyspnea_scale_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the value of the patient's current MMRC dyspnea scale score if it is recorded now.","when_to_set_to_null":"Set to null if the patient's current MMRC dyspnea scale score is not recorded, unknown, or cannot be determined.","meaning":"Numeric value representing the patient's current MMRC dyspnea scale score, with unit 'score'."} // "MMRC dyspnea scale ≥ 1"
(declare-const patient_has_finding_of_dyspnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dyspnea.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dyspnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of dyspnea.","meaning":"Boolean indicating whether the patient currently has dyspnea."} // "dyspnea"
(declare-const patient_has_finding_of_dyspnea_now@@determined_by_modified_medical_research_council_scale Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dyspnea is determined by the Modified Medical Research Council (MMRC) scale.","when_to_set_to_false":"Set to false if the patient's dyspnea is not determined by the MMRC scale.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dyspnea is determined by the MMRC scale.","meaning":"Boolean indicating whether the patient's dyspnea is determined by the Modified Medical Research Council (MMRC) scale."} // "dyspnea (determined by MMRC scale)"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_dyspnea_now@@determined_by_modified_medical_research_council_scale
         patient_has_finding_of_dyspnea_now)
     :named REQ2_AUXILIARY0)) ;; "dyspnea (determined by MMRC scale)"

;; Dyspnea determined by MMRC scale is true if MMRC dyspnea scale value is recorded and >= 1
(assert
  (! (= patient_has_finding_of_dyspnea_now@@determined_by_modified_medical_research_council_scale
        (>= mmrc_dyspnea_scale_value_recorded_now_withunit_score 1.0))
     :named REQ2_AUXILIARY1)) ;; "dyspnea (determined by MMRC scale ≥ 1)"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_dyspnea_now@@determined_by_modified_medical_research_council_scale
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have dyspnea (determined by MMRC scale ≥ 1)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_disorder_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a lung disease process.","when_to_set_to_false":"Set to false if the patient currently does not have a lung disease process.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a lung disease process.","meaning":"Boolean indicating whether the patient currently has a lung disease process."} // "a lung disease process"
(declare-const patient_has_finding_of_disorder_of_lung_now@@process_dominated_by_chronic_obstructive_pulmonary_disease_in_judgment_of_study_physician Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current lung disease process is dominated by chronic obstructive pulmonary disease in the judgment of the study physician.","when_to_set_to_false":"Set to false if the patient's current lung disease process is not dominated by chronic obstructive pulmonary disease in the judgment of the study physician.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current lung disease process is dominated by chronic obstructive pulmonary disease in the judgment of the study physician.","meaning":"Boolean indicating whether the patient's current lung disease process is dominated by chronic obstructive pulmonary disease in the judgment of the study physician."} // "a lung disease process dominated by chronic obstructive pulmonary disease in the judgment of the study physician"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_disorder_of_lung_now@@process_dominated_by_chronic_obstructive_pulmonary_disease_in_judgment_of_study_physician
         patient_has_finding_of_disorder_of_lung_now)
     :named REQ3_AUXILIARY0)) ;; "a lung disease process dominated by chronic obstructive pulmonary disease in the judgment of the study physician" implies "a lung disease process"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: To be included, the patient must have dyspnea.
(assert
  (! patient_has_finding_of_dyspnea_now
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have dyspnea."

;; Component 1: To be included, the patient must have a lung disease process dominated by chronic obstructive pulmonary disease in the judgment of the study physician.
(assert
  (! patient_has_finding_of_disorder_of_lung_now@@process_dominated_by_chronic_obstructive_pulmonary_disease_in_judgment_of_study_physician
     :named REQ3_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a lung disease process dominated by chronic obstructive pulmonary disease in the judgment of the study physician."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_percentage_predicted_forced_expiratory_volume_in_1_second_after_bronchodilation_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percent predicted value if a post-bronchodilator FEV1 percent predicted is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percent predicted value for post-bronchodilator FEV1 measured now."} // "post-bronchodilator forced expiratory volume in 1 second percent"
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_liters Real) ;; {"when_to_set_to_value":"Set to the measured value in liters if post-bronchodilator FEV1 is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value in liters for post-bronchodilator FEV1 measured now."} // "forced expiratory volume in 1 second"
(declare-const patient_forced_vital_capacity_value_recorded_now_withunit_liters Real) ;; {"when_to_set_to_value":"Set to the measured value in liters if post-bronchodilator FVC is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value in liters for post-bronchodilator FVC measured now."} // "forced vital capacity"
(declare-const patient_forced_expiratory_volume_in_1_second_to_forced_vital_capacity_ratio_value_recorded_now_unitless Real) ;; {"when_to_set_to_value":"Set to the measured value if the post-bronchodilator FEV1/FVC ratio is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for post-bronchodilator FEV1/FVC ratio measured now, unitless."} // "post-bronchodilator forced expiratory volume in 1 second/forced vital capacity"
(declare-const patient_has_finding_of_pulmonary_emphysema_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has radiologic evidence of pulmonary emphysema.","when_to_set_to_false":"Set to false if the patient currently does not have radiologic evidence of pulmonary emphysema.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has radiologic evidence of pulmonary emphysema.","meaning":"Boolean indicating whether the patient currently has radiologic evidence of pulmonary emphysema."} // "radiologic evidence of emphysema"
(declare-const patient_has_finding_of_pulmonary_emphysema_now@@radiologic_evidence Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pulmonary emphysema is determined by radiologic evidence.","when_to_set_to_false":"Set to false if the patient's pulmonary emphysema is not determined by radiologic evidence.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether radiologic evidence is present for pulmonary emphysema.","meaning":"Boolean indicating whether the patient's pulmonary emphysema is determined by radiologic evidence."} // "radiologic evidence of emphysema"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition: FEV1/FVC ratio is calculated from FEV1 and FVC values
(assert
  (! (= patient_forced_expiratory_volume_in_1_second_to_forced_vital_capacity_ratio_value_recorded_now_unitless
        (/ patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_liters
           patient_forced_vital_capacity_value_recorded_now_withunit_liters))
     :named REQ4_AUXILIARY0)) ;; "post-bronchodilator forced expiratory volume in 1 second/forced vital capacity"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_pulmonary_emphysema_now@@radiologic_evidence
         patient_has_finding_of_pulmonary_emphysema_now)
     :named REQ4_AUXILIARY1)) ;; "radiologic evidence of emphysema"

;; ===================== Constraint Assertions (REQ 4) =====================
;; At least one of the following must be true:
;; (1) FEV1 % predicted ≤ 70%
;; (2) (FEV1 % predicted > 70%) AND (radiologic evidence of emphysema)
;; (3) FEV1/FVC < 0.70
(assert
  (! (or
        (<= patient_percentage_predicted_forced_expiratory_volume_in_1_second_after_bronchodilation_value_recorded_now_withunit_percent 70.0)
        (and
          (> patient_percentage_predicted_forced_expiratory_volume_in_1_second_after_bronchodilation_value_recorded_now_withunit_percent 70.0)
          patient_has_finding_of_pulmonary_emphysema_now@@radiologic_evidence)
        (< patient_forced_expiratory_volume_in_1_second_to_forced_vital_capacity_ratio_value_recorded_now_unitless 0.70))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must meet at least one of the following: (post-bronchodilator forced expiratory volume in 1 second percent ≤ 70% predicted) OR ((post-bronchodilator forced expiratory volume in 1 second percent > 70% predicted) AND (the Long-term Oxygen Treatment Trial study physician determines that there is radiologic evidence of emphysema)) OR (post-bronchodilator forced expiratory volume in 1 second/forced vital capacity < 0.70)."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's hemoglobin oxygen saturation percentage is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current hemoglobin oxygen saturation percentage."} // "oxygen saturation"
(declare-const patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_after_sitting_quietly Bool) ;; {"when_to_set_to_true":"Set to true if the oxygen saturation measurement was taken after the patient sat quietly.","when_to_set_to_false":"Set to false if the measurement was not taken after sitting quietly.","when_to_set_to_null":"Set to null if it is unknown whether the measurement was taken after sitting quietly.","meaning":"Boolean indicating whether the oxygen saturation measurement was taken after the patient sat quietly."} // "after sitting quietly"
(declare-const patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_on_room_air Bool) ;; {"when_to_set_to_true":"Set to true if the oxygen saturation measurement was taken on room air.","when_to_set_to_false":"Set to false if the measurement was not taken on room air.","when_to_set_to_null":"Set to null if it is unknown whether the measurement was taken on room air.","meaning":"Boolean indicating whether the oxygen saturation measurement was taken on room air."} // "on room air"
(declare-const patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_without_hyperventilation Bool) ;; {"when_to_set_to_true":"Set to true if the oxygen saturation measurement was taken without hyperventilation.","when_to_set_to_false":"Set to false if the measurement was taken with hyperventilation.","when_to_set_to_null":"Set to null if it is unknown whether the measurement was taken without hyperventilation.","meaning":"Boolean indicating whether the oxygen saturation measurement was taken without hyperventilation."} // "without hyperventilation"
(declare-const patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_without_pursed_lips_breathing Bool) ;; {"when_to_set_to_true":"Set to true if the oxygen saturation measurement was taken without pursed lips breathing.","when_to_set_to_false":"Set to false if the measurement was taken with pursed lips breathing.","when_to_set_to_null":"Set to null if it is unknown whether the measurement was taken without pursed lips breathing.","meaning":"Boolean indicating whether the oxygen saturation measurement was taken without pursed lips breathing."} // "without pursed lips breathing"
(declare-const patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_during_oximetry Bool) ;; {"when_to_set_to_true":"Set to true if the oxygen saturation measurement was taken during oximetry.","when_to_set_to_false":"Set to false if the measurement was not taken during oximetry.","when_to_set_to_null":"Set to null if it is unknown whether the measurement was taken during oximetry.","meaning":"Boolean indicating whether the oxygen saturation measurement was taken during oximetry."} // "during oximetry"
(declare-const patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_at_rest Bool) ;; {"when_to_set_to_true":"Set to true if the oxygen saturation measurement was taken at rest.","when_to_set_to_false":"Set to false if the measurement was not taken at rest.","when_to_set_to_null":"Set to null if it is unknown whether the measurement was taken at rest.","meaning":"Boolean indicating whether the oxygen saturation measurement was taken at rest."} // "resting oxygen saturation"
(declare-const patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_during_exercise Bool) ;; {"when_to_set_to_true":"Set to true if the oxygen saturation measurement was taken during exercise.","when_to_set_to_false":"Set to false if the measurement was not taken during exercise.","when_to_set_to_null":"Set to null if it is unknown whether the measurement was taken during exercise.","meaning":"Boolean indicating whether the oxygen saturation measurement was taken during exercise."} // "during exercise"
(declare-const patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_during_6_minute_walk_test Bool) ;; {"when_to_set_to_true":"Set to true if the oxygen saturation measurement was taken during the 6 minute walk test.","when_to_set_to_false":"Set to false if the measurement was not taken during the 6 minute walk test.","when_to_set_to_null":"Set to null if it is unknown whether the measurement was taken during the 6 minute walk test.","meaning":"Boolean indicating whether the oxygen saturation measurement was taken during the 6 minute walk test."} // "during the 6 minute walk test"
(declare-const patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_during_6_minute_walk_test@@duration_of_desaturation_below_90_percent_in_seconds Real) ;; {"when_to_set_to_value":"Set to the measured duration in seconds if the patient's hemoglobin oxygen saturation was below 90 percent during the 6 minute walk test.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the duration in seconds for which the patient's hemoglobin oxygen saturation was below 90 percent during the 6 minute walk test."} // "oxygen saturation < 90% for at least 10 seconds during the 6 minute walk test"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; None needed for this requirement, as all relationships are direct and explicit in the constraint.

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: At least one of the following oxygen saturation criteria must be met:
;; 1. (oxygen saturation ≥ 89% AND oxygen saturation ≤ 93%) after sitting quietly on room air, without hyperventilation AND without pursed lips breathing during oximetry
;; 2. (resting oxygen saturation ≥ 94%) AND (desaturation during exercise defined as oxygen saturation < 90% for at least 10 seconds during the 6 minute walk test)

(assert
  (!
    (or
      ;; First criterion
      (and (>= patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent 89.0)
           (<= patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent 93.0)
           patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_after_sitting_quietly
           patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_on_room_air
           patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_without_hyperventilation
           patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_without_pursed_lips_breathing
           patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_during_oximetry)
      ;; Second criterion
      (and (>= patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent 94.0)
           patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_at_rest
           (exists ((d Real))
             (and
               patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_during_exercise
               patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_during_6_minute_walk_test
               (< patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent 90.0)
               (>= patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_during_6_minute_walk_test@@duration_of_desaturation_below_90_percent_in_seconds 10.0)
             )
           )
      )
    )
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS
  )
) ;; "To be included, the patient must meet at least one of the following oxygen saturation criteria: ((oxygen saturation ≥ 89% AND oxygen saturation ≤ 93%) after sitting quietly on room air, without hyperventilation AND without pursed lips breathing during oximetry) OR ((resting oxygen saturation ≥ 94%) AND (desaturation during exercise defined as oxygen saturation < 90% for at least 10 seconds during the 6 minute walk test))."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_is_undergoing_oxygen_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is undergoing oxygen therapy at the start of screening.","when_to_set_to_false":"Set to false if the patient is not undergoing oxygen therapy at the start of screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is undergoing oxygen therapy at the start of screening.","meaning":"Boolean indicating whether the patient is currently undergoing oxygen therapy."} // "if the patient is on supplemental oxygen therapy at the start of screening"
(declare-const patient_is_undergoing_oxygen_therapy_now@@temporalcontext_at_start_of_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's oxygen therapy status is specifically at the start of screening.","when_to_set_to_false":"Set to false if the patient's oxygen therapy status is not specifically at the start of screening.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the status refers to the start of screening.","meaning":"Boolean indicating that the variable refers to the start of screening as the temporal anchor."} // "at the start of screening"
(declare-const patient_agrees_to_stop_using_supplemental_oxygen_therapy_if_randomized_to_no_supplemental_oxygen_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to stop using supplemental oxygen therapy if randomized to no supplemental oxygen therapy.","when_to_set_to_false":"Set to false if the patient does not agree to stop using supplemental oxygen therapy if randomized to no supplemental oxygen therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to stop using supplemental oxygen therapy if randomized to no supplemental oxygen therapy.","meaning":"Boolean indicating whether the patient agrees to stop using supplemental oxygen therapy if randomized to no supplemental oxygen therapy."} // "the patient agrees to stop using supplemental oxygen therapy if randomized to no supplemental oxygen therapy"
(declare-const physician_agrees_in_writing_to_rescind_order_for_supplemental_oxygen_therapy_if_patient_randomized_to_no_supplemental_oxygen_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's physician agrees in writing to rescind the order for supplemental oxygen therapy if the patient is randomized to no supplemental oxygen therapy.","when_to_set_to_false":"Set to false if the patient's physician does not agree in writing to rescind the order for supplemental oxygen therapy if the patient is randomized to no supplemental oxygen therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's physician agrees in writing to rescind the order for supplemental oxygen therapy if the patient is randomized to no supplemental oxygen therapy.","meaning":"Boolean indicating whether the patient's physician agrees in writing to rescind the order for supplemental oxygen therapy if the patient is randomized to no supplemental oxygen therapy."} // "the patient's physician agrees in writing to rescind order for supplemental oxygen therapy if the patient is randomized to no supplemental oxygen therapy"
(declare-const patient_reports_not_using_supplemental_oxygen_therapy_on_day_of_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient reports not using supplemental oxygen therapy on the day of randomization.","when_to_set_to_false":"Set to false if the patient reports using supplemental oxygen therapy on the day of randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient reports not using supplemental oxygen therapy on the day of randomization.","meaning":"Boolean indicating whether the patient reports not using supplemental oxygen therapy on the day of randomization."} // "the patient reports not using supplemental oxygen therapy on the day of randomization"
(declare-const patient_reports_not_using_supplemental_oxygen_therapy_for_4_days_prior_to_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient reports not using supplemental oxygen therapy for the 4 calendar days prior to randomization.","when_to_set_to_false":"Set to false if the patient reports using supplemental oxygen therapy for any of the 4 calendar days prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient reports not using supplemental oxygen therapy for the 4 calendar days prior to randomization.","meaning":"Boolean indicating whether the patient reports not using supplemental oxygen therapy for the 4 calendar days prior to randomization."} // "the patient reports not using supplemental oxygen therapy for the 4 calendar days prior to randomization"
(declare-const logistics_of_continuation_with_same_supplemental_oxygen_therapy_company_with_waiver_of_cost_sharing_obligations_are_satisfactorily_resolved Bool) ;; {"when_to_set_to_true":"Set to true if the logistics of continuation with the same supplemental oxygen therapy company with waiver of cost sharing obligations are satisfactorily resolved.","when_to_set_to_false":"Set to false if the logistics of continuation with the same supplemental oxygen therapy company with waiver of cost sharing obligations are not satisfactorily resolved.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the logistics of continuation with the same supplemental oxygen therapy company with waiver of cost sharing obligations are satisfactorily resolved.","meaning":"Boolean indicating whether the logistics of continuation with the same supplemental oxygen therapy company with waiver of cost sharing obligations are satisfactorily resolved."} // "satisfactory resolution of logistics of continuation with same supplemental oxygen therapy company with waiver of cost sharing obligations"
(declare-const switch_to_new_supplemental_oxygen_therapy_company_that_will_waive_cost_sharing_obligations_if_patient_randomized_to_supplemental_oxygen_therapy Bool) ;; {"when_to_set_to_true":"Set to true if there is a switch to a new supplemental oxygen therapy company that will waive cost sharing obligations if the patient is randomized to supplemental oxygen therapy.","when_to_set_to_false":"Set to false if there is not a switch to a new supplemental oxygen therapy company that will waive cost sharing obligations if the patient is randomized to supplemental oxygen therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is a switch to a new supplemental oxygen therapy company that will waive cost sharing obligations if the patient is randomized to supplemental oxygen therapy.","meaning":"Boolean indicating whether there is a switch to a new supplemental oxygen therapy company that will waive cost sharing obligations if the patient is randomized to supplemental oxygen therapy."} // "switch to new supplemental oxygen therapy company that will waive cost sharing obligations if the patient is randomized to supplemental oxygen therapy"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_is_undergoing_oxygen_therapy_now@@temporalcontext_at_start_of_screening
         patient_is_undergoing_oxygen_therapy_now)
     :named REQ6_AUXILIARY0)) ;; "at the start of screening"

;; ===================== Constraint Assertions (REQ 6) =====================
;; If patient is on supplemental oxygen therapy at the start of screening, all conditions must be met prior to randomization
(assert
  (! (=> patient_is_undergoing_oxygen_therapy_now@@temporalcontext_at_start_of_screening
         (and patient_agrees_to_stop_using_supplemental_oxygen_therapy_if_randomized_to_no_supplemental_oxygen_therapy
              physician_agrees_in_writing_to_rescind_order_for_supplemental_oxygen_therapy_if_patient_randomized_to_no_supplemental_oxygen_therapy
              patient_reports_not_using_supplemental_oxygen_therapy_on_day_of_randomization
              patient_reports_not_using_supplemental_oxygen_therapy_for_4_days_prior_to_randomization
              (or logistics_of_continuation_with_same_supplemental_oxygen_therapy_company_with_waiver_of_cost_sharing_obligations_are_satisfactorily_resolved
                  switch_to_new_supplemental_oxygen_therapy_company_that_will_waive_cost_sharing_obligations_if_patient_randomized_to_supplemental_oxygen_therapy)))
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "all of the following must be met prior to randomization"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_cigarette_smoking_tobacco_value_recorded_inthehistory_withunit_pack_years Real) ;; {"when_to_set_to_value":"Set to the total number of pack-years if the patient's cumulative tobacco cigarette smoking exposure prior to study entry is known.","when_to_set_to_null":"Set to null if the patient's cumulative tobacco cigarette smoking exposure prior to study entry is unknown, not documented, or indeterminate.","meaning":"Numeric value representing the patient's cumulative tobacco cigarette smoking exposure in pack-years prior to study entry."} // "at least 10 pack-years of tobacco cigarette smoking before study entry"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (>= patient_cigarette_smoking_tobacco_value_recorded_inthehistory_withunit_pack_years 10)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have at least 10 pack-years of tobacco cigarette smoking before study entry."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_is_exposed_to_tobacco_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to tobacco in any form or route.","when_to_set_to_false":"Set to false if the patient is currently not exposed to tobacco in any form or route.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to tobacco.","meaning":"Boolean indicating whether the patient is currently exposed to tobacco."} // "tobacco"
(declare-const patient_is_exposed_to_tobacco_now@@not_smoked_while_using_supplemental_oxygen_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to tobacco and does not smoke tobacco cigarettes while using supplemental oxygen therapy.","when_to_set_to_false":"Set to false if the patient is currently exposed to tobacco and does smoke tobacco cigarettes while using supplemental oxygen therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient smokes tobacco cigarettes while using supplemental oxygen therapy.","meaning":"Boolean indicating whether the patient is currently exposed to tobacco and does not smoke tobacco cigarettes while using supplemental oxygen therapy."} // "the patient must agree (NOT to smoke tobacco cigarettes while using supplemental oxygen therapy)"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_is_exposed_to_tobacco_now@@not_smoked_while_using_supplemental_oxygen_therapy
         patient_is_exposed_to_tobacco_now)
     :named REQ8_AUXILIARY0)) ;; "the patient must agree (NOT to smoke tobacco cigarettes while using supplemental oxygen therapy)"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! patient_is_exposed_to_tobacco_now@@not_smoked_while_using_supplemental_oxygen_therapy
     :named REQ8_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must agree (NOT to smoke tobacco cigarettes while using supplemental oxygen therapy)"

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_has_insurance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any form of insurance coverage.","when_to_set_to_false":"Set to false if the patient currently does not have any form of insurance coverage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any form of insurance coverage.","meaning":"Boolean indicating whether the patient currently has any form of insurance coverage."} // "have insurance"
(declare-const patient_is_medicare_beneficiary_with_part_a_and_part_b_coverage_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a Medicare beneficiary and has both Part A and Part B coverage.","when_to_set_to_false":"Set to false if the patient is not currently a Medicare beneficiary with both Part A and Part B coverage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a Medicare beneficiary with both Part A and Part B coverage.","meaning":"Boolean indicating whether the patient is currently a Medicare beneficiary with both Part A and Part B coverage."} // "a Medicare beneficiary with both Part A and Part B coverage"
(declare-const patient_is_personally_willing_to_cover_medicare_typical_costs_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently personally willing to cover costs that are typically covered by Medicare.","when_to_set_to_false":"Set to false if the patient is not currently personally willing to cover costs that are typically covered by Medicare.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is personally willing to cover costs typically covered by Medicare.","meaning":"Boolean indicating whether the patient is currently personally willing to cover costs typically covered by Medicare."} // "be personally willing to cover costs typically covered by Medicare"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Component 0: To be included, the patient must be (a Medicare beneficiary with both Part A and Part B coverage) OR (have insurance) OR (be personally willing to cover costs typically covered by Medicare).
(assert
  (! (or patient_is_medicare_beneficiary_with_part_a_and_part_b_coverage_now
         patient_has_insurance_now
         patient_is_personally_willing_to_cover_medicare_typical_costs_now)
     :named REQ9_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be (a Medicare beneficiary with both Part A and Part B coverage) OR (have insurance) OR (be personally willing to cover costs typically covered by Medicare)."

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_has_approval_of_study_physician_for_randomization_to_either_treatment_group Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received explicit approval from the study physician for randomization to either treatment group.","when_to_set_to_false":"Set to false if the patient has not received approval from the study physician for randomization to either treatment group.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received approval from the study physician for randomization to either treatment group.","meaning":"Boolean indicating whether the patient has received approval from the study physician for randomization to either treatment group."} // "To be included, the patient must have approval of the study physician for randomization to either treatment group."

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
  (! patient_has_approval_of_study_physician_for_randomization_to_either_treatment_group
     :named REQ10_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have approval of the study physician for randomization to either treatment group."

;; ===================== Declarations for the criterion (REQ 11) =====================
(declare-const days_from_study_entry_initiation_to_completion_of_all_required_prerandomization_assessments Real) ;; {"when_to_set_to_value":"Set to the number of days between the date of study entry initiation and the date all required prerandomization assessments are completed.","when_to_set_to_null":"Set to null if either date is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of days from study entry initiation to completion of all required prerandomization assessments."} // "within sixty days of initiating study entry"
(declare-const patient_has_completed_all_required_prerandomization_assessments_within_60_days_of_study_entry_initiation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has completed all required prerandomization assessments within sixty (60) days of initiating study entry.","when_to_set_to_false":"Set to false if the patient has not completed all required prerandomization assessments within sixty (60) days of initiating study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has completed all required prerandomization assessments within sixty (60) days of initiating study entry.","meaning":"Boolean indicating whether the patient has completed all required prerandomization assessments within sixty days of initiating study entry."} // "must complete all required prerandomization assessments within sixty days of initiating study entry"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Definition in the requirement: patient_has_completed_all_required_prerandomization_assessments_within_60_days_of_study_entry_initiation is true iff days_from_study_entry_initiation_to_completion_of_all_required_prerandomization_assessments ≤ 60
(assert
  (! (= patient_has_completed_all_required_prerandomization_assessments_within_60_days_of_study_entry_initiation
        (<= days_from_study_entry_initiation_to_completion_of_all_required_prerandomization_assessments 60))
     :named REQ11_AUXILIARY0)) ;; "must complete all required prerandomization assessments within sixty days of initiating study entry"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! patient_has_completed_all_required_prerandomization_assessments_within_60_days_of_study_entry_initiation
     :named REQ11_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "must complete all required prerandomization assessments within sixty days of initiating study entry"

;; ===================== Declarations for the criterion (REQ 12) =====================
(declare-const days_from_eligibility_evaluation_initiation_to_randomization Real) ;; {"when_to_set_to_value":"Set to the number of days between the date eligibility evaluation was initiated and the date of patient randomization.","when_to_set_to_null":"Set to null if either the date of eligibility evaluation initiation or the date of randomization is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of days from eligibility evaluation initiation to randomization."} // "within sixty days of initiating eligibility evaluation"
(declare-const patient_has_been_randomized_within_60_days_of_eligibility_evaluation_initiation Bool) ;; {"when_to_set_to_true":"Set to true if the patient was randomized within 60 days of initiating eligibility evaluation.","when_to_set_to_false":"Set to false if the patient was not randomized within 60 days of initiating eligibility evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was randomized within 60 days of initiating eligibility evaluation.","meaning":"Boolean indicating whether the patient was randomized within 60 days of initiating eligibility evaluation."} // "randomized within sixty days of initiating eligibility evaluation"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Definition in the requirement: patient_has_been_randomized_within_60_days_of_eligibility_evaluation_initiation is true iff days_from_eligibility_evaluation_initiation_to_randomization <= 60
(assert
  (! (= patient_has_been_randomized_within_60_days_of_eligibility_evaluation_initiation
        (<= days_from_eligibility_evaluation_initiation_to_randomization 60))
     :named REQ12_AUXILIARY0)) ;; "randomized within sixty days of initiating eligibility evaluation"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
  (! patient_has_been_randomized_within_60_days_of_eligibility_evaluation_initiation
     :named REQ12_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be randomized within sixty days of initiating eligibility evaluation."

;; ===================== Declarations for the criterion (REQ 13) =====================
(declare-const patient_has_provided_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided consent.","when_to_set_to_false":"Set to false if the patient has not provided consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided consent.","meaning":"Boolean indicating whether the patient has provided consent."} // "To be included, the patient must provide consent."

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
  (! patient_has_provided_consent
     :named REQ13_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must provide consent."
