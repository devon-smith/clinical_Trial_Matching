;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_cough_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured Hull Airways Reflux Questionnaire cough score if recorded now.","when_to_set_to_null":"Set to null if no such score is available or the value is indeterminate.","meaning":"Numeric value representing the patient's Hull Airways Reflux Questionnaire cough score recorded now."} // "score > 20 out of 70 on the Hull Airways Reflux Questionnaire"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (> patient_cough_value_recorded_now_withunit_score 20.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "score > 20 out of 70 on the Hull Airways Reflux Questionnaire"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_non_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a non-smoker (does not currently smoke tobacco products).","when_to_set_to_false":"Set to false if the patient is currently a smoker (does currently smoke tobacco products).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a non-smoker.","meaning":"Boolean indicating whether the patient is currently a non-smoker."} // "non-smoker"
(declare-const patient_is_exposed_to_tobacco_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to tobacco products (e.g., currently smokes tobacco).","when_to_set_to_false":"Set to false if the patient is not currently exposed to tobacco products (does not currently smoke tobacco).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to tobacco products.","meaning":"Boolean indicating whether the patient is currently exposed to tobacco products."} // "tobacco"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition in the requirement: "non-smoker (defined as a patient who does NOT currently smoke tobacco products)"
(assert
  (! (= patient_has_finding_of_non_smoker_now
        (not patient_is_exposed_to_tobacco_now))
     :named REQ1_AUXILIARY0))

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: "To be included, the patient must be a current non-smoker"
(assert
  (! patient_has_finding_of_non_smoker_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_taking_drug_or_medicament_inthepast1months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been taking a drug or medicament (medication) continuously for the past 1 month.","when_to_set_to_false":"Set to false if the patient has not been taking a drug or medicament (medication) continuously for the past 1 month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been taking a drug or medicament (medication) continuously for the past 1 month.","meaning":"Boolean indicating whether the patient has been taking a drug or medicament (medication) continuously for the past 1 month."} // "must be on stable medication ... for ≥ 1 month"
(declare-const patient_is_taking_drug_or_medicament_inthepast1months@@no_change_in_type_or_dosage Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had no change in medication type or dosage during the past 1 month while taking the drug or medicament.","when_to_set_to_false":"Set to false if the patient has had any change in medication type or dosage during the past 1 month while taking the drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there has been a change in medication type or dosage during the past 1 month.","meaning":"Boolean indicating whether there has been no change in medication type or dosage during the past 1 month while the patient has been taking the drug or medicament."} // "defined as no change in medication type or dosage"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_is_taking_drug_or_medicament_inthepast1months@@no_change_in_type_or_dosage
         patient_is_taking_drug_or_medicament_inthepast1months)
     :named REQ2_AUXILIARY0)) ;; "no change in medication type or dosage" implies "taking medication for past 1 month"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Must be on stable medication (no change in type or dosage) for ≥ 1 month
(assert
  (! patient_is_taking_drug_or_medicament_inthepast1months@@no_change_in_type_or_dosage
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must be on stable medication (defined as no change in medication type or dosage) for ≥ 1 month"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_number_of_attendances_at_trials_unit_value_recorded_over_study_period_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of times the patient is able to attend the trials unit over the study period, as documented or reported.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many times the patient is able to attend the trials unit over the study period.","meaning":"Numeric value representing the number of times the patient is able to attend the trials unit over the study period, in units of count."} // "the patient must be able to attend the trials unit on ≥ 3 occasions"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (>= patient_number_of_attendances_at_trials_unit_value_recorded_over_study_period_withunit_count 3)
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be able to attend the trials unit on ≥ 3 occasions"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_lung_function_testing_normal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of normal lung function.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of normal lung function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has normal lung function.","meaning":"Boolean indicating whether the patient currently has normal lung function."} // "normal lung function (defined according to standard reference values for lung function)"
(declare-const patient_pulmonary_function_value_recorded_now_withunit_standard_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of pulmonary function is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current pulmonary function measurement."} // "lung function (defined according to standard reference values for lung function)"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; The requirement defines "normal lung function" according to standard reference values for lung function.
;; Since the specific reference value is not provided, we do not encode a numeric threshold, but the Boolean variable is defined to represent this clinical finding.
;; No auxiliary assertion is needed beyond the variable definition.

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: The patient must have normal lung function (defined according to standard reference values for lung function).
(assert
  (! patient_has_finding_of_lung_function_testing_normal_now
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have normal lung function (defined according to standard reference values for lung function)."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_is_able_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to give informed consent, meaning the patient has the capacity to understand and voluntarily agree to participate in the study.","when_to_set_to_false":"Set to false if the patient is currently not able to give informed consent, meaning the patient lacks the capacity to understand and/or voluntarily agree to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to give informed consent.","meaning":"Boolean indicating whether the patient is currently able to give informed consent, defined as the capacity to understand and voluntarily agree to participate in the study."} // "To be included, the patient must be able to give informed consent (defined as the capacity to understand and voluntarily agree to participate in the study)."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_is_able_to_give_informed_consent_now
     :named REQ5_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be able to give informed consent (defined as the capacity to understand and voluntarily agree to participate in the study)."
