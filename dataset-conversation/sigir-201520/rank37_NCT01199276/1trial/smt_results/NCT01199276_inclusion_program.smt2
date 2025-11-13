;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 75 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must be of advanced age (aged ≥ 75 years)
(assert
  (! (>= patient_age_value_recorded_now_in_years 75)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be a patient with advanced age (aged ≥ 75 years)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_fracture_of_proximal_end_of_femur_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hip fracture (fracture of proximal end of femur).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hip fracture.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hip fracture.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hip fracture (fracture of proximal end of femur)."}  ;; "hip fracture"
(declare-const patient_will_undergo_surgical_procedure_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is planned to undergo a surgical procedure (surgery) in the future.","when_to_set_to_false":"Set to false if the patient is not planned to undergo a surgical procedure (surgery) in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is planned to undergo a surgical procedure (surgery) in the future.","meaning":"Boolean indicating whether the patient is planned to undergo a surgical procedure (surgery) in the future."}  ;; "planned surgery"
(declare-const patient_will_undergo_surgical_procedure_inthefuture@@temporalcontext_within_48_hours_after_fracture_of_proximal_end_of_femur Bool) ;; {"when_to_set_to_true":"Set to true if the planned future surgical procedure (surgery) is scheduled to occur within 48 hours after the patient experiences a hip fracture (fracture of proximal end of femur).","when_to_set_to_false":"Set to false if the planned future surgical procedure (surgery) is not scheduled to occur within 48 hours after the patient experiences a hip fracture.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the planned future surgical procedure (surgery) is scheduled to occur within 48 hours after hip fracture.","meaning":"Boolean indicating whether the planned future surgical procedure (surgery) is scheduled to occur within 48 hours after hip fracture."}  ;; "planned surgery for hip fracture within 48 hours after hip fracture"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_will_undergo_surgical_procedure_inthefuture@@temporalcontext_within_48_hours_after_fracture_of_proximal_end_of_femur
         patient_will_undergo_surgical_procedure_inthefuture)
     :named REQ1_AUXILIARY0)) ;; "planned surgery for hip fracture within 48 hours after hip fracture"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have planned surgery for hip fracture within 48 hours after hip fracture.
(assert
  (! (and patient_has_diagnosis_of_fracture_of_proximal_end_of_femur_now
          patient_will_undergo_surgical_procedure_inthefuture@@temporalcontext_within_48_hours_after_fracture_of_proximal_end_of_femur)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "planned surgery for hip fracture within 48 hours after hip fracture"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_willing_to_complete_study_requirements Bool) ;; {"when_to_set_to_true":"Set to true if the patient expresses willingness to complete all requirements of this study.","when_to_set_to_false":"Set to false if the patient expresses unwillingness to complete all requirements of this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to complete all requirements of this study.","meaning":"Boolean indicating whether the patient is willing to complete the requirements of this study."} ;; "willing to complete the requirements of this study"
(declare-const patient_is_able_to_complete_study_requirements Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to complete all requirements of this study.","when_to_set_to_false":"Set to false if the patient is not able to complete all requirements of this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to complete all requirements of this study.","meaning":"Boolean indicating whether the patient is able to complete the requirements of this study."} ;; "able to complete the requirements of this study"
(declare-const patient_is_able_to_provide_signature_of_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to provide a signature for the written informed consent.","when_to_set_to_false":"Set to false if the patient is not able to provide a signature for the written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to provide a signature for the written informed consent.","meaning":"Boolean indicating whether the patient is able to provide a signature for the written informed consent."} ;; "able to provide signature of the written informed consent"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: "willing to complete the requirements of this study"
(assert
  (! patient_is_willing_to_complete_study_requirements
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION))

;; Component 1: "able to complete the requirements of this study"
(assert
  (! patient_is_able_to_complete_study_requirements
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS))

;; Component 2: "able to provide signature of the written informed consent"
(assert
  (! patient_is_able_to_provide_signature_of_written_informed_consent
     :named REQ2_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION))
