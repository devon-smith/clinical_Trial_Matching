;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_community_acquired_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of community-acquired pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of community-acquired pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of community-acquired pneumonia.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of community-acquired pneumonia."} ;; "clinical diagnosis of community-acquired pneumonia"
(declare-const patient_has_radiological_diagnosis_of_community_acquired_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a radiological diagnosis of community-acquired pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a radiological diagnosis of community-acquired pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a radiological diagnosis of community-acquired pneumonia.","meaning":"Boolean indicating whether the patient currently has a radiological diagnosis of community-acquired pneumonia."} ;; "radiological diagnosis of community-acquired pneumonia"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: clinical diagnosis of community-acquired pneumonia
(assert
  (! patient_has_diagnosis_of_community_acquired_pneumonia_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a clinical diagnosis of community-acquired pneumonia."

;; Component 1: radiological diagnosis of community-acquired pneumonia
(assert
  (! patient_has_radiological_diagnosis_of_community_acquired_pneumonia_now
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a radiological diagnosis of community-acquired pneumonia."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_provided_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided informed consent.","when_to_set_to_false":"Set to false if the patient has not provided informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided informed consent.","meaning":"Boolean indicating whether the patient has provided informed consent."} ;; "the patient must provide informed consent"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_provided_informed_consent
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must provide informed consent"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_admitted_to_hospital_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently admitted to the hospital.","when_to_set_to_false":"Set to false if the patient is not currently admitted to the hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently admitted to the hospital.","meaning":"Boolean indicating whether the patient is currently admitted to the hospital."} ;; "the patient must be admitted to the hospital"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_is_admitted_to_hospital_now
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be admitted to the hospital"
