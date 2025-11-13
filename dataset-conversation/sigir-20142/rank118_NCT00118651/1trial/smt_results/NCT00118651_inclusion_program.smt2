;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_acute_respiratory_symptoms_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acute respiratory symptoms.","when_to_set_to_false":"Set to false if the patient currently does not have acute respiratory symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute respiratory symptoms.","meaning":"Boolean indicating whether the patient currently has acute respiratory symptoms."}  ;; "To be included, the patient must have acute respiratory symptoms."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_acute_respiratory_symptoms_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have acute respiratory symptoms."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_positive_chest_radiograph_findings_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has positive findings on chest radiograph.","when_to_set_to_false":"Set to false if the patient currently does not have positive findings on chest radiograph.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has positive findings on chest radiograph.","meaning":"Boolean indicating whether the patient currently has positive chest radiograph findings."}  ;; "To be included, the patient must have positive chest radiograph findings."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_positive_chest_radiograph_findings_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have positive chest radiograph findings."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_from_emergency_department Bool) ;; {"when_to_set_to_true":"Set to true if the patient is from the emergency department.","when_to_set_to_false":"Set to false if the patient is not from the emergency department.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is from the emergency department.","meaning":"Boolean indicating whether the patient is from the emergency department."}  ;; "To be included, the patient must be from (outpatient clinics OR emergency department)."
(declare-const patient_is_from_outpatient_clinic Bool) ;; {"when_to_set_to_true":"Set to true if the patient is from an outpatient clinic.","when_to_set_to_false":"Set to false if the patient is not from an outpatient clinic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is from an outpatient clinic.","meaning":"Boolean indicating whether the patient is from an outpatient clinic."}  ;; "To be included, the patient must be from (outpatient clinics OR emergency department)."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (or patient_is_from_outpatient_clinic
         patient_is_from_emergency_department)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be from (outpatient clinics OR emergency department)."
