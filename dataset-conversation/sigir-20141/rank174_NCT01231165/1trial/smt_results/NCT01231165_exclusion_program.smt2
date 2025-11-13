;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypertension.","meaning":"Boolean indicating whether the patient currently has hypertension."} ;; "hypertension"
(declare-const patient_has_finding_of_hypertensive_disorder_now@@resistant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hypertension is resistant.","when_to_set_to_false":"Set to false if the patient's current hypertension is not resistant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hypertension is resistant.","meaning":"Boolean indicating whether the patient's current hypertension is resistant."} ;; "resistant hypertension"
(declare-const patient_has_finding_of_hypertensive_disorder_now@@persists_despite_treatment_with_three_drugs Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hypertension persists despite treatment with three drugs.","when_to_set_to_false":"Set to false if the patient's current hypertension does not persist despite treatment with three drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hypertension persists despite treatment with three drugs.","meaning":"Boolean indicating whether the patient's current hypertension persists despite treatment with three drugs."} ;; "resistant hypertension despite treatment with three drugs"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Resistant hypertension despite treatment with three drugs implies resistant hypertension
(assert
(! (=> patient_has_finding_of_hypertensive_disorder_now@@persists_despite_treatment_with_three_drugs
      patient_has_finding_of_hypertensive_disorder_now@@resistant)
:named REQ0_AUXILIARY0)) ;; "resistant hypertension despite treatment with three drugs" implies "resistant hypertension"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_hypertensive_disorder_now@@resistant
      patient_has_finding_of_hypertensive_disorder_now)
:named REQ0_AUXILIARY1)) ;; "resistant hypertension" implies "hypertension"

(assert
(! (=> patient_has_finding_of_hypertensive_disorder_now@@persists_despite_treatment_with_three_drugs
      patient_has_finding_of_hypertensive_disorder_now)
:named REQ0_AUXILIARY2)) ;; "hypertension persists despite treatment with three drugs" implies "hypertension"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_hypertensive_disorder_now@@persists_despite_treatment_with_three_drugs)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has resistant hypertension despite treatment with three drugs."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_myocardial_infarction_inthepast90days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a myocardial infarction within the past ninety days.","when_to_set_to_false":"Set to false if the patient has not had a myocardial infarction within the past ninety days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a myocardial infarction within the past ninety days.","meaning":"Boolean indicating whether the patient has had a myocardial infarction within the past ninety days."} ;; "myocardial infarction within the past ninety days"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_has_finding_of_myocardial_infarction_inthepast90days)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a myocardial infarction within the past ninety days."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthepast90days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone coronary artery bypass graft surgery within the past ninety days.","when_to_set_to_false":"Set to false if the patient has not undergone coronary artery bypass graft surgery within the past ninety days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone coronary artery bypass graft surgery within the past ninety days.","meaning":"Boolean indicating whether the patient has undergone coronary artery bypass graft surgery within the past ninety days."} ;; "coronary artery bypass graft surgery within the past ninety days"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_undergone_coronary_artery_bypass_graft_inthepast90days)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had coronary artery bypass graft surgery within the past ninety days."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_atrial_fibrillation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has atrial fibrillation.","when_to_set_to_false":"Set to false if the patient currently does not have atrial fibrillation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has atrial fibrillation.","meaning":"Boolean indicating whether the patient currently has atrial fibrillation."} ;; "atrial fibrillation"
(declare-const patient_resting_heart_rate_value_recorded_now_withunit_beats_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current resting heart rate in beats per minute is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current resting heart rate in beats per minute."} ;; "resting heart rate"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not (and patient_has_finding_of_atrial_fibrillation_now
               (> patient_resting_heart_rate_value_recorded_now_withunit_beats_per_minute 90)))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has atrial fibrillation) AND (the patient has a resting heart rate greater than ninety beats per minute)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone percutaneous coronary intervention within the past thirty days.","when_to_set_to_false":"Set to false if the patient has not undergone percutaneous coronary intervention within the past thirty days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone percutaneous coronary intervention within the past thirty days.","meaning":"Boolean indicating whether the patient has undergone percutaneous coronary intervention within the past thirty days."} ;; "percutaneous coronary intervention within the past thirty days"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_has_undergone_percutaneous_coronary_intervention_inthepast30days)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had percutaneous coronary intervention within the past thirty days."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_cardiac_pacemaker_in_situ_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an implanted cardiac pacemaker in situ.","when_to_set_to_false":"Set to false if the patient currently does not have an implanted cardiac pacemaker in situ.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an implanted cardiac pacemaker in situ.","meaning":"Boolean indicating whether the patient currently has an implanted cardiac pacemaker in situ."} ;; "implanted pacemaker"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not patient_has_finding_of_cardiac_pacemaker_in_situ_now)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an implanted pacemaker."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_cerebrovascular_accident_inthepast90days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a cerebrovascular accident (stroke) within the past 90 days.","when_to_set_to_false":"Set to false if the patient has not had a cerebrovascular accident (stroke) within the past 90 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a cerebrovascular accident (stroke) within the past 90 days.","meaning":"Boolean indicating whether the patient has had a cerebrovascular accident (stroke) within the past 90 days."} ;; "stroke within the past ninety days"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not patient_has_finding_of_cerebrovascular_accident_inthepast90days)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a stroke within the past ninety days."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_left_ventricular_branch_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has left ventricular branch block.","when_to_set_to_false":"Set to false if the patient currently does not have left ventricular branch block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has left ventricular branch block.","meaning":"Boolean indicating whether the patient currently has left ventricular branch block."} ;; "the patient has left ventricular branch block"
(declare-const patient_has_finding_of_right_ventricular_branch_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has right ventricular branch block.","when_to_set_to_false":"Set to false if the patient currently does not have right ventricular branch block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has right ventricular branch block.","meaning":"Boolean indicating whether the patient currently has right ventricular branch block."} ;; "the patient has right ventricular branch block"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not (or patient_has_finding_of_left_ventricular_branch_block_now
              patient_has_finding_of_right_ventricular_branch_block_now))
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has left ventricular branch block) OR (the patient has right ventricular branch block)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_exposed_to_aldosterone_receptor_antagonist_inthepast7days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to an aldosterone receptor antagonist at any time within the past 7 days.","when_to_set_to_false":"Set to false if the patient has not been exposed to an aldosterone receptor antagonist at any time within the past 7 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to an aldosterone receptor antagonist within the past 7 days.","meaning":"Boolean indicating whether the patient has been exposed to an aldosterone receptor antagonist within the past 7 days."} ;; "aldosterone antagonist drug within the last seven days"
(declare-const patient_is_exposed_to_potassium_sparing_diuretic_inthepast7days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to a potassium-sparing diuretic at any time within the past 7 days.","when_to_set_to_false":"Set to false if the patient has not been exposed to a potassium-sparing diuretic at any time within the past 7 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to a potassium-sparing diuretic within the past 7 days.","meaning":"Boolean indicating whether the patient has been exposed to a potassium-sparing diuretic within the past 7 days."} ;; "potassium-sparing drug within the last seven days"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (or patient_is_exposed_to_aldosterone_receptor_antagonist_inthepast7days
            patient_is_exposed_to_potassium_sparing_diuretic_inthepast7days))
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has used an aldosterone antagonist drug within the last seven days) OR (the patient has used a potassium-sparing drug within the last seven days)."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_intolerance_to_amiloride_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has intolerance to amiloride.","when_to_set_to_false":"Set to false if the patient currently does not have intolerance to amiloride.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has intolerance to amiloride.","meaning":"Boolean indicating whether the patient currently has intolerance to amiloride."} ;; "The patient is excluded if the patient has intolerance to amiloride."

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_intolerance_to_amiloride_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has intolerance to amiloride."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_is_taking_lithium_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any lithium-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking any lithium-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any lithium-containing product.","meaning":"Boolean indicating whether the patient is currently taking any lithium-containing product."} ;; "lithium"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_is_taking_lithium_containing_product_now)
    :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses lithium."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_is_currently_participating_in_other_therapeutic_trial Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in any other therapeutic trial.","when_to_set_to_false":"Set to false if the patient is not currently participating in any other therapeutic trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in any other therapeutic trial.","meaning":"Boolean indicating whether the patient is currently participating in any other therapeutic trial."} ;; "The patient is excluded if the patient is currently participating in any other therapeutic trial."

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_is_currently_participating_in_other_therapeutic_trial)
:named REQ11_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is currently participating in any other therapeutic trial."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have any disease, condition, or clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease, condition, or clinical finding.","meaning":"Boolean indicating whether the patient currently has any disease, condition, or clinical finding."} ;; "condition"

(declare-const patient_has_finding_of_disease_condition_finding_now@@may_prevent_adherence_to_trial_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disease, condition, or clinical finding may prevent the patient from adhering to the trial protocol.","when_to_set_to_false":"Set to false if the patient's current disease, condition, or clinical finding does not prevent or is not expected to prevent adherence to the trial protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disease, condition, or clinical finding may prevent adherence to the trial protocol.","meaning":"Boolean indicating whether the patient's current disease, condition, or clinical finding may prevent adherence to the trial protocol."} ;; "condition that may prevent the patient from adhering to the trial protocol"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@may_prevent_adherence_to_trial_protocol
      patient_has_finding_of_disease_condition_finding_now)
:named REQ12_AUXILIARY0)) ;; "any condition that may prevent the patient from adhering to the trial protocol"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_finding_of_disease_condition_finding_now@@may_prevent_adherence_to_trial_protocol)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any condition that may prevent the patient from adhering to the trial protocol."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_finding_of_hyperkalemia_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had hyperkalemia at any time within the past six months.","when_to_set_to_false":"Set to false if the patient has not had hyperkalemia within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had hyperkalemia within the past six months.","meaning":"Boolean indicating whether the patient has had hyperkalemia within the past six months."} ;; "the patient has a history of hyperkalemia (potassium concentration ≥ 5.5 millimoles per liter) within the past six months"

(declare-const patient_potassium_level_finding_value_recorded_inthepast2weeks_withunit_millimoles_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured potassium concentration value (in millimoles per liter) if a measurement was recorded within the past two weeks.","when_to_set_to_null":"Set to null if no potassium concentration measurement was recorded within the past two weeks or the value is indeterminate.","meaning":"Numeric value representing the patient's potassium concentration (mmol/L) measured within the past two weeks."} ;; "potassium concentration > 5.0 millimoles per liter within the past two weeks"

(declare-const patient_potassium_level_finding_value_recorded_inthepast6months_withunit_millimoles_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured potassium concentration value (in millimoles per liter) if a measurement was recorded within the past six months.","when_to_set_to_null":"Set to null if no potassium concentration measurement was recorded within the past six months or the value is indeterminate.","meaning":"Numeric value representing the patient's potassium concentration (mmol/L) measured within the past six months."} ;; "potassium concentration ≥ 5.5 millimoles per liter within the past six months"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not (or
           patient_has_finding_of_hyperkalemia_inthepast6months
           (> patient_potassium_level_finding_value_recorded_inthepast2weeks_withunit_millimoles_per_liter 5.0)
        ))
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a history of hyperkalemia (potassium concentration ≥ 5.5 millimoles per liter) within the past six months) OR (the patient has potassium concentration > 5.0 millimoles per liter within the past two weeks))."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_renal_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal impairment (renal dysfunction).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal impairment (renal dysfunction).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of renal impairment (renal dysfunction).","meaning":"Boolean indicating whether the patient currently has renal impairment (renal dysfunction) now."} ;; "renal dysfunction"
(declare-const patient_has_finding_of_renal_impairment_now@@chronic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current renal impairment (renal dysfunction) is chronic.","when_to_set_to_false":"Set to false if the patient's current renal impairment (renal dysfunction) is not chronic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current renal impairment (renal dysfunction) is chronic.","meaning":"Boolean indicating whether the patient's current renal impairment (renal dysfunction) is chronic."} ;; "chronic renal dysfunction"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_renal_impairment_now@@chronic
       patient_has_finding_of_renal_impairment_now)
   :named REQ14_AUXILIARY0)) ;; "chronic renal dysfunction"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_finding_of_renal_impairment_now@@chronic)
   :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic renal dysfunction."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_finding_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of liver disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of liver disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of liver disease.","meaning":"Boolean indicating whether the patient currently has liver disease."} ;; "liver disease"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_finding_of_disease_of_liver_now)
:named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has liver disease."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_finding_of_chronic_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chronic pulmonary disease (chronic lung disease).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chronic pulmonary disease (chronic lung disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic pulmonary disease (chronic lung disease).","meaning":"Boolean indicating whether the patient currently has chronic pulmonary disease (chronic lung disease)."} ;; "chronic pulmonary disease"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not patient_has_finding_of_chronic_lung_disease_now)
    :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic pulmonary disease."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_finding_of_heart_valve_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding or diagnosis of valvular heart disease (heart valve disorder).","when_to_set_to_false":"Set to false if the patient currently does not have a finding or diagnosis of valvular heart disease (heart valve disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding or diagnosis of valvular heart disease (heart valve disorder).","meaning":"Boolean indicating whether the patient currently has a finding or diagnosis of valvular heart disease (heart valve disorder)."} ;; "valvular heart disease"
(declare-const patient_has_finding_of_heart_valve_disorder_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current valvular heart disease is significant in severity.","when_to_set_to_false":"Set to false if the patient's current valvular heart disease is not significant in severity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current valvular heart disease is significant.","meaning":"Boolean indicating whether the patient's current valvular heart disease is significant in severity."} ;; "significant valvular heart disease"
(declare-const patient_has_finding_of_heart_valve_disorder_now@@uncorrected Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current valvular heart disease is uncorrected (no corrective intervention has been performed).","when_to_set_to_false":"Set to false if the patient's current valvular heart disease has been corrected (e.g., by surgery or intervention).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current valvular heart disease is uncorrected.","meaning":"Boolean indicating whether the patient's current valvular heart disease is uncorrected (no corrective intervention has been performed)."} ;; "uncorrected valvular heart disease"

;; ===================== Auxiliary Assertions (REQ 17) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_heart_valve_disorder_now@@significant
      patient_has_finding_of_heart_valve_disorder_now)
:named REQ17_AUXILIARY0)) ;; "significant valvular heart disease"

(assert
(! (=> patient_has_finding_of_heart_valve_disorder_now@@uncorrected
      patient_has_finding_of_heart_valve_disorder_now)
:named REQ17_AUXILIARY1)) ;; "uncorrected valvular heart disease"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not (and patient_has_finding_of_heart_valve_disorder_now@@significant
             patient_has_finding_of_heart_valve_disorder_now@@uncorrected))
:named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant uncorrected valvular heart disease."
