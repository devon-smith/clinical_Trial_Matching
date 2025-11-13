;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_ischemic_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of ischemic heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of ischemic heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of ischemic heart disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of ischemic heart disease."} // "To be included, the patient must have stable ischemic heart disease."
(declare-const patient_has_diagnosis_of_ischemic_heart_disease_now@@stable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of ischemic heart disease is stable (not acute or unstable).","when_to_set_to_false":"Set to false if the patient's current diagnosis of ischemic heart disease is not stable (i.e., it is acute or unstable).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current ischemic heart disease is stable.","meaning":"Boolean indicating whether the patient's current diagnosis of ischemic heart disease is stable."} // "To be included, the patient must have stable ischemic heart disease."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_ischemic_heart_disease_now@@stable
         patient_has_diagnosis_of_ischemic_heart_disease_now)
     :named REQ0_AUXILIARY0)) ;; "To be included, the patient must have stable ischemic heart disease."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_ischemic_heart_disease_now@@stable
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have stable ischemic heart disease."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter Real) ;; {"when_to_set_to_value":"Set to the measured BMI value if a numeric measurement of body mass index (kg/m²) recorded now is available.","when_to_set_to_null":"Set to null if no such BMI measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kilograms per square meter."} // "body mass index"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 28.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (body mass index ≥ 28 kilograms per square meter)."

(assert
  (! (<= patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 40.0)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (body mass index ≤ 40 kilograms per square meter)."
