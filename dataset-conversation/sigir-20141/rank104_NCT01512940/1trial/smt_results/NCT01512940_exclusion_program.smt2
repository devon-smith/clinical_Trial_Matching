;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_obesity_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented finding of obesity in their history.","when_to_set_to_false":"Set to false if the patient has never had a documented finding of obesity in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a documented finding of obesity in their history.","meaning":"Boolean indicating whether the patient has ever had a documented finding of obesity in their history."} ;; "obesity"
(declare-const patient_has_had_malabsorptive_procedure_performed_for_treatment_of_obesity_previously Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a malabsorptive procedure performed previously for the treatment of obesity.","when_to_set_to_false":"Set to false if the patient has not had a malabsorptive procedure performed previously for the treatment of obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a malabsorptive procedure performed previously for the treatment of obesity.","meaning":"Boolean indicating whether the patient has had a malabsorptive procedure performed previously for the treatment of obesity."} ;; "previous malabsorptive procedure performed for the treatment of obesity"
(declare-const patient_has_had_restrictive_procedure_performed_for_treatment_of_obesity_previously Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a restrictive procedure performed previously for the treatment of obesity.","when_to_set_to_false":"Set to false if the patient has not had a restrictive procedure performed previously for the treatment of obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a restrictive procedure performed previously for the treatment of obesity.","meaning":"Boolean indicating whether the patient has had a restrictive procedure performed previously for the treatment of obesity."} ;; "previous restrictive procedure performed for the treatment of obesity"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_had_malabsorptive_procedure_performed_for_treatment_of_obesity_previously)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had previous malabsorptive procedure performed for the treatment of obesity."

(assert
  (! (not patient_has_had_restrictive_procedure_performed_for_treatment_of_obesity_previously)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had previous restrictive procedure performed for the treatment of obesity."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_scheduled_for_concurrent_surgical_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently scheduled for a surgical procedure that is concurrent with another procedure.","when_to_set_to_false":"Set to false if the patient is not currently scheduled for any concurrent surgical procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently scheduled for a concurrent surgical procedure.","meaning":"Boolean indicating whether the patient is currently scheduled for a concurrent surgical procedure."} ;; "the patient is scheduled for a concurrent surgical procedure"
(declare-const patient_is_scheduled_for_concurrent_surgical_procedure_now@@is_not_standard_of_care_liver_biopsy Bool) ;; {"when_to_set_to_true":"Set to true if the concurrent surgical procedure the patient is scheduled for is NOT a standard of care liver biopsy.","when_to_set_to_false":"Set to false if the concurrent surgical procedure is a standard of care liver biopsy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the concurrent surgical procedure is a standard of care liver biopsy.","meaning":"Boolean indicating whether the concurrent surgical procedure is NOT a standard of care liver biopsy."} ;; "the concurrent surgical procedure is NOT standard of care liver biopsy"
(declare-const patient_is_undergoing_biopsy_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently scheduled for or undergoing a liver biopsy procedure.","when_to_set_to_false":"Set to false if the patient is not currently scheduled for or undergoing a liver biopsy procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently scheduled for or undergoing a liver biopsy procedure.","meaning":"Boolean indicating whether the patient is currently scheduled for or undergoing a liver biopsy procedure."} ;; "liver biopsy"
(declare-const patient_is_undergoing_biopsy_of_liver_now@@is_standard_of_care Bool) ;; {"when_to_set_to_true":"Set to true if the liver biopsy procedure the patient is scheduled for or undergoing is considered standard of care.","when_to_set_to_false":"Set to false if the liver biopsy procedure is not considered standard of care.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the liver biopsy procedure is considered standard of care.","meaning":"Boolean indicating whether the liver biopsy procedure is considered standard of care."} ;; "standard of care liver biopsy"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_scheduled_for_concurrent_surgical_procedure_now@@is_not_standard_of_care_liver_biopsy
      patient_is_scheduled_for_concurrent_surgical_procedure_now)
    :named REQ1_AUXILIARY0)) ;; "the concurrent surgical procedure is NOT standard of care liver biopsy"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_undergoing_biopsy_of_liver_now@@is_standard_of_care
      patient_is_undergoing_biopsy_of_liver_now)
    :named REQ1_AUXILIARY1)) ;; "the liver biopsy procedure is considered standard of care"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient is scheduled for a concurrent surgical procedure AND the procedure is NOT standard of care liver biopsy
(assert
(! (not (and patient_is_scheduled_for_concurrent_surgical_procedure_now
             patient_is_scheduled_for_concurrent_surgical_procedure_now@@is_not_standard_of_care_liver_biopsy))
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is scheduled for a concurrent surgical procedure AND the concurrent surgical procedure is NOT standard of care liver biopsy."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently assessed to have childbearing potential.","when_to_set_to_false":"Set to false if the patient is currently assessed not to have childbearing potential.","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} ;; "woman of childbearing potential"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is confirmed to be pregnant at the time of screening.","when_to_set_to_false":"Set to false if the patient is confirmed not to be pregnant at the time of screening.","when_to_set_to_null":"Set to null if the patient's pregnancy status at the time of screening is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant at the time of screening."} ;; "pregnant at the time of screening"
(declare-const patient_is_pregnant_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is expected or confirmed to be pregnant at the time of surgery.","when_to_set_to_false":"Set to false if the patient is expected or confirmed not to be pregnant at the time of surgery.","when_to_set_to_null":"Set to null if the patient's pregnancy status at the time of surgery is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient will be pregnant at the time of surgery."} ;; "pregnant at the time of surgery"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is confirmed to be lactating at the time of screening.","when_to_set_to_false":"Set to false if the patient is confirmed not to be lactating at the time of screening.","when_to_set_to_null":"Set to null if the patient's lactation status at the time of screening is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating at the time of screening."} ;; "lactating at the time of screening"
(declare-const patient_is_lactating_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is expected or confirmed to be lactating at the time of surgery.","when_to_set_to_false":"Set to false if the patient is expected or confirmed not to be lactating at the time of surgery.","when_to_set_to_null":"Set to null if the patient's lactation status at the time of surgery is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient will be lactating at the time of surgery."} ;; "lactating at the time of surgery"

;; ===================== Constraint Assertions (REQ 2) =====================
;; "The patient is excluded if (the patient is a woman of childbearing potential) AND ((the patient is pregnant at the time of screening) OR (the patient is pregnant at the time of surgery) OR (the patient is lactating at the time of screening) OR (the patient is lactating at the time of surgery))."
(assert
(! (not (and patient_has_childbearing_potential_now
             (or patient_is_pregnant_now
                 patient_is_pregnant_inthefuture
                 patient_is_lactating_now
                 patient_is_lactating_inthefuture)))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is a woman of childbearing potential) AND ((the patient is pregnant at the time of screening) OR (the patient is pregnant at the time of surgery) OR (the patient is lactating at the time of screening) OR (the patient is lactating at the time of surgery))."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have any disease, condition, or clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease, condition, or clinical finding.","meaning":"Boolean indicating whether the patient currently has any disease, condition, or clinical finding."} ;; "condition"

(declare-const patient_has_finding_of_disease_condition_finding_now@@precludes_compliance_with_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding that precludes compliance with the study.","when_to_set_to_false":"Set to false if the patient currently has a disease, condition, or clinical finding, but it does not preclude compliance with the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the condition precludes compliance with the study.","meaning":"Boolean indicating whether the patient's current disease, condition, or clinical finding precludes compliance with the study."} ;; "condition which precludes compliance with the study"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@precludes_compliance_with_study
      patient_has_finding_of_disease_condition_finding_now)
:named REQ3_AUXILIARY0)) ;; "condition which precludes compliance with the study""

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_disease_condition_finding_now@@precludes_compliance_with_study)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any condition which precludes compliance with the study."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_autoimmune_connective_tissue_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with autoimmune connective tissue disorder at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with autoimmune connective tissue disorder at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with autoimmune connective tissue disorder.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of autoimmune connective tissue disorder in their history."} ;; "autoimmune connective tissue disease"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_autoimmune_connective_tissue_disorder_inthehistory)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of pre-existing autoimmune connective tissue disease."

(assert
(! (not patient_has_diagnosis_of_autoimmune_connective_tissue_disorder_inthehistory)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has presence of pre-existing autoimmune connective tissue disease."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_used_prescription_weight_reduction_medication_within_30_days_of_screening_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used prescription weight reduction medication within thirty days prior to the screening visit.","when_to_set_to_false":"Set to false if the patient has not used prescription weight reduction medication within thirty days prior to the screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used prescription weight reduction medication within thirty days prior to the screening visit.","meaning":"Boolean indicating whether the patient has used prescription weight reduction medication within thirty days prior to the screening visit."} ;; "The patient has used prescription weight reduction medication within thirty days of the screening visit."
(declare-const patient_has_used_prescription_weight_reduction_medication_during_study_participation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used prescription weight reduction medication during the duration of study participation.","when_to_set_to_false":"Set to false if the patient has not used prescription weight reduction medication during the duration of study participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used prescription weight reduction medication during the duration of study participation.","meaning":"Boolean indicating whether the patient has used prescription weight reduction medication during the duration of study participation."} ;; "The patient has used prescription weight reduction medication during the duration of study participation."
(declare-const patient_has_used_over_the_counter_weight_reduction_medication_within_30_days_of_screening_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used over the counter weight reduction medication within thirty days prior to the screening visit.","when_to_set_to_false":"Set to false if the patient has not used over the counter weight reduction medication within thirty days prior to the screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used over the counter weight reduction medication within thirty days prior to the screening visit.","meaning":"Boolean indicating whether the patient has used over the counter weight reduction medication within thirty days prior to the screening visit."} ;; "The patient has used over the counter weight reduction medication within thirty days of the screening visit."
(declare-const patient_has_used_over_the_counter_weight_reduction_medication_during_study_participation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used over the counter weight reduction medication during the duration of study participation.","when_to_set_to_false":"Set to false if the patient has not used over the counter weight reduction medication during the duration of study participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used over the counter weight reduction medication during the duration of study participation.","meaning":"Boolean indicating whether the patient has used over the counter weight reduction medication during the duration of study participation."} ;; "The patient has used over the counter weight reduction medication during the duration of study participation."
(declare-const patient_has_used_weight_reduction_supplement_within_30_days_of_screening_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used weight reduction supplement within thirty days prior to the screening visit.","when_to_set_to_false":"Set to false if the patient has not used weight reduction supplement within thirty days prior to the screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used weight reduction supplement within thirty days prior to the screening visit.","meaning":"Boolean indicating whether the patient has used weight reduction supplement within thirty days prior to the screening visit."} ;; "The patient has used weight reduction supplement within thirty days of the screening visit."
(declare-const patient_has_used_weight_reduction_supplement_during_study_participation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used weight reduction supplement during the duration of study participation.","when_to_set_to_false":"Set to false if the patient has not used weight reduction supplement during the duration of study participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used weight reduction supplement during the duration of study participation.","meaning":"Boolean indicating whether the patient has used weight reduction supplement during the duration of study participation."} ;; "The patient has used weight reduction supplement during the duration of study participation."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_used_prescription_weight_reduction_medication_within_30_days_of_screening_visit)
:named REQ5_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has used prescription weight reduction medication within thirty days of the screening visit."

(assert
(! (not patient_has_used_prescription_weight_reduction_medication_during_study_participation)
:named REQ5_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has used prescription weight reduction medication during the duration of study participation."

(assert
(! (not patient_has_used_over_the_counter_weight_reduction_medication_within_30_days_of_screening_visit)
:named REQ5_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has used over the counter weight reduction medication within thirty days of the screening visit."

(assert
(! (not patient_has_used_over_the_counter_weight_reduction_medication_during_study_participation)
:named REQ5_COMPONENT3_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has used over the counter weight reduction medication during the duration of study participation."

(assert
(! (not patient_has_used_weight_reduction_supplement_within_30_days_of_screening_visit)
:named REQ5_COMPONENT4_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has used weight reduction supplement within thirty days of the screening visit."

(assert
(! (not patient_has_used_weight_reduction_supplement_during_study_participation)
:named REQ5_COMPONENT5_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has used weight reduction supplement during the duration of study participation."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a psychiatric disorder (mental disorder).","when_to_set_to_false":"Set to false if the patient currently does not have a psychiatric disorder (mental disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a psychiatric disorder (mental disorder).","meaning":"Boolean indicating whether the patient currently has a psychiatric disorder (mental disorder) now."} ;; "psychiatric disorder"
(declare-const patient_has_finding_of_mental_disorder_now@@may_affect_compliance_with_clinical_trial Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a psychiatric disorder (mental disorder) and that disorder may affect compliance with the clinical trial.","when_to_set_to_false":"Set to false if the patient currently has a psychiatric disorder (mental disorder) but it does not affect compliance with the clinical trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the psychiatric disorder may affect compliance with the clinical trial.","meaning":"Boolean indicating whether the patient's current psychiatric disorder may affect compliance with the clinical trial."} ;; "psychiatric disorder that may affect compliance with the clinical trial"
(declare-const patient_has_finding_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dementia.","when_to_set_to_false":"Set to false if the patient currently does not have dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dementia.","meaning":"Boolean indicating whether the patient currently has dementia now."} ;; "dementia"
(declare-const patient_has_finding_of_dementia_now@@may_affect_compliance_with_clinical_trial Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dementia and that dementia may affect compliance with the clinical trial.","when_to_set_to_false":"Set to false if the patient currently has dementia but it does not affect compliance with the clinical trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dementia may affect compliance with the clinical trial.","meaning":"Boolean indicating whether the patient's current dementia may affect compliance with the clinical trial."} ;; "dementia that may affect compliance with the clinical trial"
(declare-const patient_has_finding_of_active_psychosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has active psychosis.","when_to_set_to_false":"Set to false if the patient currently does not have active psychosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has active psychosis.","meaning":"Boolean indicating whether the patient currently has active psychosis now."} ;; "active psychosis"
(declare-const patient_has_finding_of_severe_depression_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe depression.","when_to_set_to_false":"Set to false if the patient currently does not have severe depression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe depression.","meaning":"Boolean indicating whether the patient currently has severe depression now."} ;; "severe depression"
(declare-const patient_number_of_antidepressant_medications_now Real) ;; {"when_to_set_to_value":"Set to the number of antidepressant medications the patient is currently taking.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many antidepressant medications the patient is currently taking.","meaning":"Numeric value indicating the number of antidepressant medications the patient is currently taking now."} ;; "severe depression requiring more than two medications"
(declare-const patient_has_finding_of_history_of_suicide_attempt Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of suicide attempt.","when_to_set_to_false":"Set to false if the patient does not have a history of suicide attempt.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of suicide attempt.","meaning":"Boolean indicating whether the patient has a history of suicide attempt."} ;; "history of suicide attempt"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_dementia_now@@may_affect_compliance_with_clinical_trial
           patient_has_finding_of_active_psychosis_now
           (and patient_has_finding_of_severe_depression_now
                (> patient_number_of_antidepressant_medications_now 2))
           patient_has_finding_of_history_of_suicide_attempt)
        patient_has_finding_of_mental_disorder_now@@may_affect_compliance_with_clinical_trial)
   :named REQ6_AUXILIARY0)) ;; "with non-exhaustive examples (dementia, active psychosis, severe depression requiring more than two medications, history of suicide attempt)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_mental_disorder_now@@may_affect_compliance_with_clinical_trial
       patient_has_finding_of_mental_disorder_now)
   :named REQ6_AUXILIARY1)) ;; "psychiatric disorder that may affect compliance with the clinical trial"

(assert
(! (=> patient_has_finding_of_dementia_now@@may_affect_compliance_with_clinical_trial
       patient_has_finding_of_dementia_now)
   :named REQ6_AUXILIARY2)) ;; "dementia that may affect compliance with the clinical trial"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_mental_disorder_now@@may_affect_compliance_with_clinical_trial)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has psychiatric disorder that may affect compliance with the clinical trial with non-exhaustive examples (dementia, active psychosis, severe depression requiring more than two medications, history of suicide attempt)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_disease_condition_finding_now@@places_patient_at_undue_risk_for_procedure_surgeons_discretion Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding that places the patient at undue risk for the procedure, as determined by the surgeon's discretion.","when_to_set_to_false":"Set to false if the patient currently has a disease, condition, or clinical finding but it does not place the patient at undue risk for the procedure, or if the surgeon's discretion does not indicate undue risk.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's condition places them at undue risk for the procedure (surgeon's discretion).","meaning":"Boolean indicating whether the patient's current disease, condition, or clinical finding places them at undue risk for the procedure, as determined by the surgeon's discretion."} ;; "any condition which places the patient at undue risk for the procedure (surgeon's discretion)"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_disease_condition_finding_now@@places_patient_at_undue_risk_for_procedure_surgeons_discretion)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any condition which places the patient at undue risk for the procedure (surgeon's discretion)."
