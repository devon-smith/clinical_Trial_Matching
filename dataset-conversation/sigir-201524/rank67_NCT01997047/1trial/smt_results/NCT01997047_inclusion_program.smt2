;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's current age in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in months."} // "child below 5 years of age"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "child below 5 years of age"
(declare-const patient_has_finding_of_tachypnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of tachypnea.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of tachypnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of tachypnea.","meaning":"Boolean indicating whether the patient currently has tachypnea."} // "tachypnea"

(declare-const patient_exceeds_who_age_dependent_tachypnea_criteria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently exceeds the World Health Organization age-dependent tachypnea criteria.","when_to_set_to_false":"Set to false if the patient currently does not exceed the World Health Organization age-dependent tachypnea criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently exceeds the WHO age-dependent tachypnea criteria.","meaning":"Boolean indicating whether the patient currently exceeds WHO age-dependent tachypnea criteria."} // "must exceed World Health Organization age-dependent tachypnea criteria"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable for exceeding WHO age-dependent tachypnea criteria implies tachypnea finding
(assert
  (! (=> patient_exceeds_who_age_dependent_tachypnea_criteria_now
         patient_has_finding_of_tachypnea_now)
     :named REQ0_AUXILIARY0)) ;; "must exceed World Health Organization age-dependent tachypnea criteria"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: child below 5 years of age
(assert
  (! (< patient_age_value_recorded_now_in_years 5)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "child below 5 years of age"

;; Component 1: must exceed WHO age-dependent tachypnea criteria
(assert
  (! patient_exceeds_who_age_dependent_tachypnea_criteria_now
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "must exceed World Health Organization age-dependent tachypnea criteria"
