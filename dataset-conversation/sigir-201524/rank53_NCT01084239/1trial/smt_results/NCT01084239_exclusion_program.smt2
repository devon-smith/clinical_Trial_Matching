;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_ekg_myocardial_ischemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ischemic electrocardiogram changes (myocardial ischemia) on ECG.","when_to_set_to_false":"Set to false if the patient currently does not have ischemic electrocardiogram changes (myocardial ischemia) on ECG.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ischemic electrocardiogram changes (myocardial ischemia) on ECG.","meaning":"Boolean indicating whether the patient currently has ischemic electrocardiogram changes (myocardial ischemia) on ECG."} ;; "ischemic electrocardiogram changes"

(declare-const patient_has_finding_of_ekg_myocardial_ischemia_now@@present_in_more_than_two_anatomically_adjacent_leads Bool) ;; {"when_to_set_to_true":"Set to true if the patient's ischemic electrocardiogram changes are present in more than two anatomically adjacent leads.","when_to_set_to_false":"Set to false if the patient's ischemic electrocardiogram changes are present in two or fewer anatomically adjacent leads, or not present in anatomically adjacent leads.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's ischemic electrocardiogram changes are present in more than two anatomically adjacent leads.","meaning":"Boolean indicating whether the patient's ischemic electrocardiogram changes are present in more than two anatomically adjacent leads."} ;; "ischemic electrocardiogram changes ... in more than two anatomically adjacent leads"

(declare-const patient_has_finding_of_left_bundle_branch_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has left bundle branch block.","when_to_set_to_false":"Set to false if the patient currently does not have left bundle branch block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has left bundle branch block.","meaning":"Boolean indicating whether the patient currently has left bundle branch block."} ;; "left bundle branch block"

(declare-const patient_inverted_t_wave_value_recorded_now_withunit_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value in millimeters if a current T-wave inversion measurement is available.","when_to_set_to_null":"Set to null if no current T-wave inversion measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current T-wave inversion in millimeters."} ;; "T-wave inversion greater than 4 millimeters"

(declare-const patient_st_segment_depression_value_recorded_now_withunit_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value in millimeters if a current ST-segment depression measurement is available.","when_to_set_to_null":"Set to null if no current ST-segment depression measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current ST-segment depression in millimeters."} ;; "ST-segment depression greater than 1 millimeter"

(declare-const patient_st_segment_elevation_value_recorded_now_withunit_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value in millimeters if a current ST-segment elevation measurement is available.","when_to_set_to_null":"Set to null if no current ST-segment elevation measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current ST-segment elevation in millimeters."} ;; "ST-segment elevation greater than 1 millimeter"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition: "new diagnostic ischemic electrocardiogram changes" = (ST-segment elevation > 1 mm OR ST-segment depression > 1 mm OR T-wave inversion > 4 mm)
(assert
(! (= patient_has_finding_of_ekg_myocardial_ischemia_now
(or
  (> patient_st_segment_elevation_value_recorded_now_withunit_millimeter 1)
  (> patient_st_segment_depression_value_recorded_now_withunit_millimeter 1)
  (> patient_inverted_t_wave_value_recorded_now_withunit_millimeter 4)
))
:named REQ0_AUXILIARY0)) ;; "defined as (ST-segment elevation greater than 1 millimeter OR ST-segment depression greater than 1 millimeter OR T-wave inversion greater than 4 millimeters)"

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_ekg_myocardial_ischemia_now@@present_in_more_than_two_anatomically_adjacent_leads
      patient_has_finding_of_ekg_myocardial_ischemia_now)
:named REQ0_AUXILIARY1)) ;; "ischemic electrocardiogram changes ... in more than two anatomically adjacent leads"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have (new diagnostic ischemic ECG changes in >2 adjacent leads) OR (left bundle branch block)
(assert
(! (not
      (or
        patient_has_finding_of_ekg_myocardial_ischemia_now@@present_in_more_than_two_anatomically_adjacent_leads
        patient_has_finding_of_left_bundle_branch_block_now
      )
   )
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "((the patient has new diagnostic ischemic electrocardiogram changes defined as (ST-segment elevation greater than 1 millimeter) OR (ST-segment depression greater than 1 millimeter) OR (T-wave inversion greater than 4 millimeters)) in more than two anatomically adjacent leads) OR (the patient has left bundle branch block)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of coronary artery disease at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented diagnosis of coronary artery disease at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a documented diagnosis of coronary artery disease in the past.","meaning":"Boolean indicating whether the patient has a documented history of coronary artery disease."} ;; "the patient has a documented history of coronary artery disease"

(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@self_reported Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of coronary artery disease is self-reported.","when_to_set_to_false":"Set to false if the patient's history of coronary artery disease is not self-reported.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient's history of coronary artery disease is self-reported.","meaning":"Boolean indicating whether the patient's history of coronary artery disease is self-reported."} ;; "the patient has a self-reported history of coronary artery disease"

(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of myocardial infarction at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented diagnosis of myocardial infarction at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a documented diagnosis of myocardial infarction in the past.","meaning":"Boolean indicating whether the patient has a history of myocardial infarction."} ;; "the patient has a history of myocardial infarction"

(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone percutaneous coronary intervention at any time in the past.","when_to_set_to_false":"Set to false if the patient has not undergone percutaneous coronary intervention at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone percutaneous coronary intervention in the past.","meaning":"Boolean indicating whether the patient has a history of percutaneous coronary intervention."} ;; "the patient has a history of percutaneous coronary intervention"

(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone coronary artery bypass graft at any time in the past.","when_to_set_to_false":"Set to false if the patient has not undergone coronary artery bypass graft at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone coronary artery bypass graft in the past.","meaning":"Boolean indicating whether the patient has a history of coronary artery bypass graft."} ;; "the patient has a history of coronary artery bypass graft"

(declare-const patient_coronary_artery_stenosis_value_recorded_inthehistory_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percent value if a numeric measurement of coronary artery stenosis recorded at any time in the past is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percent representing the patient's maximum recorded coronary artery stenosis in the past."} ;; "the patient has a history of significant coronary artery stenosis defined as greater than 50 percent"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a documented history of coronary artery disease."

(assert
(! (not patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@self_reported)
    :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a self-reported history of coronary artery disease."

(assert
(! (not patient_has_diagnosis_of_myocardial_infarction_inthehistory)
    :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of myocardial infarction."

(assert
(! (not patient_has_undergone_percutaneous_coronary_intervention_inthehistory)
    :named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of percutaneous coronary intervention."

(assert
(! (not patient_has_undergone_coronary_artery_bypass_graft_inthehistory)
    :named REQ1_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of coronary artery bypass graft."

(assert
(! (not (> patient_coronary_artery_stenosis_value_recorded_inthehistory_withunit_percent 50))
    :named REQ1_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of significant coronary artery stenosis defined as greater than 50 percent."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_time_since_presentation_to_emergency_department_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours since the patient presented to the emergency department, as documented in the medical record.","when_to_set_to_null":"Set to null if the time since presentation to the emergency department is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of hours since the patient presented to the emergency department."} ;; "the patient has presented to the emergency department more than 6 hours ago"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (> patient_time_since_presentation_to_emergency_department_in_hours 6))
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has presented to the emergency department more than 6 hours ago."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter Real) ;; {"when_to_set_to_value":"Set to the measured BMI value if a numeric measurement of the patient's body mass index (BMI) in kilograms per square meter is recorded now.","when_to_set_to_null":"Set to null if no such BMI measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kilograms per square meter."} ;; "body mass index"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (> patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 40))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a body mass index greater than 40 kilograms per square meter."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_creatinine_measurement_serum_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if a serum creatinine measurement in mg/dL is available for the patient now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum creatinine measurement in milligrams per deciliter (mg/dL)."} ;; "serum creatinine greater than 1.5 milligrams per deciliter"
(declare-const patient_has_finding_of_renal_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of impaired renal function (renal impairment).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of impaired renal function (renal impairment).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has impaired renal function.","meaning":"Boolean indicating whether the patient currently has impaired renal function (renal impairment)."} ;; "impaired renal function"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition: impaired renal function is defined as serum creatinine > 1.5 mg/dL
(assert
(! (= patient_has_finding_of_renal_impairment_now
     (> patient_creatinine_measurement_serum_value_recorded_now_withunit_milligrams_per_deciliter 1.5))
:named REQ4_AUXILIARY0)) ;; "impaired renal function defined as serum creatinine greater than 1.5 milligrams per deciliter."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_renal_impairment_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has impaired renal function defined as serum creatinine greater than 1.5 milligrams per deciliter."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_troponin_t_value_recorded_now_withunit_nanograms_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current troponin-T concentration in nanograms per milliliter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current troponin-T concentration in ng/mL."} ;; "troponin-T"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (> patient_troponin_t_value_recorded_now_withunit_nanograms_per_milliliter 0.09))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has elevated troponin-T defined as greater than 0.09 nanograms per milliliter."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_hemodynamic_instability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hemodynamic instability.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hemodynamic instability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hemodynamic instability.","meaning":"Boolean indicating whether the patient currently has hemodynamic instability."} ;; "hemodynamically unstable condition"
(declare-const systolic_blood_pressure_value_recorded_now_withunit_mm_hg Real) ;; {"when_to_set_to_value":"Set to the patient's current systolic blood pressure value measured in mm Hg.","when_to_set_to_null":"Set to null if the patient's current systolic blood pressure value is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current systolic blood pressure in mm Hg."} ;; "systolic blood pressure less than 80 millimeters of mercury"
(declare-const patient_has_finding_of_patient_s_condition_unstable_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of clinical instability.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of clinical instability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of clinical instability.","meaning":"Boolean indicating whether the patient currently has clinical instability."} ;; "clinically unstable condition"
(declare-const patient_has_finding_of_atrial_arrhythmia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has atrial arrhythmia.","when_to_set_to_false":"Set to false if the patient currently does not have atrial arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has atrial arrhythmia.","meaning":"Boolean indicating whether the patient currently has atrial arrhythmia."} ;; "atrial arrhythmia"
(declare-const patient_has_finding_of_ventricular_arrhythmia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ventricular arrhythmia.","when_to_set_to_false":"Set to false if the patient currently does not have ventricular arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ventricular arrhythmia.","meaning":"Boolean indicating whether the patient currently has ventricular arrhythmia."} ;; "ventricular arrhythmia"
(declare-const patient_has_finding_of_persistent_chest_pain_despite_adequate_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has persistent chest pain despite adequate therapy.","when_to_set_to_false":"Set to false if the patient currently does not have persistent chest pain despite adequate therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has persistent chest pain despite adequate therapy.","meaning":"Boolean indicating whether the patient currently has persistent chest pain despite adequate therapy."} ;; "persistent chest pain despite adequate therapy"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Definition: Hemodynamically unstable condition is defined as systolic blood pressure < 80 mm Hg
(assert
(! (= patient_has_finding_of_hemodynamic_instability_now
(< systolic_blood_pressure_value_recorded_now_withunit_mm_hg 80))
:named REQ6_AUXILIARY0)) ;; "hemodynamically unstable condition defined as systolic blood pressure less than 80 millimeters of mercury"

;; Definition: Clinically unstable condition is defined as (systolic blood pressure < 80 mm Hg) OR (atrial arrhythmia) OR (ventricular arrhythmia) OR (persistent chest pain despite adequate therapy)
(assert
(! (= patient_has_finding_of_patient_s_condition_unstable_now
(or (< systolic_blood_pressure_value_recorded_now_withunit_mm_hg 80)
    patient_has_finding_of_atrial_arrhythmia_now
    patient_has_finding_of_ventricular_arrhythmia_now
    patient_has_finding_of_persistent_chest_pain_despite_adequate_therapy_now))
:named REQ6_AUXILIARY1)) ;; "clinically unstable condition defined as (systolic blood pressure less than 80 millimeters of mercury OR atrial arrhythmia OR ventricular arrhythmia OR persistent chest pain despite adequate therapy)"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient must NOT have a hemodynamically unstable condition
(assert
(! (not patient_has_finding_of_hemodynamic_instability_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a hemodynamically unstable condition defined as systolic blood pressure less than 80 millimeters of mercury."

;; Exclusion: patient must NOT have a clinically unstable condition
(assert
(! (not patient_has_finding_of_patient_s_condition_unstable_now)
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a clinically unstable condition defined as (systolic blood pressure less than 80 millimeters of mercury OR atrial arrhythmia OR ventricular arrhythmia OR persistent chest pain despite adequate therapy)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_allergy_to_iodinated_contrast_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known allergy to iodinated contrast agent.","when_to_set_to_false":"Set to false if the patient currently does not have a known allergy to iodinated contrast agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known allergy to iodinated contrast agent.","meaning":"Boolean indicating whether the patient currently has a known allergy to iodinated contrast agent."} ;; "The patient is excluded if the patient has a known allergy to iodinated contrast agent."

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not patient_has_allergy_to_iodinated_contrast_agent_now)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known allergy to iodinated contrast agent."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of asthma.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of asthma.","meaning":"Boolean indicating whether the patient currently has asthma."} ;; "asthma"
(declare-const patient_has_finding_of_asthma_now@@symptomatic Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has asthma and the asthma is symptomatic (i.e., the patient is experiencing symptoms attributable to asthma).","when_to_set_to_false":"Set to false if the patient currently has asthma but it is not symptomatic (i.e., the patient is not experiencing symptoms attributable to asthma).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current asthma is symptomatic.","meaning":"Boolean indicating whether the patient's current asthma is symptomatic."} ;; "symptomatic asthma"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_asthma_now@@symptomatic
      patient_has_finding_of_asthma_now)
   :named REQ8_AUXILIARY0)) ;; "currently has symptomatic asthma"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_asthma_now@@symptomatic)
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient currently has symptomatic asthma."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_documented_cocaine_use_within_past_48_hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has documented evidence of cocaine use that occurred within the past 48 hours.","when_to_set_to_false":"Set to false if the patient does not have documented evidence of cocaine use within the past 48 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has documented cocaine use within the past 48 hours.","meaning":"Boolean indicating whether the patient has documented cocaine use within the past 48 hours."} ;; "the patient has documented cocaine use within the past 48 hours"
(declare-const patient_has_self_reported_cocaine_use_within_past_48_hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has self-reported cocaine use that occurred within the past 48 hours.","when_to_set_to_false":"Set to false if the patient has not self-reported cocaine use within the past 48 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has self-reported cocaine use within the past 48 hours.","meaning":"Boolean indicating whether the patient has self-reported cocaine use within the past 48 hours."} ;; "the patient has self-reported cocaine use within the past 48 hours (acute)"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (not (or patient_has_documented_cocaine_use_within_past_48_hours
              patient_has_self_reported_cocaine_use_within_past_48_hours))
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has documented cocaine use within the past 48 hours) OR (the patient has self-reported cocaine use within the past 48 hours (acute))."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_is_exposed_to_metformin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or taking metformin.","when_to_set_to_false":"Set to false if the patient is currently not receiving or taking metformin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving or taking metformin.","meaning":"Boolean indicating whether the patient is currently exposed to metformin."} ;; "metformin"
(declare-const patient_is_exposed_to_metformin_now@@unable_to_discontinue_for_48_hours_after_computed_tomography_scan Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to metformin and is unable to discontinue metformin therapy for forty-eight hours after the computed tomography scan.","when_to_set_to_false":"Set to false if the patient is currently exposed to metformin and is able to discontinue metformin therapy for forty-eight hours after the computed tomography scan.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unable to discontinue metformin therapy for forty-eight hours after the computed tomography scan.","meaning":"Boolean indicating whether the patient is unable to discontinue metformin for forty-eight hours after a CT scan while currently exposed to metformin."} ;; "unable to discontinue metformin therapy for forty-eight hours after the computed tomography scan"
(declare-const patient_is_exposed_to_metformin_now@@unwilling_to_discontinue_for_48_hours_after_computed_tomography_scan Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to metformin and is unwilling to discontinue metformin therapy for forty-eight hours after the computed tomography scan.","when_to_set_to_false":"Set to false if the patient is currently exposed to metformin and is willing to discontinue metformin therapy for forty-eight hours after the computed tomography scan.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unwilling to discontinue metformin therapy for forty-eight hours after the computed tomography scan.","meaning":"Boolean indicating whether the patient is unwilling to discontinue metformin for forty-eight hours after a CT scan while currently exposed to metformin."} ;; "unwilling to discontinue metformin therapy for forty-eight hours after the computed tomography scan"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_exposed_to_metformin_now@@unable_to_discontinue_for_48_hours_after_computed_tomography_scan
       patient_is_exposed_to_metformin_now)
:named REQ10_AUXILIARY0)) ;; "unable to discontinue metformin therapy for forty-eight hours after the computed tomography scan"

(assert
(! (=> patient_is_exposed_to_metformin_now@@unwilling_to_discontinue_for_48_hours_after_computed_tomography_scan
       patient_is_exposed_to_metformin_now)
:named REQ10_AUXILIARY1)) ;; "unwilling to discontinue metformin therapy for forty-eight hours after the computed tomography scan"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Exclusion: patient is on metformin AND (unable OR unwilling to discontinue for 48 hours after CT scan)
(assert
(! (not (and patient_is_exposed_to_metformin_now
             (or patient_is_exposed_to_metformin_now@@unable_to_discontinue_for_48_hours_after_computed_tomography_scan
                 patient_is_exposed_to_metformin_now@@unwilling_to_discontinue_for_48_hours_after_computed_tomography_scan)))
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is on metformin therapy) AND (the patient is unable to discontinue metformin therapy for forty-eight hours after the computed tomography scan OR the patient is unwilling to discontinue metformin therapy for forty-eight hours after the computed tomography scan)."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_contraindication_to_beta_blocker_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to beta blocker therapy.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to beta blocker therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to beta blocker therapy.","meaning":"Boolean indicating whether the patient currently has a contraindication to beta blocker therapy."} ;; "the patient has a contraindication to beta blocker therapy"
(declare-const patient_has_contraindication_to_beta_blocker_therapy_now@@taking_daily_antiasthmatic_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's contraindication to beta blocker therapy is due to taking daily antiasthmatic medication.","when_to_set_to_false":"Set to false if the patient's contraindication to beta blocker therapy is not due to taking daily antiasthmatic medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's contraindication to beta blocker therapy is due to taking daily antiasthmatic medication.","meaning":"Boolean indicating whether the patient's contraindication to beta blocker therapy is due to taking daily antiasthmatic medication."} ;; "taking daily antiasthmatic medication"
(declare-const heart_rate_value_recorded_now_withunit_beats_per_minute Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's heart rate recorded now, in units of beats per minute.","when_to_set_to_null":"Set to null if the patient's heart rate value recorded now is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's heart rate recorded now, in units of beats per minute."} ;; "heart rate greater than sixty-five beats per minute"
(declare-const site_is_using_non_dual_source_computed_tomography_scanner_now Bool) ;; {"when_to_set_to_true":"Set to true if the site is currently using a non-dual source computed tomography scanner.","when_to_set_to_false":"Set to false if the site is currently not using a non-dual source computed tomography scanner.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the site is currently using a non-dual source computed tomography scanner.","meaning":"Boolean indicating whether the site is currently using a non-dual source computed tomography scanner."} ;; "the patient is at a site using a non-dual source computed tomography scanner"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Non-exhaustive example: taking daily antiasthmatic medication implies contraindication to beta blocker therapy
(assert
(! (=> patient_has_contraindication_to_beta_blocker_therapy_now@@taking_daily_antiasthmatic_medication
      patient_has_contraindication_to_beta_blocker_therapy_now)
   :named REQ11_AUXILIARY0)) ;; "with non-exhaustive examples (taking daily antiasthmatic medication)"

;; ===================== Constraint Assertions (REQ 11) =====================
;; Exclusion: patient must NOT satisfy all three exclusion conditions
(assert
(! (not (and patient_has_contraindication_to_beta_blocker_therapy_now
             (> heart_rate_value_recorded_now_withunit_beats_per_minute 65)
             site_is_using_non_dual_source_computed_tomography_scanner_now))
   :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a contraindication to beta blocker therapy with non-exhaustive examples (taking daily antiasthmatic medication)) AND (the patient has a heart rate greater than sixty-five beats per minute) AND (the patient is at a site using a non-dual source computed tomography scanner)."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const lack_of_contact_information_prevents_follow_up Bool) ;; {"when_to_set_to_true":"Set to true if the lack of telephone number, cell phone number, or address prevents follow-up with the patient.","when_to_set_to_false":"Set to false if the lack of telephone number, cell phone number, or address does not prevent follow-up with the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lack of contact information prevents follow-up.","meaning":"Boolean indicating whether the lack of contact information prevents follow-up with the patient."} ;; "this prevents follow-up"
(declare-const patient_has_address_recorded Bool) ;; {"when_to_set_to_true":"Set to true if the patient has an address recorded in their records.","when_to_set_to_false":"Set to false if the patient does not have an address recorded in their records.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has an address recorded.","meaning":"Boolean indicating whether the patient has an address recorded."} ;; "the patient has no address"
(declare-const patient_has_cell_phone_number_recorded Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a cell phone number recorded in their records.","when_to_set_to_false":"Set to false if the patient does not have a cell phone number recorded in their records.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a cell phone number recorded.","meaning":"Boolean indicating whether the patient has a cell phone number recorded."} ;; "the patient has no cell phone number"
(declare-const patient_has_telephone_number_recorded Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a telephone number recorded in their records.","when_to_set_to_false":"Set to false if the patient does not have a telephone number recorded in their records.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a telephone number recorded.","meaning":"Boolean indicating whether the patient has a telephone number recorded."} ;; "the patient has no telephone number"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not (and
         lack_of_contact_information_prevents_follow_up
         (or (not patient_has_telephone_number_recorded)
             (not patient_has_cell_phone_number_recorded)
             (not patient_has_address_recorded))))
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has no telephone number OR the patient has no cell phone number OR the patient has no address) AND this prevents follow-up)."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if a pregnancy test performed within the required timeframe is positive, indicating the patient is currently pregnant.","when_to_set_to_false":"Set to false if a pregnancy test performed within the required timeframe is negative, indicating the patient is not currently pregnant.","when_to_set_to_null":"Set to null if no pregnancy test was performed within the required timeframe or if the result is unknown.","meaning":"Boolean value indicating whether the patient is currently pregnant, as determined by a pregnancy test performed within the required timeframe."} ;; "the patient has a positive pregnancy test"

(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is female and has childbearing potential (i.e., less than two years since menopause and has not had a hysterectomy or tubal ligation).","when_to_set_to_false":"Set to false if the patient is not female, or is female but more than two years post-menopause, or has had a hysterectomy or tubal ligation.","when_to_set_to_null":"Set to null if the patient's childbearing potential status cannot be determined from available information.","meaning":"Boolean value indicating whether the patient currently has childbearing potential, as defined by being female, less than two years post-menopause without hysterectomy or tubal ligation."} ;; "For women of childbearing potential (defined as less than two years of menopause in the absence of hysterectomy OR tubal ligation)"

(declare-const patient_has_undergone_hysterectomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone hysterectomy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone hysterectomy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone hysterectomy.","meaning":"Boolean indicating whether the patient has ever undergone hysterectomy."} ;; "hysterectomy"

(declare-const patient_has_undergone_ligation_of_fallopian_tube_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone ligation of fallopian tube (tubal ligation) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone ligation of fallopian tube (tubal ligation).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone ligation of fallopian tube (tubal ligation).","meaning":"Boolean indicating whether the patient has ever undergone ligation of fallopian tube (tubal ligation)."} ;; "tubal ligation"

(declare-const patient_will_undergo_computerized_axial_tomography_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to undergo a computed tomography scan in the future.","when_to_set_to_false":"Set to false if the patient is not scheduled to undergo a computed tomography scan in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is scheduled to undergo a computed tomography scan in the future.","meaning":"Boolean indicating whether the patient is scheduled to undergo a computed tomography scan in the future."} ;; "computed tomography scan"

(declare-const patient_will_undergo_computerized_axial_tomography_inthefuture@@pregnancy_test_performed_within_24_hours_before Bool) ;; {"when_to_set_to_true":"Set to true if a pregnancy test is performed within twenty-four hours before the scheduled computed tomography scan.","when_to_set_to_false":"Set to false if a pregnancy test is not performed within twenty-four hours before the scheduled computed tomography scan.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a pregnancy test is performed within twenty-four hours before the scheduled computed tomography scan.","meaning":"Boolean indicating whether a pregnancy test is performed within twenty-four hours before the scheduled computed tomography scan."} ;; "the patient must have a pregnancy test performed within twenty-four hours before the computed tomography scan"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Definition of childbearing potential per requirement
(assert
(! (= patient_has_childbearing_potential_now
(and
  ;; less than two years of menopause (not encoded here, assumed handled elsewhere if needed)
  (not patient_has_undergone_hysterectomy_inthehistory)
  (not patient_has_undergone_ligation_of_fallopian_tube_inthehistory)
))
:named REQ13_AUXILIARY0)) ;; "defined as less than two years of menopause in the absence of hysterectomy OR tubal ligation"

;; Pregnancy test qualifier variable implies CT scan scheduled
(assert
(! (=> patient_will_undergo_computerized_axial_tomography_inthefuture@@pregnancy_test_performed_within_24_hours_before
       patient_will_undergo_computerized_axial_tomography_inthefuture)
:named REQ13_AUXILIARY1)) ;; "pregnancy test performed within twenty-four hours before the computed tomography scan"

;; ===================== Constraint Assertions (REQ 13) =====================
;; Exclusion: patient has a positive pregnancy test
(assert
(! (not patient_is_pregnant_now)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a positive pregnancy test."

;; Exclusion: woman of childbearing potential scheduled for CT scan who has NOT had a pregnancy test performed within 24 hours before scan
(assert
(! (not (and patient_has_childbearing_potential_now
             patient_will_undergo_computerized_axial_tomography_inthefuture
             (not patient_will_undergo_computerized_axial_tomography_inthefuture@@pregnancy_test_performed_within_24_hours_before)))
:named REQ13_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "For women of childbearing potential (defined as less than two years of menopause in the absence of hysterectomy OR tubal ligation), the patient must have a pregnancy test performed within twenty-four hours before the computed tomography scan."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_is_unwilling_to_provide_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unwilling to provide written informed consent.","when_to_set_to_false":"Set to false if the patient is willing to provide written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unwilling to provide written informed consent.","meaning":"Boolean indicating whether the patient is unwilling to provide written informed consent."} ;; "the patient is unwilling to provide written informed consent"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_is_unwilling_to_provide_written_informed_consent)
:named REQ14_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unwilling to provide written informed consent."
