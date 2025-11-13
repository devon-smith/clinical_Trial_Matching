;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_agrees_to_consent_to_this_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to consent to this protocol.","when_to_set_to_false":"Set to false if the patient does not agree to consent to this protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to consent to this protocol.","meaning":"Boolean indicating whether the patient agrees to consent to this protocol."} ;; "The patient is excluded if the patient does NOT agree to consent to this protocol."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (not patient_agrees_to_consent_to_this_protocol))
     :named REQ0_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient does NOT agree to consent to this protocol."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_known_hypersensitivity_to_any_ingredient_of_pregvit Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a known hypersensitivity to any of the ingredients of Pregvit®.","when_to_set_to_false":"Set to false if the patient does not have a known hypersensitivity to any of the ingredients of Pregvit®.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a known hypersensitivity to any of the ingredients of Pregvit®.","meaning":"Boolean indicating whether the patient has a known hypersensitivity to any of the ingredients of Pregvit®."} ;; "The patient is excluded if the patient has a known hypersensitivity to any of the ingredients of Pregvit®."
(declare-const patient_has_known_hypersensitivity_to_any_ingredient_of_orifer_f Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a known hypersensitivity to any of the ingredients of Orifer F®.","when_to_set_to_false":"Set to false if the patient does not have a known hypersensitivity to any of the ingredients of Orifer F®.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a known hypersensitivity to any of the ingredients of Orifer F®.","meaning":"Boolean indicating whether the patient has a known hypersensitivity to any of the ingredients of Orifer F®."} ;; "The patient is excluded if the patient has a known hypersensitivity to any of the ingredients of Orifer F®."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_known_hypersensitivity_to_any_ingredient_of_pregvit)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known hypersensitivity to any of the ingredients of Pregvit®."

(assert
(! (not patient_has_known_hypersensitivity_to_any_ingredient_of_orifer_f)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known hypersensitivity to any of the ingredients of Orifer F®."
