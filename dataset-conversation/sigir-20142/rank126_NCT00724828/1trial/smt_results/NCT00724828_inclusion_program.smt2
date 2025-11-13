;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_well_child_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a healthy child.","when_to_set_to_false":"Set to false if the patient is currently not a healthy child.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a healthy child.","meaning":"Boolean indicating whether the patient is currently a healthy child."}  ;; "To be included, the patient must be a healthy child."
(declare-const patient_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's current age in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in months."}  ;; "aged ≥ 2 months AND aged ≤ 5 years"
(declare-const patient_is_attending_well_baby_clinic_in_hospital_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently attending the well baby clinic in hospital.","when_to_set_to_false":"Set to false if the patient is currently not attending the well baby clinic in hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently attending the well baby clinic in hospital.","meaning":"Boolean indicating whether the patient is currently attending the well baby clinic in hospital."}  ;; "To be included, the patient must be attending the well baby clinic in hospital."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_well_child_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be a healthy child."

(assert
  (! (>= patient_age_value_recorded_now_in_months 2)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 2 months."

(assert
  (! (<= patient_age_value_recorded_now_in_months 60)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 5 years." (5 years = 60 months)

(assert
  (! patient_is_attending_well_baby_clinic_in_hospital_now
     :named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be attending the well baby clinic in hospital."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const informed_consent_obtained_from_legal_guardian Bool) ;; {"when_to_set_to_true":"Set to true if informed consent has been obtained from the patient's legal guardian.","when_to_set_to_false":"Set to false if informed consent has not been obtained from the patient's legal guardian.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether informed consent has been obtained from the patient's legal guardian.","meaning":"Boolean indicating whether informed consent has been obtained from the patient's legal guardian."}  ;; "informed consent obtained from the patient's legal guardian"
(declare-const informed_consent_obtained_from_parents Bool) ;; {"when_to_set_to_true":"Set to true if informed consent has been obtained from the patient's parents.","when_to_set_to_false":"Set to false if informed consent has not been obtained from the patient's parents.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether informed consent has been obtained from the patient's parents.","meaning":"Boolean indicating whether informed consent has been obtained from the patient's parents."}  ;; "informed consent obtained from the patient's parents"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have (informed consent obtained from the patient's parents OR informed consent obtained from the patient's legal guardian).
(assert
  (! (or informed_consent_obtained_from_parents
         informed_consent_obtained_from_legal_guardian)
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have (informed consent obtained from the patient's parents OR informed consent obtained from the patient's legal guardian)."
