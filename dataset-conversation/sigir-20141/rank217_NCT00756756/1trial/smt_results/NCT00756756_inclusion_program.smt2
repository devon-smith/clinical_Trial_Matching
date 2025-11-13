;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_acute_myocardial_infarction_of_anterior_wall_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an anterior wall acute myocardial infarction at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had an anterior wall acute myocardial infarction at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an anterior wall acute myocardial infarction.","meaning":"Boolean indicating whether the patient has ever had an anterior wall acute myocardial infarction in their history."}  ;; "To be included, the patient must have had a first anterior myocardial infarction."
(declare-const patient_has_finding_of_acute_myocardial_infarction_of_anterior_wall_inthehistory@@first_occurrence Bool) ;; {"when_to_set_to_true":"Set to true if the anterior wall acute myocardial infarction in the patient's history is the first occurrence.","when_to_set_to_false":"Set to false if the anterior wall acute myocardial infarction in the patient's history is not the first occurrence (i.e., there was a prior event).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the anterior wall acute myocardial infarction is the first occurrence.","meaning":"Boolean indicating whether the anterior wall acute myocardial infarction in the patient's history is the first occurrence."}  ;; "To be included, the patient must have had a first anterior myocardial infarction."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_finding_of_acute_myocardial_infarction_of_anterior_wall_inthehistory@@first_occurrence
         patient_has_finding_of_acute_myocardial_infarction_of_anterior_wall_inthehistory)
     :named REQ0_AUXILIARY0)) ;; "To be included, the patient must have had a first anterior myocardial infarction."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (and patient_has_finding_of_acute_myocardial_infarction_of_anterior_wall_inthehistory
          patient_has_finding_of_acute_myocardial_infarction_of_anterior_wall_inthehistory@@first_occurrence)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have had a first anterior myocardial infarction."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_systolic_ventricular_dysfunction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has systolic ventricular dysfunction.","when_to_set_to_false":"Set to false if the patient currently does not have systolic ventricular dysfunction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has systolic ventricular dysfunction.","meaning":"Boolean indicating whether the patient currently has systolic ventricular dysfunction."}  ;; "To be included, the patient must have systolic ventricular dysfunction."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_systolic_ventricular_dysfunction_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have systolic ventricular dysfunction."
