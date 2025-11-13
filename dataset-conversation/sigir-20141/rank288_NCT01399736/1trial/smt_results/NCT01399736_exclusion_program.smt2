;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const left_main_coronary_artery_stenosis_percentage_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the percentage of stenosis in the left main coronary artery currently recorded, in percent.","when_to_set_to_null":"Set to null if the percentage of stenosis in the left main coronary artery is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the percentage of stenosis in the left main coronary artery currently recorded, with unit percent."} ;; "left main coronary artery stenosis > 50%."
(declare-const patient_has_finding_of_left_main_coronary_artery_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of left main coronary artery disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of left main coronary artery disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has left main coronary artery disease.","meaning":"Boolean indicating whether the patient currently has left main coronary artery disease."} ;; "left main coronary artery disease"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (and patient_has_finding_of_left_main_coronary_artery_disease_now
             (> left_main_coronary_artery_stenosis_percentage_value_recorded_now_withunit_percent 50)))
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has left main coronary artery disease with left main coronary artery stenosis > 50%."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_acute_st_segment_elevation_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute ST-segment elevation myocardial infarction (STEMI).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute ST-segment elevation myocardial infarction (STEMI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of acute ST-segment elevation myocardial infarction (STEMI).","meaning":"Boolean indicating whether the patient currently has acute ST-segment elevation myocardial infarction (STEMI)."} ;; "ST-elevation myocardial infarction (STEMI)"
(declare-const patient_has_finding_of_acute_st_segment_elevation_myocardial_infarction_now@@caused_by_in_stent_thrombosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current acute ST-segment elevation myocardial infarction (STEMI) is caused by in-stent thrombosis.","when_to_set_to_false":"Set to false if the patient's current acute ST-segment elevation myocardial infarction (STEMI) is not caused by in-stent thrombosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current STEMI is caused by in-stent thrombosis.","meaning":"Boolean indicating whether the patient's current STEMI is caused by in-stent thrombosis."} ;; "ST-elevation myocardial infarction (STEMI) due to in-stent thrombosis"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_acute_st_segment_elevation_myocardial_infarction_now@@caused_by_in_stent_thrombosis
      patient_has_finding_of_acute_st_segment_elevation_myocardial_infarction_now)
   :named REQ1_AUXILIARY0)) ;; "ST-elevation myocardial infarction (STEMI) due to in-stent thrombosis"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_acute_st_segment_elevation_myocardial_infarction_now@@caused_by_in_stent_thrombosis)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has ST-elevation myocardial infarction (STEMI) due to in-stent thrombosis."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_chronic_total_occlusion_of_non_infarct_related_artery_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic total occlusion of a non-infarct related artery (non-IRA).","when_to_set_to_false":"Set to false if the patient currently does not have chronic total occlusion of a non-infarct related artery (non-IRA).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic total occlusion of a non-infarct related artery (non-IRA).","meaning":"Boolean indicating whether the patient currently has chronic total occlusion of a non-infarct related artery (non-IRA)."} ;; "chronic total occlusion of a non-infarct related artery (non-IRA)"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_chronic_total_occlusion_of_non_infarct_related_artery_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic total occlusion of a non-infarct related artery (non-IRA)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_stricture_of_artery_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of stricture (stenosis) of an artery.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of stricture (stenosis) of an artery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of stricture (stenosis) of an artery.","meaning":"Boolean indicating whether the patient currently has a stricture (stenosis) of an artery."} ;; "stenosis"

(declare-const patient_has_finding_of_stricture_of_artery_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the stricture (stenosis) of artery is severe.","when_to_set_to_false":"Set to false if the stricture (stenosis) of artery is not severe.","when_to_set_to_null":"Set to null if severity of the stricture (stenosis) of artery is unknown or indeterminate.","meaning":"Boolean indicating whether the stricture (stenosis) of artery is severe."} ;; "severe stenosis"

(declare-const patient_has_finding_of_stricture_of_artery_now@@location_non_infarct_related_artery Bool) ;; {"when_to_set_to_true":"Set to true if the stricture (stenosis) of artery is located in a non-infarct related artery.","when_to_set_to_false":"Set to false if the stricture (stenosis) of artery is not located in a non-infarct related artery.","when_to_set_to_null":"Set to null if the location of the stricture (stenosis) of artery is unknown or indeterminate.","meaning":"Boolean indicating whether the stricture (stenosis) of artery is located in a non-infarct related artery."} ;; "non-infarct related artery (non-IRA)"

(declare-const patient_has_finding_of_stricture_of_artery_now@@associated_timi_flow_leq_ii Bool) ;; {"when_to_set_to_true":"Set to true if the stricture (stenosis) of artery is associated with TIMI flow less than or equal to II.","when_to_set_to_false":"Set to false if the stricture (stenosis) of artery is associated with TIMI flow greater than II.","when_to_set_to_null":"Set to null if the TIMI flow associated with the stricture (stenosis) of artery is unknown or indeterminate.","meaning":"Boolean indicating whether the stricture (stenosis) of artery is associated with TIMI flow ≤ II."} ;; "thrombolysis in myocardial infarction (TIMI) flow ≤ II"

(declare-const patient_has_finding_of_stricture_of_artery_now@@severity_severe@@location_non_infarct_related_artery@@associated_timi_flow_leq_ii Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe stricture (stenosis) of an artery located in a non-infarct related artery and the associated TIMI flow is less than or equal to II.","when_to_set_to_false":"Set to false if the patient currently does not have severe stricture (stenosis) of an artery located in a non-infarct related artery with TIMI flow less than or equal to II.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe stricture (stenosis) of an artery located in a non-infarct related artery with TIMI flow less than or equal to II.","meaning":"Boolean indicating whether the patient currently has severe stricture (stenosis) of an artery located in a non-infarct related artery and the associated TIMI flow is ≤ II."} ;; "severe stenosis with TIMI flow ≤ II in the non-infarct related artery (non-IRA)"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definitional equality for the composite qualifier variable
(assert
(! (= patient_has_finding_of_stricture_of_artery_now@@severity_severe@@location_non_infarct_related_artery@@associated_timi_flow_leq_ii
     (and patient_has_finding_of_stricture_of_artery_now
          patient_has_finding_of_stricture_of_artery_now@@severity_severe
          patient_has_finding_of_stricture_of_artery_now@@location_non_infarct_related_artery
          patient_has_finding_of_stricture_of_artery_now@@associated_timi_flow_leq_ii))
:named REQ3_AUXILIARY0)) ;; "severe stenosis with thrombolysis in myocardial infarction (TIMI) flow ≤ II in the non-infarct related artery (non-IRA)."

;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_stricture_of_artery_now@@severity_severe
       patient_has_finding_of_stricture_of_artery_now)
:named REQ3_AUXILIARY1)) ;; "severe stenosis"

(assert
(! (=> patient_has_finding_of_stricture_of_artery_now@@location_non_infarct_related_artery
       patient_has_finding_of_stricture_of_artery_now)
:named REQ3_AUXILIARY2)) ;; "non-infarct related artery (non-IRA)"

(assert
(! (=> patient_has_finding_of_stricture_of_artery_now@@associated_timi_flow_leq_ii
       patient_has_finding_of_stricture_of_artery_now)
:named REQ3_AUXILIARY3)) ;; "thrombolysis in myocardial infarction (TIMI) flow ≤ II"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_stricture_of_artery_now@@severity_severe@@location_non_infarct_related_artery@@associated_timi_flow_leq_ii)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe stenosis with thrombolysis in myocardial infarction (TIMI) flow ≤ II in the non-infarct related artery (non-IRA)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_can_undergo_percutaneous_coronary_intervention_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo percutaneous coronary intervention (PCI) as a treatment option for non-infarct related artery stenosis, according to the operator's decision.","when_to_set_to_false":"Set to false if the patient cannot currently undergo percutaneous coronary intervention (PCI) as a treatment option for non-infarct related artery stenosis, according to the operator's decision.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo percutaneous coronary intervention (PCI) as a treatment option for non-infarct related artery stenosis.","meaning":"Boolean indicating whether the patient can currently undergo percutaneous coronary intervention (PCI) as a treatment option."} ;; "percutaneous coronary intervention"
(declare-const patient_has_finding_of_stricture_of_artery_now@@location_non_infarct_related_artery@@not_amenable_for_percutaneous_coronary_intervention_according_to_operator_decision Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a stricture (stenosis) of a non-infarct related artery and the operator has decided that it is NOT amenable for percutaneous coronary intervention treatment.","when_to_set_to_false":"Set to false if the patient currently has a stricture (stenosis) of a non-infarct related artery and the operator has decided that it IS amenable for percutaneous coronary intervention treatment, or if the patient does not have such a stricture.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a stricture (stenosis) of a non-infarct related artery that is NOT amenable for percutaneous coronary intervention treatment according to the operator's decision.","meaning":"Boolean indicating whether the patient currently has a stricture (stenosis) of a non-infarct related artery that is NOT amenable for percutaneous coronary intervention treatment according to the operator's decision."} ;; "non-infarct related artery (non-IRA) stenosis that is NOT amenable for percutaneous coronary intervention treatment according to the operator's decision."
(declare-const patient_has_finding_of_stricture_of_artery_now@@location_non_infarct_related_artery@@not_amenable_for_percutaneous_coronary_intervention_according_to_operator_decision@@not_amenable_for_percutaneous_coronary_intervention_according_to_operator_decision Bool) ;; {"when_to_set_to_true":"Set to true if the stricture of the non-infarct related artery is NOT amenable for percutaneous coronary intervention treatment according to the operator's decision.","when_to_set_to_false":"Set to false if the stricture of the non-infarct related artery IS amenable for percutaneous coronary intervention treatment according to the operator's decision.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the stricture of the non-infarct related artery is NOT amenable for percutaneous coronary intervention treatment according to the operator's decision.","meaning":"Boolean indicating whether the stricture of the non-infarct related artery is NOT amenable for percutaneous coronary intervention treatment according to the operator's decision."} ;; "NOT amenable for percutaneous coronary intervention treatment according to the operator's decision."

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_stricture_of_artery_now@@location_non_infarct_related_artery@@not_amenable_for_percutaneous_coronary_intervention_according_to_operator_decision@@not_amenable_for_percutaneous_coronary_intervention_according_to_operator_decision
     patient_has_finding_of_stricture_of_artery_now@@location_non_infarct_related_artery@@not_amenable_for_percutaneous_coronary_intervention_according_to_operator_decision)
:named REQ4_AUXILIARY0)) ;; "The qualifier specifies that the stricture is NOT amenable for percutaneous coronary intervention treatment according to the operator's decision."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_stricture_of_artery_now@@location_non_infarct_related_artery@@not_amenable_for_percutaneous_coronary_intervention_according_to_operator_decision)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has non-infarct related artery (non-IRA) stenosis that is NOT amenable for percutaneous coronary intervention treatment according to the operator's decision."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_complicated_infarct_related_artery_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has complicated infarct related artery (IRA) treatment.","when_to_set_to_false":"Set to false if the patient currently does not have complicated infarct related artery (IRA) treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has complicated infarct related artery (IRA) treatment.","meaning":"Boolean indicating whether the patient currently has complicated infarct related artery (IRA) treatment."} ;; "complicated infarct related artery (IRA) treatment"

(declare-const patient_has_finding_of_extravasation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has extravasation.","when_to_set_to_false":"Set to false if the patient currently does not have extravasation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has extravasation.","meaning":"Boolean indicating whether the patient currently has extravasation."} ;; "extravasation after infarct related artery treatment"

(declare-const patient_has_finding_of_no_reflow_vascular_flow_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of permanent no re-flow in vascular flow.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of permanent no re-flow in vascular flow.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has permanent no re-flow in vascular flow.","meaning":"Boolean indicating whether the patient currently has permanent no re-flow in vascular flow."} ;; "permanent no re-flow after infarct related artery treatment"

(declare-const patient_has_finding_of_no_reflow_vascular_flow_now@@after_infarct_related_artery_treatment_timi_flow_0_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient's permanent no re-flow in vascular flow occurs after infarct related artery treatment (TIMI flow 0-1).","when_to_set_to_false":"Set to false if the patient's permanent no re-flow in vascular flow does not occur after infarct related artery treatment (TIMI flow 0-1).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the permanent no re-flow occurs after infarct related artery treatment (TIMI flow 0-1).","meaning":"Boolean indicating whether the patient's permanent no re-flow in vascular flow occurs after infarct related artery treatment (TIMI flow 0-1)."} ;; "permanent no re-flow after infarct related artery treatment (thrombolysis in myocardial infarction (TIMI) flow 0-1)"

(declare-const patient_has_finding_of_inability_to_implant_stent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has inability to implant a stent.","when_to_set_to_false":"Set to false if the patient currently does not have inability to implant a stent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has inability to implant a stent.","meaning":"Boolean indicating whether the patient currently has inability to implant a stent."} ;; "inability to implant a stent after infarct related artery treatment"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definition: complicated IRA treatment = at least one of the following
(assert
(! (= patient_has_complicated_infarct_related_artery_treatment_now
     (or patient_has_finding_of_extravasation_now
         patient_has_finding_of_no_reflow_vascular_flow_now@@after_infarct_related_artery_treatment_timi_flow_0_1
         patient_has_finding_of_inability_to_implant_stent_now))
:named REQ5_AUXILIARY0)) ;; "complicated infarct related artery (IRA) treatment, defined as (the patient has at least one of the following: extravasation OR permanent no re-flow after infarct related artery treatment (TIMI flow 0-1) OR inability to implant a stent)."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_no_reflow_vascular_flow_now@@after_infarct_related_artery_treatment_timi_flow_0_1
       patient_has_finding_of_no_reflow_vascular_flow_now)
:named REQ5_AUXILIARY1)) ;; "permanent no re-flow after infarct related artery treatment (TIMI flow 0-1)"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_extravasation_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has extravasation after infarct related artery treatment."

(assert
(! (not patient_has_finding_of_no_reflow_vascular_flow_now@@after_infarct_related_artery_treatment_timi_flow_0_1)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has permanent no re-flow after infarct related artery treatment (thrombolysis in myocardial infarction (TIMI) flow 0-1)."

(assert
(! (not patient_has_finding_of_inability_to_implant_stent_now)
:named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has inability to implant a stent after infarct related artery treatment."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_heart_valve_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a heart valve disorder (cardiac valve dysfunction).","when_to_set_to_false":"Set to false if the patient currently does not have a heart valve disorder (cardiac valve dysfunction).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a heart valve disorder (cardiac valve dysfunction).","meaning":"Boolean indicating whether the patient currently has a heart valve disorder (cardiac valve dysfunction)."} ;; "cardiac valve dysfunction"

(declare-const patient_has_finding_of_heart_valve_disorder_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current heart valve disorder is severe.","when_to_set_to_false":"Set to false if the patient's current heart valve disorder is not severe.","when_to_set_to_null":"Set to null if severity of the patient's current heart valve disorder is unknown or indeterminate.","meaning":"Boolean indicating whether the patient's current heart valve disorder is severe."} ;; "severe cardiac valve dysfunction"

(declare-const patient_has_finding_of_heart_valve_disorder_now@@will_require_surgery_in_the_follow_up_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current heart valve disorder will require surgery in the follow-up period.","when_to_set_to_false":"Set to false if the patient's current heart valve disorder will not require surgery in the follow-up period.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the patient's current heart valve disorder will require surgery in the follow-up period.","meaning":"Boolean indicating whether the patient's current heart valve disorder will require surgery in the follow-up period."} ;; "will require surgery in the follow-up period"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_heart_valve_disorder_now@@severe
       patient_has_finding_of_heart_valve_disorder_now)
   :named REQ6_AUXILIARY0)) ;; "severe cardiac valve dysfunction"

(assert
(! (=> patient_has_finding_of_heart_valve_disorder_now@@will_require_surgery_in_the_follow_up_period
       patient_has_finding_of_heart_valve_disorder_now)
   :named REQ6_AUXILIARY1)) ;; "will require surgery in the follow-up period"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient must NOT have known severe cardiac valve dysfunction that will require surgery in the follow-up period
(assert
(! (not (and patient_has_finding_of_heart_valve_disorder_now@@severe
             patient_has_finding_of_heart_valve_disorder_now@@will_require_surgery_in_the_follow_up_period))
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known severe cardiac valve dysfunction that will require surgery in the follow-up period."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_killip_class_iii_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has Killip class III.","when_to_set_to_false":"Set to false if the patient currently does not have Killip class III.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Killip class III.","meaning":"Boolean indicating whether the patient currently has Killip class III."} ;; "Killip class III"
(declare-const patient_has_finding_of_killip_class_iii_now@@at_presentation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's Killip class III finding is present at presentation.","when_to_set_to_false":"Set to false if the patient's Killip class III finding is not present at presentation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's Killip class III finding is present at presentation.","meaning":"Boolean indicating whether the patient's Killip class III finding is present at presentation."} ;; "Killip class III at presentation"
(declare-const patient_has_finding_of_killip_class_iii_now@@at_completion_of_culprit_lesion_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's Killip class III finding is present at the completion of culprit lesion treatment.","when_to_set_to_false":"Set to false if the patient's Killip class III finding is not present at the completion of culprit lesion treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's Killip class III finding is present at the completion of culprit lesion treatment.","meaning":"Boolean indicating whether the patient's Killip class III finding is present at the completion of culprit lesion treatment."} ;; "Killip class III at the completion of culprit lesion treatment"
(declare-const patient_has_finding_of_killip_class_iv_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has Killip class IV.","when_to_set_to_false":"Set to false if the patient currently does not have Killip class IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Killip class IV.","meaning":"Boolean indicating whether the patient currently has Killip class IV."} ;; "Killip class IV"
(declare-const patient_has_finding_of_killip_class_iv_now@@at_presentation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's Killip class IV finding is present at presentation.","when_to_set_to_false":"Set to false if the patient's Killip class IV finding is not present at presentation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's Killip class IV finding is present at presentation.","meaning":"Boolean indicating whether the patient's Killip class IV finding is present at presentation."} ;; "Killip class IV at presentation"
(declare-const patient_has_finding_of_killip_class_iv_now@@at_completion_of_culprit_lesion_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's Killip class IV finding is present at the completion of culprit lesion treatment.","when_to_set_to_false":"Set to false if the patient's Killip class IV finding is not present at the completion of culprit lesion treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's Killip class IV finding is present at the completion of culprit lesion treatment.","meaning":"Boolean indicating whether the patient's Killip class IV finding is present at the completion of culprit lesion treatment."} ;; "Killip class IV at the completion of culprit lesion treatment"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_killip_class_iii_now@@at_presentation
       patient_has_finding_of_killip_class_iii_now)
   :named REQ7_AUXILIARY0)) ;; "Killip class III at presentation"

(assert
(! (=> patient_has_finding_of_killip_class_iii_now@@at_completion_of_culprit_lesion_treatment
       patient_has_finding_of_killip_class_iii_now)
   :named REQ7_AUXILIARY1)) ;; "Killip class III at the completion of culprit lesion treatment"

(assert
(! (=> patient_has_finding_of_killip_class_iv_now@@at_presentation
       patient_has_finding_of_killip_class_iv_now)
   :named REQ7_AUXILIARY2)) ;; "Killip class IV at presentation"

(assert
(! (=> patient_has_finding_of_killip_class_iv_now@@at_completion_of_culprit_lesion_treatment
       patient_has_finding_of_killip_class_iv_now)
   :named REQ7_AUXILIARY3)) ;; "Killip class IV at the completion of culprit lesion treatment"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_killip_class_iii_now@@at_presentation)
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is Killip class III at presentation."

(assert
(! (not patient_has_finding_of_killip_class_iii_now@@at_completion_of_culprit_lesion_treatment)
   :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is Killip class III at the completion of culprit lesion treatment."

(assert
(! (not patient_has_finding_of_killip_class_iv_now@@at_presentation)
   :named REQ7_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is Killip class IV at presentation."

(assert
(! (not patient_has_finding_of_killip_class_iv_now@@at_completion_of_culprit_lesion_treatment)
   :named REQ7_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is Killip class IV at the completion of culprit lesion treatment."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "life expectancy < 2 years"
(declare-const patient_longevity_value_recorded_now_withunit_years Real) ;; {"when_to_set_to_value":"Set to the estimated number of years if the patient's current life expectancy is documented or can be reasonably determined.","when_to_set_to_null":"Set to null if the patient's current life expectancy is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current life expectancy in years."} ;; "life expectancy < 2 years"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (< patient_longevity_value_recorded_now_withunit_years 2))
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has life expectancy < 2 years."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_intolerance_to_aspirin_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had intolerance to aspirin at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had intolerance to aspirin at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had intolerance to aspirin.","meaning":"Boolean indicating whether the patient has ever had intolerance to aspirin in their history."} ;; "intolerance to aspirin"

(declare-const patient_has_finding_of_intolerance_to_clopidogrel_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had intolerance to clopidogrel at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had intolerance to clopidogrel at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had intolerance to clopidogrel.","meaning":"Boolean indicating whether the patient has ever had intolerance to clopidogrel in their history."} ;; "intolerance to clopidogrel"

(declare-const patient_has_finding_of_intolerance_to_prasugrel_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had intolerance to prasugrel at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had intolerance to prasugrel at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had intolerance to prasugrel.","meaning":"Boolean indicating whether the patient has ever had intolerance to prasugrel in their history."} ;; "intolerance to prasugrel"

(declare-const patient_has_finding_of_intolerance_to_ticagrelor_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had intolerance to ticagrelor at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had intolerance to ticagrelor at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had intolerance to ticagrelor.","meaning":"Boolean indicating whether the patient has ever had intolerance to ticagrelor in their history."} ;; "intolerance to ticagrelor"

(declare-const patient_has_finding_of_intolerance_to_heparin_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had intolerance to heparin at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had intolerance to heparin at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had intolerance to heparin.","meaning":"Boolean indicating whether the patient has ever had intolerance to heparin in their history."} ;; "intolerance to heparin"

(declare-const patient_has_finding_of_intolerance_to_bivalirudin_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had intolerance to bivalirudin at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had intolerance to bivalirudin at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had intolerance to bivalirudin.","meaning":"Boolean indicating whether the patient has ever had intolerance to bivalirudin in their history."} ;; "intolerance to bivalirudin"

(declare-const patient_has_finding_of_intolerance_to_everolimus_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had intolerance to everolimus at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had intolerance to everolimus at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had intolerance to everolimus.","meaning":"Boolean indicating whether the patient has ever had intolerance to everolimus in their history."} ;; "intolerance to everolimus"

(declare-const patient_has_finding_of_anaphylaxis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of anaphylaxis at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of anaphylaxis at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of anaphylaxis.","meaning":"Boolean indicating whether the patient has ever had anaphylaxis in their history."} ;; "anaphylaxis"

(declare-const patient_has_finding_of_anaphylaxis_inthehistory@@known_true_anaphylaxis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's anaphylaxis is known to be a true (definite) anaphylactic reaction.","when_to_set_to_false":"Set to false if the patient's anaphylaxis is not known to be a true anaphylactic reaction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's anaphylaxis is a true anaphylactic reaction.","meaning":"Boolean indicating whether the patient's anaphylaxis is known to be a true anaphylactic reaction."} ;; "known true anaphylaxis"

(declare-const patient_has_finding_of_anaphylaxis_inthehistory@@caused_by_prior_contrast_media Bool) ;; {"when_to_set_to_true":"Set to true if the patient's anaphylaxis was caused by prior contrast media.","when_to_set_to_false":"Set to false if the patient's anaphylaxis was not caused by prior contrast media.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's anaphylaxis was caused by prior contrast media.","meaning":"Boolean indicating whether the patient's anaphylaxis was caused by prior contrast media."} ;; "anaphylaxis to prior contrast media"

(declare-const patient_has_finding_of_blood_coagulation_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of blood coagulation disorder (including bleeding diathesis) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of blood coagulation disorder (including bleeding diathesis) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of blood coagulation disorder (including bleeding diathesis).","meaning":"Boolean indicating whether the patient has ever had a blood coagulation disorder (including bleeding diathesis) in their history."} ;; "bleeding diathesis"

(declare-const patient_has_finding_of_blood_coagulation_disorder_inthehistory@@known_coagulopathy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's coagulopathy is a known (confirmed) diagnosis.","when_to_set_to_false":"Set to false if the patient's coagulopathy is not a known (confirmed) diagnosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's coagulopathy is a known (confirmed) diagnosis.","meaning":"Boolean indicating whether the patient's coagulopathy is a known (confirmed) diagnosis."} ;; "known coagulopathy"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_anaphylaxis_inthehistory@@known_true_anaphylaxis
      patient_has_finding_of_anaphylaxis_inthehistory)
:named REQ9_AUXILIARY0)) ;; "known true anaphylaxis to prior contrast media"

(assert
(! (=> patient_has_finding_of_anaphylaxis_inthehistory@@caused_by_prior_contrast_media
      patient_has_finding_of_anaphylaxis_inthehistory)
:named REQ9_AUXILIARY1)) ;; "anaphylaxis caused by prior contrast media"

(assert
(! (=> patient_has_finding_of_blood_coagulation_disorder_inthehistory@@known_coagulopathy
      patient_has_finding_of_blood_coagulation_disorder_inthehistory)
:named REQ9_AUXILIARY2)) ;; "known coagulopathy"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_intolerance_to_aspirin_in_the_history)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has intolerance to aspirin."

(assert
(! (not patient_has_finding_of_intolerance_to_clopidogrel_in_the_history)
:named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has intolerance to clopidogrel."

(assert
(! (not patient_has_finding_of_intolerance_to_prasugrel_in_the_history)
:named REQ9_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has intolerance to prasugrel."

(assert
(! (not patient_has_finding_of_intolerance_to_ticagrelor_in_the_history)
:named REQ9_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has intolerance to ticagrelor."

(assert
(! (not patient_has_finding_of_intolerance_to_heparin_in_the_history)
:named REQ9_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has intolerance to heparin."

(assert
(! (not patient_has_finding_of_intolerance_to_bivalirudin_in_the_history)
:named REQ9_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has intolerance to bivalirudin."

(assert
(! (not patient_has_finding_of_intolerance_to_everolimus_in_the_history)
:named REQ9_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has intolerance to everolimus."

(assert
(! (not (and patient_has_finding_of_anaphylaxis_inthehistory@@known_true_anaphylaxis
             patient_has_finding_of_anaphylaxis_inthehistory@@caused_by_prior_contrast_media))
:named REQ9_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known true anaphylaxis to prior contrast media."

(assert
(! (not patient_has_finding_of_blood_coagulation_disorder_inthehistory)
:named REQ9_COMPONENT8_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has bleeding diathesis."

(assert
(! (not patient_has_finding_of_blood_coagulation_disorder_inthehistory@@known_coagulopathy)
:named REQ9_COMPONENT9_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known coagulopathy."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_gastrointestinal_hemorrhage_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a clinical finding of gastrointestinal hemorrhage within the past 3 months.","when_to_set_to_false":"Set to false if the patient has not had a clinical finding of gastrointestinal hemorrhage within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a clinical finding of gastrointestinal hemorrhage within the past 3 months.","meaning":"Boolean indicating whether the patient has had a gastrointestinal hemorrhage within the past 3 months."} ;; "gastrointestinal bleeding within the prior three months"
(declare-const patient_has_finding_of_genitourinary_tract_hemorrhage_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a clinical finding of genitourinary tract hemorrhage within the past 3 months.","when_to_set_to_false":"Set to false if the patient has not had a clinical finding of genitourinary tract hemorrhage within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a clinical finding of genitourinary tract hemorrhage within the past 3 months.","meaning":"Boolean indicating whether the patient has had a genitourinary tract hemorrhage within the past 3 months."} ;; "genitourinary bleeding within the prior three months"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_gastrointestinal_hemorrhage_inthepast3months)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had gastrointestinal bleeding within the prior three months."

(assert
(! (not patient_has_finding_of_genitourinary_tract_hemorrhage_inthepast3months)
:named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had genitourinary bleeding within the prior three months."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_will_undergo_optional_surgery_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to undergo an elective surgical procedure at any point in the future, regardless of timing or medication implications.","when_to_set_to_false":"Set to false if the patient is not scheduled to undergo any elective surgical procedure in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is scheduled for an elective surgical procedure in the future.","meaning":"Boolean indicating whether the patient is scheduled to undergo an elective surgical procedure in the future."} ;; "elective surgical procedure"

(declare-const patient_will_undergo_optional_surgery_inthefuture@@temporalcontext_within6months_post_enrolment Bool) ;; {"when_to_set_to_true":"Set to true if the scheduled elective surgical procedure is to occur within the first six months after enrolment.","when_to_set_to_false":"Set to false if the scheduled elective surgical procedure is not within the first six months after enrolment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the scheduled elective surgical procedure is within the first six months after enrolment.","meaning":"Boolean indicating whether the scheduled elective surgical procedure is within the first six months post enrolment."} ;; "within the first six months post enrolment"

(declare-const patient_will_undergo_optional_surgery_inthefuture@@necessitates_interruption_of_thienopyridine_administration Bool) ;; {"when_to_set_to_true":"Set to true if the scheduled elective surgical procedure necessitates interruption of thienopyridine administration.","when_to_set_to_false":"Set to false if the scheduled elective surgical procedure does not necessitate interruption of thienopyridine administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the scheduled elective surgical procedure necessitates interruption of thienopyridine administration.","meaning":"Boolean indicating whether the scheduled elective surgical procedure necessitates interruption of thienopyridine administration."} ;; "necessitating interruption of thienopyridine administration"

(declare-const patient_will_undergo_optional_surgery_inthefuture@@necessitates_interruption_of_thienopyridine_administration@@temporalcontext_within6months_post_enrolment Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to undergo an elective surgical procedure in the future, the procedure necessitates interruption of thienopyridine administration, and the procedure is scheduled to occur within the first six months after enrolment.","when_to_set_to_false":"Set to false if the patient is not scheduled for such a procedure, or if the procedure does not necessitate interruption of thienopyridine administration, or if the procedure is not within the first six months after enrolment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is scheduled for an elective surgical procedure in the future that both necessitates interruption of thienopyridine administration and is within the first six months after enrolment.","meaning":"Boolean indicating whether the patient is scheduled for an elective surgical procedure in the future that both necessitates interruption of thienopyridine administration and is within the first six months after enrolment."} ;; "planned elective surgical procedure necessitating interruption of thienopyridine administration during the first six months post enrolment"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Definitional: The fully qualified variable is true iff all three conditions are true
(assert
(! (= patient_will_undergo_optional_surgery_inthefuture@@necessitates_interruption_of_thienopyridine_administration@@temporalcontext_within6months_post_enrolment
     (and patient_will_undergo_optional_surgery_inthefuture
          patient_will_undergo_optional_surgery_inthefuture@@necessitates_interruption_of_thienopyridine_administration
          patient_will_undergo_optional_surgery_inthefuture@@temporalcontext_within6months_post_enrolment))
   :named REQ11_AUXILIARY0)) ;; "planned elective surgical procedure necessitating interruption of thienopyridine administration during the first six months post enrolment"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_will_undergo_optional_surgery_inthefuture@@necessitates_interruption_of_thienopyridine_administration@@temporalcontext_within6months_post_enrolment
      patient_will_undergo_optional_surgery_inthefuture)
   :named REQ11_AUXILIARY1)) ;; "elective surgical procedure"

(assert
(! (=> patient_will_undergo_optional_surgery_inthefuture@@necessitates_interruption_of_thienopyridine_administration@@temporalcontext_within6months_post_enrolment
      patient_will_undergo_optional_surgery_inthefuture@@necessitates_interruption_of_thienopyridine_administration)
   :named REQ11_AUXILIARY2)) ;; "necessitating interruption of thienopyridine administration"

(assert
(! (=> patient_will_undergo_optional_surgery_inthefuture@@necessitates_interruption_of_thienopyridine_administration@@temporalcontext_within6months_post_enrolment
      patient_will_undergo_optional_surgery_inthefuture@@temporalcontext_within6months_post_enrolment)
   :named REQ11_AUXILIARY3)) ;; "within the first six months post enrolment"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_will_undergo_optional_surgery_inthefuture@@necessitates_interruption_of_thienopyridine_administration@@temporalcontext_within6months_post_enrolment)
   :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a planned elective surgical procedure necessitating interruption of thienopyridine administration during the first six months post enrolment."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not exposed to a drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to a drug or medicament.","meaning":"Boolean indicating whether the patient is currently exposed to a drug or medicament."} ;; "the patient is actively participating in another drug investigational study"

(declare-const patient_is_exposed_to_drug_or_medicament_now@@as_part_of_another_investigational_study_with_incomplete_primary_endpoint_followup Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a drug or medicament as part of another investigational study which has not completed the primary endpoint follow-up period.","when_to_set_to_false":"Set to false if the patient is currently exposed to a drug or medicament but not as part of another investigational study with incomplete primary endpoint follow-up, or not exposed at all.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is as part of another investigational study with incomplete primary endpoint follow-up.","meaning":"Boolean indicating whether the patient's current exposure to a drug or medicament is as part of another investigational study which has not completed the primary endpoint follow-up period."} ;; "the patient is actively participating in another drug investigational study which has not completed the primary endpoint follow-up period"

(declare-const patient_is_actively_participating_in_device_investigational_study_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently actively participating in another device investigational study.","when_to_set_to_false":"Set to false if the patient is currently not actively participating in another device investigational study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently actively participating in another device investigational study.","meaning":"Boolean indicating whether the patient is currently actively participating in another device investigational study."} ;; "the patient is actively participating in another device investigational study"

(declare-const patient_is_actively_participating_in_device_investigational_study_now@@with_incomplete_primary_endpoint_followup Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently actively participating in another device investigational study which has not completed the primary endpoint follow-up period.","when_to_set_to_false":"Set to false if the patient is currently actively participating in another device investigational study which has completed the primary endpoint follow-up period, or not participating at all.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the device investigational study has completed the primary endpoint follow-up period.","meaning":"Boolean indicating whether the patient's current active participation in another device investigational study is in a study which has not completed the primary endpoint follow-up period."} ;; "the patient is actively participating in another device investigational study which has not completed the primary endpoint follow-up period"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variable implies corresponding stem variable (drug)
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@as_part_of_another_investigational_study_with_incomplete_primary_endpoint_followup
      patient_is_exposed_to_drug_or_medicament_now)
:named REQ12_AUXILIARY0)) ;; "the patient is actively participating in another drug investigational study which has not completed the primary endpoint follow-up period"

;; Qualifier variable implies corresponding stem variable (device)
(assert
(! (=> patient_is_actively_participating_in_device_investigational_study_now@@with_incomplete_primary_endpoint_followup
      patient_is_actively_participating_in_device_investigational_study_now)
:named REQ12_AUXILIARY1)) ;; "the patient is actively participating in another device investigational study which has not completed the primary endpoint follow-up period"

;; ===================== Constraint Assertions (REQ 12) =====================
;; Exclusion: patient must NOT be actively participating in another drug investigational study with incomplete primary endpoint follow-up
(assert
(! (not patient_is_exposed_to_drug_or_medicament_now@@as_part_of_another_investigational_study_with_incomplete_primary_endpoint_followup)
:named REQ12_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is actively participating in another drug investigational study which has not completed the primary endpoint follow-up period"

;; Exclusion: patient must NOT be actively participating in another device investigational study with incomplete primary endpoint follow-up
(assert
(! (not patient_is_actively_participating_in_device_investigational_study_now@@with_incomplete_primary_endpoint_followup)
:named REQ12_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is actively participating in another device investigational study which has not completed the primary endpoint follow-up period"

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_is_pregnant_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is pregnant at any time after enrolment into the study.","when_to_set_to_false":"Set to false if the patient is not pregnant at any time after enrolment into the study.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient is pregnant at any time after enrolment into the study.","meaning":"Boolean value indicating whether the patient is pregnant at any time after enrolment into the study."} ;; "the patient is pregnant at any time after enrolment into this study"
(declare-const patient_is_planning_to_become_pregnant_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is planning to become pregnant at any time after enrolment into the study.","when_to_set_to_false":"Set to false if the patient is not planning to become pregnant at any time after enrolment into the study.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient is planning to become pregnant at any time after enrolment into the study.","meaning":"Boolean value indicating whether the patient is planning to become pregnant at any time after enrolment into the study."} ;; "the patient is planning to become pregnant at any time after enrolment into this study"
(declare-const patient_is_able_to_be_pregnant_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is planning or able to become pregnant at any time after enrolment into the study.","when_to_set_to_false":"Set to false if the patient is not planning or not able to become pregnant at any time after enrolment into the study.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient is planning or able to become pregnant at any time after enrolment into the study.","meaning":"Boolean value indicating whether the patient is able to become pregnant at any time after enrolment into the study."} ;; "the patient is planning to become pregnant at any time after enrolment into this study"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_is_pregnant_inthefuture)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant at any time after enrolment into this study."

(assert
(! (not patient_is_planning_to_become_pregnant_inthefuture)
:named REQ13_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is planning to become pregnant at any time after enrolment into this study."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_is_able_to_provide_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to provide informed consent.","when_to_set_to_false":"Set to false if the patient is currently unable to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to provide informed consent.","meaning":"Boolean indicating whether the patient is currently able to provide informed consent."} ;; "The patient is excluded if the patient is unable to provide informed consent."

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_is_able_to_provide_informed_consent_now)
:named REQ14_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to provide informed consent."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_is_expected_to_be_lost_to_follow_up Bool) ;; {"when_to_set_to_true":"Set to true if it is expected that the patient will be lost to follow-up.","when_to_set_to_false":"Set to false if it is expected that the patient will not be lost to follow-up.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is expected to be lost to follow-up.","meaning":"Boolean indicating whether the patient is expected to be lost to follow-up."} ;; "The patient is excluded if the patient is expected to be lost to follow-up."

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_is_expected_to_be_lost_to_follow_up)
    :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is expected to be lost to follow-up."
