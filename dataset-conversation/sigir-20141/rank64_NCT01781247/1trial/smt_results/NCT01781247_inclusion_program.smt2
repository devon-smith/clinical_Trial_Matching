;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age > 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (age > 18 years)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_acute_st_segment_elevation_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute ST-segment elevation myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute ST-segment elevation myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of acute ST-segment elevation myocardial infarction.","meaning":"Boolean indicating whether the patient currently has acute ST-segment elevation myocardial infarction."} // "ST-elevated myocardial infarction"
(declare-const patient_has_finding_of_acute_non_st_segment_elevation_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute non-ST-segment elevation myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute non-ST-segment elevation myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of acute non-ST-segment elevation myocardial infarction.","meaning":"Boolean indicating whether the patient currently has acute non-ST-segment elevation myocardial infarction."} // "non-ST-elevated myocardial infarction"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (or patient_has_finding_of_acute_st_segment_elevation_myocardial_infarction_now
         patient_has_finding_of_acute_non_st_segment_elevation_myocardial_infarction_now)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (ST-elevated myocardial infarction) OR (non-ST-elevated myocardial infarction)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_hemodynamically_stable_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of being hemodynamically stable (stable circulatory condition).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of being hemodynamically stable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a stable circulatory condition.","meaning":"Boolean indicating whether the patient is currently hemodynamically stable."} // "a stable circulatory condition"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_hemodynamically_stable_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (a stable circulatory condition)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_pain_value_recorded_now_withunit_numeric_rating_scale Real) ;; {"when_to_set_to_value":"Set to the measured Numeric Rating Scale score for pain if recorded now (i.e., during myocardial infarction).","when_to_set_to_null":"Set to null if no Numeric Rating Scale score for pain is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's current Numeric Rating Scale score for pain."} // "Numeric Rating Scale score for pain during myocardial infarction"
(declare-const patient_pain_value_recorded_now_withunit_numeric_rating_scale@@temporalcontext_during_myocardial_infarction Bool) ;; {"when_to_set_to_true":"Set to true if the Numeric Rating Scale score for pain was recorded during myocardial infarction.","when_to_set_to_false":"Set to false if the Numeric Rating Scale score for pain was not recorded during myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pain score was recorded during myocardial infarction.","meaning":"Boolean indicating whether the Numeric Rating Scale score for pain was recorded during myocardial infarction."} // "pain during myocardial infarction"
(declare-const patient_fear_of_death_value_recorded_now_withunit_numeric_rating_scale Real) ;; {"when_to_set_to_value":"Set to the measured Numeric Rating Scale score for fear of dying if recorded now (i.e., until admission to the coronary care unit).","when_to_set_to_null":"Set to null if no Numeric Rating Scale score for fear of dying is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's current Numeric Rating Scale score for fear of dying."} // "Numeric Rating Scale score for fear of dying until admission to the coronary care unit"
(declare-const patient_fear_of_death_value_recorded_now_withunit_numeric_rating_scale@@temporalcontext_until_admission_to_coronary_care_unit Bool) ;; {"when_to_set_to_true":"Set to true if the Numeric Rating Scale score for fear of dying was recorded until admission to the coronary care unit.","when_to_set_to_false":"Set to false if the Numeric Rating Scale score for fear of dying was not recorded until admission to the coronary care unit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the score was recorded until admission to the coronary care unit.","meaning":"Boolean indicating whether the Numeric Rating Scale score for fear of dying was recorded until admission to the coronary care unit."} // "fear of dying until admission to the coronary care unit"
(declare-const patient_making_sorrows_value_recorded_now_withunit_numeric_rating_scale Real) ;; {"when_to_set_to_value":"Set to the measured Numeric Rating Scale score for making sorrows if recorded now.","when_to_set_to_null":"Set to null if no Numeric Rating Scale score for making sorrows is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's current Numeric Rating Scale score for making sorrows."} // "Numeric Rating Scale score for making sorrows"
(declare-const patient_feeling_powerless_value_recorded_now_withunit_numeric_rating_scale Real) ;; {"when_to_set_to_value":"Set to the measured Numeric Rating Scale score for feeling helpless if recorded now (i.e., when being told about having myocardial infarction).","when_to_set_to_null":"Set to null if no Numeric Rating Scale score for feeling helpless is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's current Numeric Rating Scale score for feeling helpless."} // "Numeric Rating Scale score for feeling helpless when being told about having myocardial infarction"
(declare-const patient_feeling_powerless_value_recorded_now_withunit_numeric_rating_scale@@temporalcontext_when_told_about_myocardial_infarction Bool) ;; {"when_to_set_to_true":"Set to true if the Numeric Rating Scale score for feeling helpless was recorded when being told about having myocardial infarction.","when_to_set_to_false":"Set to false if the Numeric Rating Scale score for feeling helpless was not recorded when being told about having myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the score was recorded when being told about having myocardial infarction.","meaning":"Boolean indicating whether the Numeric Rating Scale score for feeling helpless was recorded when being told about having myocardial infarction."} // "feeling helpless when being told about having myocardial infarction"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_pain_value_recorded_now_withunit_numeric_rating_scale@@temporalcontext_during_myocardial_infarction
         true)
     :named REQ3_AUXILIARY0)) ;; "pain score recorded during myocardial infarction"

(assert
  (! (=> patient_fear_of_death_value_recorded_now_withunit_numeric_rating_scale@@temporalcontext_until_admission_to_coronary_care_unit
         true)
     :named REQ3_AUXILIARY1)) ;; "fear of dying score recorded until admission to coronary care unit"

(assert
  (! (=> patient_feeling_powerless_value_recorded_now_withunit_numeric_rating_scale@@temporalcontext_when_told_about_myocardial_infarction
         true)
     :named REQ3_AUXILIARY2)) ;; "feeling helpless score recorded when being told about myocardial infarction"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: ((pain ≥ 5 during MI AND fear of dying ≥ 5 until CCU) OR (making sorrows ≥ 5) OR (feeling helpless ≥ 5 when told about MI))
(assert
  (! (or
        (and
          (and patient_pain_value_recorded_now_withunit_numeric_rating_scale@@temporalcontext_during_myocardial_infarction
               (>= patient_pain_value_recorded_now_withunit_numeric_rating_scale 5))
          (and patient_fear_of_death_value_recorded_now_withunit_numeric_rating_scale@@temporalcontext_until_admission_to_coronary_care_unit
               (>= patient_fear_of_death_value_recorded_now_withunit_numeric_rating_scale 5)))
        (>= patient_making_sorrows_value_recorded_now_withunit_numeric_rating_scale 5)
        (and patient_feeling_powerless_value_recorded_now_withunit_numeric_rating_scale@@temporalcontext_when_told_about_myocardial_infarction
             (>= patient_feeling_powerless_value_recorded_now_withunit_numeric_rating_scale 5)))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "((pain ≥ 5 during MI AND fear of dying ≥ 5 until CCU) OR (making sorrows ≥ 5) OR (feeling helpless ≥ 5 when told about MI))"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_provided_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent.","meaning":"Boolean indicating whether the patient has provided written informed consent."} // "the patient must provide (written informed consent)"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_provided_written_informed_consent
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must provide (written informed consent)"
