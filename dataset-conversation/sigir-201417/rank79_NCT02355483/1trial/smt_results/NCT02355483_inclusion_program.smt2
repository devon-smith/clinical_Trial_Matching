;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_admitted_to_emergency_department_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently admitted to the emergency department.","when_to_set_to_false":"Set to false if the patient is not currently admitted to the emergency department.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently admitted to the emergency department.","meaning":"Boolean indicating whether the patient is currently admitted to the emergency department."} // "be an elderly patient admitted to the emergency department"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "be aged ≥ 75 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_is_admitted_to_emergency_department_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "be an elderly patient admitted to the emergency department"

(assert
  (! (>= patient_age_value_recorded_now_in_years 75)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "be aged ≥ 75 years"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_acute_abdominal_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute abdominal pain.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute abdominal pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of acute abdominal pain.","meaning":"Boolean indicating whether the patient currently has acute abdominal pain."} // "To be included, the patient must have acute abdominal pain."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_acute_abdominal_pain_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have acute abdominal pain."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_provided_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided informed consent.","when_to_set_to_false":"Set to false if the patient has not provided informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided informed consent.","meaning":"Boolean indicating whether the patient has provided informed consent."} // "To be included, the patient must provide informed consent."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_provided_informed_consent
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must provide informed consent."
