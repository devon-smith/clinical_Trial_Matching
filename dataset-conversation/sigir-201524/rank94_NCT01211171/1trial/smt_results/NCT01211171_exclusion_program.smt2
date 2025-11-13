;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_taking_telmisartan_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with any telmisartan-containing product (including Kinzal/Pritor, BAY68-9291).","when_to_set_to_false":"Set to false if the patient is currently not being treated with any telmisartan-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with any telmisartan-containing product.","meaning":"Boolean indicating whether the patient is currently taking a telmisartan-containing product."} ;; "telmisartan (Kinzal/Pritor, BAY68-9291)"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_taking_telmisartan_containing_product_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently being treated with telmisartan (Kinzal/Pritor, BAY68-9291) treatment."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_cholestatic_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cholestatic disorder.","when_to_set_to_false":"Set to false if the patient currently does not have cholestatic disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cholestatic disorder.","meaning":"Boolean indicating whether the patient currently has cholestatic disorder."} ;; "the patient has cholestatic disorder"

(declare-const patient_has_finding_of_hepatic_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hepatic failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hepatic failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hepatic failure.","meaning":"Boolean indicating whether the patient currently has hepatic failure now."} ;; "hepatic failure"

(declare-const patient_has_finding_of_hepatic_failure_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hepatic failure is severe.","when_to_set_to_false":"Set to false if the patient's hepatic failure is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hepatic failure is severe.","meaning":"Boolean indicating whether the patient's hepatic failure is severe."} ;; "severe hepatic failure"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_hepatic_failure_now@@severe
       patient_has_finding_of_hepatic_failure_now)
   :named REQ1_AUXILIARY0)) ;; "severe hepatic failure" implies "hepatic failure"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_cholestatic_disorder_now)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cholestatic disorder."

(assert
(! (not patient_has_finding_of_hepatic_failure_now@@severe)
   :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe hepatic failure."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_allergy_to_telmisartan Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented allergy to telmisartan (Kinzal/Pritor, BAY68-9291).","when_to_set_to_false":"Set to false if the patient does not have a documented allergy to telmisartan (Kinzal/Pritor, BAY68-9291).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has an allergy to telmisartan (Kinzal/Pritor, BAY68-9291).","meaning":"Boolean indicating whether the patient has an allergy to telmisartan (Kinzal/Pritor, BAY68-9291)." } ;; "The patient is excluded if the patient has allergy to telmisartan (Kinzal/Pritor, BAY68-9291)."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_allergy_to_telmisartan)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has allergy to telmisartan (Kinzal/Pritor, BAY68-9291)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently not lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is in the lactation period"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
  (! (not patient_is_lactating_now)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is in the lactation period."
