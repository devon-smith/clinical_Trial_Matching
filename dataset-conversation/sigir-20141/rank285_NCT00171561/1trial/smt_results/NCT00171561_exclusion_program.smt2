;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_malignant_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of malignant hypertension (severe hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of malignant hypertension (severe hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has malignant hypertension (severe hypertension).","meaning":"Boolean indicating whether the patient currently has malignant hypertension (severe hypertension) now."} ;; "severe hypertension"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_malignant_hypertension_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe hypertension."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with cerebrovascular accident (stroke) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with cerebrovascular accident (stroke) at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with cerebrovascular accident (stroke).","meaning":"Boolean indicating whether the patient has ever been diagnosed with cerebrovascular accident (stroke) in their history."} ;; "the patient has a history of stroke"

(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with myocardial infarction at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with myocardial infarction at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with myocardial infarction.","meaning":"Boolean indicating whether the patient has ever been diagnosed with myocardial infarction in their history."} ;; "the patient has a history of myocardial infarction"

(declare-const patient_has_diagnosis_of_heart_failure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with heart failure at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with heart failure at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with heart failure.","meaning":"Boolean indicating whether the patient has ever been diagnosed with heart failure in their history."} ;; "the patient has a history of heart failure"

(declare-const patient_has_diagnosis_of_chest_pain_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with chest pain at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with chest pain at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with chest pain.","meaning":"Boolean indicating whether the patient has ever been diagnosed with chest pain in their history."} ;; "the patient has a history of chest pain"

(declare-const patient_has_diagnosis_of_abnormal_heart_rhythm_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with abnormal heart rhythm at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with abnormal heart rhythm at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with abnormal heart rhythm.","meaning":"Boolean indicating whether the patient has ever been diagnosed with abnormal heart rhythm in their history."} ;; "the patient has a history of abnormal heart rhythm"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (or patient_has_diagnosis_of_cerebrovascular_accident_inthehistory
            patient_has_diagnosis_of_myocardial_infarction_inthehistory
            patient_has_diagnosis_of_heart_failure_inthehistory
            patient_has_diagnosis_of_chest_pain_inthehistory
            patient_has_diagnosis_of_abnormal_heart_rhythm_inthehistory))
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a history of stroke) OR (the patient has a history of myocardial infarction) OR (the patient has a history of heart failure) OR (the patient has a history of chest pain) OR (the patient has a history of abnormal heart rhythm)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of liver disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of liver disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of liver disease.","meaning":"Boolean indicating whether the patient currently has liver disease."} ;; "liver disease"

(declare-const patient_has_finding_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of kidney disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of kidney disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of kidney disease.","meaning":"Boolean indicating whether the patient currently has kidney disease."} ;; "kidney disease"

(declare-const patient_has_finding_of_kidney_disease_now@@not_caused_by_diabetes Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has kidney disease and the kidney disease is not caused by diabetes.","when_to_set_to_false":"Set to false if the patient currently has kidney disease and the kidney disease is caused by diabetes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether diabetes is the cause of the patient's kidney disease.","meaning":"Boolean indicating whether the patient's current kidney disease is not caused by diabetes."} ;; "kidney disease is NOT caused by diabetes"

(declare-const patient_has_finding_of_disorder_of_pancreas_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pancreas disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pancreas disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pancreas disease.","meaning":"Boolean indicating whether the patient currently has pancreas disease."} ;; "pancreas disease"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_kidney_disease_now@@not_caused_by_diabetes
      patient_has_finding_of_kidney_disease_now)
   :named REQ2_AUXILIARY0)) ;; "the kidney disease is NOT caused by diabetes" implies "the patient has kidney disease"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT satisfy any of the following:
;; (1) has liver disease
;; (2) has kidney disease AND kidney disease is NOT caused by diabetes
;; (3) has pancreas disease
(assert
(! (not (or patient_has_finding_of_disease_of_liver_now
            (and patient_has_finding_of_kidney_disease_now@@not_caused_by_diabetes
                 patient_has_finding_of_kidney_disease_now)
            patient_has_finding_of_disorder_of_pancreas_now))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has liver disease) OR (the patient has kidney disease AND the kidney disease is NOT caused by diabetes) OR (the patient has pancreas disease)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_type_1_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of type 1 diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of type 1 diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of type 1 diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of type 1 diabetes mellitus."} ;; "type 1 diabetes"
(declare-const patient_has_diagnosis_of_type_ii_diabetes_mellitus_uncontrolled_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of uncontrolled type II diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of uncontrolled type II diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of uncontrolled type II diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of uncontrolled type II diabetes mellitus."} ;; "uncontrolled type 2 diabetes"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_has_diagnosis_of_type_1_diabetes_mellitus_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has type 1 diabetes."

(assert
  (! (not patient_has_diagnosis_of_type_ii_diabetes_mellitus_uncontrolled_now)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled type 2 diabetes."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_allergy_to_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of allergy to any drug.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of allergy to any drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of allergy to any drug.","meaning":"Boolean indicating whether the patient currently has an allergy to any drug."} ;; "allergy to medications"
(declare-const patient_has_finding_of_allergy_to_drug_now@@drug_used_to_treat_high_blood_pressure Bool) ;; {"when_to_set_to_true":"Set to true if the drug to which the patient is allergic is used to treat high blood pressure.","when_to_set_to_false":"Set to false if the drug to which the patient is allergic is not used to treat high blood pressure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug to which the patient is allergic is used to treat high blood pressure.","meaning":"Boolean indicating whether the drug to which the patient is allergic is used to treat high blood pressure."} ;; "allergy to medications used to treat high blood pressure"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_allergy_to_drug_now@@drug_used_to_treat_high_blood_pressure
       patient_has_finding_of_allergy_to_drug_now)
   :named REQ4_AUXILIARY0)) ;; "allergy to medications used to treat high blood pressure" implies "allergy to medications"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_allergy_to_drug_now@@drug_used_to_treat_high_blood_pressure)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an allergy to medications used to treat high blood pressure."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_meets_protocol_defined_exclusion_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient meets other protocol-defined exclusion criteria.","when_to_set_to_false":"Set to false if the patient does not meet other protocol-defined exclusion criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient meets other protocol-defined exclusion criteria.","meaning":"Boolean indicating whether the patient meets other protocol-defined exclusion criteria."} ;; "the patient meets other protocol-defined exclusion criteria"
(declare-const patient_meets_protocol_defined_inclusion_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient meets other protocol-defined inclusion criteria.","when_to_set_to_false":"Set to false if the patient does not meet other protocol-defined inclusion criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient meets other protocol-defined inclusion criteria.","meaning":"Boolean indicating whether the patient meets other protocol-defined inclusion criteria."} ;; "the patient meets other protocol-defined inclusion criteria"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_meets_protocol_defined_exclusion_criteria)
:named REQ5_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient meets other protocol-defined exclusion criteria."

(assert
(! (not patient_meets_protocol_defined_inclusion_criteria)
:named REQ5_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient meets other protocol-defined inclusion criteria."
