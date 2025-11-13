;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_non_english_speaking_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a non-English speaking patient.","when_to_set_to_false":"Set to false if the patient is currently an English speaking patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a non-English speaking patient.","meaning":"Boolean indicating whether the patient is currently a non-English speaking patient."} ;; "The patient is excluded if the patient is a non-English speaking patient."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_is_non_english_speaking_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a non-English speaking patient."
