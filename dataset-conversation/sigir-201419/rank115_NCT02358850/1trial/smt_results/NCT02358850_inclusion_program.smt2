;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_chronic_tonsillitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chronic tonsillitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chronic tonsillitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic tonsillitis.","meaning":"Boolean indicating whether the patient currently has chronic tonsillitis."} // "chronic tonsillitis"
(declare-const patient_has_finding_of_chronic_tonsillitis_now@@present_as_surgical_indication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chronic tonsillitis is present as a surgical indication.","when_to_set_to_false":"Set to false if the patient's chronic tonsillitis is not present as a surgical indication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether chronic tonsillitis is present as a surgical indication.","meaning":"Boolean indicating whether the patient's chronic tonsillitis is present as a surgical indication."} // "surgical indication of chronic tonsillitis"
(declare-const patient_has_finding_of_snoring_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of snoring.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of snoring.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has snoring.","meaning":"Boolean indicating whether the patient currently has snoring."} // "snoring"
(declare-const patient_has_finding_of_snoring_now@@present_as_surgical_indication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's snoring is present as a surgical indication.","when_to_set_to_false":"Set to false if the patient's snoring is not present as a surgical indication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether snoring is present as a surgical indication.","meaning":"Boolean indicating whether the patient's snoring is present as a surgical indication."} // "surgical indication of snoring"
(declare-const patient_has_finding_of_obstructive_sleep_apnea_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of obstructive sleep apnea syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of obstructive sleep apnea syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has obstructive sleep apnea syndrome.","meaning":"Boolean indicating whether the patient currently has obstructive sleep apnea syndrome."} // "obstructive sleep apnea"
(declare-const patient_has_finding_of_obstructive_sleep_apnea_syndrome_now@@present_as_surgical_indication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's obstructive sleep apnea syndrome is present as a surgical indication.","when_to_set_to_false":"Set to false if the patient's obstructive sleep apnea syndrome is not present as a surgical indication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether obstructive sleep apnea syndrome is present as a surgical indication.","meaning":"Boolean indicating whether the patient's obstructive sleep apnea syndrome is present as a surgical indication."} // "surgical indication of obstructive sleep apnea"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_chronic_tonsillitis_now@@present_as_surgical_indication
         patient_has_finding_of_chronic_tonsillitis_now)
     :named REQ1_AUXILIARY0)) ;; "surgical indication of chronic tonsillitis" implies "chronic tonsillitis"

(assert
  (! (=> patient_has_finding_of_snoring_now@@present_as_surgical_indication
         patient_has_finding_of_snoring_now)
     :named REQ1_AUXILIARY1)) ;; "surgical indication of snoring" implies "snoring"

(assert
  (! (=> patient_has_finding_of_obstructive_sleep_apnea_syndrome_now@@present_as_surgical_indication
         patient_has_finding_of_obstructive_sleep_apnea_syndrome_now)
     :named REQ1_AUXILIARY2)) ;; "surgical indication of obstructive sleep apnea" implies "obstructive sleep apnea"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have (a surgical indication of chronic tonsillitis OR a surgical indication of snoring OR a surgical indication of obstructive sleep apnea).
(assert
  (! (or patient_has_finding_of_chronic_tonsillitis_now@@present_as_surgical_indication
         patient_has_finding_of_snoring_now@@present_as_surgical_indication
         patient_has_finding_of_obstructive_sleep_apnea_syndrome_now@@present_as_surgical_indication)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "a surgical indication of chronic tonsillitis OR a surgical indication of snoring OR a surgical indication of obstructive sleep apnea"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_undergone_tonsillectomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone tonsillectomy at any time in their history, regardless of method or outcome.","when_to_set_to_false":"Set to false if the patient has not undergone tonsillectomy at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone tonsillectomy in their history.","meaning":"Boolean indicating whether the patient has undergone tonsillectomy at any time in their history."} // "must undergo a surgical procedure of tonsillectomy"
(declare-const patient_has_undergone_tonsillectomy_inthehistory@@performed_with_monopolar_cautery Bool) ;; {"when_to_set_to_true":"Set to true if the tonsillectomy was performed with monopolar cautery.","when_to_set_to_false":"Set to false if the tonsillectomy was not performed with monopolar cautery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the tonsillectomy was performed with monopolar cautery.","meaning":"Boolean indicating whether the tonsillectomy was performed with monopolar cautery."} // "tonsillectomy with monopolar cautery"
(declare-const patient_has_undergone_hemostasis_during_tonsillectomy_inthehistory@@performed_with_monopolar_cautery Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone hemostasis during tonsillectomy at any time in their history, and the hemostasis was performed with monopolar cautery.","when_to_set_to_false":"Set to false if the patient has not undergone hemostasis during tonsillectomy at any time in their history, or the hemostasis was not performed with monopolar cautery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone hemostasis during tonsillectomy with monopolar cautery in their history.","meaning":"Boolean indicating whether the patient has undergone hemostasis during tonsillectomy with monopolar cautery at any time in their history."} // "hemostasis with monopolar cautery"
(declare-const patient_has_undergone_hemostasis_during_tonsillectomy_inthehistory@@performed_with_suction_cautery Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone hemostasis during tonsillectomy at any time in their history, and the hemostasis was performed with suction cautery.","when_to_set_to_false":"Set to false if the patient has not undergone hemostasis during tonsillectomy at any time in their history, or the hemostasis was not performed with suction cautery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone hemostasis during tonsillectomy with suction cautery in their history.","meaning":"Boolean indicating whether the patient has undergone hemostasis during tonsillectomy with suction cautery at any time in their history."} // "hemostasis with suction cautery"
(declare-const patient_has_undergone_adenoid_excision_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone adenoidectomy (adenoid excision) at any time in their history, regardless of method or outcome.","when_to_set_to_false":"Set to false if the patient has not undergone adenoidectomy at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone adenoidectomy in their history.","meaning":"Boolean indicating whether the patient has undergone adenoidectomy at any time in their history."} // "adenoidectomy"
(declare-const patient_has_undergone_adenoid_excision_inthehistory@@performed_with_suction_cautery Bool) ;; {"when_to_set_to_true":"Set to true if the adenoidectomy was performed with suction cautery.","when_to_set_to_false":"Set to false if the adenoidectomy was not performed with suction cautery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the adenoidectomy was performed with suction cautery.","meaning":"Boolean indicating whether the adenoidectomy was performed with suction cautery."} // "adenoidectomy with suction cautery"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable for tonsillectomy
(assert
  (! (=> patient_has_undergone_tonsillectomy_inthehistory@@performed_with_monopolar_cautery
         patient_has_undergone_tonsillectomy_inthehistory)
     :named REQ2_AUXILIARY0)) ;; "tonsillectomy with monopolar cautery" implies "tonsillectomy"

;; Qualifier variable implies corresponding stem variable for adenoidectomy
(assert
  (! (=> patient_has_undergone_adenoid_excision_inthehistory@@performed_with_suction_cautery
         patient_has_undergone_adenoid_excision_inthehistory)
     :named REQ2_AUXILIARY1)) ;; "adenoidectomy with suction cautery" implies "adenoidectomy"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Must have tonsillectomy with monopolar cautery AND (hemostasis with monopolar cautery OR hemostasis with suction cautery)
(assert
  (! (and patient_has_undergone_tonsillectomy_inthehistory@@performed_with_monopolar_cautery
          (or patient_has_undergone_hemostasis_during_tonsillectomy_inthehistory@@performed_with_monopolar_cautery
              patient_has_undergone_hemostasis_during_tonsillectomy_inthehistory@@performed_with_suction_cautery))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must undergo tonsillectomy with monopolar cautery AND (hemostasis with monopolar cautery OR hemostasis with suction cautery)"

;; The surgical procedure may also include adenoidectomy with suction cautery (optional, not required for eligibility)
;; No constraint assertion for optional component per guidelines.
