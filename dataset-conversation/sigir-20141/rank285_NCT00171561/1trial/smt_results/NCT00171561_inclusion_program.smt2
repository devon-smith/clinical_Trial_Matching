;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_type_2_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of type 2 diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of type 2 diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of type 2 diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of type 2 diabetes mellitus."} ;; "To be included, the patient must have type 2 diabetes mellitus."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_type_2_diabetes_mellitus_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have type 2 diabetes mellitus."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_elevated_blood_pressure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of elevated blood pressure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of elevated blood pressure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of elevated blood pressure.","meaning":"Boolean indicating whether the patient currently has elevated blood pressure."} ;; "To be included, the patient must have elevated blood pressure."
(declare-const patient_has_finding_of_widened_pulse_pressure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of widened pulse pressure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of widened pulse pressure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of widened pulse pressure.","meaning":"Boolean indicating whether the patient currently has widened pulse pressure."} ;; "To be included, the patient must have elevated pulse pressure."
(declare-const patient_pulse_pressure_value_recorded_now_withunit_mm_hg Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's pulse pressure measured now, in mm Hg.","when_to_set_to_null":"Set to null if the patient's pulse pressure value measured now is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's pulse pressure measured now, in mm Hg."} ;; "Numeric value indicating the patient's pulse pressure measured now, in millimeters of mercury (mm Hg)."

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have elevated blood pressure.
(assert
  (! patient_has_finding_of_elevated_blood_pressure_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have elevated blood pressure."

;; Component 1: To be included, the patient must have elevated pulse pressure.
(assert
  (! patient_has_finding_of_widened_pulse_pressure_now
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have elevated pulse pressure."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_albuminuria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of albuminuria.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of albuminuria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has albuminuria.","meaning":"Boolean indicating whether the patient currently has albuminuria."} ;; "To be included, the patient must have albuminuria."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_albuminuria_now
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have albuminuria."
