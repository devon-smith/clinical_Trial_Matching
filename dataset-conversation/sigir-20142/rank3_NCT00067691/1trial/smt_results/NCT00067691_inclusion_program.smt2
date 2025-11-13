;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_malignant_tumor_of_breast_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant tumor of the breast (breast cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant tumor of the breast (breast cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant tumor of the breast (breast cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant tumor of the breast (breast cancer)."} // "a diagnosis of local breast cancer"
(declare-const patient_has_diagnosis_of_secondary_malignant_neoplasm_of_breast_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of secondary malignant neoplasm of the breast (metastatic breast cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of secondary malignant neoplasm of the breast (metastatic breast cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of secondary malignant neoplasm of the breast (metastatic breast cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of secondary malignant neoplasm of the breast (metastatic breast cancer)."} // "a diagnosis of metastatic breast cancer"
(declare-const patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of primary malignant neoplasm of the lung (lung cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of primary malignant neoplasm of the lung (lung cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of primary malignant neoplasm of the lung (lung cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of primary malignant neoplasm of the lung (lung cancer)."} // "a diagnosis of local lung cancer"
(declare-const patient_has_diagnosis_of_secondary_malignant_neoplasm_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of secondary malignant neoplasm of the lung (metastatic lung cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of secondary malignant neoplasm of the lung (metastatic lung cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of secondary malignant neoplasm of the lung (metastatic lung cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of secondary malignant neoplasm of the lung (metastatic lung cancer)."} // "a diagnosis of metastatic lung cancer"

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must have a diagnosis of local breast cancer OR metastatic breast cancer OR local lung cancer OR metastatic lung cancer
(assert
  (! (or patient_has_diagnosis_of_malignant_tumor_of_breast_now
         patient_has_diagnosis_of_secondary_malignant_neoplasm_of_breast_now
         patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now
         patient_has_diagnosis_of_secondary_malignant_neoplasm_of_lung_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have ((a diagnosis of local breast cancer) OR (a diagnosis of metastatic breast cancer) OR (a diagnosis of local lung cancer) OR (a diagnosis of metastatic lung cancer))."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (cancer)."} // "diagnosis of cancer"
(declare-const patient_has_finding_of_dyspnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of shortness of breath (dyspnea).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of shortness of breath (dyspnea).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has shortness of breath (dyspnea).","meaning":"Boolean indicating whether the patient currently has shortness of breath (dyspnea)."} // "shortness of breath"
(declare-const patient_has_finding_of_dyspnea_now@@onset_after_diagnosis_of_cancer Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has shortness of breath (dyspnea) and the onset of this symptom occurred after the diagnosis of cancer.","when_to_set_to_false":"Set to false if the patient currently has shortness of breath (dyspnea) but the onset did not occur after the diagnosis of cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the onset of shortness of breath occurred after the diagnosis of cancer.","meaning":"Boolean indicating whether the patient currently has shortness of breath (dyspnea) and the onset of this symptom occurred after the diagnosis of cancer."} // "shortness of breath with onset after diagnosis of cancer"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_finding_of_dyspnea_now@@onset_after_diagnosis_of_cancer
         patient_has_finding_of_dyspnea_now)
     :named REQ1_AUXILIARY0)) ;; "shortness of breath with onset after diagnosis of cancer" implies "shortness of breath"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have shortness of breath with onset after diagnosis of cancer.
(assert
  (! patient_has_finding_of_dyspnea_now@@onset_after_diagnosis_of_cancer
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have shortness of breath with onset after diagnosis of cancer."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_longevity_value_recorded_now_withunit_weeks Real) ;; {"when_to_set_to_value":"Set to the estimated number of weeks if the patient's current life expectancy is documented or can be reasonably determined.","when_to_set_to_null":"Set to null if the patient's current life expectancy in weeks is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current life expectancy in weeks."} // "life expectancy ≥ 4 weeks"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= patient_longevity_value_recorded_now_withunit_weeks 4.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have life expectancy ≥ 4 weeks."
