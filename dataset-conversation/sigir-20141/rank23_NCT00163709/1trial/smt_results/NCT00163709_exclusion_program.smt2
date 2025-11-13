;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_dyspnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently presents with dyspnea.","when_to_set_to_false":"Set to false if the patient currently does not present with dyspnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently presents with dyspnea.","meaning":"Boolean indicating whether the patient currently presents with dyspnea."} ;; "dyspnea"
(declare-const patient_has_finding_of_dyspnea_now@@caused_by_trauma Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current dyspnea is caused by trauma.","when_to_set_to_false":"Set to false if the patient's current dyspnea is not caused by trauma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current dyspnea is caused by trauma.","meaning":"Boolean indicating whether the patient's current dyspnea is caused by trauma."} ;; "traumatic cause of dyspnea"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_dyspnea_now@@caused_by_trauma
      patient_has_finding_of_dyspnea_now)
:named REQ0_AUXILIARY0)) ;; "dyspnea is caused by trauma" implies "dyspnea"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_dyspnea_now@@caused_by_trauma)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient presents with a traumatic cause of dyspnea."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has renal (kidney) disease.","when_to_set_to_false":"Set to false if the patient currently does not have renal (kidney) disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal (kidney) disease.","meaning":"Boolean indicating whether the patient currently has renal (kidney) disease."} ;; "renal disease"
(declare-const patient_has_finding_of_kidney_disease_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has renal (kidney) disease and the disease is severe.","when_to_set_to_false":"Set to false if the patient currently has renal (kidney) disease but the disease is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the renal (kidney) disease is severe.","meaning":"Boolean indicating whether the patient currently has severe renal (kidney) disease."} ;; "severe renal disease"
(declare-const patient_serum_creatinine_level_finding_value_recorded_now_withunit_micro_mmol_per_l Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's serum creatinine level in micro mmol/L is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum creatinine level in micro mmol/L."} ;; "serum creatinine level > 250 micro mmol/L"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: severe renal disease is defined as serum creatinine level > 250 micro mmol/L
(assert
(! (= patient_has_finding_of_kidney_disease_now@@severity_severe
     (> patient_serum_creatinine_level_finding_value_recorded_now_withunit_micro_mmol_per_l 250))
   :named REQ1_AUXILIARY0)) ;; "defined as serum creatinine level > 250 micro mmol/L"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_kidney_disease_now@@severity_severe
       patient_has_finding_of_kidney_disease_now)
   :named REQ1_AUXILIARY1)) ;; "severe renal disease" implies "renal disease"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_kidney_disease_now@@severity_severe)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe renal disease (defined as serum creatinine level > 250 micro mmol/L)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_cardiogenic_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cardiogenic shock.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cardiogenic shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of cardiogenic shock.","meaning":"Boolean indicating whether the patient currently has the clinical finding of cardiogenic shock."} ;; "cardiogenic shock"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_cardiogenic_shock_now)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cardiogenic shock."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_undergone_transfer_of_care_to_hospital_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a transfer of care to another hospital within the past 24 hours.","when_to_set_to_false":"Set to false if the patient has not undergone a transfer of care to another hospital within the past 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a transfer of care to another hospital within the past 24 hours.","meaning":"Boolean indicating whether the patient has undergone a transfer of care to another hospital within the past 24 hours."} ;; "transfer to another hospital (within 24 hours)"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_undergone_transfer_of_care_to_hospital_inthepast24hours)
:named REQ3_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has an early transfer to another hospital (within 24 hours)."
