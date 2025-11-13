;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age > 17 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 17)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (age > 17 years)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_stable_angina_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has stable angina pectoris.","when_to_set_to_false":"Set to false if the patient currently does not have stable angina pectoris.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has stable angina pectoris.","meaning":"Boolean indicating whether the patient currently has stable angina pectoris."} // "have stable angina pectoris"
(declare-const patient_has_undergone_coronary_angiography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone coronary angiography at present.","when_to_set_to_false":"Set to false if the patient has not undergone coronary angiography at present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone coronary angiography at present.","meaning":"Boolean indicating whether the patient has undergone coronary angiography at present."} // "coronary angiography"
(declare-const patient_has_undergone_coronary_angiography_now@@elective_referral Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone coronary angiography at present and the procedure was performed as an elective referral.","when_to_set_to_false":"Set to false if the patient has undergone coronary angiography at present but the procedure was not performed as an elective referral.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure was performed as an elective referral.","meaning":"Boolean indicating whether the patient has undergone coronary angiography at present as an elective referral."} // "electively referred for coronary angiography"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_coronary_angiography_now@@elective_referral
         patient_has_undergone_coronary_angiography_now)
     :named REQ1_AUXILIARY0)) ;; "electively referred for coronary angiography" implies "coronary angiography"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Must have stable angina pectoris
(assert
  (! patient_has_finding_of_stable_angina_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have stable angina pectoris"

;; Component 1: Must be electively referred for coronary angiography
(assert
  (! patient_has_undergone_coronary_angiography_now@@elective_referral
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "electively referred for coronary angiography"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_provided_written_informed_consent_to_participate_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent to participate in the study.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent to participate in the study.","meaning":"Boolean indicating whether the patient has provided written informed consent to participate in the study."} // "To be included, the patient must have provided written informed consent to participate in the study."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_provided_written_informed_consent_to_participate_in_study
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have provided written informed consent to participate in the study."
