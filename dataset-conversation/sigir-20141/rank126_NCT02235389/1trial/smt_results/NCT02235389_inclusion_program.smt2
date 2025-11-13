;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_ischemic_chest_pain_value_recorded_now_withunit_minutes Real) ;; {"when_to_set_to_value":"Set to the measured duration in minutes if the patient currently has an episode of ischemic chest pain and its duration is recorded.","when_to_set_to_null":"Set to null if no such episode is present now, or if the duration is not recorded or indeterminate.","meaning":"Numeric value representing the duration in minutes of the patient's current ischemic chest pain episode."}  ;; "ischemic cardiac pain"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: ischemic cardiac pain of duration ≥ 20 minutes
(assert
  (! (>= patient_ischemic_chest_pain_value_recorded_now_withunit_minutes 20)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have ischemic cardiac pain of duration ≥ 20 minutes."

;; Component 1: ischemic cardiac pain of duration ≤ 6 hours (i.e., ≤ 360 minutes)
(assert
  (! (<= patient_ischemic_chest_pain_value_recorded_now_withunit_minutes 360)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have ischemic cardiac pain of duration ≤ 6 hours."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 18 years AND aged ≤ 80 years"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must be aged ≥ 18 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; Component 1: To be included, the patient must be aged ≤ 80 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 80)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 80 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_ability_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the ability to give informed consent.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to give informed consent.","meaning":"Boolean indicating whether the patient currently has the ability to give informed consent."}  ;; "the ability to give informed consent"
(declare-const patient_has_given_witnessed_verbal_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently given verbal informed consent and it was witnessed.","when_to_set_to_false":"Set to false if the patient has not currently given verbal informed consent or it was not witnessed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has currently given witnessed verbal informed consent.","meaning":"Boolean indicating whether the patient has currently given verbal informed consent that was witnessed."}  ;; "witnessed verbal informed consent"
(declare-const patient_has_given_written_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently given written informed consent.","when_to_set_to_false":"Set to false if the patient has not currently given written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has currently given written informed consent.","meaning":"Boolean indicating whether the patient has currently given written informed consent."}  ;; "written informed consent"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; The ability to give informed consent is defined as having either witnessed verbal informed consent or written informed consent
(assert
  (! (= patient_has_ability_to_give_informed_consent_now
        (or patient_has_given_witnessed_verbal_informed_consent_now
            patient_has_given_written_informed_consent_now))
     :named REQ2_AUXILIARY0)) ;; "the ability to give informed consent (either witnessed verbal informed consent OR written informed consent)"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_ability_to_give_informed_consent_now
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have the ability to give informed consent (either witnessed verbal informed consent OR written informed consent)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_ability_to_follow_protocol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the ability to follow the study protocol.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to follow the study protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to follow the study protocol.","meaning":"Boolean indicating whether the patient currently has the ability to follow the study protocol."}  ;; "the ability to follow protocol"
(declare-const patient_has_ability_to_comply_with_follow_up_requirements_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the ability to comply with follow-up requirements.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to comply with follow-up requirements.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to comply with follow-up requirements.","meaning":"Boolean indicating whether the patient currently has the ability to comply with follow-up requirements."}  ;; "the ability to comply with follow-up requirements"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: To be included, the patient must have the ability to follow protocol.
(assert
  (! patient_has_ability_to_follow_protocol_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the ability to follow protocol"

;; Component 1: To be included, the patient must have the ability to comply with follow-up requirements.
(assert
  (! patient_has_ability_to_comply_with_follow_up_requirements_now
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the ability to comply with follow-up requirements"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_acute_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute myocardial infarction.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute myocardial infarction."}  ;; "acute myocardial infarction"
(declare-const patient_has_finding_of_left_bundle_branch_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of left bundle branch block.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of left bundle branch block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of left bundle branch block.","meaning":"Boolean indicating whether the patient currently has a finding of left bundle branch block."}  ;; "left bundle branch block"
(declare-const patient_has_finding_of_left_bundle_branch_block_now@@accompanied_by_clinical_indication_of_acute_myocardial_infarction Bool) ;; {"when_to_set_to_true":"Set to true if the left bundle branch block is accompanied by clinical indication of acute myocardial infarction.","when_to_set_to_false":"Set to false if the left bundle branch block is not accompanied by clinical indication of acute myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the left bundle branch block is accompanied by clinical indication of acute myocardial infarction.","meaning":"Boolean indicating whether the left bundle branch block is accompanied by clinical indication of acute myocardial infarction."}  ;; "left bundle branch block with clinical indication of acute myocardial infarction"
(declare-const patient_has_undergone_12_lead_ecg_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a 12-lead electrocardiogram now.","when_to_set_to_false":"Set to false if the patient has not undergone a 12-lead electrocardiogram now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a 12-lead electrocardiogram now.","meaning":"Boolean indicating whether the patient has undergone a 12-lead electrocardiogram now."}  ;; "12 lead electrocardiogram"
(declare-const patient_has_undergone_electrocardiographic_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone an electrocardiographic procedure now.","when_to_set_to_false":"Set to false if the patient has not undergone an electrocardiographic procedure now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone an electrocardiographic procedure now.","meaning":"Boolean indicating whether the patient has undergone an electrocardiographic procedure now."}  ;; "electrocardiogram"
(declare-const patient_st_segment_elevation_value_recorded_now_withunit_millivolts Real) ;; {"when_to_set_to_value":"Set to the measured value in millivolts if ST segment elevation is recorded now.","when_to_set_to_null":"Set to null if no measurement is available or indeterminate.","meaning":"Numeric value representing the magnitude of ST segment elevation (in millivolts) recorded now."}  ;; "ST segment elevation"
(declare-const patient_st_segment_elevation_value_recorded_now_withunit_millivolts@@present_in_at_least_2_contiguous_standard_leads Bool) ;; {"when_to_set_to_true":"Set to true if the ST segment elevation is present in at least 2 contiguous standard leads.","when_to_set_to_false":"Set to false if the ST segment elevation is not present in at least 2 contiguous standard leads.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the ST segment elevation is present in at least 2 contiguous standard leads.","meaning":"Boolean indicating whether the ST segment elevation is present in at least 2 contiguous standard leads."}  ;; "ST segment elevation in ≥ 2 contiguous electrocardiogram standard leads"
(declare-const patient_st_segment_elevation_value_recorded_now_withunit_millivolts@@indicative_of_acute_myocardial_infarction Bool) ;; {"when_to_set_to_true":"Set to true if the ST segment elevation is indicative of acute myocardial infarction.","when_to_set_to_false":"Set to false if the ST segment elevation is not indicative of acute myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the ST segment elevation is indicative of acute myocardial infarction.","meaning":"Boolean indicating whether the ST segment elevation is indicative of acute myocardial infarction."}  ;; "ST segment elevation indicative of acute myocardial infarction"
(declare-const patient_st_segment_elevation_value_recorded_now_withunit_millivolts@@present_in_at_least_2_contiguous_chest_leads Bool) ;; {"when_to_set_to_true":"Set to true if the ST segment elevation is present in at least 2 contiguous chest leads.","when_to_set_to_false":"Set to false if the ST segment elevation is not present in at least 2 contiguous chest leads.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the ST segment elevation is present in at least 2 contiguous chest leads.","meaning":"Boolean indicating whether the ST segment elevation is present in at least 2 contiguous chest leads."}  ;; "ST segment elevation in ≥ 2 contiguous chest leads"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_left_bundle_branch_block_now@@accompanied_by_clinical_indication_of_acute_myocardial_infarction
         patient_has_finding_of_left_bundle_branch_block_now)
     :named REQ4_AUXILIARY0)) ;; "left bundle branch block with clinical indication of acute myocardial infarction"

(assert
  (! (=> patient_st_segment_elevation_value_recorded_now_withunit_millivolts@@present_in_at_least_2_contiguous_standard_leads
         true)
     :named REQ4_AUXILIARY1)) ;; "ST segment elevation in ≥ 2 contiguous electrocardiogram standard leads"

(assert
  (! (=> patient_st_segment_elevation_value_recorded_now_withunit_millivolts@@present_in_at_least_2_contiguous_chest_leads
         true)
     :named REQ4_AUXILIARY2)) ;; "ST segment elevation in ≥ 2 contiguous chest leads"

(assert
  (! (=> patient_st_segment_elevation_value_recorded_now_withunit_millivolts@@indicative_of_acute_myocardial_infarction
         true)
     :named REQ4_AUXILIARY3)) ;; "ST segment elevation indicative of acute myocardial infarction"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: 12-lead ECG criteria for inclusion
(assert
  (! (or
        ;; (ST segment elevation ≥ 0.1 mV in ≥ 2 contiguous standard leads indicative of acute myocardial infarction)
        (and
          (>= patient_st_segment_elevation_value_recorded_now_withunit_millivolts 0.1)
          patient_st_segment_elevation_value_recorded_now_withunit_millivolts@@present_in_at_least_2_contiguous_standard_leads
          patient_st_segment_elevation_value_recorded_now_withunit_millivolts@@indicative_of_acute_myocardial_infarction
        )
        ;; (ST segment elevation ≥ 0.2 mV in ≥ 2 contiguous chest leads)
        (and
          (>= patient_st_segment_elevation_value_recorded_now_withunit_millivolts 0.2)
          patient_st_segment_elevation_value_recorded_now_withunit_millivolts@@present_in_at_least_2_contiguous_chest_leads
        )
        ;; (left bundle branch block with clinical indication of acute myocardial infarction)
        patient_has_finding_of_left_bundle_branch_block_now@@accompanied_by_clinical_indication_of_acute_myocardial_infarction
     )
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must meet 12 lead electrocardiogram criteria: (ST segment elevation ≥ 0.1 millivolts in ≥ 2 contiguous electrocardiogram standard leads indicative of acute myocardial infarction) OR (ST segment elevation ≥ 0.2 millivolts in ≥ 2 contiguous chest leads) OR (left bundle branch block with clinical indication of acute myocardial infarction)."
