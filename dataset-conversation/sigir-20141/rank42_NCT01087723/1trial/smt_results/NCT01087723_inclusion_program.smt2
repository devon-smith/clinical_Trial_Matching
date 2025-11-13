;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const decision_to_randomize_made_by_qualified_paramedic_present_at_time_of_decision Bool) ;; {"when_to_set_to_true":"Set to true if the decision to randomize was made by a qualified paramedic who was present at the time of the decision to randomize.","when_to_set_to_false":"Set to false if the decision to randomize was not made by a qualified paramedic who was present at the time of the decision to randomize.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the decision to randomize was made by a qualified paramedic who was present at the time of the decision to randomize.","meaning":"Boolean indicating whether the decision to randomize was made by a qualified paramedic who was present at the time of the decision to randomize."} // "decision to randomize made by a qualified paramedic who was present at the time of the decision to randomize."
(declare-const decision_to_randomize_made_by_qualified_physician_present_at_time_of_decision Bool) ;; {"when_to_set_to_true":"Set to true if the decision to randomize was made by a qualified physician who was present at the time of the decision to randomize.","when_to_set_to_false":"Set to false if the decision to randomize was not made by a qualified physician who was present at the time of the decision to randomize.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the decision to randomize was made by a qualified physician who was present at the time of the decision to randomize.","meaning":"Boolean indicating whether the decision to randomize was made by a qualified physician who was present at the time of the decision to randomize."} // "decision to randomize made by a qualified physician who was present at the time of the decision to randomize."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or decision_to_randomize_made_by_qualified_physician_present_at_time_of_decision
         decision_to_randomize_made_by_qualified_paramedic_present_at_time_of_decision)
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have had the decision to randomize made by (a qualified physician OR a qualified paramedic) who was present at the time of the decision to randomize."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_presented_via_ambulance Bool) ;; {"when_to_set_to_true":"Set to true if the patient presented to the hospital via ambulance.","when_to_set_to_false":"Set to false if the patient did not present to the hospital via ambulance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient presented via ambulance.","meaning":"Boolean indicating whether the patient presented to the hospital via ambulance."} // "have presented via ambulance"
(declare-const patient_has_presented_to_center_where_pci_was_not_performed Bool) ;; {"when_to_set_to_true":"Set to true if the patient presented to a center where percutaneous coronary intervention was not performed.","when_to_set_to_false":"Set to false if the patient presented to a center where percutaneous coronary intervention was performed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient presented to a center where percutaneous coronary intervention was not performed.","meaning":"Boolean indicating whether the patient presented to a center where percutaneous coronary intervention was not performed."} // "have presented to a center where percutaneous coronary intervention was not performed"
(declare-const patient_has_provided_written_informed_consent_before_study_procedures Bool) ;; {"when_to_set_to_true":"Set to true if the patient provided written informed consent before initiation of any study related procedures.","when_to_set_to_false":"Set to false if the patient did not provide written informed consent before initiation of any study related procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient provided written informed consent before initiation of any study related procedures.","meaning":"Boolean indicating whether the patient provided written informed consent before initiation of any study related procedures."} // "have provided written informed consent before initiation of any study related procedures"
(declare-const patient_has_signed_abridged_written_informed_consent_in_ambulance Bool) ;; {"when_to_set_to_true":"Set to true if the patient, when randomized in the ambulance, has initially signed an abridged version of the written informed consent.","when_to_set_to_false":"Set to false if the patient, when randomized in the ambulance, has not signed an abridged version of the written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient, when randomized in the ambulance, has signed an abridged version of the written informed consent.","meaning":"Boolean indicating whether the patient, if randomized in the ambulance, has initially signed an abridged version of the written informed consent."} // "if randomized in the ambulance, have initially signed an abridged version of the written informed consent"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: ((have presented via ambulance) OR (have presented to a center where percutaneous coronary intervention was not performed))
(assert
  (! (or patient_has_presented_via_ambulance
         patient_has_presented_to_center_where_pci_was_not_performed)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "((have presented via ambulance) OR (have presented to a center where percutaneous coronary intervention was not performed))"

;; Component 1: (have provided written informed consent before initiation of any study related procedures OR, if randomized in the ambulance, have initially signed an abridged version of the written informed consent)
(assert
  (! (or patient_has_provided_written_informed_consent_before_study_procedures
         patient_has_signed_abridged_written_informed_consent_in_ambulance)
     :named REQ1_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "(have provided written informed consent before initiation of any study related procedures OR, if randomized in the ambulance, have initially signed an abridged version of the written informed consent)"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "be aged ≥ 18 years at the time of randomization"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: ((have presented via ambulance) OR (have presented to a center where percutaneous coronary intervention was not performed))
(assert
  (! (or patient_has_presented_via_ambulance
         patient_has_presented_to_center_where_pci_was_not_performed)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have presented via ambulance OR have presented to a center where percutaneous coronary intervention was not performed"

;; Component 1: be aged ≥ 18 years at the time of randomization
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "be aged ≥ 18 years at the time of randomization"

;; ===================== Declarations for the inclusion criterion (REQ 3) =====================
;; (declare-const patient_has_presented_via_ambulance Bool) ;; {"when_to_set_to_true":"Set to true if the patient presented to the hospital via ambulance.","when_to_set_to_false":"Set to false if the patient did not present to the hospital via ambulance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient presented via ambulance.","meaning":"Boolean indicating whether the patient presented to the hospital via ambulance."}
;; (declare-const patient_has_presented_to_center_where_pci_was_not_performed Bool) ;; {"when_to_set_to_true":"Set to true if the patient presented to a center where percutaneous coronary intervention was not performed.","when_to_set_to_false":"Set to false if the patient presented to a center where percutaneous coronary intervention was performed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient presented to a center where percutaneous coronary intervention was not performed.","meaning":"Boolean indicating whether the patient presented to a center where percutaneous coronary intervention was not performed."}

(declare-const patient_has_diagnosis_of_acute_coronary_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute coronary syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute coronary syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute coronary syndrome."} // "presumed diagnosis of ST segment elevation acute coronary syndrome"
(declare-const patient_has_diagnosis_of_acute_coronary_syndrome_now@@onset_of_symptoms_greater_than_20_minutes_before_presentation Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of acute coronary syndrome is present and the onset of symptoms was greater than 20 minutes before presentation.","when_to_set_to_false":"Set to false if the diagnosis is present but the onset of symptoms was not greater than 20 minutes before presentation.","when_to_set_to_null":"Set to null if it is unknown or not documented whether the onset of symptoms was greater than 20 minutes before presentation.","meaning":"Boolean indicating whether the diagnosis of acute coronary syndrome is present and the onset of symptoms was greater than 20 minutes before presentation."} // "onset of symptoms > 20 minutes"
(declare-const patient_has_diagnosis_of_acute_coronary_syndrome_now@@onset_of_symptoms_less_than_12_hours_before_presentation Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of acute coronary syndrome is present and the onset of symptoms was less than 12 hours before presentation.","when_to_set_to_false":"Set to false if the diagnosis is present but the onset of symptoms was not less than 12 hours before presentation.","when_to_set_to_null":"Set to null if it is unknown or not documented whether the onset of symptoms was less than 12 hours before presentation.","meaning":"Boolean indicating whether the diagnosis of acute coronary syndrome is present and the onset of symptoms was less than 12 hours before presentation."} // "onset of symptoms < 12 hours"
(declare-const patient_st_segment_elevation_value_recorded_now_withunit_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value in millimeters if a numeric measurement of ST segment elevation is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current ST segment elevation in millimeters."} // "ST segment elevation"
(declare-const patient_st_segment_elevation_value_recorded_now_withunit_millimeter@@in_at_least_2_contiguous_leads Bool) ;; {"when_to_set_to_true":"Set to true if the ST segment elevation value is measured in at least 2 contiguous leads.","when_to_set_to_false":"Set to false if the ST segment elevation value is not measured in at least 2 contiguous leads.","when_to_set_to_null":"Set to null if it is unknown or not documented whether the ST segment elevation value is measured in at least 2 contiguous leads.","meaning":"Boolean indicating whether the ST segment elevation value is measured in at least 2 contiguous leads."} // "in ≥ 2 contiguous leads"
(declare-const patient_has_finding_of_left_bundle_branch_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a left bundle branch block.","when_to_set_to_false":"Set to false if the patient currently does not have a left bundle branch block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a left bundle branch block.","meaning":"Boolean indicating whether the patient currently has a left bundle branch block."} // "left bundle branch block"
(declare-const patient_has_finding_of_left_bundle_branch_block_now@@presumably_new Bool) ;; {"when_to_set_to_true":"Set to true if the left bundle branch block is present and is presumably new.","when_to_set_to_false":"Set to false if the left bundle branch block is present but not presumably new.","when_to_set_to_null":"Set to null if it is unknown or not documented whether the left bundle branch block is presumably new.","meaning":"Boolean indicating whether the left bundle branch block is presumably new."} // "presumably new left bundle branch block"
(declare-const patient_has_finding_of_acute_myocardial_infarction_of_inferolateral_wall_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute myocardial infarction of the inferolateral wall.","when_to_set_to_false":"Set to false if the patient currently does not have an acute myocardial infarction of the inferolateral wall.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acute myocardial infarction of the inferolateral wall.","meaning":"Boolean indicating whether the patient currently has an acute myocardial infarction of the inferolateral wall."} // "infero-lateral myocardial infarction"
(declare-const patient_st_segment_depression_value_recorded_now_withunit_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value in millimeters if a numeric measurement of ST segment depression is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current ST segment depression in millimeters."} // "ST segment depression"
(declare-const patient_st_segment_depression_value_recorded_now_withunit_millimeter@@in_at_least_2_of_leads_v1_3 Bool) ;; {"when_to_set_to_true":"Set to true if the ST segment depression value is measured in at least 2 of leads V1-3.","when_to_set_to_false":"Set to false if the ST segment depression value is not measured in at least 2 of leads V1-3.","when_to_set_to_null":"Set to null if it is unknown or not documented whether the ST segment depression value is measured in at least 2 of leads V1-3.","meaning":"Boolean indicating whether the ST segment depression value is measured in at least 2 of leads V1-3."} // "in ≥ 2 of leads V1-3"
(declare-const patient_st_segment_depression_value_recorded_now_withunit_millimeter@@with_positive_terminal_t_wave Bool) ;; {"when_to_set_to_true":"Set to true if the ST segment depression value is accompanied by a positive terminal T wave.","when_to_set_to_false":"Set to false if the ST segment depression value is not accompanied by a positive terminal T wave.","when_to_set_to_null":"Set to null if it is unknown or not documented whether the ST segment depression value is accompanied by a positive terminal T wave.","meaning":"Boolean indicating whether the ST segment depression value is accompanied by a positive terminal T wave."} // "with a positive terminal T wave"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_acute_coronary_syndrome_now@@onset_of_symptoms_greater_than_20_minutes_before_presentation
         patient_has_diagnosis_of_acute_coronary_syndrome_now)
     :named REQ3_AUXILIARY0)) ;; "onset of symptoms > 20 minutes" implies diagnosis present

(assert
  (! (=> patient_has_diagnosis_of_acute_coronary_syndrome_now@@onset_of_symptoms_less_than_12_hours_before_presentation
         patient_has_diagnosis_of_acute_coronary_syndrome_now)
     :named REQ3_AUXILIARY1)) ;; "onset of symptoms < 12 hours" implies diagnosis present

(assert
  (! (=> patient_st_segment_elevation_value_recorded_now_withunit_millimeter@@in_at_least_2_contiguous_leads
         (>= patient_st_segment_elevation_value_recorded_now_withunit_millimeter 1.0))
     :named REQ3_AUXILIARY2)) ;; "ST segment elevation ≥ 1 mm in ≥ 2 contiguous leads"

(assert
  (! (=> patient_has_finding_of_left_bundle_branch_block_now@@presumably_new
         patient_has_finding_of_left_bundle_branch_block_now)
     :named REQ3_AUXILIARY3)) ;; "presumably new left bundle branch block" implies LBBB present

(assert
  (! (=> patient_st_segment_depression_value_recorded_now_withunit_millimeter@@in_at_least_2_of_leads_v1_3
         (>= patient_st_segment_depression_value_recorded_now_withunit_millimeter 1.0))
     :named REQ3_AUXILIARY4)) ;; "ST segment depression ≥ 1 mm in ≥ 2 of leads V1-3"

(assert
  (! (=> patient_st_segment_depression_value_recorded_now_withunit_millimeter@@with_positive_terminal_t_wave
         (>= patient_st_segment_depression_value_recorded_now_withunit_millimeter 1.0))
     :named REQ3_AUXILIARY5)) ;; "ST segment depression ≥ 1 mm with positive terminal T wave"

;; Both qualifiers for ST depression must be true for the infero-lateral MI criterion
(define-fun patient_meets_inferolateral_mi_st_depression_criterion () Bool
  (and patient_has_finding_of_acute_myocardial_infarction_of_inferolateral_wall_now
       patient_st_segment_depression_value_recorded_now_withunit_millimeter@@in_at_least_2_of_leads_v1_3
       patient_st_segment_depression_value_recorded_now_withunit_millimeter@@with_positive_terminal_t_wave)) ;; "infero-lateral MI with ST depression ≥ 1 mm in ≥ 2 of leads V1-3 with positive terminal T wave"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: ((presented via ambulance) OR (presented to center where PCI not performed))
(assert
  (! (or patient_has_presented_via_ambulance
         patient_has_presented_to_center_where_pci_was_not_performed)
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "((have presented via ambulance) OR (have presented to a center where percutaneous coronary intervention was not performed))"

;; Component 1: (diagnosis of ST segment elevation ACS) AND (onset > 20 min) AND (onset < 12 hr)
(assert
  (! (and patient_has_diagnosis_of_acute_coronary_syndrome_now
          patient_has_diagnosis_of_acute_coronary_syndrome_now@@onset_of_symptoms_greater_than_20_minutes_before_presentation
          patient_has_diagnosis_of_acute_coronary_syndrome_now@@onset_of_symptoms_less_than_12_hours_before_presentation)
     :named REQ3_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "presumed diagnosis of ST segment elevation acute coronary syndrome with onset of symptoms > 20 minutes AND onset of symptoms < 12 hours"

;; Component 2: at least one of:
;;   (ST segment elevation ≥ 1 mm in ≥ 2 contiguous leads)
;;   OR (presumably new left bundle branch block)
;;   OR (infero-lateral MI with ST depression ≥ 1 mm in ≥ 2 of leads V1-3 with positive terminal T wave)
(assert
  (! (or (and (>= patient_st_segment_elevation_value_recorded_now_withunit_millimeter 1.0)
              patient_st_segment_elevation_value_recorded_now_withunit_millimeter@@in_at_least_2_contiguous_leads)
         patient_has_finding_of_left_bundle_branch_block_now@@presumably_new
         patient_meets_inferolateral_mi_st_depression_criterion)
     :named REQ3_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "at least one of: (ST segment elevation ≥ 1 mm in ≥ 2 contiguous leads) OR (presumably new left bundle branch block) OR (infero-lateral MI with ST depression ≥ 1 mm in ≥ 2 of leads V1-3 with positive terminal T wave)"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_will_undergo_coronary_angiography_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient will undergo coronary angiography in the future if indicated.","when_to_set_to_false":"Set to false if the patient will not undergo coronary angiography in the future even if indicated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will undergo coronary angiography in the future if indicated.","meaning":"Boolean indicating whether the patient will undergo coronary angiography in the future if indicated."} // "would proceed with emergent coronary angiography ... if indicated"
(declare-const patient_will_undergo_coronary_angiography_inthefuture@@emergent Bool) ;; {"when_to_set_to_true":"Set to true if the patient will undergo emergent coronary angiography in the future if indicated.","when_to_set_to_false":"Set to false if the patient will undergo non-emergent coronary angiography in the future if indicated, or will not undergo the procedure at all.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the coronary angiography will be emergent.","meaning":"Boolean indicating whether the patient will undergo emergent coronary angiography in the future if indicated."} // "would proceed with emergent coronary angiography ... if indicated"
(declare-const patient_will_undergo_percutaneous_coronary_intervention_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient will undergo percutaneous coronary intervention in the future if indicated.","when_to_set_to_false":"Set to false if the patient will not undergo percutaneous coronary intervention in the future even if indicated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will undergo percutaneous coronary intervention in the future if indicated.","meaning":"Boolean indicating whether the patient will undergo percutaneous coronary intervention in the future if indicated."} // "would proceed with ... primary percutaneous coronary intervention if indicated"
(declare-const patient_will_undergo_percutaneous_coronary_intervention_inthefuture@@primary Bool) ;; {"when_to_set_to_true":"Set to true if the patient will undergo primary percutaneous coronary intervention in the future if indicated.","when_to_set_to_false":"Set to false if the patient will undergo non-primary percutaneous coronary intervention in the future if indicated, or will not undergo the procedure at all.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the percutaneous coronary intervention will be primary.","meaning":"Boolean indicating whether the patient will undergo primary percutaneous coronary intervention in the future if indicated."} // "would proceed with ... primary percutaneous coronary intervention if indicated"
(declare-const time_from_first_medical_contact_to_coronary_angiography_and_primary_percutaneous_coronary_intervention_value_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours from the patient's first medical contact to the initiation of emergent coronary angiography and primary percutaneous coronary intervention if indicated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many hours elapsed from first medical contact to the initiation of emergent coronary angiography and primary percutaneous coronary intervention if indicated.","meaning":"Numeric value in hours from first medical contact to emergent coronary angiography and primary percutaneous coronary intervention if indicated."} // "< 2 hours after first medical contact"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_will_undergo_coronary_angiography_inthefuture@@emergent
         patient_will_undergo_coronary_angiography_inthefuture)
     :named REQ4_AUXILIARY0)) ;; "would proceed with emergent coronary angiography ... if indicated"

(assert
  (! (=> patient_will_undergo_percutaneous_coronary_intervention_inthefuture@@primary
         patient_will_undergo_percutaneous_coronary_intervention_inthefuture)
     :named REQ4_AUXILIARY1)) ;; "would proceed with ... primary percutaneous coronary intervention if indicated"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: ((have presented via ambulance) OR (have presented to a center where percutaneous coronary intervention was not performed))
(assert
  (! (or patient_has_presented_via_ambulance
         patient_has_presented_to_center_where_pci_was_not_performed)
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have presented via ambulance OR have presented to a center where percutaneous coronary intervention was not performed"

;; Component 1: would proceed with emergent coronary angiography AND primary percutaneous coronary intervention if indicated < 2 hours after first medical contact
(assert
  (! (and patient_will_undergo_coronary_angiography_inthefuture@@emergent
          patient_will_undergo_percutaneous_coronary_intervention_inthefuture@@primary
          (< time_from_first_medical_contact_to_coronary_angiography_and_primary_percutaneous_coronary_intervention_value_in_hours 2.0))
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "would proceed with emergent coronary angiography AND primary percutaneous coronary intervention if indicated < 2 hours after first medical contact"
