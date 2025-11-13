;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male (e.g., female or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is male as currently recorded."}  ;; "male"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (e.g., male or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female as currently recorded."}  ;; "female"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; To be included, the patient must be (male OR female) AND (aged ≥ 18 years).
(assert
  (! (and (or patient_sex_is_male_now patient_sex_is_female_now)
          (>= patient_age_value_recorded_now_in_years 18))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_multiple_sclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has multiple sclerosis.","when_to_set_to_false":"Set to false if the patient currently does not have multiple sclerosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has multiple sclerosis.","meaning":"Boolean indicating whether the patient currently has multiple sclerosis."} ;; "multiple sclerosis"
(declare-const patient_has_finding_of_multiple_sclerosis_now@@clinically_definite_relapsing_form Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has multiple sclerosis and the form is clinically definite and relapsing.","when_to_set_to_false":"Set to false if the patient currently has multiple sclerosis but the form is not clinically definite and relapsing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's multiple sclerosis is clinically definite and relapsing.","meaning":"Boolean indicating whether the patient's multiple sclerosis is clinically definite and relapsing."} ;; "clinically definite relapsing form of multiple sclerosis"
(declare-const patient_has_finding_of_multiple_sclerosis_now@@diagnosed_according_to_mcdonald_criteria_2010_revision Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has multiple sclerosis and the diagnosis is according to McDonald Criteria (2010 revision).","when_to_set_to_false":"Set to false if the patient currently has multiple sclerosis but the diagnosis is not according to McDonald Criteria (2010 revision).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's multiple sclerosis diagnosis is according to McDonald Criteria (2010 revision).","meaning":"Boolean indicating whether the patient's multiple sclerosis diagnosis is according to McDonald Criteria (2010 revision)."} ;; "according to McDonald Criteria (2010 revision)"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable for clinically definite relapsing form implies stem variable
(assert
  (! (=> patient_has_finding_of_multiple_sclerosis_now@@clinically_definite_relapsing_form
         patient_has_finding_of_multiple_sclerosis_now)
     :named REQ1_AUXILIARY0)) ;; "clinically definite relapsing form of multiple sclerosis"

;; Qualifier variable for McDonald Criteria (2010 revision) implies stem variable
(assert
  (! (=> patient_has_finding_of_multiple_sclerosis_now@@diagnosed_according_to_mcdonald_criteria_2010_revision
         patient_has_finding_of_multiple_sclerosis_now)
     :named REQ1_AUXILIARY1)) ;; "diagnosed according to McDonald Criteria (2010 revision)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must have a clinically definite relapsing form of multiple sclerosis according to McDonald Criteria (2010 revision)
(assert
  (! (and patient_has_finding_of_multiple_sclerosis_now@@clinically_definite_relapsing_form
          patient_has_finding_of_multiple_sclerosis_now@@diagnosed_according_to_mcdonald_criteria_2010_revision)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (a clinically definite relapsing form of multiple sclerosis (according to McDonald Criteria (2010 revision)))."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_exacerbation_of_multiple_sclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of an exacerbation of multiple sclerosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of an exacerbation of multiple sclerosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of an exacerbation of multiple sclerosis.","meaning":"Boolean indicating whether the patient currently has an exacerbation of multiple sclerosis."} ;; "multiple sclerosis exacerbation"
(declare-const patient_has_finding_of_exacerbation_of_multiple_sclerosis_now@@acute Bool) ;; {"when_to_set_to_true":"Set to true if the current exacerbation of multiple sclerosis is acute.","when_to_set_to_false":"Set to false if the current exacerbation of multiple sclerosis is not acute.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the current exacerbation of multiple sclerosis is acute.","meaning":"Boolean indicating whether the current exacerbation of multiple sclerosis is acute."} ;; "acute"
(declare-const patient_has_finding_of_exacerbation_of_multiple_sclerosis_now@@determined_by_treating_clinician Bool) ;; {"when_to_set_to_true":"Set to true if the current exacerbation of multiple sclerosis is determined by the treating clinician.","when_to_set_to_false":"Set to false if the current exacerbation of multiple sclerosis is not determined by the treating clinician.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the current exacerbation of multiple sclerosis is determined by the treating clinician.","meaning":"Boolean indicating whether the current exacerbation of multiple sclerosis is determined by the treating clinician."} ;; "as determined by the treating clinician"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_exacerbation_of_multiple_sclerosis_now@@acute
         patient_has_finding_of_exacerbation_of_multiple_sclerosis_now)
     :named REQ2_AUXILIARY0)) ;; "acute multiple sclerosis exacerbation"

(assert
  (! (=> patient_has_finding_of_exacerbation_of_multiple_sclerosis_now@@determined_by_treating_clinician
         patient_has_finding_of_exacerbation_of_multiple_sclerosis_now)
     :named REQ2_AUXILIARY1)) ;; "as determined by the treating clinician"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have an acute multiple sclerosis exacerbation as determined by the treating clinician.
(assert
  (! (and patient_has_finding_of_exacerbation_of_multiple_sclerosis_now@@acute
          patient_has_finding_of_exacerbation_of_multiple_sclerosis_now@@determined_by_treating_clinician)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "acute multiple sclerosis exacerbation (as determined by the treating clinician)"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_exposed_to_corticotropin_zinc_hydroxide_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is planning to initiate therapy with corticotropin zinc hydroxide (Acthar Gel) in the future.","when_to_set_to_false":"Set to false if the patient is not planning to initiate therapy with corticotropin zinc hydroxide (Acthar Gel) in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is planning to initiate therapy with corticotropin zinc hydroxide (Acthar Gel) in the future.","meaning":"Boolean indicating whether the patient is planned to be exposed to corticotropin zinc hydroxide (Acthar Gel) in the future."} ;; "planning to initiate Acthar Gel"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_is_exposed_to_corticotropin_zinc_hydroxide_inthefuture
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be planning to initiate Acthar Gel for the treatment of an acute multiple sclerosis exacerbation."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_capable_of_providing_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently capable of providing informed consent.","when_to_set_to_false":"Set to false if the patient is currently not capable of providing informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently capable of providing informed consent.","meaning":"Boolean indicating whether the patient is currently capable of providing informed consent."} ;; "To be included, the patient must be (capable of providing informed consent)."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_is_capable_of_providing_informed_consent_now
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be (capable of providing informed consent)."
