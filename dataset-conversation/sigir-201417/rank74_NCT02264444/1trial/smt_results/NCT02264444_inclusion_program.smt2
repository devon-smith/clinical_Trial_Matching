;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_signed_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed informed consent.","when_to_set_to_false":"Set to false if the patient has not signed informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed informed consent.","meaning":"Boolean indicating whether the patient has signed informed consent."} ;; "To be included, the patient must have signed informed consent."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_signed_informed_consent
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have signed informed consent."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_can_undergo_single_port_laparoscopic_cholecystectomy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently deemed to have a clinical indication to undergo a single-port laparoscopic cholecystectomy.","when_to_set_to_false":"Set to false if the patient is currently deemed not to have a clinical indication to undergo a single-port laparoscopic cholecystectomy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently deemed to have a clinical indication to undergo a single-port laparoscopic cholecystectomy.","meaning":"Boolean indicating whether the patient can currently undergo a single-port laparoscopic cholecystectomy."} ;; "deemed to have a clinical indication to undergo a laparoendoscopic single-site cholecystectomy"
(declare-const patient_has_surgical_indication_for_single_port_laparoscopic_cholecystectomy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently deemed to have a surgical indication to undergo a single-port laparoscopic cholecystectomy.","when_to_set_to_false":"Set to false if the patient is currently deemed not to have a surgical indication to undergo a single-port laparoscopic cholecystectomy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently deemed to have a surgical indication to undergo a single-port laparoscopic cholecystectomy.","meaning":"Boolean indicating whether the patient is currently deemed to have a surgical indication to undergo a single-port laparoscopic cholecystectomy."} ;; "deemed to have a surgical indication to undergo a laparoendoscopic single-site cholecystectomy"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_can_undergo_single_port_laparoscopic_cholecystectomy_now
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "deemed to have a clinical indication to undergo a laparoendoscopic single-site cholecystectomy"

(assert
  (! patient_has_surgical_indication_for_single_port_laparoscopic_cholecystectomy_now
     :named REQ2_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "deemed to have a surgical indication to undergo a laparoendoscopic single-site cholecystectomy"
