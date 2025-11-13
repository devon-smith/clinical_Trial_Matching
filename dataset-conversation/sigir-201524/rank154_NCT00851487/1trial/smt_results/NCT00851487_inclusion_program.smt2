;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's current age in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in months."} // "aged ≥ 2 months AND aged ≤ 59 months"
(declare-const patient_is_attending_outpatient_clinic_of_participating_site_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently attending an outpatient clinic that is a participating site.","when_to_set_to_false":"Set to false if the patient is currently not attending an outpatient clinic that is a participating site.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently attending an outpatient clinic that is a participating site.","meaning":"Boolean indicating whether the patient is currently attending an outpatient clinic that is one of the participating sites."} // "attending the outpatient clinics of the participating sites"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_months 2)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 2 months."
(assert
  (! (<= patient_age_value_recorded_now_in_months 59)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 59 months."
(assert
  (! patient_is_attending_outpatient_clinic_of_participating_site_now
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be attending the outpatient clinics of the participating sites."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pneumonia.","meaning":"Boolean indicating whether the patient currently has pneumonia."} // "the patient must have (World Health Organization defined non-severe pneumonia)"
(declare-const patient_has_finding_of_pneumonia_now@@defined_by_world_health_organization Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pneumonia is defined by the World Health Organization.","when_to_set_to_false":"Set to false if the patient's pneumonia is not defined by the World Health Organization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's pneumonia is defined by the World Health Organization.","meaning":"Boolean indicating whether the patient's pneumonia is defined by the World Health Organization."} // "World Health Organization defined"
(declare-const patient_has_finding_of_pneumonia_now@@non_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pneumonia is classified as non-severe.","when_to_set_to_false":"Set to false if the patient's pneumonia is not classified as non-severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's pneumonia is non-severe.","meaning":"Boolean indicating whether the patient's pneumonia is non-severe."} // "non-severe"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply the stem variable (if pneumonia is defined by WHO, then pneumonia is present)
(assert
  (! (=> patient_has_finding_of_pneumonia_now@@defined_by_world_health_organization
         patient_has_finding_of_pneumonia_now)
     :named REQ1_AUXILIARY0)) ;; "World Health Organization defined non-severe pneumonia"

;; Qualifier variables imply the stem variable (if pneumonia is non-severe, then pneumonia is present)
(assert
  (! (=> patient_has_finding_of_pneumonia_now@@non_severe
         patient_has_finding_of_pneumonia_now)
     :named REQ1_AUXILIARY1)) ;; "non-severe pneumonia"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must have pneumonia that is both defined by WHO and non-severe
(assert
  (! (and patient_has_finding_of_pneumonia_now@@defined_by_world_health_organization
          patient_has_finding_of_pneumonia_now@@non_severe)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have World Health Organization defined non-severe pneumonia"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_accessible_for_follow_up Bool) ;; {"when_to_set_to_true":"Set to true if the patient is accessible for follow-up.","when_to_set_to_false":"Set to false if the patient is not accessible for follow-up.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is accessible for follow-up.","meaning":"Boolean indicating whether the patient is accessible for follow-up."} // "the patient must be accessible for follow-up"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_is_accessible_for_follow_up
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be accessible for follow-up"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const written_informed_consent_provided_by_parent Bool) ;; {"when_to_set_to_true":"Set to true if written informed consent for the patient has been provided by a parent.","when_to_set_to_false":"Set to false if written informed consent for the patient has not been provided by a parent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether written informed consent for the patient has been provided by a parent.","meaning":"Boolean indicating whether written informed consent for the patient has been provided by a parent."} // "written informed consent provided by a parent"
(declare-const written_informed_consent_provided_by_legal_guardian Bool) ;; {"when_to_set_to_true":"Set to true if written informed consent for the patient has been provided by a legal guardian.","when_to_set_to_false":"Set to false if written informed consent for the patient has not been provided by a legal guardian.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether written informed consent for the patient has been provided by a legal guardian.","meaning":"Boolean indicating whether written informed consent for the patient has been provided by a legal guardian."} // "written informed consent provided by a legal guardian"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (or written_informed_consent_provided_by_parent
         written_informed_consent_provided_by_legal_guardian)
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have (written informed consent provided by a parent OR written informed consent provided by a legal guardian)."
