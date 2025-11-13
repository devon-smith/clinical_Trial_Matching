;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_creatinine_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's creatinine concentration in mg/dl recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current creatinine concentration in mg/dl."} ;; "creatinine concentration in mg/dl"
(declare-const patient_has_finding_of_renal_insufficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal insufficiency.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal insufficiency.","meaning":"Boolean indicating whether the patient currently has renal insufficiency."} ;; "renal insufficiency"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition: renal insufficiency is defined as creatinine concentration > 1.5 mg/dl
(assert
(! (= patient_has_finding_of_renal_insufficiency_now
     (> patient_creatinine_value_recorded_now_withunit_mg_per_dl 1.5))
:named REQ0_AUXILIARY0)) ;; "defined as creatinine concentration > 1.5 mg/dl"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_renal_insufficiency_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has renal insufficiency (defined as creatinine concentration > 1.5 mg/dl)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const anticoagulation_with_any_agent_is_deemed_unsafe_due_to_bleeding_risk Bool) ;; {"when_to_set_to_true":"Set to true if anticoagulation with any agent is considered unsafe for the patient due to bleeding risk.","when_to_set_to_false":"Set to false if anticoagulation with any agent is not considered unsafe for the patient due to bleeding risk.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether anticoagulation with any agent is considered unsafe for the patient due to bleeding risk.","meaning":"Boolean indicating whether anticoagulation with any agent is considered unsafe for the patient due to bleeding risk."} ;; "anticoagulation with any agent is deemed unsafe for the patient due to bleeding risk."

(declare-const patient_has_finding_of_bleeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of bleeding.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of bleeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of bleeding.","meaning":"Boolean indicating whether the patient currently has a clinical finding of bleeding."} ;; "bleeding"

(declare-const patient_is_undergoing_anticoagulant_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing anticoagulant therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing anticoagulant therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing anticoagulant therapy.","meaning":"Boolean indicating whether the patient is currently undergoing anticoagulant therapy."} ;; "anticoagulation"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not anticoagulation_with_any_agent_is_deemed_unsafe_due_to_bleeding_risk)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if anticoagulation with any agent is deemed unsafe for the patient due to bleeding risk."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as confirmed by clinical assessment or documentation.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as confirmed by clinical assessment or documentation.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_hypersensitivity_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any hypersensitivity condition.","when_to_set_to_false":"Set to false if the patient currently does not have any hypersensitivity condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any hypersensitivity condition.","meaning":"Boolean indicating whether the patient currently has any hypersensitivity condition now."} ;; "hypersensitivity"
(declare-const patient_has_finding_of_hypersensitivity_condition_now@@to_fondaparinux Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hypersensitivity condition and the hypersensitivity is specifically to fondaparinux.","when_to_set_to_false":"Set to false if the patient currently has a hypersensitivity condition but it is not to fondaparinux, or if the patient does not have a hypersensitivity condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypersensitivity condition is to fondaparinux.","meaning":"Boolean indicating whether the patient's current hypersensitivity condition is specifically to fondaparinux."} ;; "known hypersensitivity to fondaparinux"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_finding_of_hypersensitivity_condition_now@@to_fondaparinux
       patient_has_finding_of_hypersensitivity_condition_now)
   :named REQ3_AUXILIARY0)) ;; "hypersensitivity condition and that condition is specifically to fondaparinux"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_hypersensitivity_condition_now@@to_fondaparinux)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known hypersensitivity to fondaparinux."
