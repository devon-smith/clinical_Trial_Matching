;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true": "Set to true if the patient is currently pregnant.", "when_to_set_to_false": "Set to false if the patient is confirmed not to be currently pregnant.", "when_to_set_to_null": "Set to null if the patient's pregnancy status is unknown or cannot be determined.", "meaning": "Boolean value indicating whether the patient is currently pregnant."} ;; "the patient has pregnancy"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pregnancy."

;; --- verifier-bypassed (attempt 8/8) 2025-10-26T11:27:29.705513 policy=eventual
;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_finding_of_lactation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of lactation.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of lactation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of lactation.","meaning":"Boolean indicating whether the patient currently has the clinical finding of lactation."} ;; "lactation"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently not lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient has lactation"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Link the clinical finding variable to the general lactation status variable
(assert
(! (= patient_is_lactating_now patient_has_finding_of_finding_of_lactation_now)
:named REQ1_AUXILIARY0)) ;; "The patient is excluded if the patient has lactation." (linking clinical finding to general status)

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_lactating_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has lactation."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_allergy_to_colistin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of allergy to colistin at any time in the past or present.","when_to_set_to_false":"Set to false if the patient has no documented history of allergy to colistin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an allergy to colistin.","meaning":"Boolean indicating whether the patient has ever had a documented allergy to colistin."} ;; "colistin allergy"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_allergy_to_colistin_inthehistory)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has colistin allergy."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_renal_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal impairment.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal impairment.","meaning":"Boolean indicating whether the patient currently has renal impairment."} ;; "renal impairment"
(declare-const patient_has_finding_of_renal_impairment_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current renal impairment is severe.","when_to_set_to_false":"Set to false if the patient's current renal impairment is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current renal impairment is severe.","meaning":"Boolean indicating whether the patient's current renal impairment is severe."} ;; "severe renal impairment"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_renal_impairment_now@@severe
      patient_has_finding_of_renal_impairment_now)
:named REQ3_AUXILIARY0)) ;; "severe renal impairment" implies "renal impairment"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_renal_impairment_now@@severe)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe renal impairment."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_epilepsy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of epilepsy.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of epilepsy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of epilepsy.","meaning":"Boolean indicating whether the patient currently has a diagnosis of epilepsy."} ;; "epilepsy"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_epilepsy_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has epilepsy."
