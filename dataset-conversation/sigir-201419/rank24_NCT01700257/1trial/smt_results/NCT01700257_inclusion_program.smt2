;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_ex_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a former smoker (has a history of smoking but is not currently a smoker).","when_to_set_to_false":"Set to false if the patient is currently not a former smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a former smoker.","meaning":"Boolean indicating whether the patient is currently a former smoker."} // "former smoker"
(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a smoker.","when_to_set_to_false":"Set to false if the patient is currently not a smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a smoker.","meaning":"Boolean indicating whether the patient is currently a smoker."} // "smoker"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_has_finding_of_smoker_now
         patient_has_finding_of_ex_smoker_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must (be a smoker OR be a former smoker)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_cigarette_pack_years_value_recorded_inthehistory_withunit_pack_years Real) ;; {"when_to_set_to_value":"Set to the total number of cigarette pack years if a numeric measurement or calculation of pack years in the patient's history is available.","when_to_set_to_null":"Set to null if no such measurement or calculation is available or the value is indeterminate.","meaning":"Numeric value representing the patient's total cigarette pack years in their history."} // "pack years"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must have a smoking history (pack years ≥ 20).
(assert
  (! (>= patient_cigarette_pack_years_value_recorded_inthehistory_withunit_pack_years 20.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a smoking history (pack years ≥ 20)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 50 years AND aged ≤ 75 years"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must be aged ≥ 50 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 50)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 50 years."

;; Component 1: To be included, the patient must be aged ≤ 75 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 75)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 75 years."
