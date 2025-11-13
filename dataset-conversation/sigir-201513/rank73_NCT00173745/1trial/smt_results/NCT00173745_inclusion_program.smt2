;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_cerebral_palsy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cerebral palsy.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cerebral palsy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cerebral palsy.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cerebral palsy."} // "To be included, the patient must have a diagnosis of cerebral palsy."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_cerebral_palsy_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a diagnosis of cerebral palsy."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_dribbling_from_mouth_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dribbling from the mouth (drooling).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dribbling from the mouth (drooling).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of dribbling from the mouth (drooling).","meaning":"Boolean indicating whether the patient currently has dribbling from the mouth (drooling)."} // "To be included, the patient must have severe drooling."
(declare-const patient_has_finding_of_dribbling_from_mouth_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dribbling from the mouth (drooling) and the severity is severe.","when_to_set_to_false":"Set to false if the patient currently has dribbling from the mouth (drooling) but the severity is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of the patient's drooling is severe.","meaning":"Boolean indicating whether the patient's current dribbling from the mouth (drooling) is severe."} // "To be included, the patient must have severe drooling."

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_dribbling_from_mouth_now@@severity_severe
         patient_has_finding_of_dribbling_from_mouth_now)
     :named REQ1_AUXILIARY0)) ;; "To be included, the patient must have severe drooling."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_dribbling_from_mouth_now@@severity_severe
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have severe drooling."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 6 years AND aged ≤ 21 years"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must be aged ≥ 6 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 6)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 6 years."

;; Component 1: To be included, the patient must be aged ≤ 21 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 21)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 21 years."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_able_to_understand_requirements_of_study_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to understand the requirements of the study.","when_to_set_to_false":"Set to false if the patient is currently not able to understand the requirements of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to understand the requirements of the study.","meaning":"Boolean indicating whether the patient is currently able to understand the requirements of the study."} // "the patient must be able to understand the requirements of the study"
(declare-const patient_is_able_to_sign_informed_consent_form_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to sign the informed consent form.","when_to_set_to_false":"Set to false if the patient is currently not able to sign the informed consent form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to sign the informed consent form.","meaning":"Boolean indicating whether the patient is currently able to sign the informed consent form."} // "the patient must be able to sign the informed consent form"
(declare-const guardian_is_able_to_understand_requirements_of_study_now Bool) ;; {"when_to_set_to_true":"Set to true if the guardian of the patient is currently able to understand the requirements of the study.","when_to_set_to_false":"Set to false if the guardian of the patient is currently not able to understand the requirements of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the guardian of the patient is currently able to understand the requirements of the study.","meaning":"Boolean indicating whether the guardian of the patient is currently able to understand the requirements of the study."} // "the guardian of the patient is able to understand the requirements of the study"
(declare-const guardian_is_able_to_sign_informed_consent_form_now Bool) ;; {"when_to_set_to_true":"Set to true if the guardian of the patient is currently able to sign the informed consent form.","when_to_set_to_false":"Set to false if the guardian of the patient is currently not able to sign the informed consent form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the guardian of the patient is currently able to sign the informed consent form.","meaning":"Boolean indicating whether the guardian of the patient is currently able to sign the informed consent form."} // "the guardian of the patient is able to sign the informed consent form"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (or (and patient_is_able_to_understand_requirements_of_study_now
              patient_is_able_to_sign_informed_consent_form_now)
         (and guardian_is_able_to_understand_requirements_of_study_now
              guardian_is_able_to_sign_informed_consent_form_now))
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be ((able to understand the requirements of the study AND able to sign the informed consent form) OR (the guardian of the patient is able to understand the requirements of the study AND able to sign the informed consent form))"
