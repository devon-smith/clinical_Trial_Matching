;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_secondary_hypertension_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with secondary hypertension at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with secondary hypertension at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with secondary hypertension.","meaning":"Boolean indicating whether the patient has ever been diagnosed with secondary hypertension at any point in their medical history."} ;; "The patient is excluded if the patient was diagnosed as secondary hypertension."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_diagnosis_of_secondary_hypertension_inthehistory)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient was diagnosed as secondary hypertension."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_labile_hypertension_due_to_being_in_a_clinical_environment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has labile hypertension due to being in a clinical environment (white-coat hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have labile hypertension due to being in a clinical environment (white-coat hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has labile hypertension due to being in a clinical environment (white-coat hypertension).","meaning":"Boolean indicating whether the patient currently has labile hypertension due to being in a clinical environment (white-coat hypertension)."} ;; "white-coat hypertension"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_labile_hypertension_due_to_being_in_a_clinical_environment_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has white-coat hypertension."
