;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "the patient must be 60 years or older"
(declare-const patient_will_undergo_coronary_artery_bypass_graft_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is planning to receive coronary artery bypass graft surgery in the future.","when_to_set_to_false":"Set to false if the patient is not planning to receive coronary artery bypass graft surgery in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is planning to receive coronary artery bypass graft surgery in the future.","meaning":"Boolean indicating whether the patient is planning to receive coronary artery bypass graft surgery in the future."} // "coronary artery bypass graft surgery"
(declare-const patient_will_undergo_heart_valve_replacement_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is planning to receive heart valve replacement surgery in the future.","when_to_set_to_false":"Set to false if the patient is not planning to receive heart valve replacement surgery in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is planning to receive heart valve replacement surgery in the future.","meaning":"Boolean indicating whether the patient is planning to receive heart valve replacement surgery in the future."} // "valve replacement surgery"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 60.0)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be 60 years or older."

(assert
  (! (or patient_will_undergo_coronary_artery_bypass_graft_inthefuture
         patient_will_undergo_heart_valve_replacement_inthefuture)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be planning to receive cardiac surgery (coronary artery bypass graft surgery or valve replacement surgery)."
