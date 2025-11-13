;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_meningitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of meningitis.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of meningitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of meningitis.","meaning":"Boolean indicating whether the patient currently has a clinical finding or diagnosis of meningitis."} ;; "meningitis"
(declare-const patient_has_serious_concurrent_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any serious concurrent illness, regardless of specific diagnosis.","when_to_set_to_false":"Set to false if the patient currently does not have any serious concurrent illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any serious concurrent illness.","meaning":"Boolean indicating whether the patient currently has a serious concurrent illness of any type."} ;; "serious concurrent illness"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive example: meningitis is an example of serious concurrent illness, but other illnesses may also qualify.
(assert
(! (=> patient_has_finding_of_meningitis_now
      patient_has_serious_concurrent_illness_now)
   :named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples (meningitis)."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_serious_concurrent_illness_now)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a serious concurrent illness with non-exhaustive examples (meningitis)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_congenital_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of congenital heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of congenital heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congenital heart disease.","meaning":"Boolean indicating whether the patient currently has congenital heart disease."} ;; "congenital heart disease"

(declare-const patient_has_finding_of_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has heart disease.","meaning":"Boolean indicating whether the patient currently has heart disease."} ;; "heart disease"

(declare-const patient_has_finding_of_heart_disease_now@@acquired Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart disease and the heart disease is acquired (not congenital).","when_to_set_to_false":"Set to false if the patient currently has heart disease but it is not acquired (i.e., it is congenital), or if the patient does not have heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's heart disease is acquired.","meaning":"Boolean indicating whether the patient currently has acquired (not congenital) heart disease."} ;; "acquired heart disease"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_heart_disease_now@@acquired
      patient_has_finding_of_heart_disease_now)
   :named REQ1_AUXILIARY0)) ;; "acquired heart disease" implies "heart disease"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_congenital_heart_disease_now)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has congenital heart disease."

(assert
(! (not patient_has_finding_of_heart_disease_now@@acquired)
   :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acquired heart disease."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_anemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of anemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of anemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of anemia.","meaning":"Boolean indicating whether the patient currently has anemia."} ;; "anaemia"
(declare-const patient_has_finding_of_anemia_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current anemia is severe.","when_to_set_to_false":"Set to false if the patient's current anemia is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current anemia is severe.","meaning":"Boolean indicating whether the patient's current anemia is severe."} ;; "severe anaemia"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_anemia_now@@severe
      patient_has_finding_of_anemia_now)
:named REQ2_AUXILIARY0)) ;; "severe anaemia" implies "anaemia"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_anemia_now@@severe)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe anaemia."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_measles_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has measles pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have measles pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has measles pneumonia.","meaning":"Boolean indicating whether the patient currently has measles pneumonia."} ;; "measles pneumonia"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_measles_pneumonia_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has measles pneumonia."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_foreign_body_inhalation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has foreign body inhalation.","when_to_set_to_false":"Set to false if the patient currently does not have foreign body inhalation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has foreign body inhalation.","meaning":"Boolean indicating whether the patient currently has foreign body inhalation."} ;; "foreign body inhalation"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_foreign_body_inhalation_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has foreign body inhalation."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_pulmonary_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of pulmonary tuberculosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of pulmonary tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of pulmonary tuberculosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of pulmonary tuberculosis."} ;; "pulmonary tuberculosis"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_diagnosis_of_pulmonary_tuberculosis_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a confirmed diagnosis of pulmonary tuberculosis."
