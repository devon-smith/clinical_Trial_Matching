;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patients_ethnic_group_is_positive_now Bool) ;; "ethnic groups" {"when_to_set_to_true":"Set to true if the patient currently belongs to the specified ethnic group.","when_to_set_to_false":"Set to false if the patient currently does not belong to the specified ethnic group.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently belongs to the specified ethnic group.","meaning":"Boolean indicating whether the patient currently belongs to a specific ethnic group."}

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patients_ethnic_group_is_positive_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must belong to at least one of the requested ethnic groups."
