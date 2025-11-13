;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of mental disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of mental disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of mental disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of mental disorder."} ;; "mental illness"
(declare-const patient_lacks_ability_to_receive_and_utilize_informed_consent_process_due_to_mental_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently lacks the ability to receive and utilize the informed consent process due to mental illness.","when_to_set_to_false":"Set to false if the patient currently does not lack the ability to receive and utilize the informed consent process due to mental illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently lacks the ability to receive and utilize the informed consent process due to mental illness.","meaning":"Boolean indicating whether the patient currently lacks the ability to receive and utilize the informed consent process due to mental illness."} ;; "the patient lacks the ability to receive and utilize the informed consent process due to mental illness"
(declare-const patient_lacks_capacity_to_make_medical_decisions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently lacks the capacity to make medical decisions.","when_to_set_to_false":"Set to false if the patient currently has the capacity to make medical decisions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently lacks the capacity to make medical decisions.","meaning":"Boolean indicating whether the patient currently lacks the capacity to make medical decisions."} ;; "the patient lacks capacity to make medical decisions"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (and patient_lacks_capacity_to_make_medical_decisions_now
               patient_lacks_ability_to_receive_and_utilize_informed_consent_process_due_to_mental_illness_now))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient lacks capacity to make medical decisions) AND (the patient lacks the ability to receive and utilize the informed consent process due to mental illness)."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_lacks_ability_to_receive_and_utilize_informed_consent_process_due_to_mental_illness_now)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is incapacitated by mental illness."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_at_risk_for_suicide_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered at risk for suicide.","when_to_set_to_false":"Set to false if the patient is currently not considered at risk for suicide.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently at risk for suicide.","meaning":"Boolean indicating whether the patient is currently at risk for suicide."} ;; "risk of suicide"
(declare-const patient_has_finding_of_at_risk_for_suicide_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current risk for suicide is considered significant.","when_to_set_to_false":"Set to false if the patient's current risk for suicide is not considered significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current risk for suicide is significant.","meaning":"Boolean indicating whether the patient's current risk for suicide is significant."} ;; "significant risk of suicide"
(declare-const patient_has_finding_of_at_risk_for_suicide_now@@determined_by_study_team Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current risk for suicide is determined by the study team.","when_to_set_to_false":"Set to false if the patient's current risk for suicide is not determined by the study team.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the study team determined the patient's current risk for suicide.","meaning":"Boolean indicating whether the patient's current risk for suicide is determined by the study team."} ;; "as determined by the study team"
(declare-const patient_has_finding_of_at_risk_for_suicide_now@@in_acute_setting Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current risk for suicide applies in the context of this acute setting.","when_to_set_to_false":"Set to false if the patient's current risk for suicide does not apply in the context of this acute setting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current risk for suicide applies in the context of this acute setting.","meaning":"Boolean indicating whether the patient's current risk for suicide applies in the context of this acute setting."} ;; "in this acute setting"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_at_risk_for_suicide_now@@significant
       patient_has_finding_of_at_risk_for_suicide_now)
   :named REQ2_AUXILIARY0)) ;; "significant risk of suicide"

(assert
(! (=> patient_has_finding_of_at_risk_for_suicide_now@@determined_by_study_team
       patient_has_finding_of_at_risk_for_suicide_now)
   :named REQ2_AUXILIARY1)) ;; "as determined by the study team"

(assert
(! (=> patient_has_finding_of_at_risk_for_suicide_now@@in_acute_setting
       patient_has_finding_of_at_risk_for_suicide_now)
   :named REQ2_AUXILIARY2)) ;; "in this acute setting"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT be a significant risk of suicide as determined by the study team in this acute setting
(assert
(! (not (and patient_has_finding_of_at_risk_for_suicide_now@@significant
             patient_has_finding_of_at_risk_for_suicide_now@@determined_by_study_team
             patient_has_finding_of_at_risk_for_suicide_now@@in_acute_setting))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a significant risk of suicide as determined by the study team in this acute setting."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_recently_started_weight_loss_program Bool) ;; {"when_to_set_to_true":"Set to true if the patient has recently started a weight loss program.","when_to_set_to_false":"Set to false if the patient has not recently started a weight loss program.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has recently started a weight loss program.","meaning":"Boolean indicating whether the patient has recently started a weight loss program."} ;; "the patient has recently started a weight loss program"
(declare-const patient_has_recently_started_exercise_program Bool) ;; {"when_to_set_to_true":"Set to true if the patient has recently started an exercise program.","when_to_set_to_false":"Set to false if the patient has not recently started an exercise program.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has recently started an exercise program.","meaning":"Boolean indicating whether the patient has recently started an exercise program."} ;; "the patient has recently started an exercise program"
(declare-const patient_has_finding_of_insulin_resistance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of insulin resistance.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of insulin resistance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has insulin resistance.","meaning":"Boolean indicating whether the patient currently has insulin resistance."} ;; "the patient is taking an insulin resistance improving drug"
(declare-const patient_has_finding_of_insulin_resistance_now@@improved_by_drug_patient_is_taking_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has insulin resistance and is currently taking a drug intended to improve insulin resistance.","when_to_set_to_false":"Set to false if the patient currently has insulin resistance but is not currently taking a drug intended to improve it.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a drug intended to improve insulin resistance.","meaning":"Boolean indicating whether the patient's current insulin resistance is being improved by a drug the patient is currently taking."} ;; "the patient is taking an insulin resistance improving drug"
(declare-const patient_plans_to_start_weight_loss_program_upon_discharge Bool) ;; {"when_to_set_to_true":"Set to true if the patient plans to start a weight loss program upon discharge.","when_to_set_to_false":"Set to false if the patient does not plan to start a weight loss program upon discharge.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient plans to start a weight loss program upon discharge.","meaning":"Boolean indicating whether the patient plans to start a weight loss program upon discharge."} ;; "the patient plans to start a weight loss program upon discharge"
(declare-const patient_plans_to_start_exercise_program_upon_discharge Bool) ;; {"when_to_set_to_true":"Set to true if the patient plans to start an exercise program upon discharge.","when_to_set_to_false":"Set to false if the patient does not plan to start an exercise program upon discharge.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient plans to start an exercise program upon discharge.","meaning":"Boolean indicating whether the patient plans to start an exercise program upon discharge."} ;; "the patient plans to start an exercise program upon discharge"
(declare-const patient_has_finding_of_insulin_resistance_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is planned to have the clinical finding of insulin resistance in the future (e.g., upon discharge).","when_to_set_to_false":"Set to false if the patient is not planned to have the clinical finding of insulin resistance in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is planned to have the clinical finding of insulin resistance in the future.","meaning":"Boolean indicating whether the patient is planned to have insulin resistance in the future."} ;; "the patient plans to take an insulin resistance improving drug upon discharge"
(declare-const patient_has_finding_of_insulin_resistance_inthefuture@@planned_to_be_improved_by_drug_upon_discharge Bool) ;; {"when_to_set_to_true":"Set to true if the patient is planned to have insulin resistance in the future and is planned to take a drug upon discharge intended to improve insulin resistance.","when_to_set_to_false":"Set to false if the patient is planned to have insulin resistance in the future but is not planned to take a drug upon discharge intended to improve it.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is planned to take a drug upon discharge intended to improve insulin resistance.","meaning":"Boolean indicating whether the patient's planned future insulin resistance is planned to be improved by a drug upon discharge."} ;; "the patient plans to take an insulin resistance improving drug upon discharge"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable (current insulin resistance improved by drug)
(assert
(! (=> patient_has_finding_of_insulin_resistance_now@@improved_by_drug_patient_is_taking_now
       patient_has_finding_of_insulin_resistance_now)
:named REQ3_AUXILIARY0)) ;; "the patient is taking an insulin resistance improving drug"

;; Qualifier variable implies corresponding stem variable (future insulin resistance planned to be improved by drug upon discharge)
(assert
(! (=> patient_has_finding_of_insulin_resistance_inthefuture@@planned_to_be_improved_by_drug_upon_discharge
       patient_has_finding_of_insulin_resistance_inthefuture)
:named REQ3_AUXILIARY1)) ;; "the patient plans to take an insulin resistance improving drug upon discharge"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: recently started weight loss program
(assert
(! (not patient_has_recently_started_weight_loss_program)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has recently started a weight loss program"

;; Exclusion: recently started exercise program
(assert
(! (not patient_has_recently_started_exercise_program)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has recently started an exercise program"

;; Exclusion: currently taking an insulin resistance improving drug
(assert
(! (not patient_has_finding_of_insulin_resistance_now@@improved_by_drug_patient_is_taking_now)
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient is taking an insulin resistance improving drug"

;; Exclusion: plans to start weight loss program upon discharge
(assert
(! (not patient_plans_to_start_weight_loss_program_upon_discharge)
:named REQ3_COMPONENT3_OTHER_REQUIREMENTS)) ;; "the patient plans to start a weight loss program upon discharge"

;; Exclusion: plans to start exercise program upon discharge
(assert
(! (not patient_plans_to_start_exercise_program_upon_discharge)
:named REQ3_COMPONENT4_OTHER_REQUIREMENTS)) ;; "the patient plans to start an exercise program upon discharge"

;; Exclusion: plans to take an insulin resistance improving drug upon discharge
(assert
(! (not patient_has_finding_of_insulin_resistance_inthefuture@@planned_to_be_improved_by_drug_upon_discharge)
:named REQ3_COMPONENT5_OTHER_REQUIREMENTS)) ;; "the patient plans to take an insulin resistance improving drug upon discharge"

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_weight_increased_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of weight gain.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of weight gain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of weight gain.","meaning":"Boolean indicating whether the patient currently has weight gain."} ;; "weight gain"
(declare-const patient_has_finding_of_weight_increased_now@@induced_by_co_morbid_medical_problem Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current weight gain is induced by a co-morbid medical problem.","when_to_set_to_false":"Set to false if the patient's current weight gain is not induced by a co-morbid medical problem.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current weight gain is induced by a co-morbid medical problem.","meaning":"Boolean indicating whether the patient's current weight gain is induced by a co-morbid medical problem."} ;; "co-morbid medical problem thought to induce weight gain"
(declare-const patient_has_finding_of_weight_decreased_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of decreased weight (difficulty losing weight).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of decreased weight (difficulty losing weight).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of decreased weight (difficulty losing weight).","meaning":"Boolean indicating whether the patient currently has decreased weight (difficulty losing weight)."} ;; "lose weight"
(declare-const patient_has_finding_of_weight_decreased_now@@due_to_co_morbid_medical_problem Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current difficulty losing weight is due to a co-morbid medical problem.","when_to_set_to_false":"Set to false if the patient's current difficulty losing weight is not due to a co-morbid medical problem.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current difficulty losing weight is due to a co-morbid medical problem.","meaning":"Boolean indicating whether the patient's current difficulty losing weight is due to a co-morbid medical problem."} ;; "co-morbid medical problem thought to make it difficult to lose weight"
(declare-const patient_has_finding_of_hypothyroidism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypothyroidism.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypothyroidism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hypothyroidism.","meaning":"Boolean indicating whether the patient currently has hypothyroidism."} ;; "hypothyroid disorder"
(declare-const patient_has_finding_of_hypercortisolism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypercortisolism.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypercortisolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hypercortisolism.","meaning":"Boolean indicating whether the patient currently has hypercortisolism."} ;; "hypercortisolism"
(declare-const patient_has_finding_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has diabetes mellitus."} ;; "diabetes mellitus"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive examples imply umbrella term (induce weight gain)
(assert
(! (=> (or patient_has_finding_of_hypothyroidism_now
          patient_has_finding_of_hypercortisolism_now
          patient_has_finding_of_diabetes_mellitus_now)
    patient_has_finding_of_weight_increased_now@@induced_by_co_morbid_medical_problem)
:named REQ4_AUXILIARY0)) ;; "with non-exhaustive examples (hypothyroid disorder, hypercortisolism, diabetes mellitus)" for induce weight gain

;; Non-exhaustive examples imply umbrella term (make it difficult to lose weight)
(assert
(! (=> (or patient_has_finding_of_hypothyroidism_now
          patient_has_finding_of_hypercortisolism_now
          patient_has_finding_of_diabetes_mellitus_now)
    patient_has_finding_of_weight_decreased_now@@due_to_co_morbid_medical_problem)
:named REQ4_AUXILIARY1)) ;; "with non-exhaustive examples (hypothyroid disorder, hypercortisolism, diabetes mellitus)" for make it difficult to lose weight

;; Qualifier variables imply corresponding stem variables (induce weight gain)
(assert
(! (=> patient_has_finding_of_weight_increased_now@@induced_by_co_morbid_medical_problem
    patient_has_finding_of_weight_increased_now)
:named REQ4_AUXILIARY2)) ;; "co-morbid medical problem thought to induce weight gain"

;; Qualifier variables imply corresponding stem variables (make it difficult to lose weight)
(assert
(! (=> patient_has_finding_of_weight_decreased_now@@due_to_co_morbid_medical_problem
    patient_has_finding_of_weight_decreased_now)
:named REQ4_AUXILIARY3)) ;; "co-morbid medical problem thought to make it difficult to lose weight"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient must NOT have a co-morbid medical problem thought to induce weight gain
(assert
(! (not patient_has_finding_of_weight_increased_now@@induced_by_co_morbid_medical_problem)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a co-morbid medical problem thought to induce weight gain with non-exhaustive examples (hypothyroid disorder, hypercortisolism, diabetes mellitus)."

;; Exclusion: patient must NOT have a co-morbid medical problem thought to make it difficult to lose weight
(assert
(! (not patient_has_finding_of_weight_decreased_now@@due_to_co_morbid_medical_problem)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a co-morbid medical problem thought to make it difficult to lose weight with non-exhaustive examples (hypothyroid disorder, hypercortisolism, diabetes mellitus)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_body_weight_value_recorded_inthepast2months_withunit_kg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body weight was recorded within the past 2 months in kilograms.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's body weight recorded within the past 2 months (kg)."} ;; "weight"

(declare-const patient_body_weight_value_recorded_inthepast2months_withunit_kg@@lost_from_any_weight_loss_program Bool) ;; {"when_to_set_to_true":"Set to true if the body weight loss within the past 2 months was due to any weight loss program.","when_to_set_to_false":"Set to false if the body weight loss within the past 2 months was not due to any weight loss program.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the body weight loss was due to any weight loss program.","meaning":"Boolean indicating whether the body weight loss within the past 2 months was from any weight loss program."} ;; "lost a significant amount of weight from any weight loss program"

(declare-const patient_body_weight_value_recorded_inthepast2months_withunit_kg@@amount_lost_was_significant Bool) ;; {"when_to_set_to_true":"Set to true if the amount of body weight lost within the past 2 months is considered significant.","when_to_set_to_false":"Set to false if the amount of body weight lost within the past 2 months is not considered significant.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the amount lost is significant.","meaning":"Boolean indicating whether the amount of body weight lost within the past 2 months is significant."} ;; "lost a significant amount of weight"

(declare-const patient_body_weight_value_recorded_inthepast2months_withunit_kg@@lost_from_any_weight_loss_agent Bool) ;; {"when_to_set_to_true":"Set to true if the body weight loss within the past 2 months was due to any weight loss agent.","when_to_set_to_false":"Set to false if the body weight loss within the past 2 months was not due to any weight loss agent.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the body weight loss was due to any weight loss agent.","meaning":"Boolean indicating whether the body weight loss within the past 2 months was from any weight loss agent."} ;; "lost a significant amount of weight from any weight loss agent"

(declare-const patient_body_weight_value_recorded_inthepast2months_withunit_kg@@lost_from_any_dietary_medication Bool) ;; {"when_to_set_to_true":"Set to true if the body weight loss within the past 2 months was due to any dietary medication.","when_to_set_to_false":"Set to false if the body weight loss within the past 2 months was not due to any dietary medication.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the body weight loss was due to any dietary medication.","meaning":"Boolean indicating whether the body weight loss within the past 2 months was from any dietary medication."} ;; "lost a significant amount of weight from any dietary medication"

(declare-const patient_body_weight_value_recorded_inthepast2months_withunit_kg@@gained_from_any_weight_loss_program Bool) ;; {"when_to_set_to_true":"Set to true if the body weight gain within the past 2 months was due to any weight loss program.","when_to_set_to_false":"Set to false if the body weight gain within the past 2 months was not due to any weight loss program.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the body weight gain was due to any weight loss program.","meaning":"Boolean indicating whether the body weight gain within the past 2 months was from any weight loss program."} ;; "gained a significant amount of weight from any weight loss program"

(declare-const patient_body_weight_value_recorded_inthepast2months_withunit_kg@@amount_gained_was_significant Bool) ;; {"when_to_set_to_true":"Set to true if the amount of body weight gained within the past 2 months is considered significant.","when_to_set_to_false":"Set to false if the amount of body weight gained within the past 2 months is not considered significant.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the amount gained is significant.","meaning":"Boolean indicating whether the amount of body weight gained within the past 2 months is significant."} ;; "gained a significant amount of weight"

(declare-const patient_body_weight_value_recorded_inthepast2months_withunit_kg@@gained_from_any_weight_loss_agent Bool) ;; {"when_to_set_to_true":"Set to true if the body weight gain within the past 2 months was due to any weight loss agent.","when_to_set_to_false":"Set to false if the body weight gain within the past 2 months was not due to any weight loss agent.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the body weight gain was due to any weight loss agent.","meaning":"Boolean indicating whether the body weight gain within the past 2 months was from any weight loss agent."} ;; "gained a significant amount of weight from any weight loss agent"

(declare-const patient_body_weight_value_recorded_inthepast2months_withunit_kg@@gained_from_any_dietary_medication Bool) ;; {"when_to_set_to_true":"Set to true if the body weight gain within the past 2 months was due to any dietary medication.","when_to_set_to_false":"Set to false if the body weight gain within the past 2 months was not due to any dietary medication.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the body weight gain was due to any dietary medication.","meaning":"Boolean indicating whether the body weight gain within the past 2 months was from any dietary medication."} ;; "gained a significant amount of weight from any dietary medication"

(declare-const patient_has_finding_of_weight_decreased_inthepast2months Bool) ;; {"when_to_set_to_true":"Set to true if the patient experienced weight loss within the past 2 months.","when_to_set_to_false":"Set to false if the patient did not experience weight loss within the past 2 months.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the patient experienced weight loss within the past 2 months.","meaning":"Boolean indicating whether the patient experienced weight loss within the past 2 months."} ;; "weight loss in the past 2 months"

(declare-const patient_has_finding_of_weight_decreased_inthepast2months@@from_any_weight_loss_program Bool) ;; {"when_to_set_to_true":"Set to true if the weight loss within the past 2 months was from any weight loss program.","when_to_set_to_false":"Set to false if the weight loss within the past 2 months was not from any weight loss program.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the weight loss was from any weight loss program.","meaning":"Boolean indicating whether the weight loss within the past 2 months was from any weight loss program."} ;; "weight loss from any weight loss program in the past 2 months"

(declare-const patient_has_finding_of_weight_decreased_inthepast2months@@amount_was_significant Bool) ;; {"when_to_set_to_true":"Set to true if the amount of weight lost within the past 2 months is considered significant.","when_to_set_to_false":"Set to false if the amount of weight lost within the past 2 months is not considered significant.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the amount lost is significant.","meaning":"Boolean indicating whether the amount of weight lost within the past 2 months is significant."} ;; "significant weight loss in the past 2 months"

(declare-const patient_has_finding_of_weight_decreased_inthepast2months@@from_any_weight_loss_agent Bool) ;; {"when_to_set_to_true":"Set to true if the weight loss within the past 2 months was from any weight loss agent.","when_to_set_to_false":"Set to false if the weight loss within the past 2 months was not from any weight loss agent.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the weight loss was from any weight loss agent.","meaning":"Boolean indicating whether the weight loss within the past 2 months was from any weight loss agent."} ;; "weight loss from any weight loss agent in the past 2 months"

(declare-const patient_has_finding_of_weight_decreased_inthepast2months@@from_any_dietary_medication Bool) ;; {"when_to_set_to_true":"Set to true if the weight loss within the past 2 months was from any dietary medication.","when_to_set_to_false":"Set to false if the weight loss within the past 2 months was not from any dietary medication.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the weight loss was from any dietary medication.","meaning":"Boolean indicating whether the weight loss within the past 2 months was from any dietary medication."} ;; "weight loss from any dietary medication in the past 2 months"

(declare-const patient_has_finding_of_weight_decreased_inthepast2months@@gained_from_any_weight_loss_program Bool) ;; {"when_to_set_to_true":"Set to true if the weight gain within the past 2 months was from any weight loss program.","when_to_set_to_false":"Set to false if the weight gain within the past 2 months was not from any weight loss program.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the weight gain was from any weight loss program.","meaning":"Boolean indicating whether the weight gain within the past 2 months was from any weight loss program."} ;; "weight gain from any weight loss program in the past 2 months"

(declare-const patient_has_finding_of_weight_decreased_inthepast2months@@gained_from_any_weight_loss_agent Bool) ;; {"when_to_set_to_true":"Set to true if the weight gain within the past 2 months was from any weight loss agent.","when_to_set_to_false":"Set to false if the weight gain within the past 2 months was not from any weight loss agent.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the weight gain was from any weight loss agent.","meaning":"Boolean indicating whether the weight gain within the past 2 months was from any weight loss agent."} ;; "weight gain from any weight loss agent in the past 2 months"

(declare-const patient_has_finding_of_weight_decreased_inthepast2months@@gained_from_any_dietary_medication Bool) ;; {"when_to_set_to_true":"Set to true if the weight gain within the past 2 months was from any dietary medication.","when_to_set_to_false":"Set to false if the weight gain within the past 2 months was not from any dietary medication.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the weight gain was from any dietary medication.","meaning":"Boolean indicating whether the weight gain within the past 2 months was from any dietary medication."} ;; "weight gain from any dietary medication in the past 2 months"

(declare-const patient_has_finding_of_weight_decreased_inthepast2months@@amount_gained_was_significant Bool) ;; {"when_to_set_to_true":"Set to true if the amount of weight gained within the past 2 months is considered significant.","when_to_set_to_false":"Set to false if the amount of weight gained within the past 2 months is not considered significant.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the amount gained is significant.","meaning":"Boolean indicating whether the amount of weight gained within the past 2 months is significant."} ;; "significant weight gain in the past 2 months"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Link qualifier variables to stem variables for weight loss
(assert
(! (=> patient_has_finding_of_weight_decreased_inthepast2months@@from_any_weight_loss_program
      patient_has_finding_of_weight_decreased_inthepast2months)
:named REQ5_AUXILIARY0)) ;; "weight loss from any weight loss program in the past 2 months"

(assert
(! (=> patient_has_finding_of_weight_decreased_inthepast2months@@from_any_weight_loss_agent
      patient_has_finding_of_weight_decreased_inthepast2months)
:named REQ5_AUXILIARY1)) ;; "weight loss from any weight loss agent in the past 2 months"

(assert
(! (=> patient_has_finding_of_weight_decreased_inthepast2months@@from_any_dietary_medication
      patient_has_finding_of_weight_decreased_inthepast2months)
:named REQ5_AUXILIARY2)) ;; "weight loss from any dietary medication in the past 2 months"

(assert
(! (=> patient_has_finding_of_weight_decreased_inthepast2months@@amount_was_significant
      patient_has_finding_of_weight_decreased_inthepast2months)
:named REQ5_AUXILIARY3)) ;; "significant weight loss in the past 2 months"

;; Link qualifier variables to stem variables for weight gain
(assert
(! (=> patient_has_finding_of_weight_decreased_inthepast2months@@gained_from_any_weight_loss_program
      patient_has_finding_of_weight_decreased_inthepast2months)
:named REQ5_AUXILIARY4)) ;; "weight gain from any weight loss program in the past 2 months"

(assert
(! (=> patient_has_finding_of_weight_decreased_inthepast2months@@gained_from_any_weight_loss_agent
      patient_has_finding_of_weight_decreased_inthepast2months)
:named REQ5_AUXILIARY5)) ;; "weight gain from any weight loss agent in the past 2 months"

(assert
(! (=> patient_has_finding_of_weight_decreased_inthepast2months@@gained_from_any_dietary_medication
      patient_has_finding_of_weight_decreased_inthepast2months)
:named REQ5_AUXILIARY6)) ;; "weight gain from any dietary medication in the past 2 months"

(assert
(! (=> patient_has_finding_of_weight_decreased_inthepast2months@@amount_gained_was_significant
      patient_has_finding_of_weight_decreased_inthepast2months)
:named REQ5_AUXILIARY7)) ;; "significant weight gain in the past 2 months"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient must NOT have lost a significant amount of weight from any weight loss program in the past 2 months
(assert
(! (not (and patient_has_finding_of_weight_decreased_inthepast2months@@from_any_weight_loss_program
             patient_has_finding_of_weight_decreased_inthepast2months@@amount_was_significant))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "lost a significant amount of weight from any weight loss program in the last 2 months"

;; Exclusion: patient must NOT have lost a significant amount of weight from any weight loss agent in the past 2 months
(assert
(! (not (and patient_has_finding_of_weight_decreased_inthepast2months@@from_any_weight_loss_agent
             patient_has_finding_of_weight_decreased_inthepast2months@@amount_was_significant))
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "lost a significant amount of weight from any weight loss agent in the last 2 months"

;; Exclusion: patient must NOT have lost a significant amount of weight from any dietary medication in the past 2 months
(assert
(! (not (and patient_has_finding_of_weight_decreased_inthepast2months@@from_any_dietary_medication
             patient_has_finding_of_weight_decreased_inthepast2months@@amount_was_significant))
:named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "lost a significant amount of weight from any dietary medication in the last 2 months"

;; Exclusion: patient must NOT have gained a significant amount of weight from any weight loss program in the past 2 months
(assert
(! (not (and patient_has_finding_of_weight_decreased_inthepast2months@@gained_from_any_weight_loss_program
             patient_has_finding_of_weight_decreased_inthepast2months@@amount_gained_was_significant))
:named REQ5_COMPONENT3_OTHER_REQUIREMENTS)) ;; "gained a significant amount of weight from any weight loss program in the last 2 months"

;; Exclusion: patient must NOT have gained a significant amount of weight from any weight loss agent in the past 2 months
(assert
(! (not (and patient_has_finding_of_weight_decreased_inthepast2months@@gained_from_any_weight_loss_agent
             patient_has_finding_of_weight_decreased_inthepast2months@@amount_gained_was_significant))
:named REQ5_COMPONENT4_OTHER_REQUIREMENTS)) ;; "gained a significant amount of weight from any weight loss agent in the last 2 months"

;; Exclusion: patient must NOT have gained a significant amount of weight from any dietary medication in the past 2 months
(assert
(! (not (and patient_has_finding_of_weight_decreased_inthepast2months@@gained_from_any_dietary_medication
             patient_has_finding_of_weight_decreased_inthepast2months@@amount_gained_was_significant))
:named REQ5_COMPONENT5_OTHER_REQUIREMENTS)) ;; "gained a significant amount of weight from any dietary medication in the last 2 months"

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_used_investigational_drug_within_1_month_before_screening_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used an investigational drug within 1 month before the screening visit.","when_to_set_to_false":"Set to false if the patient has not used an investigational drug within 1 month before the screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used an investigational drug within 1 month before the screening visit.","meaning":"Boolean indicating whether the patient has used an investigational drug within 1 month before the screening visit."} ;; "the patient has used an investigational drug within 1 month before the screening visit"

(declare-const patient_is_undergoing_clinical_trial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in a clinical trial.","when_to_set_to_false":"Set to false if the patient is currently not participating in a clinical trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in a clinical trial.","meaning":"Boolean indicating whether the patient is currently participating in a clinical trial."} ;; "the patient is participating in a concurrent clinical trial"

(declare-const patient_is_undergoing_clinical_trial_now@@concurrent_with_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in a clinical trial and the trial is concurrent with the study.","when_to_set_to_false":"Set to false if the patient is currently participating in a clinical trial but the trial is not concurrent with the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clinical trial is concurrent with the study.","meaning":"Boolean indicating whether the patient's current clinical trial participation is concurrent with the study."} ;; "the patient is participating in a concurrent clinical trial"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_undergoing_clinical_trial_now@@concurrent_with_study
       patient_is_undergoing_clinical_trial_now)
   :named REQ6_AUXILIARY0)) ;; "the patient is participating in a concurrent clinical trial"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient must NOT have used an investigational drug within 1 month before screening OR be participating in a concurrent clinical trial
(assert
(! (not (or patient_has_used_investigational_drug_within_1_month_before_screening_visit
            patient_is_undergoing_clinical_trial_now@@concurrent_with_study))
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has used an investigational drug within 1 month before the screening visit) OR (the patient is participating in a concurrent clinical trial))."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease.","when_to_set_to_false":"Set to false if the patient currently does not have any disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease.","meaning":"Boolean indicating whether the patient currently has any disease."} ;; "disorder"

(declare-const patient_has_finding_of_disease_now@@may_interfere_with_drug_absorption Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease and that disease may interfere with drug absorption.","when_to_set_to_false":"Set to false if the patient currently has any disease but it does not interfere with drug absorption, or if the patient does not have any disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's disease may interfere with drug absorption.","meaning":"Boolean indicating whether the patient currently has any disease that may interfere with drug absorption."} ;; "any disorder that may interfere with drug absorption"

(declare-const patient_has_finding_of_disease_now@@may_interfere_with_drug_distribution Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease and that disease may interfere with drug distribution.","when_to_set_to_false":"Set to false if the patient currently has any disease but it does not interfere with drug distribution, or if the patient does not have any disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's disease may interfere with drug distribution.","meaning":"Boolean indicating whether the patient currently has any disease that may interfere with drug distribution."} ;; "any disorder that may interfere with drug distribution"

(declare-const patient_has_finding_of_disease_now@@may_interfere_with_drug_metabolism Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease and that disease may interfere with drug metabolism.","when_to_set_to_false":"Set to false if the patient currently has any disease but it does not interfere with drug metabolism, or if the patient does not have any disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's disease may interfere with drug metabolism.","meaning":"Boolean indicating whether the patient currently has any disease that may interfere with drug metabolism."} ;; "any disorder that may interfere with drug metabolism"

(declare-const patient_has_finding_of_disease_now@@may_interfere_with_drug_excretion Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease and that disease may interfere with drug excretion.","when_to_set_to_false":"Set to false if the patient currently has any disease but it does not interfere with drug excretion, or if the patient does not have any disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's disease may interfere with drug excretion.","meaning":"Boolean indicating whether the patient currently has any disease that may interfere with drug excretion."} ;; "any disorder that may interfere with drug excretion"

(declare-const patient_has_finding_of_gastrointestinal_surgery_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of gastrointestinal surgery.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of gastrointestinal surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of gastrointestinal surgery.","meaning":"Boolean indicating whether the patient currently has a finding of gastrointestinal surgery."} ;; "gastrointestinal surgery"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Non-exhaustive examples: gastrointestinal surgery is an example of a disorder that may interfere with drug absorption
(assert
(! (=> patient_has_finding_of_gastrointestinal_surgery_now
      patient_has_finding_of_disease_now@@may_interfere_with_drug_absorption)
:named REQ7_AUXILIARY0)) ;; "with non-exhaustive examples (gastrointestinal surgery)" for absorption

;; Non-exhaustive examples: gastrointestinal surgery is an example of a disorder that may interfere with drug distribution
(assert
(! (=> patient_has_finding_of_gastrointestinal_surgery_now
      patient_has_finding_of_disease_now@@may_interfere_with_drug_distribution)
:named REQ7_AUXILIARY1)) ;; "with non-exhaustive examples (gastrointestinal surgery)" for distribution

;; Non-exhaustive examples: gastrointestinal surgery is an example of a disorder that may interfere with drug metabolism
(assert
(! (=> patient_has_finding_of_gastrointestinal_surgery_now
      patient_has_finding_of_disease_now@@may_interfere_with_drug_metabolism)
:named REQ7_AUXILIARY2)) ;; "with non-exhaustive examples (gastrointestinal surgery)" for metabolism

;; Non-exhaustive examples: gastrointestinal surgery is an example of a disorder that may interfere with drug excretion
(assert
(! (=> patient_has_finding_of_gastrointestinal_surgery_now
      patient_has_finding_of_disease_now@@may_interfere_with_drug_excretion)
:named REQ7_AUXILIARY3)) ;; "with non-exhaustive examples (gastrointestinal surgery)" for excretion

;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_now@@may_interfere_with_drug_absorption
      patient_has_finding_of_disease_now)
:named REQ7_AUXILIARY4)) ;; "any disorder that may interfere with drug absorption" implies "disorder"

(assert
(! (=> patient_has_finding_of_disease_now@@may_interfere_with_drug_distribution
      patient_has_finding_of_disease_now)
:named REQ7_AUXILIARY5)) ;; "any disorder that may interfere with drug distribution" implies "disorder"

(assert
(! (=> patient_has_finding_of_disease_now@@may_interfere_with_drug_metabolism
      patient_has_finding_of_disease_now)
:named REQ7_AUXILIARY6)) ;; "any disorder that may interfere with drug metabolism" implies "disorder"

(assert
(! (=> patient_has_finding_of_disease_now@@may_interfere_with_drug_excretion
      patient_has_finding_of_disease_now)
:named REQ7_AUXILIARY7)) ;; "any disorder that may interfere with drug excretion" implies "disorder"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_disease_now@@may_interfere_with_drug_absorption)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any disorder that may interfere with drug absorption with non-exhaustive examples (gastrointestinal surgery)."

(assert
(! (not patient_has_finding_of_disease_now@@may_interfere_with_drug_distribution)
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any disorder that may interfere with drug distribution with non-exhaustive examples (gastrointestinal surgery)."

(assert
(! (not patient_has_finding_of_disease_now@@may_interfere_with_drug_metabolism)
:named REQ7_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any disorder that may interfere with drug metabolism with non-exhaustive examples (gastrointestinal surgery)."

(assert
(! (not patient_has_finding_of_disease_now@@may_interfere_with_drug_excretion)
:named REQ7_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any disorder that may interfere with drug excretion with non-exhaustive examples (gastrointestinal surgery)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_highly_unlikely_to_comply_with_study_protocol_as_judged_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the investigator judges that the patient is highly unlikely to comply with the study protocol.","when_to_set_to_false":"Set to false if the investigator judges that the patient is not highly unlikely to comply with the study protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator judges the patient as highly unlikely to comply with the study protocol.","meaning":"Boolean indicating whether the patient is highly unlikely to comply with the study protocol, as judged by the investigator."} ;; "the patient is highly unlikely to comply with the study protocol as judged by the investigator"
(declare-const patient_is_unreliable_in_providing_ratings_as_judged_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the investigator judges that the patient is unreliable in providing ratings.","when_to_set_to_false":"Set to false if the investigator judges that the patient is not unreliable in providing ratings.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator judges the patient as unreliable in providing ratings.","meaning":"Boolean indicating whether the patient is unreliable in providing ratings, as judged by the investigator."} ;; "the patient is unreliable in providing ratings as judged by the investigator"
(declare-const patient_is_unsuitable_for_any_reason_as_judged_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the investigator judges that the patient is unsuitable for any reason.","when_to_set_to_false":"Set to false if the investigator judges that the patient is not unsuitable for any reason.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator judges the patient as unsuitable for any reason.","meaning":"Boolean indicating whether the patient is unsuitable for any reason, as judged by the investigator."} ;; "the patient is unsuitable for any reason as judged by the investigator"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_is_highly_unlikely_to_comply_with_study_protocol_as_judged_by_investigator)
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient is highly unlikely to comply with the study protocol as judged by the investigator"
(assert
(! (not patient_is_unreliable_in_providing_ratings_as_judged_by_investigator)
    :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient is unreliable in providing ratings as judged by the investigator"
(assert
(! (not patient_is_unsuitable_for_any_reason_as_judged_by_investigator)
    :named REQ8_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient is unsuitable for any reason as judged by the investigator"

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_undergone_physical_examination_now_outcome_is_abnormal Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a physical examination now and the outcome is abnormal (clinically significant deviation from normal).","when_to_set_to_false":"Set to false if the patient has undergone a physical examination now and the outcome is not abnormal (i.e., normal or not clinically significant).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a physical examination now with abnormal outcome.","meaning":"Boolean indicating whether the patient has undergone a physical examination now and the outcome is abnormal."} ;; "clinically significant deviation from normal in the physical examination"

(declare-const patient_has_finding_of_clinically_significant_deviation_from_normal_in_medical_history_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinically significant deviation from normal in the medical history.","when_to_set_to_false":"Set to false if the patient currently does not have a clinically significant deviation from normal in the medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinically significant deviation from normal in the medical history.","meaning":"Boolean indicating whether the patient currently has a clinically significant deviation from normal in the medical history."} ;; "clinically significant deviation from normal in the medical history"

(declare-const patient_has_finding_of_clinically_significant_deviation_from_normal_in_medical_history_now@@makes_patient_medically_unstable_at_time_of_screening Bool) ;; {"when_to_set_to_true":"Set to true if the clinically significant deviation from normal in the medical history makes the patient medically unstable at the time of screening.","when_to_set_to_false":"Set to false if the clinically significant deviation from normal in the medical history does not make the patient medically unstable at the time of screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clinically significant deviation from normal in the medical history makes the patient medically unstable at the time of screening.","meaning":"Boolean indicating whether the clinically significant deviation from normal in the medical history makes the patient medically unstable at the time of screening."} ;; "which makes the patient medically unstable at time of screening"

(declare-const patient_has_finding_of_patient_s_condition_unstable_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is medically unstable now (at the time of screening).","when_to_set_to_false":"Set to false if the patient is not medically unstable now (at the time of screening).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is medically unstable now.","meaning":"Boolean indicating whether the patient is medically unstable now."} ;; "medically unstable at time of screening"

(declare-const patient_has_finding_of_patient_s_condition_unstable_now@@temporalcontext_at_time_of_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient is medically unstable now and this finding is specifically at the time of screening.","when_to_set_to_false":"Set to false if the patient is medically unstable now but not at the time of screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is medically unstable at the time of screening.","meaning":"Boolean indicating whether the patient is medically unstable now, specifically at the time of screening."} ;; "at time of screening"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_patient_s_condition_unstable_now@@temporalcontext_at_time_of_screening
      patient_has_finding_of_patient_s_condition_unstable_now)
    :named REQ9_AUXILIARY0)) ;; "at time of screening"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_clinically_significant_deviation_from_normal_in_medical_history_now@@makes_patient_medically_unstable_at_time_of_screening
      patient_has_finding_of_clinically_significant_deviation_from_normal_in_medical_history_now)
    :named REQ9_AUXILIARY1)) ;; "clinically significant deviation from normal in the medical history which makes the patient medically unstable at time of screening"

;; Non-exhaustive examples imply umbrella term (renal problem, hepatic problem are examples)
(declare-const patient_has_finding_of_renal_problem_in_medical_history_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a renal problem in the medical history.","when_to_set_to_false":"Set to false if the patient currently does not have a renal problem in the medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a renal problem in the medical history.","meaning":"Boolean indicating whether the patient currently has a renal problem in the medical history."} ;; "renal problem (example of deviation from normal in medical history)"
(declare-const patient_has_finding_of_hepatic_problem_in_medical_history_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hepatic problem in the medical history.","when_to_set_to_false":"Set to false if the patient currently does not have a hepatic problem in the medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hepatic problem in the medical history.","meaning":"Boolean indicating whether the patient currently has a hepatic problem in the medical history."} ;; "hepatic problem (example of deviation from normal in medical history)"

(assert
(! (=> (or patient_has_finding_of_renal_problem_in_medical_history_now
          patient_has_finding_of_hepatic_problem_in_medical_history_now)
      patient_has_finding_of_clinically_significant_deviation_from_normal_in_medical_history_now)
    :named REQ9_AUXILIARY2)) ;; "with non-exhaustive examples (renal problem, hepatic problem)"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Component 0: physical examination abnormality making patient unstable at screening
(assert
(! (not (and patient_has_undergone_physical_examination_now_outcome_is_abnormal
             patient_has_finding_of_patient_s_condition_unstable_now@@temporalcontext_at_time_of_screening))
    :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "clinically significant deviation from normal in the physical examination which makes the patient medically unstable at time of screening"

;; Component 1: medical history abnormality making patient unstable at screening
(assert
(! (not patient_has_finding_of_clinically_significant_deviation_from_normal_in_medical_history_now@@makes_patient_medically_unstable_at_time_of_screening)
    :named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "clinically significant deviation from normal in the medical history which makes the patient medically unstable at time of screening"

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_is_receiving_medication_now@@clearly_being_used_to_lower_weight Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving any medication and it is clearly being used to lower weight.","when_to_set_to_false":"Set to false if the patient is currently receiving medication but it is not being used to lower weight, or if the patient is not currently receiving any medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving medication that is clearly being used to lower weight.","meaning":"Boolean indicating whether the patient is currently receiving any medication that is clearly being used to lower weight."} ;; "currently receiving any medication that is clearly being used to lower weight"

(declare-const patient_is_exposed_to_orlistat_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or taking orlistat (Xenical).","when_to_set_to_false":"Set to false if the patient is not currently receiving or taking orlistat (Xenical).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving or taking orlistat (Xenical).","meaning":"Boolean indicating whether the patient is currently exposed to orlistat (Xenical)."} ;; "Xenical"

(declare-const patient_is_exposed_to_orlistat_now@@clearly_being_used_to_lower_weight Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving orlistat (Xenical) and it is clearly being used to lower weight.","when_to_set_to_false":"Set to false if the patient is currently receiving orlistat (Xenical) but it is not being used to lower weight.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the orlistat (Xenical) is being used to lower weight.","meaning":"Boolean indicating whether the patient's current orlistat (Xenical) use is clearly for the purpose of lowering weight."} ;; "Xenical clearly being used to lower weight"

(declare-const patient_is_exposed_to_metformin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or taking metformin.","when_to_set_to_false":"Set to false if the patient is not currently receiving or taking metformin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving or taking metformin.","meaning":"Boolean indicating whether the patient is currently exposed to metformin."} ;; "Metformin"

(declare-const patient_is_exposed_to_metformin_now@@clearly_being_used_to_lower_weight Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving metformin and it is clearly being used to lower weight.","when_to_set_to_false":"Set to false if the patient is currently receiving metformin but it is not being used to lower weight.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the metformin is being used to lower weight.","meaning":"Boolean indicating whether the patient's current metformin use is clearly for the purpose of lowering weight."} ;; "Metformin clearly being used to lower weight"

(declare-const patient_is_exposed_to_bupropion_hydrochloride_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or taking bupropion hydrochloride (Wellbutrin).","when_to_set_to_false":"Set to false if the patient is not currently receiving or taking bupropion hydrochloride (Wellbutrin).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving or taking bupropion hydrochloride (Wellbutrin).","meaning":"Boolean indicating whether the patient is currently exposed to bupropion hydrochloride (Wellbutrin)."} ;; "Wellbutrin"

(declare-const patient_is_exposed_to_bupropion_hydrochloride_now@@clearly_being_used_to_lower_weight Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving bupropion hydrochloride and it is clearly being used to lower weight.","when_to_set_to_false":"Set to false if the patient is currently receiving bupropion hydrochloride but it is not being used to lower weight.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the bupropion hydrochloride is being used to lower weight.","meaning":"Boolean indicating whether the patient's current bupropion hydrochloride use is clearly for the purpose of lowering weight."} ;; "Wellbutrin clearly being used to lower weight"

(declare-const patient_is_exposed_to_topiramate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or taking topiramate (Topomax).","when_to_set_to_false":"Set to false if the patient is not currently receiving or taking topiramate (Topomax).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving or taking topiramate (Topomax).","meaning":"Boolean indicating whether the patient is currently exposed to topiramate (Topomax)."} ;; "Topomax"

(declare-const patient_is_exposed_to_topiramate_now@@clearly_being_used_to_lower_weight Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving topiramate (Topomax) and it is clearly being used to lower weight.","when_to_set_to_false":"Set to false if the patient is currently receiving topiramate (Topomax) but it is not being used to lower weight.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the topiramate (Topomax) is being used to lower weight.","meaning":"Boolean indicating whether the patient's current topiramate (Topomax) use is clearly for the purpose of lowering weight."} ;; "Topomax clearly being used to lower weight"

(declare-const patient_is_exposed_to_psychostimulant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or taking a psychostimulant.","when_to_set_to_false":"Set to false if the patient is not currently receiving or taking a psychostimulant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving or taking a psychostimulant.","meaning":"Boolean indicating whether the patient is currently exposed to a psychostimulant."} ;; "psycho-stimulant medication"

(declare-const patient_is_exposed_to_psychostimulant_now@@clearly_being_used_to_lower_weight Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving a psychostimulant and it is clearly being used to lower weight.","when_to_set_to_false":"Set to false if the patient is currently receiving a psychostimulant but it is not being used to lower weight.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the psychostimulant is being used to lower weight.","meaning":"Boolean indicating whether the patient's current psychostimulant use is clearly for the purpose of lowering weight."} ;; "psycho-stimulant medication clearly being used to lower weight"

(declare-const patient_is_exposed_to_molindone_hydrochloride_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or taking molindone hydrochloride (Moban).","when_to_set_to_false":"Set to false if the patient is not currently receiving or taking molindone hydrochloride (Moban).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving or taking molindone hydrochloride (Moban).","meaning":"Boolean indicating whether the patient is currently exposed to molindone hydrochloride (Moban)."} ;; "Moban"

(declare-const patient_is_exposed_to_molindone_hydrochloride_now@@clearly_being_used_to_lower_weight Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving molindone hydrochloride and it is clearly being used to lower weight.","when_to_set_to_false":"Set to false if the patient is currently receiving molindone hydrochloride but it is not being used to lower weight.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the molindone hydrochloride is being used to lower weight.","meaning":"Boolean indicating whether the patient's current molindone hydrochloride use is clearly for the purpose of lowering weight."} ;; "Moban clearly being used to lower weight"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_is_exposed_to_orlistat_now@@clearly_being_used_to_lower_weight
           patient_is_exposed_to_metformin_now@@clearly_being_used_to_lower_weight
           patient_is_exposed_to_bupropion_hydrochloride_now@@clearly_being_used_to_lower_weight
           patient_is_exposed_to_topiramate_now@@clearly_being_used_to_lower_weight
           patient_is_exposed_to_psychostimulant_now@@clearly_being_used_to_lower_weight
           patient_is_exposed_to_molindone_hydrochloride_now@@clearly_being_used_to_lower_weight)
    patient_is_receiving_medication_now@@clearly_being_used_to_lower_weight)
:named REQ10_AUXILIARY0)) ;; "with non-exhaustive examples ((Xenical) OR (Metformin) OR (Wellbutrin) OR (Topomax) OR (psycho-stimulant medication) OR (Moban))."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_orlistat_now@@clearly_being_used_to_lower_weight
      patient_is_exposed_to_orlistat_now)
:named REQ10_AUXILIARY1)) ;; "Xenical clearly being used to lower weight"

(assert
(! (=> patient_is_exposed_to_metformin_now@@clearly_being_used_to_lower_weight
      patient_is_exposed_to_metformin_now)
:named REQ10_AUXILIARY2)) ;; "Metformin clearly being used to lower weight"

(assert
(! (=> patient_is_exposed_to_bupropion_hydrochloride_now@@clearly_being_used_to_lower_weight
      patient_is_exposed_to_bupropion_hydrochloride_now)
:named REQ10_AUXILIARY3)) ;; "Wellbutrin clearly being used to lower weight"

(assert
(! (=> patient_is_exposed_to_topiramate_now@@clearly_being_used_to_lower_weight
      patient_is_exposed_to_topiramate_now)
:named REQ10_AUXILIARY4)) ;; "Topomax clearly being used to lower weight"

(assert
(! (=> patient_is_exposed_to_psychostimulant_now@@clearly_being_used_to_lower_weight
      patient_is_exposed_to_psychostimulant_now)
:named REQ10_AUXILIARY5)) ;; "psycho-stimulant medication clearly being used to lower weight"

(assert
(! (=> patient_is_exposed_to_molindone_hydrochloride_now@@clearly_being_used_to_lower_weight
      patient_is_exposed_to_molindone_hydrochloride_now)
:named REQ10_AUXILIARY6)) ;; "Moban clearly being used to lower weight"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_is_receiving_medication_now@@clearly_being_used_to_lower_weight)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently receiving any medication that is clearly being used to lower weight with non-exhaustive examples ((Xenical) OR (Metformin) OR (Wellbutrin) OR (Topomax) OR (psycho-stimulant medication) OR (Moban))."
