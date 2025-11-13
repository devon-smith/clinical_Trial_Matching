;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_pain_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's self-reported pain score (0–10) if recorded now.","when_to_set_to_null":"Set to null if no pain score is recorded now or if the value is indeterminate.","meaning":"Numeric value representing the patient's self-reported pain score (0–10) recorded now."}  ;; "pain score"

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must have reported pain score (on a scale from zero to ten) greater than or equal to 3 out of 10.
(assert
  (! (>= patient_pain_score_value_recorded_now_withunit_score 3)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have reported pain score (on a scale from zero to ten) greater than or equal to 3 out of 10."
