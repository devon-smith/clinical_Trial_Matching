;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is male at the current time."} // "a man"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."} // "a woman"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 25 years AND aged ≤ 49 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (a man OR a woman)."

(assert
  (! (>= patient_age_value_recorded_now_in_years 25)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 25 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 49)
     :named REQ0_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≤ 49 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's diastolic blood pressure in millimeters of mercury is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's diastolic blood pressure (mmHg) recorded now."} // "diastolic blood pressure"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: diastolic blood pressure ≥ 78 mmHg
(assert
  (! (>= patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 78.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have diastolic blood pressure ≥ 78 millimeters of mercury."

;; Component 1: diastolic blood pressure ≤ 89 mmHg
(assert
  (! (<= patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 89.0)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have diastolic blood pressure ≤ 89 millimeters of mercury."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease.","when_to_set_to_false":"Set to false if the patient currently does not have any disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease.","meaning":"Boolean indicating whether the patient currently has any disease."} // "disease"
(declare-const patient_has_finding_of_disease_now@@is_major Bool) ;; {"when_to_set_to_true":"Set to true if the disease present in the patient is major.","when_to_set_to_false":"Set to false if the disease present in the patient is not major.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease present in the patient is major.","meaning":"Boolean indicating whether the disease present in the patient is major."} // "major disease"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; If the patient is documented as having a major disease, then the patient must have a disease.
(assert
  (! (=> patient_has_finding_of_disease_now@@is_major
         patient_has_finding_of_disease_now)
     :named REQ2_AUXILIARY0)) ;; "the disease present in the patient is major" implies "the patient currently has any disease"

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must be free of major disease (i.e., must NOT have any major disease now)
(assert
  (! (not patient_has_finding_of_disease_now@@is_major)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be free of major disease"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_on_special_diet_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently on a special diet.","when_to_set_to_false":"Set to false if the patient is currently not on a special diet.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently on a special diet.","meaning":"Boolean indicating whether the patient is currently on a special diet."} // "NOT be on a special diet at entry"
(declare-const patient_is_exposed_to_hypotensive_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to (taking or receiving) antihypertensive medication.","when_to_set_to_false":"Set to false if the patient is currently not exposed to antihypertensive medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to antihypertensive medication.","meaning":"Boolean indicating whether the patient is currently exposed to antihypertensive medication."} // "NOT be on antihypertensive medication at entry"

;; ===================== Constraint Assertions (REQ 3) =====================
;; The patient must NOT be on a special diet at entry AND NOT be on antihypertensive medication at entry.
(assert
  (! (and (not patient_has_finding_of_on_special_diet_now)
          (not patient_is_exposed_to_hypotensive_agent_now))
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION))

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_obese_class_i_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently mildly obese (obesity class I).","when_to_set_to_false":"Set to false if the patient is currently not mildly obese (obesity class I).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently mildly obese (obesity class I).","meaning":"Boolean indicating whether the patient is currently mildly obese (obesity class I)."} // "mildly obese"
(declare-const patient_has_finding_of_obese_class_ii_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently moderately obese (obesity class II).","when_to_set_to_false":"Set to false if the patient is currently not moderately obese (obesity class II).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently moderately obese (obesity class II).","meaning":"Boolean indicating whether the patient is currently moderately obese (obesity class II)."} // "moderately obese"

;; ===================== Constraint Assertions (REQ 4) =====================
;; The patient must be (mildly obese OR moderately obese)
(assert
  (! (or patient_has_finding_of_obese_class_i_now
         patient_has_finding_of_obese_class_ii_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (mildly obese OR moderately obese)."
