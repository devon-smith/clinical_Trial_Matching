;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypertensive disorder (hypertension)."}

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_hypertensive_disorder_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have hypertension."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age > 18 years"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (age > 18 years)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cough.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of cough.","meaning":"Boolean indicating whether the patient currently has cough."} // "cough"
(declare-const patient_has_finding_of_cough_now@@related_to_previous_angiotensin_converting_enzyme_inhibitor_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current cough is related to previous angiotensin-converting enzyme inhibitor treatment.","when_to_set_to_false":"Set to false if the patient's current cough is not related to previous angiotensin-converting enzyme inhibitor treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current cough is related to previous angiotensin-converting enzyme inhibitor treatment.","meaning":"Boolean indicating whether the patient's current cough is related to previous angiotensin-converting enzyme inhibitor treatment."} // "cough related to previous angiotensin-converting enzyme inhibitor treatment"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies the stem variable (if cough is related to ACE inhibitor, then cough is present)
(assert
  (! (=> patient_has_finding_of_cough_now@@related_to_previous_angiotensin_converting_enzyme_inhibitor_treatment
         patient_has_finding_of_cough_now)
     :named REQ2_AUXILIARY0)) ;; "cough related to previous angiotensin-converting enzyme inhibitor treatment" implies "cough"

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must have a cough related to previous angiotensin-converting enzyme inhibitor treatment
(assert
  (! patient_has_finding_of_cough_now@@related_to_previous_angiotensin_converting_enzyme_inhibitor_treatment
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (a cough related to previous angiotensin-converting enzyme inhibitor treatment)."
