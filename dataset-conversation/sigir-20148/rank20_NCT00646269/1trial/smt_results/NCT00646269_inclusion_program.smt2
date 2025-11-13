;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Alzheimer's disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Alzheimer's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Alzheimer's disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Alzheimer's disease."} // "be in the mild stage of Alzheimer's disease OR be in the moderate stage of Alzheimer's disease"
(declare-const patient_is_in_mild_stage_of_alzheimer_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in the mild stage of Alzheimer's disease.","when_to_set_to_false":"Set to false if the patient is currently not in the mild stage of Alzheimer's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in the mild stage of Alzheimer's disease.","meaning":"Boolean indicating whether the patient is currently in the mild stage of Alzheimer's disease."} // "be in the mild stage of Alzheimer's disease"
(declare-const patient_is_in_moderate_stage_of_alzheimer_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in the moderate stage of Alzheimer's disease.","when_to_set_to_false":"Set to false if the patient is currently not in the moderate stage of Alzheimer's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in the moderate stage of Alzheimer's disease.","meaning":"Boolean indicating whether the patient is currently in the moderate stage of Alzheimer's disease."} // "be in the moderate stage of Alzheimer's disease"
(declare-const patient_mini_mental_state_examination_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured value if a Mini-Mental State Examination score recorded now is available.","when_to_set_to_null":"Set to null if no such score recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current Mini-Mental State Examination score."} // "have a Mini-Mental State Examination score ≥ 16 AND ≤ 26"
(declare-const patient_global_deterioration_scale_level_value_recorded_now_withunit_stage Real) ;; {"when_to_set_to_value":"Set to the measured value if a Global Deterioration Scale stage recorded now is available.","when_to_set_to_null":"Set to null if no such stage recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current Global Deterioration Scale stage."} // "be at stage 3 OR stage 4 OR stage 5 of the Global Deterioration Scale"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_is_in_mild_stage_of_alzheimer_s_disease_now
         patient_is_in_moderate_stage_of_alzheimer_s_disease_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "be in the mild stage of Alzheimer's disease OR be in the moderate stage of Alzheimer's disease"

(assert
  (! (and (>= patient_mini_mental_state_examination_score_value_recorded_now_withunit_score 16.0)
          (<= patient_mini_mental_state_examination_score_value_recorded_now_withunit_score 26.0))
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "have a Mini-Mental State Examination score ≥ 16 AND ≤ 26"

(assert
  (! (or (= patient_global_deterioration_scale_level_value_recorded_now_withunit_stage 3.0)
         (= patient_global_deterioration_scale_level_value_recorded_now_withunit_stage 4.0)
         (= patient_global_deterioration_scale_level_value_recorded_now_withunit_stage 5.0))
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "be at stage 3 OR stage 4 OR stage 5 of the Global Deterioration Scale"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged > 50 years"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 50)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged > 50 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_social_security_affiliation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has social security affiliation.","when_to_set_to_false":"Set to false if the patient currently does not have social security affiliation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has social security affiliation.","meaning":"Boolean indicating whether the patient currently has social security affiliation."} // "To be included, the patient must have social security affiliation."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_social_security_affiliation_now
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have social security affiliation."
