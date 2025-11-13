;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_artery_with_timi_flow_grade_value_now_withunit_none Real) ;; {"when_to_set_to_value":"Set to the TIMI flow grade value (0, 1, 2, or 3) of the artery related to the patient's acute myocardial infarction at the moment of cell injection.","when_to_set_to_null":"Set to null if the TIMI flow grade value of the related artery at the moment of cell injection is unknown, not documented, or cannot be determined.","meaning":"Numeric value (unitless, scale 0-3) representing the TIMI flow grade of the artery related to the patient's acute myocardial infarction at the moment of cell injection."} ;; "TIMI flow grade < 3 at the moment of cell injection"

(declare-const patient_has_artery_with_timi_flow_grade_value_now_withunit_none@@related_to_acute_myocardial_infarction Bool) ;; {"when_to_set_to_true":"Set to true if the TIMI flow grade value is for the artery related to the patient's acute myocardial infarction.","when_to_set_to_false":"Set to false if the TIMI flow grade value is not for the artery related to the patient's acute myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the TIMI flow grade value is for the artery related to the patient's acute myocardial infarction.","meaning":"Boolean indicating whether the TIMI flow grade value is for the artery related to the patient's acute myocardial infarction."} ;; "related artery presenting TIMI flow grade < 3"

(declare-const patient_has_finding_of_acute_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute myocardial infarction at the moment of cell injection.","when_to_set_to_false":"Set to false if the patient currently does not have an acute myocardial infarction at the moment of cell injection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acute myocardial infarction at the moment of cell injection.","meaning":"Boolean indicating whether the patient currently has an acute myocardial infarction at the moment of cell injection."} ;; "acute myocardial infarction"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (and
          patient_has_finding_of_acute_myocardial_infarction_now
          patient_has_artery_with_timi_flow_grade_value_now_withunit_none@@related_to_acute_myocardial_infarction
          (< patient_has_artery_with_timi_flow_grade_value_now_withunit_none 3)))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an acute myocardial infarction related artery presenting thrombolysis in myocardial infarction (TIMI) flow grade < 3 at the moment of cell injection."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const left_main_coronary_artery_lesion_percent_stenosis_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the value of the percent stenosis of the left main coronary artery lesion currently recorded, in percent.","when_to_set_to_null":"Set to null if the percent stenosis of the left main coronary artery lesion is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the percent stenosis of the left main coronary artery lesion currently recorded, in percent."} ;; "left main coronary artery lesion greater than 50%"

(declare-const patient_has_finding_of_multi_vessel_coronary_artery_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of multivessel coronary artery disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of multivessel coronary artery disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has multivessel coronary artery disease.","meaning":"Boolean indicating whether the patient currently has multivessel coronary artery disease."} ;; "multivessel coronary artery disease"

(declare-const lesion_percent_stenosis_value_recorded_now_withunit_percent_in_left_anterior_descending_coronary_artery Real) ;; {"when_to_set_to_value":"Set to the value of the percent stenosis of a lesion currently recorded in the left anterior descending coronary artery, in percent.","when_to_set_to_null":"Set to null if the percent stenosis of a lesion in the left anterior descending coronary artery is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the percent stenosis of a lesion currently recorded in the left anterior descending coronary artery, in percent."} ;; "greater than 70% lesion in vessels with diameter greater than 2.0 mm in left anterior descending coronary artery"

(declare-const lesion_vessel_diameter_value_recorded_now_withunit_mm_in_left_anterior_descending_coronary_artery Real) ;; {"when_to_set_to_value":"Set to the value of the vessel diameter at the site of a lesion currently recorded in the left anterior descending coronary artery, in millimeters.","when_to_set_to_null":"Set to null if the vessel diameter at the site of a lesion in the left anterior descending coronary artery is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the vessel diameter at the site of a lesion currently recorded in the left anterior descending coronary artery, in millimeters."} ;; "diameter greater than 2.0 mm in left anterior descending coronary artery"

(declare-const lesion_percent_stenosis_value_recorded_now_withunit_percent_in_circumflex_coronary_artery Real) ;; {"when_to_set_to_value":"Set to the value of the percent stenosis of a lesion currently recorded in the circumflex coronary artery, in percent.","when_to_set_to_null":"Set to null if the percent stenosis of a lesion in the circumflex coronary artery is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the percent stenosis of a lesion currently recorded in the circumflex coronary artery, in percent."} ;; "greater than 70% lesion in vessels with diameter greater than 2.0 mm in circumflex coronary artery"

(declare-const lesion_vessel_diameter_value_recorded_now_withunit_mm_in_circumflex_coronary_artery Real) ;; {"when_to_set_to_value":"Set to the value of the vessel diameter at the site of a lesion currently recorded in the circumflex coronary artery, in millimeters.","when_to_set_to_null":"Set to null if the vessel diameter at the site of a lesion in the circumflex coronary artery is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the vessel diameter at the site of a lesion currently recorded in the circumflex coronary artery, in millimeters."} ;; "diameter greater than 2.0 mm in circumflex coronary artery"

(declare-const lesion_percent_stenosis_value_recorded_now_withunit_percent_in_right_coronary_artery Real) ;; {"when_to_set_to_value":"Set to the value of the percent stenosis of a lesion currently recorded in the right coronary artery, in percent.","when_to_set_to_null":"Set to null if the percent stenosis of a lesion in the right coronary artery is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the percent stenosis of a lesion currently recorded in the right coronary artery, in percent."} ;; "greater than 70% lesion in vessels with diameter greater than 2.0 mm in right coronary artery"

(declare-const lesion_vessel_diameter_value_recorded_now_withunit_mm_in_right_coronary_artery Real) ;; {"when_to_set_to_value":"Set to the value of the vessel diameter at the site of a lesion currently recorded in the right coronary artery, in millimeters.","when_to_set_to_null":"Set to null if the vessel diameter at the site of a lesion in the right coronary artery is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the vessel diameter at the site of a lesion currently recorded in the right coronary artery, in millimeters."} ;; "diameter greater than 2.0 mm in right coronary artery"

(declare-const coronary_artery_bypass_grafting_indicates_need_now Bool) ;; {"when_to_set_to_true":"Set to true if the current clinical situation indicates the need for coronary artery bypass grafting.","when_to_set_to_false":"Set to false if the current clinical situation does not indicate the need for coronary artery bypass grafting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the current clinical situation indicates the need for coronary artery bypass grafting.","meaning":"Boolean indicating whether the current clinical situation indicates the need for coronary artery bypass grafting."} ;; "indicating the need for coronary artery bypass grafting"

(declare-const angioplasty_indicates_need_now Bool) ;; {"when_to_set_to_true":"Set to true if the current clinical situation indicates the need for angioplasty.","when_to_set_to_false":"Set to false if the current clinical situation does not indicate the need for angioplasty.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the current clinical situation indicates the need for angioplasty.","meaning":"Boolean indicating whether the current clinical situation indicates the need for angioplasty."} ;; "indicating the need for angioplasty"

(declare-const angioplasty_number_of_stents_implanted_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the value of the number of stents implanted during angioplasty currently recorded, as a count.","when_to_set_to_null":"Set to null if the number of stents implanted during angioplasty is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of stents implanted during angioplasty currently recorded, as a count."} ;; "three or more stents implanted"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: left main coronary artery lesion > 50%
(assert
(! (not (> left_main_coronary_artery_lesion_percent_stenosis_value_recorded_now_withunit_percent 50))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a left main coronary artery lesion greater than 50%."

;; Exclusion: multivessel coronary artery disease (greater than 70% lesion in vessels with diameter > 2.0 mm in LAD, circumflex, and right coronary artery) indicating need for coronary artery bypass grafting
(assert
(! (not (and
         patient_has_finding_of_multi_vessel_coronary_artery_disease_now
         (>= lesion_percent_stenosis_value_recorded_now_withunit_percent_in_left_anterior_descending_coronary_artery 70)
         (> lesion_vessel_diameter_value_recorded_now_withunit_mm_in_left_anterior_descending_coronary_artery 2.0)
         (>= lesion_percent_stenosis_value_recorded_now_withunit_percent_in_circumflex_coronary_artery 70)
         (> lesion_vessel_diameter_value_recorded_now_withunit_mm_in_circumflex_coronary_artery 2.0)
         (>= lesion_percent_stenosis_value_recorded_now_withunit_percent_in_right_coronary_artery 70)
         (> lesion_vessel_diameter_value_recorded_now_withunit_mm_in_right_coronary_artery 2.0)
         coronary_artery_bypass_grafting_indicates_need_now))
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has multivessel coronary artery disease (greater than 70% lesion in vessels with diameter greater than 2.0 mm in left anterior descending coronary artery, circumflex coronary artery, and right coronary artery territory) indicating the need for coronary artery bypass grafting."

;; Exclusion: multivessel coronary artery disease (greater than 70% lesion in vessels with diameter > 2.0 mm in LAD, circumflex, and right coronary artery) indicating need for angioplasty with three or more stents implanted
(assert
(! (not (and
         patient_has_finding_of_multi_vessel_coronary_artery_disease_now
         (>= lesion_percent_stenosis_value_recorded_now_withunit_percent_in_left_anterior_descending_coronary_artery 70)
         (> lesion_vessel_diameter_value_recorded_now_withunit_mm_in_left_anterior_descending_coronary_artery 2.0)
         (>= lesion_percent_stenosis_value_recorded_now_withunit_percent_in_circumflex_coronary_artery 70)
         (> lesion_vessel_diameter_value_recorded_now_withunit_mm_in_circumflex_coronary_artery 2.0)
         (>= lesion_percent_stenosis_value_recorded_now_withunit_percent_in_right_coronary_artery 70)
         (> lesion_vessel_diameter_value_recorded_now_withunit_mm_in_right_coronary_artery 2.0)
         angioplasty_indicates_need_now
         (>= angioplasty_number_of_stents_implanted_value_recorded_now_withunit_count 3)))
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has multivessel coronary artery disease (greater than 70% lesion in vessels with diameter greater than 2.0 mm in left anterior descending coronary artery, circumflex coronary artery, and right coronary artery territory) indicating the need for angioplasty with three or more stents implanted."

;; --- verifier-bypassed (attempt 8/8) 2025-10-24T23:43:00.885228 policy=eventual
;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const coronary_artery_anatomy_after_thrombolytic_reperfusion_presents_no_need_for_angioplasty_with_stent_implant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's coronary artery anatomy, after thrombolytic reperfusion, presents no need for angioplasty with stent implant.","when_to_set_to_false":"Set to false if the patient's coronary artery anatomy, after thrombolytic reperfusion, does present a need for angioplasty with stent implant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's coronary artery anatomy, after thrombolytic reperfusion, presents no need for angioplasty with stent implant.","meaning":"Boolean indicating whether the patient's coronary artery anatomy, after thrombolytic reperfusion, presents no need for angioplasty with stent implant."} ;; "coronary artery anatomy after thrombolytic reperfusion presenting no need for angioplasty with stent implant"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not coronary_artery_anatomy_after_thrombolytic_reperfusion_presents_no_need_for_angioplasty_with_stent_implant)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has coronary artery anatomy after thrombolytic reperfusion presenting no need for angioplasty with stent implant."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_left_ventricular_end_diastolic_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's left ventricular end diastolic pressure is recorded now in mmHg.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's left ventricular end diastolic pressure measured now in mmHg."} ;; "final diastolic pressure of the left ventricle"
(declare-const patient_left_ventricular_end_diastolic_pressure_value_recorded_now_withunit_mmhg@@measured_during_ventriculography_for_evaluating_ejection_fraction_inclusion_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the left ventricular end diastolic pressure measurement was taken during ventriculography for evaluating ejection fraction inclusion criteria.","when_to_set_to_false":"Set to false if the measurement was not taken during ventriculography for evaluating ejection fraction inclusion criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was taken during ventriculography for evaluating ejection fraction inclusion criteria.","meaning":"Boolean indicating whether the left ventricular end diastolic pressure measurement was taken during ventriculography for evaluating ejection fraction inclusion criteria."} ;; "during ventriculography for evaluating ejection fraction inclusion criteria"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not (and
            patient_left_ventricular_end_diastolic_pressure_value_recorded_now_withunit_mmhg@@measured_during_ventriculography_for_evaluating_ejection_fraction_inclusion_criteria
            (> patient_left_ventricular_end_diastolic_pressure_value_recorded_now_withunit_mmhg 30)))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has (final diastolic pressure of the left ventricle > 30 mmHg during ventriculography for evaluating ejection fraction inclusion criteria)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_cardiac_arrest_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cardiac arrest.","when_to_set_to_false":"Set to false if the patient currently does not have cardiac arrest.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cardiac arrest.","meaning":"Boolean indicating whether the patient currently has cardiac arrest."} ;; "cardiac arrest"

(declare-const patient_has_finding_of_acute_myocardial_infarction_now@@present_at_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient's acute myocardial infarction is present at admission.","when_to_set_to_false":"Set to false if the patient's acute myocardial infarction is not present at admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's acute myocardial infarction is present at admission.","meaning":"Boolean indicating whether the patient's acute myocardial infarction is present at admission."} ;; "acute myocardial infarction at admission"

(declare-const patient_has_finding_of_killip_class_iv_acute_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has Killip class IV acute myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have Killip class IV acute myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Killip class IV acute myocardial infarction.","meaning":"Boolean indicating whether the patient currently has Killip class IV acute myocardial infarction."} ;; "Killip class IV acute myocardial infarction"

(declare-const patient_has_finding_of_killip_class_iv_acute_myocardial_infarction_now@@present_at_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient's Killip class IV acute myocardial infarction is present at admission.","when_to_set_to_false":"Set to false if the patient's Killip class IV acute myocardial infarction is not present at admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's Killip class IV acute myocardial infarction is present at admission.","meaning":"Boolean indicating whether the patient's Killip class IV acute myocardial infarction is present at admission."} ;; "Killip class IV acute myocardial infarction at admission"

(declare-const patient_has_finding_of_killip_class_iv_acute_myocardial_infarction_now@@with_need_of_ventilatory_support Bool) ;; {"when_to_set_to_true":"Set to true if the patient's Killip class IV acute myocardial infarction is associated with need of ventilatory support.","when_to_set_to_false":"Set to false if the patient's Killip class IV acute myocardial infarction is not associated with need of ventilatory support.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's Killip class IV acute myocardial infarction is associated with need of ventilatory support.","meaning":"Boolean indicating whether the patient's Killip class IV acute myocardial infarction is associated with need of ventilatory support."} ;; "Killip class IV acute myocardial infarction at admission with need of ventilatory support"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_acute_myocardial_infarction_now@@present_at_admission
       patient_has_finding_of_acute_myocardial_infarction_now)
    :named REQ4_AUXILIARY0)) ;; "acute myocardial infarction at admission"

(assert
(! (=> patient_has_finding_of_killip_class_iv_acute_myocardial_infarction_now@@present_at_admission
       patient_has_finding_of_killip_class_iv_acute_myocardial_infarction_now)
    :named REQ4_AUXILIARY1)) ;; "Killip class IV acute myocardial infarction at admission"

(assert
(! (=> patient_has_finding_of_killip_class_iv_acute_myocardial_infarction_now@@with_need_of_ventilatory_support
       patient_has_finding_of_killip_class_iv_acute_myocardial_infarction_now)
    :named REQ4_AUXILIARY2)) ;; "Killip class IV acute myocardial infarction with need of ventilatory support"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient has cardiac arrest
(assert
(! (not patient_has_finding_of_cardiac_arrest_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cardiac arrest."

;; Exclusion: patient has Killip class IV acute myocardial infarction at admission with need of ventilatory support
(assert
(! (not (and patient_has_finding_of_killip_class_iv_acute_myocardial_infarction_now@@present_at_admission
             patient_has_finding_of_killip_class_iv_acute_myocardial_infarction_now@@with_need_of_ventilatory_support))
    :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has Killip class IV acute myocardial infarction at admission with need of ventilatory support."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_cardiogenic_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cardiogenic shock.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cardiogenic shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of cardiogenic shock.","meaning":"Boolean indicating whether the patient currently has cardiogenic shock."} ;; "cardiogenic shock"

(declare-const patient_has_finding_of_cardiogenic_shock_now@@persists_up_to_third_day_after_acute_myocardial_infarction Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cardiogenic shock persists up to the third day after acute myocardial infarction.","when_to_set_to_false":"Set to false if the patient's cardiogenic shock does not persist up to the third day after acute myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cardiogenic shock persists up to the third day after acute myocardial infarction.","meaning":"Boolean indicating whether the patient's cardiogenic shock persists up to the third day after acute myocardial infarction."} ;; "cardiogenic shock persisting up to the third day after acute myocardial infarction"

(declare-const patient_has_finding_of_cardiogenic_shock_now@@need_of_intra_aortic_balloon_pump Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cardiogenic shock requires intra-aortic balloon pump.","when_to_set_to_false":"Set to false if the patient's cardiogenic shock does not require intra-aortic balloon pump.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cardiogenic shock requires intra-aortic balloon pump.","meaning":"Boolean indicating whether the patient's cardiogenic shock requires intra-aortic balloon pump."} ;; "need of intra-aortic balloon pump"

(declare-const patient_has_finding_of_cardiogenic_shock_now@@need_of_vasopressor_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cardiogenic shock requires vasopressor therapy.","when_to_set_to_false":"Set to false if the patient's cardiogenic shock does not require vasopressor therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cardiogenic shock requires vasopressor therapy.","meaning":"Boolean indicating whether the patient's cardiogenic shock requires vasopressor therapy."} ;; "need of vasopressor therapy"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_cardiogenic_shock_now@@persists_up_to_third_day_after_acute_myocardial_infarction
      patient_has_finding_of_cardiogenic_shock_now)
:named REQ5_AUXILIARY0)) ;; "cardiogenic shock persisting up to the third day after acute myocardial infarction"

(assert
(! (=> patient_has_finding_of_cardiogenic_shock_now@@need_of_intra_aortic_balloon_pump
      patient_has_finding_of_cardiogenic_shock_now)
:named REQ5_AUXILIARY1)) ;; "need of intra-aortic balloon pump"

(assert
(! (=> patient_has_finding_of_cardiogenic_shock_now@@need_of_vasopressor_therapy
      patient_has_finding_of_cardiogenic_shock_now)
:named REQ5_AUXILIARY2)) ;; "need of vasopressor therapy"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: (cardiogenic shock persisting up to the third day after acute myocardial infarction with need of intra-aortic balloon pump)
(assert
(! (not (and patient_has_finding_of_cardiogenic_shock_now@@persists_up_to_third_day_after_acute_myocardial_infarction
             patient_has_finding_of_cardiogenic_shock_now@@need_of_intra_aortic_balloon_pump))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "cardiogenic shock persisting up to the third day after acute myocardial infarction with need of intra-aortic balloon pump"

;; Exclusion: (cardiogenic shock persisting up to the third day after acute myocardial infarction with need of vasopressor therapy)
(assert
(! (not (and patient_has_finding_of_cardiogenic_shock_now@@persists_up_to_third_day_after_acute_myocardial_infarction
             patient_has_finding_of_cardiogenic_shock_now@@need_of_vasopressor_therapy))
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "cardiogenic shock persisting up to the third day after acute myocardial infarction with need of vasopressor therapy"

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_acute_myocardial_infarction_now@@associated_with_mechanical_complications Bool) ;; {"when_to_set_to_true":"Set to true if the patient's acute myocardial infarction is associated with mechanical complications.","when_to_set_to_false":"Set to false if the patient's acute myocardial infarction is not associated with mechanical complications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's acute myocardial infarction is associated with mechanical complications.","meaning":"Boolean indicating whether the patient currently has acute myocardial infarction associated with mechanical complications."} ;; "acute myocardial infarction mechanical complications"

(declare-const patient_has_finding_of_ventricular_septal_defect_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of ventricular septal defect.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of ventricular septal defect.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of ventricular septal defect.","meaning":"Boolean indicating whether the patient currently has ventricular septal defect."} ;; "ventricular septal defect"

(declare-const patient_has_finding_of_rupture_of_papillary_muscle_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of rupture of papillary muscle.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of rupture of papillary muscle.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of rupture of papillary muscle.","meaning":"Boolean indicating whether the patient currently has rupture of papillary muscle."} ;; "papillary muscle rupture"

(declare-const patient_has_finding_of_left_ventricular_free_wall_rupture_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of left ventricular free wall rupture.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of left ventricular free wall rupture.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of left ventricular free wall rupture.","meaning":"Boolean indicating whether the patient currently has left ventricular free wall rupture."} ;; "left ventricular free wall rupture"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Exhaustive subcategories define the umbrella exactly:
(assert
(! (= patient_has_finding_of_acute_myocardial_infarction_now@@associated_with_mechanical_complications
     (or patient_has_finding_of_ventricular_septal_defect_now
         patient_has_finding_of_rupture_of_papillary_muscle_now
         patient_has_finding_of_left_ventricular_free_wall_rupture_now))
   :named REQ6_AUXILIARY0)) ;; "with exhaustive subcategories (ventricular septal defect, papillary muscle rupture, left ventricular free wall rupture)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_acute_myocardial_infarction_now@@associated_with_mechanical_complications
       patient_has_finding_of_acute_myocardial_infarction_now)
   :named REQ6_AUXILIARY1)) ;; "acute myocardial infarction mechanical complications" implies "acute myocardial infarction"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_acute_myocardial_infarction_now@@associated_with_mechanical_complications)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has (acute myocardial infarction mechanical complications with exhaustive subcategories (ventricular septal defect, papillary muscle rupture, left ventricular free wall rupture))."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_heart_valve_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any heart valve disorder.","when_to_set_to_false":"Set to false if the patient currently does not have any heart valve disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any heart valve disorder.","meaning":"Boolean indicating whether the patient currently has any heart valve disorder."} ;; "valve disease"
(declare-const patient_has_finding_of_aortic_valve_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has aortic valve stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have aortic valve stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has aortic valve stenosis.","meaning":"Boolean indicating whether the patient currently has aortic valve stenosis."} ;; "aortic stenosis"
(declare-const aortic_valve_mean_systolic_pressure_gradient_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current mean systolic pressure gradient across the aortic valve, measured in mmHg, if available.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current mean systolic pressure gradient across the aortic valve, measured in mmHg."} ;; "mean systolic pressure gradient across the aortic valve > 50 mmHg"
(declare-const patient_has_finding_of_mitral_valve_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has mitral valve stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have mitral valve stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has mitral valve stenosis.","meaning":"Boolean indicating whether the patient currently has mitral valve stenosis."} ;; "mitral stenosis"
(declare-const mitral_valve_area_value_recorded_now_withunit_cm2 Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current mitral valve area, measured in cm², if available.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current mitral valve area, measured in cm²."} ;; "mitral valve area < 1.5 cm²"
(declare-const patient_has_finding_of_aortic_valve_regurgitation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has aortic valve regurgitation.","when_to_set_to_false":"Set to false if the patient currently does not have aortic valve regurgitation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has aortic valve regurgitation.","meaning":"Boolean indicating whether the patient currently has aortic valve regurgitation."} ;; "aortic regurgitation"
(declare-const aortic_valve_regurgitation_severity_value_recorded_now_withunit_grade Real) ;; {"when_to_set_to_value":"Set to the numeric or ordinal value representing the current severity grade of aortic valve regurgitation for the patient, if available.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric or ordinal value indicating the current severity grade of aortic valve regurgitation for the patient."} ;; "moderate to severe aortic regurgitation"
(declare-const patient_has_finding_of_mitral_valve_regurgitation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has mitral valve regurgitation.","when_to_set_to_false":"Set to false if the patient currently does not have mitral valve regurgitation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has mitral valve regurgitation.","meaning":"Boolean indicating whether the patient currently has mitral valve regurgitation."} ;; "mitral regurgitation"
(declare-const mitral_valve_regurgitation_severity_value_recorded_now_withunit_grade Real) ;; {"when_to_set_to_value":"Set to the numeric or ordinal value representing the current severity grade of mitral valve regurgitation for the patient, if available.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric or ordinal value indicating the current severity grade of mitral valve regurgitation for the patient."} ;; "moderate to severe mitral regurgitation"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Definition: significant valve disease = (aortic stenosis with mean systolic pressure gradient > 50 mmHg) OR (mitral stenosis with valvular area < 1.5 cm²) OR (moderate to severe aortic regurgitation) OR (moderate to severe mitral regurgitation)
(assert
(! (= patient_has_finding_of_heart_valve_disorder_now
(or
  (and patient_has_finding_of_aortic_valve_stenosis_now
       (> aortic_valve_mean_systolic_pressure_gradient_value_recorded_now_withunit_mmhg 50))
  (and patient_has_finding_of_mitral_valve_stenosis_now
       (< mitral_valve_area_value_recorded_now_withunit_cm2 1.5))
  (and patient_has_finding_of_aortic_valve_regurgitation_now
       (>= aortic_valve_regurgitation_severity_value_recorded_now_withunit_grade 2)) ;; "moderate to severe" assumed as grade >= 2
  (and patient_has_finding_of_mitral_valve_regurgitation_now
       (>= mitral_valve_regurgitation_severity_value_recorded_now_withunit_grade 2)) ;; "moderate to severe" assumed as grade >= 2
))
:named REQ7_AUXILIARY0)) ;; "significant valve disease defined as (aortic stenosis with mean systolic pressure gradient across the aortic valve > 50 mmHg) OR (mitral stenosis with valvular area < 1.5 cm²) OR (moderate to severe aortic regurgitation) OR (moderate to severe mitral regurgitation)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_aortic_valve_stenosis_now patient_has_finding_of_heart_valve_disorder_now)
:named REQ7_AUXILIARY1)) ;; "aortic stenosis is a heart valve disorder"
(assert
(! (=> patient_has_finding_of_mitral_valve_stenosis_now patient_has_finding_of_heart_valve_disorder_now)
:named REQ7_AUXILIARY2)) ;; "mitral stenosis is a heart valve disorder"
(assert
(! (=> patient_has_finding_of_aortic_valve_regurgitation_now patient_has_finding_of_heart_valve_disorder_now)
:named REQ7_AUXILIARY3)) ;; "aortic regurgitation is a heart valve disorder"
(assert
(! (=> patient_has_finding_of_mitral_valve_regurgitation_now patient_has_finding_of_heart_valve_disorder_now)
:named REQ7_AUXILIARY4)) ;; "mitral regurgitation is a heart valve disorder"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_heart_valve_disorder_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant valve disease defined as (aortic stenosis with mean systolic pressure gradient across the aortic valve > 50 mmHg) OR (mitral stenosis with valvular area < 1.5 cm²) OR (moderate to severe aortic regurgitation) OR (moderate to severe mitral regurgitation)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_exposed_to_immunosuppressant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to an immunosuppressant.","when_to_set_to_false":"Set to false if the patient is currently not exposed to an immunosuppressant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to an immunosuppressant.","meaning":"Boolean indicating whether the patient is currently exposed to an immunosuppressant."} ;; "immunosuppressive agent"
(declare-const patient_is_exposed_to_immunosuppressant_now@@chronic_use Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to an immunosuppressant is chronic (long-term or ongoing).","when_to_set_to_false":"Set to false if the patient's current exposure to an immunosuppressant is not chronic (i.e., it is acute, short-term, or a single exposure).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current exposure to an immunosuppressant is chronic.","meaning":"Boolean indicating whether the patient's current exposure to an immunosuppressant is chronic."} ;; "chronic use of immunosuppressive agent"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_immunosuppressant_now@@chronic_use
       patient_is_exposed_to_immunosuppressant_now)
   :named REQ8_AUXILIARY0)) ;; "chronic use of immunosuppressive agent" (qualifier variable implies stem variable)

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_is_exposed_to_immunosuppressant_now@@chronic_use)
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has (chronic use of immunosuppressive agent)."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const creatinine_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the patient's most recently recorded creatinine value in mg/dl.","when_to_set_to_null":"Set to null if the patient's creatinine value is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's most recently recorded creatinine in mg/dl."} ;; "creatinine > 2.0 mg/dl"
(declare-const patient_has_undergone_dialysis_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone dialysis treatment at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone dialysis treatment at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone dialysis treatment.","meaning":"Boolean indicating whether the patient has ever undergone dialysis treatment in the past."} ;; "previous dialysis treatment"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not (> creatinine_value_recorded_now_withunit_mg_per_dl 2.0))
    :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has creatinine > 2.0 mg/dl."

(assert
(! (not patient_has_undergone_dialysis_procedure_inthehistory)
    :named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous dialysis treatment."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_active_systemic_infection_meeting_sepsis_definition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an active systemic infection that meets the sepsis definition according to the American College of Chest Physicians/Society of Critical Care Medicine.","when_to_set_to_false":"Set to false if the patient currently does not have an active systemic infection that meets the sepsis definition according to the American College of Chest Physicians/Society of Critical Care Medicine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an active systemic infection that meets the sepsis definition according to the American College of Chest Physicians/Society of Critical Care Medicine.","meaning":"Boolean indicating whether the patient currently has an active systemic infection that meets the sepsis definition according to the American College of Chest Physicians/Society of Critical Care Medicine."} ;; "active systemic infection according to American College of Chest Physicians/Society of Critical Care Medicine sepsis definition"
(declare-const patient_has_finding_of_fever_within_48_hours_before_injection Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a fever at any time within the past forty-eight hours before injection.","when_to_set_to_false":"Set to false if the patient has not had a fever at any time within the past forty-eight hours before injection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a fever within the past forty-eight hours before injection.","meaning":"Boolean indicating whether the patient has had a fever within the past forty-eight hours before injection."} ;; "presence of fever within the past forty-eight hours before injection"
(declare-const patient_has_finding_of_sepsis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of sepsis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of sepsis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of sepsis.","meaning":"Boolean indicating whether the patient currently has sepsis."} ;; "sepsis"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Definition: active systemic infection meeting sepsis definition is present if and only if both fever within 48 hours before injection and sepsis are present
(assert
(! (= patient_has_finding_of_active_systemic_infection_meeting_sepsis_definition_now
     (and patient_has_finding_of_fever_within_48_hours_before_injection
          patient_has_finding_of_sepsis_now))
:named REQ10_AUXILIARY0)) ;; "presence of fever within the past forty-eight hours before injection indicating active systemic infection according to American College of Chest Physicians/Society of Critical Care Medicine sepsis definition"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_active_systemic_infection_meeting_sepsis_definition_now)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has presence of fever within the past forty-eight hours before injection indicating active systemic infection according to American College of Chest Physicians/Society of Critical Care Medicine sepsis definition."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_sustained_ventricular_tachycardia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had sustained ventricular tachycardia at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had sustained ventricular tachycardia at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had sustained ventricular tachycardia.","meaning":"Boolean indicating whether the patient has ever had sustained ventricular tachycardia in their history."} ;; "sustained ventricular tachycardia"

(declare-const patient_has_finding_of_sustained_ventricular_tachycardia_inthehistory@@temporalcontext_within_48_hours_after_acute_myocardial_infarction Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sustained ventricular tachycardia occurred within forty-eight hours after an acute myocardial infarction.","when_to_set_to_false":"Set to false if the patient's sustained ventricular tachycardia did not occur within forty-eight hours after an acute myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the sustained ventricular tachycardia occurred within forty-eight hours after an acute myocardial infarction.","meaning":"Boolean indicating whether the sustained ventricular tachycardia occurred within forty-eight hours after acute myocardial infarction."} ;; "sustained ventricular tachycardia occurring forty-eight hours after acute myocardial infarction"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_sustained_ventricular_tachycardia_inthehistory@@temporalcontext_within_48_hours_after_acute_myocardial_infarction
      patient_has_finding_of_sustained_ventricular_tachycardia_inthehistory)
   :named REQ11_AUXILIARY0)) ;; "sustained ventricular tachycardia occurring forty-eight hours after acute myocardial infarction"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_finding_of_sustained_ventricular_tachycardia_inthehistory@@temporalcontext_within_48_hours_after_acute_myocardial_infarction)
   :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has sustained ventricular tachycardia occurring forty-eight hours after acute myocardial infarction."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_alcohol_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of alcohol abuse.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of alcohol abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of alcohol abuse.","meaning":"Boolean indicating whether the patient currently has alcohol abuse."} ;; "alcohol abuse"
(declare-const patient_has_finding_of_alcohol_abuse_now@@defined_by_dsm_iv_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's alcohol abuse is defined based on DSM-IV criteria.","when_to_set_to_false":"Set to false if the patient's alcohol abuse is not defined based on DSM-IV criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's alcohol abuse is defined based on DSM-IV criteria.","meaning":"Boolean indicating whether the patient's alcohol abuse is defined based on DSM-IV criteria."} ;; "alcohol abuse based on Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition criteria"
(declare-const patient_has_finding_of_illicit_drug_abuse_now@@defined_by_dsm_iv_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has illicit drug abuse and the finding is defined based on DSM-IV criteria.","when_to_set_to_false":"Set to false if the patient currently does not have illicit drug abuse or the finding is not defined based on DSM-IV criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has illicit drug abuse defined by DSM-IV criteria.","meaning":"Boolean indicating whether the patient currently has illicit drug abuse defined by DSM-IV criteria."} ;; "illicit drug abuse based on Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition criteria"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variable for alcohol abuse implies stem variable
(assert
(! (=> patient_has_finding_of_alcohol_abuse_now@@defined_by_dsm_iv_criteria
       patient_has_finding_of_alcohol_abuse_now)
   :named REQ12_AUXILIARY0)) ;; "alcohol abuse based on Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition criteria"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not (or patient_has_finding_of_illicit_drug_abuse_now@@defined_by_dsm_iv_criteria
            patient_has_finding_of_alcohol_abuse_now@@defined_by_dsm_iv_criteria))
   :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has illicit drug abuse based on Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition criteria) OR (the patient has alcohol abuse based on Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition criteria))."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_finding_of_co_morbid_conditions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any comorbid condition.","when_to_set_to_false":"Set to false if the patient currently does not have any comorbid condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any comorbid condition.","meaning":"Boolean indicating whether the patient currently has any comorbid condition."} ;; "comorbidity"

(declare-const patient_has_finding_of_co_morbid_conditions_now@@survival_impact_within_two_years Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any comorbid condition and that comorbidity has survival impact within two years.","when_to_set_to_false":"Set to false if the patient currently has any comorbid condition but it does not have survival impact within two years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the comorbidity has survival impact within two years.","meaning":"Boolean indicating whether the patient's comorbid condition has survival impact within two years."} ;; "comorbidity with survival impact within two years"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_co_morbid_conditions_now@@survival_impact_within_two_years
      patient_has_finding_of_co_morbid_conditions_now)
:named REQ13_AUXILIARY0)) ;; "comorbidity with survival impact within two years""

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_finding_of_co_morbid_conditions_now@@survival_impact_within_two_years)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any comorbidity with survival impact within two years."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_myocarditis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of myocarditis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of myocarditis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has myocarditis.","meaning":"Boolean indicating whether the patient currently has myocarditis."} ;; "myocarditis"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_finding_of_myocarditis_now)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has myocarditis."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_finding_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has liver disease.","when_to_set_to_false":"Set to false if the patient currently does not have liver disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has liver disease.","meaning":"Boolean indicating whether the patient currently has liver disease now."} ;; "liver disease"
(declare-const patient_has_finding_of_disease_of_liver_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has liver disease and the disease is active.","when_to_set_to_false":"Set to false if the patient currently has liver disease but the disease is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the liver disease is active.","meaning":"Boolean indicating whether the patient's current liver disease is active."} ;; "active liver disease"

;; ===================== Auxiliary Assertions (REQ 15) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_of_liver_now@@active
       patient_has_finding_of_disease_of_liver_now)
   :named REQ15_AUXILIARY0)) ;; "active liver disease"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_finding_of_disease_of_liver_now@@active)
   :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active liver disease."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic obstructive lung disease (COPD).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic obstructive lung disease (COPD).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic obstructive lung disease (COPD).","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic obstructive lung disease (COPD)."} ;; "chronic obstructive pulmonary disease"
(declare-const patient_is_exposed_to_steroid_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to steroids.","when_to_set_to_false":"Set to false if the patient is currently not exposed to steroids.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to steroids.","meaning":"Boolean indicating whether the patient is currently exposed to steroids."} ;; "steroid"
(declare-const patient_is_exposed_to_steroid_now@@continuous_use Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to steroids is continuous.","when_to_set_to_false":"Set to false if the patient's current exposure to steroids is not continuous.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current exposure to steroids is continuous.","meaning":"Boolean indicating whether the patient's current exposure to steroids is continuous."} ;; "continuous steroid use"

;; ===================== Auxiliary Assertions (REQ 16) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_steroid_now@@continuous_use
       patient_is_exposed_to_steroid_now)
   :named REQ16_AUXILIARY0)) ;; "continuous steroid use" implies "steroid use"

;; ===================== Constraint Assertions (REQ 16) =====================
;; Exclusion: patient must NOT have both COPD and continuous steroid use
(assert
(! (not (and patient_has_diagnosis_of_chronic_obstructive_lung_disease_now
             patient_is_exposed_to_steroid_now@@continuous_use))
   :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has chronic obstructive pulmonary disease) AND (the patient is in continuous steroid use))."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_diagnosis_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any hematological disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of any hematological disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of any hematological disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of any hematological disease."} ;; "hematological disease"
(declare-const patient_has_diagnosis_of_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of neoplastic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of neoplastic disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of neoplastic disease."} ;; "neoplasm"
(declare-const patient_has_diagnosis_of_disorder_of_bone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of disorder of bone.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of disorder of bone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of disorder of bone.","meaning":"Boolean indicating whether the patient currently has a diagnosis of disorder of bone."} ;; "bone disease"
(declare-const patient_has_diagnosis_of_blood_coagulation_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of blood coagulation disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of blood coagulation disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of blood coagulation disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of blood coagulation disorder."} ;; "hemostatic disturbance"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not patient_has_diagnosis_of_disease_now)
:named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hematological disease."

(assert
(! (not patient_has_diagnosis_of_neoplastic_disease_now)
:named REQ17_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has neoplasm."

(assert
(! (not patient_has_diagnosis_of_disorder_of_bone_now)
:named REQ17_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has bone disease."

(assert
(! (not patient_has_diagnosis_of_blood_coagulation_disorder_now)
:named REQ17_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hemostatic disturbance."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_has_finding_of_inflammatory_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of inflammatory disorder.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of inflammatory disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of inflammatory disorder.","meaning":"Boolean indicating whether the patient currently has an inflammatory disorder."} ;; "inflammatory disease"
(declare-const patient_has_finding_of_chronic_infectious_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chronic infectious disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chronic infectious disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of chronic infectious disease.","meaning":"Boolean indicating whether the patient currently has a chronic infectious disease."} ;; "chronic infectious disease"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not patient_has_finding_of_inflammatory_disorder_now)
:named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has inflammatory disease."

(assert
(! (not patient_has_finding_of_chronic_infectious_disease_now)
:named REQ18_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic infectious disease."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_has_undergone_implantation_of_cardiac_pacemaker_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone implantation of a cardiac pacemaker at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone implantation of a cardiac pacemaker at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone implantation of a cardiac pacemaker.","meaning":"Boolean indicating whether the patient has ever undergone implantation of a cardiac pacemaker."} ;; "definitive implantation of a cardiac pacemaker"

(declare-const patient_has_undergone_implantation_of_internal_cardiac_defibrillator_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone implantation of an internal cardiac defibrillator at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone implantation of an internal cardiac defibrillator at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone implantation of an internal cardiac defibrillator.","meaning":"Boolean indicating whether the patient has ever undergone implantation of an internal cardiac defibrillator."} ;; "definitive implantation of a cardiac defibrillator"

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not patient_has_undergone_implantation_of_cardiac_pacemaker_inthehistory)
:named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has definitive implantation of a cardiac pacemaker."

(assert
(! (not patient_has_undergone_implantation_of_internal_cardiac_defibrillator_inthehistory)
:named REQ19_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has definitive implantation of a cardiac defibrillator."

;; ===================== Declarations for the exclusion criterion (REQ 20) =====================
(declare-const cell_suspension_mononuclear_cell_count_value_recorded_now_withunit_million Real) ;; {"when_to_set_to_value":"Set to the value representing the number of mononuclear cells in the cell suspension obtained from the patient at the current time, measured in millions.","when_to_set_to_null":"Set to null if the number of mononuclear cells in the cell suspension is unknown, not documented, or cannot be determined.","meaning":"Numeric variable indicating the number of mononuclear cells present in the cell suspension obtained from the patient at the current time, measured in millions."} ;; "cell suspension of 100 million mononuclear cells"

(declare-const patient_has_finding_of_cell_paucity_in_bone_marrow_aspirate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cell paucity present in the bone marrow aspirate.","when_to_set_to_false":"Set to false if the patient currently does not have cell paucity present in the bone marrow aspirate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cell paucity present in the bone marrow aspirate.","meaning":"Boolean clinical finding indicating whether the patient currently has cell paucity present in the bone marrow aspirate."} ;; "cell paucity in the bone marrow aspirate"

(declare-const patient_is_exposed_to_marrow_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to bone marrow (e.g., via aspirate for cell collection).","when_to_set_to_false":"Set to false if the patient is currently not exposed to bone marrow (e.g., no aspirate available for cell collection).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to bone marrow.","meaning":"Boolean indicating whether the patient is currently exposed to bone marrow."} ;; "bone marrow"

(declare-const patient_is_exposed_to_marrow_now@@obtained_via_aspirate Bool) ;; {"when_to_set_to_true":"Set to true if the patient's bone marrow exposure is specifically via aspirate.","when_to_set_to_false":"Set to false if the patient's bone marrow exposure is not via aspirate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the bone marrow exposure is via aspirate.","meaning":"Boolean indicating whether the patient's bone marrow exposure is via aspirate."} ;; "bone marrow obtained via aspirate"

;; ===================== Auxiliary Assertions (REQ 20) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_marrow_now@@obtained_via_aspirate
      patient_is_exposed_to_marrow_now)
:named REQ20_AUXILIARY0)) ;; "bone marrow obtained via aspirate"

;; ===================== Constraint Assertions (REQ 20) =====================
;; Exclusion: impossibility to reach a cell suspension of 100 million mononuclear cells due to cell paucity in the bone marrow aspirate
(assert
(! (not (and patient_has_finding_of_cell_paucity_in_bone_marrow_aspirate_now
             patient_is_exposed_to_marrow_now@@obtained_via_aspirate
             (< cell_suspension_mononuclear_cell_count_value_recorded_now_withunit_million 100)))
:named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "impossibility to reach a cell suspension of 100 million mononuclear cells due to cell paucity in the bone marrow aspirate"
