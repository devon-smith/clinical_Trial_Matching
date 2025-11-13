;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_non_compliant_behavior_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently exhibits non-compliant behavior.","when_to_set_to_false":"Set to false if the patient currently does not exhibit non-compliant behavior.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently exhibits non-compliant behavior.","meaning":"Boolean indicating whether the patient currently exhibits non-compliant behavior."} ;; "non-compliant"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_finding_of_non_compliant_behavior_now)
     :named REQ0_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is non-compliant."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_serum_creatinine_level_finding_value_recorded_now_withunit_micromoles_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current serum creatinine concentration in micromoles per liter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current serum creatinine concentration in micromoles per liter."} ;; "serum creatinine concentration"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (> patient_serum_creatinine_level_finding_value_recorded_now_withunit_micromoles_per_liter 200))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has serum creatinine concentration > 200 micromoles per liter."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_atrial_fibrillation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of atrial fibrillation.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of atrial fibrillation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of atrial fibrillation.","meaning":"Boolean indicating whether the patient currently has atrial fibrillation."} ;; "atrial fibrillation"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_atrial_fibrillation_now)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has atrial fibrillation."
