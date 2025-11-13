;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_outpatient_attending_neurology_specialty_center_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently an outpatient and is attending a neurology specialty center.","when_to_set_to_false":"Set to false if the patient is not currently an outpatient attending a neurology specialty center.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an outpatient attending a neurology specialty center.","meaning":"Boolean indicating whether the patient is currently an outpatient attending a neurology specialty center."} // "To be included, the patient must be an outpatient attending a neurology specialty center."
(declare-const patient_is_undergoing_antihypertensive_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving antihypertensive therapy (i.e., is being administered hypertension medication) now.","when_to_set_to_false":"Set to false if the patient is not currently receiving antihypertensive therapy now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving antihypertensive therapy now.","meaning":"Boolean indicating whether the patient is currently undergoing antihypertensive therapy (receiving hypertension medication) now."} // "To be included, the patient must be receiving hypertension medication."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_is_outpatient_attending_neurology_specialty_center_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be an outpatient attending a neurology specialty center."

(assert
  (! patient_is_undergoing_antihypertensive_therapy_now
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be receiving hypertension medication."
