;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "adult individual"
(declare-const patient_is_adult_individual_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered an adult individual.","when_to_set_to_false":"Set to false if the patient is currently not considered an adult individual.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an adult individual.","meaning":"Boolean indicating whether the patient is currently an adult individual."}  ;; "adult individual"
(declare-const patient_is_undergoing_laparoscopic_sleeve_gastrectomy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing laparoscopic sleeve gastrectomy.","when_to_set_to_false":"Set to false if the patient is not currently undergoing laparoscopic sleeve gastrectomy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing laparoscopic sleeve gastrectomy.","meaning":"Boolean indicating whether the patient is currently undergoing laparoscopic sleeve gastrectomy."}  ;; "laparoscopic sleeve gastrectomy"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition: patient is considered an adult individual if age >= 18 years
(assert
  (! (= patient_is_adult_individual_now
        (>= patient_age_value_recorded_now_in_years 18.0))
     :named REQ0_AUXILIARY0)) ;; "adult individual"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: patient must be an adult individual
(assert
  (! patient_is_adult_individual_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be an adult individual."

;; Component 1: patient must be undergoing laparoscopic sleeve gastrectomy
(assert
  (! patient_is_undergoing_laparoscopic_sleeve_gastrectomy_now
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be undergoing laparoscopic sleeve gastrectomy."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_undergoing_laparoscopic_sleeve_gastrectomy_now@@performed_in_surgical_wing_of_tel_aviv_sourasky_medical_center Bool) ;; {"when_to_set_to_true":"Set to true if the patient's laparoscopic sleeve gastrectomy is performed in the surgical wing of the Tel-Aviv Sourasky Medical Center.","when_to_set_to_false":"Set to false if the patient's laparoscopic sleeve gastrectomy is not performed in the surgical wing of the Tel-Aviv Sourasky Medical Center.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure is performed in the surgical wing of the Tel-Aviv Sourasky Medical Center.","meaning":"Boolean indicating whether the patient's laparoscopic sleeve gastrectomy is performed in the surgical wing of the Tel-Aviv Sourasky Medical Center."} ;; "laparoscopic sleeve gastrectomy in the surgical wing of the Tel-Aviv Sourasky Medical Center"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_is_undergoing_laparoscopic_sleeve_gastrectomy_now@@performed_in_surgical_wing_of_tel_aviv_sourasky_medical_center
         patient_is_undergoing_laparoscopic_sleeve_gastrectomy_now)
     :named REQ1_AUXILIARY0)) ;; "laparoscopic sleeve gastrectomy in the surgical wing of the Tel-Aviv Sourasky Medical Center"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_is_undergoing_laparoscopic_sleeve_gastrectomy_now@@performed_in_surgical_wing_of_tel_aviv_sourasky_medical_center
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must undergo laparoscopic sleeve gastrectomy in the surgical wing of the Tel-Aviv Sourasky Medical Center."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_received_full_information_regarding_nature_of_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received full information regarding the nature of the study.","when_to_set_to_false":"Set to false if the patient has not received full information regarding the nature of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received full information regarding the nature of the study.","meaning":"Boolean indicating whether the patient has received full information regarding the nature of the study."} ;; "have received full information regarding the nature of the study"
(declare-const patient_has_agreed_to_participate Bool) ;; {"when_to_set_to_true":"Set to true if the patient has agreed to participate in the study.","when_to_set_to_false":"Set to false if the patient has not agreed to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has agreed to participate in the study.","meaning":"Boolean indicating whether the patient has agreed to participate in the study."} ;; "have agreed to participate"
(declare-const patient_has_given_informed_consent_documented_by_signed_informed_consent_form Bool) ;; {"when_to_set_to_true":"Set to true if the patient has given informed consent, documented by a signed informed consent form.","when_to_set_to_false":"Set to false if the patient has not given informed consent, or if there is no signed informed consent form documenting it.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has given informed consent documented by a signed informed consent form.","meaning":"Boolean indicating whether the patient has given informed consent, as documented by a signed informed consent form."} ;; "have given informed consent (documented by a signed informed consent form)"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: patient must have received full information regarding the nature of the study
(assert
  (! patient_has_received_full_information_regarding_nature_of_study
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "have received full information regarding the nature of the study"

;; Component 1: patient must have agreed to participate
(assert
  (! patient_has_agreed_to_participate
     :named REQ2_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "have agreed to participate"

;; Component 2: patient must have given informed consent (documented by a signed informed consent form)
(assert
  (! patient_has_given_informed_consent_documented_by_signed_informed_consent_form
     :named REQ2_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "have given informed consent (documented by a signed informed consent form)"
