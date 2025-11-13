;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_heart_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of heart disease.","when_to_set_to_false":"Set to false if the patient does not have a documented history of heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of heart disease.","meaning":"Boolean indicating whether the patient has a history of heart disease."} ;; "the patient has a history of severe cardiac disease"
(declare-const patient_has_finding_of_heart_disease_inthehistory@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of heart disease is severe.","when_to_set_to_false":"Set to false if the patient's history of heart disease is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of heart disease is severe.","meaning":"Boolean indicating whether the patient's history of heart disease is severe."} ;; "the patient has a history of severe cardiac disease"
(declare-const patient_has_finding_of_disease_of_liver_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of liver disease.","when_to_set_to_false":"Set to false if the patient does not have a documented history of liver disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of liver disease.","meaning":"Boolean indicating whether the patient has a history of liver disease."} ;; "the patient has a history of severe hepatic disease"
(declare-const patient_has_finding_of_disease_of_liver_inthehistory@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of liver disease is severe.","when_to_set_to_false":"Set to false if the patient's history of liver disease is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of liver disease is severe.","meaning":"Boolean indicating whether the patient's history of liver disease is severe."} ;; "the patient has a history of severe hepatic disease"
(declare-const patient_has_finding_of_kidney_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of kidney disease.","when_to_set_to_false":"Set to false if the patient does not have a documented history of kidney disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of kidney disease.","meaning":"Boolean indicating whether the patient has a history of kidney disease."} ;; "the patient has a history of severe renal disease"
(declare-const patient_has_finding_of_kidney_disease_inthehistory@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of kidney disease is severe.","when_to_set_to_false":"Set to false if the patient's history of kidney disease is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of kidney disease is severe.","meaning":"Boolean indicating whether the patient's history of kidney disease is severe."} ;; "the patient has a history of severe renal disease"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_heart_disease_inthehistory@@severe
       patient_has_finding_of_heart_disease_inthehistory)
   :named REQ0_AUXILIARY0)) ;; "the patient has a history of severe cardiac disease"

(assert
(! (=> patient_has_finding_of_disease_of_liver_inthehistory@@severe
       patient_has_finding_of_disease_of_liver_inthehistory)
   :named REQ0_AUXILIARY1)) ;; "the patient has a history of severe hepatic disease"

(assert
(! (=> patient_has_finding_of_kidney_disease_inthehistory@@severe
       patient_has_finding_of_kidney_disease_inthehistory)
   :named REQ0_AUXILIARY2)) ;; "the patient has a history of severe renal disease"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_heart_disease_inthehistory@@severe)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has a history of severe cardiac disease"

(assert
(! (not patient_has_finding_of_disease_of_liver_inthehistory@@severe)
   :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has a history of severe hepatic disease"

(assert
(! (not patient_has_finding_of_kidney_disease_inthehistory@@severe)
   :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient has a history of severe renal disease"

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_thyroid_dysfunction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any form of thyroid dysfunction, including but not limited to hyperthyroidism or hypothyroidism.","when_to_set_to_false":"Set to false if the patient currently does not have any form of thyroid dysfunction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has thyroid dysfunction.","meaning":"Boolean indicating whether the patient currently has any form of thyroid dysfunction."} ;; "the patient has thyroid dysfunction"

(declare-const patient_has_finding_of_hyperthyroidism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hyperthyroidism.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hyperthyroidism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hyperthyroidism.","meaning":"Boolean indicating whether the patient currently has hyperthyroidism."} ;; "hyperthyroidism"

(declare-const patient_has_finding_of_hypothyroidism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypothyroidism.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypothyroidism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypothyroidism.","meaning":"Boolean indicating whether the patient currently has hypothyroidism."} ;; "hypothyroidism"

(declare-const patient_has_finding_of_other_endocrine_disturbance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any other endocrine disturbance, including but not limited to acromegaly, growth hormone deficiency, hypoadrenalism, or hypercortisolism.","when_to_set_to_false":"Set to false if the patient currently does not have any other endocrine disturbance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has another endocrine disturbance.","meaning":"Boolean indicating whether the patient currently has any other endocrine disturbance."} ;; "the patient has another endocrine disturbance"

(declare-const patient_has_finding_of_acromegaly_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acromegaly.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acromegaly.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acromegaly.","meaning":"Boolean indicating whether the patient currently has acromegaly."} ;; "acromegaly"

(declare-const patient_has_finding_of_growth_hormone_deficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of growth hormone deficiency.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of growth hormone deficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has growth hormone deficiency.","meaning":"Boolean indicating whether the patient currently has growth hormone deficiency."} ;; "growth hormone deficiency"

(declare-const patient_has_finding_of_hypoadrenalism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypoadrenalism.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypoadrenalism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypoadrenalism.","meaning":"Boolean indicating whether the patient currently has hypoadrenalism."} ;; "hypoadrenalism"

(declare-const patient_has_finding_of_hypercortisolism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypercortisolism.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypercortisolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypercortisolism.","meaning":"Boolean indicating whether the patient currently has hypercortisolism."} ;; "cortisol overproduction"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Exhaustive subcategories define thyroid dysfunction exactly
(assert
(! (= patient_has_finding_of_thyroid_dysfunction_now
     (or patient_has_finding_of_hyperthyroidism_now
         patient_has_finding_of_hypothyroidism_now))
:named REQ1_AUXILIARY0)) ;; "thyroid dysfunction with exhaustive subcategories (hyperthyroidism, hypothyroidism)"

;; Exhaustive subcategories define other endocrine disturbance exactly
(assert
(! (= patient_has_finding_of_other_endocrine_disturbance_now
     (or patient_has_finding_of_acromegaly_now
         patient_has_finding_of_growth_hormone_deficiency_now
         patient_has_finding_of_hypoadrenalism_now
         patient_has_finding_of_hypercortisolism_now))
:named REQ1_AUXILIARY1)) ;; "another endocrine disturbance with exhaustive subcategories (acromegaly, growth hormone deficiency, hypoadrenalism, cortisol overproduction)"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (or patient_has_finding_of_thyroid_dysfunction_now
            patient_has_finding_of_other_endocrine_disturbance_now))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has thyroid dysfunction with exhaustive subcategories (hyperthyroidism, hypothyroidism)) OR (the patient has another endocrine disturbance with exhaustive subcategories (acromegaly, growth hormone deficiency, hypoadrenalism, cortisol overproduction)))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has malignant neoplastic disease.","when_to_set_to_false":"Set to false if the patient currently does not have malignant neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has malignant neoplastic disease.","meaning":"Boolean indicating whether the patient currently has malignant neoplastic disease."} ;; "malignant disease"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_malignant_neoplastic_disease_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current malignant disease."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_alcohol_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of alcohol abuse documented in their history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of alcohol abuse documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of alcohol abuse.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of alcohol abuse in their history."} ;; "alcohol misuse"
(declare-const patient_has_diagnosis_of_alcohol_abuse_inthehistory@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of alcohol abuse in their history is documented or confirmed (known).","when_to_set_to_false":"Set to false if the patient's diagnosis of alcohol abuse in their history is not documented, not confirmed, or not known.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of alcohol abuse in the patient's history is known.","meaning":"Boolean indicating whether the patient's diagnosis of alcohol abuse in their history is known (documented or confirmed)."} ;; "known alcohol misuse"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_alcohol_abuse_inthehistory@@known
      patient_has_diagnosis_of_alcohol_abuse_inthehistory)
:named REQ3_AUXILIARY0)) ;; "known alcohol misuse"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_alcohol_abuse_inthehistory@@known)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known alcohol misuse."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any mental disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of any mental disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of any mental disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of any mental disorder."} ;; "psychiatric disease"
(declare-const patient_has_diagnosis_of_mental_disorder_now@@is_major Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a mental disorder and the disorder is major.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of a mental disorder and the disorder is not major.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the mental disorder is major.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a major mental disorder."} ;; "major psychiatric disease"
(declare-const patient_is_exposed_to_antidepressant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to (using) antidepressant medication.","when_to_set_to_false":"Set to false if the patient is currently not exposed to (not using) antidepressant medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to antidepressant medication.","meaning":"Boolean indicating whether the patient is currently exposed to antidepressant medication."} ;; "current use of antidepressant medication"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_mental_disorder_now@@is_major
      patient_has_diagnosis_of_mental_disorder_now)
   :named REQ4_AUXILIARY0)) ;; "major psychiatric disease"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient must NOT have major psychiatric disease
(assert
(! (not patient_has_diagnosis_of_mental_disorder_now@@is_major)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has major psychiatric disease."

;; Exclusion: patient must NOT have current use of antidepressant medication
(assert
(! (not patient_is_exposed_to_antidepressant_now)
   :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current use of antidepressant medication."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_anorexia_nervosa_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with anorexia nervosa at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with anorexia nervosa at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with anorexia nervosa.","meaning":"Boolean indicating whether the patient has a history of anorexia nervosa."} ;; "anorexia nervosa"
(declare-const patient_has_diagnosis_of_bulimia_nervosa_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with bulimia nervosa at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with bulimia nervosa at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with bulimia nervosa.","meaning":"Boolean indicating whether the patient has a history of bulimia nervosa."} ;; "bulimia nervosa"
(declare-const patient_has_history_of_major_eating_disorder Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with any major eating disorder (including but not limited to anorexia nervosa and bulimia nervosa) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with any major eating disorder at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with any major eating disorder.","meaning":"Boolean indicating whether the patient has a history of any major eating disorder, including but not limited to anorexia nervosa and bulimia nervosa."} ;; "major eating disorder (anorexia nervosa or bulimia nervosa)"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Exhaustive subcategories define the umbrella exactly:
(assert
(! (= patient_has_history_of_major_eating_disorder
      (or patient_has_diagnosis_of_anorexia_nervosa_inthehistory
          patient_has_diagnosis_of_bulimia_nervosa_inthehistory))
   :named REQ5_AUXILIARY0)) ;; "with exhaustive subcategories (anorexia nervosa, bulimia nervosa)"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_history_of_major_eating_disorder)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a history of major eating disorder with exhaustive subcategories (anorexia nervosa, bulimia nervosa))."
