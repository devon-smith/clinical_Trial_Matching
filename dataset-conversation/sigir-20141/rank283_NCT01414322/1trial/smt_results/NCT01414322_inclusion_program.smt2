;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_undergoing_emergency_room_admission_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently admitted to the emergency room.","when_to_set_to_false":"Set to false if the patient is not currently admitted to the emergency room.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently admitted to the emergency room.","meaning":"Boolean indicating whether the patient is currently admitted to the emergency room."} // "admitted to the emergency room"
(declare-const patient_has_finding_of_dyspnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of shortness of breath (dyspnea).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of shortness of breath (dyspnea).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of shortness of breath (dyspnea).","meaning":"Boolean indicating whether the patient currently has shortness of breath (dyspnea)."} // "shortness of breath"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_is_undergoing_emergency_room_admission_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be admitted to the emergency room."
(assert
  (! patient_has_finding_of_dyspnea_now
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have shortness of breath."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_received_management_according_to_standardized_protocol_in_hadassah_mount_scopus_pediatric_emergency_department Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received management according to a standardized protocol used in the Hadassah Mount Scopus pediatric emergency department.","when_to_set_to_false":"Set to false if the patient has not received management according to a standardized protocol used in the Hadassah Mount Scopus pediatric emergency department.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received management according to a standardized protocol used in the Hadassah Mount Scopus pediatric emergency department.","meaning":"Boolean indicating whether the patient has received management according to a standardized protocol used in the Hadassah Mount Scopus pediatric emergency department."} // "management according to standardized protocol used in Hadassah Mount Scopus pediatric emergency department"
(declare-const patient_has_received_management_according_to_standardized_protocol_in_hadassah_mount_scopus_pediatric_emergency_department@@including_asthma_management_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the management according to standardized protocol includes the asthma management protocol.","when_to_set_to_false":"Set to false if the management according to standardized protocol does not include the asthma management protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the management according to standardized protocol includes the asthma management protocol.","meaning":"Boolean indicating whether the management according to standardized protocol includes the asthma management protocol."} // "including asthma management protocol"
(declare-const patient_has_received_management_according_to_standardized_protocol_in_hadassah_mount_scopus_pediatric_emergency_department@@including_bronchiolitis_management_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the management according to standardized protocol includes the bronchiolitis management protocol.","when_to_set_to_false":"Set to false if the management according to standardized protocol does not include the bronchiolitis management protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the management according to standardized protocol includes the bronchiolitis management protocol.","meaning":"Boolean indicating whether the management according to standardized protocol includes the bronchiolitis management protocol."} // "including bronchiolitis management protocol"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_received_management_according_to_standardized_protocol_in_hadassah_mount_scopus_pediatric_emergency_department@@including_asthma_management_protocol
        patient_has_received_management_according_to_standardized_protocol_in_hadassah_mount_scopus_pediatric_emergency_department)
     :named REQ1_AUXILIARY0)) ;; "including asthma management protocol"

(assert
  (! (=> patient_has_received_management_according_to_standardized_protocol_in_hadassah_mount_scopus_pediatric_emergency_department@@including_bronchiolitis_management_protocol
        patient_has_received_management_according_to_standardized_protocol_in_hadassah_mount_scopus_pediatric_emergency_department)
     :named REQ1_AUXILIARY1)) ;; "including bronchiolitis management protocol"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: patient must have received management according to standardized protocol (including asthma and bronchiolitis management protocols)
(assert
  (! (and patient_has_received_management_according_to_standardized_protocol_in_hadassah_mount_scopus_pediatric_emergency_department@@including_asthma_management_protocol
          patient_has_received_management_according_to_standardized_protocol_in_hadassah_mount_scopus_pediatric_emergency_department@@including_bronchiolitis_management_protocol)
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have management according to standardized protocol used in Hadassah Mount Scopus pediatric emergency department, including asthma management protocol and bronchiolitis management protocol."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 0 years AND aged ≤ 15 years"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must be aged ≥ 0 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 0)
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "aged ≥ 0 years"

;; Component 1: To be included, the patient must be aged ≤ 15 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 15)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "aged ≤ 15 years"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const parent_or_guardian_is_able_to_comprehend_now Bool) ;; {"when_to_set_to_true":"Set to true if the parent or guardian of the patient is currently able to comprehend.","when_to_set_to_false":"Set to false if the parent or guardian of the patient is currently not able to comprehend.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the parent or guardian of the patient is currently able to comprehend.","meaning":"Boolean indicating whether the parent or guardian of the patient is currently able to comprehend."} // "parent or guardian of the patient must be able to comprehend"
(declare-const parent_or_guardian_is_able_to_give_informed_consent_for_study_participation_now Bool) ;; {"when_to_set_to_true":"Set to true if the parent or guardian of the patient is currently able to give informed consent for participation in the study.","when_to_set_to_false":"Set to false if the parent or guardian of the patient is currently not able to give informed consent for participation in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the parent or guardian of the patient is currently able to give informed consent for participation in the study.","meaning":"Boolean indicating whether the parent or guardian of the patient is currently able to give informed consent for participation in the study."} // "parent or guardian of the patient must be able to give informed consent for participation in the study"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: Parent or guardian must be able to comprehend
(assert
  (! parent_or_guardian_is_able_to_comprehend_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "parent or guardian of the patient must be able to comprehend"

;; Component 1: Parent or guardian must be able to give informed consent for participation in the study
(assert
  (! parent_or_guardian_is_able_to_give_informed_consent_for_study_participation_now
     :named REQ3_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "parent or guardian of the patient must be able to give informed consent for participation in the study"
