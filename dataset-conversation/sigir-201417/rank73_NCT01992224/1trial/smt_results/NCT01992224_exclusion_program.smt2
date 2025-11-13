;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_chronic_disease_of_respiratory_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chronic disease of the respiratory system.","when_to_set_to_false":"Set to false if the patient currently does not have a chronic disease of the respiratory system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a chronic disease of the respiratory system.","meaning":"Boolean indicating whether the patient currently has a chronic disease of the respiratory system."} ;; "chronic respiratory disease"
(declare-const patient_has_finding_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic obstructive lung disease.","when_to_set_to_false":"Set to false if the patient currently does not have chronic obstructive lung disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic obstructive lung disease.","meaning":"Boolean indicating whether the patient currently has chronic obstructive lung disease."} ;; "chronic obstructive pulmonary disease"
(declare-const patient_has_finding_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has asthma.","when_to_set_to_false":"Set to false if the patient currently does not have asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has asthma.","meaning":"Boolean indicating whether the patient currently has asthma."} ;; "asthma"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_chronic_obstructive_lung_disease_now
           patient_has_finding_of_asthma_now)
       patient_has_finding_of_chronic_disease_of_respiratory_system_now)
   :named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples (chronic obstructive pulmonary disease, asthma)"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_chronic_disease_of_respiratory_system_now)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a chronic respiratory disease with non-exhaustive examples (chronic obstructive pulmonary disease, asthma)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of heart disease.","meaning":"Boolean indicating whether the patient currently has heart disease."} ;; "cardiopathy"
(declare-const patient_has_finding_of_heart_disease_now@@organic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current heart disease is organic in nature.","when_to_set_to_false":"Set to false if the patient's current heart disease is not organic in nature.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current heart disease is organic in nature.","meaning":"Boolean indicating whether the patient's current heart disease is organic in nature."} ;; "organic cardiopathy"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_heart_disease_now@@organic
       patient_has_finding_of_heart_disease_now)
   :named REQ1_AUXILIARY0)) ;; "organic cardiopathy" (organic heart disease is a type of heart disease)

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_heart_disease_now@@organic)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has organic cardiopathy."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_pregnant_now)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."
