;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_preinfarction_syndrome_now Bool) ;; "unstable angina pectoris" {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of unstable angina pectoris (preinfarction syndrome).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of unstable angina pectoris (preinfarction syndrome).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has unstable angina pectoris (preinfarction syndrome).","meaning":"Boolean indicating whether the patient currently has unstable angina pectoris (preinfarction syndrome)."}

(declare-const patient_has_indication_for_invasive_stratification_now Bool) ;; "an indication for invasive stratification" {"when_to_set_to_true":"Set to true if the patient currently has an indication for invasive stratification.","when_to_set_to_false":"Set to false if the patient currently does not have an indication for invasive stratification.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an indication for invasive stratification.","meaning":"Boolean indicating whether the patient currently has an indication for invasive stratification."}

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: The patient must have unstable angina pectoris.
(assert
  (! patient_has_finding_of_preinfarction_syndrome_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have unstable angina pectoris."

;; Component 1: The patient must have an indication for invasive stratification.
(assert
  (! patient_has_indication_for_invasive_stratification_now
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have an indication for invasive stratification."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_preinfarction_syndrome_now@@without_st_segment_elevation Bool) ;; "Boolean clinical finding indicating the patient currently has preinfarction syndrome (unstable angina, NSTE-ACS) and the finding occurs without ST-segment elevation." {"when_to_set_to_true":"Set to true if the patient currently has preinfarction syndrome (unstable angina, NSTE-ACS) and the finding occurs without ST-segment elevation.","when_to_set_to_false":"Set to false if the patient currently has preinfarction syndrome (unstable angina, NSTE-ACS) but the finding occurs with ST-segment elevation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the finding occurs without ST-segment elevation.","meaning":"Boolean indicating whether the patient's preinfarction syndrome (unstable angina, NSTE-ACS) occurs without ST-segment elevation."}

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the stem variable (if patient has preinfarction syndrome without ST-segment elevation, then patient has preinfarction syndrome)
(assert
  (! (=> patient_has_finding_of_preinfarction_syndrome_now@@without_st_segment_elevation
         patient_has_finding_of_preinfarction_syndrome_now)
     :named REQ1_AUXILIARY0)) ;; "To be included, the patient must have acute coronary syndrome without ST-segment elevation."

;; ===================== Constraint Assertions (REQ 1) =====================
;; Inclusion: patient must have acute coronary syndrome without ST-segment elevation (modeled as preinfarction syndrome/unstable angina without ST-segment elevation)
(assert
  (! patient_has_finding_of_preinfarction_syndrome_now@@without_st_segment_elevation
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have acute coronary syndrome without ST-segment elevation."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_acute_coronary_syndrome_now Bool) ;; "acute coronary syndrome" {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute coronary syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute coronary syndrome.","meaning":"Boolean indicating whether the patient currently has acute coronary syndrome."}
(declare-const patient_has_finding_of_acute_coronary_syndrome_now@@with_st_segment_elevation Bool) ;; "acute coronary syndrome with ST-segment elevation" {"when_to_set_to_true":"Set to true if the patient currently has acute coronary syndrome and the finding occurs with ST-segment elevation.","when_to_set_to_false":"Set to false if the patient currently has acute coronary syndrome but the finding does not occur with ST-segment elevation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the acute coronary syndrome occurs with ST-segment elevation.","meaning":"Boolean indicating whether the patient's acute coronary syndrome occurs with ST-segment elevation."}

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies the stem variable (if patient has ACS with ST-segment elevation, then patient has ACS)
(assert
  (! (=> patient_has_finding_of_acute_coronary_syndrome_now@@with_st_segment_elevation
         patient_has_finding_of_acute_coronary_syndrome_now)
     :named REQ2_AUXILIARY0)) ;; "acute coronary syndrome with ST-segment elevation" implies "acute coronary syndrome"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have acute coronary syndrome with ST-segment elevation.
(assert
  (! patient_has_finding_of_acute_coronary_syndrome_now@@with_st_segment_elevation
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have acute coronary syndrome with ST-segment elevation."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_been_informed_of_nature_of_study Bool) ;; "To be included, the patient must have been informed of the nature of the study." {"when_to_set_to_true":"Set to true if the patient has been informed of the nature of the study.","when_to_set_to_false":"Set to false if the patient has not been informed of the nature of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been informed of the nature of the study.","meaning":"Boolean indicating whether the patient has been informed of the nature of the study."}
(declare-const patient_has_signed_informed_consent Bool) ;; "To be included, the patient must have signed the informed consent." {"when_to_set_to_true":"Set to true if the patient has signed the informed consent.","when_to_set_to_false":"Set to false if the patient has not signed the informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed the informed consent.","meaning":"Boolean indicating whether the patient has signed the informed consent."}

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: The patient must have been informed of the nature of the study.
(assert
  (! patient_has_been_informed_of_nature_of_study
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have been informed of the nature of the study."

;; Component 1: The patient must have signed the informed consent.
(assert
  (! patient_has_signed_informed_consent
     :named REQ3_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have signed the informed consent."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_can_undergo_coronary_angiography_now Bool) ;; "coronary angiography" {"when_to_set_to_true":"Set to true if the patient is currently suitable for undergoing coronary angiography.","when_to_set_to_false":"Set to false if the patient is currently not suitable for undergoing coronary angiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is suitable for undergoing coronary angiography.","meaning":"Boolean indicating whether the patient is currently suitable to undergo coronary angiography."}
(declare-const patient_can_undergo_percutaneous_coronary_intervention_now Bool) ;; "percutaneous coronary intervention" {"when_to_set_to_true":"Set to true if the patient is currently suitable for undergoing percutaneous coronary intervention.","when_to_set_to_false":"Set to false if the patient is currently not suitable for undergoing percutaneous coronary intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is suitable for undergoing percutaneous coronary intervention.","meaning":"Boolean indicating whether the patient is currently suitable to undergo percutaneous coronary intervention."}
(declare-const patient_can_undergo_percutaneous_coronary_intervention_now@@by_radial_access Bool) ;; "percutaneous coronary intervention by radial access" {"when_to_set_to_true":"Set to true if the patient is suitable for percutaneous coronary intervention specifically by radial access.","when_to_set_to_false":"Set to false if the patient is not suitable for percutaneous coronary intervention by radial access.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is suitable for percutaneous coronary intervention by radial access.","meaning":"Boolean indicating whether the patient is suitable for percutaneous coronary intervention by radial access."}
(declare-const patient_can_undergo_percutaneous_coronary_intervention_now@@by_femoral_access Bool) ;; "percutaneous coronary intervention by femoral access" {"when_to_set_to_true":"Set to true if the patient is suitable for percutaneous coronary intervention specifically by femoral access.","when_to_set_to_false":"Set to false if the patient is not suitable for percutaneous coronary intervention by femoral access.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is suitable for percutaneous coronary intervention by femoral access.","meaning":"Boolean indicating whether the patient is suitable for percutaneous coronary intervention by femoral access."}

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_can_undergo_percutaneous_coronary_intervention_now@@by_radial_access
         patient_can_undergo_percutaneous_coronary_intervention_now)
     :named REQ4_AUXILIARY0)) ;; "suitable for percutaneous coronary intervention by radial access" implies "suitable for percutaneous coronary intervention"

(assert
  (! (=> patient_can_undergo_percutaneous_coronary_intervention_now@@by_femoral_access
         patient_can_undergo_percutaneous_coronary_intervention_now)
     :named REQ4_AUXILIARY1)) ;; "suitable for percutaneous coronary intervention by femoral access" implies "suitable for percutaneous coronary intervention"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: To be included, the patient must be (suitable for coronary angiography) OR (suitable for percutaneous coronary intervention by radial access) OR (suitable for percutaneous coronary intervention by femoral access).
(assert
  (! (or patient_can_undergo_coronary_angiography_now
         patient_can_undergo_percutaneous_coronary_intervention_now@@by_radial_access
         patient_can_undergo_percutaneous_coronary_intervention_now@@by_femoral_access)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (suitable for coronary angiography) OR (suitable for percutaneous coronary intervention by radial access) OR (suitable for percutaneous coronary intervention by femoral access)."
