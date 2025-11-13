;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of primary malignant neoplasm of lung (lung cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of primary malignant neoplasm of lung (lung cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of primary malignant neoplasm of lung (lung cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of primary malignant neoplasm of lung (lung cancer)."} // "lung cancer"
(declare-const patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now@@confirmed_by_histologic_confirmation Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of primary malignant neoplasm of lung (lung cancer) is confirmed by histologic confirmation.","when_to_set_to_false":"Set to false if the diagnosis is not confirmed by histologic confirmation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether histologic confirmation was performed.","meaning":"Boolean indicating whether the diagnosis of primary malignant neoplasm of lung (lung cancer) is confirmed by histologic confirmation."} // "histologic confirmation of lung cancer"

(declare-const patient_has_diagnosis_of_secondary_malignant_neoplasm_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of secondary malignant neoplasm of lung (lung metastases).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of secondary malignant neoplasm of lung (lung metastases).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of secondary malignant neoplasm of lung (lung metastases).","meaning":"Boolean indicating whether the patient currently has a diagnosis of secondary malignant neoplasm of lung (lung metastases)."} // "lung metastases"
(declare-const patient_has_diagnosis_of_secondary_malignant_neoplasm_of_lung_now@@confirmed_by_histologic_confirmation Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of secondary malignant neoplasm of lung (lung metastases) is confirmed by histologic confirmation.","when_to_set_to_false":"Set to false if the diagnosis is not confirmed by histologic confirmation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether histologic confirmation was performed.","meaning":"Boolean indicating whether the diagnosis of secondary malignant neoplasm of lung (lung metastases) is confirmed by histologic confirmation."} // "histologic confirmation of lung metastases"
(declare-const patient_has_diagnosis_of_secondary_malignant_neoplasm_of_lung_now@@originates_from_primary_site_other_than_lung Bool) ;; {"when_to_set_to_true":"Set to true if the secondary malignant neoplasm of lung (lung metastases) originates from a primary site other than lung.","when_to_set_to_false":"Set to false if the metastases originate from the lung or the primary site is not other than lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the primary site is other than lung.","meaning":"Boolean indicating whether the secondary malignant neoplasm of lung (lung metastases) originates from a primary site other than lung."} // "from a primary site other than lung"

(declare-const patient_has_diagnosis_of_mesothelioma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of mesothelioma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of mesothelioma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of mesothelioma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of mesothelioma."} // "mesothelioma"
(declare-const patient_has_diagnosis_of_mesothelioma_now@@confirmed_by_histologic_confirmation Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of mesothelioma is confirmed by histologic confirmation.","when_to_set_to_false":"Set to false if the diagnosis is not confirmed by histologic confirmation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether histologic confirmation was performed.","meaning":"Boolean indicating whether the diagnosis of mesothelioma is confirmed by histologic confirmation."} // "histologic confirmation of mesothelioma"

(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of malignant neoplastic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of malignant neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of malignant neoplastic disease.","meaning":"Boolean indicating whether the patient currently has a finding of malignant neoplastic disease."} // "malignancy"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now@@identified_as_radiographic_lesion Bool) ;; {"when_to_set_to_true":"Set to true if the finding of malignant neoplastic disease is identified as a radiographic lesion.","when_to_set_to_false":"Set to false if the finding is not identified as a radiographic lesion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the finding is identified as a radiographic lesion.","meaning":"Boolean indicating whether the finding of malignant neoplastic disease is identified as a radiographic lesion."} // "radiographic lesion"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now@@highly_suspicious Bool) ;; {"when_to_set_to_true":"Set to true if the finding of malignant neoplastic disease is highly suspicious for malignancy.","when_to_set_to_false":"Set to false if the finding is not highly suspicious for malignancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the finding is highly suspicious for malignancy.","meaning":"Boolean indicating whether the finding of malignant neoplastic disease is highly suspicious for malignancy."} // "highly suspicious for malignancy"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now@@identified_as_radiographic_lesion@@confirmed_by_histologic_confirmation@@highly_suspicious Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of malignant neoplastic disease, the finding is identified as a radiographic lesion, is highly suspicious for malignancy, and is confirmed by histologic confirmation.","when_to_set_to_false":"Set to false if any of these conditions are not met.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of malignant neoplastic disease, the finding is identified as a radiographic lesion, is highly suspicious for malignancy, and is confirmed by histologic confirmation.","meaning":"Boolean indicating whether the patient currently has a finding of malignant neoplastic disease, and this finding is identified as a radiographic lesion, is highly suspicious for malignancy, and is confirmed by histologic confirmation."} // "histologic confirmation of a radiographic lesion highly suspicious for malignancy"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now@@confirmed_by_histologic_confirmation
         patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now)
     :named REQ0_AUXILIARY0)) ;; "histologic confirmation of lung cancer"

(assert
  (! (=> patient_has_diagnosis_of_secondary_malignant_neoplasm_of_lung_now@@confirmed_by_histologic_confirmation
         patient_has_diagnosis_of_secondary_malignant_neoplasm_of_lung_now)
     :named REQ0_AUXILIARY1)) ;; "histologic confirmation of lung metastases"

(assert
  (! (=> patient_has_diagnosis_of_secondary_malignant_neoplasm_of_lung_now@@originates_from_primary_site_other_than_lung
         patient_has_diagnosis_of_secondary_malignant_neoplasm_of_lung_now)
     :named REQ0_AUXILIARY2)) ;; "lung metastases from a primary site other than lung"

(assert
  (! (=> patient_has_diagnosis_of_mesothelioma_now@@confirmed_by_histologic_confirmation
         patient_has_diagnosis_of_mesothelioma_now)
     :named REQ0_AUXILIARY3)) ;; "histologic confirmation of mesothelioma"

(assert
  (! (=> patient_has_finding_of_malignant_neoplastic_disease_now@@identified_as_radiographic_lesion
         patient_has_finding_of_malignant_neoplastic_disease_now)
     :named REQ0_AUXILIARY4)) ;; "radiographic lesion"

(assert
  (! (=> patient_has_finding_of_malignant_neoplastic_disease_now@@highly_suspicious
         patient_has_finding_of_malignant_neoplastic_disease_now)
     :named REQ0_AUXILIARY5)) ;; "highly suspicious for malignancy"

(assert
  (! (=> patient_has_finding_of_malignant_neoplastic_disease_now@@identified_as_radiographic_lesion@@confirmed_by_histologic_confirmation@@highly_suspicious
         (and patient_has_finding_of_malignant_neoplastic_disease_now@@identified_as_radiographic_lesion
              patient_has_finding_of_malignant_neoplastic_disease_now@@highly_suspicious))
     :named REQ0_AUXILIARY6)) ;; "histologic confirmation of a radiographic lesion highly suspicious for malignancy"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or
        patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now@@confirmed_by_histologic_confirmation
        (and patient_has_diagnosis_of_secondary_malignant_neoplasm_of_lung_now@@confirmed_by_histologic_confirmation
             patient_has_diagnosis_of_secondary_malignant_neoplasm_of_lung_now@@originates_from_primary_site_other_than_lung)
        patient_has_diagnosis_of_mesothelioma_now@@confirmed_by_histologic_confirmation
        patient_has_finding_of_malignant_neoplastic_disease_now@@identified_as_radiographic_lesion@@confirmed_by_histologic_confirmation@@highly_suspicious)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (histologic confirmation of lung cancer) OR (histologic confirmation of lung metastases from a primary site other than lung) OR (histologic confirmation of mesothelioma) OR (histologic confirmation of a radiographic lesion highly suspicious for malignancy)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_provided_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent.","meaning":"Boolean indicating whether the patient has provided written informed consent."} // "To be included, the patient must provide written informed consent."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_provided_written_informed_consent
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must provide written informed consent."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_will_undergo_biopsy_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to undergo a biopsy in the future.","when_to_set_to_false":"Set to false if the patient is not scheduled to undergo a biopsy in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is scheduled to undergo a biopsy in the future.","meaning":"Boolean indicating whether the patient is scheduled to undergo a biopsy in the future."} // "scheduled for a biopsy"
(declare-const patient_will_undergo_excision_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to undergo a surgical excision (resection) in the future.","when_to_set_to_false":"Set to false if the patient is not scheduled to undergo a surgical excision (resection) in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is scheduled to undergo a surgical excision (resection) in the future.","meaning":"Boolean indicating whether the patient is scheduled to undergo a surgical excision (resection) in the future."} // "scheduled for a surgical resection"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must be (scheduled for a biopsy) OR (scheduled for a surgical resection).
(assert
  (! (or patient_will_undergo_biopsy_inthefuture
         patient_will_undergo_excision_inthefuture)
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION))
