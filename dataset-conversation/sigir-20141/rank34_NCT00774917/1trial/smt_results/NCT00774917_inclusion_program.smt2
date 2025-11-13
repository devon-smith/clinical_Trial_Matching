;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age > 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (age > 18 years)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_stable_angina_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of stable angina pectoris.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of stable angina pectoris.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of stable angina pectoris.","meaning":"Boolean indicating whether the patient currently has a diagnosis of stable angina pectoris."} // "diagnosis of stable angina pectoris"
(declare-const patient_has_diagnosis_of_stable_angina_now@@ccs_class_i_ii_iii_iv Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of stable angina pectoris is classified as CCS Class I, II, III, or IV.","when_to_set_to_false":"Set to false if the diagnosis of stable angina pectoris is not classified as CCS Class I, II, III, or IV.","when_to_set_to_null":"Set to null if the CCS class of the diagnosis is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the diagnosis of stable angina pectoris is classified as CCS Class I, II, III, or IV."} // "as defined by Canadian Cardiovascular Society Classification (Class I OR Class II OR Class III OR Class IV)"
(declare-const patient_has_diagnosis_of_acute_coronary_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute coronary syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute coronary syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute coronary syndrome."} // "diagnosis of acute coronary syndrome"
(declare-const patient_has_diagnosis_of_acute_coronary_syndrome_now@@excludes_st_elevation_myocardial_infarction Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of acute coronary syndrome explicitly excludes ST-elevation myocardial infarction.","when_to_set_to_false":"Set to false if the diagnosis of acute coronary syndrome does not exclude ST-elevation myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether ST-elevation myocardial infarction is excluded from the diagnosis.","meaning":"Boolean indicating whether the diagnosis of acute coronary syndrome excludes ST-elevation myocardial infarction."} // "NOT ST-elevation myocardial infarction"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable (stable angina CCS I-IV)
(assert
  (! (=> patient_has_diagnosis_of_stable_angina_now@@ccs_class_i_ii_iii_iv
         patient_has_diagnosis_of_stable_angina_now)
     :named REQ1_AUXILIARY0)) ;; "as defined by Canadian Cardiovascular Society Classification (Class I OR Class II OR Class III OR Class IV)"

;; Qualifier variable implies corresponding stem variable (ACS excludes STEMI)
(assert
  (! (=> patient_has_diagnosis_of_acute_coronary_syndrome_now@@excludes_st_elevation_myocardial_infarction
         patient_has_diagnosis_of_acute_coronary_syndrome_now)
     :named REQ1_AUXILIARY1)) ;; "acute coronary syndrome (NOT ST-elevation myocardial infarction)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have (a diagnosis of stable angina pectoris (as defined by CCS Class I-IV) OR a diagnosis of acute coronary syndrome (NOT STEMI))
(assert
  (! (or patient_has_diagnosis_of_stable_angina_now@@ccs_class_i_ii_iii_iv
         patient_has_diagnosis_of_acute_coronary_syndrome_now@@excludes_st_elevation_myocardial_infarction)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "diagnosis of stable angina pectoris (as defined by CCS I-IV) OR diagnosis of acute coronary syndrome (NOT STEMI)"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_finding_of_lesion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing treatment for a de novo lesion.","when_to_set_to_false":"Set to false if the patient is not currently undergoing treatment for a de novo lesion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing treatment for a de novo lesion.","meaning":"Boolean indicating whether the patient is currently undergoing treatment for a de novo lesion."} // "undergoing treatment of a de novo lesion"
(declare-const patient_has_finding_of_finding_of_lesion_now@@located_in_major_coronary_artery Bool) ;; {"when_to_set_to_true":"Set to true if the lesion being treated is located in a major coronary artery.","when_to_set_to_false":"Set to false if the lesion being treated is not located in a major coronary artery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lesion being treated is located in a major coronary artery.","meaning":"Boolean indicating whether the lesion being treated is located in a major coronary artery."} // "in a major coronary artery"
(declare-const patient_has_finding_of_single_coronary_vessel_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has disease affecting a single coronary vessel.","when_to_set_to_false":"Set to false if the patient currently does not have disease affecting a single coronary vessel.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has disease affecting a single coronary vessel.","meaning":"Boolean indicating whether the patient currently has disease affecting a single coronary vessel."} // "single vessel disease"
(declare-const patient_has_finding_of_double_coronary_vessel_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has disease affecting two coronary vessels.","when_to_set_to_false":"Set to false if the patient currently does not have disease affecting two coronary vessels.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has disease affecting two coronary vessels.","meaning":"Boolean indicating whether the patient currently has disease affecting two coronary vessels."} // "two-vessel disease"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_finding_of_lesion_now@@located_in_major_coronary_artery
         patient_has_finding_of_finding_of_lesion_now)
     :named REQ2_AUXILIARY0)) ;; "lesion located in major coronary artery" implies "lesion"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Undergoing treatment of a de novo lesion in a major coronary artery
(assert
  (! patient_has_finding_of_finding_of_lesion_now@@located_in_major_coronary_artery
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "undergoing treatment of a de novo lesion in a major coronary artery"

;; Component 1: Single vessel disease OR two-vessel disease
(assert
  (! (or patient_has_finding_of_single_coronary_vessel_disease_now
         patient_has_finding_of_double_coronary_vessel_disease_now)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "single vessel disease OR two-vessel disease"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_undergone_coronary_angiography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone coronary angiography now.","when_to_set_to_false":"Set to false if the patient has not undergone coronary angiography now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone coronary angiography now.","meaning":"Boolean indicating whether the patient has undergone coronary angiography now."} // "by quantitative coronary angiography"
(declare-const patient_has_undergone_coronary_angiography_now@@quantitative_method Bool) ;; {"when_to_set_to_true":"Set to true if the coronary angiography performed now was quantitative.","when_to_set_to_false":"Set to false if the coronary angiography performed now was not quantitative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the coronary angiography performed now was quantitative.","meaning":"Boolean indicating whether the coronary angiography performed now was quantitative."} // "by quantitative coronary angiography"
(declare-const target_vessel_diameter_value_recorded_at_lesion_site_by_quantitative_coronary_angiography_in_mm Real) ;; {"when_to_set_to_value":"Set to the numeric value in millimeters if the target vessel diameter is measured at the lesion site by quantitative coronary angiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the target vessel diameter is at the lesion site by quantitative coronary angiography.","meaning":"Numeric value of the target vessel diameter at the lesion site by quantitative coronary angiography, in millimeters."} // "target vessel diameter at the lesion site > 2.50 mm AND < 3.50 mm by quantitative coronary angiography"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_coronary_angiography_now@@quantitative_method
         patient_has_undergone_coronary_angiography_now)
     :named REQ3_AUXILIARY0)) ;; "by quantitative coronary angiography"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: target vessel diameter at the lesion site > 2.50 mm by quantitative coronary angiography
(assert
  (! (and patient_has_undergone_coronary_angiography_now@@quantitative_method
          (> target_vessel_diameter_value_recorded_at_lesion_site_by_quantitative_coronary_angiography_in_mm 2.50))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "target vessel diameter at the lesion site > 2.50 mm by quantitative coronary angiography"

;; Component 1: target vessel diameter at the lesion site < 3.50 mm by quantitative coronary angiography
(assert
  (! (and patient_has_undergone_coronary_angiography_now@@quantitative_method
          (< target_vessel_diameter_value_recorded_at_lesion_site_by_quantitative_coronary_angiography_in_mm 3.50))
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "target vessel diameter at the lesion site < 3.50 mm by quantitative coronary angiography"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const target_lesion_length_value_by_visual_estimate_in_mm Real) ;; {"when_to_set_to_value":"Set to the numeric value in millimeters if the target lesion length is measured by visual estimate and the value is documented.","when_to_set_to_null":"Set to null if the target lesion length by visual estimate is not documented, unknown, or cannot be determined.","meaning":"Numeric value representing the length of the target lesion, measured by visual estimate, in millimeters (mm)."} // "target lesion length > 10 mm AND < 24 mm by visual estimate"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: target lesion length > 10 mm by visual estimate
(assert
  (! (> target_lesion_length_value_by_visual_estimate_in_mm 10.0)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "target lesion length > 10 mm by visual estimate"

;; Component 1: target lesion length < 24 mm by visual estimate
(assert
  (! (< target_lesion_length_value_by_visual_estimate_in_mm 24.0)
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "target lesion length < 24 mm by visual estimate"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const target_lesion_stenosis_percent_by_visual_estimate Real) ;; {"when_to_set_to_value":"Set to the percentage value if the degree of stenosis in the target lesion has been visually estimated and recorded.","when_to_set_to_null":"Set to null if the percentage of stenosis in the target lesion by visual estimate is unknown, not documented, or cannot be determined.","meaning":"Numeric variable representing the percentage of stenosis in the target lesion as determined by visual estimate, expressed in percent (%)."}

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: "a target lesion stenosis > 50% by visual estimate"
(assert
  (! (> target_lesion_stenosis_percent_by_visual_estimate 50.0)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "a target lesion stenosis > 50% by visual estimate"

;; Component 1: "a target lesion stenosis < 100% by visual estimate"
(assert
  (! (< target_lesion_stenosis_percent_by_visual_estimate 100.0)
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "a target lesion stenosis < 100% by visual estimate"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_can_undergo_coronary_artery_bypass_graft_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently an acceptable candidate to undergo coronary artery bypass graft surgery.","when_to_set_to_false":"Set to false if the patient is currently not an acceptable candidate to undergo coronary artery bypass graft surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an acceptable candidate to undergo coronary artery bypass graft surgery.","meaning":"Boolean indicating whether the patient is currently an acceptable candidate to undergo coronary artery bypass graft surgery."} // "an acceptable candidate for coronary artery bypass graft surgery"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_can_undergo_coronary_artery_bypass_graft_now
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (an acceptable candidate for coronary artery bypass graft surgery)."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_is_willing_to_comply_with_specified_follow_up_evaluation Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to comply with the specified follow-up evaluation.","when_to_set_to_false":"Set to false if the patient is not willing to comply with the specified follow-up evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to comply with the specified follow-up evaluation.","meaning":"Boolean indicating whether the patient is willing to comply with the specified follow-up evaluation."} // "willing to comply with the specified follow-up evaluation"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! patient_is_willing_to_comply_with_specified_follow_up_evaluation
     :named REQ7_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION))

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_has_provided_written_informed_consent_prior_to_procedure_using_form_approved_by_local_ethics_committee Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent prior to the procedure using a form approved by the local Ethics Committee.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent prior to the procedure using a form approved by the local Ethics Committee.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent prior to the procedure using a form approved by the local Ethics Committee.","meaning":"Boolean indicating whether the patient has provided written informed consent prior to the procedure using a form approved by the local Ethics Committee."} // "provide written informed consent prior to the procedure using a form approved by the local Ethics Committee"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! patient_has_provided_written_informed_consent_prior_to_procedure_using_form_approved_by_local_ethics_committee
     :named REQ8_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "provide written informed consent prior to the procedure using a form approved by the local Ethics Committee"
