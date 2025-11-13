;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_malignant_adenomatous_neoplasm_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has adenocarcinoma.","when_to_set_to_false":"Set to false if the patient currently does not have adenocarcinoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has adenocarcinoma.","meaning":"Boolean indicating whether the patient currently has adenocarcinoma."}  ;; "adenocarcinoma"
(declare-const patient_has_finding_of_malignant_adenomatous_neoplasm_now@@histologically_documented Bool) ;; {"when_to_set_to_true":"Set to true if the patient's adenocarcinoma is histologically documented.","when_to_set_to_false":"Set to false if the patient's adenocarcinoma is not histologically documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the adenocarcinoma is histologically documented.","meaning":"Boolean indicating whether the patient's adenocarcinoma is histologically documented."}  ;; "histologically documented adenocarcinoma"
(declare-const patient_has_finding_of_malignant_adenomatous_neoplasm_now@@located_in_thoracic_esophagus Bool) ;; {"when_to_set_to_true":"Set to true if the patient's adenocarcinoma tumor is located in the thoracic esophagus.","when_to_set_to_false":"Set to false if the tumor is not located in the thoracic esophagus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the tumor is located in the thoracic esophagus.","meaning":"Boolean indicating whether the patient's adenocarcinoma tumor is located in the thoracic esophagus."}  ;; "adenocarcinoma of the thoracic esophagus"
(declare-const patient_has_finding_of_malignant_adenomatous_neoplasm_now@@tumor_location_gt_20cm_from_incisors Bool) ;; {"when_to_set_to_true":"Set to true if the patient's adenocarcinoma tumor is located more than 20 cm from the incisors.","when_to_set_to_false":"Set to false if the tumor is not located more than 20 cm from the incisors.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the tumor is located more than 20 cm from the incisors.","meaning":"Boolean indicating whether the patient's adenocarcinoma tumor is located more than 20 cm from the incisors."}  ;; "adenocarcinoma of the thoracic esophagus (with the tumor located > 20 cm from the incisors)"
(declare-const patient_has_finding_of_primary_adenocarcinoma_of_esophagogastric_junction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has adenocarcinoma of the gastroesophageal junction.","when_to_set_to_false":"Set to false if the patient currently does not have adenocarcinoma of the gastroesophageal junction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has adenocarcinoma of the gastroesophageal junction.","meaning":"Boolean indicating whether the patient currently has adenocarcinoma of the gastroesophageal junction."}  ;; "adenocarcinoma of the gastroesophageal junction"
(declare-const patient_has_finding_of_primary_adenocarcinoma_of_esophagogastric_junction_now@@histologically_documented Bool) ;; {"when_to_set_to_true":"Set to true if the patient's adenocarcinoma of the gastroesophageal junction is histologically documented.","when_to_set_to_false":"Set to false if the patient's adenocarcinoma of the gastroesophageal junction is not histologically documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the adenocarcinoma of the gastroesophageal junction is histologically documented.","meaning":"Boolean indicating whether the patient's adenocarcinoma of the gastroesophageal junction is histologically documented."}  ;; "histologically documented adenocarcinoma of the gastroesophageal junction"
(declare-const patient_has_finding_of_squamous_cell_carcinoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has squamous cell carcinoma.","when_to_set_to_false":"Set to false if the patient currently does not have squamous cell carcinoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has squamous cell carcinoma.","meaning":"Boolean indicating whether the patient currently has squamous cell carcinoma."}  ;; "squamous cell carcinoma"
(declare-const patient_has_finding_of_squamous_cell_carcinoma_now@@histologically_documented Bool) ;; {"when_to_set_to_true":"Set to true if the patient's squamous cell carcinoma is histologically documented.","when_to_set_to_false":"Set to false if the patient's squamous cell carcinoma is not histologically documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the squamous cell carcinoma is histologically documented.","meaning":"Boolean indicating whether the patient's squamous cell carcinoma is histologically documented."}  ;; "histologically documented squamous cell carcinoma"
(declare-const patient_has_finding_of_squamous_cell_carcinoma_now@@located_in_thoracic_esophagus Bool) ;; {"when_to_set_to_true":"Set to true if the patient's squamous cell carcinoma tumor is located in the thoracic esophagus.","when_to_set_to_false":"Set to false if the tumor is not located in the thoracic esophagus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the tumor is located in the thoracic esophagus.","meaning":"Boolean indicating whether the patient's squamous cell carcinoma tumor is located in the thoracic esophagus."}  ;; "squamous cell carcinoma of the thoracic esophagus"
(declare-const patient_has_finding_of_squamous_cell_carcinoma_now@@tumor_location_gt_20cm_from_incisors Bool) ;; {"when_to_set_to_true":"Set to true if the patient's squamous cell carcinoma tumor is located more than 20 cm from the incisors.","when_to_set_to_false":"Set to false if the tumor is not located more than 20 cm from the incisors.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the tumor is located more than 20 cm from the incisors.","meaning":"Boolean indicating whether the patient's squamous cell carcinoma tumor is located more than 20 cm from the incisors."}  ;; "squamous cell carcinoma of the thoracic esophagus (with the tumor located > 20 cm from the incisors)"
(declare-const patient_has_finding_of_squamous_cell_carcinoma_now@@located_in_gastroesophageal_junction Bool) ;; {"when_to_set_to_true":"Set to true if the patient's squamous cell carcinoma tumor is located in the gastroesophageal junction.","when_to_set_to_false":"Set to false if the tumor is not located in the gastroesophageal junction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the tumor is located in the gastroesophageal junction.","meaning":"Boolean indicating whether the patient's squamous cell carcinoma tumor is located in the gastroesophageal junction."}  ;; "squamous cell carcinoma of the gastroesophageal junction"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply their stem variables
(assert
  (! (=> patient_has_finding_of_malignant_adenomatous_neoplasm_now@@histologically_documented
         patient_has_finding_of_malignant_adenomatous_neoplasm_now)
     :named REQ0_AUXILIARY0)) ;; "histologically documented adenocarcinoma"

(assert
  (! (=> patient_has_finding_of_malignant_adenomatous_neoplasm_now@@located_in_thoracic_esophagus
         patient_has_finding_of_malignant_adenomatous_neoplasm_now)
     :named REQ0_AUXILIARY1)) ;; "adenocarcinoma of the thoracic esophagus"

(assert
  (! (=> patient_has_finding_of_malignant_adenomatous_neoplasm_now@@tumor_location_gt_20cm_from_incisors
         patient_has_finding_of_malignant_adenomatous_neoplasm_now)
     :named REQ0_AUXILIARY2)) ;; "adenocarcinoma of the thoracic esophagus (with the tumor located > 20 cm from the incisors)"

(assert
  (! (=> patient_has_finding_of_primary_adenocarcinoma_of_esophagogastric_junction_now@@histologically_documented
         patient_has_finding_of_primary_adenocarcinoma_of_esophagogastric_junction_now)
     :named REQ0_AUXILIARY3)) ;; "histologically documented adenocarcinoma of the gastroesophageal junction"

(assert
  (! (=> patient_has_finding_of_squamous_cell_carcinoma_now@@histologically_documented
         patient_has_finding_of_squamous_cell_carcinoma_now)
     :named REQ0_AUXILIARY4)) ;; "histologically documented squamous cell carcinoma"

(assert
  (! (=> patient_has_finding_of_squamous_cell_carcinoma_now@@located_in_thoracic_esophagus
         patient_has_finding_of_squamous_cell_carcinoma_now)
     :named REQ0_AUXILIARY5)) ;; "squamous cell carcinoma of the thoracic esophagus"

(assert
  (! (=> patient_has_finding_of_squamous_cell_carcinoma_now@@tumor_location_gt_20cm_from_incisors
         patient_has_finding_of_squamous_cell_carcinoma_now)
     :named REQ0_AUXILIARY6)) ;; "squamous cell carcinoma of the thoracic esophagus (with the tumor located > 20 cm from the incisors)"

(assert
  (! (=> patient_has_finding_of_squamous_cell_carcinoma_now@@located_in_gastroesophageal_junction
         patient_has_finding_of_squamous_cell_carcinoma_now)
     :named REQ0_AUXILIARY7)) ;; "squamous cell carcinoma of the gastroesophageal junction"

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must have at least one of the following:
;; (1) histologically documented squamous cell carcinoma of the thoracic esophagus (with the tumor located > 20 cm from the incisors)
;; (2) histologically documented adenocarcinoma of the thoracic esophagus (with the tumor located > 20 cm from the incisors)
;; (3) histologically documented squamous cell carcinoma of the gastroesophageal junction
;; (4) histologically documented adenocarcinoma of the gastroesophageal junction

(assert
  (! (or
        (and patient_has_finding_of_squamous_cell_carcinoma_now@@histologically_documented
             patient_has_finding_of_squamous_cell_carcinoma_now@@located_in_thoracic_esophagus
             patient_has_finding_of_squamous_cell_carcinoma_now@@tumor_location_gt_20cm_from_incisors)
        (and patient_has_finding_of_malignant_adenomatous_neoplasm_now@@histologically_documented
             patient_has_finding_of_malignant_adenomatous_neoplasm_now@@located_in_thoracic_esophagus
             patient_has_finding_of_malignant_adenomatous_neoplasm_now@@tumor_location_gt_20cm_from_incisors)
        (and patient_has_finding_of_squamous_cell_carcinoma_now@@histologically_documented
             patient_has_finding_of_squamous_cell_carcinoma_now@@located_in_gastroesophageal_junction)
        (and patient_has_finding_of_primary_adenocarcinoma_of_esophagogastric_junction_now@@histologically_documented)
     )
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (histologically documented squamous cell carcinoma of the thoracic esophagus (with the tumor located > 20 cm from the incisors) OR histologically documented adenocarcinoma of the thoracic esophagus (with the tumor located > 20 cm from the incisors) OR histologically documented squamous cell carcinoma of the gastroesophageal junction OR histologically documented adenocarcinoma of the gastroesophageal junction)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_secondary_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has secondary malignant neoplastic disease (metastases).","when_to_set_to_false":"Set to false if the patient currently does not have secondary malignant neoplastic disease (metastases).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has secondary malignant neoplastic disease (metastases).","meaning":"Boolean indicating whether the patient currently has secondary malignant neoplastic disease (metastases) now."}  ;; "metastases"
(declare-const patient_has_finding_of_secondary_malignant_neoplastic_disease_now@@distant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has distant secondary malignant neoplastic disease (distant metastases).","when_to_set_to_false":"Set to false if the patient currently has only local or regional metastases, or none at all.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's metastases are distant.","meaning":"Boolean indicating whether the patient's current secondary malignant neoplastic disease (metastases) are distant."}  ;; "distant metastases"
(declare-const patient_has_metastatic_stage_m0_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has metastatic stage M0, meaning no distant metastases are present.","when_to_set_to_false":"Set to false if the patient currently does not have metastatic stage M0, meaning distant metastases are present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has metastatic stage M0.","meaning":"Boolean indicating whether the patient currently has metastatic stage M0 (no distant metastases) now."}  ;; "metastatic stage M0"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable for distant metastases implies general metastases
(assert
  (! (=> patient_has_finding_of_secondary_malignant_neoplastic_disease_now@@distant
         patient_has_finding_of_secondary_malignant_neoplastic_disease_now)
     :named REQ1_AUXILIARY0)) ;; "distant metastases" implies "metastases"

;; Metastatic stage M0 is defined as no distant metastases
(assert
  (! (= patient_has_metastatic_stage_m0_now
        (not patient_has_finding_of_secondary_malignant_neoplastic_disease_now@@distant))
     :named REQ1_AUXILIARY1)) ;; "no distant metastases (defined as metastatic stage M0)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; To be included, the patient must have no distant metastases (i.e., must be M0)
(assert
  (! patient_has_metastatic_stage_m0_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have no distant metastases (defined as metastatic stage M0)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_clinical_stage_now Bool) ;; {"when_to_set_to_value":"Set to 'clinical_n0' if the patient's current clinical stage is clinical N0; set to 'clinical_n1' if the patient's current clinical stage is clinical N1.","when_to_set_to_null":"Set to null if the patient's current clinical stage is unknown, not documented, or cannot be determined.","meaning":"Categorical variable indicating whether the patient's current clinical stage is clinical N0 or clinical N1."}  ;; "clinical stage (clinical N0 versus clinical N1)"
(declare-const patient_surgeon_id Real) ;; {"when_to_set_to_value":"Set to the unique identifier of the surgeon responsible for the patient's care.","when_to_set_to_null":"Set to null if the surgeon responsible for the patient's care is unknown, not documented, or cannot be determined.","meaning":"Identifier variable indicating the specific surgeon responsible for the patient's care."}  ;; "stratified by surgeon"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Patient must be stratified by clinical stage (clinical N0 versus clinical N1)
(assert
  (! (or (= patient_clinical_stage_now true) (= patient_clinical_stage_now false))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be stratified by clinical stage (clinical N0 versus clinical N1)."

;; Component 1: Patient must be stratified by surgeon
(assert
  (! (not (= patient_surgeon_id 0.0))
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be stratified by surgeon."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_undergone_esophagogastroscopy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone esophagogastroscopy now.","when_to_set_to_false":"Set to false if the patient has not undergone esophagogastroscopy now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone esophagogastroscopy now.","meaning":"Boolean indicating whether the patient has undergone esophagogastroscopy now."}  ;; "as detected by esophagogastroscopy"
(declare-const tumor_distal_spread_into_gastric_cardia_length_value_recorded_now_in_cm Real) ;; {"when_to_set_to_value":"Set to the numeric value (in centimeters) of the tumor's distal spread into the gastric cardia as detected by esophagogastroscopy, recorded now.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the length in centimeters of the tumor's distal spread into the gastric cardia as detected by esophagogastroscopy, recorded now."}  ;; "tumor with distal spread into the gastric cardia ≤ 3 cm (as detected by esophagogastroscopy)"

;; ===================== Constraint Assertions (REQ 3) =====================
;; The patient must have a tumor with distal spread into the gastric cardia ≤ 3 cm (as detected by esophagogastroscopy).
(assert
  (! (and patient_has_undergone_esophagogastroscopy_now
          (<= tumor_distal_spread_into_gastric_cardia_length_value_recorded_now_in_cm 3.0))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_resectable_mediastinal_lymph_nodes_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has mediastinal lymph nodes that are resectable.","when_to_set_to_false":"Set to false if the patient currently does not have mediastinal lymph nodes that are resectable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has mediastinal lymph nodes that are resectable.","meaning":"Boolean indicating whether the patient currently has mediastinal lymph nodes that are resectable."}  ;; "the patient must have resectable mediastinal lymph nodes"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_finding_of_resectable_mediastinal_lymph_nodes_now
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have resectable mediastinal lymph nodes"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_undergone_chemotherapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone chemotherapy at any time in the past, regardless of indication or timing.","when_to_set_to_false":"Set to false if the patient has never undergone chemotherapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone chemotherapy.","meaning":"Boolean indicating whether the patient has ever undergone chemotherapy at any time in the past."}  ;; "chemotherapy"
(declare-const patient_has_undergone_chemotherapy_inthehistory@@for_this_malignancy Bool) ;; {"when_to_set_to_true":"Set to true if the chemotherapy undergone by the patient was specifically for this malignancy.","when_to_set_to_false":"Set to false if the chemotherapy undergone by the patient was not for this malignancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chemotherapy was for this malignancy.","meaning":"Boolean indicating whether the chemotherapy undergone by the patient was for this malignancy."}  ;; "chemotherapy for this malignancy"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_chemotherapy_inthehistory@@for_this_malignancy
         patient_has_undergone_chemotherapy_inthehistory)
     :named REQ5_AUXILIARY0)) ;; "chemotherapy undergone for this malignancy implies chemotherapy undergone in history"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: To be included, the patient must NOT have had prior chemotherapy for this malignancy.
(assert
  (! (not patient_has_undergone_chemotherapy_inthehistory@@for_this_malignancy)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have had prior chemotherapy for this malignancy."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_undergone_prior_radiotherapy_that_would_overlap_study_field Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously undergone radiotherapy and the radiotherapy field would overlap the field(s) treated in this study.","when_to_set_to_false":"Set to false if the patient has not previously undergone radiotherapy that would overlap the field(s) treated in this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously undergone radiotherapy that would overlap the field(s) treated in this study.","meaning":"Boolean indicating whether the patient has previously undergone radiotherapy that would overlap the field(s) treated in this study."} ;; "the patient must NOT have had prior radiotherapy that would overlap the field(s) treated in this study."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not patient_has_undergone_prior_radiotherapy_that_would_overlap_study_field)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must NOT have had prior radiotherapy that would overlap the field(s) treated in this study."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplasm_of_skin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplasm of skin (skin cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplasm of skin (skin cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplasm of skin (skin cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplasm of skin (skin cancer)."} ;; "skin cancer"
(declare-const patient_has_diagnosis_of_malignant_neoplasm_of_skin_now@@completely_resected Bool) ;; {"when_to_set_to_true":"Set to true if the patient's skin cancer is completely resected.","when_to_set_to_false":"Set to false if the patient's skin cancer is not completely resected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's skin cancer is completely resected.","meaning":"Boolean indicating whether the patient's skin cancer is completely resected."} ;; "completely resected non-melanoma skin cancer"
(declare-const patient_has_diagnosis_of_malignant_neoplasm_of_skin_now@@non_melanoma Bool) ;; {"when_to_set_to_true":"Set to true if the patient's skin cancer is non-melanoma.","when_to_set_to_false":"Set to false if the patient's skin cancer is melanoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's skin cancer is non-melanoma.","meaning":"Boolean indicating whether the patient's skin cancer is non-melanoma."} ;; "non-melanoma skin cancer"
(declare-const patient_has_diagnosis_of_malignant_neoplasm_of_skin_now@@treated Bool) ;; {"when_to_set_to_true":"Set to true if the patient's skin cancer is treated.","when_to_set_to_false":"Set to false if the patient's skin cancer is not treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's skin cancer is treated.","meaning":"Boolean indicating whether the patient's skin cancer is treated."} ;; "treated non-melanoma skin cancer"
(declare-const patient_has_diagnosis_of_other_malignancy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any malignancy other than malignant neoplasm of skin.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of any malignancy other than malignant neoplasm of skin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of any malignancy other than malignant neoplasm of skin.","meaning":"Boolean indicating whether the patient currently has a diagnosis of any malignancy other than malignant neoplasm of skin."} ;; "no other malignancies"
(declare-const patient_has_evidence_of_malignant_disease_free_interval_value_recorded_in_years Real) ;; {"when_to_set_to_value":"Set to the number of years the patient has been without evidence of malignant disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many years the patient has been without evidence of malignant disease.","meaning":"Numeric value indicating the number of years the patient has been without evidence of malignant disease."} ;; "been without evidence of malignant disease for > 5 years"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of malignant neoplastic disease.","when_to_set_to_false":"Set to false if the patient currently does not have evidence of malignant neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of malignant neoplastic disease.","meaning":"Boolean indicating whether the patient currently has evidence of malignant neoplastic disease."} ;; "malignant disease"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplasm_of_skin_now@@completely_resected
         (and patient_has_diagnosis_of_malignant_neoplasm_of_skin_now
              patient_has_diagnosis_of_malignant_neoplasm_of_skin_now@@non_melanoma))
     :named REQ7_AUXILIARY0)) ;; "completely resected non-melanoma skin cancer"

(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplasm_of_skin_now@@treated
         (and patient_has_diagnosis_of_malignant_neoplasm_of_skin_now
              patient_has_diagnosis_of_malignant_neoplasm_of_skin_now@@non_melanoma))
     :named REQ7_AUXILIARY1)) ;; "treated non-melanoma skin cancer"

;; ===================== Constraint Assertions (REQ 7) =====================
;; To be included, the patient must have no other malignancies UNLESS the patient has been without evidence of malignant disease for > 5 years OR has completely resected non-melanoma skin cancer OR has treated non-melanoma skin cancer.
(assert
  (! (or (not patient_has_diagnosis_of_other_malignancy_now)
         (> patient_has_evidence_of_malignant_disease_free_interval_value_recorded_in_years 5.0)
         patient_has_diagnosis_of_malignant_neoplasm_of_skin_now@@completely_resected
         patient_has_diagnosis_of_malignant_neoplasm_of_skin_now@@treated)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "no other malignancies UNLESS the patient has been without evidence of malignant disease for > 5 years OR has completely resected non-melanoma skin cancer OR has treated non-melanoma skin cancer."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "older than 18 years"
(declare-const patient_is_able_to_tolerate_tri_modality_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to tolerate tri-modality therapy, as determined by the treating thoracic surgeon, treating medical oncologist, and treating radiation oncologist.","when_to_set_to_false":"Set to false if the patient is currently not able to tolerate tri-modality therapy, as determined by the treating thoracic surgeon, treating medical oncologist, and treating radiation oncologist.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to tolerate tri-modality therapy.","meaning":"Boolean indicating whether the patient is currently able to tolerate tri-modality therapy."}  ;; "able to tolerate tri-modality therapy"
(declare-const patient_is_able_to_tolerate_tri_modality_therapy_now@@at_discretion_of_treating_thoracic_surgeon_and_medical_oncologist_and_radiation_oncologist Bool) ;; {"when_to_set_to_true":"Set to true if the determination of the patient's ability to tolerate tri-modality therapy is made at the discretion of the treating thoracic surgeon, treating medical oncologist, and treating radiation oncologist.","when_to_set_to_false":"Set to false if the determination is not made at the discretion of all three treating specialists.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the determination is made at the discretion of all three treating specialists.","meaning":"Boolean indicating whether the determination of the patient's ability to tolerate tri-modality therapy is made at the discretion of the treating thoracic surgeon, treating medical oncologist, and treating radiation oncologist."}  ;; "at the discretion of the treating thoracic surgeon AND treating medical oncologist AND treating radiation oncologist"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_is_able_to_tolerate_tri_modality_therapy_now@@at_discretion_of_treating_thoracic_surgeon_and_medical_oncologist_and_radiation_oncologist
         patient_is_able_to_tolerate_tri_modality_therapy_now)
     :named REQ8_AUXILIARY0)) ;; "able to tolerate tri-modality therapy at the discretion of the treating thoracic surgeon AND treating medical oncologist AND treating radiation oncologist"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Component 0: patient must be older than 18 years
(assert
  (! (> patient_age_value_recorded_now_in_years 18.0)
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "older than 18 years"

;; Component 1: patient must be able to tolerate tri-modality therapy at the discretion of all three treating specialists
(assert
  (! patient_is_able_to_tolerate_tri_modality_therapy_now@@at_discretion_of_treating_thoracic_surgeon_and_medical_oncologist_and_radiation_oncologist
     :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "able to tolerate tri-modality therapy at the discretion of the treating thoracic surgeon AND treating medical oncologist AND treating radiation oncologist"

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const tumor_is_resectable_after_assessment_by_thoracic_surgeon Bool) ;; {"when_to_set_to_true":"Set to true if the patient's tumor is determined to be resectable after assessment by the thoracic surgeon.","when_to_set_to_false":"Set to false if the patient's tumor is determined to be not resectable after assessment by the thoracic surgeon.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's tumor is resectable after assessment by the thoracic surgeon.","meaning":"Boolean indicating whether the patient's tumor is resectable after assessment by the thoracic surgeon."} ;; "the patient's tumor must be resectable (after assessment by the thoracic surgeon)"
(declare-const tumor_is_resectable_after_assessment_by_thoracic_surgeon@@after_assessment_by_thoracic_surgeon Bool) ;; {"when_to_set_to_true":"Set to true if the resectability of the patient's tumor is determined after assessment by the thoracic surgeon.","when_to_set_to_false":"Set to false if the resectability of the patient's tumor is not determined after assessment by the thoracic surgeon.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the resectability of the patient's tumor is determined after assessment by the thoracic surgeon.","meaning":"Boolean indicating whether the resectability of the patient's tumor is determined after assessment by the thoracic surgeon."} ;; "after assessment by the thoracic surgeon"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> tumor_is_resectable_after_assessment_by_thoracic_surgeon@@after_assessment_by_thoracic_surgeon
         tumor_is_resectable_after_assessment_by_thoracic_surgeon)
     :named REQ9_AUXILIARY0)) ;; "after assessment by the thoracic surgeon" implies "tumor is resectable after assessment by the thoracic surgeon"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! tumor_is_resectable_after_assessment_by_thoracic_surgeon
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient's tumor must be resectable (after assessment by the thoracic surgeon)"
