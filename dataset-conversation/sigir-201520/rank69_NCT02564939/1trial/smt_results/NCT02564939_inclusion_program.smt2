;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_from_designated_nursing_unit Bool) ;; {"when_to_set_to_true":"Set to true if the patient is from a designated nursing unit.","when_to_set_to_false":"Set to false if the patient is not from a designated nursing unit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is from a designated nursing unit.","meaning":"Boolean indicating whether the patient is from a designated nursing unit."} ;; "the patient must be from designated nursing units"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_is_from_designated_nursing_unit
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be from designated nursing units"
