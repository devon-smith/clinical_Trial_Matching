;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_disorder_of_nervous_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the nervous system (neurological disease).","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the nervous system (neurological disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the nervous system (neurological disease).","meaning":"Boolean indicating whether the patient currently has a disorder of the nervous system (neurological disease)."} ;; "neurological disease"
(declare-const patient_has_finding_of_disorder_of_nervous_system_now@@is_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder of the nervous system (neurological disease) is significant.","when_to_set_to_false":"Set to false if the patient's current disorder of the nervous system (neurological disease) is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disorder of the nervous system (neurological disease) is significant.","meaning":"Boolean indicating whether the patient's current disorder of the nervous system (neurological disease) is significant."} ;; "significant neurological disease"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_of_nervous_system_now@@is_significant
      patient_has_finding_of_disorder_of_nervous_system_now)
:named REQ0_AUXILIARY0)) ;; "significant neurological disease""

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_disorder_of_nervous_system_now@@is_significant)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant neurological disease."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mental disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a mental disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a mental disorder.","meaning":"Boolean indicating whether the patient currently has a mental disorder."} ;; "psychiatric disorder"
(declare-const patient_has_finding_of_mental_disorder_now@@major_severity Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mental disorder and the disorder is classified as major severity.","when_to_set_to_false":"Set to false if the patient currently has a mental disorder but it is not of major severity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the mental disorder is of major severity.","meaning":"Boolean indicating whether the patient's current mental disorder is of major severity."} ;; "major psychiatric disorder"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_mental_disorder_now@@major_severity
      patient_has_finding_of_mental_disorder_now)
:named REQ1_AUXILIARY0)) ;; "major psychiatric disorder" implies "psychiatric disorder"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_mental_disorder_now@@major_severity)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has major psychiatric disorder."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_systemic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis or finding of systemic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis or finding of systemic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis or finding of systemic disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis or finding of systemic disease now."} ;; "systemic illness"
(declare-const patient_has_finding_of_systemic_disease_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current systemic disease is clinically significant.","when_to_set_to_false":"Set to false if the patient's current systemic disease is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current systemic disease is clinically significant.","meaning":"Boolean indicating whether the patient's current systemic disease is clinically significant."} ;; "clinically significant systemic illness"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_systemic_disease_now@@clinically_significant
       patient_has_finding_of_systemic_disease_now)
   :named REQ2_AUXILIARY0)) ;; "clinically significant systemic illness"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_systemic_disease_now@@clinically_significant)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically significant systemic illness."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease, condition, or finding.","when_to_set_to_false":"Set to false if the patient currently does not have a disease, condition, or finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disease, condition, or finding.","meaning":"Boolean indicating whether the patient currently has a disease, condition, or finding."} ;; "condition"
(declare-const patient_has_finding_of_disease_condition_finding_now@@specified_by_the_study Bool) ;; {"when_to_set_to_true":"Set to true if the disease, condition, or finding present in the patient is specified by the study as an exclusion criterion.","when_to_set_to_false":"Set to false if the disease, condition, or finding present in the patient is not specified by the study as an exclusion criterion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease, condition, or finding present in the patient is specified by the study as an exclusion criterion.","meaning":"Boolean indicating whether the disease, condition, or finding present in the patient is specified by the study as an exclusion criterion."} ;; "another condition as specified by the study"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@specified_by_the_study
       patient_has_finding_of_disease_condition_finding_now)
   :named REQ3_AUXILIARY0)) ;; "another condition as specified by the study"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_disease_condition_finding_now@@specified_by_the_study)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has another condition as specified by the study."
