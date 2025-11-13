;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 18 years AND aged ≤ 65 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be aged ≥ 18 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; Component 1: To be included, the patient must be aged ≤ 65 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 65)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 65 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypertensive disorder (hypertension)."}  ;; "have known hypertension"
(declare-const patient_is_taking_hypotensive_agent_now Real) ;; {"when_to_set_to_value":"Set to the number of anti-hypertensive drugs the patient is currently taking now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many anti-hypertensive drugs the patient is currently taking.","meaning":"Numeric variable representing the number of anti-hypertensive drugs the patient is currently taking now."}  ;; "be on ≥ 3 anti-hypertensive drugs"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Patient must have known hypertension
(assert
  (! patient_has_diagnosis_of_hypertensive_disorder_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have known hypertension."

;; Component 1: Patient must be on ≥ 3 anti-hypertensive drugs
(assert
  (! (>= patient_is_taking_hypotensive_agent_now 3)
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be on ≥ 3 anti-hypertensive drugs."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_apnea_hypopnea_index_value_recorded_now_withunit_per_hour Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current apnea-hypopnea index (AHI) in events per hour is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current apnea-hypopnea index (AHI) in events per hour."}  ;; "apnea-hypopnea index"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: "To be included, the patient must have an apnea-hypopnea index ≥ 15."
(assert
  (! (>= patient_apnea_hypopnea_index_value_recorded_now_withunit_per_hour 15.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_able_to_give_informed_written_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to give informed written consent.","when_to_set_to_false":"Set to false if the patient is currently not able to give informed written consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to give informed written consent.","meaning":"Boolean indicating whether the patient is currently able to give informed written consent."} ;; "To be included, the patient must be able to give informed written consent."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_is_able_to_give_informed_written_consent_now
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be able to give informed written consent."
