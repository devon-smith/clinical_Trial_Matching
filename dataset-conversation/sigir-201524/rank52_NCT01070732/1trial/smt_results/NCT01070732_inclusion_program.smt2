;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged greater than or equal to 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged greater than or equal to 18 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_provided_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent.","meaning":"Boolean indicating whether the patient has provided written informed consent."} ;; "the patient must provide written informed consent"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_provided_written_informed_consent
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must provide written informed consent"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a medical condition.","when_to_set_to_false":"Set to false if the patient currently does not have a medical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a medical condition.","meaning":"Boolean indicating whether the patient currently has a medical condition."} ;; "medical condition"
(declare-const patient_has_finding_of_disease_condition_finding_now@@necessitates_administration_of_antipyretic_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current medical condition necessitates the administration of antipyretic medication.","when_to_set_to_false":"Set to false if the patient's current medical condition does not necessitate the administration of antipyretic medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current medical condition necessitates antipyretic medication.","meaning":"Boolean indicating whether the patient's current medical condition necessitates antipyretic medication."} ;; "medical condition necessitating the administration of antipyretic medication"
(declare-const patient_has_finding_of_disease_condition_finding_now@@necessitates_administration_of_analgesic_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current medical condition necessitates the administration of analgesic medication.","when_to_set_to_false":"Set to false if the patient's current medical condition does not necessitate the administration of analgesic medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current medical condition necessitates analgesic medication.","meaning":"Boolean indicating whether the patient's current medical condition necessitates analgesic medication."} ;; "medical condition necessitating the administration of analgesic medication"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply the patient has a medical condition
(assert
  (! (=> patient_has_finding_of_disease_condition_finding_now@@necessitates_administration_of_antipyretic_medication
         patient_has_finding_of_disease_condition_finding_now)
     :named REQ2_AUXILIARY0)) ;; "medical condition necessitating the administration of antipyretic medication" implies "medical condition"

(assert
  (! (=> patient_has_finding_of_disease_condition_finding_now@@necessitates_administration_of_analgesic_medication
         patient_has_finding_of_disease_condition_finding_now)
     :named REQ2_AUXILIARY1)) ;; "medical condition necessitating the administration of analgesic medication" implies "medical condition"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have (a medical condition necessitating the administration of antipyretic medication OR a medical condition necessitating the administration of analgesic medication).
(assert
  (! (or patient_has_finding_of_disease_condition_finding_now@@necessitates_administration_of_antipyretic_medication
         patient_has_finding_of_disease_condition_finding_now@@necessitates_administration_of_analgesic_medication)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "a medical condition necessitating the administration of antipyretic medication OR a medical condition necessitating the administration of analgesic medication"
