;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_dysphagia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had dysphagia documented in their history.","when_to_set_to_false":"Set to false if the patient has never had dysphagia documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had dysphagia in their history.","meaning":"Boolean indicating whether the patient has ever had dysphagia in their history."} // "a history of dysphagia"
(declare-const patient_has_finding_of_dysphagia_inthehistory@@necessitated_dynamic_fluoroscopic_swallow_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of dysphagia necessitated a dynamic fluoroscopic swallow study.","when_to_set_to_false":"Set to false if the patient's history of dysphagia did not necessitate a dynamic fluoroscopic swallow study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of dysphagia necessitated a dynamic fluoroscopic swallow study.","meaning":"Boolean indicating whether the patient's history of dysphagia necessitated a dynamic fluoroscopic swallow study."} // "dysphagia necessitating a dynamic fluoroscopic swallow study"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_dysphagia_inthehistory@@necessitated_dynamic_fluoroscopic_swallow_study
         patient_has_finding_of_dysphagia_inthehistory)
     :named REQ0_AUXILIARY0)) ;; "dysphagia necessitating a dynamic fluoroscopic swallow study" implies "history of dysphagia"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_dysphagia_inthehistory@@necessitated_dynamic_fluoroscopic_swallow_study
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "history of dysphagia necessitating a dynamic fluoroscopic swallow study" must be present

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "older than 18 years"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be older than 18 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_ability_to_complete_comprehensive_dynamic_fluoroscopic_swallow_study_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the ability to complete a comprehensive dynamic fluoroscopic swallow study.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to complete a comprehensive dynamic fluoroscopic swallow study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to complete a comprehensive dynamic fluoroscopic swallow study.","meaning":"Boolean indicating whether the patient currently has the ability to complete a comprehensive dynamic fluoroscopic swallow study."} // "the ability to complete a comprehensive dynamic fluoroscopic swallow study"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_ability_to_complete_comprehensive_dynamic_fluoroscopic_swallow_study_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have the ability to complete a comprehensive dynamic fluoroscopic swallow study."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_ability_to_provide_informed_consent_for_study_participation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the ability to provide informed consent for study participation.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to provide informed consent for study participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to provide informed consent for study participation.","meaning":"Boolean indicating whether the patient currently has the ability to provide informed consent for study participation."} // "the ability to provide informed consent for study participation"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_ability_to_provide_informed_consent_for_study_participation_now
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have the ability to provide informed consent for study participation."
