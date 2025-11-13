;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_atypical_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of atypical pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of atypical pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has atypical pneumonia.","meaning":"Boolean indicating whether the patient currently has atypical pneumonia."} ;; "atypical pneumonia"

(declare-const patient_has_finding_of_viral_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of viral pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of viral pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has viral pneumonia.","meaning":"Boolean indicating whether the patient currently has viral pneumonia."} ;; "viral pneumonia"

(declare-const patient_has_finding_of_viral_pneumonia_now@@based_on_clinical_suspicion_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient's viral pneumonia finding is based on clinical suspicion by the investigator.","when_to_set_to_false":"Set to false if the patient's viral pneumonia finding is not based on clinical suspicion by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the finding is based on clinical suspicion by the investigator.","meaning":"Boolean indicating whether the patient's viral pneumonia finding is based on clinical suspicion by the investigator."} ;; "viral pneumonia based on clinical suspicion by the investigator"

(declare-const patient_has_finding_of_viral_pneumonia_now@@based_on_epidemiologic_suspicion_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient's viral pneumonia finding is based on epidemiologic suspicion by the investigator.","when_to_set_to_false":"Set to false if the patient's viral pneumonia finding is not based on epidemiologic suspicion by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the finding is based on epidemiologic suspicion by the investigator.","meaning":"Boolean indicating whether the patient's viral pneumonia finding is based on epidemiologic suspicion by the investigator."} ;; "viral pneumonia based on epidemiologic suspicion by the investigator"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_viral_pneumonia_now@@based_on_clinical_suspicion_by_investigator
      patient_has_finding_of_viral_pneumonia_now)
   :named REQ0_AUXILIARY0)) ;; "viral pneumonia based on clinical suspicion by the investigator" implies "viral pneumonia"

(assert
(! (=> patient_has_finding_of_viral_pneumonia_now@@based_on_epidemiologic_suspicion_by_investigator
      patient_has_finding_of_viral_pneumonia_now)
   :named REQ0_AUXILIARY1)) ;; "viral pneumonia based on epidemiologic suspicion by the investigator" implies "viral pneumonia"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_atypical_pneumonia_now)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has atypical pneumonia."

(assert
(! (not patient_has_finding_of_viral_pneumonia_now@@based_on_clinical_suspicion_by_investigator)
   :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has viral pneumonia based on clinical suspicion by the investigator."

(assert
(! (not patient_has_finding_of_viral_pneumonia_now@@based_on_epidemiologic_suspicion_by_investigator)
   :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has viral pneumonia based on epidemiologic suspicion by the investigator."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_organ_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has organ failure.","when_to_set_to_false":"Set to false if the patient currently does not have organ failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has organ failure.","meaning":"Boolean indicating whether the patient currently has organ failure."} ;; "presence of organ failure"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_organ_failure_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has presence of organ failure."
