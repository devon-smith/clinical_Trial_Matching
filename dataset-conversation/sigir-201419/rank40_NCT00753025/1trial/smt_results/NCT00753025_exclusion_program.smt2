;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_type_1_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of type 1 diabetes mellitus (insulin dependent diabetes mellitus).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of type 1 diabetes mellitus (insulin dependent diabetes mellitus).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of type 1 diabetes mellitus (insulin dependent diabetes mellitus).","meaning":"Boolean indicating whether the patient currently has a diagnosis of type 1 diabetes mellitus (insulin dependent diabetes mellitus)."}

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_diagnosis_of_type_1_diabetes_mellitus_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has insulin dependent diabetes mellitus."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_myocardial_infarction_inthepast1years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a myocardial infarction at any time within the past one year.","when_to_set_to_false":"Set to false if the patient has not had a myocardial infarction within the past one year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a myocardial infarction within the past one year.","meaning":"Boolean indicating whether the patient has had a myocardial infarction within the past one year."} ;; "myocardial infarction within the last one year"

(declare-const patient_has_finding_of_cerebrovascular_accident_inthepast1years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a cerebrovascular accident (stroke) at any time within the past one year.","when_to_set_to_false":"Set to false if the patient has not had a cerebrovascular accident (stroke) within the past one year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a cerebrovascular accident (stroke) within the past one year.","meaning":"Boolean indicating whether the patient has had a cerebrovascular accident (stroke) within the past one year."} ;; "stroke within the last one year"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_myocardial_infarction_inthepast1years)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a myocardial infarction within the last one year."

(assert
(! (not patient_has_finding_of_cerebrovascular_accident_inthepast1years)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a stroke within the last one year."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_idiopathic_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has idiopathic hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have idiopathic hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has idiopathic hypertension.","meaning":"Boolean indicating whether the patient currently has idiopathic hypertension."} ;; "idiopathic hypertension"
(declare-const patient_has_finding_of_idiopathic_hypertension_now@@classified_as_stage_iii Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current idiopathic hypertension is classified as stage III.","when_to_set_to_false":"Set to false if the patient's current idiopathic hypertension is not classified as stage III.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current idiopathic hypertension is classified as stage III.","meaning":"Boolean indicating whether the patient's current idiopathic hypertension is classified as stage III."} ;; "idiopathic hypertension stage III"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_idiopathic_hypertension_now@@classified_as_stage_iii
       patient_has_finding_of_idiopathic_hypertension_now)
   :named REQ2_AUXILIARY0)) ;; "idiopathic hypertension stage III" implies "idiopathic hypertension"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_idiopathic_hypertension_now@@classified_as_stage_iii)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has idiopathic hypertension stage III."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_anemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of anemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of anemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has anemia.","meaning":"Boolean indicating whether the patient currently has anemia."} ;; "anaemia"
(declare-const patient_has_finding_of_disease_of_blood_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease of the blood other than anemia.","when_to_set_to_false":"Set to false if the patient currently does not have any disease of the blood other than anemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease of the blood other than anemia.","meaning":"Boolean indicating whether the patient currently has any disease of the blood (excluding anemia)."} ;; "other diseases of the blood"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_has_finding_of_anemia_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has anaemia."

(assert
  (! (not patient_has_finding_of_disease_of_blood_now)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other diseases of the blood."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_can_undergo_surgical_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo a surgical procedure.","when_to_set_to_false":"Set to false if the patient cannot currently undergo a surgical procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo a surgical procedure.","meaning":"Boolean indicating whether the patient can currently undergo a surgical procedure."} ;; "surgical operation"
(declare-const patient_has_finding_of_chronic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chronic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a chronic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a chronic disease.","meaning":"Boolean indicating whether the patient currently has a chronic disease."} ;; "chronic diseases"
(declare-const patient_has_finding_of_chronic_disease_now@@decompensated Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chronic disease and the disease is decompensated.","when_to_set_to_false":"Set to false if the patient currently has a chronic disease and the disease is not decompensated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chronic disease is decompensated.","meaning":"Boolean indicating whether the patient's current chronic disease is decompensated."} ;; "decompensation of chronic diseases"
(declare-const patient_has_finding_of_chronic_disease_now@@contraindication_to_any_surgical_operation Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chronic disease and the disease is a contraindication to any surgical operation.","when_to_set_to_false":"Set to false if the patient currently has a chronic disease and the disease is not a contraindication to any surgical operation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chronic disease is a contraindication to any surgical operation.","meaning":"Boolean indicating whether the patient's current chronic disease is a contraindication to any surgical operation."} ;; "contraindications to any surgical operation"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_chronic_disease_now@@decompensated
      patient_has_finding_of_chronic_disease_now)
:named REQ4_AUXILIARY0)) ;; "decompensation of chronic diseases"

(assert
(! (=> patient_has_finding_of_chronic_disease_now@@contraindication_to_any_surgical_operation
      patient_has_finding_of_chronic_disease_now)
:named REQ4_AUXILIARY1)) ;; "contraindications to any surgical operation"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient must NOT have decompensation of chronic diseases which are contraindications to any surgical operation
(assert
(! (not (and patient_has_finding_of_chronic_disease_now@@decompensated
             patient_has_finding_of_chronic_disease_now@@contraindication_to_any_surgical_operation))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has decompensation of chronic diseases which are contraindications to any surgical operation."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has human immunodeficiency virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient currently has human immunodeficiency virus infection."} ;; "human immunodeficiency virus infection"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_human_immunodeficiency_virus_infection_now)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has human immunodeficiency virus infection."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_viral_hepatitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of viral hepatitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of viral hepatitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of viral hepatitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of viral hepatitis."} ;; "viral hepatitis"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not patient_has_diagnosis_of_viral_hepatitis_now)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has viral hepatitis."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any neoplastic disease (including any oncologic disease, whether hematologic or solid tumor).","when_to_set_to_false":"Set to false if the patient currently does not have any neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any neoplastic disease.","meaning":"Boolean indicating whether the patient currently has any neoplastic disease."} ;; "oncologic diseases"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_neoplastic_disease_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has oncologic diseases."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_undergone_chemotherapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone chemotherapy at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone chemotherapy at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone chemotherapy.","meaning":"Boolean indicating whether the patient has ever undergone chemotherapy in their medical history."} ;; "chemotherapy"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_undergone_chemotherapy_inthehistory)
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of chemotherapy."
