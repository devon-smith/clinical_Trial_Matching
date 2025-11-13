;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_undergoing_intercostal_drain_removal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in the process of having an intercostal drain (chest tube) removed.","when_to_set_to_false":"Set to false if the patient is not currently undergoing removal of an intercostal drain (chest tube).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing removal of an intercostal drain (chest tube).","meaning":"Boolean indicating whether the patient is currently undergoing removal of an intercostal drain (chest tube)."}

(declare-const patient_has_undergone_lung_surgery_in_the_past Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously undergone any lung surgery (at any time in the past).","when_to_set_to_false":"Set to false if the patient has never undergone lung surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone lung surgery.","meaning":"Boolean indicating whether the patient has undergone lung surgery at any time in the past."} ;; "To be included, the patient must have had lung surgery."

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: The patient must be undergoing removal of a chest tube.
(assert
  (! patient_is_undergoing_intercostal_drain_removal_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be undergoing removal of a chest tube."

;; Component 1: The patient must have had lung surgery.
(assert
  (! patient_has_undergone_lung_surgery_in_the_past
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have had lung surgery."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_able_to_indicate_pain_score_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to indicate their pain score.","when_to_set_to_false":"Set to false if the patient is currently unable to indicate their pain score.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to indicate their pain score.","meaning":"Boolean indicating whether the patient is currently able to indicate their pain score."} ;; "the patient must be able to indicate the pain score."
(declare-const patient_pain_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured or reported value if the patient's pain score is recorded now.","when_to_set_to_null":"Set to null if no pain score is recorded now or if the patient is unable to indicate a pain score.","meaning":"Numeric value representing the patient's current pain score as recorded now."} ;; "pain score"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_is_able_to_indicate_pain_score_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be able to indicate the pain score."
