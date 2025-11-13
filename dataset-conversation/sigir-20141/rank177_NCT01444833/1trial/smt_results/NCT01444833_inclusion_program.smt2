;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_essential_hypertension_now Bool) ;; "essential hypertension" {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of essential hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of essential hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of essential hypertension.","meaning":"Boolean indicating whether the patient currently has essential hypertension."}

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_essential_hypertension_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have essential hypertension."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_undergoing_angiotensin_converting_enzyme_inhibitor_therapy_now Bool) ;; "angiotensin converting enzyme inhibitor therapy" {"when_to_set_to_true":"Set to true if the patient is currently undergoing angiotensin converting enzyme inhibitor therapy (i.e., actively taking ACE inhibitor therapy at the present time).","when_to_set_to_false":"Set to false if the patient is not currently undergoing angiotensin converting enzyme inhibitor therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing angiotensin converting enzyme inhibitor therapy.","meaning":"Boolean indicating whether the patient is currently undergoing angiotensin converting enzyme inhibitor therapy."}

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must be taking angiotensin converting enzyme inhibitor therapy.
(assert
  (! patient_is_undergoing_angiotensin_converting_enzyme_inhibitor_therapy_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))
