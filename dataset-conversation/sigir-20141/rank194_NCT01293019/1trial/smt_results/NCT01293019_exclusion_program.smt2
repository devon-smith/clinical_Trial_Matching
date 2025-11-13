;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_regular_follow_up_by_osteopathic_physician_within_previous_3_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had regular follow-up by an osteopathic physician within the previous three months.","when_to_set_to_false":"Set to false if the patient has not had regular follow-up by an osteopathic physician within the previous three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had regular follow-up by an osteopathic physician within the previous three months.","meaning":"Boolean indicating whether the patient has had regular follow-up by an osteopathic physician within the previous three months."} ;; "has had regular follow-up by an osteopathic physician within the previous three months."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_regular_follow_up_by_osteopathic_physician_within_previous_3_months)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had regular follow-up by an osteopathic physician within the previous three months."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_undergoing_transplant_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently awaiting or in the process of lung transplantation (the procedure has not yet been completed).","when_to_set_to_false":"Set to false if the patient is not currently awaiting or undergoing lung transplantation (the procedure is not pending or in progress).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently awaiting or undergoing lung transplantation.","meaning":"Boolean indicating whether the patient is currently awaiting or undergoing lung transplantation."} ;; "awaiting lung transplantation"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_undergoing_transplant_of_lung_now)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is awaiting lung transplantation."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_transplant_of_lung_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a lung transplantation at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone a lung transplantation at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a lung transplantation.","meaning":"Boolean indicating whether the patient has ever undergone a lung transplantation at any time in their history."} ;; "has a history of lung transplantation."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_undergone_transplant_of_lung_inthehistory)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of lung transplantation."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_disturbance_of_understanding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of disturbance of understanding.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of disturbance of understanding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of disturbance of understanding.","meaning":"Boolean indicating whether the patient currently has a disturbance of understanding."} ;; "disorders of understanding"
(declare-const patient_has_finding_of_disturbance_of_understanding_now@@prevents_patient_from_applying_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disturbance of understanding prevents the patient from applying the study.","when_to_set_to_false":"Set to false if the patient's current disturbance of understanding does not prevent the patient from applying the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disturbance of understanding prevents the patient from applying the study.","meaning":"Boolean indicating whether the patient's disturbance of understanding prevents the patient from applying the study."} ;; "disorders of understanding that prevent the patient from applying the study"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disturbance_of_understanding_now@@prevents_patient_from_applying_study
       patient_has_finding_of_disturbance_of_understanding_now)
   :named REQ4_AUXILIARY0)) ;; "disorders of understanding that prevent the patient from applying the study"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_disturbance_of_understanding_now@@prevents_patient_from_applying_study)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has disorders of understanding that prevent the patient from applying the study."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_participating_in_another_clinical_interventional_study_protocol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in a clinical interventional study protocol that is not the index protocol.","when_to_set_to_false":"Set to false if the patient is not currently participating in any other clinical interventional study protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in another clinical interventional study protocol.","meaning":"Boolean indicating whether the patient is currently participating in another clinical interventional study protocol."} ;; "the patient is participating in another clinical interventional study protocol."
(declare-const patient_is_participating_in_another_clinical_interventional_study_protocol_now@@is_another_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the protocol in which the patient is currently participating is another protocol, not the index protocol.","when_to_set_to_false":"Set to false if the protocol in which the patient is currently participating is the index protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the protocol is another protocol.","meaning":"Boolean indicating whether the protocol in which the patient is currently participating is another protocol, not the index protocol."} ;; "the protocol in which the patient is currently participating is another protocol, not the index protocol."

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_participating_in_another_clinical_interventional_study_protocol_now@@is_another_protocol
      patient_is_participating_in_another_clinical_interventional_study_protocol_now)
:named REQ5_AUXILIARY0)) ;; "the protocol in which the patient is currently participating is another protocol, not the index protocol."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_participating_in_another_clinical_interventional_study_protocol_now)
:named REQ5_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is participating in another clinical interventional study protocol."
