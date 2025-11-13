;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_heart_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of heart disease.","when_to_set_to_false":"Set to false if the patient does not have a documented history of heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of heart disease.","meaning":"Boolean indicating whether the patient has a history of heart disease."} ;; "history of severe cardiac disease"
(declare-const patient_has_finding_of_heart_disease_inthehistory@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of heart disease is severe.","when_to_set_to_false":"Set to false if the patient's history of heart disease is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of heart disease is severe.","meaning":"Boolean indicating whether the patient's history of heart disease is severe."} ;; "history of severe cardiac disease"
(declare-const patient_has_finding_of_disease_of_liver_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of liver disease.","when_to_set_to_false":"Set to false if the patient does not have a documented history of liver disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of liver disease.","meaning":"Boolean indicating whether the patient has a history of liver disease."} ;; "history of severe hepatic disease"
(declare-const patient_has_finding_of_disease_of_liver_inthehistory@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of liver disease is severe.","when_to_set_to_false":"Set to false if the patient's history of liver disease is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of liver disease is severe.","meaning":"Boolean indicating whether the patient's history of liver disease is severe."} ;; "history of severe hepatic disease"
(declare-const patient_has_finding_of_kidney_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of kidney disease.","when_to_set_to_false":"Set to false if the patient does not have a documented history of kidney disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of kidney disease.","meaning":"Boolean indicating whether the patient has a history of kidney disease."} ;; "history of severe renal disease"
(declare-const patient_has_finding_of_kidney_disease_inthehistory@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of kidney disease is severe.","when_to_set_to_false":"Set to false if the patient's history of kidney disease is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of kidney disease is severe.","meaning":"Boolean indicating whether the patient's history of kidney disease is severe."} ;; "history of severe renal disease"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_heart_disease_inthehistory@@severe
       patient_has_finding_of_heart_disease_inthehistory)
   :named REQ0_AUXILIARY0)) ;; "history of severe cardiac disease"

(assert
(! (=> patient_has_finding_of_disease_of_liver_inthehistory@@severe
       patient_has_finding_of_disease_of_liver_inthehistory)
   :named REQ0_AUXILIARY1)) ;; "history of severe hepatic disease"

(assert
(! (=> patient_has_finding_of_kidney_disease_inthehistory@@severe
       patient_has_finding_of_kidney_disease_inthehistory)
   :named REQ0_AUXILIARY2)) ;; "history of severe renal disease"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_heart_disease_inthehistory@@severe)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of severe cardiac disease."

(assert
(! (not patient_has_finding_of_disease_of_liver_inthehistory@@severe)
   :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of severe hepatic disease."

(assert
(! (not patient_has_finding_of_kidney_disease_inthehistory@@severe)
   :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of severe renal disease."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_thyroid_dysfunction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of thyroid dysfunction (including any subcategory such as hyperthyroidism or hypothyroidism).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of thyroid dysfunction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has thyroid dysfunction.","meaning":"Boolean indicating whether the patient currently has thyroid dysfunction."} ;; "thyroid dysfunction"
(declare-const patient_has_finding_of_hyperthyroidism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hyperthyroidism.","when_to_set_to_false":"Set to false if the patient currently does not have hyperthyroidism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hyperthyroidism.","meaning":"Boolean indicating whether the patient currently has hyperthyroidism."} ;; "hyperthyroidism"
(declare-const patient_has_finding_of_hypothyroidism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypothyroidism.","when_to_set_to_false":"Set to false if the patient currently does not have hypothyroidism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypothyroidism.","meaning":"Boolean indicating whether the patient currently has hypothyroidism."} ;; "hypothyroidism"
(declare-const patient_has_finding_of_disorder_of_endocrine_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of a disorder of the endocrine system (including any subcategory such as acromegaly, growth hormone deficiency, hypoadrenalism, or cortisol overproduction).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of a disorder of the endocrine system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the endocrine system.","meaning":"Boolean indicating whether the patient currently has a disorder of the endocrine system."} ;; "endocrine disturbance"
(declare-const patient_has_finding_of_acromegaly_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acromegaly.","when_to_set_to_false":"Set to false if the patient currently does not have acromegaly.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acromegaly.","meaning":"Boolean indicating whether the patient currently has acromegaly."} ;; "acromegaly"
(declare-const patient_has_finding_of_growth_hormone_deficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has growth hormone deficiency.","when_to_set_to_false":"Set to false if the patient currently does not have growth hormone deficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has growth hormone deficiency.","meaning":"Boolean indicating whether the patient currently has growth hormone deficiency."} ;; "growth hormone deficiency"
(declare-const patient_has_finding_of_hypoadrenalism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypoadrenalism.","when_to_set_to_false":"Set to false if the patient currently does not have hypoadrenalism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypoadrenalism.","meaning":"Boolean indicating whether the patient currently has hypoadrenalism."} ;; "hypoadrenalism"
(declare-const patient_has_finding_of_cortisol_overproduction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cortisol overproduction.","when_to_set_to_false":"Set to false if the patient currently does not have cortisol overproduction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cortisol overproduction.","meaning":"Boolean indicating whether the patient currently has cortisol overproduction."} ;; "cortisol overproduction"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Exhaustive subcategories define thyroid dysfunction exactly
(assert
(! (= patient_has_finding_of_thyroid_dysfunction_now
      (or patient_has_finding_of_hyperthyroidism_now
          patient_has_finding_of_hypothyroidism_now))
   :named REQ1_AUXILIARY0)) ;; "thyroid dysfunction with exhaustive subcategories (hyperthyroidism, hypothyroidism)"

;; Exhaustive subcategories define other endocrine disturbance exactly
(assert
(! (= patient_has_finding_of_disorder_of_endocrine_system_now
      (or patient_has_finding_of_acromegaly_now
          patient_has_finding_of_growth_hormone_deficiency_now
          patient_has_finding_of_hypoadrenalism_now
          patient_has_finding_of_cortisol_overproduction_now))
   :named REQ1_AUXILIARY1)) ;; "other endocrine disturbance with exhaustive subcategories (acromegaly, growth hormone deficiency, hypoadrenalism, cortisol overproduction)"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (or patient_has_finding_of_thyroid_dysfunction_now
            patient_has_finding_of_disorder_of_endocrine_system_now))
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has thyroid dysfunction with exhaustive subcategories (hyperthyroidism, hypothyroidism)) OR (the patient has other endocrine disturbance with exhaustive subcategories (acromegaly, growth hormone deficiency, hypoadrenalism, cortisol overproduction)))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has malignant neoplastic disease.","when_to_set_to_false":"Set to false if the patient currently does not have malignant neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has malignant neoplastic disease.","meaning":"Boolean indicating whether the patient currently has malignant neoplastic disease."} ;; "malignant disease"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_malignant_neoplastic_disease_now)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current malignant disease."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_exposed_to_alcohol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to alcohol.","when_to_set_to_false":"Set to false if the patient is currently not exposed to alcohol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to alcohol.","meaning":"Boolean indicating whether the patient is currently exposed to alcohol."} ;; "alcohol"
(declare-const patient_is_exposed_to_alcohol_now@@misuse Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to alcohol constitutes misuse.","when_to_set_to_false":"Set to false if the patient's current exposure to alcohol does not constitute misuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current exposure to alcohol constitutes misuse.","meaning":"Boolean indicating whether the patient's current exposure to alcohol constitutes misuse."} ;; "alcohol misuse"
(declare-const patient_is_exposed_to_alcohol_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's alcohol misuse is known (documented or recognized).","when_to_set_to_false":"Set to false if the patient's alcohol misuse is not known (not documented or not recognized).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's alcohol misuse is known.","meaning":"Boolean indicating whether the patient's alcohol misuse is known (documented or recognized)."} ;; "known alcohol misuse"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_exposed_to_alcohol_now@@misuse
      patient_is_exposed_to_alcohol_now)
:named REQ3_AUXILIARY0)) ;; "alcohol misuse"

;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_exposed_to_alcohol_now@@known
      patient_is_exposed_to_alcohol_now)
:named REQ3_AUXILIARY1)) ;; "known alcohol misuse"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT have known alcohol misuse
(assert
(! (not (and patient_is_exposed_to_alcohol_now@@misuse
             patient_is_exposed_to_alcohol_now@@known))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known alcohol misuse."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any mental disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of any mental disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of any mental disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of any mental disorder."} ;; "psychiatric disease"
(declare-const patient_has_diagnosis_of_mental_disorder_now@@major_severity Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a mental disorder and the disorder is of major severity.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of a mental disorder but the disorder is not of major severity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the mental disorder is of major severity.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a mental disorder of major severity."} ;; "major psychiatric disease"
(declare-const patient_is_taking_antidepressant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking antidepressant medication.","when_to_set_to_false":"Set to false if the patient is not currently taking antidepressant medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking antidepressant medication.","meaning":"Boolean indicating whether the patient is currently taking antidepressant medication."} ;; "current use of antidepressant medication"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_mental_disorder_now@@major_severity
      patient_has_diagnosis_of_mental_disorder_now)
:named REQ4_AUXILIARY0)) ;; "major psychiatric disease"

;; Non-exhaustive example: current use of antidepressant medication is included as an example of major psychiatric disease
(assert
(! (=> patient_is_taking_antidepressant_now
      patient_has_diagnosis_of_mental_disorder_now@@major_severity)
:named REQ4_AUXILIARY1)) ;; "including current use of antidepressant medication"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_mental_disorder_now@@major_severity)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has major psychiatric disease, including current use of antidepressant medication."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_eating_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with an eating disorder (including major subcategories such as anorexia nervosa or bulimia nervosa) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with an eating disorder at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with an eating disorder.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of eating disorder in their medical history."} ;; "eating disorder"
(declare-const patient_has_diagnosis_of_anorexia_nervosa_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with anorexia nervosa at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with anorexia nervosa at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with anorexia nervosa.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of anorexia nervosa in their medical history."} ;; "anorexia nervosa"
(declare-const patient_has_diagnosis_of_bulimia_nervosa_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with bulimia nervosa at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with bulimia nervosa at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with bulimia nervosa.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of bulimia nervosa in their medical history."} ;; "bulimia nervosa"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Exhaustive subcategories define the umbrella exactly:
(assert
(! (= patient_has_diagnosis_of_eating_disorder_inthehistory
     (or patient_has_diagnosis_of_anorexia_nervosa_inthehistory
         patient_has_diagnosis_of_bulimia_nervosa_inthehistory))
:named REQ5_AUXILIARY0)) ;; "major eating disorder with exhaustive subcategories (anorexia nervosa, bulimia nervosa)"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_diagnosis_of_eating_disorder_inthehistory)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of major eating disorder with exhaustive subcategories (anorexia nervosa, bulimia nervosa)."
