;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_cholestasis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cholestasis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cholestasis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of cholestasis.","meaning":"Boolean indicating whether the patient currently has cholestasis."} ;; "cholestasis"

(declare-const patient_has_finding_of_hepatic_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hepatic insufficiency (hepatic failure).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hepatic insufficiency (hepatic failure).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hepatic insufficiency (hepatic failure).","meaning":"Boolean indicating whether the patient currently has hepatic insufficiency (hepatic failure)."} ;; "hepatic insufficiency"

(declare-const patient_has_finding_of_hepatic_failure_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hepatic insufficiency is classified as severe.","when_to_set_to_false":"Set to false if the patient's hepatic insufficiency is not severe (i.e., mild or moderate).","when_to_set_to_null":"Set to null if the severity of the patient's hepatic insufficiency is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient's hepatic insufficiency is severe."} ;; "severe hepatic insufficiency"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_hepatic_failure_now@@severity_severe
      patient_has_finding_of_hepatic_failure_now)
:named REQ0_AUXILIARY0)) ;; "severe hepatic insufficiency" implies "hepatic insufficiency"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have cholestasis
(assert
(! (not patient_has_finding_of_cholestasis_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cholestasis."

;; Exclusion: patient must NOT have severe hepatic insufficiency
(assert
(! (not patient_has_finding_of_hepatic_failure_now@@severity_severe)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe hepatic insufficiency."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_allergy_to_telmisartan_ever Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an allergy to telmisartan.","when_to_set_to_false":"Set to false if the patient has never had an allergy to telmisartan.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an allergy to telmisartan.","meaning":"Boolean indicating whether the patient has ever had an allergy to telmisartan."} ;; "allergy to telmisartan"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_has_allergy_to_telmisartan_ever)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has allergy to telmisartan."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not lactating as documented or reported.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_pregnant_now)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
(! (not patient_is_lactating_now)
    :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is lactating."
