;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_atrial_fibrillation_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with atrial fibrillation at any time in the past, regardless of current status.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with atrial fibrillation at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with atrial fibrillation.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of atrial fibrillation in their history."} ;; "previous atrial fibrillation"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_atrial_fibrillation_inthehistory)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous atrial fibrillation."
