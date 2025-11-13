;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cough as a clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have cough as a clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cough as a clinical finding.","meaning":"Boolean indicating whether the patient currently has cough as a clinical finding."} // "must have cough as the main clinical symptom OR (have cough as the only clinical symptom AND the cough must have persisted for 3-8 weeks)"
(declare-const patient_has_finding_of_cough_now@@main_clinical_symptom Bool) ;; {"when_to_set_to_true":"Set to true if cough is the main clinical symptom among all symptoms the patient currently has.","when_to_set_to_false":"Set to false if cough is not the main clinical symptom among all symptoms the patient currently has.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether cough is the main clinical symptom.","meaning":"Boolean indicating whether cough is the main clinical symptom."} // "must have cough as the main clinical symptom"
(declare-const patient_has_finding_of_cough_now@@only_clinical_symptom Bool) ;; {"when_to_set_to_true":"Set to true if cough is the only clinical symptom the patient currently has.","when_to_set_to_false":"Set to false if the patient currently has other clinical symptoms in addition to cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether cough is the only clinical symptom.","meaning":"Boolean indicating whether cough is the only clinical symptom."} // "have cough as the only clinical symptom"
(declare-const patient_cough_value_recorded_inthehistory_withunit_weeks Real) ;; {"when_to_set_to_value":"Set to the number of weeks if the duration of cough is recorded in the patient's history.","when_to_set_to_null":"Set to null if the duration of cough in weeks is not recorded or is indeterminate.","meaning":"Numeric value representing the duration in weeks that the patient has had cough, as recorded in the patient's history."} // "the cough must have persisted for 3-8 weeks"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_cough_now@@main_clinical_symptom
         patient_has_finding_of_cough_now)
     :named REQ0_AUXILIARY0)) ;; "cough as the main clinical symptom"

(assert
  (! (=> patient_has_finding_of_cough_now@@only_clinical_symptom
         patient_has_finding_of_cough_now)
     :named REQ0_AUXILIARY1)) ;; "cough as the only clinical symptom"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must have cough as the main clinical symptom OR (have cough as the only clinical symptom AND the cough must have persisted for 3-8 weeks).
(assert
  (! (or patient_has_finding_of_cough_now@@main_clinical_symptom
         (and patient_has_finding_of_cough_now@@only_clinical_symptom
              (>= patient_cough_value_recorded_inthehistory_withunit_weeks 3.0)
              (<= patient_cough_value_recorded_inthehistory_withunit_weeks 8.0)))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "must have cough as the main clinical symptom OR (have cough as the only clinical symptom AND the cough must have persisted for 3-8 weeks)"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_undergone_plain_chest_x_ray_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a plain chest X-ray now, regardless of the result.","when_to_set_to_false":"Set to false if the patient has not undergone a plain chest X-ray now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a plain chest X-ray now.","meaning":"Boolean indicating whether the patient has undergone a plain chest X-ray now."} // "chest X-ray"
(declare-const patient_has_undergone_plain_chest_x_ray_now@@reveals_no_noticeable_pathological_changes Bool) ;; {"when_to_set_to_true":"Set to true if the chest X-ray performed now reveals no noticeable pathological changes (i.e., is normal).","when_to_set_to_false":"Set to false if the chest X-ray performed now reveals noticeable pathological changes (i.e., is abnormal).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chest X-ray performed now reveals noticeable pathological changes.","meaning":"Boolean indicating whether the chest X-ray performed now reveals no noticeable pathological changes."} // "chest X-ray that reveals no noticeable pathological changes"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_plain_chest_x_ray_now@@reveals_no_noticeable_pathological_changes
         patient_has_undergone_plain_chest_x_ray_now)
     :named REQ1_AUXILIARY0)) ;; "chest X-ray that reveals no noticeable pathological changes" implies chest X-ray performed

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_undergone_plain_chest_x_ray_now@@reveals_no_noticeable_pathological_changes
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must have a chest X-ray that reveals no noticeable pathological changes"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "18 years old"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: The patient must be 18 years old.
(assert
  (! (= patient_age_value_recorded_now_in_years 18.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be 18 years old."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_taking_angiotensin_converting_enzyme_inhibitor_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an angiotensin-converting enzyme inhibitor containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking an angiotensin-converting enzyme inhibitor containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking an angiotensin-converting enzyme inhibitor containing product.","meaning":"Boolean indicating whether the patient is currently taking an angiotensin-converting enzyme inhibitor containing product."} // "must not be taking an angiotensin-converting enzyme inhibitor"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_is_taking_angiotensin_converting_enzyme_inhibitor_containing_product_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must not be taking an angiotensin-converting enzyme inhibitor"

;; ===================== Declarations for the inclusion criterion (REQ 4) =====================
(declare-const patient_has_joined_programme_voluntarily Bool) ;; {"when_to_set_to_true":"Set to true if the patient has joined the programme voluntarily, without any coercion or external pressure.","when_to_set_to_false":"Set to false if the patient has not joined the programme voluntarily, or if there is evidence of coercion or external pressure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient joined the programme voluntarily.","meaning":"Boolean indicating whether the patient has joined the programme voluntarily."} // "the patient must join the programme voluntarily"
(declare-const patient_is_able_to_attend_examination_sessions Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to attend examination sessions as required by the programme.","when_to_set_to_false":"Set to false if the patient is not able to attend examination sessions as required by the programme.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to attend examination sessions.","meaning":"Boolean indicating whether the patient is able to attend examination sessions."} // "the patient must be able to attend examination sessions"
(declare-const patient_is_able_to_attend_follow_up_sessions Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to attend follow-up sessions as required by the programme.","when_to_set_to_false":"Set to false if the patient is not able to attend follow-up sessions as required by the programme.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to attend follow-up sessions.","meaning":"Boolean indicating whether the patient is able to attend follow-up sessions."} // "the patient must be able to attend follow-up sessions"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: The patient must join the programme voluntarily.
(assert
  (! patient_has_joined_programme_voluntarily
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must join the programme voluntarily"

;; Component 1: The patient must be able to attend examination sessions.
(assert
  (! patient_is_able_to_attend_examination_sessions
     :named REQ4_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be able to attend examination sessions"

;; Component 2: The patient must be able to attend follow-up sessions.
(assert
  (! patient_is_able_to_attend_follow_up_sessions
     :named REQ4_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be able to attend follow-up sessions"
