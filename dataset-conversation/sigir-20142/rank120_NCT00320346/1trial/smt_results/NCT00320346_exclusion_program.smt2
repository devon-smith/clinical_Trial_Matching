;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_history_of_vaccination_with_influenza_vaccine_containing_h5n1_strain Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously received an influenza vaccine that contains the H5N1 influenza virus strain.","when_to_set_to_false":"Set to false if the patient has not previously received an influenza vaccine that contains the H5N1 influenza virus strain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously received an influenza vaccine containing the H5N1 influenza virus strain.","meaning":"Boolean indicating whether the patient has a history of receiving an influenza vaccine that contains the H5N1 influenza virus strain."} ;; "previous vaccination with an influenza vaccine containing the H5N1 influenza virus strain."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_history_of_vaccination_with_influenza_vaccine_containing_h5n1_strain)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous vaccination with an influenza vaccine containing the H5N1 influenza virus strain."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_disease_condition_finding_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had any disease, condition, or medical finding in their history.","when_to_set_to_false":"Set to false if the patient has never had any disease, condition, or medical finding in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had any disease, condition, or medical finding in their history.","meaning":"Boolean indicating whether the patient has ever had any disease, condition, or medical finding in their history."} ;; "medical condition"
(declare-const patient_has_finding_of_disease_condition_finding_inthehistory@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had any disease, condition, or medical finding in their history and that condition is clinically significant.","when_to_set_to_false":"Set to false if the patient has ever had any disease, condition, or medical finding in their history but none are clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether any condition in the patient's history is clinically significant.","meaning":"Boolean indicating whether any disease, condition, or medical finding in the patient's history is clinically significant."} ;; "clinically significant medical condition"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_condition_finding_inthehistory@@clinically_significant
      patient_has_finding_of_disease_condition_finding_inthehistory)
   :named REQ1_AUXILIARY0)) ;; "clinically significant medical condition" implies "medical condition"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_disease_condition_finding_inthehistory@@clinically_significant)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of clinically significant medical condition."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_guillain_barr_syndrome_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of Guillian-Barre syndrome.","when_to_set_to_false":"Set to false if the patient does not have a documented history of Guillian-Barre syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of Guillian-Barre syndrome.","meaning":"Boolean indicating whether the patient has a history of Guillian-Barre syndrome."} ;; "history of Guillian-Barre syndrome"

(declare-const patient_has_finding_of_disorder_of_nervous_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of neurological disease.","when_to_set_to_false":"Set to false if the patient does not have a documented history of neurological disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of neurological disease.","meaning":"Boolean indicating whether the patient has a history of neurological disease."} ;; "history of neurological disease"

(declare-const patient_has_finding_of_disorder_of_nervous_system_inthehistory@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of neurological disease and the disease is currently active.","when_to_set_to_false":"Set to false if the patient has a history of neurological disease but the disease is not currently active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the neurological disease is currently active.","meaning":"Boolean indicating whether the patient's historical neurological disease is currently active."} ;; "history of neurological disease that is active"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_of_nervous_system_inthehistory@@active
      patient_has_finding_of_disorder_of_nervous_system_inthehistory)
:named REQ2_AUXILIARY0)) ;; "history of neurological disease that is active" implies "history of neurological disease"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT have a history of Guillian-Barre syndrome
(assert
(! (not patient_has_finding_of_guillain_barr_syndrome_inthehistory)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of Guillian-Barre syndrome."

;; Exclusion: patient must NOT have a history of neurological disease that is active
(assert
(! (not patient_has_finding_of_disorder_of_nervous_system_inthehistory@@active)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of neurological disease that is active."
