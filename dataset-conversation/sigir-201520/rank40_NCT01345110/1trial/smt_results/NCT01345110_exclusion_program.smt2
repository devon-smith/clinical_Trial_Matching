;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_refuses_to_participate Bool) ;; {"when_to_set_to_true":"Set to true if the patient has explicitly refused to participate.","when_to_set_to_false":"Set to false if the patient has not refused to participate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has refused to participate.","meaning":"Boolean indicating whether the patient has refused to participate."} ;; "The patient refuses to participate."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_refuses_to_participate)
:named REQ0_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient refuses to participate."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_contactable_by_mail_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently contactable by mail.","when_to_set_to_false":"Set to false if the patient is currently not contactable by mail.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently contactable by mail.","meaning":"Boolean indicating whether the patient is currently contactable by mail."} ;; "contactable by mail"
(declare-const patient_is_contactable_by_telephone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently contactable by telephone.","when_to_set_to_false":"Set to false if the patient is currently not contactable by telephone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently contactable by telephone.","meaning":"Boolean indicating whether the patient is currently contactable by telephone."} ;; "contactable by telephone"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (and (not patient_is_contactable_by_mail_now)
             (not patient_is_contactable_by_telephone_now)))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is not contactable by mail AND not contactable by telephone."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_legally_resident_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a legally resident individual.","when_to_set_to_false":"Set to false if the patient is currently not a legally resident individual.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a legally resident individual.","meaning":"Boolean indicating whether the patient is currently a legally resident individual."} ;; "the patient is legally resident"
(declare-const patient_is_actually_living_somewhere_else_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently actually living somewhere else (not at their legal residence).","when_to_set_to_false":"Set to false if the patient is currently not actually living somewhere else (i.e., living at their legal residence).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently actually living somewhere else.","meaning":"Boolean indicating whether the patient is currently actually living somewhere else (not at their legal residence)."} ;; "the patient is actually living somewhere else"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (and patient_is_legally_resident_now patient_is_actually_living_somewhere_else_now))
:named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is legally resident AND the patient is actually living somewhere else."
