;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_patient_immunocompromised_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has immunocompromised status.","when_to_set_to_false":"Set to false if the patient currently does not have immunocompromised status.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has immunocompromised status.","meaning":"Boolean indicating whether the patient currently has immunocompromised status."} // "have immunocompromised status"
(declare-const patient_has_finding_of_invasive_aspergillosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has invasive aspergillosis.","when_to_set_to_false":"Set to false if the patient currently does not have invasive aspergillosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has invasive aspergillosis.","meaning":"Boolean indicating whether the patient currently has invasive aspergillosis."} // "have high risk of invasive aspergillosis"
(declare-const patient_has_finding_of_invasive_aspergillosis_now@@high_risk Bool) ;; {"when_to_set_to_true":"Set to true if the patient is at high risk for invasive aspergillosis.","when_to_set_to_false":"Set to false if the patient is not at high risk for invasive aspergillosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is at high risk for invasive aspergillosis.","meaning":"Boolean indicating whether the patient is at high risk for invasive aspergillosis."} // "have high risk of invasive aspergillosis"
(declare-const patient_has_finding_of_radiologic_infiltrate_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has radiologic infiltrates of the lung.","when_to_set_to_false":"Set to false if the patient currently does not have radiologic infiltrates of the lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has radiologic infiltrates of the lung.","meaning":"Boolean indicating whether the patient currently has radiologic infiltrates of the lung."} // "have lung infiltrates"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_invasive_aspergillosis_now@@high_risk
         patient_has_finding_of_invasive_aspergillosis_now)
     :named REQ0_AUXILIARY0)) ;; "have high risk of invasive aspergillosis" (qualifier implies stem)

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: immunocompromised status
(assert
  (! patient_has_finding_of_patient_immunocompromised_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have immunocompromised status"

;; Component 1: high risk of invasive aspergillosis
(assert
  (! patient_has_finding_of_invasive_aspergillosis_now@@high_risk
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have high risk of invasive aspergillosis"

;; Component 2: lung infiltrates
(assert
  (! patient_has_finding_of_radiologic_infiltrate_of_lung_now
     :named REQ0_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have lung infiltrates"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_provided_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided informed consent.","when_to_set_to_false":"Set to false if the patient has not provided informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided informed consent.","meaning":"Boolean indicating whether the patient has provided informed consent."} // "the patient must provide informed consent"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_provided_informed_consent
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must provide informed consent"
