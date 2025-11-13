;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_willing_to_give_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to give consent.","when_to_set_to_false":"Set to false if the patient is not willing to give consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to give consent.","meaning":"Boolean indicating whether the patient is willing to give consent."} // "To be included, the patient must be willing to give consent."
(declare-const patient_is_willing_to_comply_with_evaluation_schedule Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to comply with the evaluation schedule.","when_to_set_to_false":"Set to false if the patient is not willing to comply with the evaluation schedule.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to comply with the evaluation schedule.","meaning":"Boolean indicating whether the patient is willing to comply with the evaluation schedule."} // "To be included, the patient must be willing to comply with evaluation schedule."
(declare-const patient_is_willing_to_comply_with_treatment_schedule Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to comply with the treatment schedule.","when_to_set_to_false":"Set to false if the patient is not willing to comply with the treatment schedule.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to comply with the treatment schedule.","meaning":"Boolean indicating whether the patient is willing to comply with the treatment schedule."} // "To be included, the patient must be willing to comply with treatment schedule."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_is_willing_to_give_consent
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be willing to give consent."
(assert
  (! patient_is_willing_to_comply_with_evaluation_schedule
     :named REQ0_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be willing to comply with evaluation schedule."
(assert
  (! patient_is_willing_to_comply_with_treatment_schedule
     :named REQ0_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be willing to comply with treatment schedule."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged greater than or equal to 18 years AND aged less than or equal to 65 years"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged greater than or equal to 18 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 65)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged less than or equal to 65 years."

;; ===================== Declarations for the inclusion criteria (REQ 2) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the measured BMI value if a numeric measurement of body mass index (kg/m^2) recorded now is available.","when_to_set_to_null":"Set to null if no such BMI measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kg/m^2."} // "To be included, the patient must have body mass index greater than 27."
(declare-const patient_has_finding_of_significant_co_morbid_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has at least one significant co-morbid medical condition.","when_to_set_to_false":"Set to false if the patient currently does not have any significant co-morbid medical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any significant co-morbid medical condition.","meaning":"Boolean indicating whether the patient currently has at least one significant co-morbid medical condition."} // "To be included, the patient must have at least one significant co-morbid medical condition..."
(declare-const patient_has_finding_of_significant_co_morbid_condition_now@@expected_to_improve_with_weight_loss Bool) ;; {"when_to_set_to_true":"Set to true if the significant co-morbid medical condition present is generally expected to be improved, reversed, or resolved by weight loss.","when_to_set_to_false":"Set to false if the significant co-morbid medical condition present is not generally expected to be improved, reversed, or resolved by weight loss.","when_to_set_to_null":"Set to null if expectation of improvement with weight loss cannot be determined or is not documented.","meaning":"Boolean indicating whether the significant co-morbid medical condition present is generally expected to be improved, reversed, or resolved by weight loss."} // "...which is generally expected to be improved, reversed, or resolved by weight loss."
(declare-const patient_has_finding_of_hyperlipidemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hyperlipidemia.","when_to_set_to_false":"Set to false if the patient currently does not have hyperlipidemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hyperlipidemia.","meaning":"Boolean indicating whether the patient currently has hyperlipidemia."} // "hyperlipidemia"
(declare-const patient_has_finding_of_type_2_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has type 2 diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have type 2 diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has type 2 diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has type 2 diabetes mellitus."} // "type 2 diabetes mellitus"
(declare-const patient_has_finding_of_obstructive_sleep_apnea_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has obstructive sleep apnea syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have obstructive sleep apnea syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has obstructive sleep apnea syndrome.","meaning":"Boolean indicating whether the patient currently has obstructive sleep apnea syndrome."} // "obstructive sleep apnea"
(declare-const patient_has_finding_of_obstructive_sleep_apnea_syndrome_now@@is_mild Bool) ;; {"when_to_set_to_true":"Set to true if the obstructive sleep apnea syndrome present is mild.","when_to_set_to_false":"Set to false if the obstructive sleep apnea syndrome present is not mild.","when_to_set_to_null":"Set to null if mildness cannot be determined or is not documented.","meaning":"Boolean indicating whether the obstructive sleep apnea syndrome present is mild."} // "mild obstructive sleep apnea"
(declare-const patient_has_finding_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypertension.","meaning":"Boolean indicating whether the patient currently has hypertension."} // "hypertension"
(declare-const patient_has_finding_of_osteoarthritis_of_hip_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has osteoarthritis of the hip.","when_to_set_to_false":"Set to false if the patient currently does not have osteoarthritis of the hip.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has osteoarthritis of the hip.","meaning":"Boolean indicating whether the patient currently has osteoarthritis of the hip."} // "osteoarthritis of the hip"
(declare-const patient_has_finding_of_osteoarthritis_of_knee_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has osteoarthritis of the knee.","when_to_set_to_false":"Set to false if the patient currently does not have osteoarthritis of the knee.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has osteoarthritis of the knee.","meaning":"Boolean indicating whether the patient currently has osteoarthritis of the knee."} // "osteoarthritis of the knee"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply the umbrella term (significant co-morbid medical condition expected to improve with weight loss)
(assert
  (! (=> (or patient_has_finding_of_hyperlipidemia_now
            patient_has_finding_of_type_2_diabetes_mellitus_now
            (and patient_has_finding_of_obstructive_sleep_apnea_syndrome_now
                 patient_has_finding_of_obstructive_sleep_apnea_syndrome_now@@is_mild)
            patient_has_finding_of_hypertensive_disorder_now
            patient_has_finding_of_osteoarthritis_of_hip_now
            patient_has_finding_of_osteoarthritis_of_knee_now)
         (and patient_has_finding_of_significant_co_morbid_condition_now
              patient_has_finding_of_significant_co_morbid_condition_now@@expected_to_improve_with_weight_loss))
     :named REQ2_AUXILIARY0)) ;; "These co-morbid medical conditions may include but are not be limited to: ..."

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: BMI > 27
(assert
  (! (> patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 27.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have body mass index greater than 27."

;; Component 1: At least one significant co-morbid medical condition expected to improve with weight loss
(assert
  (! (and patient_has_finding_of_significant_co_morbid_condition_now
          patient_has_finding_of_significant_co_morbid_condition_now@@expected_to_improve_with_weight_loss)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have at least one significant co-morbid medical condition ... which is generally expected to be improved, reversed, or resolved by weight loss."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_agrees_to_refrain_from_any_weight_loss_drug_for_the_duration_of_the_trial Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to refrain from any type of weight-loss drug (prescription or over-the-counter) for the duration of the trial.","when_to_set_to_false":"Set to false if the patient does not agree to refrain from any type of weight-loss drug (prescription or over-the-counter) for the duration of the trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to refrain from any type of weight-loss drug (prescription or over-the-counter) for the duration of the trial.","meaning":"Boolean indicating whether the patient agrees to refrain from any type of weight-loss drug (prescription or over-the-counter) for the duration of the trial."} // "To be included, the patient must agree to refrain from any type of weight-loss drug (prescription drug OR over-the-counter drug) for the duration of the trial."
(declare-const patient_agrees_to_refrain_from_any_elective_procedure_affecting_body_weight_for_the_duration_of_the_trial Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to refrain from any elective procedure that would affect body weight for the duration of the trial.","when_to_set_to_false":"Set to false if the patient does not agree to refrain from any elective procedure that would affect body weight for the duration of the trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to refrain from any elective procedure that would affect body weight for the duration of the trial.","meaning":"Boolean indicating whether the patient agrees to refrain from any elective procedure that would affect body weight for the duration of the trial."} // "To be included, the patient must agree to refrain from any elective procedure that would affect body weight for the duration of the trial."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_agrees_to_refrain_from_any_weight_loss_drug_for_the_duration_of_the_trial
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must agree to refrain from any type of weight-loss drug (prescription drug OR over-the-counter drug) for the duration of the trial."

(assert
  (! patient_agrees_to_refrain_from_any_elective_procedure_affecting_body_weight_for_the_duration_of_the_trial
     :named REQ3_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must agree to refrain from any elective procedure that would affect body weight for the duration of the trial."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const hemoglobin_a1c_value_recorded_now_in_percent Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's hemoglobin A1C measured at the current time, expressed in percent.","when_to_set_to_null":"Set to null if the patient's hemoglobin A1C value at the current time is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's hemoglobin A1C measured at the current time, expressed in percent."} // "To be included, the patient must have hemoglobin A1C less than 11 percent."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (< hemoglobin_a1c_value_recorded_now_in_percent 11.0)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have hemoglobin A1C less than 11 percent."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const anti_diabetic_medication_regimen_complexity_value_now_withunit_medication_components Real) ;; {"when_to_set_to_value":"Set to the number of distinct anti-diabetic medication components (counting oral metformin, oral sulfonylurea, and once daily insulin injection as separate components) currently prescribed to the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many anti-diabetic medication components are currently prescribed.","meaning":"Numeric value representing the number of distinct anti-diabetic medication components in the patient's current regimen, with unit 'medication components'."} // "the anti-diabetic medication regimen must be no more complex than (oral metformin plus one oral sulfonylurea plus once daily insulin injection)"
(declare-const anti_diabetic_medication_regimen_includes_once_daily_insulin_injection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current anti-diabetic medication regimen includes a once daily insulin injection.","when_to_set_to_false":"Set to false if the patient's current anti-diabetic medication regimen does not include a once daily insulin injection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a once daily insulin injection is included in the current regimen.","meaning":"Boolean indicating whether a once daily insulin injection is included in the patient's current anti-diabetic medication regimen."} // "once daily insulin injection"
(declare-const anti_diabetic_medication_regimen_includes_oral_metformin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current anti-diabetic medication regimen includes oral metformin.","when_to_set_to_false":"Set to false if the patient's current anti-diabetic medication regimen does not include oral metformin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether oral metformin is included in the current regimen.","meaning":"Boolean indicating whether oral metformin is included in the patient's current anti-diabetic medication regimen."} // "oral metformin"
(declare-const anti_diabetic_medication_regimen_includes_oral_sulfonylurea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current anti-diabetic medication regimen includes an oral sulfonylurea.","when_to_set_to_false":"Set to false if the patient's current anti-diabetic medication regimen does not include an oral sulfonylurea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether an oral sulfonylurea is included in the current regimen.","meaning":"Boolean indicating whether an oral sulfonylurea is included in the patient's current anti-diabetic medication regimen."} // "one oral sulfonylurea"

;; ===================== Constraint Assertions (REQ 5) =====================
;; If the patient has type 2 diabetes mellitus, the anti-diabetic medication regimen must be no more complex than oral metformin plus one oral sulfonylurea plus once daily insulin injection.
(assert
  (! (or (not patient_has_finding_of_type_2_diabetes_mellitus_now)
         (and (<= anti_diabetic_medication_regimen_complexity_value_now_withunit_medication_components 3)
              anti_diabetic_medication_regimen_includes_oral_metformin_now
              anti_diabetic_medication_regimen_includes_oral_sulfonylurea_now
              anti_diabetic_medication_regimen_includes_once_daily_insulin_injection_now))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, if the patient has type 2 diabetes mellitus, the anti-diabetic medication regimen must be no more complex than (oral metformin plus one oral sulfonylurea plus once daily insulin injection)."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_ability_to_self_pay_for_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the ability to self pay for the procedure.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to self pay for the procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to self pay for the procedure.","meaning":"Boolean indicating whether the patient currently has the ability to self pay for the procedure."} // "To be included, the patient must have the ability to self pay for the procedure."
(declare-const patient_has_ability_to_self_pay_for_follow_up_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the ability to self pay for follow up.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to self pay for follow up.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to self pay for follow up.","meaning":"Boolean indicating whether the patient currently has the ability to self pay for follow up."} // "To be included, the patient must have the ability to self pay for follow up."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_has_ability_to_self_pay_for_procedure_now
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have the ability to self pay for the procedure."
(assert
  (! patient_has_ability_to_self_pay_for_follow_up_now
     :named REQ6_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have the ability to self pay for follow up."
