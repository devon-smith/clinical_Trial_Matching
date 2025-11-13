;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_bilateral_renal_artery_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bilateral renal artery stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bilateral renal artery stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bilateral renal artery stenosis.","meaning":"Boolean indicating whether the patient currently has bilateral renal artery stenosis."} ;; "bilateral renal artery stenosis"
(declare-const patient_has_finding_of_renal_artery_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal artery stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal artery stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal artery stenosis.","meaning":"Boolean indicating whether the patient currently has renal artery stenosis."} ;; "renal artery stenosis"
(declare-const patient_has_finding_of_renal_artery_stenosis_now@@unilateral Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has renal artery stenosis and the stenosis is unilateral.","when_to_set_to_false":"Set to false if the patient currently has renal artery stenosis and the stenosis is not unilateral (i.e., bilateral or unspecified).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the renal artery stenosis is unilateral.","meaning":"Boolean indicating whether the patient's renal artery stenosis is unilateral."} ;; "unilateral renal artery stenosis"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_renal_artery_stenosis_now@@unilateral
      patient_has_finding_of_renal_artery_stenosis_now)
:named REQ0_AUXILIARY0)) ;; "unilateral renal artery stenosis" implies "renal artery stenosis"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (or patient_has_finding_of_renal_artery_stenosis_now@@unilateral
            patient_has_finding_of_bilateral_renal_artery_stenosis_now))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has unilateral renal artery stenosis) OR (the patient has bilateral renal artery stenosis)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_conduction_disorder_of_the_heart_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a conduction disorder of the heart (cardiac dysrhythmias), regardless of clinical significance.","when_to_set_to_false":"Set to false if the patient currently does not have a conduction disorder of the heart (cardiac dysrhythmias).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a conduction disorder of the heart (cardiac dysrhythmias).","meaning":"Boolean indicating whether the patient currently has a conduction disorder of the heart (cardiac dysrhythmias)."} ;; "cardiac dysrhythmias"
(declare-const patient_has_finding_of_conduction_disorder_of_the_heart_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a conduction disorder of the heart (cardiac dysrhythmias) and the dysrhythmia is clinically significant.","when_to_set_to_false":"Set to false if the patient currently has a conduction disorder of the heart (cardiac dysrhythmias) but it is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the conduction disorder of the heart (cardiac dysrhythmias) is clinically significant.","meaning":"Boolean indicating whether the patient's current conduction disorder of the heart (cardiac dysrhythmias) is clinically significant."} ;; "clinically significant cardiac dysrhythmias"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the corresponding stem variable
(assert
(! (=> patient_has_finding_of_conduction_disorder_of_the_heart_now@@clinically_significant
       patient_has_finding_of_conduction_disorder_of_the_heart_now)
   :named REQ1_AUXILIARY0)) ;; "clinically significant cardiac dysrhythmias" qualifier implies cardiac dysrhythmias

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_conduction_disorder_of_the_heart_now@@clinically_significant)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically significant cardiac dysrhythmias."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_coronary_arteriosclerosis_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a clinical finding of coronary arteriosclerosis (coronary artery disease) within the past six months.","when_to_set_to_false":"Set to false if the patient has not had a clinical finding of coronary arteriosclerosis (coronary artery disease) within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had coronary arteriosclerosis within the past six months.","meaning":"Boolean indicating whether the patient has had coronary arteriosclerosis (coronary artery disease) within the past six months."} ;; "coronary artery disease within the past six months"
(declare-const patient_has_finding_of_coronary_arteriosclerosis_inthepast6months@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the coronary artery disease within the past six months is considered significant in severity or impact.","when_to_set_to_false":"Set to false if the coronary artery disease within the past six months is not considered significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the coronary artery disease within the past six months is significant.","meaning":"Boolean indicating whether the coronary artery disease within the past six months is significant."} ;; "significant history of coronary artery disease within the past six months"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_coronary_arteriosclerosis_inthepast6months@@significant
      patient_has_finding_of_coronary_arteriosclerosis_inthepast6months)
:named REQ2_AUXILIARY0)) ;; "significant history of coronary artery disease within the past six months"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_coronary_arteriosclerosis_inthepast6months@@significant)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a significant history of coronary artery disease within the past six months."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_congestive_heart_failure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding or diagnosis of congestive heart failure at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding or diagnosis of congestive heart failure at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had congestive heart failure.","meaning":"Boolean indicating whether the patient has ever had congestive heart failure in their medical history."} ;; "has a history of congestive heart failure"
(declare-const patient_has_finding_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of congestive heart failure (CHF).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of congestive heart failure (CHF).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of congestive heart failure (CHF).","meaning":"Boolean indicating whether the patient currently has a diagnosis of congestive heart failure (CHF)."} ;; "diagnosis of congestive heart failure (CHF)"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_congestive_heart_failure_inthehistory)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of congestive heart failure."

(assert
(! (not patient_has_finding_of_congestive_heart_failure_now)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of congestive heart failure (CHF)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_heart_valve_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any heart valve disorder.","when_to_set_to_false":"Set to false if the patient currently does not have any heart valve disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any heart valve disorder.","meaning":"Boolean indicating whether the patient currently has any heart valve disorder."} ;; "cardiac valvular disease"
(declare-const patient_has_finding_of_heart_valve_disorder_now@@clinically_relevant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current heart valve disorder is clinically relevant.","when_to_set_to_false":"Set to false if the patient's current heart valve disorder is not clinically relevant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current heart valve disorder is clinically relevant.","meaning":"Boolean indicating whether the patient's current heart valve disorder is clinically relevant."} ;; "clinically relevant cardiac valvular disease"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_heart_valve_disorder_now@@clinically_relevant
      patient_has_finding_of_heart_valve_disorder_now)
:named REQ4_AUXILIARY0)) ;; "clinically relevant cardiac valvular disease""

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_heart_valve_disorder_now@@clinically_relevant)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any clinically relevant cardiac valvular disease."
