;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_myocardial_infarction_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a myocardial infarction within the past 30 days.","when_to_set_to_false":"Set to false if the patient has not had a myocardial infarction within the past 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a myocardial infarction within the past 30 days.","meaning":"Boolean indicating whether the patient has had a myocardial infarction within the past 30 days."} ;; "myocardial infarction within the last 30 days"

(declare-const patient_has_finding_of_cerebrovascular_accident_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a cerebrovascular accident within the past 30 days.","when_to_set_to_false":"Set to false if the patient has not had a cerebrovascular accident within the past 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a cerebrovascular accident within the past 30 days.","meaning":"Boolean indicating whether the patient has had a cerebrovascular accident within the past 30 days."} ;; "cerebrovascular accident within the last 30 days"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_myocardial_infarction_inthepast30days)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a myocardial infarction within the last 30 days."

(assert
(! (not patient_has_finding_of_cerebrovascular_accident_inthepast30days)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a cerebrovascular accident within the last 30 days."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a coronary artery bypass graft at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a coronary artery bypass graft in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a coronary artery bypass graft.","meaning":"Boolean indicating whether the patient has ever undergone a coronary artery bypass graft in the past."} ;; "coronary artery bypass graft"
(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory@@temporalcontext_within30days_before_planned_catheter_based_ventricular_tachycardia_ablation_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the patient's coronary artery bypass graft occurred within 30 days prior to the planned catheter-based ventricular tachycardia ablation procedure.","when_to_set_to_false":"Set to false if the patient's coronary artery bypass graft did not occur within 30 days prior to the planned catheter-based ventricular tachycardia ablation procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the coronary artery bypass graft occurred within 30 days prior to the planned catheter-based ventricular tachycardia ablation procedure.","meaning":"Boolean indicating whether the patient's coronary artery bypass graft occurred within 30 days prior to the planned catheter-based ventricular tachycardia ablation procedure."} ;; "coronary artery bypass graft within 30 days prior to the planned catheter-based ventricular tachycardia ablation procedure"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_coronary_artery_bypass_graft_inthehistory@@temporalcontext_within30days_before_planned_catheter_based_ventricular_tachycardia_ablation_procedure
     patient_has_undergone_coronary_artery_bypass_graft_inthehistory)
:named REQ1_AUXILIARY0)) ;; "coronary artery bypass graft within 30 days prior to the planned catheter-based ventricular tachycardia ablation procedure" implies "coronary artery bypass graft in the history"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_undergone_coronary_artery_bypass_graft_inthehistory@@temporalcontext_within30days_before_planned_catheter_based_ventricular_tachycardia_ablation_procedure)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a coronary artery bypass graft within 30 days prior to the planned catheter-based ventricular tachycardia ablation procedure."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_can_undergo_renal_sympathectomy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo renal sympathetic denervation (renal sympathectomy).","when_to_set_to_false":"Set to false if the patient cannot currently undergo renal sympathetic denervation (renal sympathectomy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo renal sympathetic denervation (renal sympathectomy).","meaning":"Boolean indicating whether the patient can currently undergo renal sympathetic denervation (renal sympathectomy)."} ;; "renal sympathetic denervation"
(declare-const patient_has_finding_of_renal_artery_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has renal artery stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have renal artery stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal artery stenosis.","meaning":"Boolean indicating whether the patient currently has renal artery stenosis."} ;; "renal artery stenosis"
(declare-const patient_has_finding_of_renal_vascular_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a renovascular abnormality (renal vascular disorder).","when_to_set_to_false":"Set to false if the patient currently does not have a renovascular abnormality (renal vascular disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a renovascular abnormality (renal vascular disorder).","meaning":"Boolean indicating whether the patient currently has a renovascular abnormality (renal vascular disorder)."} ;; "renovascular abnormality"
(declare-const patient_has_finding_of_renal_vascular_disorder_now@@would_preclude_renal_sympathectomy Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a renovascular abnormality and that abnormality would preclude renal sympathetic denervation.","when_to_set_to_false":"Set to false if the patient currently has a renovascular abnormality but it would not preclude renal sympathetic denervation, or if the patient does not have a renovascular abnormality.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the renovascular abnormality would preclude renal sympathetic denervation.","meaning":"Boolean indicating whether the patient currently has a renovascular abnormality and that abnormality would preclude renal sympathetic denervation."} ;; "renovascular abnormality that would preclude renal sympathetic denervation"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive example: renal artery stenosis is one possible renovascular abnormality that would preclude renal sympathetic denervation
(assert
(! (=> patient_has_finding_of_renal_artery_stenosis_now
     patient_has_finding_of_renal_vascular_disorder_now@@would_preclude_renal_sympathectomy)
:named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples (renal artery stenosis)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_renal_vascular_disorder_now@@would_preclude_renal_sympathectomy
     patient_has_finding_of_renal_vascular_disorder_now)
:named REQ2_AUXILIARY1)) ;; "renovascular abnormality that would preclude renal sympathetic denervation"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_renal_vascular_disorder_now@@would_preclude_renal_sympathectomy)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known renovascular abnormality that would preclude renal sympathetic denervation with non-exhaustive examples (renal artery stenosis)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_glomerular_filtration_rate_value_recorded_now_withunit_milliliters_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current glomerular filtration rate (GFR) in milliliters per minute is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current glomerular filtration rate (GFR) in milliliters per minute."} ;; "glomerular filtration rate"
(declare-const patient_is_undergoing_dialysis_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing dialysis.","when_to_set_to_false":"Set to false if the patient is currently not undergoing dialysis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing dialysis.","meaning":"Boolean indicating whether the patient is currently undergoing dialysis."} ;; "dialysis"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (and (< patient_glomerular_filtration_rate_value_recorded_now_withunit_milliliters_per_minute 30)
             (not patient_is_undergoing_dialysis_procedure_now)))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a glomerular filtration rate less than 30 milliliters per minute) AND (the patient is NOT receiving dialysis)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const life_expectancy_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the numeric value (in years) of the patient's current life expectancy as estimated for any medical condition.","when_to_set_to_null":"Set to null if the patient's current life expectancy for any medical condition is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current life expectancy in years, as estimated for any medical condition."} ;; "life expectancy less than 1 year for any medical condition"
(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding (medical condition).","when_to_set_to_false":"Set to false if the patient currently does not have any disease, condition, or clinical finding (medical condition).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease, condition, or clinical finding (medical condition).","meaning":"Boolean indicating whether the patient currently has any disease, condition, or clinical finding (medical condition)."} ;; "any medical condition"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (and patient_has_finding_of_disease_condition_finding_now
             (< life_expectancy_value_recorded_now_in_years 1)))
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a life expectancy less than 1 year for any medical condition."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_condition_resulting_in_contraindication_to_anticoagulation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any condition that results in a contraindication to anticoagulation.","when_to_set_to_false":"Set to false if the patient currently does not have any condition that results in a contraindication to anticoagulation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any condition that results in a contraindication to anticoagulation.","meaning":"Boolean indicating whether the patient currently has any condition that results in a contraindication to anticoagulation."} ;; "any condition resulting in a contraindication to anticoagulation"
(declare-const patient_has_condition_resulting_in_contraindication_to_anticoagulation_now@@results_in_contraindication_to_anticoagulation Bool) ;; {"when_to_set_to_true":"Set to true if the condition results in a contraindication to anticoagulation.","when_to_set_to_false":"Set to false if the condition does not result in a contraindication to anticoagulation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the condition results in a contraindication to anticoagulation.","meaning":"Boolean indicating whether the condition results in a contraindication to anticoagulation."} ;; "results in a contraindication to anticoagulation"
(declare-const patient_has_finding_of_gastrointestinal_hemorrhage_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of gastrointestinal hemorrhage (bleeding).","when_to_set_to_false":"Set to false if the patient currently does not have a finding of gastrointestinal hemorrhage (bleeding).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of gastrointestinal hemorrhage (bleeding).","meaning":"Boolean indicating whether the patient currently has a finding of gastrointestinal hemorrhage (bleeding)."} ;; "gastrointestinal bleeding"
(declare-const patient_is_undergoing_anticoagulant_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing anticoagulant therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing anticoagulant therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing anticoagulant therapy.","meaning":"Boolean indicating whether the patient is currently undergoing anticoagulant therapy."} ;; "anticoagulation"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> patient_has_finding_of_gastrointestinal_hemorrhage_now
     patient_has_condition_resulting_in_contraindication_to_anticoagulation_now)
:named REQ5_AUXILIARY0)) ;; "with non-exhaustive examples (gastrointestinal bleeding)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_condition_resulting_in_contraindication_to_anticoagulation_now@@results_in_contraindication_to_anticoagulation
     patient_has_condition_resulting_in_contraindication_to_anticoagulation_now)
:named REQ5_AUXILIARY1)) ;; "results in a contraindication to anticoagulation"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_condition_resulting_in_contraindication_to_anticoagulation_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any condition resulting in a contraindication to anticoagulation with non-exhaustive examples (gastrointestinal bleeding)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_able_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to give informed consent.","when_to_set_to_false":"Set to false if the patient is currently unable to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to give informed consent.","meaning":"Boolean indicating whether the patient is currently able to give informed consent."} ;; "unable to give informed consent"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_is_able_to_give_informed_consent_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to give informed consent."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if there is documented evidence that the patient is currently pregnant.","when_to_set_to_false":"Set to false if there is documented evidence that the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently known to be pregnant."} ;; "the patient has a known pregnancy"

(declare-const patient_has_undergone_human_chorionic_gonadotropin_measurement_inthepast7days_outcome_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a human chorionic gonadotropin measurement with a positive result within the past 7 days.","when_to_set_to_false":"Set to false if the patient has not undergone a human chorionic gonadotropin measurement with a positive result within the past 7 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a human chorionic gonadotropin measurement with a positive result within the past 7 days.","meaning":"Boolean indicating whether the patient has undergone a human chorionic gonadotropin measurement with a positive result within the past 7 days."} ;; "human chorionic gonadotropin test"

(declare-const patient_has_undergone_human_chorionic_gonadotropin_measurement_inthepast7days_outcome_is_positive@@temporalcontext_within7days_before_planned_catheter_based_ventricular_tachycardia_ablation_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the positive human chorionic gonadotropin measurement occurred within 7 days prior to the planned catheter-based ventricular tachycardia ablation procedure.","when_to_set_to_false":"Set to false if the positive human chorionic gonadotropin measurement did not occur within 7 days prior to the planned catheter-based ventricular tachycardia ablation procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the positive human chorionic gonadotropin measurement occurred within 7 days prior to the planned catheter-based ventricular tachycardia ablation procedure.","meaning":"Boolean indicating whether the positive human chorionic gonadotropin measurement occurred within 7 days prior to the planned catheter-based ventricular tachycardia ablation procedure."} ;; "positive human chorionic gonadotropin test within 7 days prior to the planned catheter-based ventricular tachycardia ablation procedure"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_human_chorionic_gonadotropin_measurement_inthepast7days_outcome_is_positive@@temporalcontext_within7days_before_planned_catheter_based_ventricular_tachycardia_ablation_procedure
     patient_has_undergone_human_chorionic_gonadotropin_measurement_inthepast7days_outcome_is_positive)
:named REQ7_AUXILIARY0)) ;; "positive human chorionic gonadotropin test within 7 days prior to the planned catheter-based ventricular tachycardia ablation procedure"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (or patient_is_pregnant_now
            patient_has_undergone_human_chorionic_gonadotropin_measurement_inthepast7days_outcome_is_positive@@temporalcontext_within7days_before_planned_catheter_based_ventricular_tachycardia_ablation_procedure))
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a known pregnancy) OR (the patient has a positive human chorionic gonadotropin test within 7 days prior to the planned catheter-based ventricular tachycardia ablation procedure)."
