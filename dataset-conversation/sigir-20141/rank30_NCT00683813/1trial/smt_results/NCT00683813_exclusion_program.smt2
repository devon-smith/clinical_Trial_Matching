;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_previous_experience_with_cardiac_rehabilitation_program Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously participated in or completed a cardiac rehabilitation program.","when_to_set_to_false":"Set to false if the patient has never participated in or completed a cardiac rehabilitation program.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previous experience with a cardiac rehabilitation program.","meaning":"Boolean indicating whether the patient has previous experience with a cardiac rehabilitation program."} ;; "The patient is excluded if the patient has previous experience with a cardiac rehabilitation program."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_previous_experience_with_cardiac_rehabilitation_program)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous experience with a cardiac rehabilitation program."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_depressive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of depressive disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of depressive disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of depressive disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of depressive disorder."} ;; "depression"

(declare-const patient_has_finding_of_diabetic_poor_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has poorly controlled (uncontrolled) diabetes.","when_to_set_to_false":"Set to false if the patient currently does not have poorly controlled (uncontrolled) diabetes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has poorly controlled (uncontrolled) diabetes.","meaning":"Boolean indicating whether the patient currently has poorly controlled (uncontrolled) diabetes."} ;; "uncontrolled diabetes"

(declare-const patient_has_finding_of_co_morbid_conditions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has co-morbid conditions.","when_to_set_to_false":"Set to false if the patient currently does not have co-morbid conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has co-morbid conditions.","meaning":"Boolean indicating whether the patient currently has co-morbid conditions."} ;; "co-morbidities"

(declare-const patient_has_finding_of_co_morbid_conditions_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's co-morbid conditions are significant.","when_to_set_to_false":"Set to false if the patient's co-morbid conditions are not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's co-morbid conditions are significant.","meaning":"Boolean indicating whether the patient's co-morbid conditions are significant."} ;; "significant co-morbidities"

(declare-const patient_has_finding_of_co_morbid_conditions_now@@may_interfere_with_effective_ischemic_heart_disease_management Bool) ;; {"when_to_set_to_true":"Set to true if the patient's co-morbid conditions may interfere with effective ischemic heart disease management.","when_to_set_to_false":"Set to false if the patient's co-morbid conditions do not interfere with effective ischemic heart disease management.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's co-morbid conditions may interfere with effective ischemic heart disease management.","meaning":"Boolean indicating whether the patient's co-morbid conditions may interfere with effective ischemic heart disease management."} ;; "co-morbidities that may interfere with effective ischemic heart disease management"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_co_morbid_conditions_now@@significant
       patient_has_finding_of_co_morbid_conditions_now)
   :named REQ1_AUXILIARY0)) ;; "significant co-morbidities"

(assert
(! (=> patient_has_finding_of_co_morbid_conditions_now@@may_interfere_with_effective_ischemic_heart_disease_management
       patient_has_finding_of_co_morbid_conditions_now)
   :named REQ1_AUXILIARY1)) ;; "co-morbidities that may interfere with effective ischemic heart disease management"

;; Both qualifiers must be true for the exclusion
(assert
(! (= patient_has_finding_of_co_morbid_conditions_now@@significant
      (and patient_has_finding_of_co_morbid_conditions_now@@significant
           patient_has_finding_of_co_morbid_conditions_now@@may_interfere_with_effective_ischemic_heart_disease_management))
   :named REQ1_AUXILIARY2)) ;; "other significant co-morbidities that may interfere with effective ischemic heart disease management"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_depressive_disorder_now)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has depression."

(assert
(! (not patient_has_finding_of_diabetic_poor_control_now)
   :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled diabetes."

(assert
(! (not (and patient_has_finding_of_co_morbid_conditions_now@@significant
             patient_has_finding_of_co_morbid_conditions_now@@may_interfere_with_effective_ischemic_heart_disease_management))
   :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other significant co-morbidities that may interfere with effective ischemic heart disease management."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_considered_unsuitable_for_participation_by_attending_physician_now Bool) ;; {"when_to_set_to_true":"Set to true if, in the mind of the attending physician, the patient is currently considered unsuitable for participation.","when_to_set_to_false":"Set to false if, in the mind of the attending physician, the patient is currently considered suitable for participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the attending physician currently considers the patient unsuitable for participation.","meaning":"Boolean indicating whether, in the mind of the attending physician, the patient is currently considered unsuitable for participation."} ;; "The patient is excluded if the patient is, in the mind of the attending physician, unsuitable for participation."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_considered_unsuitable_for_participation_by_attending_physician_now)
:named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is, in the mind of the attending physician, unsuitable for participation."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_able_to_provide_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to provide informed consent.","when_to_set_to_false":"Set to false if the patient is currently unable to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to provide informed consent.","meaning":"Boolean indicating whether the patient is currently able to provide informed consent."} ;; "The patient is excluded if the patient is unable to provide informed consent."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_able_to_provide_informed_consent_now)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to provide informed consent."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_pregnant_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_high_risk_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered high-risk for any reason.","when_to_set_to_false":"Set to false if the patient is currently not considered high-risk for any reason.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently considered high-risk.","meaning":"Boolean indicating whether the patient is currently considered high-risk (regardless of reason)."} ;; "high-risk"
(declare-const patient_has_finding_of_high_risk_now@@for_safety_considerations Bool) ;; {"when_to_set_to_true":"Set to true if the patient's high-risk status is specifically for safety considerations.","when_to_set_to_false":"Set to false if the patient's high-risk status is not specifically for safety considerations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the high-risk status is for safety considerations.","meaning":"Boolean indicating whether the patient's high-risk status is specifically for safety considerations."} ;; "high-risk for safety considerations"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_high_risk_now@@for_safety_considerations
      patient_has_finding_of_high_risk_now)
:named REQ5_AUXILIARY0)) ;; "high-risk for safety considerations" implies "high-risk"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_high_risk_now@@for_safety_considerations)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is considered high-risk for safety considerations."
