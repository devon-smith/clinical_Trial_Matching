;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_patient_deceased_during_stay_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient died during the current hospitalization (i.e., expired while admitted).","when_to_set_to_false":"Set to false if the patient did not die during the current hospitalization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient died during the current hospitalization.","meaning":"Boolean indicating whether the patient died during the current hospitalization."} ;; "expired during hospitalization"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_patient_deceased_during_stay_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient expired during hospitalization."
