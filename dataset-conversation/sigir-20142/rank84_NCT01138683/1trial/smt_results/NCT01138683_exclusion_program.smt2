;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_need_for_inotropic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a need for an inotropic agent.","when_to_set_to_false":"Set to false if the patient currently does not have a need for an inotropic agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a need for an inotropic agent.","meaning":"Boolean indicating whether the patient currently has a need for an inotropic agent."} ;; "the patient has a need for inotropic agent"
(declare-const patient_has_need_for_vasopressive_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a need for a vasopressive agent.","when_to_set_to_false":"Set to false if the patient currently does not have a need for a vasopressive agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a need for a vasopressive agent.","meaning":"Boolean indicating whether the patient currently has a need for a vasopressive agent."} ;; "the patient has a need for vasopressive agent"
(declare-const patient_is_exposed_to_inotropic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to an inotropic agent.","when_to_set_to_false":"Set to false if the patient is currently not exposed to an inotropic agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to an inotropic agent.","meaning":"Boolean indicating whether the patient is currently exposed to an inotropic agent."} ;; "inotropic agent"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (or patient_has_need_for_inotropic_agent_now
              patient_has_need_for_vasopressive_agent_now))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a need for inotropic agent) OR (the patient has a need for vasopressive agent)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_exposed_to_contrast_media_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to contrast media (specifically intravenous contrast media).","when_to_set_to_false":"Set to false if the patient is currently not exposed to contrast media (specifically intravenous contrast media).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to contrast media.","meaning":"Boolean indicating whether the patient is currently exposed to contrast media."} ;; "contrast medium"
(declare-const patient_is_exposed_to_contrast_media_now@@intravenous_route Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to contrast media and the route of administration is intravenous.","when_to_set_to_false":"Set to false if the patient is currently exposed to contrast media but the route is not intravenous, or if the patient is not exposed to contrast media.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the route of administration for contrast media exposure is intravenous.","meaning":"Boolean indicating whether the patient is currently exposed to contrast media via the intravenous route."} ;; "intravenous contrast medium"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_contrast_media_now@@intravenous_route
      patient_is_exposed_to_contrast_media_now)
:named REQ1_AUXILIARY0)) ;; "intravenous contrast medium" implies "contrast medium"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_exposed_to_contrast_media_now@@intravenous_route)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses intravenous contrast medium."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_acute_coronary_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute coronary syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute coronary syndrome.","meaning":"Boolean indicating whether the patient currently has acute coronary syndrome."} ;; "acute coronary syndrome"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_acute_coronary_syndrome_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute coronary syndrome."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_need_of_dialysis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical need for dialysis.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical need for dialysis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical need for dialysis.","meaning":"Boolean indicating whether the patient currently has a need for dialysis."} ;; "The patient is excluded if the patient has a need of dialysis."
(declare-const patient_is_undergoing_dialysis_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing dialysis procedure.","when_to_set_to_false":"Set to false if the patient is currently not undergoing dialysis procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing dialysis procedure.","meaning":"Boolean indicating whether the patient is currently undergoing dialysis procedure."} ;; "dialysis"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_need_of_dialysis_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a need of dialysis."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_co_morbid_conditions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any co-morbid condition.","when_to_set_to_false":"Set to false if the patient currently does not have any co-morbid condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any co-morbid condition.","meaning":"Boolean indicating whether the patient currently has any co-morbid condition."} ;; "co-morbidity"
(declare-const patient_has_finding_of_co_morbid_conditions_now@@is_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's co-morbid condition is severe.","when_to_set_to_false":"Set to false if the patient's co-morbid condition is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's co-morbid condition is severe.","meaning":"Boolean indicating whether the patient's co-morbid condition is severe."} ;; "severe co-morbidity"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_finding_of_co_morbid_conditions_now@@is_severe
       patient_has_finding_of_co_morbid_conditions_now)
   :named REQ4_AUXILIARY0)) ;; "severe co-morbidity" implies "co-morbidity"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_co_morbid_conditions_now@@is_severe)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe co-morbidity."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_contraindication_for_anticoagulation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication for anticoagulation.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication for anticoagulation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication for anticoagulation.","meaning":"Boolean indicating whether the patient currently has a contraindication for anticoagulation."} ;; "The patient is excluded if the patient has contraindication for anticoagulation."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_contraindication_for_anticoagulation_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has contraindication for anticoagulation."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."
