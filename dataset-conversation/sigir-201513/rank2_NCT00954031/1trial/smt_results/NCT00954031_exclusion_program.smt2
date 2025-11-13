;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a neoplastic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a neoplastic disease.","meaning":"Boolean indicating whether the patient currently has a neoplastic disease."} ;; "neoplastic disease"
(declare-const patient_has_finding_of_neoplastic_disease_now@@located_in_throat Bool) ;; {"when_to_set_to_true":"Set to true if the patient's neoplastic disease is located in the throat.","when_to_set_to_false":"Set to false if the patient's neoplastic disease is not located in the throat.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the neoplastic disease is located in the throat.","meaning":"Boolean indicating whether the patient's neoplastic disease is located in the throat."} ;; "neoplastic disease of the throat"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_neoplastic_disease_now@@located_in_throat
      patient_has_finding_of_neoplastic_disease_now)
:named REQ0_AUXILIARY0)) ;; "neoplastic disease of the throat" (location qualifier implies neoplastic disease)

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_neoplastic_disease_now@@located_in_throat)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has neoplastic disease of the throat."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_hematologic_disease_now@@localized_to_tonsil@@scalable Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hematologic disease that is localized to the tonsil and is scalable.","when_to_set_to_false":"Set to false if the patient currently does not have hematologic disease that is both localized to the tonsil and scalable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hematologic disease that is both localized to the tonsil and scalable.","meaning":"Boolean indicating whether the patient currently has hematologic disease that is both localized to the tonsil and scalable."} ;; "scalable hematologic disease with tonsillar localization"
(declare-const patient_has_finding_of_hematologic_disease_now@@localized_to_tonsil@@scalable@@localized_to_tonsil Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hematologic disease is localized to the tonsil.","when_to_set_to_false":"Set to false if the patient's current hematologic disease is not localized to the tonsil.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hematologic disease is localized to the tonsil.","meaning":"Boolean indicating whether the patient's current hematologic disease is localized to the tonsil."} ;; "tonsillar localization"
(declare-const patient_has_finding_of_hematologic_disease_now@@localized_to_tonsil@@scalable@@scalable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hematologic disease is scalable.","when_to_set_to_false":"Set to false if the patient's current hematologic disease is not scalable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hematologic disease is scalable.","meaning":"Boolean indicating whether the patient's current hematologic disease is scalable."} ;; "scalable"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_hematologic_disease_now@@localized_to_tonsil@@scalable@@localized_to_tonsil
      patient_has_finding_of_hematologic_disease_now@@localized_to_tonsil@@scalable)
:named REQ1_AUXILIARY0)) ;; "tonsillar localization"

(assert
(! (=> patient_has_finding_of_hematologic_disease_now@@localized_to_tonsil@@scalable@@scalable
      patient_has_finding_of_hematologic_disease_now@@localized_to_tonsil@@scalable)
:named REQ1_AUXILIARY1)) ;; "scalable"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_hematologic_disease_now@@localized_to_tonsil@@scalable)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has scalable hematologic disease with tonsillar localization."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_tonsillectomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a tonsillectomy procedure at any point in their medical history.","when_to_set_to_false":"Set to false if it is known that the patient has never undergone a tonsillectomy procedure at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a tonsillectomy procedure.","meaning":"Boolean indicating whether the patient has ever undergone a tonsillectomy procedure at any time in their history."} ;; "tonsillectomy"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_has_undergone_tonsillectomy_inthehistory)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of tonsillectomy."
