;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_disorder_of_immune_function_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a disorder of immune function at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a disorder of immune function at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a disorder of immune function.","meaning":"Boolean indicating whether the patient has ever been diagnosed with a disorder of immune function."} ;; "has a previously diagnosed disease of immune function"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_disorder_of_immune_function_inthehistory)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a previously diagnosed disease of immune function."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_received_systemic_antibiotic_within_previous_7_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received any systemic antibiotic within the previous seven days.","when_to_set_to_false":"Set to false if the patient has not received any systemic antibiotic within the previous seven days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received any systemic antibiotic within the previous seven days.","meaning":"Boolean indicating whether the patient has been treated with any systemic antibiotic within the previous seven days."} ;; "has been treated with any systemic antibiotic within the previous seven days"
(declare-const systemic_antibiotic_administration_time_since_last_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days since the patient's last administration of any systemic antibiotic.","when_to_set_to_null":"Set to null if the time since last administration of systemic antibiotic is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of days since the patient's last administration of any systemic antibiotic."} ;; "within the previous seven days"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Link the Boolean variable to the numeric variable (definition from requirement)
(assert
(! (= patient_has_received_systemic_antibiotic_within_previous_7_days
(< systemic_antibiotic_administration_time_since_last_in_days 7))
:named REQ1_AUXILIARY0)) ;; "has been treated with any systemic antibiotic within the previous seven days"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_received_systemic_antibiotic_within_previous_7_days)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been treated with any systemic antibiotic within the previous seven days."
