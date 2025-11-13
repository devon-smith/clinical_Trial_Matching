;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypertensive disorder (hypertension)."} // "To be included, the patient must be a patient with high risk hypertension."
(declare-const patient_glomerular_filtration_rate_value_recorded_now_withunit_ml_per_min_per_1_73m2 Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current estimated glomerular filtration rate (eGFR) in mL/min/1.73m2 is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current estimated glomerular filtration rate (eGFR) in mL/min/1.73m2."} // "estimated glomerular filtration rate > 60" and "estimated glomerular filtration rate ≤ 60"
(declare-const patient_has_finding_of_target_organ_damage_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has at least one instance of target organ damage.","when_to_set_to_false":"Set to false if the patient currently has no instances of target organ damage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any target organ damage.","meaning":"Boolean indicating whether the patient currently has at least one instance of target organ damage."} // "at least one of target organ damage"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Patient must be a patient with high risk hypertension.
(assert
  (! patient_has_diagnosis_of_hypertensive_disorder_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a patient with high risk hypertension."

;; Component 1: ((eGFR > 60 AND at least one of target organ damage) OR (eGFR ≤ 60))
(assert
  (! (or (and (> patient_glomerular_filtration_rate_value_recorded_now_withunit_ml_per_min_per_1_73m2 60)
              patient_has_finding_of_target_organ_damage_now)
         (<= patient_glomerular_filtration_rate_value_recorded_now_withunit_ml_per_min_per_1_73m2 60))
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "((estimated glomerular filtration rate > 60 AND at least one of target organ damage) OR (estimated glomerular filtration rate ≤ 60))."
