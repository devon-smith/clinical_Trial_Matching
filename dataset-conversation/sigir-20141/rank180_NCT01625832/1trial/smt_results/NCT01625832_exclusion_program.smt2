;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_acute_coronary_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute coronary syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute coronary syndrome.","meaning":"Boolean indicating whether the patient currently has acute coronary syndrome."} ;; "acute coronary syndrome"
(declare-const patient_has_finding_of_unstable_cardio_pulmonary_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an unstable cardio-pulmonary condition.","when_to_set_to_false":"Set to false if the patient currently does not have an unstable cardio-pulmonary condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an unstable cardio-pulmonary condition.","meaning":"Boolean indicating whether the patient currently has an unstable cardio-pulmonary condition."} ;; "unstable cardio-pulmonary condition"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_finding_of_acute_coronary_syndrome_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute coronary syndrome."

(assert
  (! (not patient_has_finding_of_unstable_cardio_pulmonary_condition_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has unstable cardio-pulmonary condition."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_congestive_heart_failure_nyha_class_iii_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has congestive heart failure classified as NYHA class III.","when_to_set_to_false":"Set to false if the patient currently does not have congestive heart failure classified as NYHA class III.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congestive heart failure classified as NYHA class III.","meaning":"Boolean indicating whether the patient currently has congestive heart failure classified as NYHA class III."} ;; "the patient has congestive heart failure New York Heart Association class III"
(declare-const patient_has_finding_of_congestive_heart_failure_nyha_class_iv_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has congestive heart failure classified as NYHA class IV.","when_to_set_to_false":"Set to false if the patient currently does not have congestive heart failure classified as NYHA class IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congestive heart failure classified as NYHA class IV.","meaning":"Boolean indicating whether the patient currently has congestive heart failure classified as NYHA class IV."} ;; "the patient has congestive heart failure New York Heart Association class IV"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_congestive_heart_failure_nyha_class_iii_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has congestive heart failure New York Heart Association class III."

(assert
(! (not patient_has_finding_of_congestive_heart_failure_nyha_class_iv_now)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has congestive heart failure New York Heart Association class IV."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone coronary artery bypass graft surgery at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone coronary artery bypass graft surgery at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone coronary artery bypass graft surgery.","meaning":"Boolean indicating whether the patient has ever undergone coronary artery bypass graft surgery at any time in the past."} ;; "coronary artery bypass surgery"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_undergone_coronary_artery_bypass_graft_inthehistory)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had previous coronary artery bypass surgery."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have a myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a myocardial infarction.","meaning":"Boolean indicating whether the patient currently has myocardial infarction."} ;; "myocardial infarction"
(declare-const patient_has_finding_of_myocardial_infarction_now@@q_wave_subtype Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current myocardial infarction is of the Q-wave subtype.","when_to_set_to_false":"Set to false if the patient's current myocardial infarction is not of the Q-wave subtype.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current myocardial infarction is of the Q-wave subtype.","meaning":"Boolean indicating whether the patient's current myocardial infarction is of the Q-wave subtype."} ;; "Q-wave myocardial infarction"
(declare-const patient_has_finding_of_myocardial_infarction_now@@located_in_area_undergoing_collateral_flow_index_measurement Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current myocardial infarction is located in the area undergoing collateral flow index measurement.","when_to_set_to_false":"Set to false if the patient's current myocardial infarction is not located in the area undergoing collateral flow index measurement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current myocardial infarction is located in the area undergoing collateral flow index measurement.","meaning":"Boolean indicating whether the patient's current myocardial infarction is located in the area undergoing collateral flow index measurement."} ;; "in the area undergoing collateral flow index measurement"
(declare-const patient_has_finding_of_myocardial_infarction_now@@q_wave_subtype@@located_in_area_undergoing_collateral_flow_index_measurement Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a Q-wave myocardial infarction located in the area undergoing collateral flow index measurement.","when_to_set_to_false":"Set to false if the patient currently does not have a Q-wave myocardial infarction located in the area undergoing collateral flow index measurement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a Q-wave myocardial infarction located in the area undergoing collateral flow index measurement.","meaning":"Boolean indicating whether the patient currently has a Q-wave myocardial infarction located in the area undergoing collateral flow index measurement."} ;; "Q-wave myocardial infarction in the area undergoing collateral flow index measurement"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definitional: Q-wave MI in the area = Q-wave MI AND MI in the area
(assert
(! (= patient_has_finding_of_myocardial_infarction_now@@q_wave_subtype@@located_in_area_undergoing_collateral_flow_index_measurement
     (and patient_has_finding_of_myocardial_infarction_now@@q_wave_subtype
          patient_has_finding_of_myocardial_infarction_now@@located_in_area_undergoing_collateral_flow_index_measurement))
:named REQ3_AUXILIARY0)) ;; "Q-wave myocardial infarction in the area undergoing collateral flow index measurement"

;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_myocardial_infarction_now@@q_wave_subtype
      patient_has_finding_of_myocardial_infarction_now)
:named REQ3_AUXILIARY1)) ;; "Q-wave myocardial infarction"

(assert
(! (=> patient_has_finding_of_myocardial_infarction_now@@located_in_area_undergoing_collateral_flow_index_measurement
      patient_has_finding_of_myocardial_infarction_now)
:named REQ3_AUXILIARY2)) ;; "myocardial infarction in the area undergoing collateral flow index measurement"

(assert
(! (=> patient_has_finding_of_myocardial_infarction_now@@q_wave_subtype@@located_in_area_undergoing_collateral_flow_index_measurement
      patient_has_finding_of_myocardial_infarction_now)
:named REQ3_AUXILIARY3)) ;; "Q-wave myocardial infarction in the area undergoing collateral flow index measurement"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_myocardial_infarction_now@@q_wave_subtype@@located_in_area_undergoing_collateral_flow_index_measurement)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has Q-wave myocardial infarction in the area undergoing collateral flow index measurement."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_anatomical_variant_that_does_not_allow_coronary_sinus_occlusion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an anatomical variant that does not allow coronary sinus occlusion.","when_to_set_to_false":"Set to false if the patient currently does not have an anatomical variant that prevents coronary sinus occlusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an anatomical variant that does not allow coronary sinus occlusion.","meaning":"Boolean indicating whether the patient currently has an anatomical variant that does not allow coronary sinus occlusion."} ;; "anatomical variant that does not allow coronary sinus occlusion"

(declare-const patient_has_finding_of_occlusion_of_coronary_sinus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of occlusion of the coronary sinus.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of occlusion of the coronary sinus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has occlusion of the coronary sinus.","meaning":"Boolean indicating whether the patient currently has occlusion of the coronary sinus."} ;; "coronary sinus occlusion"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_anatomical_variant_that_does_not_allow_coronary_sinus_occlusion_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has anatomical variant that does not allow coronary sinus occlusion."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_heart_valve_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of valvular heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of valvular heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has valvular heart disease.","meaning":"Boolean indicating whether the patient currently has valvular heart disease."} ;; "valvular heart disease"
(declare-const patient_has_finding_of_heart_valve_disorder_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has valvular heart disease and the disease is severe.","when_to_set_to_false":"Set to false if the patient currently has valvular heart disease but the disease is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the valvular heart disease is severe.","meaning":"Boolean indicating whether the patient's current valvular heart disease is severe."} ;; "severe valvular heart disease"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_heart_valve_disorder_now@@severity_severe
      patient_has_finding_of_heart_valve_disorder_now)
:named REQ5_AUXILIARY0)) ;; "severe valvular heart disease""

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_heart_valve_disorder_now@@severity_severe)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe valvular heart disease."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_severe_hepatic_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe hepatic failure.","when_to_set_to_false":"Set to false if the patient currently does not have severe hepatic failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe hepatic failure.","meaning":"Boolean indicating whether the patient currently has severe hepatic failure."} ;; "the patient has severe hepatic failure"

(declare-const patient_creatinine_renal_clearance_value_recorded_now_withunit_ml_per_min Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current creatinine renal clearance (in ml/min) is available.","when_to_set_to_null":"Set to null if no current creatinine renal clearance measurement (in ml/min) is available or the value is indeterminate.","meaning":"Numeric value for the patient's current creatinine renal clearance in ml/min."} ;; "creatinine clearance < 15 ml/min"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient must NOT have severe hepatic failure
(assert
(! (not patient_has_finding_of_severe_hepatic_failure_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe hepatic failure."

;; Exclusion: patient must NOT have severe renal failure (creatinine clearance < 15 ml/min)
(assert
(! (not (< patient_creatinine_renal_clearance_value_recorded_now_withunit_ml_per_min 15))
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe renal failure (creatinine clearance < 15 ml/min)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as determined by clinical assessment or documentation.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as determined by clinical assessment or documentation.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."
