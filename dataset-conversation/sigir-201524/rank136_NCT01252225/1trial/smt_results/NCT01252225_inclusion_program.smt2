;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is male at the current time."} // "male"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."} // "female"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be male or female.
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male or female."

;; Component 1: To be included, the patient must be aged ≥ 18 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const duration_of_cough_in_history_in_weeks Real) ;; {"when_to_set_to_value":"Set to the total number of weeks the patient has had a cough in their history, as documented or reported.","when_to_set_to_null":"Set to null if the duration of cough in the patient's history is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total duration, in weeks, of cough in the patient's history."} // "history of cough for > 8 weeks"
(declare-const patient_has_finding_of_cough_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a cough at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a cough at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a cough.","meaning":"Boolean indicating whether the patient has ever had a cough in their history."} // "history of cough"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (and patient_has_finding_of_cough_inthehistory
          (> duration_of_cough_in_history_in_weeks 8.0))
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "history of cough for > 8 weeks"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_undergone_plain_chest_x_ray_now_outcome_is_normal Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a chest x ray examination now and the outcome is normal.","when_to_set_to_false":"Set to false if the patient has undergone a chest x ray examination now and the outcome is not normal, or if the patient has not undergone the examination now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a chest x ray examination now with a normal outcome.","meaning":"Boolean indicating whether the patient has undergone a chest x ray examination now and the outcome is normal."} // "chest x ray examination"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_undergone_plain_chest_x_ray_now_outcome_is_normal
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a normal chest x ray examination."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_chronic_cough_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a chronic cough documented in their history.","when_to_set_to_false":"Set to false if the patient has never had a chronic cough documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a chronic cough in their history.","meaning":"Boolean indicating whether the patient has ever had a chronic cough documented in their history."} // "chronic cough"
(declare-const patient_has_finding_of_chronic_cough_inthehistory@@resistant_to_treatment_of_specific_triggers Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chronic cough in history is resistant to treatment of specific triggers (i.e., persists despite appropriate treatment of known triggers).","when_to_set_to_false":"Set to false if the patient's chronic cough in history is not resistant to treatment of specific triggers.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic cough in history is resistant to treatment of specific triggers.","meaning":"Boolean indicating whether the patient's chronic cough in history is resistant to treatment of specific triggers."} // "chronic cough resistant to treatment of specific triggers"
(declare-const patient_has_finding_of_cough_inthehistory@@chronic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cough in history is chronic (typically defined as duration > 8 weeks).","when_to_set_to_false":"Set to false if the patient's cough in history is not chronic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cough in history is chronic.","meaning":"Boolean indicating whether the patient's cough in history is chronic."} // "chronic cough"
(declare-const patient_has_finding_of_cough_inthehistory@@idiopathic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chronic cough in history is idiopathic (no identifiable cause).","when_to_set_to_false":"Set to false if the patient's chronic cough in history is not idiopathic (a cause is identified).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic cough in history is idiopathic.","meaning":"Boolean indicating whether the patient's chronic cough in history is idiopathic."} // "chronic idiopathic cough"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_chronic_cough_inthehistory@@resistant_to_treatment_of_specific_triggers
         patient_has_finding_of_chronic_cough_inthehistory)
     :named REQ3_AUXILIARY0)) ;; "chronic cough resistant to treatment of specific triggers" implies "chronic cough"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_cough_inthehistory@@chronic
         patient_has_finding_of_cough_inthehistory)
     :named REQ3_AUXILIARY1)) ;; "chronic cough" implies "cough in history"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_cough_inthehistory@@idiopathic
         patient_has_finding_of_cough_inthehistory@@chronic)
     :named REQ3_AUXILIARY2)) ;; "chronic idiopathic cough" implies "chronic cough"

;; "chronic idiopathic cough" is a chronic cough that is idiopathic
(assert
  (! (= patient_has_finding_of_cough_inthehistory@@idiopathic
        (and patient_has_finding_of_cough_inthehistory@@chronic
             patient_has_finding_of_cough_inthehistory@@idiopathic))
     :named REQ3_AUXILIARY3)) ;; "chronic idiopathic cough" definition

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: To be included, the patient must have (chronic idiopathic cough OR chronic cough resistant to treatment of specific triggers).
(assert
  (! (or patient_has_finding_of_cough_inthehistory@@idiopathic
         patient_has_finding_of_chronic_cough_inthehistory@@resistant_to_treatment_of_specific_triggers)
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "chronic idiopathic cough OR chronic cough resistant to treatment of specific triggers"
