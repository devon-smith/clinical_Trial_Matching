;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "age ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (age ≥ 18 years)."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_is_undergoing_single_vessel_percutaneous_coronary_intervention_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a single-vessel percutaneous coronary intervention.","when_to_set_to_false":"Set to false if the patient is not currently undergoing a single-vessel percutaneous coronary intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing a single-vessel percutaneous coronary intervention.","meaning":"Boolean indicating whether the patient is currently undergoing a single-vessel percutaneous coronary intervention."} ;; "single-vessel percutaneous coronary intervention"
(declare-const patient_is_undergoing_multi_vessel_percutaneous_coronary_intervention_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a multi-vessel percutaneous coronary intervention.","when_to_set_to_false":"Set to false if the patient is not currently undergoing a multi-vessel percutaneous coronary intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing a multi-vessel percutaneous coronary intervention.","meaning":"Boolean indicating whether the patient is currently undergoing a multi-vessel percutaneous coronary intervention."} ;; "multi-vessel percutaneous coronary intervention"
(declare-const patient_has_de_novo_target_lesion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a de novo target lesion.","when_to_set_to_false":"Set to false if the patient currently does not have a de novo target lesion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a de novo target lesion.","meaning":"Boolean indicating whether the patient currently has a de novo target lesion."} ;; "de novo target lesion"
(declare-const patient_has_restenotic_target_lesion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a restenotic target lesion.","when_to_set_to_false":"Set to false if the patient currently does not have a restenotic target lesion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a restenotic target lesion.","meaning":"Boolean indicating whether the patient currently has a restenotic target lesion."} ;; "restenotic target lesion"
(declare-const patient_has_restenotic_target_lesion_now@@is_in_stent_restenotic_target_lesion Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current restenotic target lesion is specifically an in-stent restenotic target lesion.","when_to_set_to_false":"Set to false if the patient's current restenotic target lesion is not an in-stent restenotic target lesion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current restenotic target lesion is an in-stent restenotic target lesion.","meaning":"Boolean indicating whether the patient's current restenotic target lesion is an in-stent restenotic target lesion."} ;; "in-stent restenotic target lesion (non-exhaustive example)"
(declare-const patient_creatinine_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's creatinine concentration is recorded now in milligrams per deciliter.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's creatinine concentration measured now in milligrams per deciliter."} ;; "creatinine concentration > 1.5 milligrams per deciliter"
(declare-const patient_creatinine_value_recorded_now_withunit_milligrams_per_deciliter@@measured_in_pre_catheterization_procedure_qualifying_clinical_laboratory_values Bool) ;; {"when_to_set_to_true":"Set to true if the creatinine measurement is part of the pre-catheterization procedure qualifying clinical laboratory values.","when_to_set_to_false":"Set to false if the creatinine measurement is not part of the pre-catheterization procedure qualifying clinical laboratory values.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the creatinine measurement is part of the pre-catheterization procedure qualifying clinical laboratory values.","meaning":"Boolean indicating whether the creatinine measurement is part of the pre-catheterization procedure qualifying clinical laboratory values."} ;; "creatinine measured in pre-catheterization procedure qualifying clinical laboratory values"
(declare-const patient_glomerular_filtration_rate_value_recorded_now_withunit_milliliters_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's glomerular filtration rate is recorded now in milliliters per minute.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's glomerular filtration rate (GFR) measured now in milliliters per minute."} ;; "estimated glomerular filtration rate < 60 milliliters per minute"
(declare-const patient_glomerular_filtration_rate_value_recorded_now_withunit_milliliters_per_minute@@measured_in_pre_catheterization_procedure_qualifying_clinical_laboratory_values Bool) ;; {"when_to_set_to_true":"Set to true if the GFR measurement is part of the pre-catheterization procedure qualifying clinical laboratory values.","when_to_set_to_false":"Set to false if the GFR measurement is not part of the pre-catheterization procedure qualifying clinical laboratory values.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the GFR measurement is part of the pre-catheterization procedure qualifying clinical laboratory values.","meaning":"Boolean indicating whether the GFR measurement is part of the pre-catheterization procedure qualifying clinical laboratory values."} ;; "GFR measured in pre-catheterization procedure qualifying clinical laboratory values"
(declare-const patient_has_repeat_revascularization_endpoint_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently meets the endpoint component of repeat revascularization.","when_to_set_to_false":"Set to false if the patient currently does not meet the endpoint component of repeat revascularization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently meets the endpoint component of repeat revascularization.","meaning":"Boolean indicating whether the patient currently meets the endpoint component of repeat revascularization."} ;; "repeat revascularization endpoint"
(declare-const patient_has_repeat_revascularization_endpoint_now@@not_met_by_staged_procedure_if_pre_catheterization_gfr_or_creatinine_thresholds Bool) ;; {"when_to_set_to_true":"Set to true if the endpoint component of repeat revascularization is not met by staged procedure when pre-catheterization GFR is less than 60 milliliters per minute or creatinine is greater than 1.5 milligrams per deciliter.","when_to_set_to_false":"Set to false if the endpoint component of repeat revascularization is met by staged procedure regardless of pre-catheterization GFR or creatinine thresholds.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the endpoint component of repeat revascularization is not met by staged procedure under these laboratory value constraints.","meaning":"Boolean indicating whether the endpoint component of repeat revascularization is not met by staged procedure if pre-catheterization GFR or creatinine thresholds are present."} ;; "staged procedure will NOT be considered to meet the endpoint component of repeat revascularization IF ((estimated glomerular filtration rate < 60 milliliters per minute) OR (creatinine concentration > 1.5 milligrams per deciliter)) in pre-catheterization procedure qualifying clinical laboratory values."

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive example: in-stent restenotic target lesion implies restenotic target lesion
(assert
  (! (=> patient_has_restenotic_target_lesion_now@@is_in_stent_restenotic_target_lesion
         patient_has_restenotic_target_lesion_now)
     :named REQ1_AUXILIARY0)) ;; "in-stent restenotic target lesion is a non-exhaustive example of restenotic target lesion"

;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_creatinine_value_recorded_now_withunit_milligrams_per_deciliter@@measured_in_pre_catheterization_procedure_qualifying_clinical_laboratory_values
         true)
     :named REQ1_AUXILIARY1)) ;; "creatinine measured in pre-catheterization procedure qualifying clinical laboratory values"

(assert
  (! (=> patient_glomerular_filtration_rate_value_recorded_now_withunit_milliliters_per_minute@@measured_in_pre_catheterization_procedure_qualifying_clinical_laboratory_values
         true)
     :named REQ1_AUXILIARY2)) ;; "GFR measured in pre-catheterization procedure qualifying clinical laboratory values"

;; Qualifier variable for repeat revascularization endpoint
(assert
  (! (=> patient_has_repeat_revascularization_endpoint_now@@not_met_by_staged_procedure_if_pre_catheterization_gfr_or_creatinine_thresholds
         patient_has_repeat_revascularization_endpoint_now)
     :named REQ1_AUXILIARY3)) ;; "repeat revascularization endpoint not met by staged procedure if GFR/creatinine thresholds"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Patient must require (single-vessel PCI OR multi-vessel PCI) of (de novo target lesion OR restenotic target lesion)
(assert
  (! (or
        (and patient_is_undergoing_single_vessel_percutaneous_coronary_intervention_now
             (or patient_has_de_novo_target_lesion_now
                 patient_has_restenotic_target_lesion_now))
        (and patient_is_undergoing_multi_vessel_percutaneous_coronary_intervention_now
             (or patient_has_de_novo_target_lesion_now
                 patient_has_restenotic_target_lesion_now)))
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "require (single-vessel PCI) OR (multi-vessel PCI) of (de novo target lesion) OR (restenotic target lesion)"

;; Component 1: Staged procedure will NOT be considered to meet the endpoint component of repeat revascularization IF ((GFR < 60 ml/min) OR (creatinine > 1.5 mg/dl)) in pre-catheterization procedure qualifying clinical laboratory values.
(assert
  (! (not
        (and
          patient_has_repeat_revascularization_endpoint_now@@not_met_by_staged_procedure_if_pre_catheterization_gfr_or_creatinine_thresholds
          (or
            (and patient_glomerular_filtration_rate_value_recorded_now_withunit_milliliters_per_minute@@measured_in_pre_catheterization_procedure_qualifying_clinical_laboratory_values
                 (< patient_glomerular_filtration_rate_value_recorded_now_withunit_milliliters_per_minute 60.0))
            (and patient_creatinine_value_recorded_now_withunit_milligrams_per_deciliter@@measured_in_pre_catheterization_procedure_qualifying_clinical_laboratory_values
                 (> patient_creatinine_value_recorded_now_withunit_milligrams_per_deciliter 1.5)))))
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "staged procedure will NOT be considered to meet the endpoint component of repeat revascularization IF ((GFR < 60) OR (creatinine > 1.5)) in pre-catheterization procedure qualifying clinical laboratory values"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_lesion_amenable_to_stent_treatment_with_fda_approved_bare_metal_stent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a lesion that is amenable to stent treatment with a currently available FDA-approved bare metal stent.","when_to_set_to_false":"Set to false if the patient currently does not have a lesion amenable to stent treatment with a currently available FDA-approved bare metal stent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a lesion amenable to stent treatment with a currently available FDA-approved bare metal stent.","meaning":"Boolean indicating whether the patient currently has a lesion amenable to stent treatment with a currently available FDA-approved bare metal stent."} ;; "lesion amenable to stent treatment with currently available United States Food and Drug Administration-approved bare metal stent"
(declare-const patient_has_lesion_amenable_to_stent_treatment_with_fda_approved_drug_eluting_stent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a lesion that is amenable to stent treatment with a currently available FDA-approved drug eluting stent.","when_to_set_to_false":"Set to false if the patient currently does not have a lesion amenable to stent treatment with a currently available FDA-approved drug eluting stent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a lesion amenable to stent treatment with a currently available FDA-approved drug eluting stent.","meaning":"Boolean indicating whether the patient currently has a lesion amenable to stent treatment with a currently available FDA-approved drug eluting stent."} ;; "lesion amenable to stent treatment with currently available United States Food and Drug Administration-approved drug eluting stent"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: The patient must have (lesion amenable to stent treatment with currently available United States Food and Drug Administration-approved bare metal stent) OR (lesion amenable to stent treatment with currently available United States Food and Drug Administration-approved drug eluting stent).
(assert
  (! (or patient_has_lesion_amenable_to_stent_treatment_with_fda_approved_bare_metal_stent_now
         patient_has_lesion_amenable_to_stent_treatment_with_fda_approved_drug_eluting_stent_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (lesion amenable to stent treatment with currently available United States Food and Drug Administration-approved bare metal stent) OR (lesion amenable to stent treatment with currently available United States Food and Drug Administration-approved drug eluting stent)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_can_undergo_coronary_artery_bypass_graft_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently an acceptable candidate for non-emergency coronary artery bypass grafting.","when_to_set_to_false":"Set to false if the patient is currently not an acceptable candidate for non-emergency coronary artery bypass grafting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an acceptable candidate for non-emergency coronary artery bypass grafting.","meaning":"Boolean indicating whether the patient can currently undergo coronary artery bypass grafting (non-emergency context)."} ;; "an acceptable candidate for non-emergency coronary artery bypass grafting"
(declare-const patient_can_undergo_urgent_coronary_artery_bypass_graft_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently an acceptable candidate for urgent coronary artery bypass grafting.","when_to_set_to_false":"Set to false if the patient is currently not an acceptable candidate for urgent coronary artery bypass grafting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an acceptable candidate for urgent coronary artery bypass grafting.","meaning":"Boolean indicating whether the patient is currently an acceptable candidate for urgent coronary artery bypass grafting."} ;; "an acceptable candidate for urgent coronary artery bypass grafting"
(declare-const patient_can_undergo_emergency_cabg_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently an acceptable candidate for emergency coronary artery bypass grafting.","when_to_set_to_false":"Set to false if the patient is currently not an acceptable candidate for emergency coronary artery bypass grafting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an acceptable candidate for emergency coronary artery bypass grafting.","meaning":"Boolean indicating whether the patient can currently undergo emergency coronary artery bypass grafting."} ;; "an acceptable candidate for emergency coronary artery bypass grafting"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: To be included, the patient must be (an acceptable candidate for non-emergency coronary artery bypass grafting) OR (an acceptable candidate for urgent coronary artery bypass grafting) OR (an acceptable candidate for emergency coronary artery bypass grafting).
(assert
  (! (or patient_can_undergo_coronary_artery_bypass_graft_now
         patient_can_undergo_urgent_coronary_artery_bypass_graft_now
         patient_can_undergo_emergency_cabg_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_ischemic_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical evidence of ischemic heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have clinical evidence of ischemic heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical evidence of ischemic heart disease.","meaning":"Boolean indicating whether the patient currently has clinical evidence of ischemic heart disease."} ;; "clinical evidence of ischemic heart disease"
(declare-const patient_has_finding_of_ischemic_heart_disease_now@@evidenced_by_positive_functional_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's clinical evidence of ischemic heart disease is specifically evidenced by a positive functional study.","when_to_set_to_false":"Set to false if the patient's clinical evidence of ischemic heart disease is not evidenced by a positive functional study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the evidence is a positive functional study.","meaning":"Boolean indicating whether the clinical evidence of ischemic heart disease is specifically evidenced by a positive functional study."} ;; "clinical evidence of ischemic heart disease in terms of positive functional study"
(declare-const patient_has_finding_of_ischemic_heart_disease_now@@evidenced_by_documented_symptoms Bool) ;; {"when_to_set_to_true":"Set to true if the patient's clinical evidence of ischemic heart disease is specifically evidenced by documented symptoms.","when_to_set_to_false":"Set to false if the patient's clinical evidence of ischemic heart disease is not evidenced by documented symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the evidence is documented symptoms.","meaning":"Boolean indicating whether the clinical evidence of ischemic heart disease is specifically evidenced by documented symptoms."} ;; "clinical evidence of ischemic heart disease in terms of documented symptoms"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply the stem variable
(assert
  (! (=> patient_has_finding_of_ischemic_heart_disease_now@@evidenced_by_positive_functional_study
         patient_has_finding_of_ischemic_heart_disease_now)
     :named REQ4_AUXILIARY0)) ;; "clinical evidence of ischemic heart disease in terms of positive functional study"

(assert
  (! (=> patient_has_finding_of_ischemic_heart_disease_now@@evidenced_by_documented_symptoms
         patient_has_finding_of_ischemic_heart_disease_now)
     :named REQ4_AUXILIARY1)) ;; "clinical evidence of ischemic heart disease in terms of documented symptoms"

;; ===================== Constraint Assertions (REQ 4) =====================
;; The patient must have (clinical evidence of ischemic heart disease in terms of positive functional study) OR (clinical evidence of ischemic heart disease in terms of documented symptoms)
(assert
  (! (or patient_has_finding_of_ischemic_heart_disease_now@@evidenced_by_positive_functional_study
         patient_has_finding_of_ischemic_heart_disease_now@@evidenced_by_documented_symptoms)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (clinical evidence of ischemic heart disease in terms of positive functional study) OR (clinical evidence of ischemic heart disease in terms of documented symptoms)."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_stable_angina_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has stable angina pectoris.","when_to_set_to_false":"Set to false if the patient currently does not have stable angina pectoris.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has stable angina pectoris.","meaning":"Boolean indicating whether the patient currently has stable angina pectoris."} ;; "documented stable angina pectoris"
(declare-const patient_has_finding_of_stable_angina_now@@ccs_class_1_or_2_or_3_or_4 Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current stable angina pectoris is classified as Canadian Cardiovascular Society Classification 1, 2, 3, or 4.","when_to_set_to_false":"Set to false if the patient's current stable angina pectoris is not classified as Canadian Cardiovascular Society Classification 1, 2, 3, or 4.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current stable angina pectoris is classified as Canadian Cardiovascular Society Classification 1, 2, 3, or 4.","meaning":"Boolean indicating whether the patient's current stable angina pectoris is classified as Canadian Cardiovascular Society Classification 1, 2, 3, or 4."} ;; "Canadian Cardiovascular Society Classification 1 OR 2 OR 3 OR 4"
(declare-const patient_has_finding_of_unstable_angina_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has unstable angina pectoris.","when_to_set_to_false":"Set to false if the patient currently does not have unstable angina pectoris.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has unstable angina pectoris.","meaning":"Boolean indicating whether the patient currently has unstable angina pectoris."} ;; "documented unstable angina pectoris"
(declare-const patient_has_finding_of_unstable_angina_now@@with_ischemia Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current unstable angina pectoris is accompanied by ischemia.","when_to_set_to_false":"Set to false if the patient's current unstable angina pectoris is not accompanied by ischemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current unstable angina pectoris is accompanied by ischemia.","meaning":"Boolean indicating whether the patient's current unstable angina pectoris is accompanied by ischemia."} ;; "unstable angina pectoris with ischemia"
(declare-const patient_has_finding_of_unstable_angina_now@@braunwald_class_ib_c_or_iib_c_or_iiib_c Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current unstable angina pectoris with ischemia is classified as Braunwald Class IB-C, IIB-C, or IIIB-C.","when_to_set_to_false":"Set to false if the patient's current unstable angina pectoris with ischemia is not classified as Braunwald Class IB-C, IIB-C, or IIIB-C.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current unstable angina pectoris with ischemia is classified as Braunwald Class IB-C, IIB-C, or IIIB-C.","meaning":"Boolean indicating whether the patient's current unstable angina pectoris with ischemia is classified as Braunwald Class IB-C, IIB-C, or IIIB-C."} ;; "Braunwald Class IB-C OR IIB-C OR IIIB-C"
(declare-const patient_has_finding_of_acute_non_st_segment_elevation_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has non-ST segment elevation myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have non-ST segment elevation myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has non-ST segment elevation myocardial infarction.","meaning":"Boolean indicating whether the patient currently has non-ST segment elevation myocardial infarction."} ;; "documented non-ST segment elevation myocardial infarction"
(declare-const patient_has_finding_of_silent_ischemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has silent ischemia.","when_to_set_to_false":"Set to false if the patient currently does not have silent ischemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has silent ischemia.","meaning":"Boolean indicating whether the patient currently has silent ischemia."} ;; "documented silent ischemia"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable for CCS class implies stable angina
(assert
  (! (=> patient_has_finding_of_stable_angina_now@@ccs_class_1_or_2_or_3_or_4
         patient_has_finding_of_stable_angina_now)
     :named REQ5_AUXILIARY0)) ;; "Canadian Cardiovascular Society Classification 1 OR 2 OR 3 OR 4" implies stable angina

;; Qualifier variable for unstable angina with ischemia
(assert
  (! (=> patient_has_finding_of_unstable_angina_now@@with_ischemia
         patient_has_finding_of_unstable_angina_now)
     :named REQ5_AUXILIARY1)) ;; "unstable angina pectoris with ischemia" implies unstable angina

;; Qualifier variable for Braunwald class implies unstable angina with ischemia
(assert
  (! (=> patient_has_finding_of_unstable_angina_now@@braunwald_class_ib_c_or_iib_c_or_iiib_c
         patient_has_finding_of_unstable_angina_now@@with_ischemia)
     :named REQ5_AUXILIARY2)) ;; "Braunwald Class IB-C OR IIB-C OR IIIB-C" implies unstable angina with ischemia

;; ===================== Constraint Assertions (REQ 5) =====================
;; Inclusion: patient must have one of the following:
;; (documented stable angina pectoris (CCS 1/2/3/4)) OR (documented unstable angina pectoris with ischemia (Braunwald IB-C/IIB-C/IIIB-C)) OR (documented non-ST segment elevation MI) OR (documented silent ischemia)
(assert
  (! (or patient_has_finding_of_stable_angina_now@@ccs_class_1_or_2_or_3_or_4
         patient_has_finding_of_unstable_angina_now@@braunwald_class_ib_c_or_iib_c_or_iiib_c
         patient_has_finding_of_acute_non_st_segment_elevation_myocardial_infarction_now
         patient_has_finding_of_silent_ischemia_now)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (documented stable angina pectoris (Canadian Cardiovascular Society Classification 1 OR 2 OR 3 OR 4)) OR (documented unstable angina pectoris with ischemia (Braunwald Class IB-C OR IIB-C OR IIIB-C)) OR (documented non-ST segment elevation myocardial infarction) OR (documented silent ischemia)."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_agrees_to_comply_with_all_follow_up_evaluations Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to comply with all follow-up evaluations.","when_to_set_to_false":"Set to false if the patient does not agree to comply with all follow-up evaluations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to comply with all follow-up evaluations.","meaning":"Boolean indicating whether the patient agrees to comply with all follow-up evaluations."} ;; "the patient ... must agree that the patient will comply with all follow-up evaluations."
(declare-const treating_physician_agrees_patient_will_comply_with_all_follow_up_evaluations Bool) ;; {"when_to_set_to_true":"Set to true if the treating physician agrees that the patient will comply with all follow-up evaluations.","when_to_set_to_false":"Set to false if the treating physician does not agree that the patient will comply with all follow-up evaluations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the treating physician agrees that the patient will comply with all follow-up evaluations.","meaning":"Boolean indicating whether the treating physician agrees that the patient will comply with all follow-up evaluations."} ;; "the treating physician ... must agree that the patient will comply with all follow-up evaluations."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (and patient_agrees_to_comply_with_all_follow_up_evaluations
          treating_physician_agrees_patient_will_comply_with_all_follow_up_evaluations)
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient and the treating physician must agree that the patient will comply with all follow-up evaluations."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_been_informed_of_nature_and_purpose_of_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been informed of the nature and purpose of the study.","when_to_set_to_false":"Set to false if the patient has not been informed of the nature and purpose of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been informed of the nature and purpose of the study.","meaning":"Boolean indicating whether the patient has been informed of the nature and purpose of the study."} ;; "been informed of the nature and purpose of the study"
(declare-const patient_agrees_to_study_provisions Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to the provisions of the study.","when_to_set_to_false":"Set to false if the patient does not agree to the provisions of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to the provisions of the study.","meaning":"Boolean indicating whether the patient agrees to the provisions of the study."} ;; "agree to its provisions"
(declare-const patient_has_provided_written_informed_consent_approved_by_irb_or_ethics_committee_of_clinical_site Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent as approved by the Institutional Review Board or Ethics Committee of the respective clinical site.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent as approved by the Institutional Review Board or Ethics Committee of the respective clinical site.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent as approved by the Institutional Review Board or Ethics Committee of the respective clinical site.","meaning":"Boolean indicating whether the patient has provided written informed consent as approved by the Institutional Review Board or Ethics Committee of the respective clinical site."} ;; "provided written informed consent as approved by the Institutional Review Board OR Ethics Committee of the respective clinical site"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: Patient must have been informed of the nature and purpose of the study
(assert
  (! patient_has_been_informed_of_nature_and_purpose_of_study
     :named REQ7_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "been informed of the nature and purpose of the study"

;; Component 1: Patient must agree to the study provisions
(assert
  (! patient_agrees_to_study_provisions
     :named REQ7_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "agree to its provisions"

;; Component 2: Patient must have provided written informed consent as approved by IRB or Ethics Committee
(assert
  (! patient_has_provided_written_informed_consent_approved_by_irb_or_ethics_committee_of_clinical_site
     :named REQ7_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "provided written informed consent as approved by the Institutional Review Board OR Ethics Committee of the respective clinical site"

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_has_finding_of_acute_occlusion_of_artery_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute total occlusion of an artery.","when_to_set_to_false":"Set to false if the patient currently does not have an acute total occlusion of an artery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acute total occlusion of an artery.","meaning":"Boolean indicating whether the patient currently has an acute total occlusion of an artery."} ;; "the target lesion is acute total occlusion"
(declare-const patient_has_finding_of_acute_occlusion_of_artery_now@@duration_less_than_1_month Bool) ;; {"when_to_set_to_true":"Set to true if the patient's acute total occlusion of an artery has a duration less than 1 month.","when_to_set_to_false":"Set to false if the patient's acute total occlusion of an artery has a duration of 1 month or more.","when_to_set_to_null":"Set to null if the duration of the acute total occlusion is unknown, not documented, or indeterminate.","meaning":"Boolean indicating whether the patient's acute total occlusion of an artery has a duration less than 1 month."} ;; "duration < 1 month"
(declare-const patient_stricture_of_artery_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the visually estimated percentage value if a numeric measurement of stenosis in the target lesion is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current visually estimated degree of stenosis (stricture of artery) in the target lesion."} ;; "stenosis (visual estimate) ≥ 50 percent AND stenosis (visual estimate) < 100 percent"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_acute_occlusion_of_artery_now@@duration_less_than_1_month
         patient_has_finding_of_acute_occlusion_of_artery_now)
     :named REQ8_AUXILIARY0)) ;; "acute total occlusion (duration < 1 month)"

;; Non-exhaustive example: in-stent restenotic native coronary artery lesion implies restenotic native coronary artery lesion
(assert
  (! (=> patient_has_restenotic_target_lesion_now@@is_in_stent_restenotic_target_lesion
         patient_has_restenotic_target_lesion_now)
     :named REQ8_AUXILIARY1)) ;; "in-stent restenotic native coronary artery lesion (non-exhaustive example)"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Inclusion: patient must meet one of the following angiographic criteria:
;; (1) (de novo native coronary artery lesion OR restenotic native coronary artery lesion) AND (stenosis ≥ 50% AND < 100%)
;; (2) acute total occlusion (duration < 1 month) as evidenced by clinical symptoms

(assert
  (! (or
        (and
          (or patient_has_de_novo_target_lesion_now
              patient_has_restenotic_target_lesion_now)
          (>= patient_stricture_of_artery_value_recorded_now_withunit_percent 50.0)
          (< patient_stricture_of_artery_value_recorded_now_withunit_percent 100.0))
        (and patient_has_finding_of_acute_occlusion_of_artery_now
             patient_has_finding_of_acute_occlusion_of_artery_now@@duration_less_than_1_month))
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "angiographic inclusion criteria: (de novo OR restenotic native coronary artery lesion with 50% ≤ stenosis < 100%) OR acute total occlusion (duration < 1 month)"

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_fractional_flow_reserve_value_recorded_now_withunit_ratio Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's fractional flow reserve is measured now and the value is available (unitless ratio).","when_to_set_to_null":"Set to null if fractional flow reserve is not measured now or the value is unavailable/indeterminate.","meaning":"Numeric value representing the patient's fractional flow reserve measured now (unitless ratio)."} ;; "fractional flow reserve"
(declare-const target_lesion_has_finding_of_hemodynamically_significant_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the target lesion currently has hemodynamically significant stenosis.","when_to_set_to_false":"Set to false if the target lesion currently does not have hemodynamically significant stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the target lesion currently has hemodynamically significant stenosis.","meaning":"Boolean indicating whether the target lesion currently has hemodynamically significant stenosis."} ;; "target lesion has evidence of hemodynamically significant stenosis"
(declare-const target_lesion_has_finding_of_hemodynamically_significant_stenosis_now@@determined_by_fractional_flow_reserve_measurement Bool) ;; {"when_to_set_to_true":"Set to true if the determination of hemodynamically significant stenosis in the target lesion is made by fractional flow reserve measurement.","when_to_set_to_false":"Set to false if the determination of hemodynamically significant stenosis in the target lesion is not made by fractional flow reserve measurement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the determination of hemodynamically significant stenosis in the target lesion is made by fractional flow reserve measurement.","meaning":"Boolean indicating whether the determination of hemodynamically significant stenosis in the target lesion is made by fractional flow reserve measurement."} ;; "hemodynamically significant stenosis determined by fractional flow reserve measurement"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> target_lesion_has_finding_of_hemodynamically_significant_stenosis_now@@determined_by_fractional_flow_reserve_measurement
         target_lesion_has_finding_of_hemodynamically_significant_stenosis_now)
     :named REQ9_AUXILIARY0)) ;; "determined by fractional flow reserve measurement" implies "hemodynamically significant stenosis"

;; Definition: If FFR is measured, then the qualifier variable is true iff FFR <= 0.8
(assert
  (! (= target_lesion_has_finding_of_hemodynamically_significant_stenosis_now@@determined_by_fractional_flow_reserve_measurement
        (<= patient_fractional_flow_reserve_value_recorded_now_withunit_ratio 0.8))
     :named REQ9_AUXILIARY1)) ;; "fractional flow reserve ≤ 0.8" defines hemodynamically significant stenosis by FFR

;; ===================== Constraint Assertions (REQ 9) =====================
;; If FFR is measured, then the target lesion must have hemodynamically significant stenosis by FFR (i.e., FFR ≤ 0.8)
(assert
  (! (or (not (exists ((ffr Real)) (= ffr patient_fractional_flow_reserve_value_recorded_now_withunit_ratio)))
         (<= patient_fractional_flow_reserve_value_recorded_now_withunit_ratio 0.8))
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "IF fractional flow reserve is measured, (target lesion has evidence of hemodynamically significant stenosis determined by fractional flow reserve measurement (fractional flow reserve ≤ 0.8))"

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone percutaneous coronary intervention at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone percutaneous coronary intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone percutaneous coronary intervention.","meaning":"Boolean indicating whether the patient has undergone percutaneous coronary intervention at any time in the past."} ;; "percutaneous coronary intervention"
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@is_primary_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the percutaneous coronary intervention was performed as a primary treatment.","when_to_set_to_false":"Set to false if the percutaneous coronary intervention was not performed as a primary treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the percutaneous coronary intervention was performed as a primary treatment.","meaning":"Boolean indicating whether the percutaneous coronary intervention was performed as a primary treatment."} ;; "percutaneous coronary intervention as primary treatment"
(declare-const patient_infarct_related_artery_is_treated_with_primary_percutaneous_coronary_intervention_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's infarct-related artery is currently treated with primary percutaneous coronary intervention.","when_to_set_to_false":"Set to false if the patient's infarct-related artery is not currently treated with primary percutaneous coronary intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's infarct-related artery is currently treated with primary percutaneous coronary intervention.","meaning":"Boolean indicating whether the patient's infarct-related artery is currently treated with primary percutaneous coronary intervention."} ;; "the infarct-related artery is not treated with primary percutaneous coronary intervention"
(declare-const patient_myocardial_infarction_value_recorded_now_withunit_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours elapsed since the patient experienced ST-segment elevation myocardial infarction, as of now.","when_to_set_to_null":"Set to null if the time since ST-segment elevation myocardial infarction is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the time elapsed since ST-segment elevation myocardial infarction, measured in hours, as of now."} ;; "the time since ST-segment elevation myocardial infarction is greater than 72 hours"
(declare-const patient_non_infarct_related_artery_has_stenosis_proportion_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the percent value of stenosis proportion in the patient's non-infarct-related artery, as visually estimated and recorded now.","when_to_set_to_null":"Set to null if the stenosis proportion in the patient's non-infarct-related artery is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the proportion of stenosis in the patient's non-infarct-related artery, measured in percent, as visually estimated and recorded now."} ;; "the non-infarct-related artery has stenosis proportion ≥ 70 percent (by visual estimate)"
(declare-const patient_target_lesion_is_located_in_infarct_related_artery_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's target lesion is currently located in the infarct-related artery.","when_to_set_to_false":"Set to false if the patient's target lesion is not currently located in the infarct-related artery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's target lesion is currently located in the infarct-related artery.","meaning":"Boolean indicating whether the patient's target lesion is currently located in the infarct-related artery."} ;; "the target lesion is located in the infarct-related artery"
(declare-const patient_target_lesion_is_located_in_non_infarct_related_artery_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's target lesion is currently located in the non-infarct-related artery.","when_to_set_to_false":"Set to false if the patient's target lesion is not currently located in the non-infarct-related artery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's target lesion is currently located in the non-infarct-related artery.","meaning":"Boolean indicating whether the patient's target lesion is currently located in the non-infarct-related artery."} ;; "the target lesion is located in the non-infarct-related artery"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@is_primary_treatment
         patient_has_undergone_percutaneous_coronary_intervention_inthehistory)
     :named REQ10_AUXILIARY0)) ;; "percutaneous coronary intervention as primary treatment" implies "percutaneous coronary intervention"

;; ===================== Constraint Assertions (REQ 10) =====================
;; (the target lesion is located in the infarct-related artery AND the infarct-related artery is not treated with primary percutaneous coronary intervention)
;; OR
;; (the target lesion is located in the non-infarct-related artery AND the non-infarct-related artery has stenosis proportion ≥ 70 percent (by visual estimate) AND the time since ST-segment elevation myocardial infarction is greater than 72 hours)
(assert
  (! (or
        (and patient_target_lesion_is_located_in_infarct_related_artery_now
             (not patient_infarct_related_artery_is_treated_with_primary_percutaneous_coronary_intervention_now))
        (and patient_target_lesion_is_located_in_non_infarct_related_artery_now
             (>= patient_non_infarct_related_artery_has_stenosis_proportion_value_recorded_now_withunit_percent 70.0)
             (> patient_myocardial_infarction_value_recorded_now_withunit_hours 72.0)))
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "angiographic inclusion criteria: (the target lesion is located in the infarct-related artery AND the infarct-related artery is not treated with primary percutaneous coronary intervention) OR (the target lesion is located in the non-infarct-related artery AND the non-infarct-related artery has stenosis proportion ≥ 70 percent (by visual estimate) AND the time since ST-segment elevation myocardial infarction is greater than 72 hours)"

;; ===================== Declarations for the criterion (REQ 11) =====================
(declare-const lesion_is_treated_with_percutaneous_coronary_intervention_now Bool) ;; {"when_to_set_to_true":"Set to true if the lesion is currently being treated with percutaneous coronary intervention.","when_to_set_to_false":"Set to false if the lesion is not currently being treated with percutaneous coronary intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lesion is currently being treated with percutaneous coronary intervention.","meaning":"Boolean indicating whether the lesion is currently being treated with percutaneous coronary intervention."} ;; "the lesion is treated with percutaneous coronary intervention"
(declare-const patient_myocardial_infarction_value_recorded_now_withunit_hours@@st_segment_elevation_type Bool) ;; {"when_to_set_to_true":"Set to true if the myocardial infarction is of the ST-segment elevation type.","when_to_set_to_false":"Set to false if the myocardial infarction is not of the ST-segment elevation type.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the myocardial infarction is of the ST-segment elevation type.","meaning":"Boolean indicating whether the myocardial infarction is of the ST-segment elevation type."} ;; "ST-segment elevation myocardial infarction"
(declare-const patient_myocardial_infarction_value_recorded_now_withunit_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours elapsed since the patient experienced ST-segment elevation myocardial infarction, as of now.","when_to_set_to_null":"Set to null if the time since ST-segment elevation myocardial infarction is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the time elapsed since ST-segment elevation myocardial infarction, measured in hours, as of now."} ;; "the time since ST-segment elevation myocardial infarction is greater than 72 hours"
(declare-const lesion_is_subject_to_protocol_inclusion_and_exclusion_criteria_now Bool) ;; {"when_to_set_to_true":"Set to true if the lesion is currently subject to the same protocol inclusion and exclusion criteria as listed in the study.","when_to_set_to_false":"Set to false if the lesion is not currently subject to the same protocol inclusion and exclusion criteria as listed in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lesion is currently subject to the same protocol inclusion and exclusion criteria as listed in the study.","meaning":"Boolean indicating whether the lesion is currently subject to the same protocol inclusion and exclusion criteria as listed in the study."} ;; "the lesion is subject to the same protocol inclusion and exclusion criteria listed above and below"
(declare-const lesion_is_target_lesion_now Bool) ;; {"when_to_set_to_true":"Set to true if the lesion is currently considered a target lesion for treatment.","when_to_set_to_false":"Set to false if the lesion is not currently considered a target lesion for treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lesion is currently considered a target lesion for treatment.","meaning":"Boolean indicating whether the lesion is currently considered a target lesion for treatment."} ;; "target lesion"
(declare-const lesion_has_stenosis_proportion_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured proportion of stenosis in the lesion, recorded now, in percent.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the proportion of stenosis in the lesion, recorded now, with unit percent."} ;; "target lesion with stenosis proportion ≥ 70 percent"
(declare-const lesion_has_symptoms_now Bool) ;; {"when_to_set_to_true":"Set to true if the lesion is currently associated with symptoms.","when_to_set_to_false":"Set to false if the lesion is not currently associated with symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lesion is currently associated with symptoms.","meaning":"Boolean indicating whether the lesion is currently associated with symptoms."} ;; "presence or absence of symptoms"
(declare-const lesion_has_abnormal_stress_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the lesion is currently associated with an abnormal stress test result.","when_to_set_to_false":"Set to false if the lesion is not currently associated with an abnormal stress test result.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lesion is currently associated with an abnormal stress test result.","meaning":"Boolean indicating whether the lesion is currently associated with an abnormal stress test result."} ;; "presence or absence of abnormal stress test"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; If the lesion is a target lesion and has stenosis proportion ≥ 70%, then it may be treated regardless of symptoms or abnormal stress test
(assert
  (! (=> (and lesion_is_target_lesion_now
              (>= lesion_has_stenosis_proportion_value_recorded_now_withunit_percent 70.0))
         lesion_is_treated_with_percutaneous_coronary_intervention_now)
     :named REQ11_AUXILIARY0)) ;; "target lesion with stenosis proportion ≥ 70 percent may be treated regardless of the presence or absence of symptoms or abnormal stress test"

;; ===================== Constraint Assertions (REQ 11) =====================
;; Component 0: Lesion is treated with PCI AND time since STEMI > 72 hours
(assert
  (! (and lesion_is_treated_with_percutaneous_coronary_intervention_now
          patient_myocardial_infarction_value_recorded_now_withunit_hours@@st_segment_elevation_type
          (> patient_myocardial_infarction_value_recorded_now_withunit_hours 72.0))
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the lesion is treated with percutaneous coronary intervention AND the time since ST-segment elevation myocardial infarction is greater than 72 hours"

;; Component 1: Lesion is subject to protocol inclusion/exclusion criteria, except that target lesion with stenosis ≥ 70% may be treated regardless of symptoms or abnormal stress test
(assert
  (! (or
        (and lesion_is_subject_to_protocol_inclusion_and_exclusion_criteria_now
             (not (and lesion_is_target_lesion_now
                       (>= lesion_has_stenosis_proportion_value_recorded_now_withunit_percent 70.0))))
        (and lesion_is_target_lesion_now
             (>= lesion_has_stenosis_proportion_value_recorded_now_withunit_percent 70.0)))
     :named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the lesion is subject to the same protocol inclusion and exclusion criteria listed above and below, except that a target lesion with stenosis proportion ≥ 70 percent may be treated regardless of the presence or absence of symptoms or abnormal stress test"
