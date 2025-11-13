;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_primary_squamous_cell_carcinoma_of_hypopharynx_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of primary squamous cell carcinoma of the hypopharynx.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of primary squamous cell carcinoma of the hypopharynx.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has primary squamous cell carcinoma of the hypopharynx.","meaning":"Boolean indicating whether the patient currently has primary squamous cell carcinoma of the hypopharynx."}  ;; "squamous cell carcinoma of the hypopharynx"
(declare-const patient_has_finding_of_primary_squamous_cell_carcinoma_of_hypopharynx_now@@histologically_confirmed Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of primary squamous cell carcinoma of the hypopharynx is histologically confirmed.","when_to_set_to_false":"Set to false if the diagnosis of primary squamous cell carcinoma of the hypopharynx is not histologically confirmed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is histologically confirmed.","meaning":"Boolean indicating whether the diagnosis of primary squamous cell carcinoma of the hypopharynx is histologically confirmed."}  ;; "histologically confirmed (squamous cell carcinoma of the hypopharynx)"

(declare-const patient_has_finding_of_squamous_cell_carcinoma_of_larynx_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of squamous cell carcinoma of the larynx.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of squamous cell carcinoma of the larynx.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has squamous cell carcinoma of the larynx.","meaning":"Boolean indicating whether the patient currently has squamous cell carcinoma of the larynx."}  ;; "squamous cell carcinoma of the larynx"
(declare-const patient_has_finding_of_squamous_cell_carcinoma_of_larynx_now@@histologically_confirmed Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of squamous cell carcinoma of the larynx is histologically confirmed.","when_to_set_to_false":"Set to false if the diagnosis of squamous cell carcinoma of the larynx is not histologically confirmed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is histologically confirmed.","meaning":"Boolean indicating whether the diagnosis of squamous cell carcinoma of the larynx is histologically confirmed."}  ;; "histologically confirmed (squamous cell carcinoma of the larynx)"

(declare-const patient_has_finding_of_squamous_cell_carcinoma_of_mouth_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of squamous cell carcinoma of the oral cavity.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of squamous cell carcinoma of the oral cavity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has squamous cell carcinoma of the oral cavity.","meaning":"Boolean indicating whether the patient currently has squamous cell carcinoma of the oral cavity."}  ;; "squamous cell carcinoma of the oral cavity"
(declare-const patient_has_finding_of_squamous_cell_carcinoma_of_mouth_now@@histologically_confirmed Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of squamous cell carcinoma of the oral cavity is histologically confirmed.","when_to_set_to_false":"Set to false if the diagnosis of squamous cell carcinoma of the oral cavity is not histologically confirmed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is histologically confirmed.","meaning":"Boolean indicating whether the diagnosis of squamous cell carcinoma of the oral cavity is histologically confirmed."}  ;; "histologically confirmed (squamous cell carcinoma of the oral cavity)"

(declare-const patient_has_finding_of_squamous_cell_carcinoma_of_oropharynx_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of squamous cell carcinoma of the oropharynx.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of squamous cell carcinoma of the oropharynx.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has squamous cell carcinoma of the oropharynx.","meaning":"Boolean indicating whether the patient currently has squamous cell carcinoma of the oropharynx."}  ;; "squamous cell carcinoma of the oropharynx"
(declare-const patient_has_finding_of_squamous_cell_carcinoma_of_oropharynx_now@@histologically_confirmed Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of squamous cell carcinoma of the oropharynx is histologically confirmed.","when_to_set_to_false":"Set to false if the diagnosis of squamous cell carcinoma of the oropharynx is not histologically confirmed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is histologically confirmed.","meaning":"Boolean indicating whether the diagnosis of squamous cell carcinoma of the oropharynx is histologically confirmed."}  ;; "histologically confirmed (squamous cell carcinoma of the oropharynx)"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_primary_squamous_cell_carcinoma_of_hypopharynx_now@@histologically_confirmed
         patient_has_finding_of_primary_squamous_cell_carcinoma_of_hypopharynx_now)
     :named REQ0_AUXILIARY0)) ;; If histologically confirmed, must have the diagnosis (hypopharynx)

(assert
  (! (=> patient_has_finding_of_squamous_cell_carcinoma_of_larynx_now@@histologically_confirmed
         patient_has_finding_of_squamous_cell_carcinoma_of_larynx_now)
     :named REQ0_AUXILIARY1)) ;; If histologically confirmed, must have the diagnosis (larynx)

(assert
  (! (=> patient_has_finding_of_squamous_cell_carcinoma_of_mouth_now@@histologically_confirmed
         patient_has_finding_of_squamous_cell_carcinoma_of_mouth_now)
     :named REQ0_AUXILIARY2)) ;; If histologically confirmed, must have the diagnosis (oral cavity)

(assert
  (! (=> patient_has_finding_of_squamous_cell_carcinoma_of_oropharynx_now@@histologically_confirmed
         patient_has_finding_of_squamous_cell_carcinoma_of_oropharynx_now)
     :named REQ0_AUXILIARY3)) ;; If histologically confirmed, must have the diagnosis (oropharynx)

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must have at least one of the four histologically confirmed squamous cell carcinomas
(assert
  (! (or patient_has_finding_of_squamous_cell_carcinoma_of_mouth_now@@histologically_confirmed
         patient_has_finding_of_squamous_cell_carcinoma_of_oropharynx_now@@histologically_confirmed
         patient_has_finding_of_squamous_cell_carcinoma_of_larynx_now@@histologically_confirmed
         patient_has_finding_of_primary_squamous_cell_carcinoma_of_hypopharynx_now@@histologically_confirmed)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have histologically confirmed (squamous cell carcinoma of the oral cavity OR squamous cell carcinoma of the oropharynx OR squamous cell carcinoma of the larynx OR squamous cell carcinoma of the hypopharynx)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_squamous_cell_carcinoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of squamous cell carcinoma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of squamous cell carcinoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of squamous cell carcinoma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of squamous cell carcinoma."}  ;; "squamous cell carcinoma"
(declare-const patient_has_diagnosis_of_squamous_cell_carcinoma_now@@diagnosed_by_histologic_diagnosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of squamous cell carcinoma is established by histologic diagnosis.","when_to_set_to_false":"Set to false if the patient's diagnosis of squamous cell carcinoma is not established by histologic diagnosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of squamous cell carcinoma is established by histologic diagnosis.","meaning":"Boolean indicating whether the patient's diagnosis of squamous cell carcinoma is established by histologic diagnosis."}  ;; "diagnosed by histologic diagnosis (squamous cell carcinoma)"
(declare-const patient_has_histologic_diagnosis_other_than_squamous_cell_carcinoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a histologic diagnosis of a malignancy that is not squamous cell carcinoma.","when_to_set_to_false":"Set to false if the patient currently does not have a histologic diagnosis of a malignancy other than squamous cell carcinoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a histologic diagnosis of a malignancy other than squamous cell carcinoma.","meaning":"Boolean indicating whether the patient currently has a histologic diagnosis of a malignancy other than squamous cell carcinoma."}  ;; "histologic diagnosis other than squamous cell carcinoma"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_squamous_cell_carcinoma_now@@diagnosed_by_histologic_diagnosis
         patient_has_diagnosis_of_squamous_cell_carcinoma_now)
     :named REQ1_AUXILIARY0)) ;; "diagnosed by histologic diagnosis (squamous cell carcinoma)" implies "squamous cell carcinoma"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must NOT have a histologic diagnosis other than squamous cell carcinoma.
(assert
  (! (not patient_has_histologic_diagnosis_other_than_squamous_cell_carcinoma_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must NOT have a histologic diagnosis other than squamous cell carcinoma"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patients_primary_tumor_site_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's primary tumor site is identified (i.e., the anatomical origin of the tumor is known and specified) at the current time.","when_to_set_to_false":"Set to false if the patient's primary tumor site is not identified (i.e., the anatomical origin of the tumor is unknown or unspecified) at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's primary tumor site is identified at the current time.","meaning":"Boolean indicating whether the patient's primary tumor site is identified (not unknown or unspecified) now."} ;; "the patient must have a primary site identified."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patients_primary_tumor_site_is_positive_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have a primary site identified."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_clinical_stage_4_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has stage IV disease.","when_to_set_to_false":"Set to false if the patient currently does not have stage IV disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has stage IV disease.","meaning":"Boolean indicating whether the patient currently has stage IV disease."} ;; "stage IV disease"
(declare-const patient_has_finding_of_clinical_stage_4_now@@locoregionally_confined Bool) ;; {"when_to_set_to_true":"Set to true if the patient's stage IV disease is locoregionally confined.","when_to_set_to_false":"Set to false if the patient's stage IV disease is not locoregionally confined.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's stage IV disease is locoregionally confined.","meaning":"Boolean indicating whether the patient's stage IV disease is locoregionally confined."} ;; "locoregionally confined stage IV disease"
(declare-const patient_has_finding_of_clinical_stage_iii_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has stage III disease.","when_to_set_to_false":"Set to false if the patient currently does not have stage III disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has stage III disease.","meaning":"Boolean indicating whether the patient currently has stage III disease."} ;; "stage III disease"
(declare-const patient_has_finding_of_clinical_stage_iii_now@@locoregionally_confined Bool) ;; {"when_to_set_to_true":"Set to true if the patient's stage III disease is locoregionally confined.","when_to_set_to_false":"Set to false if the patient's stage III disease is not locoregionally confined.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's stage III disease is locoregionally confined.","meaning":"Boolean indicating whether the patient's stage III disease is locoregionally confined."} ;; "locoregionally confined stage III disease"
(declare-const patient_has_finding_of_clinical_stage_iii_now@@excludes_t1n1_or_t2n1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient's stage III disease excludes T1N1 or T2N1.","when_to_set_to_false":"Set to false if the patient's stage III disease does not exclude T1N1 or T2N1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's stage III disease excludes T1N1 or T2N1.","meaning":"Boolean indicating whether the patient's stage III disease excludes T1N1 or T2N1."} ;; "excluding T1N1 or T2N1 (stage III disease)"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_clinical_stage_4_now@@locoregionally_confined
         patient_has_finding_of_clinical_stage_4_now)
     :named REQ3_AUXILIARY0)) ;; "locoregionally confined stage IV disease" implies "stage IV disease"

(assert
  (! (=> patient_has_finding_of_clinical_stage_iii_now@@locoregionally_confined
         patient_has_finding_of_clinical_stage_iii_now)
     :named REQ3_AUXILIARY1)) ;; "locoregionally confined stage III disease" implies "stage III disease"

(assert
  (! (=> patient_has_finding_of_clinical_stage_iii_now@@excludes_t1n1_or_t2n1
         patient_has_finding_of_clinical_stage_iii_now)
     :named REQ3_AUXILIARY2)) ;; "stage III disease excludes T1N1 or T2N1" implies "stage III disease"

;; Locoregionally confined stage III disease (excluding T1N1 or T2N1) is defined as all three qualifiers being true
(define-fun patient_has_finding_of_locoregionally_confined_stage_iii_disease_excluding_t1n1_or_t2n1_now () Bool
  (and patient_has_finding_of_clinical_stage_iii_now
       patient_has_finding_of_clinical_stage_iii_now@@locoregionally_confined
       patient_has_finding_of_clinical_stage_iii_now@@excludes_t1n1_or_t2n1)) ;; "locoregionally confined stage III disease (excluding T1N1 or T2N1)"

;; Locoregionally confined stage IV disease is defined as both qualifiers being true
(define-fun patient_has_finding_of_locoregionally_confined_stage_iv_disease_now () Bool
  (and patient_has_finding_of_clinical_stage_4_now
       patient_has_finding_of_clinical_stage_4_now@@locoregionally_confined)) ;; "locoregionally confined stage IV disease"

;; ===================== Constraint Assertions (REQ 3) =====================
;; To be included, the patient must have (locoregionally confined stage III disease (excluding T1N1 or T2N1)) OR (locoregionally confined stage IV disease)
(assert
  (! (or patient_has_finding_of_locoregionally_confined_stage_iii_disease_excluding_t1n1_or_t2n1_now
         patient_has_finding_of_locoregionally_confined_stage_iv_disease_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (locoregionally confined stage III disease (excluding T1N1 or T2N1)) OR (locoregionally confined stage IV disease)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_distant_hematogenous_metastases_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has distant hematogenous metastases.","when_to_set_to_false":"Set to false if the patient currently does not have distant hematogenous metastases.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has distant hematogenous metastases.","meaning":"Boolean indicating whether the patient currently has distant hematogenous metastases."} ;; "distant hematogenous metastases (M0 = no evidence of distant hematogenous metastases)"
(declare-const patient_has_finding_of_infraclavicular_lymphadenopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of infraclavicular lymphadenopathy (nodal disease below the clavicles).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of infraclavicular lymphadenopathy (nodal disease below the clavicles).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has infraclavicular lymphadenopathy (nodal disease below the clavicles).","meaning":"Boolean indicating whether the patient currently has infraclavicular lymphadenopathy (nodal disease below the clavicles)."} ;; "nodal disease below the clavicles"

;; ===================== Constraint Assertions (REQ 4) =====================
;; To be included, the patient must have (no evidence of nodal disease below the clavicles) OR (no evidence of distant hematogenous metastases (M0)).
(assert
  (! (or (not patient_has_finding_of_infraclavicular_lymphadenopathy_now)
         (not patient_has_finding_of_distant_hematogenous_metastases_now))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (no evidence of nodal disease below the clavicles) OR (no evidence of distant hematogenous metastases (M0))."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_stage_ivc_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has stage IVC disease.","when_to_set_to_false":"Set to false if the patient currently does not have stage IVC disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has stage IVC disease.","meaning":"Boolean indicating whether the patient currently has stage IVC disease."}  ;; "stage IVC disease"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: To be included, the patient must NOT have stage IVC disease.
(assert
  (! (not patient_has_finding_of_stage_ivc_disease_now)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have stage IVC disease."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_is_deemed_appropriate_for_definitive_non_operative_management_with_curative_intent Bool) ;; {"when_to_set_to_true":"Set to true if the patient is deemed appropriate for definitive non-operative management and the management is performed with curative intent.","when_to_set_to_false":"Set to false if the patient is deemed not appropriate for definitive non-operative management with curative intent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is deemed appropriate for definitive non-operative management with curative intent.","meaning":"Boolean indicating whether the patient is deemed appropriate for definitive non-operative management with curative intent."}  ;; "the patient must be deemed appropriate for definitive non-operative management with curative intent."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_is_deemed_appropriate_for_definitive_non_operative_management_with_curative_intent
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be deemed appropriate for definitive non-operative management with curative intent."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_finding_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of disease.","meaning":"Boolean indicating whether the patient currently has disease."}  ;; "disease"
(declare-const patient_has_finding_of_resectable_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has resectable disease.","when_to_set_to_false":"Set to false if the patient currently does not have resectable disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has resectable disease.","meaning":"Boolean indicating whether the patient currently has resectable disease."}  ;; "resectable disease"

;; ===================== Constraint Assertions (REQ 7) =====================
;; The patient is not required to have resectable disease.
(assert
  (! true
     :named REQ7_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient is not required to have resectable disease."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_has_diagnosis_of_primary_carcinoma_of_accessory_sinus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of primary carcinoma of accessory sinus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of primary carcinoma of accessory sinus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of primary carcinoma of accessory sinus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of primary carcinoma of accessory sinus."} ;; "primary cancer of the paranasal sinus"
(declare-const patient_has_diagnosis_of_primary_carcinoma_of_salivary_gland_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of primary carcinoma of the salivary gland.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of primary carcinoma of the salivary gland.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of primary carcinoma of the salivary gland.","meaning":"Boolean indicating whether the patient currently has a diagnosis of primary carcinoma of the salivary gland."} ;; "primary cancer of the salivary gland"
(declare-const patient_has_diagnosis_of_primary_malignant_neoplasm_of_nasopharynx_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of primary malignant neoplasm of nasopharynx.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of primary malignant neoplasm of nasopharynx.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of primary malignant neoplasm of nasopharynx.","meaning":"Boolean indicating whether the patient currently has a diagnosis of primary malignant neoplasm of nasopharynx."} ;; "primary cancer of the nasopharynx"

;; ===================== Constraint Assertions (REQ 8) =====================
;; To be included, the patient must NOT have (primary cancer of the nasopharynx OR primary cancer of the paranasal sinus OR primary cancer of the salivary gland).
(assert
  (! (not (or patient_has_diagnosis_of_primary_malignant_neoplasm_of_nasopharynx_now
              patient_has_diagnosis_of_primary_carcinoma_of_accessory_sinus_now
              patient_has_diagnosis_of_primary_carcinoma_of_salivary_gland_now))
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have (primary cancer of the nasopharynx OR primary cancer of the paranasal sinus OR primary cancer of the salivary gland)."

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const ecog_performance_status_value_recorded_now_withunit_none Int) ;; {"when_to_set_to_value":"Set to the integer value of the patient's current ECOG performance status as recorded now (e.g., 0, 1, 2, etc.).","when_to_set_to_null":"Set to null if the patient's current ECOG performance status is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current ECOG performance status (no unit)."}  ;; "Eastern Cooperative Oncology Group (ECOG) performance status"

;; ===================== Constraint Assertions (REQ 9) =====================
;; The patient must have ECOG performance status of 0 OR ECOG performance status of 1
(assert
  (! (or (= ecog_performance_status_value_recorded_now_withunit_none 0)
         (= ecog_performance_status_value_recorded_now_withunit_none 1))
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (Eastern Cooperative Oncology Group (ECOG) performance status of 0 OR Eastern Cooperative Oncology Group (ECOG) performance status of 1)."

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_white_blood_cell_count_value_recorded_now_withunit_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current white blood cell count per cubic millimeter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current white blood cell count per cubic millimeter."}  ;; "white blood cell count"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
  (! (> patient_white_blood_cell_count_value_recorded_now_withunit_per_cubic_millimeter 3500.0)
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a white blood cell count > 3,500 per cubic millimeter."

;; ===================== Declarations for the criterion (REQ 11) =====================
(declare-const patient_platelet_count_finding_value_recorded_now_withunit_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's platelet count is recorded now in number per cubic millimeter.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current platelet count measured in number per cubic millimeter."}  ;; "platelet count > 100,000 per cubic millimeter"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! (> patient_platelet_count_finding_value_recorded_now_withunit_per_cubic_millimeter 100000.0)
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a platelet count > 100,000 per cubic millimeter."

;; ===================== Declarations for the criterion (REQ 12) =====================
(declare-const patient_serum_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current serum creatinine concentration in milligrams per deciliter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current serum creatinine concentration in milligrams per deciliter."}  ;; "serum creatinine concentration"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
  (! (< patient_serum_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter 2.0)
     :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a serum creatinine concentration < 2.0 milligrams per deciliter."

;; ===================== Declarations for the criterion (REQ 13) =====================
(declare-const patient_alkaline_phosphatase_level_finding_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's alkaline phosphatase concentration is recorded now and the value is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current alkaline phosphatase concentration."}  ;; "alkaline phosphatase concentration"

(declare-const patient_alkaline_phosphatase_upper_limit_of_normal_value_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the reference value for the upper limit of normal for alkaline phosphatase concentration, as defined by the laboratory reference range.","when_to_set_to_null":"Set to null if the reference value is unavailable or indeterminate.","meaning":"Numeric value representing the upper limit of normal for alkaline phosphatase concentration."}  ;; "upper limit of normal (alkaline phosphatase concentration)"

;; ===================== Constraint Assertions (REQ 13) =====================
;; Component 0: To be included, the patient must have an alkaline phosphatase concentration < 2 × the upper limit of normal.
(assert
  (! (< patient_alkaline_phosphatase_level_finding_value_recorded_now_withunit_unit
        (* 2.0 patient_alkaline_phosphatase_upper_limit_of_normal_value_withunit_unit))
     :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "alkaline phosphatase concentration < 2 × the upper limit of normal"

;; ===================== Declarations for the criterion (REQ 14) =====================
(declare-const patient_aspartate_transaminase_level_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's aspartate aminotransferase concentration is recorded now with a known unit.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current aspartate aminotransferase concentration."}  ;; "aspartate aminotransferase concentration"
(declare-const patient_aspartate_transaminase_upper_limit_of_normal_value_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the reference value for the upper limit of normal for aspartate aminotransferase concentration, as defined by the laboratory reference range.","when_to_set_to_null":"Set to null if the reference value is unavailable or indeterminate.","meaning":"Numeric value representing the upper limit of normal for aspartate aminotransferase concentration."}  ;; "upper limit of normal (aspartate aminotransferase concentration)"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
  (! (< patient_aspartate_transaminase_level_value_recorded_now_withunit_unit
        (* 2.0 patient_aspartate_transaminase_upper_limit_of_normal_value_withunit_unit))
     :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have an aspartate aminotransferase concentration < 2 × the upper limit of normal."

;; ===================== Declarations for the criterion (REQ 15) =====================
(declare-const patient_bilirubin_level_finding_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current bilirubin concentration in milligrams per deciliter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current bilirubin concentration in milligrams per deciliter."}  ;; "bilirubin concentration"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
  (! (<= patient_bilirubin_level_finding_value_recorded_now_withunit_milligrams_per_deciliter 2.0)
     :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a bilirubin concentration ≤ 2.0 milligrams per deciliter."

;; ===================== Declarations for the criterion (REQ 16) =====================
(declare-const patient_calcium_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's current serum calcium concentration (in mg/dL) is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current serum calcium concentration in milligrams per deciliter."}  ;; "serum calcium concentration"

(declare-const patient_has_normal_serum_calcium_concentration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current serum calcium concentration is within the normal reference range as defined by the laboratory.","when_to_set_to_false":"Set to false if the patient's current serum calcium concentration is outside the normal reference range as defined by the laboratory.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current serum calcium concentration is normal.","meaning":"Boolean indicating whether the patient currently has a normal serum calcium concentration."}  ;; "normal serum calcium concentration"

(declare-const patient_serum_calcium_lower_limit_of_normal_value_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the reference value for the lower limit of normal for serum calcium concentration, as defined by the laboratory reference range.","when_to_set_to_null":"Set to null if the reference value is unavailable or indeterminate.","meaning":"Numeric value representing the lower limit of normal for serum calcium concentration."}  ;; "lower limit of normal (serum calcium concentration)"

(declare-const patient_serum_calcium_upper_limit_of_normal_value_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the reference value for the upper limit of normal for serum calcium concentration, as defined by the laboratory reference range.","when_to_set_to_null":"Set to null if the reference value is unavailable or indeterminate.","meaning":"Numeric value representing the upper limit of normal for serum calcium concentration."}  ;; "upper limit of normal (serum calcium concentration)"

;; ===================== Auxiliary Assertions (REQ 16) =====================
;; Definition in the requirement: normal serum calcium concentration
(assert
  (! (= patient_has_normal_serum_calcium_concentration_now
        (and (>= patient_calcium_value_recorded_now_withunit_milligrams_per_deciliter patient_serum_calcium_lower_limit_of_normal_value_withunit_milligrams_per_deciliter)
             (<= patient_calcium_value_recorded_now_withunit_milligrams_per_deciliter patient_serum_calcium_upper_limit_of_normal_value_withunit_milligrams_per_deciliter)))
     :named REQ16_AUXILIARY0)) ;; "To be included, the patient must have a normal serum calcium concentration."

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
  (! patient_has_normal_serum_calcium_concentration_now
     :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a normal serum calcium concentration."

;; ===================== Declarations for the criterion (REQ 17) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."}  ;; "must not be pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."}  ;; "must not be nursing"

;; ===================== Constraint Assertions (REQ 17) =====================
;; Component 0: To be included, the patient must not be pregnant or must not be nursing.
(assert
  (! (or (not patient_is_pregnant_now)
         (not patient_is_breastfeeding_now))
     :named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must not be pregnant or must not be nursing."

;; ===================== Declarations for the criterion (REQ 18) =====================
(declare-const pregnancy_test_result_value_recorded_now_withunit_binary Int) ;; {"when_to_set_to_value":"Set to 0 if the most recent pregnancy test result for the patient is negative, set to 1 if positive.","when_to_set_to_null":"Set to null if the pregnancy test result is unknown, not documented, or cannot be determined.","meaning":"Numeric variable representing the result of the most recent pregnancy test for the patient, with 0 for negative and 1 for positive."}  ;; "must have a negative pregnancy test"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
  (! (= pregnancy_test_result_value_recorded_now_withunit_binary 0)
     :named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a negative pregnancy test."

;; ===================== Declarations for the criterion (REQ 19) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to become pregnant (has childbearing potential/fertile).","when_to_set_to_false":"Set to false if the patient is currently not able to become pregnant (no childbearing potential/infertile).","when_to_set_to_null":"Set to null if the patient's childbearing potential/fertility status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has the potential to bear children (i.e., is fertile)."} ;; "if the patient is fertile"
(declare-const patient_has_finding_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using any form of contraception.","when_to_set_to_false":"Set to false if the patient is currently not using any form of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using contraception.","meaning":"Boolean indicating whether the patient is currently using contraception."} ;; "contraception"
(declare-const patient_has_finding_of_contraception_now@@effective Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using contraception and the contraception is effective.","when_to_set_to_false":"Set to false if the patient is currently using contraception but the contraception is not effective.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the contraception used by the patient is effective.","meaning":"Boolean indicating whether the contraception currently used by the patient is effective."} ;; "effective contraception"

;; ===================== Auxiliary Assertions (REQ 19) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_contraception_now@@effective
         patient_has_finding_of_contraception_now)
     :named REQ19_AUXILIARY0)) ;; "contraception" and "effective contraception"

;; ===================== Constraint Assertions (REQ 19) =====================
;; If the patient is fertile, the patient must use effective contraception.
(assert
  (! (or (not patient_has_childbearing_potential_now)
         patient_has_finding_of_contraception_now@@effective)
     :named REQ19_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is fertile, the patient must use effective contraception."

;; ===================== Declarations for the criterion (REQ 20) =====================
(declare-const patient_has_finding_of_preinfarction_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of unstable angina (preinfarction syndrome).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of unstable angina (preinfarction syndrome).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has unstable angina (preinfarction syndrome).","meaning":"Boolean indicating whether the patient currently has unstable angina (preinfarction syndrome)."} ;; "unstable angina"
(declare-const patient_has_finding_of_angina_control_poor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of uncontrolled angina (poorly controlled angina).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of uncontrolled angina (poorly controlled angina).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has uncontrolled angina (poorly controlled angina).","meaning":"Boolean indicating whether the patient currently has uncontrolled angina (poorly controlled angina)."} ;; "uncontrolled angina"

;; ===================== Constraint Assertions (REQ 20) =====================
;; Component 0: To be included, the patient must not have unstable angina or must not have uncontrolled angina.
(assert
  (! (or (not patient_has_finding_of_preinfarction_syndrome_now)
         (not patient_has_finding_of_angina_control_poor_now))
     :named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must not have unstable angina or must not have uncontrolled angina."

;; ===================== Declarations for the criterion (REQ 21) =====================
(declare-const patient_has_finding_of_jaundice_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of jaundice.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of jaundice.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of jaundice.","meaning":"Boolean indicating whether the patient currently has jaundice."}  ;; "jaundice"
(declare-const patient_has_finding_of_jaundice_now@@clinically_apparent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current jaundice is clinically apparent.","when_to_set_to_false":"Set to false if the patient's current jaundice is not clinically apparent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current jaundice is clinically apparent.","meaning":"Boolean indicating whether the patient's current jaundice is clinically apparent."}  ;; "clinically apparent jaundice"

;; ===================== Auxiliary Assertions (REQ 21) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_jaundice_now@@clinically_apparent
         patient_has_finding_of_jaundice_now)
     :named REQ21_AUXILIARY0)) ;; If the patient has clinically apparent jaundice, then the patient has jaundice. ("clinically apparent jaundice")

;; ===================== Constraint Assertions (REQ 21) =====================
;; Component 0: To be included, the patient must NOT have clinically apparent jaundice.
(assert
  (! (not patient_has_finding_of_jaundice_now@@clinically_apparent)
     :named REQ21_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must NOT have clinically apparent jaundice."

;; ===================== Declarations for the criterion (REQ 22) =====================
(declare-const patient_has_finding_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection (infection).","when_to_set_to_false":"Set to false if the patient currently does not have a disorder due to infection (infection).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder due to infection (infection).","meaning":"Boolean indicating whether the patient currently has a disorder due to infection (infection) now."} ;; "infection"
(declare-const patient_has_finding_of_disorder_due_to_infection_now@@active_status Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection (infection) and the infection is active.","when_to_set_to_false":"Set to false if the patient currently has a disorder due to infection (infection) but the infection is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is active.","meaning":"Boolean indicating whether the patient's current infection is active."} ;; "active infection"

;; ===================== Auxiliary Assertions (REQ 22) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_disorder_due_to_infection_now@@active_status
         patient_has_finding_of_disorder_due_to_infection_now)
     :named REQ22_AUXILIARY0)) ;; "active infection" implies "infection"

;; ===================== Constraint Assertions (REQ 22) =====================
;; Component 0: To be included, the patient must NOT have active infection.
(assert
  (! (not patient_has_finding_of_disorder_due_to_infection_now@@active_status)
     :named REQ22_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have active infection."

;; ===================== Declarations for the criterion (REQ 23) =====================
(declare-const patient_has_diagnosis_of_squamous_cell_carcinoma_of_skin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of squamous cell carcinoma of the skin at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of squamous cell carcinoma of the skin at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of squamous cell carcinoma of the skin.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of squamous cell carcinoma of the skin in their history."} ;; "squamous cell skin cancer"
(declare-const patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of basal cell carcinoma of the skin at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of basal cell carcinoma of the skin at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of basal cell carcinoma of the skin.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of basal cell carcinoma of the skin in their history."} ;; "basal cell skin cancer"
(declare-const patient_has_diagnosis_of_carcinoma_in_situ_of_uterine_cervix_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of carcinoma in situ of the uterine cervix at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of carcinoma in situ of the uterine cervix at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of carcinoma in situ of the uterine cervix.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of carcinoma in situ of the uterine cervix in their history."} ;; "cervical carcinoma in situ"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of malignant neoplastic disease at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of malignant neoplastic disease at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of malignant neoplastic disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of malignant neoplastic disease in their history."} ;; "malignancy"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@excluding_squamous_cell_skin_cancer_basal_cell_skin_cancer_carcinoma_in_situ_of_uterine_cervix Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of malignant neoplastic disease excludes squamous cell skin cancer, basal cell skin cancer, and cervical carcinoma in situ.","when_to_set_to_false":"Set to false if the diagnosis includes any of the excluded conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis excludes the specified conditions.","meaning":"Boolean indicating whether the diagnosis of malignant neoplastic disease excludes squamous cell skin cancer, basal cell skin cancer, and cervical carcinoma in situ."} ;; "any other malignancy EXCEPT (squamous cell skin cancer OR basal cell skin cancer OR cervical carcinoma in situ)"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@disease_free_for_at_least_5_years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been continuously disease-free for at least five years since the diagnosis of malignant neoplastic disease.","when_to_set_to_false":"Set to false if the patient has not been disease-free for at least five years since the diagnosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been disease-free for at least five years since the diagnosis.","meaning":"Boolean indicating whether the patient has been continuously disease-free for at least five years since the diagnosis of malignant neoplastic disease."} ;; "disease-free for at least five years"

;; ===================== Auxiliary Assertions (REQ 23) =====================
;; Definition: The qualifier variable implies the stem variable
(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@excluding_squamous_cell_skin_cancer_basal_cell_skin_cancer_carcinoma_in_situ_of_uterine_cervix
         patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory)
     :named REQ23_AUXILIARY0)) ;; "any other malignancy EXCEPT (squamous cell skin cancer OR basal cell skin cancer OR cervical carcinoma in situ)"

;; Definition: The qualifier variable implies the stem variable
(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@disease_free_for_at_least_5_years
         patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory)
     :named REQ23_AUXILIARY1)) ;; "disease-free for at least five years"

;; ===================== Constraint Assertions (REQ 23) =====================
;; Component 0: To be included, the patient must ((have no history of any other malignancy EXCEPT (squamous cell skin cancer OR basal cell skin cancer OR cervical carcinoma in situ)) OR (if the patient has a history of any other malignancy, the patient must have been continuously disease-free for at least five years)).
(assert
  (! (or
        (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@excluding_squamous_cell_skin_cancer_basal_cell_skin_cancer_carcinoma_in_situ_of_uterine_cervix)
        patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@disease_free_for_at_least_5_years)
     :named REQ23_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((have no history of any other malignancy EXCEPT (squamous cell skin cancer OR basal cell skin cancer OR cervical carcinoma in situ)) OR (if the patient has a history of any other malignancy, the patient must have been continuously disease-free for at least five years))."

;; ===================== Declarations for the criterion (REQ 24) =====================
(declare-const patient_has_finding_of_at_risk_for_noncompliance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered at risk for noncompliance (poor compliance risk).","when_to_set_to_false":"Set to false if the patient is currently not considered at risk for noncompliance (not a poor compliance risk).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently at risk for noncompliance.","meaning":"Boolean indicating whether the patient is currently at risk for noncompliance (poor compliance risk)."} ;; "poor compliance risk"

;; ===================== Constraint Assertions (REQ 24) =====================
(assert
  (! (not patient_has_finding_of_at_risk_for_noncompliance_now)
     :named REQ24_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT be a poor compliance risk."
