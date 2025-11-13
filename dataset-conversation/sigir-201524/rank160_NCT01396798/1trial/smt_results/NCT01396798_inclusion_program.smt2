;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's current age in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in months."} // "aged ≥ 1 month"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≤ 16 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_months 1.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 1 month."

(assert
  (! (<= patient_age_value_recorded_now_in_years 16.0)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 16 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const episode_of_acute_illness_duration_value_recorded_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days corresponding to the duration of the patient's episode of acute illness, if known and documented.","when_to_set_to_null":"Set to null if the duration of the patient's episode of acute illness is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in days of the patient's episode of acute illness."} // "duration ≤ 5 days"
(declare-const patient_has_finding_of_acute_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an episode of acute illness (acute disease) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had an episode of acute illness (acute disease) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an episode of acute illness (acute disease).","meaning":"Boolean indicating whether the patient has ever had an episode of acute illness (acute disease) in their history."} // "episode of acute illness"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: The patient must have an episode of acute illness of duration ≤ 5 days.
(assert
  (! (and patient_has_finding_of_acute_disease_inthehistory
          (<= episode_of_acute_illness_duration_value_recorded_in_days 5))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have an episode of acute illness of duration ≤ 5 days."
