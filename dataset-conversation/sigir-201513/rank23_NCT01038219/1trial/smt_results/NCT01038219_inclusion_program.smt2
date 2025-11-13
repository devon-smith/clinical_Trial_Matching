;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "be a child (definition: a person from birth up to 18 years of age, unless otherwise specified by local regulations)"
(declare-const patient_has_been_referred_to_emergency_unit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been referred to an emergency unit at the current time.","when_to_set_to_false":"Set to false if the patient has not been referred to an emergency unit at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been referred to an emergency unit at the current time.","meaning":"Boolean indicating whether the patient has been referred to an emergency unit at the current time."}  ;; "be referred to an emergency unit"
(declare-const patient_has_finding_of_patient_in_hospital_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently hospitalized.","when_to_set_to_false":"Set to false if the patient is currently not hospitalized.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently hospitalized.","meaning":"Boolean indicating whether the patient is currently hospitalized."}  ;; "hospitalized"
(declare-const patient_has_finding_of_patient_in_hospital_now@@hospitalized_in_pediatric_department Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently hospitalized and the hospitalization occurs in a pediatric department.","when_to_set_to_false":"Set to false if the patient is currently hospitalized but not in a pediatric department.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hospitalization occurs in a pediatric department.","meaning":"Boolean indicating whether the patient's current hospitalization occurs in a pediatric department."}  ;; "hospitalized in a pediatric department"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_patient_in_hospital_now@@hospitalized_in_pediatric_department
         patient_has_finding_of_patient_in_hospital_now)
     :named REQ0_AUXILIARY0)) ;; "hospitalized in a pediatric department" implies "hospitalized"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: patient must be a child (definition: birth up to 18 years of age, unless otherwise specified by local regulations)
(assert
  (! (and (>= patient_age_value_recorded_now_in_years 0)
          (< patient_age_value_recorded_now_in_years 18))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "be a child (definition: a person from birth up to 18 years of age, unless otherwise specified by local regulations)"

;; Component 1: patient must be referred to an emergency unit
(assert
  (! patient_has_been_referred_to_emergency_unit_now
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "be referred to an emergency unit"

;; Component 2: patient must be hospitalized in a pediatric department
(assert
  (! patient_has_finding_of_patient_in_hospital_now@@hospitalized_in_pediatric_department
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "be hospitalized in a pediatric department"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const number_of_temperature_measurements_patient_may_undergo Real) ;; {"when_to_set_to_value":"Set to the number of temperature measurements the patient may undergo, as permitted by the protocol or clinical context.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many temperature measurements the patient may undergo.","meaning":"Numeric value representing the number of temperature measurements the patient may undergo."}  ;; "the patient may undergo multiple temperature measurements"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The requirement is permissive ("may"), so it is always satisfiable; no constraint is imposed.
(assert
  (! true
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient may undergo multiple temperature measurements"
