;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_subcortical_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a subcortical infarction.","when_to_set_to_false":"Set to false if the patient currently does not have a subcortical infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a subcortical infarction.","meaning":"Boolean indicating whether the patient currently has a subcortical infarction."} ;; "has a subcortical infarction"

(declare-const patient_has_finding_of_subcortical_infarction_now@@single Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current subcortical infarction is single (only one lesion present).","when_to_set_to_false":"Set to false if the patient's current subcortical infarction is not single (multiple lesions present).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current subcortical infarction is single.","meaning":"Boolean indicating whether the patient's current subcortical infarction is single (only one lesion present)."} ;; "single subcortical infarction"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_subcortical_infarction_now@@single
       patient_has_finding_of_subcortical_infarction_now)
   :named REQ0_AUXILIARY0)) ;; "single subcortical infarction" implies "subcortical infarction"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_subcortical_infarction_now@@single)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a single subcortical infarction."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_primary_brain_tumor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a primary brain tumor.","when_to_set_to_false":"Set to false if the patient currently does not have a primary brain tumor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a primary brain tumor.","meaning":"Boolean indicating whether the patient currently has a primary brain tumor."} ;; "The patient is excluded if the patient has a primary brain tumor."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_primary_brain_tumor_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a primary brain tumor."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_inability_to_perform_comprehensive_studies_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an inability to perform comprehensive studies.","when_to_set_to_false":"Set to false if the patient currently does not have an inability to perform comprehensive studies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an inability to perform comprehensive studies.","meaning":"Boolean indicating whether the patient currently has an inability to perform comprehensive studies."} ;; "has an inability to perform comprehensive studies"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_has_inability_to_perform_comprehensive_studies_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an inability to perform comprehensive studies."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_refuses_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently refuses to provide consent for participation.","when_to_set_to_false":"Set to false if the patient currently does not refuse to provide consent for participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently refuses to provide consent for participation.","meaning":"Boolean indicating whether the patient currently refuses to provide consent for participation."} ;; "the patient refuses consent"
(declare-const patient_withdraws_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently withdraws previously given consent for participation.","when_to_set_to_false":"Set to false if the patient currently does not withdraw previously given consent for participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently withdraws previously given consent for participation.","meaning":"Boolean indicating whether the patient currently withdraws previously given consent for participation."} ;; "the patient withdraws consent"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_refuses_consent_now)
:named REQ3_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient refuses consent."

(assert
(! (not patient_withdraws_consent_now)
:named REQ3_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient withdraws consent."
