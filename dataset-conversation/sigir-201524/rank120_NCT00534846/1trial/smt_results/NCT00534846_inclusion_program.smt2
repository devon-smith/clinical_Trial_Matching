;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_pain_of_breast_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pain of breast.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pain of breast.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pain of breast.","meaning":"Boolean indicating whether the patient currently has pain of breast."}  ;; "To be included, the patient must have premenstrual mastalgia."
(declare-const patient_has_finding_of_pain_of_breast_now@@premenstrual_context Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pain of breast occurs in the premenstrual phase.","when_to_set_to_false":"Set to false if the patient's pain of breast does not occur in the premenstrual phase.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pain of breast occurs in the premenstrual phase.","meaning":"Boolean indicating whether the pain of breast occurs in the premenstrual phase."}  ;; "To be included, the patient must have premenstrual mastalgia."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_finding_of_pain_of_breast_now@@premenstrual_context
         patient_has_finding_of_pain_of_breast_now)
     :named REQ0_AUXILIARY0)) ;; "To be included, the patient must have premenstrual mastalgia."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_pain_of_breast_now@@premenstrual_context
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have premenstrual mastalgia."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 20 years AND aged ≤ 45 years"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 20)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 20 years."
(assert
  (! (<= patient_age_value_recorded_now_in_years 45)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 45 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using any form of contraception.","when_to_set_to_false":"Set to false if the patient is currently not using any form of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using contraception.","meaning":"Boolean indicating whether the patient is currently using contraception."}  ;; "To be included, the patient must use reliable non-hormonal contraception."
(declare-const patient_is_using_reliable_non_hormonal_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a reliable non-hormonal method of contraception.","when_to_set_to_false":"Set to false if the patient is currently not using a reliable non-hormonal method of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a reliable non-hormonal method of contraception.","meaning":"Boolean indicating whether the patient is currently using a reliable non-hormonal method of contraception."}  ;; "To be included, the patient must use reliable non-hormonal contraception."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_is_using_reliable_non_hormonal_contraception_now
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must use reliable non-hormonal contraception."
