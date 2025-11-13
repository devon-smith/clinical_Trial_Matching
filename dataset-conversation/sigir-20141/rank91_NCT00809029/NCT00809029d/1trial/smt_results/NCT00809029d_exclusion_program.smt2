;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_heart_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with heart disease at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with heart disease at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with heart disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of heart disease in their history."} ;; "cardiac disease"
(declare-const patient_has_diagnosis_of_heart_disease_inthehistory@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of heart disease in the patient's history is classified as severe.","when_to_set_to_false":"Set to false if the diagnosis of heart disease in the patient's history is not classified as severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the heart disease diagnosis was severe.","meaning":"Boolean indicating whether the historical diagnosis of heart disease was severe."} ;; "severe cardiac disease"

(declare-const patient_has_diagnosis_of_disease_of_liver_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with liver disease at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with liver disease at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with liver disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of liver disease in their history."} ;; "hepatic disease"
(declare-const patient_has_diagnosis_of_disease_of_liver_inthehistory@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of liver disease in the patient's history is classified as severe.","when_to_set_to_false":"Set to false if the diagnosis of liver disease in the patient's history is not classified as severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the liver disease diagnosis was severe.","meaning":"Boolean indicating whether the historical diagnosis of liver disease was severe."} ;; "severe hepatic disease"

(declare-const patient_has_diagnosis_of_kidney_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with kidney disease at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with kidney disease at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with kidney disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of kidney disease in their history."} ;; "renal disease"
(declare-const patient_has_diagnosis_of_kidney_disease_inthehistory@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of kidney disease in the patient's history is classified as severe.","when_to_set_to_false":"Set to false if the diagnosis of kidney disease in the patient's history is not classified as severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the kidney disease diagnosis was severe.","meaning":"Boolean indicating whether the historical diagnosis of kidney disease was severe."} ;; "severe renal disease"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_heart_disease_inthehistory@@severe
      patient_has_diagnosis_of_heart_disease_inthehistory)
:named REQ0_AUXILIARY0)) ;; "severe cardiac disease"

(assert
(! (=> patient_has_diagnosis_of_disease_of_liver_inthehistory@@severe
      patient_has_diagnosis_of_disease_of_liver_inthehistory)
:named REQ0_AUXILIARY1)) ;; "severe hepatic disease"

(assert
(! (=> patient_has_diagnosis_of_kidney_disease_inthehistory@@severe
      patient_has_diagnosis_of_kidney_disease_inthehistory)
:named REQ0_AUXILIARY2)) ;; "severe renal disease"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_heart_disease_inthehistory@@severe)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of severe cardiac disease."

(assert
(! (not patient_has_diagnosis_of_disease_of_liver_inthehistory@@severe)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of severe hepatic disease."

(assert
(! (not patient_has_diagnosis_of_kidney_disease_inthehistory@@severe)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of severe renal disease."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_hyperthyroidism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hyperthyroidism.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hyperthyroidism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hyperthyroidism.","meaning":"Boolean indicating whether the patient currently has hyperthyroidism."} ;; "hyperthyroidism"
(declare-const patient_has_finding_of_hypothyroidism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypothyroidism.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypothyroidism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypothyroidism.","meaning":"Boolean indicating whether the patient currently has hypothyroidism."} ;; "hypothyroidism"
(declare-const patient_has_finding_of_acromegaly_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acromegaly.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acromegaly.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acromegaly.","meaning":"Boolean indicating whether the patient currently has acromegaly."} ;; "acromegaly"
(declare-const patient_has_finding_of_growth_hormone_deficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of growth hormone deficiency.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of growth hormone deficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has growth hormone deficiency.","meaning":"Boolean indicating whether the patient currently has growth hormone deficiency."} ;; "growth hormone deficiency"
(declare-const patient_has_finding_of_hypoadrenalism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypoadrenalism.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypoadrenalism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypoadrenalism.","meaning":"Boolean indicating whether the patient currently has hypoadrenalism."} ;; "hypoadrenalism"
(declare-const patient_has_finding_of_hypercortisolism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypercortisolism.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypercortisolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypercortisolism.","meaning":"Boolean indicating whether the patient currently has hypercortisolism."} ;; "cortisol overproduction"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have thyroid dysfunction (hyperthyroidism OR hypothyroidism)
(assert
(! (not (or patient_has_finding_of_hyperthyroidism_now
            patient_has_finding_of_hypothyroidism_now))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has thyroid dysfunction (hyperthyroidism OR hypothyroidism)."

;; Exclusion: patient must NOT have other endocrine disturbance (acromegaly OR growth hormone deficiency OR hypoadrenalism OR cortisol overproduction)
(assert
(! (not (or patient_has_finding_of_acromegaly_now
            patient_has_finding_of_growth_hormone_deficiency_now
            patient_has_finding_of_hypoadrenalism_now
            patient_has_finding_of_hypercortisolism_now))
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other endocrine disturbance (acromegaly OR growth hormone deficiency OR hypoadrenalism OR cortisol overproduction)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a malignant neoplastic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a malignant neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant neoplastic disease.","meaning":"Boolean indicating whether the patient currently has a malignant neoplastic disease."} ;; "current malignant disease"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_malignant_neoplastic_disease_now)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current malignant disease."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_known_alcohol_misuse Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a known history or diagnosis of alcohol misuse.","when_to_set_to_false":"Set to false if the patient does not have a known history or diagnosis of alcohol misuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a known history or diagnosis of alcohol misuse.","meaning":"Boolean indicating whether the patient has a known history or diagnosis of alcohol misuse."} ;; "The patient is excluded if the patient has known alcohol misuse."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_has_known_alcohol_misuse)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known alcohol misuse."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any mental disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of any mental disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of any mental disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of any mental disorder."} ;; "psychiatric disease"
(declare-const patient_has_diagnosis_of_mental_disorder_now@@major Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current mental disorder diagnosis is classified as major.","when_to_set_to_false":"Set to false if the patient's current mental disorder diagnosis is not classified as major.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current mental disorder diagnosis is major.","meaning":"Boolean indicating whether the patient's current mental disorder diagnosis is major."} ;; "major psychiatric disease"
(declare-const patient_is_taking_antidepressant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking antidepressant medication.","when_to_set_to_false":"Set to false if the patient is not currently taking antidepressant medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking antidepressant medication.","meaning":"Boolean indicating whether the patient is currently taking antidepressant medication."} ;; "current use of antidepressant medication"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_mental_disorder_now@@major
      patient_has_diagnosis_of_mental_disorder_now)
:named REQ4_AUXILIARY0)) ;; "major psychiatric disease"

;; Non-exhaustive example: current use of antidepressant medication implies major psychiatric disease
(assert
(! (=> patient_is_taking_antidepressant_now
      patient_has_diagnosis_of_mental_disorder_now@@major)
:named REQ4_AUXILIARY1)) ;; "including current use of antidepressant medication"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_mental_disorder_now@@major)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has major psychiatric disease (including current use of antidepressant medication)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_anorexia_nervosa_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with anorexia nervosa at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with anorexia nervosa at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with anorexia nervosa.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of anorexia nervosa in their history."} ;; "anorexia nervosa"
(declare-const patient_has_diagnosis_of_bulimia_nervosa_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with bulimia nervosa at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with bulimia nervosa at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with bulimia nervosa.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of bulimia nervosa in their history."} ;; "bulimia nervosa"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not (or patient_has_diagnosis_of_anorexia_nervosa_inthehistory
              patient_has_diagnosis_of_bulimia_nervosa_inthehistory))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of major eating disorder (anorexia nervosa OR bulimia nervosa)."
