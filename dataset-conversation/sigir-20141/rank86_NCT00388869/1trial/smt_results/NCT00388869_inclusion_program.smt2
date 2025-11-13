;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_undergoing_ct_of_abdomen_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing or has been referred for an abdominal computed tomography examination.","when_to_set_to_false":"Set to false if the patient is not currently undergoing and has not been referred for an abdominal computed tomography examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing or has been referred for an abdominal computed tomography examination.","meaning":"Boolean indicating whether the patient is currently undergoing or has been referred for an abdominal computed tomography examination."} // "abdominal computed tomography examination"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "be aged ≥ 30 years AND be aged ≤ 100 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be referred for abdominal computed tomography examination.
(assert
  (! patient_is_undergoing_ct_of_abdomen_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be referred for abdominal computed tomography examination."

;; Component 1: To be included, the patient must be aged ≥ 30 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 30)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 30 years."

;; Component 2: To be included, the patient must be aged ≤ 100 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 100)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 100 years."
