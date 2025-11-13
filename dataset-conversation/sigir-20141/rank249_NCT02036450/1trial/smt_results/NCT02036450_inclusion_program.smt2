;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 70 years AND aged ≤ 90 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be aged ≥ 70 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 70)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 70 years."

;; Component 1: To be included, the patient must be aged ≤ 90 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 90)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 90 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_diabetes_mellitus_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with diabetes mellitus (including type 1 or type 2) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with diabetes mellitus (including type 1 or type 2) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with diabetes mellitus.","meaning":"Boolean indicating whether the patient has ever been diagnosed with diabetes mellitus (type 1 or type 2) in their medical history."} ;; "diabetes mellitus (with exhaustive subcategories (type 1 diabetes mellitus OR type 2 diabetes mellitus), with or without medical therapy)"
(declare-const patient_has_diagnosis_of_heart_failure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with heart failure at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with heart failure at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with heart failure.","meaning":"Boolean indicating whether the patient has ever been diagnosed with heart failure in their medical history."} ;; "heart failure"
(declare-const patient_has_diagnosis_of_hypertensive_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with hypertension at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with hypertension at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with hypertension.","meaning":"Boolean indicating whether the patient has ever been diagnosed with hypertension in their medical history."} ;; "hypertension (with or without medical therapy)"
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with stroke at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with stroke at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with stroke.","meaning":"Boolean indicating whether the patient has ever been diagnosed with stroke in their medical history."} ;; "stroke"
(declare-const patient_has_diagnosis_of_transient_cerebral_ischemia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with transient ischemic attack at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with transient ischemic attack at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with transient ischemic attack.","meaning":"Boolean indicating whether the patient has ever been diagnosed with transient ischemic attack in their medical history."} ;; "transient ischemic attack"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: At least one of (diabetes mellitus (type 1 or type 2), hypertension, heart failure, stroke) in history
(assert
  (! (or patient_has_diagnosis_of_diabetes_mellitus_inthehistory
         patient_has_diagnosis_of_hypertensive_disorder_inthehistory
         patient_has_diagnosis_of_heart_failure_inthehistory
         patient_has_diagnosis_of_cerebrovascular_accident_inthehistory)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have been previously diagnosed with (at least one of the following: (diabetes mellitus (with exhaustive subcategories (type 1 diabetes mellitus OR type 2 diabetes mellitus), with or without medical therapy) OR hypertension (with or without medical therapy) OR heart failure OR stroke))."

;; Component 1: Must NOT have been previously diagnosed with transient ischemic attack
(assert
  (! (not patient_has_diagnosis_of_transient_cerebral_ischemia_inthehistory)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must not have been previously diagnosed with (transient ischemic attack)."
