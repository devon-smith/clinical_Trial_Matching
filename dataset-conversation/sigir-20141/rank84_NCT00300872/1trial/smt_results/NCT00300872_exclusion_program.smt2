;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_problems_staying_awake_during_driving_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has problems staying awake during driving.","when_to_set_to_false":"Set to false if the patient currently does not have problems staying awake during driving.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has problems staying awake during driving.","meaning":"Boolean indicating whether the patient currently has problems staying awake during driving."} ;; "the patient has problems staying awake during driving"
(declare-const patient_has_problems_staying_awake_during_shift_work_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has problems staying awake during shift work.","when_to_set_to_false":"Set to false if the patient currently does not have problems staying awake during shift work.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has problems staying awake during shift work.","meaning":"Boolean indicating whether the patient currently has problems staying awake during shift work."} ;; "the patient has problems staying awake during shift work"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_problems_staying_awake_during_driving_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has problems staying awake during driving."

(assert
  (! (not patient_has_problems_staying_awake_during_shift_work_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has problems staying awake during shift work."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with myocardial infarction at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with myocardial infarction at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with myocardial infarction.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of myocardial infarction."} ;; "myocardial infarction"
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory@@recent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of myocardial infarction is considered recent according to study criteria.","when_to_set_to_false":"Set to false if the patient's history of myocardial infarction is not considered recent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the myocardial infarction is recent.","meaning":"Boolean indicating whether the patient's history of myocardial infarction is recent."} ;; "recent myocardial infarction"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_myocardial_infarction_inthehistory@@recent
      patient_has_diagnosis_of_myocardial_infarction_inthehistory)
:named REQ1_AUXILIARY0)) ;; "recent myocardial infarction" implies "myocardial infarction"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_myocardial_infarction_inthehistory@@recent)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a recent myocardial infarction."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_preinfarction_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of unstable angina (preinfarction syndrome).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of unstable angina (preinfarction syndrome).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has unstable angina (preinfarction syndrome).","meaning":"Boolean indicating whether the patient currently has unstable angina (preinfarction syndrome)."} ;; "unstable angina"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_preinfarction_syndrome_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has unstable angina."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a malignant neoplastic disease (malignancy).","when_to_set_to_false":"Set to false if the patient currently does not have a malignant neoplastic disease (malignancy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant neoplastic disease (malignancy).","meaning":"Boolean indicating whether the patient currently has a malignant neoplastic disease (malignancy)."} ;; "malignancy"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now@@underlying Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current malignant neoplastic disease (malignancy) is underlying (pre-existing or chronic).","when_to_set_to_false":"Set to false if the patient's current malignant neoplastic disease (malignancy) is not underlying (i.e., is secondary, acute, or not pre-existing).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current malignant neoplastic disease (malignancy) is underlying.","meaning":"Boolean indicating whether the patient's current malignant neoplastic disease (malignancy) is underlying."} ;; "underlying malignancy"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_malignant_neoplastic_disease_now@@underlying
      patient_has_finding_of_malignant_neoplastic_disease_now)
:named REQ3_AUXILIARY0)) ;; "underlying malignancy" qualifier implies malignancy

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_malignant_neoplastic_disease_now@@underlying)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an underlying malignancy."
