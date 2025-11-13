;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of dementia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of dementia."}  ;; "have a diagnosis of dementia"
(declare-const patient_has_finding_of_impaired_cognition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of impaired cognition (cognitive deficit).","when_to_set_to_false":"Set to false if the patient currently does not have a finding of impaired cognition (cognitive deficit).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of impaired cognition (cognitive deficit).","meaning":"Boolean indicating whether the patient currently has a finding of impaired cognition (cognitive deficit)."}  ;; "have a cognitive deficit"
(declare-const patient_has_finding_of_impaired_cognition_now@@measured_by_mini_mental_state_examination Bool) ;; {"when_to_set_to_true":"Set to true if the patient's impaired cognition is measured by the Mini-Mental State Examination (MMSE).","when_to_set_to_false":"Set to false if the patient's impaired cognition is not measured by the Mini-Mental State Examination (MMSE).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's impaired cognition is measured by the Mini-Mental State Examination (MMSE).","meaning":"Boolean indicating whether the patient's impaired cognition is measured by the Mini-Mental State Examination (MMSE)."}  ;; "measured as a score < 25 on the Mini-Mental State Examination"
(declare-const mini_mental_state_examination_score_value_recorded_now_withunit_points Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's MMSE score recorded at the current time, in points.","when_to_set_to_null":"Set to null if the MMSE score is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric value indicating the patient's MMSE score recorded at the current time, in points."}  ;; "score < 25 on the Mini-Mental State Examination"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_impaired_cognition_now@@measured_by_mini_mental_state_examination
         patient_has_finding_of_impaired_cognition_now)
     :named REQ0_AUXILIARY0)) ;; If impaired cognition is measured by MMSE, then impaired cognition is present

;; Definition: cognitive deficit measured as MMSE < 25
(declare-const patient_has_cognitive_deficit_measured_by_mmse_score_below_25_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a cognitive deficit measured as a Mini-Mental State Examination (MMSE) score less than 25.","when_to_set_to_false":"Set to false if the patient does not have a cognitive deficit measured as MMSE < 25.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a cognitive deficit measured as MMSE < 25.","meaning":"Boolean indicating whether the patient currently has a cognitive deficit measured as a Mini-Mental State Examination (MMSE) score less than 25."}  ;; "have a cognitive deficit measured as a score < 25 on the Mini-Mental State Examination"
(assert
  (! (= patient_has_cognitive_deficit_measured_by_mmse_score_below_25_now
        (and patient_has_finding_of_impaired_cognition_now@@measured_by_mini_mental_state_examination
             (< mini_mental_state_examination_score_value_recorded_now_withunit_points 25)))
     :named REQ0_AUXILIARY1)) ;; Definition of cognitive deficit measured as MMSE < 25

;; ===================== Constraint Assertions (REQ 0) =====================
;; Inclusion: must have diagnosis of dementia OR cognitive deficit measured as MMSE < 25
(assert
  (! (or patient_has_diagnosis_of_dementia_now
         patient_has_cognitive_deficit_measured_by_mmse_score_below_25_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "have a diagnosis of dementia OR have a cognitive deficit measured as a score < 25 on the Mini-Mental State Examination"
