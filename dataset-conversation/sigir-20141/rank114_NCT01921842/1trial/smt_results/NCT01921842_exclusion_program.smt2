;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const child_care_center_has_open_case_of_child_abuse Bool) ;; {"when_to_set_to_true":"Set to true if the child care center has an open case of child abuse.","when_to_set_to_false":"Set to false if the child care center does not have an open case of child abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the child care center has an open case of child abuse.","meaning":"Boolean indicating whether the child care center has an open case of child abuse."} ;; "the child care center has an open case of child abuse"

(declare-const child_care_center_has_open_case_of_child_neglect Bool) ;; {"when_to_set_to_true":"Set to true if the child care center has an open case of child neglect.","when_to_set_to_false":"Set to false if the child care center does not have an open case of child neglect.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the child care center has an open case of child neglect.","meaning":"Boolean indicating whether the child care center has an open case of child neglect."} ;; "the child care center has an open case of child neglect"

(declare-const patient_is_in_randomly_selected_child_care_center Bool) ;; {"when_to_set_to_true":"Set to true if the patient is in a randomly selected child care center.","when_to_set_to_false":"Set to false if the patient is not in a randomly selected child care center.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is in a randomly selected child care center.","meaning":"Boolean indicating whether the patient is in a randomly selected child care center."} ;; "the patient is in a randomly selected child care center"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (and patient_is_in_randomly_selected_child_care_center
             (or child_care_center_has_open_case_of_child_abuse
                 child_care_center_has_open_case_of_child_neglect)))
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is in a randomly selected child care center) AND ((the child care center has an open case of child abuse) OR (the child care center has an open case of child neglect))."
