;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 65 years AND aged ≤ 89 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 65)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 65 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 89)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 89 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_successfully_completed_primary_school Bool) ;; {"when_to_set_to_true":"Set to true if the patient has successfully completed primary school education.","when_to_set_to_false":"Set to false if the patient has not successfully completed primary school education.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has successfully completed primary school education.","meaning":"Boolean indicating whether the patient has successfully completed primary school education."} // "To be included, the patient must have successfully completed primary school."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_successfully_completed_primary_school
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have successfully completed primary school."

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_assessment_using_mini_mental_state_examination_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured MMSE score if a numeric measurement recorded now is available.","when_to_set_to_null":"Set to null if no such MMSE score measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current Mini Mental State Examination score."} // "Mini Mental State Examination score"
(declare-const patient_has_finding_of_mild_cognitive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of mild cognitive impairment.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of mild cognitive impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has mild cognitive impairment.","meaning":"Boolean indicating whether the patient currently has mild cognitive impairment."} // "mild cognitive impairment"
(declare-const patient_has_undergone_neuropsychological_testing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone neuropsychological examination now.","when_to_set_to_false":"Set to false if the patient has not undergone neuropsychological examination now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone neuropsychological examination now.","meaning":"Boolean indicating whether the patient has undergone neuropsychological examination now."} // "neuropsychological examination"
(declare-const patient_has_undergone_neuropsychological_testing_now@@performed_by_specialist_according_to_current_guidelines Bool) ;; {"when_to_set_to_true":"Set to true if the neuropsychological examination was performed by a specialist according to current guidelines.","when_to_set_to_false":"Set to false if the neuropsychological examination was not performed by a specialist according to current guidelines.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the neuropsychological examination was performed by a specialist according to current guidelines.","meaning":"Boolean indicating whether the neuropsychological examination was performed by a specialist according to current guidelines."} // "confirmation through neuropsychological examination by a specialist (according to current guidelines)"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for neuropsychological testing implies the base variable
(assert
  (! (=> patient_has_undergone_neuropsychological_testing_now@@performed_by_specialist_according_to_current_guidelines
         patient_has_undergone_neuropsychological_testing_now)
     :named REQ2_AUXILIARY0)) ;; "confirmation through neuropsychological examination by a specialist (according to current guidelines)"

;; Definition of mild cognitive impairment as per requirement: MMSE 20-27 AND confirmation by specialist
(assert
  (! (= patient_has_finding_of_mild_cognitive_disorder_now
        (and (>= patient_assessment_using_mini_mental_state_examination_value_recorded_now_withunit_score 20)
             (<= patient_assessment_using_mini_mental_state_examination_value_recorded_now_withunit_score 27)
             patient_has_undergone_neuropsychological_testing_now@@performed_by_specialist_according_to_current_guidelines))
     :named REQ2_AUXILIARY1)) ;; "mild cognitive impairment (as defined by (Mini Mental State Examination score ≥ 20 AND Mini Mental State Examination score ≤ 27) AND confirmation through neuropsychological examination by a specialist (according to current guidelines))"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_mild_cognitive_disorder_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have mild cognitive impairment (as defined by (Mini Mental State Examination score ≥ 20 AND Mini Mental State Examination score ≤ 27) AND confirmation through neuropsychological examination by a specialist (according to current guidelines))."
