;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male (e.g., female or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is male as currently recorded."} ;; "the patient must be male"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_sex_is_male_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_stable_angina_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has stable angina pectoris.","when_to_set_to_false":"Set to false if the patient currently does not have stable angina pectoris.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has stable angina pectoris.","meaning":"Boolean indicating whether the patient currently has stable angina pectoris."} ;; "the patient must have stable angina pectoris"
(declare-const patient_has_finding_of_exercise_induced_angina_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has exertional angina pectoris (exercise-induced angina).","when_to_set_to_false":"Set to false if the patient currently does not have exertional angina pectoris (exercise-induced angina).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has exertional angina pectoris (exercise-induced angina).","meaning":"Boolean indicating whether the patient currently has exertional angina pectoris (exercise-induced angina)."} ;; "classical history of exertional angina pectoris"
(declare-const patient_has_undergone_exercise_tolerance_test_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone an exercise tolerance test in the past.","when_to_set_to_false":"Set to false if the patient has never undergone an exercise tolerance test in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone an exercise tolerance test in the past.","meaning":"Boolean indicating whether the patient has ever undergone an exercise tolerance test in the past."} ;; "previous diagnostic exercise test"
(declare-const patient_has_undergone_coronary_angiography_in_the_history@@evidence_of_coronary_artery_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient's coronary angiography in the past showed evidence of coronary artery disease.","when_to_set_to_false":"Set to false if the patient's coronary angiography in the past did not show evidence of coronary artery disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's coronary angiography in the past showed evidence of coronary artery disease.","meaning":"Boolean indicating whether the patient's coronary angiography in the past showed evidence of coronary artery disease."} ;; "angiographic evidence of coronary artery disease"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: The patient must have stable angina pectoris.
(assert
  (! patient_has_finding_of_stable_angina_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must have stable angina pectoris"

;; Component 1: The patient must have at least one of the following:
;; - classical history of exertional angina pectoris
;; - previous diagnostic exercise test
;; - angiographic evidence of coronary artery disease
(assert
  (! (or patient_has_finding_of_exercise_induced_angina_now
         patient_has_undergone_exercise_tolerance_test_inthehistory
         patient_has_undergone_coronary_angiography_in_the_history@@evidence_of_coronary_artery_disease)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "at least one of the following: classical history of exertional angina pectoris OR previous diagnostic exercise test OR angiographic evidence of coronary artery disease"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged ≥ 30 years AND aged ≤ 80 years"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 30)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "aged ≥ 30 years"

(assert
  (! (<= patient_age_value_recorded_now_in_years 80)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "aged ≤ 80 years"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_body_weight_value_recorded_now_withunit_kilograms Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body weight in kilograms is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's body weight in kilograms, recorded now."} ;; "weight ≥ 60 kilograms" and "weight ≤ 100 kilograms"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (>= patient_body_weight_value_recorded_now_withunit_kilograms 60.0)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "weight ≥ 60 kilograms"

(assert
  (! (<= patient_body_weight_value_recorded_now_withunit_kilograms 100.0)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "weight ≤ 100 kilograms"
