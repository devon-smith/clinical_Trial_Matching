;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 35 years AND aged ≤ 85 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 35.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 35 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 85.0)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 85 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypertensive disorder (hypertension)."} ;; "a patient with hypertension"
(declare-const patient_has_diagnosis_of_ischemic_stroke_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of ischemic stroke.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of ischemic stroke.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of ischemic stroke.","meaning":"Boolean indicating whether the patient currently has a diagnosis of ischemic stroke."} ;; "a patient who had an ischemic stroke"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must be a patient with hypertension.
(assert
  (! patient_has_diagnosis_of_hypertensive_disorder_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "a patient with hypertension"

;; Component 1: To be included, the patient must be a patient who had an ischemic stroke.
(assert
  (! patient_has_diagnosis_of_ischemic_stroke_now
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "a patient who had an ischemic stroke"
