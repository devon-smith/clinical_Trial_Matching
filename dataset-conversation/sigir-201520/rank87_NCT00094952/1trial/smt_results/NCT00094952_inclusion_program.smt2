;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_educated_to_high_school_level_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has attained a high school level of education.","when_to_set_to_false":"Set to false if the patient currently has not attained a high school level of education.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has attained a high school level of education.","meaning":"Boolean indicating whether the patient currently has attained a high school level of education."} // "To be included, the patient must have a high school education."
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "To be included, the patient must be aged ≥ 60 years AND ≤ 80 years."
(declare-const patient_lives_in_new_york_city_metropolitan_area_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently lives in the New York City metropolitan area.","when_to_set_to_false":"Set to false if the patient currently does not live in the New York City metropolitan area.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently lives in the New York City metropolitan area.","meaning":"Boolean indicating whether the patient currently lives in the New York City metropolitan area."} // "To be included, the patient must live in the New York City metropolitan area."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_educated_to_high_school_level_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a high school education."
(assert
  (! (and (>= patient_age_value_recorded_now_in_years 60.0)
          (<= patient_age_value_recorded_now_in_years 80.0))
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 60 years AND ≤ 80 years."
(assert
  (! patient_lives_in_new_york_city_metropolitan_area_now
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must live in the New York City metropolitan area."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_education_years_value_recorded_lifetime_withunit_years Real) ;; {"when_to_set_to_value":"Set to the total number of years of formal education the patient has completed in their lifetime, in years.","when_to_set_to_null":"Set to null if the total number of years of formal education completed by the patient is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total years of formal education completed by the patient, in years."} // "To be included, the patient must have a minimum of 12 years of education."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_education_years_value_recorded_lifetime_withunit_years 12)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a minimum of 12 years of education."

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_medical_assessment_now_outcome_is_normal Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a medical assessment now and the outcome is classified as normal (within normal limits).","when_to_set_to_false":"Set to false if the patient has undergone a medical assessment now and the outcome is not classified as normal (not within normal limits).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a medical assessment now with a normal outcome.","meaning":"Boolean indicating whether the patient has undergone a medical assessment now and the outcome is normal."} // "To be included, the patient must be classified as within normal limits on medical examination."
(declare-const patient_has_undergone_evaluation_of_psychiatric_state_of_patient_now_outcome_is_normal Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone an evaluation of psychiatric state now and the outcome is classified as normal (within normal limits).","when_to_set_to_false":"Set to false if the patient has undergone an evaluation of psychiatric state now and the outcome is not classified as normal (not within normal limits).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone an evaluation of psychiatric state now with a normal outcome.","meaning":"Boolean indicating whether the patient has undergone an evaluation of psychiatric state now and the outcome is normal."} // "To be included, the patient must be classified as within normal limits on psychiatric examination."
(declare-const patient_neuropsychological_testing_value_recorded_now_withunit_standard_deviation Real) ;; {"when_to_set_to_value":"Set to the measured value in standard deviations if the patient's performance on the Wechsler Memory Scale-Revised delayed memory index is recorded now via neuropsychological testing.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value in standard deviations representing the patient's current performance on the Wechsler Memory Scale-Revised delayed memory index as measured by neuropsychological testing."} // "To be included, the patient must be classified as within normal limits on neuropsychological examination (performance that is better than -1.5 standard deviations of the New York University norm based Wechsler Memory Scale-Revised delayed memory index)."

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Medical examination within normal limits
(assert
  (! patient_has_undergone_medical_assessment_now_outcome_is_normal
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be classified as within normal limits on medical examination."

;; Component 1: Psychiatric examination within normal limits
(assert
  (! patient_has_undergone_evaluation_of_psychiatric_state_of_patient_now_outcome_is_normal
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be classified as within normal limits on psychiatric examination."

;; Component 2: Neuropsychological examination (performance > -1.5 SD)
(assert
  (! (> patient_neuropsychological_testing_value_recorded_now_withunit_standard_deviation (- -1.5 0))
     :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be classified as within normal limits on neuropsychological examination (performance that is better than -1.5 standard deviations of the New York University norm based Wechsler Memory Scale-Revised delayed memory index)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_global_deterioration_scale_level_value_recorded_now_withunit_none Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current global deterioration scale (GDS) level is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current global deterioration scale (GDS) level, recorded now, with no unit."} // "global deterioration scale"

;; ===================== Constraint Assertions (REQ 3) =====================
;; The patient must have a global deterioration scale equal to 1 OR equal to 2.
(assert
  (! (or (= patient_global_deterioration_scale_level_value_recorded_now_withunit_none 1)
         (= patient_global_deterioration_scale_level_value_recorded_now_withunit_none 2))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((have a global deterioration scale equal to 1) OR (have a global deterioration scale equal to 2))."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_enrolled_in_high_risk_group_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently enrolled in the High-Risk group.","when_to_set_to_false":"Set to false if the patient is currently not enrolled in the High-Risk group.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently enrolled in the High-Risk group.","meaning":"Boolean indicating whether the patient is currently enrolled in the High-Risk group."} // "if the patient is enrolled in the High-Risk group"
(declare-const patient_memory_complaint_questionnaire_score_value_recorded_now_withunit_none Real) ;; {"when_to_set_to_value":"Set to the patient's current score on the Memory Complaint Questionnaire as recorded now.","when_to_set_to_null":"Set to null if the score is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current score on the Memory Complaint Questionnaire."} // "score on the Memory Complaint Questionnaire"
;; patient_global_deterioration_scale_level_value_recorded_now_withunit_none is already declared and reused

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: If enrolled in High-Risk group, must have global deterioration scale equal to 2
(assert
  (! (or (not patient_is_enrolled_in_high_risk_group_now)
         (= patient_global_deterioration_scale_level_value_recorded_now_withunit_none 2))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient is enrolled in the High-Risk group, the patient must have a global deterioration scale equal to 2"

;; Component 1: If enrolled in High-Risk group, must have Memory Complaint Questionnaire score > 25
(assert
  (! (or (not patient_is_enrolled_in_high_risk_group_now)
         (> patient_memory_complaint_questionnaire_score_value_recorded_now_withunit_none 25))
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "if the patient is enrolled in the High-Risk group, the patient must have a score > 25 on the Memory Complaint Questionnaire"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_informed_caregiver_who_will_be_interviewed_to_confirm_patient_can_perform_specific_tasks_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an informed caregiver who will be interviewed to confirm that the patient can perform specific tasks.","when_to_set_to_false":"Set to false if the patient currently does not have an informed caregiver who will be interviewed to confirm that the patient can perform specific tasks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an informed caregiver who will be interviewed to confirm that the patient can perform specific tasks.","meaning":"Boolean indicating whether the patient currently has an informed caregiver who will be interviewed to confirm that the patient can perform specific tasks."} // "have an informed caregiver who will be interviewed to confirm that the patient can perform specific tasks."
(declare-const patient_has_informed_family_member_who_will_be_interviewed_to_confirm_patient_can_perform_specific_tasks_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an informed family member who will be interviewed to confirm that the patient can perform specific tasks.","when_to_set_to_false":"Set to false if the patient currently does not have an informed family member who will be interviewed to confirm that the patient can perform specific tasks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an informed family member who will be interviewed to confirm that the patient can perform specific tasks.","meaning":"Boolean indicating whether the patient currently has an informed family member who will be interviewed to confirm that the patient can perform specific tasks."} // "have an informed family member who will be interviewed to confirm that the patient can perform specific tasks."

;; ===================== Constraint Assertions (REQ 5) =====================
;; If the patient is a high risk memory loss case, the patient must have either an informed family member OR an informed caregiver who will be interviewed to confirm that the patient can perform specific tasks.
(assert
  (! (or (not patient_is_enrolled_in_high_risk_group_now)
         (or patient_has_informed_family_member_who_will_be_interviewed_to_confirm_patient_can_perform_specific_tasks_now
             patient_has_informed_caregiver_who_will_be_interviewed_to_confirm_patient_can_perform_specific_tasks_now))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient is a high risk memory loss case, the patient must ((have an informed family member) OR (have an informed caregiver)) who will be interviewed to confirm that the patient can perform specific tasks."
