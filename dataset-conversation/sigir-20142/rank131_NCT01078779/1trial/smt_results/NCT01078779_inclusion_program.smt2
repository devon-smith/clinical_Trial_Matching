;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 18 years AND aged ≤ 65 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be aged ≥ 18 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; Component 1: To be included, the patient must be aged ≤ 65 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 65)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 65 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_ability_to_provide_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has the ability to provide informed consent.","when_to_set_to_false":"Set to false if the patient does not have the ability to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has the ability to provide informed consent.","meaning":"Boolean indicating whether the patient has the ability to provide informed consent."} ;; "the patient must have the ability to provide informed consent."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_ability_to_provide_informed_consent
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have the ability to provide informed consent."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient's sex is female at the current time."} ;; "woman of child-bearing potential"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently assessed to have childbearing potential.","when_to_set_to_false":"Set to false if the patient is currently assessed to not have childbearing potential.","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient currently has childbearing potential."} ;; "woman of child-bearing potential"
(declare-const patient_is_willing_to_use_contraception_for_period_of_trial Bool) ;; {"when_to_set_to_true":"Set to true if the patient expresses willingness to use contraception for the period of the trial.","when_to_set_to_false":"Set to false if the patient does not express willingness to use contraception for the period of the trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to use contraception for the period of the trial.","meaning":"Boolean indicating whether the patient is willing to use contraception for the period of the trial."} ;; "must be willing to use contraception for the period of the trial"
(declare-const patient_has_finding_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using contraception.","when_to_set_to_false":"Set to false if the patient is currently not using contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using contraception.","meaning":"Boolean indicating whether the patient is currently using contraception."} ;; "contraception"
(declare-const patient_has_finding_of_contraception_now@@used_for_period_of_trial Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current use of contraception is specifically for the period of the trial.","when_to_set_to_false":"Set to false if the patient's current use of contraception is not specifically for the period of the trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the contraception is used for the period of the trial.","meaning":"Boolean indicating whether the patient's current use of contraception is for the period of the trial."} ;; "contraception for the period of the trial"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for contraception implies stem variable
(assert
  (! (=> patient_has_finding_of_contraception_now@@used_for_period_of_trial
         patient_has_finding_of_contraception_now)
     :named REQ2_AUXILIARY0)) ;; "contraception for the period of the trial" implies "contraception"

;; ===================== Constraint Assertions (REQ 2) =====================
;; If the patient is a woman of child-bearing potential, then the patient must be willing to use contraception for the period of the trial.
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         patient_is_willing_to_use_contraception_for_period_of_trial)
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is a woman of child-bearing potential, the patient must be willing to use contraception for the period of the trial"
