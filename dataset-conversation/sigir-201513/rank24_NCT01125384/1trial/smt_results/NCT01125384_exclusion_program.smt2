;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_undergoing_antibiotic_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving antibiotic therapy.","when_to_set_to_false":"Set to false if the patient is not currently receiving antibiotic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving antibiotic therapy.","meaning":"Boolean indicating whether the patient is currently undergoing antibiotic therapy."} ;; "antibiotic treatment"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_undergoing_antibiotic_therapy_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving antibiotic treatment."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_suspicion_of_streptococcus_carrier_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected to be a carrier of streptococcus bacteria (not confirmed).","when_to_set_to_false":"Set to false if the patient is currently not suspected to be a carrier of streptococcus bacteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suspected to be a carrier of streptococcus bacteria.","meaning":"Boolean indicating whether the patient is currently suspected to be a carrier of streptococcus bacteria."} ;; "carrier of streptococcus bacteria"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_suspicion_of_streptococcus_carrier_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a suspected carrier of streptococcus bacteria."
