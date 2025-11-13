;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_legal_surrogate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a legal surrogate.","when_to_set_to_false":"Set to false if the patient currently does not have a legal surrogate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a legal surrogate.","meaning":"Boolean indicating whether the patient currently has a legal surrogate."} ;; "the patient has a legal surrogate"

(declare-const patient_has_legal_surrogate_now@@not_a_related_legal_surrogate Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current legal surrogate is NOT a related legal surrogate.","when_to_set_to_false":"Set to false if the patient's current legal surrogate is a related legal surrogate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current legal surrogate is a related legal surrogate.","meaning":"Boolean indicating whether the patient's current legal surrogate is NOT a related legal surrogate."} ;; "who is NOT a related legal surrogate"

(declare-const patient_has_legal_surrogate_now@@does_not_have_personal_knowledge_of_patient Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current legal surrogate does NOT have personal knowledge of the patient.","when_to_set_to_false":"Set to false if the patient's current legal surrogate does have personal knowledge of the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current legal surrogate has personal knowledge of the patient.","meaning":"Boolean indicating whether the patient's current legal surrogate does NOT have personal knowledge of the patient."} ;; "the legal surrogate does NOT have personal knowledge of the patient"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_legal_surrogate_now@@not_a_related_legal_surrogate
      patient_has_legal_surrogate_now)
:named REQ0_AUXILIARY0)) ;; "who is NOT a related legal surrogate"

(assert
(! (=> patient_has_legal_surrogate_now@@does_not_have_personal_knowledge_of_patient
      patient_has_legal_surrogate_now)
:named REQ0_AUXILIARY1)) ;; "the legal surrogate does NOT have personal knowledge of the patient"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT satisfy ((has legal surrogate who is NOT a related legal surrogate) AND (legal surrogate does NOT have personal knowledge of patient))
(assert
(! (not (and patient_has_legal_surrogate_now@@not_a_related_legal_surrogate
             patient_has_legal_surrogate_now@@does_not_have_personal_knowledge_of_patient))
:named REQ0_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if ((the patient has a legal surrogate who is NOT a related legal surrogate) AND (the legal surrogate does NOT have personal knowledge of the patient))."
