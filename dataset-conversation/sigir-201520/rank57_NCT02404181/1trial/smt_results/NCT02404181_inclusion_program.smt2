;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 60 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 60)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 60 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_frailty_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of frailty.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of frailty.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of frailty.","meaning":"Boolean indicating whether the patient currently has frailty."} // "To be included, the patient must be a patient with frailty."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_frailty_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be a patient with frailty."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_undergoing_optional_surgery_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing an elective surgical procedure.","when_to_set_to_false":"Set to false if the patient is not currently undergoing an elective surgical procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing an elective surgical procedure.","meaning":"Boolean indicating whether the patient is currently undergoing an elective surgical procedure."} // "elective surgical procedure"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_is_undergoing_optional_surgery_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be a patient undergoing elective surgical procedure."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_expected_postoperative_admission_duration_value_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days the patient is expected to remain admitted postoperatively, as determined by clinical judgment or documentation.","when_to_set_to_null":"Set to null if the expected postoperative admission duration is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the expected duration in days of the patient's postoperative hospital admission."} // "expected to remain admitted for ≥ 2 postoperative days"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (>= patient_expected_postoperative_admission_duration_value_in_days 2)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "expected to remain admitted for ≥ 2 postoperative days"
