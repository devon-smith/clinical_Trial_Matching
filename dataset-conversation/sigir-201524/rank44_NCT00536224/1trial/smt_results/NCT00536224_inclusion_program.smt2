;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a finding of diabetes mellitus."}  ;; "diabetes mellitus"
(declare-const patient_has_finding_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of hypertensive disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of hypertensive disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of hypertensive disorder.","meaning":"Boolean indicating whether the patient currently has a finding of hypertensive disorder."}  ;; "hypertension"
(declare-const patient_has_finding_of_obesity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of obesity.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of obesity.","meaning":"Boolean indicating whether the patient currently has a finding of obesity."}  ;; "obesity"
(declare-const patient_has_finding_of_tobacco_smoking_behavior_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of tobacco smoking behavior.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of tobacco smoking behavior.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of tobacco smoking behavior.","meaning":"Boolean indicating whether the patient currently has a finding of tobacco smoking behavior."}  ;; "smoking"
(declare-const patients_risk_factor_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any risk factor.","when_to_set_to_false":"Set to false if the patient currently does not have any risk factor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any risk factor.","meaning":"Boolean indicating whether the patient currently has any risk factor."}  ;; "risk factor"
(declare-const patients_risk_factor_is_positive_now@@modifiable Bool) ;; {"when_to_set_to_true":"Set to true if the risk factor present in the patient is modifiable.","when_to_set_to_false":"Set to false if the risk factor present in the patient is not modifiable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the risk factor present in the patient is modifiable.","meaning":"Boolean indicating whether the risk factor present in the patient is modifiable."}  ;; "modifiable"
(declare-const patients_risk_factor_is_positive_now@@cardiovascular Bool) ;; {"when_to_set_to_true":"Set to true if the risk factor present in the patient is cardiovascular.","when_to_set_to_false":"Set to false if the risk factor present in the patient is not cardiovascular.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the risk factor present in the patient is cardiovascular.","meaning":"Boolean indicating whether the risk factor present in the patient is cardiovascular."}  ;; "cardiovascular"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply the stem variable
(assert
  (! (=> patients_risk_factor_is_positive_now@@modifiable
         patients_risk_factor_is_positive_now)
     :named REQ0_AUXILIARY0)) ;; If the patient has a modifiable risk factor, then the patient has a risk factor. ("modifiable cardiovascular risk factor")

(assert
  (! (=> patients_risk_factor_is_positive_now@@cardiovascular
         patients_risk_factor_is_positive_now)
     :named REQ0_AUXILIARY1)) ;; If the patient has a cardiovascular risk factor, then the patient has a risk factor. ("modifiable cardiovascular risk factor")

;; Both qualifiers together imply the stem variable
(assert
  (! (=> (and patients_risk_factor_is_positive_now@@modifiable
              patients_risk_factor_is_positive_now@@cardiovascular)
         patients_risk_factor_is_positive_now)
     :named REQ0_AUXILIARY2)) ;; If the patient has a modifiable cardiovascular risk factor, then the patient has a risk factor.

;; Non-exhaustive examples: if the patient has any of the listed findings, then they have a modifiable cardiovascular risk factor
(assert
  (! (=> (or patient_has_finding_of_tobacco_smoking_behavior_finding_now
            patient_has_finding_of_diabetes_mellitus_now
            patient_has_finding_of_hypertensive_disorder_now
            patient_has_finding_of_obesity_now)
         (and patients_risk_factor_is_positive_now@@modifiable
              patients_risk_factor_is_positive_now@@cardiovascular))
     :named REQ0_AUXILIARY3)) ;; "which may include smoking, hyperlipidemia, hypertension, diabetes mellitus, or obesity" (non-exhaustive examples)

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must have at least one modifiable cardiovascular risk factor
(assert
  (! (and patients_risk_factor_is_positive_now@@modifiable
          patients_risk_factor_is_positive_now@@cardiovascular)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have at least one modifiable cardiovascular risk factor"
