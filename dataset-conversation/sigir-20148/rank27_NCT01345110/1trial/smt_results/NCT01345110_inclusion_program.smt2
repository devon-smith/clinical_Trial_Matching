;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_resident_in_abbiategrasso_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a resident in Abbiategrasso.","when_to_set_to_false":"Set to false if the patient is currently not a resident in Abbiategrasso.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a resident in Abbiategrasso.","meaning":"Boolean indicating whether the patient is currently a resident in Abbiategrasso."}  ;; "To be included, the patient must be a resident in Abbiategrasso."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_is_resident_in_abbiategrasso_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be a resident in Abbiategrasso."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_year_of_birth_value_recorded_now_withunit_years Real) ;; {"when_to_set_to_value":"Set to the patient's year of birth if it is known and recorded.","when_to_set_to_null":"Set to null if the patient's year of birth is unknown, not recorded, or indeterminate.","meaning":"Numeric value representing the patient's year of birth in years."}  ;; "year of birth"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have year of birth ≥ 1935.
(assert
  (! (>= patient_year_of_birth_value_recorded_now_withunit_years 1935)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have year of birth ≥ 1935."

;; Component 1: To be included, the patient must have year of birth ≤ 1939.
(assert
  (! (<= patient_year_of_birth_value_recorded_now_withunit_years 1939)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have year of birth ≤ 1939."
