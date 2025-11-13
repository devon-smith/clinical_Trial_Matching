;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_meets_rome_iii_diagnostic_criteria_now Bool) ;; "To be included, the patient must meet the Rome III diagnostic criteria." {"when_to_set_to_true":"Set to true if the patient currently meets all components of the Rome III diagnostic criteria.","when_to_set_to_false":"Set to false if the patient currently does not meet all components of the Rome III diagnostic criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently meets the Rome III diagnostic criteria.","meaning":"Boolean indicating whether the patient currently meets the Rome III diagnostic criteria."}

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_meets_rome_iii_diagnostic_criteria_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must meet the Rome III diagnostic criteria."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_loose_stool_inthepast3months Bool) ;; "loose stools" {"when_to_set_to_true":"Set to true if the patient has had at least one episode of loose stool within the past 3 months.","when_to_set_to_false":"Set to false if the patient has not had any episodes of loose stool within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had loose stool within the past 3 months.","meaning":"Boolean indicating whether the patient has had loose stool within the past 3 months."}
(declare-const patient_has_finding_of_mushy_stool_inthepast3months Bool) ;; "mushy stools" {"when_to_set_to_true":"Set to true if the patient has had at least one episode of mushy stool within the past 3 months.","when_to_set_to_false":"Set to false if the patient has not had any episodes of mushy stool within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had mushy stool within the past 3 months.","meaning":"Boolean indicating whether the patient has had mushy stool within the past 3 months."}
(declare-const patient_has_finding_of_liquid_stool_inthepast3months Bool) ;; "watery stools" {"when_to_set_to_true":"Set to true if the patient has had at least one episode of watery (liquid) stool within the past 3 months.","when_to_set_to_false":"Set to false if the patient has not had any episodes of watery (liquid) stool within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had watery (liquid) stool within the past 3 months.","meaning":"Boolean indicating whether the patient has had watery (liquid) stool within the past 3 months."}

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have had (at least one of the following (loose stools OR mushy stools OR watery stools)) within the last 3 months.
(assert
  (! (or patient_has_finding_of_loose_stool_inthepast3months
         patient_has_finding_of_mushy_stool_inthepast3months
         patient_has_finding_of_liquid_stool_inthepast3months)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have had (at least one of the following (loose stools OR mushy stools OR watery stools)) within the last 3 months."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_abdominal_discomfort_inthehistory Bool) ;; "abdominal discomfort" {"when_to_set_to_true":"Set to true if the patient has had abdominal discomfort at any time in the past, regardless of menstrual status.","when_to_set_to_false":"Set to false if the patient has never had abdominal discomfort in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had abdominal discomfort in the past.","meaning":"Boolean indicating whether the patient has had abdominal discomfort at any time in the past."}
(declare-const patient_has_finding_of_abdominal_discomfort_inthehistory@@occurred_during_non_menstrual_period Bool) ;; "abdominal discomfort during the non-menstrual period" {"when_to_set_to_true":"Set to true if the patient's abdominal discomfort occurred during a non-menstrual period.","when_to_set_to_false":"Set to false if the patient's abdominal discomfort did not occur during a non-menstrual period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abdominal discomfort occurred during a non-menstrual period.","meaning":"Boolean indicating whether the patient's abdominal discomfort occurred during a non-menstrual period."}
(declare-const patient_has_finding_of_abdominal_pain_inthehistory Bool) ;; "abdominal pain" {"when_to_set_to_true":"Set to true if the patient has had abdominal pain at any time in the past, regardless of menstrual status.","when_to_set_to_false":"Set to false if the patient has never had abdominal pain in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had abdominal pain in the past.","meaning":"Boolean indicating whether the patient has had abdominal pain at any time in the past."}
(declare-const patient_has_finding_of_abdominal_pain_inthehistory@@occurred_during_non_menstrual_period Bool) ;; "abdominal pain during the non-menstrual period" {"when_to_set_to_true":"Set to true if the patient's abdominal pain occurred during a non-menstrual period.","when_to_set_to_false":"Set to false if the patient's abdominal pain did not occur during a non-menstrual period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abdominal pain occurred during a non-menstrual period.","meaning":"Boolean indicating whether the patient's abdominal pain occurred during a non-menstrual period."}

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for abdominal discomfort implies the stem variable
(assert
  (! (=> patient_has_finding_of_abdominal_discomfort_inthehistory@@occurred_during_non_menstrual_period
         patient_has_finding_of_abdominal_discomfort_inthehistory)
     :named REQ2_AUXILIARY0)) ;; "abdominal discomfort during the non-menstrual period" implies "abdominal discomfort"

;; Qualifier variable for abdominal pain implies the stem variable
(assert
  (! (=> patient_has_finding_of_abdominal_pain_inthehistory@@occurred_during_non_menstrual_period
         patient_has_finding_of_abdominal_pain_inthehistory)
     :named REQ2_AUXILIARY1)) ;; "abdominal pain during the non-menstrual period" implies "abdominal pain"

;; ===================== Constraint Assertions (REQ 2) =====================
;; To be included, the patient must have had (abdominal discomfort OR abdominal pain) during the non-menstrual period of the patient.
(assert
  (! (or patient_has_finding_of_abdominal_discomfort_inthehistory@@occurred_during_non_menstrual_period
         patient_has_finding_of_abdominal_pain_inthehistory@@occurred_during_non_menstrual_period)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have had (abdominal discomfort OR abdominal pain) during the non-menstrual period of the patient."
