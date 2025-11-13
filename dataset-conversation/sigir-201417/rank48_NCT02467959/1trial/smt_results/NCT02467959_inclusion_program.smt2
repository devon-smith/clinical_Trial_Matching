;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_abdominal_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently presents with abdominal pain.","when_to_set_to_false":"Set to false if the patient currently does not present with abdominal pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently presents with abdominal pain.","meaning":"Boolean indicating whether the patient currently presents with abdominal pain."} // "abdominal pain"
(declare-const patient_has_finding_of_right_lower_abdominal_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently presents with the complaint of right lower abdominal pain.","when_to_set_to_false":"Set to false if the patient currently does not present with the complaint of right lower abdominal pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently presents with the complaint of right lower abdominal pain.","meaning":"Boolean indicating whether the patient currently presents with the complaint of right lower abdominal pain."} // "To be included, the patient must have presented with the complaint of right lower abdominal pain."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Right lower abdominal pain is a specific type of abdominal pain
(assert
  (! (=> patient_has_finding_of_right_lower_abdominal_pain_now
         patient_has_finding_of_abdominal_pain_now)
     :named REQ0_AUXILIARY0)) ;; "To be included, the patient must have presented with the complaint of right lower abdominal pain."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_right_lower_abdominal_pain_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have presented with the complaint of right lower abdominal pain."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_acute_appendicitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute appendicitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute appendicitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of acute appendicitis.","meaning":"Boolean indicating whether the patient currently has acute appendicitis."} // "acute appendicitis"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must have suspected acute appendicitis.
(assert
  (! patient_has_finding_of_acute_appendicitis_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have suspected acute appendicitis."
