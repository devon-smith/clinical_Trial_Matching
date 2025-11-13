;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_fetal_gestational_age_value_recorded_inthehistory_withunit_weeks Real) ;; {"when_to_set_to_value":"Set to the measured gestational age in weeks at the time of birth if available in the patient's history.","when_to_set_to_null":"Set to null if no gestational age measurement at birth is available or the value is indeterminate.","meaning":"Numeric value representing the gestational age in weeks at the time of birth for the patient, recorded in their history."} // "gestational age"
(declare-const patient_has_finding_of_birth_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a birth event in their history.","when_to_set_to_false":"Set to false if the patient has never had a birth event in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a birth event in their history.","meaning":"Boolean indicating whether the patient has ever had a birth event in their history."} // "birth"
(declare-const patient_has_finding_of_premature_birth_of_newborn_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a premature birth event in their history.","when_to_set_to_false":"Set to false if the patient has never had a premature birth event in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a premature birth event in their history.","meaning":"Boolean indicating whether the patient has ever had a premature birth event in their history."} // "premature birth"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition in the requirement: premature birth is defined as birth at gestational age < 37 weeks
(assert
  (! (= patient_has_finding_of_premature_birth_of_newborn_inthehistory
        (and patient_has_finding_of_birth_inthehistory
             (< patient_fetal_gestational_age_value_recorded_inthehistory_withunit_weeks 37.0)))
     :named REQ0_AUXILIARY0)) ;; "premature birth (defined as birth at gestational age < 37 weeks)"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must have a history of premature birth (defined as birth at gestational age < 37 weeks).
(assert
  (! patient_has_finding_of_premature_birth_of_newborn_inthehistory
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_suspicion_of_pharyngeal_dysphagia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented suspicion of pharyngeal phase dysphagia at any time in their history.","when_to_set_to_false":"Set to false if the patient has no documented suspicion of pharyngeal phase dysphagia at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a suspicion of pharyngeal phase dysphagia.","meaning":"Boolean indicating whether the patient has a suspicion of pharyngeal phase dysphagia at any time in their history."} ;; "suspected pharyngeal phase dysphagia"
(declare-const patient_has_undergone_videofluoroscopy_swallow_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a videofluoroscopic swallow study at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone a videofluoroscopic swallow study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a videofluoroscopic swallow study.","meaning":"Boolean indicating whether the patient has undergone a videofluoroscopic swallow study at any time in their history."} ;; "videofluoroscopic swallow study"
(declare-const patient_has_undergone_videofluoroscopy_swallow_inthehistory@@performed_due_to_suspected_pharyngeal_phase_dysphagia Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a videofluoroscopic swallow study at any time in their history and the procedure was performed due to suspected pharyngeal phase dysphagia.","when_to_set_to_false":"Set to false if the patient has undergone a videofluoroscopic swallow study but not due to suspected pharyngeal phase dysphagia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure was performed due to suspected pharyngeal phase dysphagia.","meaning":"Boolean indicating whether the videofluoroscopic swallow study was performed due to suspected pharyngeal phase dysphagia."} ;; "videofluoroscopic swallow study ... due to suspected pharyngeal phase dysphagia"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_undergone_videofluoroscopy_swallow_inthehistory@@performed_due_to_suspected_pharyngeal_phase_dysphagia
         patient_has_undergone_videofluoroscopy_swallow_inthehistory)
     :named REQ1_AUXILIARY0)) ;; "the patient has undergone a videofluoroscopic swallow study at any time in their history and the procedure was performed due to suspected pharyngeal phase dysphagia" implies "the patient has undergone a videofluoroscopic swallow study at any time in their history"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must have been referred for a videofluoroscopic swallow study due to suspected pharyngeal phase dysphagia
(assert
  (! patient_has_undergone_videofluoroscopy_swallow_inthehistory@@performed_due_to_suspected_pharyngeal_phase_dysphagia
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must have been referred for a videofluoroscopic swallow study due to suspected pharyngeal phase dysphagia"
