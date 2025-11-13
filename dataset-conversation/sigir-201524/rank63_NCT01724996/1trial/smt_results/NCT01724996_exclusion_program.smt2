;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently provided informed consent.","when_to_set_to_false":"Set to false if the patient is currently missing informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has provided informed consent.","meaning":"Boolean indicating whether the patient currently has provided informed consent."} ;; "The patient is excluded if the patient is missing informed consent."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_informed_consent_now)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is missing informed consent."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_cardiopulmonary_instability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cardiopulmonary instability.","when_to_set_to_false":"Set to false if the patient currently does not have cardiopulmonary instability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cardiopulmonary instability.","meaning":"Boolean indicating whether the patient currently has cardiopulmonary instability."} ;; "The patient is excluded if the patient has cardiopulmonary instability."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_cardiopulmonary_instability_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cardiopulmonary instability."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of chest pain.","meaning":"Boolean indicating whether the patient currently has chest pain."} ;; "chest pain"
(declare-const patient_has_finding_of_chest_pain_now@@self_reported Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chest pain is self-reported.","when_to_set_to_false":"Set to false if the patient's chest pain is not self-reported.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chest pain is self-reported.","meaning":"Boolean indicating whether the patient's chest pain is self-reported."} ;; "self-reported chest pain"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_chest_pain_now@@self_reported
       patient_has_finding_of_chest_pain_now)
   :named REQ2_AUXILIARY0)) ;; "self-reported chest pain" implies "chest pain"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_chest_pain_now@@self_reported)
   :named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient does NOT have self-reported chest pain."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_undergone_surgical_procedure_on_thorax_inthepast1years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a surgical procedure on the thorax within the past 1 year.","when_to_set_to_false":"Set to false if the patient has not undergone a surgical procedure on the thorax within the past 1 year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a surgical procedure on the thorax within the past 1 year.","meaning":"Boolean indicating whether the patient has undergone a surgical procedure on the thorax within the past 1 year."} ;; "recent thoracic surgery within 1 year"
(declare-const patient_has_diagnosis_of_arthropathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of arthropathy.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of arthropathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of arthropathy.","meaning":"Boolean indicating whether the patient currently has a diagnosis of arthropathy."} ;; "joint disease"
(declare-const patient_has_diagnosis_of_arthropathy_now@@inflammatory Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of arthropathy is inflammatory.","when_to_set_to_false":"Set to false if the patient's current diagnosis of arthropathy is not inflammatory.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of arthropathy is inflammatory.","meaning":"Boolean indicating whether the patient's current diagnosis of arthropathy is inflammatory."} ;; "inflammatory joint disease"
(declare-const patient_has_diagnosis_of_fibromyalgia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of fibromyalgia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of fibromyalgia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of fibromyalgia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of fibromyalgia."} ;; "fibromyalgia"
(declare-const patient_has_diagnosis_of_cardiogenic_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cardiogenic shock.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cardiogenic shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cardiogenic shock.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cardiogenic shock."} ;; "cardiogenic shock"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_arthropathy_now@@inflammatory
       patient_has_diagnosis_of_arthropathy_now)
   :named REQ3_AUXILIARY0)) ;; "inflammatory joint disease"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_undergone_surgical_procedure_on_thorax_inthepast1years)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "recent thoracic surgery within 1 year"
(assert
(! (not patient_has_diagnosis_of_arthropathy_now@@inflammatory)
   :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "inflammatory joint disease"
(assert
(! (not patient_has_diagnosis_of_fibromyalgia_now)
   :named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "fibromyalgia"
(assert
(! (not patient_has_diagnosis_of_cardiogenic_shock_now)
   :named REQ3_COMPONENT3_OTHER_REQUIREMENTS)) ;; "cardiogenic shock"
