;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_cystic_fibrosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cystic fibrosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cystic fibrosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cystic fibrosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cystic fibrosis."} // "diagnosis of cystic fibrosis"
(declare-const patient_has_finding_of_sweat_test_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an abnormal (positive) sweat test result.","when_to_set_to_false":"Set to false if the patient currently does not have an abnormal (positive) sweat test result.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an abnormal (positive) sweat test result.","meaning":"Boolean indicating whether the patient currently has an abnormal (positive) sweat test result."} // "a positive sweat test"
(declare-const patient_has_two_disease_causing_mutations_in_cystic_fibrosis_transmembrane_conductance_regulator_gene_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has two disease-causing mutations present in the CFTR gene.","when_to_set_to_false":"Set to false if the patient currently does not have two disease-causing mutations present in the CFTR gene.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has two disease-causing mutations present in the CFTR gene.","meaning":"Boolean indicating whether the patient currently has two disease-causing mutations present in the CFTR gene."} // "the presence of two disease causing mutations in the cystic fibrosis transmembrane conductance regulator gene"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition in the requirement: diagnosis of cystic fibrosis is defined as (a positive sweat test) OR (the presence of two disease causing mutations in the CFTR gene)
(assert
  (! (= patient_has_diagnosis_of_cystic_fibrosis_now
        (or patient_has_finding_of_sweat_test_abnormal_now
            patient_has_two_disease_causing_mutations_in_cystic_fibrosis_transmembrane_conductance_regulator_gene_now))
     :named REQ0_AUXILIARY0)) ;; "diagnosis of cystic fibrosis is defined as (a positive sweat test) OR (the presence of two disease causing mutations in the cystic fibrosis transmembrane conductance regulator gene)"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must have a diagnosis of cystic fibrosis
(assert
  (! patient_has_diagnosis_of_cystic_fibrosis_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a diagnosis of cystic fibrosis"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "older than 18 years (age > 18 years)"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be older than 18 years (age > 18 years)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of chest pain.","meaning":"Boolean indicating whether the patient currently has chest pain."} // "chest pain"
(declare-const patient_has_finding_of_chest_pain_now@@chronic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current chest pain is chronic.","when_to_set_to_false":"Set to false if the patient's current chest pain is not chronic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current chest pain is chronic.","meaning":"Boolean indicating whether the patient's current chest pain is chronic."} // "chronic chest pain"
(declare-const patient_has_finding_of_chronic_back_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chronic back pain.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chronic back pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of chronic back pain.","meaning":"Boolean indicating whether the patient currently has chronic back pain."} // "chronic back pain"
(declare-const patient_has_finding_of_chronic_neck_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chronic neck pain.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chronic neck pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of chronic neck pain.","meaning":"Boolean indicating whether the patient currently has chronic neck pain."} // "chronic neck pain"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for chronic chest pain implies chest pain
(assert
  (! (=> patient_has_finding_of_chest_pain_now@@chronic
         patient_has_finding_of_chest_pain_now)
     :named REQ2_AUXILIARY0)) ;; "chronic chest pain" implies "chest pain"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have (chronic chest pain OR chronic neck pain OR chronic back pain).
(assert
  (! (or patient_has_finding_of_chest_pain_now@@chronic
         patient_has_finding_of_chronic_neck_pain_now
         patient_has_finding_of_chronic_back_pain_now)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (chronic chest pain OR chronic neck pain OR chronic back pain)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_provided_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent.","meaning":"Boolean indicating whether the patient has provided written informed consent."} // "the patient must provide written informed consent"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_provided_written_informed_consent
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must provide written informed consent"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_health_insurance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has health insurance.","when_to_set_to_false":"Set to false if the patient currently does not have health insurance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has health insurance.","meaning":"Boolean indicating whether the patient currently has health insurance."} // "the patient must have health insurance"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_health_insurance_now
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have health insurance."
