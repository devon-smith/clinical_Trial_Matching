;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 16 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 16)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 16 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_provided_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided informed consent.","when_to_set_to_false":"Set to false if the patient has not provided informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided informed consent.","meaning":"Boolean indicating whether the patient has provided informed consent."} // "the patient must provide informed consent"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_provided_informed_consent
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must provide informed consent"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_living_in_selected_community_health_promotion_area_of_rajavithi_hospital Bool) ;; {"when_to_set_to_true":"Set to true if the patient is living in the selected community, defined as the health promotion area of Rajavithi Hospital.","when_to_set_to_false":"Set to false if the patient is not living in the selected community, defined as the health promotion area of Rajavithi Hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is living in the selected community, defined as the health promotion area of Rajavithi Hospital.","meaning":"Boolean indicating whether the patient is living in the selected community, specifically the health promotion area of Rajavithi Hospital."} // "the patient must be living in the selected community (health promotion area of Rajavithi Hospital)"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_is_living_in_selected_community_health_promotion_area_of_rajavithi_hospital
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be living in the selected community (health promotion area of Rajavithi Hospital)"
