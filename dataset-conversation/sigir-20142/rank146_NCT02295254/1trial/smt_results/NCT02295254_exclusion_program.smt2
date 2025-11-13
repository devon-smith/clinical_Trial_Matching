;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patients_taking_medication_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking medication (i.e., medication consumption is present now).","when_to_set_to_false":"Set to false if the patient is currently not taking any medication (i.e., medication consumption is absent now).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking medication.","meaning":"Boolean indicating whether the patient is currently taking medication (medication consumption is present now)."} ;; "medication consumption"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patients_taking_medication_is_positive_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has medication consumption."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease (background disease).","when_to_set_to_false":"Set to false if the patient currently does not have any disease (background disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease (background disease).","meaning":"Boolean indicating whether the patient currently has any disease."} ;; "disease"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_disease_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has background disease."
