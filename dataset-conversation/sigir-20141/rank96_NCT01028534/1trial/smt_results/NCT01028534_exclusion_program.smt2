;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_cerebrovascular_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a cerebrovascular disease at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a cerebrovascular disease at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a cerebrovascular disease.","meaning":"Boolean indicating whether the patient has ever been diagnosed with a cerebrovascular disease at any time in their medical history."} ;; "the patient has cerebrovascular diseases"

(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a myocardial infarction at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a myocardial infarction at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a myocardial infarction.","meaning":"Boolean indicating whether the patient has ever been diagnosed with a myocardial infarction at any time in their medical history."} ;; "the patient has myocardial infarction"

(declare-const patient_has_diagnosis_of_angina_pectoris_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with angina pectoris at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with angina pectoris at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with angina pectoris.","meaning":"Boolean indicating whether the patient has ever been diagnosed with angina pectoris at any time in their medical history."} ;; "the patient has angina pectoris"

(declare-const patient_has_diagnosis_of_heart_failure_within_past_6_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been diagnosed with heart failure within the past six months.","when_to_set_to_false":"Set to false if the patient has not been diagnosed with heart failure within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been diagnosed with heart failure within the past six months.","meaning":"Boolean indicating whether the patient has been diagnosed with heart failure within the past six months."} ;; "the patient has heart failure within the past six months"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_diagnosis_of_cerebrovascular_disease_inthehistory)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cerebrovascular diseases."

(assert
  (! (not patient_has_diagnosis_of_myocardial_infarction_inthehistory)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has myocardial infarction."

(assert
  (! (not patient_has_diagnosis_of_angina_pectoris_inthehistory)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has angina pectoris."

(assert
  (! (not patient_has_diagnosis_of_heart_failure_within_past_6_months)
     :named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has heart failure within the past six months."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_cardiac_arrhythmia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cardiac arrhythmia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cardiac arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of cardiac arrhythmia.","meaning":"Boolean indicating whether the patient currently has cardiac arrhythmia."} ;; "arrhythmia"
(declare-const patient_has_finding_of_cardiac_arrhythmia_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cardiac arrhythmia and the arrhythmia is uncontrolled.","when_to_set_to_false":"Set to false if the patient currently has cardiac arrhythmia and the arrhythmia is controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cardiac arrhythmia is uncontrolled.","meaning":"Boolean indicating whether the patient's current cardiac arrhythmia is uncontrolled."} ;; "uncontrolled arrhythmia"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_cardiac_arrhythmia_now@@uncontrolled
      patient_has_finding_of_cardiac_arrhythmia_now)
:named REQ1_AUXILIARY0)) ;; "uncontrolled arrhythmia" implies "arrhythmia"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_cardiac_arrhythmia_now@@uncontrolled)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled arrhythmia."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of liver disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of liver disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of liver disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of liver disease."} ;; "hepatic disorders"
(declare-const patient_has_diagnosis_of_disease_of_liver_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of liver disease is severe.","when_to_set_to_false":"Set to false if the patient's current diagnosis of liver disease is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of liver disease is severe.","meaning":"Boolean indicating whether the patient's current diagnosis of liver disease is severe."} ;; "severe hepatic disorders"
(declare-const patient_has_diagnosis_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of kidney disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of kidney disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of kidney disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of kidney disease."} ;; "renal disorders"
(declare-const patient_has_diagnosis_of_kidney_disease_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of kidney disease is severe.","when_to_set_to_false":"Set to false if the patient's current diagnosis of kidney disease is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of kidney disease is severe.","meaning":"Boolean indicating whether the patient's current diagnosis of kidney disease is severe."} ;; "severe renal disorders"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_disease_of_liver_now@@severe
       patient_has_diagnosis_of_disease_of_liver_now)
   :named REQ2_AUXILIARY0)) ;; "severe hepatic disorders"

(assert
(! (=> patient_has_diagnosis_of_kidney_disease_now@@severe
       patient_has_diagnosis_of_kidney_disease_now)
   :named REQ2_AUXILIARY1)) ;; "severe renal disorders"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_disease_of_liver_now@@severe)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe hepatic disorders."

(assert
(! (not patient_has_diagnosis_of_kidney_disease_now@@severe)
   :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe renal disorders."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_poor_prognosis_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a poor prognosis disorder (any disorder known to confer poor prognosis, including but not limited to malignant disorders).","when_to_set_to_false":"Set to false if the patient currently does not have a poor prognosis disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a poor prognosis disorder.","meaning":"Boolean indicating whether the patient currently has a poor prognosis disorder."} ;; "poor prognosis disorders"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a malignant neoplastic disease (malignant disorder).","when_to_set_to_false":"Set to false if the patient currently does not have a malignant neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant neoplastic disease.","meaning":"Boolean indicating whether the patient currently has a malignant neoplastic disease."} ;; "malignant disorders"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> patient_has_finding_of_malignant_neoplastic_disease_now
      patient_has_finding_of_poor_prognosis_disorder_now)
   :named REQ3_AUXILIARY0)) ;; "with non-exhaustive examples (malignant disorders)."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_poor_prognosis_disorder_now)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has poor prognosis disorders with non-exhaustive examples (malignant disorders)."
