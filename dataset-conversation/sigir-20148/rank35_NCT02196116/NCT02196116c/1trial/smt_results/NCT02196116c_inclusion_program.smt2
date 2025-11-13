;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_participates_in_ami_cohort Bool) ;; {"when_to_set_to_true":"Set to true if the patient participates in the AMI cohort.","when_to_set_to_false":"Set to false if the patient does not participate in the AMI cohort.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient participates in the AMI cohort.","meaning":"Boolean indicating whether the patient participates in the AMI cohort."} // "the patient must participate in the AMI cohort"
(declare-const patient_participates_in_3c_cohort Bool) ;; {"when_to_set_to_true":"Set to true if the patient participates in the 3C cohort.","when_to_set_to_false":"Set to false if the patient does not participate in the 3C cohort.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient participates in the 3C cohort.","meaning":"Boolean indicating whether the patient participates in the 3C cohort."} // "the patient must participate in the 3C cohort"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_participates_in_ami_cohort
         patient_participates_in_3c_cohort)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must (participate in the AMI cohort OR participate in the 3C cohort)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_mini_mental_state_examination_score_value_recorded_now_withunit_none Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's mini-mental state examination score is recorded now.","when_to_set_to_null":"Set to null if no such score is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's mini-mental state examination score recorded now."} // "mini-mental state examination score"
(declare-const patient_has_low_level_of_education Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a low level of education.","when_to_set_to_false":"Set to false if the patient does not have a low level of education.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a low level of education.","meaning":"Boolean indicating whether the patient has a low level of education."} // "low level of education"
(declare-const patient_has_high_level_of_education Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a high level of education.","when_to_set_to_false":"Set to false if the patient does not have a high level of education.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a high level of education.","meaning":"Boolean indicating whether the patient has a high level of education."} // "high level of education"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must (have a mini-mental state examination score < 24) OR (have a mini-mental state examination score < 26 AND have low level of education) OR (have a mini-mental state examination score < 26 AND have high level of education).
(assert
  (! (or
        (< patient_mini_mental_state_examination_score_value_recorded_now_withunit_none 24)
        (and (< patient_mini_mental_state_examination_score_value_recorded_now_withunit_none 26)
             patient_has_low_level_of_education)
        (and (< patient_mini_mental_state_examination_score_value_recorded_now_withunit_none 26)
             patient_has_high_level_of_education))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must (have a mini-mental state examination score < 24) OR (have a mini-mental state examination score < 26 AND have low level of education) OR (have a mini-mental state examination score < 26 AND have high level of education)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_memory_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of memory impairment.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of memory impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has memory impairment.","meaning":"Boolean indicating whether the patient currently has memory impairment."} // "have memory impairment"
(declare-const patient_has_finding_of_memory_impairment_now@@determined_according_to_rl_ri_16_test Bool) ;; {"when_to_set_to_true":"Set to true if the patient's memory impairment is determined according to the RL/RI-16 test.","when_to_set_to_false":"Set to false if the patient's memory impairment is not determined according to the RL/RI-16 test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the RL/RI-16 test was used to determine memory impairment.","meaning":"Boolean indicating whether the patient's memory impairment is determined according to the RL/RI-16 test."} // "according to the RL/RI-16 test"
(declare-const patient_has_finding_of_memory_impairment_now@@thresholds_aligned_to_mini_mental_state_examination_score_in_01 Bool) ;; {"when_to_set_to_true":"Set to true if the thresholds for RL/RI-16 test used to determine memory impairment are aligned to those for mini-mental state examination score in [01].","when_to_set_to_false":"Set to false if the thresholds for RL/RI-16 test are not aligned to those for mini-mental state examination score in [01].","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the RL/RI-16 test thresholds are aligned to mini-mental state examination score in [01].","meaning":"Boolean indicating whether the RL/RI-16 test thresholds for memory impairment are aligned to those for mini-mental state examination score in [01]."} // "using the same thresholds as for mini-mental state examination score in [01]"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_memory_impairment_now@@determined_according_to_rl_ri_16_test
         patient_has_finding_of_memory_impairment_now)
     :named REQ2_AUXILIARY0)) ;; "memory impairment according to the RL/RI-16 test"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_memory_impairment_now@@thresholds_aligned_to_mini_mental_state_examination_score_in_01
         patient_has_finding_of_memory_impairment_now)
     :named REQ2_AUXILIARY1)) ;; "using the same thresholds as for mini-mental state examination score in [01]"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (and patient_has_finding_of_memory_impairment_now@@determined_according_to_rl_ri_16_test
          patient_has_finding_of_memory_impairment_now@@thresholds_aligned_to_mini_mental_state_examination_score_in_01)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "have memory impairment according to the RL/RI-16 test (using the same thresholds as for mini-mental state examination score in [01])"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_memory_complaint_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a memory complaint.","when_to_set_to_false":"Set to false if the patient currently does not have a memory complaint.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a memory complaint.","meaning":"Boolean indicating whether the patient currently has a memory complaint."} // "the patient must have memory complaint"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_memory_complaint_now
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must have memory complaint"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of dementia.","meaning":"Boolean indicating whether the patient currently has dementia."} // "the patient must NOT have dementia"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_has_finding_of_dementia_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have dementia."
