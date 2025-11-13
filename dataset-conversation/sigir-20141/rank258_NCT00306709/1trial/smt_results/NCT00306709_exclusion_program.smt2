;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_bariatric_operative_procedure_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a bariatric operative procedure at any time within the past five years.","when_to_set_to_false":"Set to false if the patient has not undergone a bariatric operative procedure within the past five years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a bariatric operative procedure within the past five years.","meaning":"Boolean indicating whether the patient has undergone a bariatric operative procedure within the past five years."} ;; "bariatric surgical procedure within the previous five years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_undergone_bariatric_operative_procedure_inthepast5years)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a bariatric surgical procedure within the previous five years."
