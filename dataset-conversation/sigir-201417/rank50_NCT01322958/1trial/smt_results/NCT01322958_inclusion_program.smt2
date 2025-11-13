;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."}  ;; "To be included, the patient must be a female patient."
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as pregnant.","when_to_set_to_false":"Set to false if the patient is currently documented as not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."}  ;; "To be included, the patient must have pregnancy in the first trimester."
(declare-const patient_pregnancy_trimester_value_recorded_now_in_weeks Real) ;; {"when_to_set_to_value":"Set to the number of weeks of gestation if the patient's current pregnancy trimester is documented and the gestational age in weeks is known.","when_to_set_to_null":"Set to null if the gestational age in weeks for the patient's current pregnancy is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of weeks of gestation for the patient's current pregnancy, recorded now."}  ;; "pregnancy in the first trimester"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_sex_is_female_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a female patient."

(assert
  (! (and patient_is_pregnant_now
          (<= patient_pregnancy_trimester_value_recorded_now_in_weeks 13))
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have pregnancy in the first trimester."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_presented_to_emergency_department Bool) ;; {"when_to_set_to_true":"Set to true if the patient has presented to the emergency department.","when_to_set_to_false":"Set to false if the patient has not presented to the emergency department.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has presented to the emergency department.","meaning":"Boolean indicating whether the patient has presented to the emergency department."}  ;; "To be included, the patient must present to the emergency department."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_presented_to_emergency_department
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must present to the emergency department."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_abdominal_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a complaint of abdominal pain.","when_to_set_to_false":"Set to false if the patient currently does not have a complaint of abdominal pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a complaint of abdominal pain.","meaning":"Boolean indicating whether the patient currently has a complaint of abdominal pain."}  ;; "a complaint of abdominal pain"
(declare-const patient_has_finding_of_pain_in_pelvis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a complaint of pelvic pain.","when_to_set_to_false":"Set to false if the patient currently does not have a complaint of pelvic pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a complaint of pelvic pain.","meaning":"Boolean indicating whether the patient currently has a complaint of pelvic pain."}  ;; "a complaint of pelvic pain"
(declare-const patient_has_finding_of_vaginal_bleeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a complaint of vaginal bleeding.","when_to_set_to_false":"Set to false if the patient currently does not have a complaint of vaginal bleeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a complaint of vaginal bleeding.","meaning":"Boolean indicating whether the patient currently has a complaint of vaginal bleeding."}  ;; "a complaint of vaginal bleeding"

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must have (a complaint of abdominal pain OR a complaint of pelvic pain OR a complaint of vaginal bleeding).
(assert
  (! (or patient_has_finding_of_abdominal_pain_now
         patient_has_finding_of_pain_in_pelvis_now
         patient_has_finding_of_vaginal_bleeding_now)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (a complaint of abdominal pain OR a complaint of pelvic pain OR a complaint of vaginal bleeding)."
