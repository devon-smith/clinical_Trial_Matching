;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_co_morbid_conditions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has at least one comorbid condition.","when_to_set_to_false":"Set to false if the patient currently does not have any comorbid condition now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any comorbid condition.","meaning":"Boolean indicating whether the patient currently has at least one comorbid condition now."} ;; "comorbid condition"
(declare-const patient_has_finding_of_co_morbid_conditions_now@@is_select_comorbid_condition Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has at least one comorbid condition and that condition is a select comorbid condition.","when_to_set_to_false":"Set to false if the patient currently has comorbid conditions but none are select comorbid conditions, or if the patient does not have any comorbid condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether any comorbid condition present is a select comorbid condition.","meaning":"Boolean indicating whether the patient currently has at least one comorbid condition that is a select comorbid condition."} ;; "select comorbid condition"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_finding_of_co_morbid_conditions_now@@is_select_comorbid_condition
      patient_has_finding_of_co_morbid_conditions_now)
   :named REQ0_AUXILIARY0)) ;; "select comorbid condition" implies "comorbid condition"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_co_morbid_conditions_now@@is_select_comorbid_condition)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has at least one select comorbid condition."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_operation_on_abdominal_region_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone an abdominal surgical procedure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone an abdominal surgical procedure at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone an abdominal surgical procedure.","meaning":"Boolean indicating whether the patient has ever undergone an abdominal surgical procedure at any time in the past."} ;; "abdominal surgical procedure"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_has_undergone_operation_on_abdominal_region_inthehistory)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had at least one previous abdominal surgical procedure."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_co_morbid_conditions_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with any comorbid condition at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with any comorbid condition at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with any comorbid condition.","meaning":"Boolean indicating whether the patient has ever been diagnosed with any comorbid condition in their history."} ;; "comorbid condition"
(declare-const patient_has_diagnosis_of_co_morbid_conditions_inthehistory@@is_select_comorbid_condition Bool) ;; {"when_to_set_to_true":"Set to true if the comorbid condition diagnosed in the patient is among the select comorbid conditions specified by the study.","when_to_set_to_false":"Set to false if the comorbid condition diagnosed in the patient is not among the select comorbid conditions specified by the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the comorbid condition is among the select set.","meaning":"Boolean indicating whether the comorbid condition is among the select comorbid conditions specified by the study."} ;; "select comorbid condition"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_co_morbid_conditions_inthehistory@@is_select_comorbid_condition
      patient_has_diagnosis_of_co_morbid_conditions_inthehistory)
:named REQ2_AUXILIARY0)) ;; "select comorbid condition" qualifier implies comorbid condition in history

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_co_morbid_conditions_inthehistory@@is_select_comorbid_condition)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been treated for at least one select comorbid condition."
