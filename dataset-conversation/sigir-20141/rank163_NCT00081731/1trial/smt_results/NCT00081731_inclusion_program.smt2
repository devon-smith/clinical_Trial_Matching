;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_hypertensive_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypertensive disorder (hypertension) at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of hypertensive disorder (hypertension) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a documented history of hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient has a documented history of hypertensive disorder (hypertension)."}
(declare-const patient_has_diagnosis_of_hypertensive_disorder_inthehistory@@while_taking_at_least_two_antihypertensive_medications Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of hypertensive disorder (hypertension) occurred while the patient was taking at least two antihypertensive medications.","when_to_set_to_false":"Set to false if the patient's history of hypertensive disorder (hypertension) did not occur while taking at least two antihypertensive medications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypertension occurred while taking at least two antihypertensive medications.","meaning":"Boolean indicating whether the patient's history of hypertension occurred while taking at least two antihypertensive medications."}
(declare-const patient_has_finding_of_renal_impairment_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a finding of renal impairment (renal dysfunction) at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a finding of renal impairment (renal dysfunction) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a finding of renal impairment (renal dysfunction).","meaning":"Boolean indicating whether the patient has a finding of renal impairment (renal dysfunction)."}
(declare-const patient_has_finding_of_chronic_kidney_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a finding of chronic kidney disease at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a finding of chronic kidney disease at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a finding of chronic kidney disease.","meaning":"Boolean indicating whether the patient has a finding of chronic kidney disease."}
(declare-const patient_has_finding_of_chronic_kidney_disease_inthehistory@@stage_3_or_greater Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chronic kidney disease is stage 3 or greater.","when_to_set_to_false":"Set to false if the patient's chronic kidney disease is not stage 3 or greater.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic kidney disease is stage 3 or greater.","meaning":"Boolean indicating whether the patient's chronic kidney disease is stage 3 or greater."}
(declare-const patient_has_finding_of_chronic_kidney_disease_inthehistory@@greater_stage Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chronic kidney disease is greater stage (above stage 3).","when_to_set_to_false":"Set to false if the patient's chronic kidney disease is not greater stage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic kidney disease is greater stage.","meaning":"Boolean indicating whether the patient's chronic kidney disease is greater stage (above stage 3)."}
(declare-const patient_glomerular_filtration_rate_value_recorded_now_withunit_milliliters_per_minute_per_1_73_square_meters Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's estimated glomerular filtration rate (GFR) in milliliters per minute per 1.73 square meters is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current estimated glomerular filtration rate (GFR) in milliliters per minute per 1.73 square meters."}

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable (hypertension while on meds)
(assert
  (! (=> patient_has_diagnosis_of_hypertensive_disorder_inthehistory@@while_taking_at_least_two_antihypertensive_medications
         patient_has_diagnosis_of_hypertensive_disorder_inthehistory)
     :named REQ0_AUXILIARY0)) ;; "have a documented history of hypertension while taking (at least two antihypertensive medications)"

;; Qualifier variable implies corresponding stem variable (CKD stage 3 or greater)
(assert
  (! (=> patient_has_finding_of_chronic_kidney_disease_inthehistory@@stage_3_or_greater
         patient_has_finding_of_chronic_kidney_disease_inthehistory)
     :named REQ0_AUXILIARY1)) ;; "stage 3 chronic kidney disease OR greater stage chronic kidney disease"

;; Qualifier variable implies corresponding stem variable (CKD greater stage)
(assert
  (! (=> patient_has_finding_of_chronic_kidney_disease_inthehistory@@greater_stage
         patient_has_finding_of_chronic_kidney_disease_inthehistory)
     :named REQ0_AUXILIARY2)) ;; "greater stage chronic kidney disease"

;; CKD stage 3 or greater is defined as GFR < 60 (per NKF classification)
(assert
  (! (= patient_has_finding_of_chronic_kidney_disease_inthehistory@@stage_3_or_greater
         (< patient_glomerular_filtration_rate_value_recorded_now_withunit_milliliters_per_minute_per_1_73_square_meters 60.0))
     :named REQ0_AUXILIARY3)) ;; "stage 3 chronic kidney disease OR greater stage chronic kidney disease (based on ... GFR < 60 mL/min/1.73m^2)"

;; Renal impairment (renal dysfunction) is defined as CKD stage 3 or greater or greater stage CKD
(assert
  (! (= patient_has_finding_of_renal_impairment_inthehistory
         (or patient_has_finding_of_chronic_kidney_disease_inthehistory@@stage_3_or_greater
             patient_has_finding_of_chronic_kidney_disease_inthehistory@@greater_stage))
     :named REQ0_AUXILIARY4)) ;; "renal dysfunction (defined as (stage 3 chronic kidney disease OR greater stage chronic kidney disease))"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Must have either (documented history of hypertension while on ≥2 antihypertensive meds) OR (renal dysfunction as defined above)
(assert
  (! (or patient_has_diagnosis_of_hypertensive_disorder_inthehistory@@while_taking_at_least_two_antihypertensive_medications
         patient_has_finding_of_renal_impairment_inthehistory)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((have a documented history of hypertension while taking (at least two antihypertensive medications)) OR (have renal dysfunction (defined as (stage 3 chronic kidney disease OR greater stage chronic kidney disease) ...)))"

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_renal_artery_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal artery stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal artery stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal artery stenosis.","meaning":"Boolean indicating whether the patient currently has renal artery stenosis."}
(declare-const patient_renal_artery_stenosis_percent_value_recorded_now_withunit_percent_by_renal_angiogram Real) ;; {"when_to_set_to_value":"Set to the measured percent stenosis if the renal artery stenosis is recorded now by renal angiogram.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the percent stenosis of the renal artery measured now by renal angiogram."}
(declare-const patient_renal_artery_systolic_velocity_value_recorded_now_withunit_centimeter_per_second_by_duplex_ultrasound Real) ;; {"when_to_set_to_value":"Set to the measured systolic velocity in centimeters per second if recorded now by duplex ultrasound.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the systolic velocity in centimeters per second of the renal artery measured now by duplex ultrasound."}
(declare-const patient_renal_artery_stenosis_percent_value_recorded_now_withunit_percent_by_magnetic_resonance_angiogram Real) ;; {"when_to_set_to_value":"Set to the measured percent stenosis if the renal artery stenosis is recorded now by magnetic resonance angiogram.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the percent stenosis of the renal artery measured now by magnetic resonance angiogram."}
(declare-const patient_has_spin_dephasing_on_three_dimensional_phase_contrast_magnetic_resonance_angiogram_now Bool) ;; {"when_to_set_to_true":"Set to true if spin dephasing is observed on three-dimensional phase contrast magnetic resonance angiogram now.","when_to_set_to_false":"Set to false if spin dephasing is not observed on three-dimensional phase contrast magnetic resonance angiogram now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether spin dephasing is observed on three-dimensional phase contrast magnetic resonance angiogram now.","meaning":"Boolean indicating whether the patient currently has spin dephasing on three-dimensional phase contrast magnetic resonance angiogram."}
(declare-const patient_ischemia_of_kidney_value_recorded_now_withunit_centimeter Real) ;; {"when_to_set_to_value":"Set to the measured length in centimeters if the ischemic kidney length is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the length of the ischemic kidney in centimeters measured now."}
(declare-const patient_contralateral_kidney_length_value_recorded_now_withunit_centimeter Real) ;; {"when_to_set_to_value":"Set to the measured length in centimeters if the contralateral kidney length is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the length of the contralateral (non-ischemic) kidney in centimeters measured now."}
(declare-const patient_has_finding_of_ischemia_of_kidney_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of ischemia of kidney.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of ischemia of kidney.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of ischemia of kidney.","meaning":"Boolean indicating whether the patient currently has a finding of ischemia of kidney."}
(declare-const patient_has_finding_of_ischemia_of_kidney_now@@less_enhancement_on_arterial_phase Bool) ;; {"when_to_set_to_true":"Set to true if the ischemic kidney shows less enhancement on arterial phase imaging now.","when_to_set_to_false":"Set to false if the ischemic kidney does not show less enhancement on arterial phase imaging now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ischemic kidney shows less enhancement on arterial phase imaging now.","meaning":"Boolean indicating whether the ischemic kidney shows less enhancement on arterial phase imaging now."}
(declare-const patient_has_finding_of_ischemia_of_kidney_now@@delayed_gadolinium_excretion Bool) ;; {"when_to_set_to_true":"Set to true if the ischemic kidney has delayed gadolinium excretion now.","when_to_set_to_false":"Set to false if the ischemic kidney does not have delayed gadolinium excretion now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ischemic kidney has delayed gadolinium excretion now.","meaning":"Boolean indicating whether the ischemic kidney has delayed gadolinium excretion now."}
(declare-const patient_has_finding_of_ischemia_of_kidney_now@@hyper_concentration_of_urine Bool) ;; {"when_to_set_to_true":"Set to true if the ischemic kidney has hyper-concentration of urine now.","when_to_set_to_false":"Set to false if the ischemic kidney does not have hyper-concentration of urine now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ischemic kidney has hyper-concentration of urine now.","meaning":"Boolean indicating whether the ischemic kidney has hyper-concentration of urine now."}
(declare-const patient_has_two_dimensional_phase_contrast_flow_waveform_showing_delayed_systolic_peak_now Bool) ;; {"when_to_set_to_true":"Set to true if a two-dimensional phase contrast flow waveform shows delayed systolic peak now.","when_to_set_to_false":"Set to false if a two-dimensional phase contrast flow waveform does not show delayed systolic peak now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a two-dimensional phase contrast flow waveform shows delayed systolic peak now.","meaning":"Boolean indicating whether the patient currently has a two-dimensional phase contrast flow waveform showing delayed systolic peak."}
(declare-const patient_has_finding_of_post_stenotic_dilation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of post-stenotic dilation.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of post-stenotic dilation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of post-stenotic dilation.","meaning":"Boolean indicating whether the patient currently has a finding of post-stenotic dilation."}
(declare-const patient_has_undergone_magnetic_resonance_imaging_mri_of_vessels_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a magnetic resonance angiogram (MRI of vessels).","when_to_set_to_false":"Set to false if the patient has never undergone a magnetic resonance angiogram (MRI of vessels).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a magnetic resonance angiogram (MRI of vessels).","meaning":"Boolean indicating whether the patient has ever undergone a magnetic resonance angiogram (MRI of vessels)."}
(declare-const patient_renal_artery_stenosis_percent_value_recorded_now_withunit_percent_by_computed_tomography_angiography Real) ;; {"when_to_set_to_value":"Set to the measured percent stenosis if the renal artery stenosis is recorded now by computed tomography angiography.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the percent stenosis of the renal artery measured now by computed tomography angiography."}
(declare-const patient_has_undergone_ct_angiography_inthehistory@@core_laboratory_approved Bool) ;; {"when_to_set_to_true":"Set to true if the computed tomography angiography was Core Laboratory approved.","when_to_set_to_false":"Set to false if the computed tomography angiography was not Core Laboratory approved.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the computed tomography angiography was Core Laboratory approved.","meaning":"Boolean indicating whether the computed tomography angiography was Core Laboratory approved."}
(declare-const patient_has_clinical_index_of_suspicion_for_renal_artery_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical index of suspicion for renal artery stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical index of suspicion for renal artery stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical index of suspicion for renal artery stenosis.","meaning":"Boolean indicating whether the patient currently has a clinical index of suspicion for renal artery stenosis."}
(declare-const patient_has_finding_of_ischemia_of_kidney_now@@reduced_cortical_thickness Bool) ;; {"when_to_set_to_true":"Set to true if the ischemic kidney has reduced cortical thickness now.","when_to_set_to_false":"Set to false if the ischemic kidney does not have reduced cortical thickness now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ischemic kidney has reduced cortical thickness now.","meaning":"Boolean indicating whether the ischemic kidney has reduced cortical thickness now."}
(declare-const patient_has_finding_of_ischemia_of_kidney_now@@less_cortical_enhancement_on_arterial_phase Bool) ;; {"when_to_set_to_true":"Set to true if the ischemic kidney has less cortical enhancement on arterial phase now.","when_to_set_to_false":"Set to false if the ischemic kidney does not have less cortical enhancement on arterial phase now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ischemic kidney has less cortical enhancement on arterial phase now.","meaning":"Boolean indicating whether the ischemic kidney has less cortical enhancement on arterial phase now."}

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: ischemic kidney length > 1 cm smaller than contralateral kidney length
(define-fun ischemic_kidney_length_diff_gt_1cm_smaller () Bool
  (< (- patient_ischemia_of_kidney_value_recorded_now_withunit_centimeter patient_contralateral_kidney_length_value_recorded_now_withunit_centimeter) -1.0)) ;; "ischemic kidney length greater than 1 centimeter smaller than contralateral kidney length"

;; Definition: at least two of the following MRI findings
(define-fun mri_ischemic_kidney_additional_criteria_count () Int
  (+ (ite ischemic_kidney_length_diff_gt_1cm_smaller 1 0)
     (ite patient_has_finding_of_ischemia_of_kidney_now@@less_enhancement_on_arterial_phase 1 0)
     (ite patient_has_finding_of_ischemia_of_kidney_now@@delayed_gadolinium_excretion 1 0)
     (ite patient_has_finding_of_ischemia_of_kidney_now@@hyper_concentration_of_urine 1 0)
     (ite patient_has_two_dimensional_phase_contrast_flow_waveform_showing_delayed_systolic_peak_now 1 0)
     (ite patient_has_finding_of_post_stenotic_dilation_now 1 0))) ;; "at least two of the following MRI findings"

(define-fun mri_ischemic_kidney_additional_criteria_met () Bool
  (>= mri_ischemic_kidney_additional_criteria_count 2)) ;; "at least two of the following MRI findings"

;; Definition: at least two of the following CT findings
(define-fun ct_ischemic_kidney_additional_criteria_count () Int
  (+ (ite ischemic_kidney_length_diff_gt_1cm_smaller 1 0)
     (ite patient_has_finding_of_ischemia_of_kidney_now@@reduced_cortical_thickness 1 0)
     (ite patient_has_finding_of_ischemia_of_kidney_now@@less_cortical_enhancement_on_arterial_phase 1 0)
     (ite patient_has_finding_of_post_stenotic_dilation_now 1 0))) ;; "at least two of the following CT findings"

(define-fun ct_ischemic_kidney_additional_criteria_met () Bool
  (>= ct_ischemic_kidney_additional_criteria_count 2)) ;; "at least two of the following CT findings"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: At least one severe renal artery stenosis by at least one of the following pathways
(assert
  (!
    (or
      ;; Angiographic pathway: stenosis >= 60% AND < 100% by renal angiogram
      (and
        (>= patient_renal_artery_stenosis_percent_value_recorded_now_withunit_percent_by_renal_angiogram 60.0)
        (< patient_renal_artery_stenosis_percent_value_recorded_now_withunit_percent_by_renal_angiogram 100.0)
      )
      ;; Duplex pathway: systolic velocity > 300 cm/sec
      (> patient_renal_artery_systolic_velocity_value_recorded_now_withunit_centimeter_per_second_by_duplex_ultrasound 300.0)
      ;; Core Lab approved magnetic resonance angiogram pathway
      (and
        patient_has_undergone_magnetic_resonance_imaging_mri_of_vessels_inthehistory
        (or
          (> patient_renal_artery_stenosis_percent_value_recorded_now_withunit_percent_by_magnetic_resonance_angiogram 80.0)
          (and
            (> patient_renal_artery_stenosis_percent_value_recorded_now_withunit_percent_by_magnetic_resonance_angiogram 70.0)
            patient_has_spin_dephasing_on_three_dimensional_phase_contrast_magnetic_resonance_angiogram_now
          )
          (and
            (> patient_renal_artery_stenosis_percent_value_recorded_now_withunit_percent_by_magnetic_resonance_angiogram 70.0)
            mri_ischemic_kidney_additional_criteria_met
          )
        )
      )
      ;; Clinical index of suspicion AND Core Lab approved CT angiography pathway
      (and
        patient_has_clinical_index_of_suspicion_for_renal_artery_stenosis_now
        patient_has_undergone_ct_angiography_inthehistory@@core_laboratory_approved
        (or
          (> patient_renal_artery_stenosis_percent_value_recorded_now_withunit_percent_by_computed_tomography_angiography 80.0)
          (and
            (> patient_renal_artery_stenosis_percent_value_recorded_now_withunit_percent_by_computed_tomography_angiography 70.0)
            ct_ischemic_kidney_additional_criteria_met
          )
        )
      )
    )
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS
  )
) ;; "To be included, the patient must have at least one severe renal artery stenosis by at least one of the following pathways: ..."
