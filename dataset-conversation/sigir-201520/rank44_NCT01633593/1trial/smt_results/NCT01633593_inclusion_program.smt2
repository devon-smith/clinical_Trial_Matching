;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age > 60 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 60)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (age > 60 years)."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_delirium_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of delirium.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of delirium.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of delirium.","meaning":"Boolean indicating whether the patient currently has a diagnosis of delirium."} // "delirium"
(declare-const patient_has_diagnosis_of_delirium_now@@diagnosed_according_to_confusion_assessment_method_for_intensive_care_unit Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of delirium was made according to the Confusion Assessment Method for Intensive Care Unit (CAM-ICU).","when_to_set_to_false":"Set to false if the patient's current diagnosis of delirium was not made according to the Confusion Assessment Method for Intensive Care Unit (CAM-ICU).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of delirium was made according to the Confusion Assessment Method for Intensive Care Unit (CAM-ICU).","meaning":"Boolean indicating whether the patient's current diagnosis of delirium was made according to the Confusion Assessment Method for Intensive Care Unit (CAM-ICU)."} // "delirium diagnosed according to the Confusion Assessment Method for Intensive Care Unit"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_delirium_now@@diagnosed_according_to_confusion_assessment_method_for_intensive_care_unit
         patient_has_diagnosis_of_delirium_now)
     :named REQ1_AUXILIARY0)) ;; "delirium diagnosed according to the Confusion Assessment Method for Intensive Care Unit" implies "delirium"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_diagnosis_of_delirium_now@@diagnosed_according_to_confusion_assessment_method_for_intensive_care_unit
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (delirium diagnosed according to the Confusion Assessment Method for Intensive Care Unit)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_informed_consent_provided_by_legal_representative_now Bool) ;; {"when_to_set_to_true":"Set to true if informed consent has been provided by the patient's legal representative for the patient at the current time.","when_to_set_to_false":"Set to false if informed consent has not been provided by the patient's legal representative for the patient at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether informed consent has been provided by the patient's legal representative for the patient at the current time.","meaning":"Boolean indicating whether the patient currently has informed consent provided by the patient's legal representative."} // "informed consent provided by the patient's legal representative"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_informed_consent_provided_by_legal_representative_now
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have (informed consent provided by the patient's legal representative)."
