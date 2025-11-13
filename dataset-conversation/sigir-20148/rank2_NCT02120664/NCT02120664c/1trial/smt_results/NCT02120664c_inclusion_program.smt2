;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."}  ;; "be male"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."}  ;; "be female"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "be at least 50 years of age"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_sex_is_male_now
         (and patient_sex_is_female_now (>= patient_age_value_recorded_now_in_years 50)))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((be male) OR ((be female) AND (be at least 50 years of age)))."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of dementia.","meaning":"Boolean indicating whether the patient currently has dementia."} ;; "dementia"
(declare-const patient_has_finding_of_dementia_now@@caused_by_possible_alzheimers_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dementia is caused by possible Alzheimer's disease.","when_to_set_to_false":"Set to false if the patient's dementia is not caused by possible Alzheimer's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dementia is caused by possible Alzheimer's disease.","meaning":"Boolean indicating whether the patient's dementia is caused by possible Alzheimer's disease."} ;; "dementia due to possible Alzheimer's disease"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_dementia_now@@caused_by_possible_alzheimers_disease
         patient_has_finding_of_dementia_now)
     :named REQ1_AUXILIARY0)) ;; "dementia due to possible Alzheimer's disease" implies "dementia"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must meet clinical criteria for dementia due to possible Alzheimer's disease.
(assert
  (! patient_has_finding_of_dementia_now@@caused_by_possible_alzheimers_disease
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "must meet clinical criteria for dementia due to possible Alzheimer's disease"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_mini_mental_state_examination_score_value_recorded_now_withunit_none Real) ;; {"when_to_set_to_value":"Set to the measured Mini-Mental State Examination score if a numeric measurement recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's Mini-Mental State Examination score recorded now."} ;; "Mini-Mental State Examination score"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Mini-Mental State Examination score greater than or equal to 16
(assert
  (! (>= patient_mini_mental_state_examination_score_value_recorded_now_withunit_none 16)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a Mini-Mental State Examination score greater than or equal to 16."

;; Component 1: Mini-Mental State Examination score less than or equal to 26
(assert
  (! (<= patient_mini_mental_state_examination_score_value_recorded_now_withunit_none 26)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a Mini-Mental State Examination score less than or equal to 26."
