;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_symptoms_of_angina_pectoris_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of angina pectoris.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of angina pectoris.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of angina pectoris.","meaning":"Boolean indicating whether the patient currently has symptoms of angina pectoris."} // "To be included, the patient must have symptoms of angina pectoris."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_symptoms_of_angina_pectoris_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have symptoms of angina pectoris."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_coronary_artery_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of coronary artery stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of coronary artery stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of coronary artery stenosis.","meaning":"Boolean indicating whether the patient currently has coronary artery stenosis."} // "angiographic evidence of epicardial coronary artery stenosis"
(declare-const patient_has_finding_of_coronary_artery_stenosis_now@@evidenced_by_angiography Bool) ;; {"when_to_set_to_true":"Set to true if the patient's coronary artery stenosis is evidenced by angiography.","when_to_set_to_false":"Set to false if the patient's coronary artery stenosis is not evidenced by angiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether angiography evidences the patient's coronary artery stenosis.","meaning":"Boolean indicating whether the patient's coronary artery stenosis is evidenced by angiography."} // "angiographic evidence"
(declare-const patient_has_finding_of_coronary_artery_stenosis_now@@epicardial_location Bool) ;; {"when_to_set_to_true":"Set to true if the patient's coronary artery stenosis is located in the epicardial coronary arteries.","when_to_set_to_false":"Set to false if the patient's coronary artery stenosis is not located in the epicardial coronary arteries.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the stenosis is located in the epicardial coronary arteries.","meaning":"Boolean indicating whether the patient's coronary artery stenosis is located in the epicardial coronary arteries."} // "epicardial coronary artery stenosis"
(declare-const patient_can_undergo_percutaneous_coronary_intervention_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently eligible or able to undergo percutaneous coronary intervention.","when_to_set_to_false":"Set to false if the patient is currently not eligible or unable to undergo percutaneous coronary intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can undergo percutaneous coronary intervention.","meaning":"Boolean indicating whether the patient can currently undergo percutaneous coronary intervention."} // "percutaneous coronary intervention"
(declare-const patient_can_undergo_percutaneous_coronary_intervention_now@@referred_for_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been referred for percutaneous coronary intervention.","when_to_set_to_false":"Set to false if the patient has not been referred for percutaneous coronary intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been referred for percutaneous coronary intervention.","meaning":"Boolean indicating whether the patient has been referred for percutaneous coronary intervention."} // "referred for percutaneous coronary intervention"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_coronary_artery_stenosis_now@@evidenced_by_angiography
         patient_has_finding_of_coronary_artery_stenosis_now)
     :named REQ1_AUXILIARY0)) ;; "angiographic evidence of coronary artery stenosis"

(assert
  (! (=> patient_has_finding_of_coronary_artery_stenosis_now@@epicardial_location
         patient_has_finding_of_coronary_artery_stenosis_now)
     :named REQ1_AUXILIARY1)) ;; "epicardial coronary artery stenosis"

(assert
  (! (=> patient_can_undergo_percutaneous_coronary_intervention_now@@referred_for_procedure
         patient_can_undergo_percutaneous_coronary_intervention_now)
     :named REQ1_AUXILIARY2)) ;; "referred for percutaneous coronary intervention"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Must have angiographic evidence of epicardial coronary artery stenosis
(assert
  (! (and patient_has_finding_of_coronary_artery_stenosis_now@@evidenced_by_angiography
          patient_has_finding_of_coronary_artery_stenosis_now@@epicardial_location)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "angiographic evidence of epicardial coronary artery stenosis"

;; Component 1: Must be referred for percutaneous coronary intervention
(assert
  (! patient_can_undergo_percutaneous_coronary_intervention_now@@referred_for_procedure
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "referred for percutaneous coronary intervention"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_coronary_artery_stenosis_now@@epicardial_location@@ffr_threshold_met Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of coronary artery stenosis in an epicardial location and the lesion's Fractional Flow Reserve is ≤ 0.80.","when_to_set_to_false":"Set to false if the patient currently has a finding of coronary artery stenosis in an epicardial location and the lesion's Fractional Flow Reserve is > 0.80.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lesion's Fractional Flow Reserve is ≤ 0.80.","meaning":"Boolean indicating whether the patient currently has a finding of coronary artery stenosis in an epicardial location and the lesion's Fractional Flow Reserve is ≤ 0.80."} // "Fractional Flow Reserve ≤ 0.80"
(declare-const patient_has_finding_of_coronary_artery_stenosis_now@@epicardial_location@@flow_limiting Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of coronary artery stenosis in an epicardial location and the lesion is flow-limiting.","when_to_set_to_false":"Set to false if the patient currently has a finding of coronary artery stenosis in an epicardial location and the lesion is not flow-limiting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lesion is flow-limiting.","meaning":"Boolean indicating whether the patient currently has a finding of coronary artery stenosis in an epicardial location and the lesion is flow-limiting."} // "flow limiting lesion"
(declare-const patient_has_finding_of_coronary_artery_stenosis_now@@epicardial_location@@location_is_syntax_trial_segments Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of coronary artery stenosis in an epicardial location and the lesion is located in at least one of the specified SYNTAX trial segments.","when_to_set_to_false":"Set to false if the patient currently has a finding of coronary artery stenosis in an epicardial location and the lesion is not located in any of the specified SYNTAX trial segments.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lesion is located in any of the specified SYNTAX trial segments.","meaning":"Boolean indicating whether the patient currently has a finding of coronary artery stenosis in an epicardial location and the lesion is located in at least one of the specified SYNTAX trial segments."} // "in at least one of the following locations (as defined in SYNTAX trial89): proximal left anterior descending artery OR mid left anterior descending artery OR proximal dominant right coronary artery OR mid dominant right coronary artery OR proximal left circumflex artery OR first obtuse marginal vessel"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; FFR threshold met implies flow-limiting lesion
(assert
  (! (=> patient_has_finding_of_coronary_artery_stenosis_now@@epicardial_location@@ffr_threshold_met
         patient_has_finding_of_coronary_artery_stenosis_now@@epicardial_location@@flow_limiting)
     :named REQ2_AUXILIARY0)) ;; "Fractional Flow Reserve ≤ 0.80" defines flow-limiting lesion

;; ===================== Constraint Assertions (REQ 2) =====================
;; Must have a flow-limiting lesion (FFR ≤ 0.80) in at least one of the specified SYNTAX trial segments
(assert
  (! (and patient_has_finding_of_coronary_artery_stenosis_now@@epicardial_location@@ffr_threshold_met
          patient_has_finding_of_coronary_artery_stenosis_now@@epicardial_location@@location_is_syntax_trial_segments)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a flow limiting lesion (Fractional Flow Reserve ≤ 0.80) in at least one of the following locations (as defined in SYNTAX trial89): proximal left anterior descending artery OR mid left anterior descending artery OR proximal dominant right coronary artery OR mid dominant right coronary artery OR proximal left circumflex artery OR first obtuse marginal vessel."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_taking_beta_adrenergic_receptor_antagonist_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an active prescription for a beta adrenergic receptor antagonist (beta blocker) and is taking it now.","when_to_set_to_false":"Set to false if the patient does not currently have an active prescription for a beta adrenergic receptor antagonist (beta blocker) or is not taking it now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a beta adrenergic receptor antagonist (beta blocker).","meaning":"Boolean indicating whether the patient is currently taking a beta adrenergic receptor antagonist (beta blocker) at the present time."} // "To be included, the patient must have an existing beta blocker prescription."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_is_taking_beta_adrenergic_receptor_antagonist_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have an existing beta blocker prescription."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_undergone_echocardiography_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone echocardiography within the past 12 months.","when_to_set_to_false":"Set to false if the patient has not undergone echocardiography within the past 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone echocardiography within the past 12 months.","meaning":"Boolean indicating whether the patient has undergone echocardiography within the past 12 months."} // "To be included, the patient must have had an echocardiogram performed within the preceding 12 months."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_undergone_echocardiography_inthepast12months
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have had an echocardiogram performed within the preceding 12 months."

(declare-const patient_has_provided_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided consent.","when_to_set_to_false":"Set to false if the patient has not provided consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided consent.","meaning":"Boolean indicating whether the patient has provided consent."} // "To be included, the patient must provide consent."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_provided_consent
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must provide consent."
