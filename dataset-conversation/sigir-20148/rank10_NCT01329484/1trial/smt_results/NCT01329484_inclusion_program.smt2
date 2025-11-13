;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now Bool) ;; "To be included, the patient must have a clinical diagnosis of Alzheimer's disease." {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of Alzheimer's disease.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of Alzheimer's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of Alzheimer's disease.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of Alzheimer's disease."}

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_alzheimer_s_disease_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a clinical diagnosis of Alzheimer's disease."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_mini_mental_state_examination_score_value_recorded_now_withunit_score Real) ;; "mini-mental state examination score" {"when_to_set_to_value":"Set to the measured MMSE score if a numeric measurement of the mini-mental state examination score is recorded for the patient at the present time.","when_to_set_to_null":"Set to null if no such MMSE score is available for the patient at the present time or the value is indeterminate.","meaning":"Numeric value representing the patient's current mini-mental state examination (MMSE) score."}

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_mini_mental_state_examination_score_value_recorded_now_withunit_score 14)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a mini-mental state examination score ≥ 14."

(assert
  (! (<= patient_mini_mental_state_examination_score_value_recorded_now_withunit_score 26)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a mini-mental state examination score ≤ 26."
