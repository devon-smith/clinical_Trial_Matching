;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."}  ;; "be male"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."}  ;; "be female"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "be at least 50 years of age"

;; ===================== Constraint Assertions (REQ 0) =====================
;; To be included, the patient must ((be male) OR ((be female) AND (be at least 50 years of age))).
(assert
  (! (or patient_sex_is_male_now
         (and patient_sex_is_female_now (>= patient_age_value_recorded_now_in_years 50)))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_alzheimer_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of Alzheimer's disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of Alzheimer's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of Alzheimer's disease.","meaning":"Boolean indicating whether the patient currently has Alzheimer's disease."} ;; "Alzheimer's disease"
(declare-const patient_has_finding_of_alzheimer_s_disease_now@@probable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current Alzheimer's disease diagnosis is classified as probable.","when_to_set_to_false":"Set to false if the patient's current Alzheimer's disease diagnosis is not classified as probable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current Alzheimer's disease diagnosis is classified as probable.","meaning":"Boolean indicating whether the patient's current Alzheimer's disease diagnosis is classified as probable."} ;; "probable Alzheimer's disease"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable (probable) implies the stem variable (Alzheimer's disease)
(assert
  (! (=> patient_has_finding_of_alzheimer_s_disease_now@@probable
         patient_has_finding_of_alzheimer_s_disease_now)
     :named REQ1_AUXILIARY0)) ;; "probable Alzheimer's disease" implies "Alzheimer's disease"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must meet clinical criteria for dementia due to probable Alzheimer's disease
(assert
  (! patient_has_finding_of_alzheimer_s_disease_now@@probable
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must meet clinical criteria for dementia due to probable Alzheimer's disease"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_mini_mental_state_examination_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's Mini-Mental State Examination score is recorded now.","when_to_set_to_null":"Set to null if no such score is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's Mini-Mental State Examination score recorded now."} ;; "Mini-Mental State Examination score"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have a Mini-Mental State Examination score greater than or equal to 16.
(assert
  (! (>= patient_mini_mental_state_examination_score_value_recorded_now_withunit_score 16)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a Mini-Mental State Examination score greater than or equal to 16."

;; Component 1: To be included, the patient must have a Mini-Mental State Examination score less than or equal to 26.
(assert
  (! (<= patient_mini_mental_state_examination_score_value_recorded_now_withunit_score 26)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a Mini-Mental State Examination score less than or equal to 26."
