;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a myocardial infarction at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a myocardial infarction at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a myocardial infarction.","meaning":"Boolean indicating whether the patient has ever had a myocardial infarction in the past."} ;; "myocardial infarction in the history"
(declare-const patient_has_finding_of_myocardial_infarction_inthehistory@@located_in_target_vessel_myocardial_territory Bool) ;; {"when_to_set_to_true":"Set to true if the patient's past myocardial infarction was located in the target vessel myocardial territory.","when_to_set_to_false":"Set to false if the patient's past myocardial infarction was not located in the target vessel myocardial territory.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the location of the patient's past myocardial infarction was in the target vessel myocardial territory.","meaning":"Boolean indicating whether the patient's past myocardial infarction was located in the target vessel myocardial territory."} ;; "previous myocardial infarction in the target vessel myocardial territory"
(declare-const patient_has_finding_of_myocardial_infarction_inthehistory@@temporalcontext_within_12_months_before_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's past myocardial infarction occurred within the preceding 12 months before now.","when_to_set_to_false":"Set to false if the patient's past myocardial infarction did not occur within the preceding 12 months before now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the timing of the patient's past myocardial infarction was within the preceding 12 months before now.","meaning":"Boolean indicating whether the patient's past myocardial infarction occurred within the preceding 12 months before now."} ;; "any myocardial infarction in the preceding 12 months"
(declare-const patient_has_finding_of_electrocardiogram_changes_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had electrocardiogram changes in the past.","when_to_set_to_false":"Set to false if the patient has never had electrocardiogram changes in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had electrocardiogram changes in the past.","meaning":"Boolean indicating whether the patient has ever had electrocardiogram changes in the past."} ;; "electrocardiogram changes in the history"
(declare-const patient_has_finding_of_regional_wall_motion_abnormalities_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had regional wall motion abnormalities in the past.","when_to_set_to_false":"Set to false if the patient has never had regional wall motion abnormalities in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had regional wall motion abnormalities in the past.","meaning":"Boolean indicating whether the patient has ever had regional wall motion abnormalities in the past."} ;; "regional wall motion abnormalities in the history"
(declare-const patient_has_finding_of_regional_wall_motion_abnormalities_in_the_history@@detected_on_echocardiography Bool) ;; {"when_to_set_to_true":"Set to true if the patient's regional wall motion abnormalities in the past were detected on echocardiography.","when_to_set_to_false":"Set to false if the patient's regional wall motion abnormalities in the past were not detected on echocardiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's regional wall motion abnormalities in the past were detected on echocardiography.","meaning":"Boolean indicating whether the patient's regional wall motion abnormalities in the past were detected on echocardiography."} ;; "regional wall motion abnormalities detected on echocardiography in the history"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_myocardial_infarction_inthehistory@@located_in_target_vessel_myocardial_territory
      patient_has_finding_of_myocardial_infarction_inthehistory)
:named REQ0_AUXILIARY0)) ;; "previous myocardial infarction in the target vessel myocardial territory"

(assert
(! (=> patient_has_finding_of_myocardial_infarction_inthehistory@@temporalcontext_within_12_months_before_now
      patient_has_finding_of_myocardial_infarction_inthehistory)
:named REQ0_AUXILIARY1)) ;; "any myocardial infarction in the preceding 12 months"

(assert
(! (=> patient_has_finding_of_regional_wall_motion_abnormalities_in_the_history@@detected_on_echocardiography
      patient_has_finding_of_regional_wall_motion_abnormalities_in_the_history)
:named REQ0_AUXILIARY2)) ;; "regional wall motion abnormalities detected on echocardiography in the history"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion 1: previous myocardial infarction in the target vessel myocardial territory, as defined by patient history, electrocardiogram changes, and evidence of regional wall motion abnormalities on echocardiography
(assert
(! (not (and patient_has_finding_of_myocardial_infarction_inthehistory@@located_in_target_vessel_myocardial_territory
             patient_has_finding_of_electrocardiogram_changes_in_the_history
             patient_has_finding_of_regional_wall_motion_abnormalities_in_the_history@@detected_on_echocardiography))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "previous myocardial infarction in the target vessel myocardial territory, as defined by patient history, electrocardiogram changes, and evidence of regional wall motion abnormalities on echocardiography"

;; Exclusion 2: any myocardial infarction in the preceding 12 months, as defined by patient history, electrocardiogram changes, and evidence of regional wall motion abnormalities on echocardiography
(assert
(! (not (and patient_has_finding_of_myocardial_infarction_inthehistory@@temporalcontext_within_12_months_before_now
             patient_has_finding_of_electrocardiogram_changes_in_the_history
             patient_has_finding_of_regional_wall_motion_abnormalities_in_the_history@@detected_on_echocardiography))
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "any myocardial infarction in the preceding 12 months, as defined by patient history, electrocardiogram changes, and evidence of regional wall motion abnormalities on echocardiography"

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_fractional_flow_reserve_value_recorded_now_withunit_none Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's fractional flow reserve is recorded now (at the time of procedure) in the target vessel.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's fractional flow reserve measured now (at the time of procedure) in the target vessel. The unit is dimensionless (none)."} ;; "fractional flow reserve greater than 0.80 in the target vessel at the time of procedure"
(declare-const patient_fractional_flow_reserve_value_recorded_now_withunit_none@@measured_in_target_vessel Bool) ;; {"when_to_set_to_true":"Set to true if the fractional flow reserve value was measured in the target vessel.","when_to_set_to_false":"Set to false if the fractional flow reserve value was not measured in the target vessel.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the measurement was in the target vessel.","meaning":"Boolean indicating whether the fractional flow reserve value was measured in the target vessel."} ;; "in the target vessel at the time of procedure"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (and patient_fractional_flow_reserve_value_recorded_now_withunit_none@@measured_in_target_vessel
             (> patient_fractional_flow_reserve_value_recorded_now_withunit_none 0.80)))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a fractional flow reserve greater than 0.80 in the target vessel at the time of procedure."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_undergoing_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a procedure.","when_to_set_to_false":"Set to false if the patient is currently not undergoing any procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing a procedure.","meaning":"Boolean indicating whether the patient is currently undergoing a procedure."} ;; "procedure"
(declare-const patient_is_undergoing_procedure_now@@is_single_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the procedure the patient is currently undergoing is a single procedure (not a multi-vessel intervention in a single session).","when_to_set_to_false":"Set to false if the procedure is a multi-vessel intervention in a single session.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure is a single procedure.","meaning":"Boolean indicating whether the procedure is a single procedure (not multi-vessel intervention in a single session)."} ;; "requires multi-vessel intervention in a single procedure"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> (not patient_is_undergoing_procedure_now@@is_single_procedure)
        patient_is_undergoing_procedure_now)
    :named REQ2_AUXILIARY0)) ;; "requires multi-vessel intervention in a single procedure" (if not single procedure, must be undergoing a procedure)

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (and patient_is_undergoing_procedure_now
             (not patient_is_undergoing_procedure_now@@is_single_procedure)))
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires multi-vessel intervention in a single procedure."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const epicardial_occlusion_percent_value_on_angiography_now Real) ;; {"when_to_set_to_value":"Set to the percent occlusion value of any epicardial vessel detected on angiography at the current time.","when_to_set_to_null":"Set to null if the percent occlusion value of any epicardial vessel detected on angiography at the current time is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the percent occlusion of any epicardial vessel detected on angiography at the current time."} ;; "100 percent epicardial occlusion on angiography"

(declare-const patient_has_finding_of_chronic_total_occlusion_on_angiography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any chronic total occlusion detected on angiography.","when_to_set_to_false":"Set to false if the patient currently does not have any chronic total occlusion detected on angiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any chronic total occlusion detected on angiography.","meaning":"Boolean indicating whether the patient currently has any chronic total occlusion detected on angiography."} ;; "any chronic total occlusion on angiography"

(declare-const patient_has_finding_of_epicardial_occlusion_100_percent_on_angiography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any epicardial occlusion that is 100 percent and detected on angiography.","when_to_set_to_false":"Set to false if the patient currently does not have any epicardial occlusion that is 100 percent and detected on angiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any epicardial occlusion that is 100 percent and detected on angiography.","meaning":"Boolean indicating whether the patient currently has any epicardial occlusion that is 100 percent and detected on angiography."} ;; "100 percent epicardial occlusion on angiography"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition: 100 percent epicardial occlusion on angiography
(assert
(! (= patient_has_finding_of_epicardial_occlusion_100_percent_on_angiography_now
(= epicardial_occlusion_percent_value_on_angiography_now 100))
:named REQ3_AUXILIARY0)) ;; "100 percent epicardial occlusion (100% epicardial occlusion) on angiography"

;; Chronic total occlusion is defined as 100 percent epicardial occlusion on angiography
(assert
(! (= patient_has_finding_of_chronic_total_occlusion_on_angiography_now
patient_has_finding_of_epicardial_occlusion_100_percent_on_angiography_now)
:named REQ3_AUXILIARY1)) ;; "chronic total occlusion (100 percent epicardial occlusion) on angiography"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_chronic_total_occlusion_on_angiography_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any chronic total occlusion (100 percent epicardial occlusion) on angiography."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_coronary_artery_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of coronary artery stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of coronary artery stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of coronary artery stenosis.","meaning":"Boolean indicating whether the patient currently has coronary artery stenosis."} ;; "coronary artery stenosis"
(declare-const patient_has_finding_of_coronary_artery_stenosis_now@@distal_location Bool) ;; {"when_to_set_to_true":"Set to true if the patient's coronary artery stenosis is located in a distal segment of the coronary artery.","when_to_set_to_false":"Set to false if the patient's coronary artery stenosis is not located in a distal segment of the coronary artery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's coronary artery stenosis is located in a distal segment.","meaning":"Boolean indicating whether the patient's coronary artery stenosis is located in a distal segment of the coronary artery."} ;; "distal coronary artery stenosis"
(declare-const patient_has_finding_of_coronary_artery_stenosis_now@@affecting_non_dominant_right_coronary_artery Bool) ;; {"when_to_set_to_true":"Set to true if the patient's coronary artery stenosis affects the non-dominant right coronary artery.","when_to_set_to_false":"Set to false if the patient's coronary artery stenosis does not affect the non-dominant right coronary artery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's coronary artery stenosis affects the non-dominant right coronary artery.","meaning":"Boolean indicating whether the patient's coronary artery stenosis affects the non-dominant right coronary artery."} ;; "coronary artery stenosis affecting the non-dominant right coronary artery"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_coronary_artery_stenosis_now@@distal_location
      patient_has_finding_of_coronary_artery_stenosis_now)
   :named REQ4_AUXILIARY0)) ;; "distal coronary artery stenosis" implies "coronary artery stenosis"

(assert
(! (=> patient_has_finding_of_coronary_artery_stenosis_now@@affecting_non_dominant_right_coronary_artery
      patient_has_finding_of_coronary_artery_stenosis_now)
   :named REQ4_AUXILIARY1)) ;; "coronary artery stenosis affecting the non-dominant right coronary artery" implies "coronary artery stenosis"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_coronary_artery_stenosis_now@@distal_location)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has distal coronary artery stenosis."

(assert
(! (not patient_has_finding_of_coronary_artery_stenosis_now@@affecting_non_dominant_right_coronary_artery)
   :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has coronary artery stenosis affecting the non-dominant right coronary artery."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_heart_rate_value_recorded_now_withunit_beats_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's heart rate (in beats per minute) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's heart rate (in beats per minute) measured now."} ;; "heart rate less than 60 beats per minute at inclusion"
(declare-const patient_heart_rate_value_recorded_now_withunit_beats_per_minute@@assessed_by_twelve_lead_electrocardiogram Bool) ;; {"when_to_set_to_true":"Set to true if the heart rate measurement was assessed by a twelve lead electrocardiogram.","when_to_set_to_false":"Set to false if the heart rate measurement was not assessed by a twelve lead electrocardiogram.","when_to_set_to_null":"Set to null if it is unknown or not documented whether the heart rate measurement was assessed by a twelve lead electrocardiogram.","meaning":"Indicates whether the heart rate measurement was assessed by a twelve lead electrocardiogram."} ;; "assessed by twelve lead electrocardiogram"
(declare-const patient_heart_rate_value_recorded_now_withunit_beats_per_minute@@measured_after_minimum_ten_minutes_rest_period Bool) ;; {"when_to_set_to_true":"Set to true if the heart rate measurement was taken after a minimum ten minutes rest period.","when_to_set_to_false":"Set to false if the heart rate measurement was not taken after a minimum ten minutes rest period.","when_to_set_to_null":"Set to null if it is unknown or not documented whether the heart rate measurement was taken after a minimum ten minutes rest period.","meaning":"Indicates whether the heart rate measurement was taken after a minimum ten minutes rest period."} ;; "after a minimum ten minutes rest period"
(declare-const patient_heart_rate_value_recorded_now_withunit_beats_per_minute@@assessed_by_twelve_lead_electrocardiogram@@measured_after_minimum_ten_minutes_rest_period Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's heart rate (in beats per minute) is recorded now, assessed by twelve lead electrocardiogram, and measured after a minimum ten minutes rest period.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate or if it is unknown whether both conditions (assessment by twelve lead electrocardiogram and measurement after minimum ten minutes rest) are met.","meaning":"Numeric value representing the patient's heart rate (in beats per minute) measured now, assessed by twelve lead electrocardiogram, and measured after a minimum ten minutes rest period."} ;; "heart rate less than 60 beats per minute at inclusion, assessed by twelve lead electrocardiogram after a minimum ten minutes rest period"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; The doubly-qualified variable is defined only if both qualifiers are true
(assert
(! (=> (and patient_heart_rate_value_recorded_now_withunit_beats_per_minute@@assessed_by_twelve_lead_electrocardiogram
            patient_heart_rate_value_recorded_now_withunit_beats_per_minute@@measured_after_minimum_ten_minutes_rest_period)
       (= patient_heart_rate_value_recorded_now_withunit_beats_per_minute@@assessed_by_twelve_lead_electrocardiogram@@measured_after_minimum_ten_minutes_rest_period
          patient_heart_rate_value_recorded_now_withunit_beats_per_minute))
   :named REQ5_AUXILIARY0)) ;; "assessed by twelve lead electrocardiogram after a minimum ten minutes rest period"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient must NOT have heart rate < 60 bpm at inclusion, assessed by 12-lead ECG after 10 min rest
(assert
(! (not (and
         (< patient_heart_rate_value_recorded_now_withunit_beats_per_minute@@assessed_by_twelve_lead_electrocardiogram@@measured_after_minimum_ten_minutes_rest_period 60)
         ))
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a heart rate less than 60 beats per minute at inclusion, assessed by twelve lead electrocardiogram after a minimum ten minutes rest period."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_cardiac_rhythm_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented cardiac rhythm (of any type).","when_to_set_to_false":"Set to false if the patient currently does not have a documented cardiac rhythm.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a documented cardiac rhythm.","meaning":"Boolean indicating whether the patient currently has a documented cardiac rhythm."} ;; "any cardiac rhythm"
(declare-const patient_has_finding_of_cardiac_rhythm_now@@other_than_sinus_rhythm Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current cardiac rhythm is other than sinus rhythm.","when_to_set_to_false":"Set to false if the patient's current cardiac rhythm is sinus rhythm.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current cardiac rhythm is other than sinus rhythm.","meaning":"Boolean indicating whether the patient's current cardiac rhythm is other than sinus rhythm."} ;; "any cardiac rhythm other than sinus rhythm"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_cardiac_rhythm_now@@other_than_sinus_rhythm
      patient_has_finding_of_cardiac_rhythm_now)
:named REQ6_AUXILIARY0)) ;; "other than sinus rhythm" implies "any cardiac rhythm"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_cardiac_rhythm_now@@other_than_sinus_rhythm)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any cardiac rhythm other than sinus rhythm."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_sick_sinus_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sick sinus syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have sick sinus syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sick sinus syndrome.","meaning":"Boolean indicating whether the patient currently has sick sinus syndrome."} ;; "sick sinus syndrome"
(declare-const patient_has_finding_of_complete_atrioventricular_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has complete (high grade) atrioventricular block.","when_to_set_to_false":"Set to false if the patient currently does not have complete (high grade) atrioventricular block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has complete (high grade) atrioventricular block.","meaning":"Boolean indicating whether the patient currently has complete (high grade) atrioventricular block."} ;; "high grade atrioventricular block"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_sick_sinus_syndrome_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has sick sinus syndrome."

(assert
(! (not patient_has_finding_of_complete_atrioventricular_block_now)
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has high grade atrioventricular block."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_permanent_cardiac_pacemaker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a permanent cardiac pacemaker.","when_to_set_to_false":"Set to false if the patient currently does not have a permanent cardiac pacemaker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a permanent cardiac pacemaker.","meaning":"Boolean indicating whether the patient currently has a permanent cardiac pacemaker."} ;; "permanent cardiac pacemaker"

(declare-const patient_has_finding_of_permanent_cardiac_pacemaker_now@@in_situ Bool) ;; {"when_to_set_to_true":"Set to true if the permanent cardiac pacemaker is physically present/implanted (in situ) in the patient now.","when_to_set_to_false":"Set to false if the permanent cardiac pacemaker is not physically present/implanted (not in situ) in the patient now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the permanent cardiac pacemaker is in situ.","meaning":"Boolean indicating whether the permanent cardiac pacemaker is in situ (physically present/implanted) in the patient now."} ;; "permanent cardiac pacemaker in situ"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_permanent_cardiac_pacemaker_now@@in_situ
      patient_has_finding_of_permanent_cardiac_pacemaker_now)
:named REQ8_AUXILIARY0)) ;; "permanent cardiac pacemaker in situ"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_permanent_cardiac_pacemaker_now@@in_situ)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a permanent cardiac pacemaker in situ."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_diagnosis_of_congenital_long_qt_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of congenital long QT syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of congenital long QT syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of congenital long QT syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of congenital long QT syndrome."} ;; "congenital long QT syndrome"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_diagnosis_of_congenital_long_qt_syndrome_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has congenital long QT syndrome."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_intolerance_to_beta_adrenergic_receptor_antagonist_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has intolerance to beta-adrenergic receptor antagonist containing products (beta-blockers).","when_to_set_to_false":"Set to false if the patient currently does not have intolerance to beta-adrenergic receptor antagonist containing products (beta-blockers).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has intolerance to beta-adrenergic receptor antagonist containing products (beta-blockers).","meaning":"Boolean indicating whether the patient currently has intolerance to beta-adrenergic receptor antagonist containing products (beta-blockers)."} ;; "intolerance to beta-blockers"
(declare-const patient_has_allergy_to_allergy_to_beta_adrenergic_receptor_antagonist_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has allergy to beta-adrenergic receptor antagonist (beta-blockers).","when_to_set_to_false":"Set to false if the patient currently does not have allergy to beta-adrenergic receptor antagonist (beta-blockers).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has allergy to beta-adrenergic receptor antagonist (beta-blockers).","meaning":"Boolean indicating whether the patient currently has allergy to beta-adrenergic receptor antagonist (beta-blockers)."} ;; "allergy to beta-blockers"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_intolerance_to_beta_adrenergic_receptor_antagonist_containing_product_now)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has intolerance to beta-blockers."

(assert
(! (not patient_has_allergy_to_allergy_to_beta_adrenergic_receptor_antagonist_now)
:named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has allergy to beta-blockers."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_intolerance_to_ivabradine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has intolerance to Ivabradine.","when_to_set_to_false":"Set to false if the patient currently does not have intolerance to Ivabradine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has intolerance to Ivabradine.","meaning":"Boolean indicating whether the patient currently has intolerance to Ivabradine."} ;; "intolerance to Ivabradine"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_intolerance_to_ivabradine_now)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has intolerance to Ivabradine."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_is_taking_beta_adrenergic_receptor_antagonist_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a beta-adrenergic receptor antagonist containing product (beta-blocker).","when_to_set_to_false":"Set to false if the patient is currently not taking a beta-adrenergic receptor antagonist containing product (beta-blocker).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a beta-adrenergic receptor antagonist containing product (beta-blocker).","meaning":"Boolean indicating whether the patient is currently taking a beta-adrenergic receptor antagonist containing product (beta-blocker)."} ;; "beta-blocker"
(declare-const patient_is_taking_beta_adrenergic_receptor_antagonist_containing_product_now@@indication_is_not_angina_pectoris Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current use of a beta-adrenergic receptor antagonist containing product (beta-blocker) is for an indication other than angina pectoris (e.g., ventricular tachycardia).","when_to_set_to_false":"Set to false if the patient's current use of a beta-adrenergic receptor antagonist containing product (beta-blocker) is for angina pectoris only.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the indication for beta-blocker use is other than angina pectoris.","meaning":"Boolean indicating whether the patient's current use of a beta-adrenergic receptor antagonist containing product (beta-blocker) is for an indication other than angina pectoris."} ;; "additional indication for beta-blocker treatment other than angina pectoris (for example, ventricular tachycardia)"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_taking_beta_adrenergic_receptor_antagonist_containing_product_now@@indication_is_not_angina_pectoris
      patient_is_taking_beta_adrenergic_receptor_antagonist_containing_product_now)
:named REQ12_AUXILIARY0)) ;; "additional indication for beta-blocker treatment other than angina pectoris"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_is_taking_beta_adrenergic_receptor_antagonist_containing_product_now@@indication_is_not_angina_pectoris)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an additional indication for beta-blocker treatment other than angina pectoris with non-exhaustive examples (ventricular tachycardia)."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_requires_concurrent_use_of_rate_limiting_drugs_other_than_beta_blockers_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently requires concurrent use of rate-limiting drugs, and these drugs are not beta-blockers.","when_to_set_to_false":"Set to false if the patient currently does not require concurrent use of rate-limiting drugs other than beta-blockers.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently requires concurrent use of rate-limiting drugs other than beta-blockers.","meaning":"Boolean indicating whether the patient currently requires concurrent use of rate-limiting drugs, excluding beta-blockers."} ;; "requires concurrent use of rate-limiting drugs other than beta-blockers"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_requires_concurrent_use_of_rate_limiting_drugs_other_than_beta_blockers_now)
    :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires concurrent use of rate-limiting drugs other than beta-blockers."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_is_exposed_to_bisoprolol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to bisoprolol.","when_to_set_to_false":"Set to false if the patient is currently not exposed to bisoprolol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to bisoprolol.","meaning":"Boolean indicating whether the patient is currently exposed to bisoprolol."} ;; "bisoprolol"
(declare-const patient_is_exposed_to_bisoprolol_now@@combination_therapy_with_ivabradine_for_heart_rate_control Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to bisoprolol is as part of combination therapy with Ivabradine for heart rate control.","when_to_set_to_false":"Set to false if the patient's current exposure to bisoprolol is not as part of combination therapy with Ivabradine for heart rate control.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current exposure to bisoprolol is as part of combination therapy with Ivabradine for heart rate control.","meaning":"Boolean indicating whether the patient's current exposure to bisoprolol is as part of combination therapy with Ivabradine for heart rate control."} ;; "bisoprolol as part of combination therapy with Ivabradine for heart rate control"
(declare-const patient_is_exposed_to_ivabradine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to Ivabradine.","when_to_set_to_false":"Set to false if the patient is currently not exposed to Ivabradine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to Ivabradine.","meaning":"Boolean indicating whether the patient is currently exposed to Ivabradine."} ;; "Ivabradine"
(declare-const patient_is_exposed_to_ivabradine_now@@combination_therapy_with_bisoprolol_for_heart_rate_control Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to Ivabradine is as part of combination therapy with bisoprolol for heart rate control.","when_to_set_to_false":"Set to false if the patient's current exposure to Ivabradine is not as part of combination therapy with bisoprolol for heart rate control.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current exposure to Ivabradine is as part of combination therapy with bisoprolol for heart rate control.","meaning":"Boolean indicating whether the patient's current exposure to Ivabradine is as part of combination therapy with bisoprolol for heart rate control."} ;; "Ivabradine as part of combination therapy with bisoprolol for heart rate control"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_bisoprolol_now@@combination_therapy_with_ivabradine_for_heart_rate_control
      patient_is_exposed_to_bisoprolol_now)
:named REQ14_AUXILIARY0)) ;; "bisoprolol as part of combination therapy with Ivabradine for heart rate control"

(assert
(! (=> patient_is_exposed_to_ivabradine_now@@combination_therapy_with_bisoprolol_for_heart_rate_control
      patient_is_exposed_to_ivabradine_now)
:named REQ14_AUXILIARY1)) ;; "Ivabradine as part of combination therapy with bisoprolol for heart rate control"

;; ===================== Constraint Assertions (REQ 14) =====================
;; Exclusion: patient must NOT require combination therapy with Ivabradine and bisoprolol to achieve heart rate control
(assert
(! (not (and patient_is_exposed_to_bisoprolol_now@@combination_therapy_with_ivabradine_for_heart_rate_control
             patient_is_exposed_to_ivabradine_now@@combination_therapy_with_bisoprolol_for_heart_rate_control))
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires combination therapy with Ivabradine and bisoprolol to achieve heart rate control."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_contraindication_to_magnetic_resonance_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to magnetic resonance imaging.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to magnetic resonance imaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to magnetic resonance imaging.","meaning":"Boolean indicating whether the patient currently has a contraindication to magnetic resonance imaging."} ;; "contraindication to magnetic resonance imaging"
(declare-const patient_has_contraindication_to_adenosine_containing_product_in_parenteral_dose_form_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to intravenous adenosine (adenosine-containing product in parenteral dose form).","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to intravenous adenosine (adenosine-containing product in parenteral dose form).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to intravenous adenosine (adenosine-containing product in parenteral dose form).","meaning":"Boolean indicating whether the patient currently has a contraindication to intravenous adenosine (adenosine-containing product in parenteral dose form)."} ;; "contraindication to intravenous adenosine"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_contraindication_to_magnetic_resonance_imaging_now)
    :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to magnetic resonance imaging."

(assert
(! (not patient_has_contraindication_to_adenosine_containing_product_in_parenteral_dose_form_now)
    :named REQ15_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to intravenous adenosine."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_glomerular_filtration_rate_value_recorded_now_withunit_milliliters_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's estimated glomerular filtration rate (eGFR) in milliliters per minute is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current estimated glomerular filtration rate (eGFR) in milliliters per minute."} ;; "glomerular filtration rate"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not (< patient_glomerular_filtration_rate_value_recorded_now_withunit_milliliters_per_minute 30))
    :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe impairment of renal function, defined as estimated glomerular filtration rate < 30 milliliters per minute."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_finding_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of liver disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of liver disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of liver disease.","meaning":"Boolean indicating whether the patient currently has liver disease."} ;; "liver disease"
(declare-const patient_has_finding_of_disease_of_liver_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has liver disease and the disease is severe.","when_to_set_to_false":"Set to false if the patient currently has liver disease but the disease is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the liver disease is severe.","meaning":"Boolean indicating whether the patient's current liver disease is severe."} ;; "severe liver disease"
(declare-const patient_has_finding_of_disease_of_liver_now@@worse_than_grade_a_by_child_pugh_classification Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has liver disease and the disease is any worse than Grade A by Child-Pugh Classification.","when_to_set_to_false":"Set to false if the patient currently has liver disease and the disease is Grade A or better by Child-Pugh Classification.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the liver disease is worse than Grade A by Child-Pugh Classification.","meaning":"Boolean indicating whether the patient's current liver disease is any worse than Grade A by Child-Pugh Classification."} ;; "any worse than Grade A by Child-Pugh Classification"

;; ===================== Auxiliary Assertions (REQ 17) =====================
;; Definition: severe liver disease = any worse than Grade A by Child-Pugh Classification
(assert
(! (= patient_has_finding_of_disease_of_liver_now@@severe
     patient_has_finding_of_disease_of_liver_now@@worse_than_grade_a_by_child_pugh_classification)
:named REQ17_AUXILIARY0)) ;; "defined as any worse than Grade A by Child-Pugh Classification"

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_disease_of_liver_now@@severe
       patient_has_finding_of_disease_of_liver_now)
:named REQ17_AUXILIARY1)) ;; "severe liver disease" implies "liver disease"

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_disease_of_liver_now@@worse_than_grade_a_by_child_pugh_classification
       patient_has_finding_of_disease_of_liver_now)
:named REQ17_AUXILIARY2)) ;; "worse than Grade A by Child-Pugh Classification" implies "liver disease"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not patient_has_finding_of_disease_of_liver_now@@severe)
:named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe liver disease, defined as any worse than Grade A by Child-Pugh Classification."
