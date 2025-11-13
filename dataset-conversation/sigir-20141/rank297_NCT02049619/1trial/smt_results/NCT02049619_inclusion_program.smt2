;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_undergoing_orthognathic_operation_of_mandible_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing an orthognathic operation of the mandible.","when_to_set_to_false":"Set to false if the patient is not currently undergoing an orthognathic operation of the mandible.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing an orthognathic operation of the mandible.","meaning":"Boolean indicating whether the patient is currently undergoing an orthognathic operation of the mandible."} // "orthognathic surgery"
(declare-const patient_is_undergoing_orthognathic_operation_of_mandible_now@@elective Bool) ;; {"when_to_set_to_true":"Set to true if the orthognathic operation of the mandible the patient is currently undergoing is elective (non-emergent).","when_to_set_to_false":"Set to false if the orthognathic operation of the mandible the patient is currently undergoing is not elective (i.e., is emergent or urgent).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the orthognathic operation of the mandible is elective.","meaning":"Boolean indicating whether the current orthognathic operation of the mandible is elective."} // "elective orthognathic surgery"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_is_undergoing_orthognathic_operation_of_mandible_now@@elective
         patient_is_undergoing_orthognathic_operation_of_mandible_now)
     :named REQ0_AUXILIARY0)) ;; "elective orthognathic surgery" means the patient is undergoing orthognathic operation of mandible and it is elective

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_is_undergoing_orthognathic_operation_of_mandible_now@@elective
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be undergoing elective orthognathic surgery."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years AND aged ≤ 50 years"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must be aged ≥ 18 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; Component 1: To be included, the patient must be aged ≤ 50 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 50)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 50 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_signed_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided informed consent and the consent is signed.","when_to_set_to_false":"Set to false if the patient has not provided informed consent or the consent is not signed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided signed informed consent.","meaning":"Boolean indicating whether the patient has provided informed consent and the consent is signed."} // "To be included, the patient must have signed informed consent."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_signed_informed_consent
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have signed informed consent."
