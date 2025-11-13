;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_contraindication_to_vaccination_now@@as_specified_in_green_book_immunisation_against_infectious_disease_her_majestys_stationery_office Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any contraindication to vaccination as specified in the Green Book - Immunisation Against Infectious Disease (Her Majesty's Stationery Office).","when_to_set_to_false":"Set to false if the patient currently does not have any contraindication to vaccination as specified in the Green Book - Immunisation Against Infectious Disease (Her Majesty's Stationery Office).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any contraindication to vaccination as specified in the Green Book - Immunisation Against Infectious Disease (Her Majesty's Stationery Office).","meaning":"Boolean indicating whether the patient currently has any contraindication to vaccination as specified in the Green Book - Immunisation Against Infectious Disease (Her Majesty's Stationery Office)."}

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must have no contraindications to vaccination as specified in the Green Book - Immunisation Against Infectious Disease (Her Majesty's Stationery Office).
(assert
  (! (not patient_has_contraindication_to_vaccination_now@@as_specified_in_green_book_immunisation_against_infectious_disease_her_majestys_stationery_office)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have no contraindications to vaccination as specified in the Green Book - Immunisation Against Infectious Disease (Her Majesty's Stationery Office)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_provided_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent.","meaning":"Boolean indicating whether the patient has provided written informed consent."} // "To be included, the patient must have provided written informed consent."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_provided_written_informed_consent
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have provided written informed consent."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_days Real) ;; {"when_to_set_to_value":"Set to the patient's current age in days if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in days is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in days."} // "aged ≥ 50 years 0 days AND aged ≤ 79 years 364 days at enrollment"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 50 years 0 days AND aged ≤ 79 years 364 days at enrollment"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: patient must be aged ≥ 50 years 0 days at enrollment
(assert
  (! (>= patient_age_value_recorded_now_in_days 18250)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "aged ≥ 50 years 0 days at enrollment"

;; Component 1: patient must be aged ≤ 79 years 364 days at enrollment
(assert
  (! (<= patient_age_value_recorded_now_in_days 29159)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "aged ≤ 79 years 364 days at enrollment"
