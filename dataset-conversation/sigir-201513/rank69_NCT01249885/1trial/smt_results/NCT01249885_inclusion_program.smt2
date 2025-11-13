;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_well_child_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a well child (healthy child).","when_to_set_to_false":"Set to false if the patient is currently not a well child (not a healthy child).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a well child.","meaning":"Boolean indicating whether the patient is currently a well child (healthy child)."}  // "To be included, the patient must be a healthy child."
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  // "To be included, the patient must be aged ≥ 3 years AND ≤ 4 years."
(declare-const patient_is_using_pacifier_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a pacifier.","when_to_set_to_false":"Set to false if the patient is currently not using a pacifier.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a pacifier.","meaning":"Boolean indicating whether the patient is currently using a pacifier."}  // "To be included, the patient must use a pacifier."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_well_child_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be a healthy child."
(assert
  (! (>= patient_age_value_recorded_now_in_years 3.0)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 3 years."
(assert
  (! (<= patient_age_value_recorded_now_in_years 4.0)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 4 years."
(assert
  (! patient_is_using_pacifier_now
     :named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "To be included, the patient must use a pacifier."
