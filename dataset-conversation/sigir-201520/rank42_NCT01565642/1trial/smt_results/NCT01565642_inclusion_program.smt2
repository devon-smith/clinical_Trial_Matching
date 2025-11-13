;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const surrogate_is_paired_with_patient_now Bool) ;; {"when_to_set_to_true":"Set to true if the surrogate is currently paired with the patient.","when_to_set_to_false":"Set to false if the surrogate is not currently paired with the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surrogate is currently paired with the patient.","meaning":"Boolean indicating whether the surrogate is currently paired with the patient."} // "the patient must have a surrogate who is paired with the patient"
(declare-const surrogate_is_nursing_home_resident_now Bool) ;; {"when_to_set_to_true":"Set to true if the surrogate is currently a resident of a nursing home.","when_to_set_to_false":"Set to false if the surrogate is not currently a resident of a nursing home.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surrogate is currently a resident of a nursing home.","meaning":"Boolean indicating whether the surrogate is currently a resident of a nursing home."} // "the surrogate must be a nursing home resident"
(declare-const surrogate_has_finding_of_dementia_now@@advanced_stage Bool) ;; {"when_to_set_to_true":"Set to true if the surrogate currently has dementia and the dementia is at an advanced stage.","when_to_set_to_false":"Set to false if the surrogate currently has dementia but it is not at an advanced stage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surrogate currently has dementia at an advanced stage.","meaning":"Boolean indicating whether the surrogate currently has dementia and the dementia is advanced."} // "the surrogate must have advanced dementia"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! surrogate_is_paired_with_patient_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have a surrogate who is paired with the patient"

(assert
  (! (and surrogate_is_nursing_home_resident_now
          surrogate_has_finding_of_dementia_now@@advanced_stage)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the surrogate must be a nursing home resident with advanced dementia"
