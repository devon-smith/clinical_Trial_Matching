;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_primary_malignant_neoplasm_of_esophagus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of primary malignant neoplasm of the esophagus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of primary malignant neoplasm of the esophagus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of primary malignant neoplasm of the esophagus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of primary malignant neoplasm of the esophagus."}  // "primary cancer of the esophagus"
(declare-const patient_has_diagnosis_of_primary_malignant_neoplasm_of_esophagus_now@@histologically_confirmed Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of primary malignant neoplasm of the esophagus is histologically confirmed.","when_to_set_to_false":"Set to false if the diagnosis of primary malignant neoplasm of the esophagus is not histologically confirmed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is histologically confirmed.","meaning":"Boolean indicating whether the diagnosis of primary malignant neoplasm of the esophagus is histologically confirmed."}  // "histologically confirmed primary cancer of the esophagus"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_primary_malignant_neoplasm_of_esophagus_now@@histologically_confirmed
         patient_has_diagnosis_of_primary_malignant_neoplasm_of_esophagus_now)
     :named REQ0_AUXILIARY0)) ;; "histologically confirmed primary cancer of the esophagus" (qualifier implies stem)

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_primary_malignant_neoplasm_of_esophagus_now@@histologically_confirmed
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have histologically confirmed primary cancer of the esophagus."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_dysphagia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dysphagia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dysphagia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of dysphagia.","meaning":"Boolean indicating whether the patient currently has dysphagia."} // "dysphagia"
(declare-const patient_has_finding_of_dysphagia_now@@caused_by_primary_malignant_neoplasm_of_esophagus Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dysphagia is caused by cancer of the esophagus.","when_to_set_to_false":"Set to false if the patient's dysphagia is not caused by cancer of the esophagus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dysphagia is caused by cancer of the esophagus.","meaning":"Boolean indicating whether the patient's dysphagia is caused by cancer of the esophagus."} // "dysphagia caused by cancer of the esophagus"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_dysphagia_now@@caused_by_primary_malignant_neoplasm_of_esophagus
         patient_has_finding_of_dysphagia_now)
     :named REQ1_AUXILIARY0)) ;; "dysphagia caused by cancer of the esophagus" means dysphagia present

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have dysphagia caused by cancer of the esophagus.
(assert
  (! patient_has_finding_of_dysphagia_now@@caused_by_primary_malignant_neoplasm_of_esophagus
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have dysphagia caused by cancer of the esophagus."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_esophageal_fistula_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of esophageal fistula.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of esophageal fistula.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of esophageal fistula.","meaning":"Boolean indicating whether the patient currently has esophageal fistula."} // "esophageal fistula"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_has_finding_of_esophageal_fistula_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have esophageal fistula."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_hospital_patient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently admitted as an inpatient (hospital patient) at the present time.","when_to_set_to_false":"Set to false if the patient is currently not admitted as an inpatient (hospital patient) at the present time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an inpatient.","meaning":"Boolean indicating whether the patient is currently an inpatient (hospital patient) at the present time."} // "To be included, the patient must be an inpatient."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_finding_of_hospital_patient_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be an inpatient."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_life_expectancy_value_recorded_in_months Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the patient's life expectancy in months if documented or estimated.","when_to_set_to_null":"Set to null if the patient's life expectancy in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's life expectancy in months."} // "the patient must have a life expectancy of over 6 months."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (> patient_life_expectancy_value_recorded_in_months 6.0)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have a life expectancy of over 6 months."
