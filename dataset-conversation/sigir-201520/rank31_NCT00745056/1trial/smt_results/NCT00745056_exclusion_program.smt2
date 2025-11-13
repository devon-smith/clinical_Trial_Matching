;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_inability_to_speak_english_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has inability to speak English.","when_to_set_to_false":"Set to false if the patient currently does not have inability to speak English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has inability to speak English.","meaning":"Boolean indicating whether the patient currently has inability to speak English."} ;; "inability to speak English"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_inability_to_speak_english_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has inability to speak English."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_hearing_loss_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hearing loss (hearing impairment).","when_to_set_to_false":"Set to false if the patient currently does not have hearing loss (hearing impairment).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hearing loss (hearing impairment).","meaning":"Boolean indicating whether the patient currently has hearing loss."} ;; "hearing impairment"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_hearing_loss_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hearing impairment."
