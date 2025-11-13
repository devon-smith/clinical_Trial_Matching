;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_inguinal_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of inguinal pain (athletic groin pain).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of inguinal pain (athletic groin pain).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of inguinal pain (athletic groin pain).","meaning":"Boolean indicating whether the patient currently has a diagnosis of inguinal pain (athletic groin pain)."}

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_inguinal_pain_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a diagnosis of athletic groin pain."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_is_professional_athlete_in_full_time_training_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a professional athlete and is in full time training.","when_to_set_to_false":"Set to false if the patient is not currently a professional athlete in full time training.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a professional athlete in full time training.","meaning":"Boolean indicating whether the patient is currently a professional athlete in full time training."}

;; patient_has_diagnosis_of_inguinal_pain_now is already declared and should not be redeclared.

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: The patient must be a professional athlete in full time training.
(assert
  (! patient_is_professional_athlete_in_full_time_training_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a professional athlete in full time training."

;; Component 1: The patient must have a diagnosis of groin pain.
(assert
  (! patient_has_diagnosis_of_inguinal_pain_now
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a diagnosis of groin pain."
