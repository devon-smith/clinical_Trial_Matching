;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_is_undergoing_bronchoscopy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a bronchoscopy.","when_to_set_to_false":"Set to false if the patient is not currently undergoing a bronchoscopy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing a bronchoscopy.","meaning":"Boolean indicating whether the patient is currently undergoing a bronchoscopy."}  ;; "be undergoing diagnostic bronchoscopy"
(declare-const patient_is_undergoing_bronchoscopy_now@@diagnostic Bool) ;; {"when_to_set_to_true":"Set to true if the bronchoscopy the patient is currently undergoing is diagnostic.","when_to_set_to_false":"Set to false if the bronchoscopy the patient is currently undergoing is not diagnostic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the bronchoscopy is diagnostic.","meaning":"Boolean indicating whether the bronchoscopy the patient is currently undergoing is diagnostic."}  ;; "be undergoing diagnostic bronchoscopy"
(declare-const patient_has_provided_consent_for_proteomic_analysis_of_bronchoalveolar_lavage_fluid_supernatant Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided consent for proteomic analysis of bronchoalveolar lavage fluid supernatant.","when_to_set_to_false":"Set to false if the patient has not provided consent for proteomic analysis of bronchoalveolar lavage fluid supernatant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided consent for proteomic analysis of bronchoalveolar lavage fluid supernatant.","meaning":"Boolean indicating whether the patient has provided consent for proteomic analysis of bronchoalveolar lavage fluid supernatant."}  ;; "provide consent for proteomic analysis of bronchoalveolar lavage fluid supernatant"
(declare-const patient_has_provided_consent_for_chart_review_of_patient_characteristics Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided consent for chart review of patient characteristics.","when_to_set_to_false":"Set to false if the patient has not provided consent for chart review of patient characteristics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided consent for chart review of patient characteristics.","meaning":"Boolean indicating whether the patient has provided consent for chart review of patient characteristics."}  ;; "provide consent for chart review of patient characteristics"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable for diagnostic bronchoscopy implies stem variable (if diagnostic, must be bronchoscopy)
(assert
  (! (=> patient_is_undergoing_bronchoscopy_now@@diagnostic
         patient_is_undergoing_bronchoscopy_now)
     :named REQ0_AUXILIARY0)) ;; "be undergoing diagnostic bronchoscopy"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: patient must be undergoing diagnostic bronchoscopy
(assert
  (! patient_is_undergoing_bronchoscopy_now@@diagnostic
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "be undergoing diagnostic bronchoscopy"

;; Component 1: patient must provide consent for proteomic analysis of BAL fluid supernatant
(assert
  (! patient_has_provided_consent_for_proteomic_analysis_of_bronchoalveolar_lavage_fluid_supernatant
     :named REQ0_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "provide consent for proteomic analysis of bronchoalveolar lavage fluid supernatant"

;; Component 2: patient must provide consent for chart review of patient characteristics
(assert
  (! patient_has_provided_consent_for_chart_review_of_patient_characteristics
     :named REQ0_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "provide consent for chart review of patient characteristics"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const guardian_provides_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if a guardian of the patient currently provides consent.","when_to_set_to_false":"Set to false if a guardian of the patient currently does not provide consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a guardian of the patient currently provides consent.","meaning":"Boolean indicating whether a guardian of the patient currently provides consent."}  ;; "have a guardian who provides consent"
(declare-const parent_provides_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if a parent of the patient currently provides consent.","when_to_set_to_false":"Set to false if a parent of the patient currently does not provide consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a parent of the patient currently provides consent.","meaning":"Boolean indicating whether a parent of the patient currently provides consent."}  ;; "have a parent who provides consent"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "a child with age ≤ 17 years"

;; ===================== Constraint Assertions (REQ 1) =====================
;; If the patient is a child (age ≤ 17), then must have a parent or guardian who provides consent
(assert
  (! (or (> patient_age_value_recorded_now_in_years 17)
         (or parent_provides_consent_now guardian_provides_consent_now))
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is a child with age ≤ 17 years, the patient must have a parent who provides consent OR have a guardian who provides consent"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const legally_authorized_representative_provides_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's legally authorized representative currently provides consent.","when_to_set_to_false":"Set to false if the patient's legally authorized representative does not currently provide consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's legally authorized representative currently provides consent.","meaning":"Boolean indicating whether the patient's legally authorized representative currently provides consent."}  ;; "must have a legally authorized representative who provides consent"
(declare-const patient_is_unable_to_provide_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to provide consent.","when_to_set_to_false":"Set to false if the patient is currently able to provide consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to provide consent.","meaning":"Boolean indicating whether the patient is currently unable to provide consent."}  ;; "an adult who is unable to provide consent"

;; ===================== Constraint Assertions (REQ 2) =====================
;; If the patient is an adult (age >= 18) and is unable to provide consent, then a legally authorized representative must provide consent
(assert
  (! (or (not (and (>= patient_age_value_recorded_now_in_years 18.0)
                   patient_is_unable_to_provide_consent_now))
         legally_authorized_representative_provides_consent_now)
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is an adult who is unable to provide consent, the patient must have a legally authorized representative who provides consent"
