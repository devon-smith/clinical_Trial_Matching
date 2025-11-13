;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "age ≥ 65 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must have age ≥ 65 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 65)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have age ≥ 65 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_undergoing_admission_to_care_of_the_elderly_department_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently admitted to a care of the elderly (acute geriatric) department.","when_to_set_to_false":"Set to false if the patient is not currently admitted to a care of the elderly (acute geriatric) department.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently admitted to a care of the elderly (acute geriatric) department.","meaning":"Boolean indicating whether the patient is currently admitted to a care of the elderly (acute geriatric) department."} ;; "the patient must be hospitalized at the acute geriatric unit"
(declare-const patient_is_undergoing_admission_to_care_of_the_elderly_department_now@@located_at_complejo_hospitalario_universitario_of_albacete Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current admission to a care of the elderly (acute geriatric) department is specifically to a unit located at the Complejo Hospitalario Universitario of Albacete.","when_to_set_to_false":"Set to false if the patient's current admission to a care of the elderly (acute geriatric) department is not to a unit located at the Complejo Hospitalario Universitario of Albacete.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the care of the elderly (acute geriatric) department is located at the Complejo Hospitalario Universitario of Albacete.","meaning":"Boolean indicating whether the care of the elderly (acute geriatric) department is located at the Complejo Hospitalario Universitario of Albacete."} ;; "of the Complejo Hospitalario Universitario of Albacete"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the stem variable (if patient is admitted to the acute geriatric unit at this hospital, then they are admitted to an acute geriatric unit)
(assert
  (! (=> patient_is_undergoing_admission_to_care_of_the_elderly_department_now@@located_at_complejo_hospitalario_universitario_of_albacete
         patient_is_undergoing_admission_to_care_of_the_elderly_department_now)
     :named REQ1_AUXILIARY0)) ;; "the patient must be hospitalized at the acute geriatric unit of the Complejo Hospitalario Universitario of Albacete."

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must be admitted to the acute geriatric unit at the specified hospital
(assert
  (! patient_is_undergoing_admission_to_care_of_the_elderly_department_now@@located_at_complejo_hospitalario_universitario_of_albacete
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be hospitalized at the acute geriatric unit of the Complejo Hospitalario Universitario of Albacete."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_valid_signed_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a valid and signed informed consent for study participation, provided either by the patient or by the legal representative of the patient.","when_to_set_to_false":"Set to false if the patient does not currently have a valid and signed informed consent for study participation, or if the consent is invalid or unsigned, or not provided by the patient or legal representative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a valid and signed informed consent for study participation.","meaning":"Boolean indicating whether the patient currently has a valid and signed informed consent for study participation."} ;; "the patient must have a valid signed informed consent (provided by the patient OR provided by the legal representative of the patient)"
(declare-const patient_has_valid_signed_informed_consent_now@@provided_by_patient_or_legal_representative Bool) ;; {"when_to_set_to_true":"Set to true if the valid and signed informed consent was provided by the patient or by the legal representative of the patient.","when_to_set_to_false":"Set to false if the valid and signed informed consent was not provided by the patient or by the legal representative of the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the valid and signed informed consent was provided by the patient or by the legal representative of the patient.","meaning":"Boolean indicating whether the valid and signed informed consent was provided by the patient or by the legal representative of the patient."} ;; "provided by the patient OR provided by the legal representative of the patient"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies the stem variable (if consent is provided by patient or legal representative, then valid signed consent exists)
(assert
  (! (=> patient_has_valid_signed_informed_consent_now@@provided_by_patient_or_legal_representative
         patient_has_valid_signed_informed_consent_now)
     :named REQ2_AUXILIARY0)) ;; "provided by the patient OR provided by the legal representative of the patient" implies "valid signed informed consent"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Inclusion: patient must have a valid signed informed consent provided by the patient or legal representative
(assert
  (! patient_has_valid_signed_informed_consent_now@@provided_by_patient_or_legal_representative
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have a valid signed informed consent (provided by the patient OR provided by the legal representative of the patient)"
