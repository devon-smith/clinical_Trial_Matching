;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged between 5 and 20 years"
(declare-const patient_has_finding_of_abdominal_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of abdominal pain.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of abdominal pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abdominal pain.","meaning":"Boolean indicating whether the patient currently has abdominal pain."}  ;; "abdominal pain"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: The patient must be aged between 5 and 20 years (inclusive)
(assert
  (! (and (>= patient_age_value_recorded_now_in_years 5.0)
          (<= patient_age_value_recorded_now_in_years 20.0))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be a child or adolescent aged between 5 and 20 years"

;; Component 1: The patient must have abdominal pain
(assert
  (! patient_has_finding_of_abdominal_pain_now
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must have abdominal pain"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const provider_count_trained_in_emergency_medicine_at_participating_emergency_department Real) ;; {"when_to_set_to_value":"Set to the number of providers trained in emergency medicine present at a participating emergency department.","when_to_set_to_null":"Set to null if the number of providers trained in emergency medicine at a participating emergency department is unknown, not documented, or cannot be determined.","meaning":"Numeric value for the number of providers trained in emergency medicine at a participating emergency department."}  ;; "at least one provider trained in emergency medicine at a participating emergency department"
(declare-const provider_count_trained_in_family_medicine_at_participating_emergency_department Real) ;; {"when_to_set_to_value":"Set to the number of providers trained in family medicine present at a participating emergency department.","when_to_set_to_null":"Set to null if the number of providers trained in family medicine at a participating emergency department is unknown, not documented, or cannot be determined.","meaning":"Numeric value for the number of providers trained in family medicine at a participating emergency department."}  ;; "at least one provider trained in family medicine at a participating emergency department"
(declare-const provider_count_trained_in_internal_medicine_at_participating_emergency_department Real) ;; {"when_to_set_to_value":"Set to the number of providers trained in internal medicine present at a participating emergency department.","when_to_set_to_null":"Set to null if the number of providers trained in internal medicine at a participating emergency department is unknown, not documented, or cannot be determined.","meaning":"Numeric value for the number of providers trained in internal medicine at a participating emergency department."}  ;; "at least one provider trained in internal medicine at a participating emergency department"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have (at least one provider trained in internal medicine OR at least one provider trained in family medicine OR at least one provider trained in emergency medicine) at a participating emergency department.
(assert
  (! (or (>= provider_count_trained_in_internal_medicine_at_participating_emergency_department 1)
         (>= provider_count_trained_in_family_medicine_at_participating_emergency_department 1)
         (>= provider_count_trained_in_emergency_medicine_at_participating_emergency_department 1))
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "at least one provider trained in internal medicine OR at least one provider trained in family medicine OR at least one provider trained in emergency medicine at a participating emergency department"
