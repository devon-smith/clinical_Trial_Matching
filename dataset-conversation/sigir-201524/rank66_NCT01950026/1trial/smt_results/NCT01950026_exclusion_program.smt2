;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patients_skin_sensitivity_is_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's skin sensitivity is currently abnormal (i.e., there is a change in skin sensitivity).","when_to_set_to_false":"Set to false if the patient's skin sensitivity is currently normal (i.e., no change in skin sensitivity).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's skin sensitivity is currently abnormal.","meaning":"Boolean indicating whether the patient's skin sensitivity is currently abnormal."} ;; "any change in skin sensitivity"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patients_skin_sensitivity_is_abnormal_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suffering from any change in skin sensitivity."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection (any illness of an infectious nature).","when_to_set_to_false":"Set to false if the patient currently does not have a disorder due to infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder due to infection.","meaning":"Boolean indicating whether the patient currently has a disorder due to infection."} ;; "illness of an infectious nature"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_disorder_due_to_infection_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an illness of an infectious nature."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a disease at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a disease at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a disease.","meaning":"Boolean indicating whether the patient has ever been diagnosed with a disease at any point in their medical history."} ;; "previously diagnosed disease"
(declare-const patient_has_diagnosis_of_disease_inthehistory@@responds_negatively_to_use_of_cold Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosed disease responds negatively to the use of cold.","when_to_set_to_false":"Set to false if the diagnosed disease does not respond negatively to the use of cold.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosed disease responds negatively to the use of cold.","meaning":"Boolean indicating whether the diagnosed disease responds negatively to the use of cold."} ;; "disease that responds negatively to the use of cold"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_disease_inthehistory@@responds_negatively_to_use_of_cold
       patient_has_diagnosis_of_disease_inthehistory)
   :named REQ2_AUXILIARY0)) ;; "disease that responds negatively to the use of cold" implies "previously diagnosed disease"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_disease_inthehistory@@responds_negatively_to_use_of_cold)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a previously diagnosed disease that responds negatively to the use of cold."
