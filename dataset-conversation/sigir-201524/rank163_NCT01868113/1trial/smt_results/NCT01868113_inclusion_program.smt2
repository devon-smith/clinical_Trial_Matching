;; ===================== Declarations for the inclusion criteria (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's current age in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in months."}  ;; "aged 2 to 59 months"
(declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cough as a clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have cough as a clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cough as a clinical finding.","meaning":"Boolean indicating whether the patient currently has cough as a clinical finding."}  ;; "cough"
(declare-const patient_has_finding_of_difficulty_breathing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has difficult breathing as a clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have difficult breathing as a clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has difficult breathing as a clinical finding.","meaning":"Boolean indicating whether the patient currently has difficult breathing as a clinical finding."}  ;; "difficult breathing"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: The patient must be aged 2 to 59 months.
(assert
  (! (and (>= patient_age_value_recorded_now_in_months 2.0)
          (<= patient_age_value_recorded_now_in_months 59.0))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged 2 to 59 months."

;; Component 1: The patient must have cough or difficult breathing.
(assert
  (! (or patient_has_finding_of_cough_now
         patient_has_finding_of_difficulty_breathing_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have cough or difficult breathing."
