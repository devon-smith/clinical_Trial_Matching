;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_secondary_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of secondary hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of secondary hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of secondary hypertension.","meaning":"Boolean indicating whether the patient currently has secondary hypertension."} ;; "secondary hypertension"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_secondary_hypertension_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has secondary hypertension."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_atrial_fibrillation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of atrial fibrillation.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of atrial fibrillation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of atrial fibrillation.","meaning":"Boolean indicating whether the patient currently has a diagnosis of atrial fibrillation."} ;; "atrial fibrillation"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_atrial_fibrillation_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has atrial fibrillation."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_history_of_cerebral_disorder_other_than_cerebrovascular_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of any cerebral disorder except cerebrovascular disease.","when_to_set_to_false":"Set to false if the patient does not have a documented history of any cerebral disorder except cerebrovascular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of any cerebral disorder other than cerebrovascular disease.","meaning":"Boolean indicating whether the patient has a history of any cerebral disorder other than cerebrovascular disease."} ;; "the patient has a history of cerebral disorder other than cerebrovascular disease"
(declare-const patient_has_signs_of_cerebral_disorder_other_than_cerebrovascular_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has signs of any cerebral disorder except cerebrovascular disease.","when_to_set_to_false":"Set to false if the patient currently does not have signs of any cerebral disorder except cerebrovascular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has signs of any cerebral disorder other than cerebrovascular disease.","meaning":"Boolean indicating whether the patient currently has signs of any cerebral disorder other than cerebrovascular disease."} ;; "the patient has signs of cerebral disorder other than cerebrovascular disease"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_history_of_cerebral_disorder_other_than_cerebrovascular_disease)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of cerebral disorder other than cerebrovascular disease."

(assert
(! (not patient_has_signs_of_cerebral_disorder_other_than_cerebrovascular_disease_now)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has signs of cerebral disorder other than cerebrovascular disease."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a malignant neoplastic disease (malignant tumor).","when_to_set_to_false":"Set to false if the patient currently does not have a malignant neoplastic disease (malignant tumor).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant neoplastic disease (malignant tumor).","meaning":"Boolean indicating whether the patient currently has a malignant neoplastic disease (malignant tumor)."} ;; "malignant tumor"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_has_finding_of_malignant_neoplastic_disease_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has malignant tumor."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_chronic_renal_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chronic renal failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chronic renal failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of chronic renal failure.","meaning":"Boolean indicating whether the patient currently has chronic renal failure."} ;; "chronic renal failure"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_has_finding_of_chronic_renal_failure_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic renal failure."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of congestive heart failure.","meaning":"Boolean indicating whether the patient currently has congestive heart failure."} ;; "congestive heart failure"
(declare-const patient_has_finding_of_congestive_heart_failure_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current congestive heart failure is severe.","when_to_set_to_false":"Set to false if the patient's current congestive heart failure is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current congestive heart failure is severe.","meaning":"Boolean indicating whether the patient's current congestive heart failure is severe."} ;; "severe congestive heart failure"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_congestive_heart_failure_now@@severe
       patient_has_finding_of_congestive_heart_failure_now)
   :named REQ5_AUXILIARY0)) ;; "severe congestive heart failure""

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_congestive_heart_failure_now@@severe)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe congestive heart failure."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_hyperkalemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hyperkalemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hyperkalemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hyperkalemia.","meaning":"Boolean indicating whether the patient currently has hyperkalemia."} ;; "hyperkalemia"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_hyperkalemia_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hyperkalemia."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_bilateral_renal_artery_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has stenosis of both renal arteries (bilateral renal artery stenosis).","when_to_set_to_false":"Set to false if the patient currently does not have stenosis of both renal arteries.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has stenosis of both renal arteries.","meaning":"Boolean indicating whether the patient currently has stenosis of both renal arteries (bilateral renal artery stenosis)."} ;; "stenosis of bilateral renal artery"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not patient_has_finding_of_bilateral_renal_artery_stenosis_now)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has stenosis of bilateral renal artery."
