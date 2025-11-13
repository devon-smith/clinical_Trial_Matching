;; ===================== Declarations for the inclusion criteria (REQ 0) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female as currently recorded."}  ;; "male or female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is male as currently recorded."}  ;; "male or female"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged 60 years or older"
(declare-const patient_has_finding_of_impaired_cognition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of impaired cognition (cognitive impairment).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of impaired cognition (cognitive impairment).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has impaired cognition (cognitive impairment).","meaning":"Boolean indicating whether the patient currently has impaired cognition (cognitive impairment)."}  ;; "cognitive impairment"
(declare-const patient_has_finding_of_impaired_cognition_now@@not_dementia Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cognitive impairment is not dementia.","when_to_set_to_false":"Set to false if the patient's cognitive impairment is dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cognitive impairment is dementia or not.","meaning":"Boolean indicating whether the patient's cognitive impairment is not dementia."}  ;; "not dementia"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_impaired_cognition_now@@not_dementia
         patient_has_finding_of_impaired_cognition_now)
     :named REQ0_AUXILIARY0)) ;; "To be included, the patient must have cognitive impairment (not dementia)."

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: patient must be male or female
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male or female."

;; Component 1: patient must be aged 60 years or older
(assert
  (! (>= patient_age_value_recorded_now_in_years 60)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged 60 years or older."

;; Component 2: patient must have cognitive impairment (not dementia)
(assert
  (! patient_has_finding_of_impaired_cognition_now@@not_dementia
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have cognitive impairment (not dementia)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_mini_mental_state_examination_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured MMSE score if a numeric value is recorded for the patient now.","when_to_set_to_null":"Set to null if no MMSE score is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's current Mini-Mental State Examination (MMSE) score."}  ;; "Mini-Mental State Examination score"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Mini-Mental State Examination score > 24
(assert
  (! (> patient_mini_mental_state_examination_score_value_recorded_now_withunit_score 24)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (Mini-Mental State Examination score > 24)."

;; Component 1: Mini-Mental State Examination score < 29
(assert
  (! (< patient_mini_mental_state_examination_score_value_recorded_now_withunit_score 29)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (Mini-Mental State Examination score < 29)."
