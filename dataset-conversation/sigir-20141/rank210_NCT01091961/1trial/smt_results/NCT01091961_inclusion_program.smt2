;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_taking_angiotensin_converting_enzyme_inhibitor_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an angiotensin converting enzyme inhibitor containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking an angiotensin converting enzyme inhibitor containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking an angiotensin converting enzyme inhibitor containing product.","meaning":"Boolean indicating whether the patient is currently taking an angiotensin converting enzyme inhibitor containing product."}  ;; "angiotensin converting enzyme inhibitor medication"
(declare-const patient_is_taking_angiotensin_ii_receptor_antagonist_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an angiotensin II receptor antagonist containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking an angiotensin II receptor antagonist containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking an angiotensin II receptor antagonist containing product.","meaning":"Boolean indicating whether the patient is currently taking an angiotensin II receptor antagonist containing product."}  ;; "angiotensin receptor blocker medication"

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must currently be taking (an angiotensin converting enzyme inhibitor medication OR an angiotensin receptor blocker medication OR both)
(assert
  (! (or patient_is_taking_angiotensin_converting_enzyme_inhibitor_containing_product_now
         patient_is_taking_angiotensin_ii_receptor_antagonist_containing_product_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_taking_angiotensin_converting_enzyme_inhibitor_containing_product_now@@no_change_in_medication_during_two_weeks_prior_to_study_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if there has been no change in the angiotensin converting enzyme inhibitor containing product during the two weeks prior to study enrollment.","when_to_set_to_false":"Set to false if there has been any change in the angiotensin converting enzyme inhibitor containing product during the two weeks prior to study enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there has been a change in the angiotensin converting enzyme inhibitor containing product during the two weeks prior to study enrollment.","meaning":"Boolean indicating whether there has been no change in the angiotensin converting enzyme inhibitor containing product during the two weeks prior to study enrollment."} ;; "no change in angiotensin converting enzyme inhibitor medication during the two weeks prior to study enrollment"
(declare-const patient_is_taking_angiotensin_ii_receptor_antagonist_containing_product_now@@no_change_in_medication_during_two_weeks_prior_to_study_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if there has been no change in the angiotensin II receptor antagonist containing product during the two weeks prior to study enrollment.","when_to_set_to_false":"Set to false if there has been any change in the angiotensin II receptor antagonist containing product during the two weeks prior to study enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there has been a change in the angiotensin II receptor antagonist containing product during the two weeks prior to study enrollment.","meaning":"Boolean indicating whether there has been no change in the angiotensin II receptor antagonist containing product during the two weeks prior to study enrollment."} ;; "no change in angiotensin receptor blocker medication during the two weeks prior to study enrollment"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_is_taking_angiotensin_converting_enzyme_inhibitor_containing_product_now@@no_change_in_medication_during_two_weeks_prior_to_study_enrollment
         patient_is_taking_angiotensin_converting_enzyme_inhibitor_containing_product_now)
     :named REQ1_AUXILIARY0)) ;; "no change in angiotensin converting enzyme inhibitor medication during the two weeks prior to study enrollment" implies patient is taking the medication

(assert
  (! (=> patient_is_taking_angiotensin_ii_receptor_antagonist_containing_product_now@@no_change_in_medication_during_two_weeks_prior_to_study_enrollment
         patient_is_taking_angiotensin_ii_receptor_antagonist_containing_product_now)
     :named REQ1_AUXILIARY1)) ;; "no change in angiotensin receptor blocker medication during the two weeks prior to study enrollment" implies patient is taking the medication

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have had no change in angiotensin converting enzyme inhibitor medication or angiotensin receptor blocker medication during the two weeks prior to study enrollment.
(assert
  (! (or patient_is_taking_angiotensin_converting_enzyme_inhibitor_containing_product_now@@no_change_in_medication_during_two_weeks_prior_to_study_enrollment
         patient_is_taking_angiotensin_ii_receptor_antagonist_containing_product_now@@no_change_in_medication_during_two_weeks_prior_to_study_enrollment)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "no change in angiotensin converting enzyme inhibitor medication or angiotensin receptor blocker medication during the two weeks prior to study enrollment"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_undergoing_general_anesthesia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently scheduled for or undergoing general anesthesia.","when_to_set_to_false":"Set to false if the patient is not currently scheduled for or undergoing general anesthesia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently scheduled for or undergoing general anesthesia.","meaning":"Boolean indicating whether the patient is currently scheduled for or undergoing general anesthesia."}  ;; "general anesthesia"
(declare-const patient_is_undergoing_regional_anesthesia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently scheduled for or undergoing regional anesthesia.","when_to_set_to_false":"Set to false if the patient is not currently scheduled for or undergoing regional anesthesia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently scheduled for or undergoing regional anesthesia.","meaning":"Boolean indicating whether the patient is currently scheduled for or undergoing regional anesthesia."}  ;; "regional anesthesia"

;; ===================== Constraint Assertions (REQ 2) =====================
;; To be included, the patient must be scheduled for (non-cardiac surgery requiring regional anesthesia) OR (non-cardiac surgery requiring general anesthesia).
(assert
  (! (or patient_is_undergoing_regional_anesthesia_now
         patient_is_undergoing_general_anesthesia_now)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be scheduled for (non-cardiac surgery requiring regional anesthesia) OR (non-cardiac surgery requiring general anesthesia)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const anticipated_length_of_stay_value_withunit_days Real) ;; {"when_to_set_to_value":"Set to the number of days anticipated for the patient's length of stay, as determined prior to admission.","when_to_set_to_null":"Set to null if the anticipated length of stay in days is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the anticipated length of stay for the patient in days."} ;; "anticipated length of stay in days"
(declare-const anticipated_length_of_stay_value_withunit_days@@anticipated_to_be_overnight Bool) ;; {"when_to_set_to_true":"Set to true if the anticipated length of stay includes at least one overnight period.","when_to_set_to_false":"Set to false if the anticipated length of stay does not include any overnight period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the anticipated length of stay includes an overnight period.","meaning":"Boolean indicating whether the anticipated length of stay includes at least one overnight period."} ;; "anticipated to be overnight"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies the anticipated length of stay is at least 1 day
(assert
  (! (=> anticipated_length_of_stay_value_withunit_days@@anticipated_to_be_overnight
         (>= anticipated_length_of_stay_value_withunit_days 1.0))
     :named REQ3_AUXILIARY0)) ;; "minimum overnight anticipated length of stay"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! anticipated_length_of_stay_value_withunit_days@@anticipated_to_be_overnight
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a minimum overnight anticipated length of stay."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "age ≥ 18 years"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be age ≥ 18 years."
