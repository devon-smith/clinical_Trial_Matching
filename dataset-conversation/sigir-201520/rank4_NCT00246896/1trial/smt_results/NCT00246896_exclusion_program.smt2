;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_akatamathesia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of inability to understand (akatamathesia), regardless of language.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of inability to understand (akatamathesia), regardless of language.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of inability to understand (akatamathesia).","meaning":"Boolean indicating whether the patient currently has inability to understand (akatamathesia), regardless of language."} ;; "inability to understand"
(declare-const patient_has_finding_of_akatamathesia_now@@specific_to_english_language Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inability to understand (akatamathesia) is specifically in reference to the English language.","when_to_set_to_false":"Set to false if the patient's inability to understand (akatamathesia) is not specifically in reference to the English language.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the inability to understand (akatamathesia) is specifically in reference to the English language.","meaning":"Boolean indicating whether the inability to understand (akatamathesia) is specifically in reference to the English language."} ;; "inability to understand the English language"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_akatamathesia_now@@specific_to_english_language
      patient_has_finding_of_akatamathesia_now)
   :named REQ0_AUXILIARY0)) ;; "inability to understand the English language" implies "inability to understand"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_akatamathesia_now@@specific_to_english_language)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an inability to understand the English language."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_telephone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a telephone.","when_to_set_to_false":"Set to false if the patient currently does not have a telephone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a telephone.","meaning":"Boolean indicating whether the patient currently has a telephone."} ;; "The patient is excluded if the patient has no telephone."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_telephone_now)
:named REQ1_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has no telephone."
