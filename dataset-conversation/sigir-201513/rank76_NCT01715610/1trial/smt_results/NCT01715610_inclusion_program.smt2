;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "age > 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 18.0)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (age > 18 years)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_peritonsillar_abscess_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with peritonsillar abscess at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with peritonsillar abscess.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with peritonsillar abscess.","meaning":"Boolean indicating whether the patient has ever been diagnosed with peritonsillar abscess."} ;; "have been diagnosed with a peritonsillar abscess"
(declare-const patient_has_finding_of_peritonsillar_abscess_drained_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a peritonsillar abscess drained at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a peritonsillar abscess drained.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a peritonsillar abscess drained.","meaning":"Boolean indicating whether the patient has ever had a peritonsillar abscess drained."} ;; "have had the peritonsillar abscess drained"
(declare-const patient_has_finding_of_peritonsillar_abscess_purulence_obtained_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if purulence has ever been obtained from a peritonsillar abscess in the patient at any time in their history.","when_to_set_to_false":"Set to false if purulence has never been obtained from a peritonsillar abscess in the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether purulence has ever been obtained from a peritonsillar abscess in the patient.","meaning":"Boolean indicating whether purulence has ever been obtained from a peritonsillar abscess in the patient."} ;; "have had purulence of the peritonsillar abscess obtained"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_diagnosis_of_peritonsillar_abscess_inthehistory
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have been diagnosed with a peritonsillar abscess"

(assert
  (! patient_has_finding_of_peritonsillar_abscess_drained_inthehistory
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have had the peritonsillar abscess drained"

(assert
  (! patient_has_finding_of_peritonsillar_abscess_purulence_obtained_inthehistory
     :named REQ1_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have had purulence of the peritonsillar abscess obtained"
