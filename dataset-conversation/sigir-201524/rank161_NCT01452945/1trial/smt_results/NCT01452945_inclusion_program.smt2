;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's current age in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in months."} // "age ≤ 24 months"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (<= patient_age_value_recorded_now_in_months 24.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be age ≤ 24 months."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_wheezing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently presenting with wheezing.","when_to_set_to_false":"Set to false if the patient is currently not presenting with wheezing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently presenting with wheezing.","meaning":"Boolean indicating whether the patient currently has wheezing."} // "with wheezing"
(declare-const patient_is_presenting_to_pediatric_emergency_department_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently presenting to the pediatric emergency department.","when_to_set_to_false":"Set to false if the patient is not currently presenting to the pediatric emergency department.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently presenting to the pediatric emergency department.","meaning":"Boolean indicating whether the patient is currently presenting to the pediatric emergency department."} // "presenting to the pediatric emergency department"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must be presenting to the pediatric emergency department with wheezing.
(assert
  (! (and patient_is_presenting_to_pediatric_emergency_department_now
          patient_has_finding_of_wheezing_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be presenting to the pediatric emergency department (emergency department) with wheezing."
