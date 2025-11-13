;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of dementia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of dementia."} // "To be included, the patient must have a diagnosis of dementia."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_dementia_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a diagnosis of dementia."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_impaired_cognition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cognitive impairment.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cognitive impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of cognitive impairment.","meaning":"Boolean indicating whether the patient currently has cognitive impairment."} // "To be included, the patient must have cognitive impairment that is advanced."
(declare-const patient_has_finding_of_impaired_cognition_now@@severity_advanced Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cognitive impairment and the severity is advanced.","when_to_set_to_false":"Set to false if the patient currently has cognitive impairment but the severity is not advanced.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of the patient's cognitive impairment is advanced.","meaning":"Boolean indicating whether the patient's current cognitive impairment is advanced in severity."} // "To be included, the patient must have cognitive impairment that is advanced."

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_impaired_cognition_now@@severity_advanced
         patient_has_finding_of_impaired_cognition_now)
     :named REQ1_AUXILIARY0)) ;; "To be included, the patient must have cognitive impairment that is advanced."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_impaired_cognition_now@@severity_advanced
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have cognitive impairment that is advanced."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_feeding_problem_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented feeding problem.","when_to_set_to_false":"Set to false if the patient currently does not have a documented feeding problem.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a feeding problem.","meaning":"Boolean indicating whether the patient currently has a feeding problem."} // "To be included, the patient must have a feeding problem."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_feeding_problem_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a feeding problem."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age ≥ 65 years"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 65)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (age ≥ 65 years)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_surrogate_decision_maker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a surrogate decision maker.","when_to_set_to_false":"Set to false if the patient currently does not have a surrogate decision maker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a surrogate decision maker.","meaning":"Boolean indicating whether the patient currently has a surrogate decision maker."} // "To be included, the patient must have a surrogate decision maker."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_surrogate_decision_maker_now
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a surrogate decision maker."
