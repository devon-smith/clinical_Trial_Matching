;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of chest pain.","meaning":"Boolean indicating whether the patient currently has chest pain."} // "chest pain"
(declare-const patient_has_finding_of_chest_pain_now@@non_acute Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current chest pain is non-acute.","when_to_set_to_false":"Set to false if the patient's current chest pain is acute.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current chest pain is non-acute.","meaning":"Boolean indicating whether the patient's current chest pain is non-acute."} // "non-acute chest pain"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_chest_pain_now@@non_acute
         patient_has_finding_of_chest_pain_now)
     :named REQ0_AUXILIARY0)) ;; "non-acute chest pain" implies "chest pain"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_chest_pain_now@@non_acute
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have non-acute chest pain."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_undergone_cardiac_computed_tomography_for_calcium_scoring_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone cardiac computed tomography for calcium scoring at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone cardiac computed tomography for calcium scoring at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone cardiac computed tomography for calcium scoring.","meaning":"Boolean indicating whether the patient has ever undergone cardiac computed tomography for calcium scoring at any time in their history."} // "computed tomography calcium scoring"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_undergone_cardiac_computed_tomography_for_calcium_scoring_inthehistory
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have undergone computed tomography calcium scoring."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patients_risk_factor_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if risk factor information for the patient is available now.","when_to_set_to_false":"Set to false if risk factor information for the patient is not available now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether risk factor information for the patient is available now.","meaning":"Boolean indicating whether risk factor information for the patient is available now."} // "all relevant risk factor information for the patient must be available"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patients_risk_factor_is_positive_now
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "all relevant risk factor information for the patient must be available"
