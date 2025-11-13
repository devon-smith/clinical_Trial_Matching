;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 60 years AND aged ≤ 99 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be aged ≥ 60 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 60)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 60 years."

;; Component 1: To be included, the patient must be aged ≤ 99 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 99)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 99 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of dementia.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of dementia."}  ;; "clinical diagnosis of dementia"
(declare-const patient_has_diagnosis_of_dementia_now@@alzheimers_type Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current clinical diagnosis of dementia is of the Alzheimer's type.","when_to_set_to_false":"Set to false if the patient's current clinical diagnosis of dementia is not of the Alzheimer's type.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dementia is of the Alzheimer's type.","meaning":"Boolean indicating whether the patient's current clinical diagnosis of dementia is of the Alzheimer's type."}  ;; "clinical diagnosis of dementia of the Alzheimer's type"
(declare-const patient_has_diagnosis_of_vascular_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of vascular dementia.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of vascular dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of vascular dementia.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of vascular dementia."}  ;; "clinical diagnosis of vascular dementia"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable for Alzheimer's type implies general dementia diagnosis
(assert
  (! (=> patient_has_diagnosis_of_dementia_now@@alzheimers_type
         patient_has_diagnosis_of_dementia_now)
     :named REQ1_AUXILIARY0)) ;; "clinical diagnosis of dementia of the Alzheimer's type" implies "clinical diagnosis of dementia"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have (a clinical diagnosis of dementia of the Alzheimer's type OR a clinical diagnosis of vascular dementia).
(assert
  (! (or patient_has_diagnosis_of_dementia_now@@alzheimers_type
         patient_has_diagnosis_of_vascular_dementia_now)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (a clinical diagnosis of dementia of the Alzheimer's type OR a clinical diagnosis of vascular dementia)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_mini_mental_state_examination_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured value if a Mini Mental Status Examination score is recorded for the patient now.","when_to_set_to_null":"Set to null if no such score is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's Mini Mental Status Examination score recorded now."}  ;; "Mini Mental Status Examination score"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= patient_mini_mental_state_examination_score_value_recorded_now_withunit_score 10)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "Mini Mental Status Examination score ≥ 10"
