;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_hypertensive_encephalopathy_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had hypertensive encephalopathy within the past six months.","when_to_set_to_false":"Set to false if the patient has not had hypertensive encephalopathy within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had hypertensive encephalopathy within the past six months.","meaning":"Boolean indicating whether the patient has had hypertensive encephalopathy within the past six months."} ;; "the patient has had hypertensive encephalopathy within the past six months"

(declare-const patient_has_finding_of_cerebrovascular_accident_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had stroke (cerebrovascular accident) within the past six months.","when_to_set_to_false":"Set to false if the patient has not had stroke (cerebrovascular accident) within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had stroke (cerebrovascular accident) within the past six months.","meaning":"Boolean indicating whether the patient has had stroke (cerebrovascular accident) within the past six months."} ;; "the patient has had stroke within the past six months"

(declare-const patient_has_finding_of_transient_cerebral_ischemia_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had transient ischemic attack within the past six months.","when_to_set_to_false":"Set to false if the patient has not had transient ischemic attack within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had transient ischemic attack within the past six months.","meaning":"Boolean indicating whether the patient has had transient ischemic attack within the past six months."} ;; "the patient has had transient ischemic attack within the past six months"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_hypertensive_encephalopathy_inthepast6months)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had hypertensive encephalopathy within the past six months."

(assert
(! (not patient_has_finding_of_cerebrovascular_accident_inthepast6months)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had stroke within the past six months."

(assert
(! (not patient_has_finding_of_transient_cerebral_ischemia_inthepast6months)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had transient ischemic attack within the past six months."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of myocardial infarction that occurred within the past six months.","when_to_set_to_false":"Set to false if the patient does not have a documented diagnosis of myocardial infarction within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had a myocardial infarction within the past six months.","meaning":"Boolean indicating whether the patient has a diagnosis of myocardial infarction within the past six months."} ;; "the patient has a history of myocardial infarction within the past six months"
(declare-const patient_has_undergone_percutaneous_transluminal_coronary_revascularization_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone percutaneous transluminal coronary revascularization within the past six months.","when_to_set_to_false":"Set to false if the patient has not undergone percutaneous transluminal coronary revascularization within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone percutaneous transluminal coronary revascularization within the past six months.","meaning":"Boolean indicating whether the patient has undergone percutaneous transluminal coronary revascularization within the past six months."} ;; "the patient has a history of percutaneous transluminal coronary revascularization within the past six months"
(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone coronary artery bypass graft within the past six months.","when_to_set_to_false":"Set to false if the patient has not undergone coronary artery bypass graft within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone coronary artery bypass graft within the past six months.","meaning":"Boolean indicating whether the patient has undergone coronary artery bypass graft within the past six months."} ;; "the patient has a history of coronary artery bypass graft within the past six months"
(declare-const patient_has_diagnosis_of_preinfarction_syndrome_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of unstable angina pectoris (preinfarction syndrome) that occurred within the past six months.","when_to_set_to_false":"Set to false if the patient does not have a documented diagnosis of unstable angina pectoris within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had unstable angina pectoris within the past six months.","meaning":"Boolean indicating whether the patient has a diagnosis of unstable angina pectoris (preinfarction syndrome) within the past six months."} ;; "the patient has a history of unstable angina pectoris within the past six months"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_myocardial_infarction_inthepast6months)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of myocardial infarction within the past six months."

(assert
(! (not patient_has_undergone_percutaneous_transluminal_coronary_revascularization_inthepast6months)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of percutaneous transluminal coronary revascularization within the past six months."

(assert
(! (not patient_has_undergone_coronary_artery_bypass_graft_inthepast6months)
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of coronary artery bypass graft within the past six months."

(assert
(! (not patient_has_diagnosis_of_preinfarction_syndrome_inthepast6months)
:named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of unstable angina pectoris within the past six months."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_type_1_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of type 1 diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of type 1 diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of type 1 diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of type 1 diabetes mellitus."} ;; "type 1 diabetes mellitus"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_type_1_diabetes_mellitus_now)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has type 1 diabetes mellitus."
