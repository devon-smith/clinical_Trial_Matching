;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_multiple_sclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of multiple sclerosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of multiple sclerosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of multiple sclerosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of multiple sclerosis."} ;; "multiple sclerosis"
(declare-const patient_has_diagnosis_of_multiple_sclerosis_now@@progressive Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of multiple sclerosis is progressive.","when_to_set_to_false":"Set to false if the patient's current diagnosis of multiple sclerosis is not progressive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current multiple sclerosis is progressive.","meaning":"Boolean indicating whether the patient's current diagnosis of multiple sclerosis is progressive."} ;; "progressive multiple sclerosis"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_multiple_sclerosis_now@@progressive
      patient_has_diagnosis_of_multiple_sclerosis_now)
   :named REQ0_AUXILIARY0)) ;; "progressive multiple sclerosis" implies "multiple sclerosis"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_multiple_sclerosis_now@@progressive)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of progressive multiple sclerosis."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_undergoing_administration_of_steroid_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing administration of steroid (corticosteroid therapy).","when_to_set_to_false":"Set to false if the patient is currently not undergoing administration of steroid (corticosteroid therapy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing administration of steroid (corticosteroid therapy).","meaning":"Boolean indicating whether the patient is currently undergoing administration of steroid (corticosteroid therapy)."} ;; "corticosteroid therapy"
(declare-const patient_is_undergoing_administration_of_steroid_now@@concomitant Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing administration of steroid (corticosteroid therapy) and the therapy is concomitant (occurring at the same time as another relevant treatment or condition).","when_to_set_to_false":"Set to false if the patient is currently undergoing administration of steroid (corticosteroid therapy) but the therapy is not concomitant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the corticosteroid therapy is concomitant.","meaning":"Boolean indicating whether the patient's current administration of steroid (corticosteroid therapy) is concomitant with another relevant treatment or condition."} ;; "concomitant corticosteroid therapy"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_undergoing_administration_of_steroid_now@@concomitant
      patient_is_undergoing_administration_of_steroid_now)
   :named REQ1_AUXILIARY0)) ;; "concomitant corticosteroid therapy"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_undergoing_administration_of_steroid_now@@concomitant)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires concomitant corticosteroid therapy."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_undergoing_drug_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving drug therapy.","when_to_set_to_false":"Set to false if the patient is currently not receiving drug therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving drug therapy.","meaning":"Boolean indicating whether the patient is currently receiving drug therapy."} ;; "drug therapy"
(declare-const patient_is_undergoing_drug_therapy_now@@is_experimental Bool) ;; {"when_to_set_to_true":"Set to true if the drug therapy the patient is currently receiving is experimental.","when_to_set_to_false":"Set to false if the drug therapy the patient is currently receiving is not experimental.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug therapy is experimental.","meaning":"Boolean indicating whether the drug therapy the patient is currently receiving is experimental."} ;; "experimental drug therapy"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_undergoing_drug_therapy_now@@is_experimental
     patient_is_undergoing_drug_therapy_now)
:named REQ2_AUXILIARY0)) ;; "experimental drug therapy" implies "drug therapy"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_undergoing_drug_therapy_now@@is_experimental)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving experimental drug therapy."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_systemic_sclerosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with systemic sclerosis (scleroderma) at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with systemic sclerosis (scleroderma) at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with systemic sclerosis (scleroderma).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of systemic sclerosis (scleroderma) in their history."} ;; "the patient has a history of scleroderma"

(declare-const patient_has_diagnosis_of_systemic_mycosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with systemic mycosis (systemic fungal infection) at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with systemic mycosis (systemic fungal infection) at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with systemic mycosis (systemic fungal infection).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of systemic mycosis (systemic fungal infection) in their history."} ;; "the patient has a history of systemic fungal infection"

(declare-const patient_has_diagnosis_of_ophthalmic_herpes_simplex_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been diagnosed with ophthalmic herpes simplex (ocular herpes simplex infection) within the past five years.","when_to_set_to_false":"Set to false if the patient has not been diagnosed with ophthalmic herpes simplex (ocular herpes simplex infection) within the past five years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been diagnosed with ophthalmic herpes simplex (ocular herpes simplex infection) within the past five years.","meaning":"Boolean indicating whether the patient has had a diagnosis of ophthalmic herpes simplex (ocular herpes simplex infection) within the past five years."} ;; "the patient has a history of ocular herpes simplex infection within the prior five years"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_has_diagnosis_of_systemic_sclerosis_inthehistory)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of scleroderma."

(assert
  (! (not patient_has_diagnosis_of_systemic_mycosis_inthehistory)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of systemic fungal infection."

(assert
  (! (not patient_has_diagnosis_of_ophthalmic_herpes_simplex_inthepast5years)
     :named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of ocular herpes simplex infection within the prior five years."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease."} ;; "malignancy currently diagnosed"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@is_solid_tumor Bool) ;; {"when_to_set_to_true":"Set to true if the patient's currently diagnosed malignant neoplastic disease is a solid tumor.","when_to_set_to_false":"Set to false if the patient's currently diagnosed malignant neoplastic disease is not a solid tumor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malignancy is a solid tumor.","meaning":"Boolean indicating whether the patient's currently diagnosed malignant neoplastic disease is a solid tumor."} ;; "solid tumor malignancy currently diagnosed"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@is_undergoing_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing therapy for the diagnosed malignant neoplastic disease.","when_to_set_to_false":"Set to false if the patient is not currently undergoing therapy for the diagnosed malignant neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing therapy for the diagnosed malignant neoplastic disease.","meaning":"Boolean indicating whether the patient is currently undergoing therapy for the diagnosed malignant neoplastic disease."} ;; "solid tumor malignancy undergoing therapy"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of malignant neoplastic disease in the past 5 years.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of malignant neoplastic disease in the past 5 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of malignant neoplastic disease in the past 5 years.","meaning":"Boolean indicating whether the patient has had a diagnosis of malignant neoplastic disease in the past 5 years."} ;; "malignancy in the five years prior to the Enrollment Visit"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years@@received_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received therapy for the malignant neoplastic disease diagnosed in the past 5 years.","when_to_set_to_false":"Set to false if the patient has not received therapy for the malignant neoplastic disease diagnosed in the past 5 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received therapy for the malignant neoplastic disease diagnosed in the past 5 years.","meaning":"Boolean indicating whether the patient has received therapy for the malignant neoplastic disease diagnosed in the past 5 years."} ;; "received therapy for any solid tumor malignancy in the five years prior to the Enrollment Visit"
(declare-const patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of basal cell carcinoma of skin.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of basal cell carcinoma of skin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of basal cell carcinoma of skin.","meaning":"Boolean indicating whether the patient currently has a diagnosis of basal cell carcinoma of skin."} ;; "basal cell carcinoma"
(declare-const patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_now@@is_treated_and_cured Bool) ;; {"when_to_set_to_true":"Set to true if the patient's basal cell carcinoma of skin is treated and cured.","when_to_set_to_false":"Set to false if the patient's basal cell carcinoma of skin is not treated and cured.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the basal cell carcinoma of skin is treated and cured.","meaning":"Boolean indicating whether the patient's basal cell carcinoma of skin is treated and cured."} ;; "treated and cured basal cell carcinoma"
(declare-const patient_has_diagnosis_of_squamous_cell_carcinoma_of_skin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of squamous cell carcinoma of skin.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of squamous cell carcinoma of skin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of squamous cell carcinoma of skin.","meaning":"Boolean indicating whether the patient currently has a diagnosis of squamous cell carcinoma of skin."} ;; "squamous cell carcinoma of the skin"
(declare-const patient_has_diagnosis_of_squamous_cell_carcinoma_of_skin_now@@is_treated_and_cured Bool) ;; {"when_to_set_to_true":"Set to true if the patient's squamous cell carcinoma of skin is treated and cured.","when_to_set_to_false":"Set to false if the patient's squamous cell carcinoma of skin is not treated and cured.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the squamous cell carcinoma of skin is treated and cured.","meaning":"Boolean indicating whether the patient's squamous cell carcinoma of skin is treated and cured."} ;; "treated and cured squamous cell carcinoma of the skin"
(declare-const patient_has_diagnosis_of_carcinoma_in_situ_of_uterine_cervix_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of carcinoma in situ of uterine cervix.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of carcinoma in situ of uterine cervix.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of carcinoma in situ of uterine cervix.","meaning":"Boolean indicating whether the patient currently has a diagnosis of carcinoma in situ of uterine cervix."} ;; "carcinoma in situ of the cervix"
(declare-const patient_has_diagnosis_of_carcinoma_in_situ_of_uterine_cervix_now@@is_treated_and_cured Bool) ;; {"when_to_set_to_true":"Set to true if the patient's carcinoma in situ of uterine cervix is treated and cured.","when_to_set_to_false":"Set to false if the patient's carcinoma in situ of uterine cervix is not treated and cured.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the carcinoma in situ of uterine cervix is treated and cured.","meaning":"Boolean indicating whether the patient's carcinoma in situ of uterine cervix is treated and cured."} ;; "treated and cured carcinoma in situ of the cervix"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@is_only_such_malignancy Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has only one malignant neoplastic disease relevant to the exclusion criteria.","when_to_set_to_false":"Set to false if the patient currently has more than one malignant neoplastic disease relevant to the exclusion criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has only one malignant neoplastic disease relevant to the exclusion criteria.","meaning":"Boolean indicating whether the patient currently has only one malignant neoplastic disease relevant to the exclusion criteria."} ;; "the only such malignancy"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@is_solid_tumor
      patient_has_diagnosis_of_malignant_neoplastic_disease_now)
:named REQ4_AUXILIARY0)) ;; "solid tumor malignancy currently diagnosed"

(assert
(! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@is_undergoing_therapy
      patient_has_diagnosis_of_malignant_neoplastic_disease_now)
:named REQ4_AUXILIARY1)) ;; "solid tumor malignancy undergoing therapy"

(assert
(! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years@@received_therapy
      patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years)
:named REQ4_AUXILIARY2)) ;; "received therapy for any solid tumor malignancy in the five years prior to the Enrollment Visit"

(assert
(! (=> patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_now@@is_treated_and_cured
      patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_now)
:named REQ4_AUXILIARY3)) ;; "treated and cured basal cell carcinoma"

(assert
(! (=> patient_has_diagnosis_of_squamous_cell_carcinoma_of_skin_now@@is_treated_and_cured
      patient_has_diagnosis_of_squamous_cell_carcinoma_of_skin_now)
:named REQ4_AUXILIARY4)) ;; "treated and cured squamous cell carcinoma of the skin"

(assert
(! (=> patient_has_diagnosis_of_carcinoma_in_situ_of_uterine_cervix_now@@is_treated_and_cured
      patient_has_diagnosis_of_carcinoma_in_situ_of_uterine_cervix_now)
:named REQ4_AUXILIARY5)) ;; "treated and cured carcinoma in situ of the cervix"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion 1: currently diagnosed solid tumor malignancy, except if the only such malignancy is treated and cured basal cell carcinoma, squamous cell carcinoma of the skin, or carcinoma in situ of the cervix
(assert
(! (not
      (and patient_has_diagnosis_of_malignant_neoplastic_disease_now@@is_solid_tumor
           (not
             (and patient_has_diagnosis_of_malignant_neoplastic_disease_now@@is_only_such_malignancy
                  (or patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_now@@is_treated_and_cured
                      patient_has_diagnosis_of_squamous_cell_carcinoma_of_skin_now@@is_treated_and_cured
                      patient_has_diagnosis_of_carcinoma_in_situ_of_uterine_cervix_now@@is_treated_and_cured)))))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any solid tumor malignancy currently diagnosed, except if the only such malignancy is treated and cured basal cell carcinoma, treated and cured squamous cell carcinoma of the skin, or treated and cured carcinoma in situ of the cervix."

;; Exclusion 2: currently undergoing therapy for solid tumor malignancy, except if the only such malignancy is treated and cured basal cell carcinoma, squamous cell carcinoma of the skin, or carcinoma in situ of the cervix
(assert
(! (not
      (and patient_has_diagnosis_of_malignant_neoplastic_disease_now@@is_undergoing_therapy
           patient_has_diagnosis_of_malignant_neoplastic_disease_now@@is_solid_tumor
           (not
             (and patient_has_diagnosis_of_malignant_neoplastic_disease_now@@is_only_such_malignancy
                  (or patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_now@@is_treated_and_cured
                      patient_has_diagnosis_of_squamous_cell_carcinoma_of_skin_now@@is_treated_and_cured
                      patient_has_diagnosis_of_carcinoma_in_situ_of_uterine_cervix_now@@is_treated_and_cured)))))
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any solid tumor malignancy undergoing therapy, except if the only such malignancy is treated and cured basal cell carcinoma, treated and cured squamous cell carcinoma of the skin, or treated and cured carcinoma in situ of the cervix."

;; Exclusion 3: received therapy for any solid tumor malignancy in the five years prior to the Enrollment Visit, except if the only such malignancy is treated and cured basal cell carcinoma, squamous cell carcinoma of the skin, or carcinoma in situ of the cervix
(assert
(! (not
      (and patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years@@received_therapy
           (not
             (and patient_has_diagnosis_of_malignant_neoplastic_disease_now@@is_only_such_malignancy
                  (or patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_now@@is_treated_and_cured
                      patient_has_diagnosis_of_squamous_cell_carcinoma_of_skin_now@@is_treated_and_cured
                      patient_has_diagnosis_of_carcinoma_in_situ_of_uterine_cervix_now@@is_treated_and_cured)))))
:named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received therapy for any solid tumor malignancy in the five years prior to the Enrollment Visit, except if the only such malignancy is treated and cured basal cell carcinoma, treated and cured squamous cell carcinoma of the skin, or treated and cured carcinoma in situ of the cervix."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_undergone_surgical_procedure_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a surgical procedure within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not undergone a surgical procedure within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a surgical procedure within the past 6 months.","meaning":"Boolean indicating whether the patient has undergone a surgical procedure within the past 6 months."} ;; "recent surgery"
(declare-const patient_has_diagnosis_of_peptic_ulcer_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with peptic ulcer at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with peptic ulcer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with peptic ulcer.","meaning":"Boolean indicating whether the patient has ever been diagnosed with peptic ulcer."} ;; "history of peptic ulcer"
(declare-const patient_has_diagnosis_of_peptic_ulcer_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been diagnosed with peptic ulcer within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not been diagnosed with peptic ulcer within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been diagnosed with peptic ulcer within the past 6 months.","meaning":"Boolean indicating whether the patient has been diagnosed with peptic ulcer within the past 6 months."} ;; "presence of peptic ulcer within six months prior to study entry"
(declare-const patient_has_diagnosis_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of congestive heart failure.","meaning":"Boolean indicating whether the patient currently has a diagnosis of congestive heart failure."} ;; "congestive heart failure"
(declare-const patient_has_hypersensitivity_to_protein_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypersensitivity to protein.","when_to_set_to_false":"Set to false if the patient currently does not have hypersensitivity to protein.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypersensitivity to protein.","meaning":"Boolean indicating whether the patient currently has hypersensitivity to protein."} ;; "sensitivity to proteins"
(declare-const patient_has_hypersensitivity_to_protein_now@@origin_porcine Bool) ;; {"when_to_set_to_true":"Set to true if the protein to which the patient has hypersensitivity is of porcine origin.","when_to_set_to_false":"Set to false if the protein to which the patient has hypersensitivity is not of porcine origin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the protein to which the patient has hypersensitivity is of porcine origin.","meaning":"Boolean indicating whether the protein to which the patient has hypersensitivity is of porcine origin."} ;; "sensitivity to proteins of porcine origin"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_hypersensitivity_to_protein_now@@origin_porcine
       patient_has_hypersensitivity_to_protein_now)
   :named REQ5_AUXILIARY0)) ;; "sensitivity to proteins of porcine origin"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_undergone_surgical_procedure_inthepast6months)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient had recent surgery"

(assert
(! (not patient_has_diagnosis_of_peptic_ulcer_inthehistory)
   :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has a history of peptic ulcer"

(assert
(! (not patient_has_diagnosis_of_peptic_ulcer_inthepast6months)
   :named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient has the presence of peptic ulcer within six months prior to study entry"

(assert
(! (not patient_has_diagnosis_of_congestive_heart_failure_now)
   :named REQ5_COMPONENT3_OTHER_REQUIREMENTS)) ;; "the patient has congestive heart failure"

(assert
(! (not patient_has_hypersensitivity_to_protein_now@@origin_porcine)
   :named REQ5_COMPONENT4_OTHER_REQUIREMENTS)) ;; "the patient has sensitivity to proteins of porcine origin"

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (male or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."} ;; "the patient is female"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently pregnant.","when_to_set_to_false":"Set to false if the patient is documented as not currently pregnant.","when_to_set_to_null":"Set to null if the patient's pregnancy status is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently breast-feeding.","when_to_set_to_false":"Set to false if the patient is documented as not currently breast-feeding.","when_to_set_to_null":"Set to null if the patient's breast-feeding status is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient is currently breast-feeding."} ;; "the patient is breast-feeding"
(declare-const patients_breastfeeding_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breast-feeding.","when_to_set_to_false":"Set to false if the patient is currently not breast-feeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently breast-feeding.","meaning":"Boolean indicating whether the patient is currently breast-feeding."} ;; "breast-feeding"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as having childbearing potential at the current time.","when_to_set_to_false":"Set to false if the patient is documented as not having childbearing potential at the current time.","when_to_set_to_null":"Set to null if the patient's childbearing potential is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} ;; "the patient is of childbearing age"
(declare-const patient_is_of_childbearing_age_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently of childbearing age.","when_to_set_to_false":"Set to false if the patient is documented as not currently of childbearing age.","when_to_set_to_null":"Set to null if the patient's childbearing age status is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient is currently of childbearing age."} ;; "the patient is of childbearing age"
(declare-const patient_is_unwilling_to_use_appropriate_birth_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently unwilling to use appropriate birth control.","when_to_set_to_false":"Set to false if the patient is documented as currently willing to use appropriate birth control.","when_to_set_to_null":"Set to null if the patient's willingness to use appropriate birth control is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient is currently unwilling to use appropriate birth control."} ;; "the patient is unwilling to use appropriate birth control"
(declare-const patient_is_unwilling_to_use_appropriate_birth_control_now@@appropriate_birth_control Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unwilling to use birth control that meets the appropriateness criteria defined by the study protocol.","when_to_set_to_false":"Set to false if the patient is currently willing to use birth control that meets the appropriateness criteria defined by the study protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unwilling to use birth control that meets the appropriateness criteria defined by the study protocol.","meaning":"Boolean value indicating whether the patient is currently unwilling to use birth control that is appropriate as defined by the study protocol."} ;; "the patient is unwilling to use appropriate birth control"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_unwilling_to_use_appropriate_birth_control_now@@appropriate_birth_control
       patient_is_unwilling_to_use_appropriate_birth_control_now)
   :named REQ6_AUXILIARY0)) ;; "the patient is unwilling to use appropriate birth control"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: (female AND (pregnant OR breast-feeding)) OR (of childbearing age AND unwilling to use appropriate birth control)
(assert
(! (not (or
         (and patient_sex_is_female_now
              (or patient_is_pregnant_now patient_is_breastfeeding_now))
         (and patient_is_of_childbearing_age_now
              patient_is_unwilling_to_use_appropriate_birth_control_now@@appropriate_birth_control)))
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is female AND ((the patient is pregnant) OR (the patient is breast-feeding))) OR ((the patient is of childbearing age) AND (the patient is unwilling to use appropriate birth control))."
