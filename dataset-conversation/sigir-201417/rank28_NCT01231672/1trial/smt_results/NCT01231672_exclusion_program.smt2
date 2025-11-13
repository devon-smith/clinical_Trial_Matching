;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patients_dying_process_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in the dying process.","when_to_set_to_false":"Set to false if the patient is currently not in the dying process.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in the dying process.","meaning":"Boolean indicating whether the patient is currently in the dying process."} ;; "the patient is dying"
(declare-const patient_has_limitation_of_active_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if there is currently a limitation of active treatment for the patient.","when_to_set_to_false":"Set to false if there is currently no limitation of active treatment for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is currently a limitation of active treatment for the patient.","meaning":"Boolean indicating whether there is currently a limitation of active treatment for the patient."} ;; "there is limitation of active treatment for the patient"
(declare-const patient_has_cessation_of_active_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if there is currently cessation of active treatment for the patient.","when_to_set_to_false":"Set to false if there is currently no cessation of active treatment for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is currently cessation of active treatment for the patient.","meaning":"Boolean indicating whether there is currently cessation of active treatment for the patient."} ;; "there is cessation of active treatment for the patient"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patients_dying_process_is_positive_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is dying."

(assert
(! (not patient_has_limitation_of_active_treatment_now)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if there is limitation of active treatment for the patient."

(assert
(! (not patient_has_cessation_of_active_treatment_now)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if there is cessation of active treatment for the patient."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_undergoing_clinical_trial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently included in any clinical trial.","when_to_set_to_false":"Set to false if the patient is currently not included in any clinical trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently included in any clinical trial.","meaning":"Boolean indicating whether the patient is currently included in any clinical trial."} ;; "the patient is already included in another clinical trial"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_undergoing_clinical_trial_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is already included in another clinical trial."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_refuses_participation Bool) ;; {"when_to_set_to_true":"Set to true if the patient explicitly refuses participation in the study.","when_to_set_to_false":"Set to false if the patient explicitly does not refuse participation in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient refuses participation in the study.","meaning":"Boolean indicating whether the patient refuses participation in the study."} ;; "the patient refuses participation"
(declare-const family_refuses_participation Bool) ;; {"when_to_set_to_true":"Set to true if the family of the patient explicitly refuses participation in the study.","when_to_set_to_false":"Set to false if the family of the patient explicitly does not refuse participation in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the family of the patient refuses participation in the study.","meaning":"Boolean indicating whether the family of the patient refuses participation in the study."} ;; "the family of the patient refuses participation"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_refuses_participation)
:named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient refuses participation."

(assert
(! (not family_refuses_participation)
:named REQ2_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the family of the patient refuses participation."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_affiliated_with_social_security_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently affiliated with a social security system.","when_to_set_to_false":"Set to false if the patient is currently not affiliated with a social security system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently affiliated with a social security system.","meaning":"Boolean indicating whether the patient is currently affiliated with a social security system."} ;; "the patient is NOT affiliated with a social security system."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (not patient_is_affiliated_with_social_security_system_now))
:named REQ3_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is NOT affiliated with a social security system."
