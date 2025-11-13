;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_alcohol_intake_above_recommended_sensible_limits_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has alcohol intake above recommended sensible limits (excessive alcohol consumption).","when_to_set_to_false":"Set to false if the patient currently does not have alcohol intake above recommended sensible limits.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has alcohol intake above recommended sensible limits.","meaning":"Boolean indicating whether the patient currently has alcohol intake above recommended sensible limits."} ;; "excessive alcohol consumption"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_finding_of_alcohol_intake_above_recommended_sensible_limits_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has excessive alcohol consumption."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently known not to be lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
  (! (not patient_is_lactating_now)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is lactating."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_dyslipidemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dyslipidemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dyslipidemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dyslipidemia.","meaning":"Boolean indicating whether the patient currently has dyslipidemia."} ;; "the patient has dyslipidemia"
(declare-const patient_has_finding_of_hyperglycemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hyperglycemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hyperglycemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hyperglycemia.","meaning":"Boolean indicating whether the patient currently has hyperglycemia."} ;; "the patient has hyperglycemia"
(declare-const patient_has_finding_of_chronic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of any chronic disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of any chronic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any chronic disease.","meaning":"Boolean indicating whether the patient currently has any chronic disease."} ;; "the patient has other chronic disease"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_has_finding_of_dyslipidemia_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has dyslipidemia."

(assert
  (! (not patient_has_finding_of_hyperglycemia_now)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hyperglycemia."

(assert
  (! (not patient_has_finding_of_chronic_disease_now)
     :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other chronic disease."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_taking_vitamin_supplement_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a vitamin supplement.","when_to_set_to_false":"Set to false if the patient is currently not taking a vitamin supplement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a vitamin supplement.","meaning":"Boolean indicating whether the patient is currently taking a vitamin supplement."} ;; "vitamin supplement"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_taking_vitamin_supplement_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking vitamin supplement."
