;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_st_segment_elevation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of ST-segment elevation.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of ST-segment elevation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ST-segment elevation.","meaning":"Boolean indicating whether the patient currently has ST-segment elevation."} ;; "ST-segment elevation"

(declare-const patient_has_finding_of_st_segment_elevation_now@@persistent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's ST-segment elevation is persistent.","when_to_set_to_false":"Set to false if the patient's ST-segment elevation is not persistent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's ST-segment elevation is persistent.","meaning":"Boolean indicating whether the patient's ST-segment elevation is persistent."} ;; "persistent ST-segment elevation"

(declare-const patient_st_segment_elevation_contiguous_leads_count_recorded_now Real) ;; {"when_to_set_to_value":"Set to the measured value if the number of contiguous leads with ST-segment elevation recorded now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the number of contiguous leads with ST-segment elevation recorded now."} ;; "in greater than or equal to 2 contiguous leads"

(declare-const patient_st_segment_elevation_value_recorded_now_withunit_millivolt Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of ST-segment elevation in millivolts recorded now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current ST-segment elevation in millivolts."} ;; "ST-segment elevation greater than or equal to 1 millivolt"

(declare-const patient_has_finding_of_left_bundle_branch_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of left bundle branch block.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of left bundle branch block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has left bundle branch block.","meaning":"Boolean indicating whether the patient currently has left bundle branch block."} ;; "left bundle branch block"

(declare-const patient_has_finding_of_left_bundle_branch_block_now@@new Bool) ;; {"when_to_set_to_true":"Set to true if the patient's left bundle branch block is new.","when_to_set_to_false":"Set to false if the patient's left bundle branch block is not new.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's left bundle branch block is new.","meaning":"Boolean indicating whether the patient's left bundle branch block is new."} ;; "new left bundle branch block"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable for ST-segment elevation
(assert
(! (=> patient_has_finding_of_st_segment_elevation_now@@persistent
      patient_has_finding_of_st_segment_elevation_now)
:named REQ0_AUXILIARY0)) ;; "persistent ST-segment elevation"

;; Qualifier variable implies corresponding stem variable for left bundle branch block
(assert
(! (=> patient_has_finding_of_left_bundle_branch_block_now@@new
      patient_has_finding_of_left_bundle_branch_block_now)
:named REQ0_AUXILIARY1)) ;; "new left bundle branch block"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: persistent ST-segment elevation >= 1 mV in >= 2 contiguous leads
(assert
(! (not (and patient_has_finding_of_st_segment_elevation_now@@persistent
             (>= patient_st_segment_elevation_value_recorded_now_withunit_millivolt 1)
             (>= patient_st_segment_elevation_contiguous_leads_count_recorded_now 2)))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has persistent ST-segment elevation greater than or equal to 1 millivolt in greater than or equal to 2 contiguous leads."

;; Exclusion: new left bundle branch block
(assert
(! (not patient_has_finding_of_left_bundle_branch_block_now@@new)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has new left bundle branch block."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_acute_pulmonary_edema_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute pulmonary edema.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute pulmonary edema.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute pulmonary edema.","meaning":"Boolean indicating whether the patient currently has acute pulmonary edema."} ;; "acute pulmonary edema"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_has_finding_of_acute_pulmonary_edema_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute pulmonary edema."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_sepsis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of sepsis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of sepsis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sepsis.","meaning":"Boolean indicating whether the patient currently has sepsis."} ;; "sepsis"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_sepsis_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has sepsis."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current systolic blood pressure in millimeters of mercury is available and recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current systolic blood pressure in millimeters of mercury."} ;; "sustained systolic blood pressure less than 90 millimeters of mercury"
(declare-const patient_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@sustained Bool) ;; {"when_to_set_to_true":"Set to true if the recorded systolic blood pressure value is sustained (i.e., persists over a clinically meaningful period, not a single transient reading).","when_to_set_to_false":"Set to false if the recorded value is not sustained (i.e., is a transient or isolated measurement).","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the measurement is sustained.","meaning":"Boolean indicating whether the systolic blood pressure measurement is sustained."} ;; "sustained systolic blood pressure less than 90 millimeters of mercury"
(declare-const patient_has_finding_of_cardiogenic_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of cardiogenic shock.","when_to_set_to_false":"Set to false if the patient currently does not have evidence of cardiogenic shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of cardiogenic shock.","meaning":"Boolean indicating whether the patient currently has evidence of cardiogenic shock."} ;; "evidence of cardiogenic shock"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT have sustained systolic blood pressure < 90 mmHg OR evidence of cardiogenic shock
(assert
(! (not (or (and patient_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@sustained
                 (< patient_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 90))
            patient_has_finding_of_cardiogenic_shock_now))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has sustained systolic blood pressure less than 90 millimeters of mercury) OR (the patient has evidence of cardiogenic shock))."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_exposed_to_nitrate_salt_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to nitrate salts (e.g., taking or administered nitrate salts) at the time of randomization.","when_to_set_to_false":"Set to false if the patient is not currently exposed to nitrate salts at the time of randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to nitrate salts at the time of randomization.","meaning":"Boolean indicating whether the patient is currently exposed to nitrate salts."} ;; "nitrates"
(declare-const patient_is_using_agent_known_to_enhance_efficacy_of_nitrates_at_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient is using, at the time of randomization, any agent known to enhance the efficacy of nitrates.","when_to_set_to_false":"Set to false if the patient is not using, at the time of randomization, any agent known to enhance the efficacy of nitrates.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is using, at the time of randomization, any agent known to enhance the efficacy of nitrates.","meaning":"Boolean indicating whether the patient is using, at the time of randomization, any agent known to enhance the efficacy of nitrates."} ;; "agents known to enhance the efficacy of nitrates at randomization"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_using_agent_known_to_enhance_efficacy_of_nitrates_at_randomization)
    :named REQ5_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient uses at randomization agents known to enhance the efficacy of nitrates."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_aortic_valve_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of aortic valve stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of aortic valve stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has aortic valve stenosis.","meaning":"Boolean indicating whether the patient currently has aortic valve stenosis."} ;; "aortic stenosis"
(declare-const patient_has_finding_of_aortic_valve_stenosis_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's aortic valve stenosis is clinically significant.","when_to_set_to_false":"Set to false if the patient's aortic valve stenosis is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's aortic valve stenosis is clinically significant.","meaning":"Boolean indicating whether the patient's aortic valve stenosis is clinically significant."} ;; "clinically significant aortic stenosis"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_aortic_valve_stenosis_now@@clinically_significant
      patient_has_finding_of_aortic_valve_stenosis_now)
   :named REQ6_AUXILIARY0)) ;; "clinically significant aortic stenosis"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_aortic_valve_stenosis_now@@clinically_significant)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically significant aortic stenosis."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current creatinine concentration in milligrams per deciliter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current creatinine concentration in milligrams per deciliter."} ;; "creatinine concentration"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not (> patient_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter 2))
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has creatinine concentration greater than 2 milligrams per deciliter."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_participating_in_trial_of_investigational_device_at_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient is participating in another trial of an investigational device at the time of randomization.","when_to_set_to_false":"Set to false if the patient is not participating in another trial of an investigational device at the time of randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is participating in another trial of an investigational device at the time of randomization.","meaning":"Boolean indicating whether the patient is participating in another trial of an investigational device at the time of randomization."} ;; "the patient is participating in another trial of an investigational device at randomization"
(declare-const patient_is_participating_in_trial_of_investigational_drug_at_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient is participating in another trial of an investigational drug at the time of randomization.","when_to_set_to_false":"Set to false if the patient is not participating in another trial of an investigational drug at the time of randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is participating in another trial of an investigational drug at the time of randomization.","meaning":"Boolean indicating whether the patient is participating in another trial of an investigational drug at the time of randomization."} ;; "the patient is participating in another trial of an investigational drug at randomization"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (or patient_is_participating_in_trial_of_investigational_drug_at_randomization
            patient_is_participating_in_trial_of_investigational_device_at_randomization))
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is participating in another trial of an investigational drug at randomization) OR (the patient is participating in another trial of an investigational device at randomization))."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_allergy_to_nitrate_salt_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergy to nitrate salts.","when_to_set_to_false":"Set to false if the patient currently does not have an allergy to nitrate salts.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to nitrate salts.","meaning":"Boolean indicating whether the patient currently has an allergy to nitrate salts."} ;; "the patient has allergy to nitrate compounds"
(declare-const patient_has_hypersensitivity_to_nitrate_salt_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hypersensitivity (sensitivity) to nitrate salts.","when_to_set_to_false":"Set to false if the patient currently does not have a hypersensitivity (sensitivity) to nitrate salts.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hypersensitivity (sensitivity) to nitrate salts.","meaning":"Boolean indicating whether the patient currently has a hypersensitivity (sensitivity) to nitrate salts."} ;; "the patient has sensitivity to nitrate compounds"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_allergy_to_nitrate_salt_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has allergy to nitrate compounds."

(assert
(! (not patient_has_hypersensitivity_to_nitrate_salt_now)
:named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has sensitivity to nitrate compounds."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_cerebrovascular_accident_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cerebrovascular accident (stroke), regardless of acuity.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cerebrovascular accident (stroke).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of cerebrovascular accident (stroke).","meaning":"Boolean indicating whether the patient currently has a cerebrovascular accident (stroke)."} ;; "cerebrovascular attack"
(declare-const patient_has_finding_of_cerebrovascular_accident_now@@acute_episode Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current cerebrovascular accident (stroke) is an acute episode.","when_to_set_to_false":"Set to false if the patient's current cerebrovascular accident (stroke) is not an acute episode (e.g., chronic or remote).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the current cerebrovascular accident (stroke) is an acute episode.","meaning":"Boolean indicating whether the patient's current cerebrovascular accident (stroke) is an acute episode."} ;; "acute episode of cerebrovascular attack"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_cerebrovascular_accident_now@@acute_episode
       patient_has_finding_of_cerebrovascular_accident_now)
   :named REQ10_AUXILIARY0)) ;; "acute episode of cerebrovascular attack""

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_cerebrovascular_accident_now@@acute_episode)
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an acute episode of cerebrovascular attack."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_is_able_to_comply_with_protocol_and_follow_up Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to comply with both the study protocol and all required follow-up activities.","when_to_set_to_false":"Set to false if the patient is unable to comply with either the study protocol or any required follow-up activities.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to comply with the protocol and follow-up.","meaning":"Boolean indicating whether the patient is able to comply with the study protocol and follow-up requirements."} ;; "the patient is unable to comply with the protocol and follow-up"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not (not patient_is_able_to_comply_with_protocol_and_follow_up))
:named REQ11_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "A patient is excluded if the patient is unable to comply with the protocol and follow-up."
