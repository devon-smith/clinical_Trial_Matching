;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_secondary_resistant_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has secondary resistant hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have secondary resistant hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has secondary resistant hypertension.","meaning":"Boolean indicating whether the patient currently has secondary resistant hypertension."} ;; "secondary resistant hypertension"
(declare-const patient_has_finding_of_secondary_resistant_hypertension_now@@caused_by_another_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current secondary resistant hypertension is caused by another disease.","when_to_set_to_false":"Set to false if the patient's current secondary resistant hypertension is not caused by another disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current secondary resistant hypertension is caused by another disease.","meaning":"Boolean indicating whether the patient's current secondary resistant hypertension is caused by another disease."} ;; "secondary resistant hypertension because of another disease"
(declare-const patient_has_diagnosis_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of kidney disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of kidney disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of kidney disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of kidney disease."} ;; "renal disease"
(declare-const patient_has_diagnosis_of_pheochromocytoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of pheochromocytoma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of pheochromocytoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of pheochromocytoma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of pheochromocytoma."} ;; "pheochromocytoma"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_kidney_disease_now
           patient_has_diagnosis_of_pheochromocytoma_now)
       patient_has_finding_of_secondary_resistant_hypertension_now@@caused_by_another_disease)
   :named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples (renal disease OR pheochromocytoma)."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_secondary_resistant_hypertension_now@@caused_by_another_disease
       patient_has_finding_of_secondary_resistant_hypertension_now)
   :named REQ0_AUXILIARY1)) ;; "secondary resistant hypertension because of another disease"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_secondary_resistant_hypertension_now@@caused_by_another_disease)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has secondary resistant hypertension because of another disease with non-exhaustive examples (renal disease OR pheochromocytoma)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_clinical_trial_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a clinical trial procedure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a clinical trial procedure at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a clinical trial procedure.","meaning":"Boolean indicating whether the patient has ever undergone a clinical trial procedure at any time in the past."} ;; "clinical trial"
(declare-const patient_has_undergone_clinical_trial_inthehistory@@temporalcontext_within1monthbefore_current_trial Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a clinical trial and that clinical trial occurred within one month before the current (index) trial.","when_to_set_to_false":"Set to false if the patient has undergone a clinical trial but none occurred within one month before the current (index) trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether any clinical trial occurred within one month before the current (index) trial.","meaning":"Boolean indicating whether the patient's clinical trial participation occurred within one month before the current (index) trial."} ;; "within one month"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_clinical_trial_inthehistory@@temporalcontext_within1monthbefore_current_trial
      patient_has_undergone_clinical_trial_inthehistory)
:named REQ1_AUXILIARY0)) ;; "has been included in another clinical trial within one month."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_undergone_clinical_trial_inthehistory@@temporalcontext_within1monthbefore_current_trial)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been included in another clinical trial within one month."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding as documented or reported.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is breastfeeding"
(declare-const patient_is_able_to_be_pregnant_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is preparing for pregnancy or has the intention to become pregnant in the future as documented or reported.","when_to_set_to_false":"Set to false if the patient is not preparing for pregnancy or does not have the intention to become pregnant in the future as documented or reported.","when_to_set_to_null":"Set to null if the patient's preparation or intention for future pregnancy is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is preparing for pregnancy in the future (i.e., has the potential or intention to become pregnant)."} ;; "the patient is preparing for pregnancy"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not (or patient_is_pregnant_now
              patient_is_breastfeeding_now
              patient_is_able_to_be_pregnant_inthefuture))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is pregnant) OR (the patient is breastfeeding) OR (the patient is preparing for pregnancy)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of stroke (cerebrovascular accident).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of stroke (cerebrovascular accident).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of stroke (cerebrovascular accident).","meaning":"Boolean indicating whether the patient currently has a diagnosis of stroke (cerebrovascular accident)."} ;; "stroke"
(declare-const patient_has_diagnosis_of_chronic_renal_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic renal failure.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic renal failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic renal failure.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic renal failure."} ;; "chronic renal failure"
(declare-const patient_has_diagnosis_of_coronary_atherosclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of coronary atherosclerotic heart disease (coronary atherosclerosis).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of coronary atherosclerotic heart disease (coronary atherosclerosis).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of coronary atherosclerotic heart disease (coronary atherosclerosis).","meaning":"Boolean indicating whether the patient currently has a diagnosis of coronary atherosclerotic heart disease (coronary atherosclerosis)."} ;; "coronary atherosclerotic heart disease"
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus."} ;; "diabetes mellitus"
(declare-const patient_has_diagnosis_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of mental disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of mental disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of mental disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of mental disorder."} ;; "mental disease"
(declare-const patient_has_finding_of_co_morbid_conditions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any comorbid condition (including but not limited to stroke, coronary atherosclerotic heart disease, diabetes mellitus, chronic renal failure, or mental disease).","when_to_set_to_false":"Set to false if the patient currently does not have any comorbid condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any comorbid condition.","meaning":"Boolean indicating whether the patient currently has any comorbid condition."} ;; "comorbid disease"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_cerebrovascular_accident_now
          patient_has_diagnosis_of_coronary_atherosclerosis_now
          patient_has_diagnosis_of_diabetes_mellitus_now
          patient_has_diagnosis_of_chronic_renal_failure_now
          patient_has_diagnosis_of_mental_disorder_now)
    patient_has_finding_of_co_morbid_conditions_now)
:named REQ3_AUXILIARY0)) ;; "with non-exhaustive examples (stroke OR coronary atherosclerotic heart disease OR diabetes mellitus OR chronic renal failure OR mental disease)."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_chronic_renal_failure_now
    patient_has_diagnosis_of_kidney_disease_now)
:named REQ3_AUXILIARY1)) ;; "chronic renal failure" implies "kidney disease"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_co_morbid_conditions_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a comorbid disease with non-exhaustive examples (stroke OR coronary atherosclerotic heart disease OR diabetes mellitus OR chronic renal failure OR mental disease)."
