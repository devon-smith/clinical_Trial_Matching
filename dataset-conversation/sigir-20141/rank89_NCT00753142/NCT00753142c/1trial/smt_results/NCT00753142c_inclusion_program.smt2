;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_bmi_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's BMI measured now, in kg/m^2.","when_to_set_to_null":"Set to null if the patient's BMI value measured now is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's BMI measured now, in kg/m^2."}  ;; "body mass index (BMI) > 30"
(declare-const patient_has_finding_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has diabetes mellitus."}  ;; "ruled out for diabetes mellitus"
(declare-const patient_has_finding_of_obesity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of obesity.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of obesity.","meaning":"Boolean indicating whether the patient currently has obesity."}  ;; "obese control"
(declare-const patient_has_undergone_75g_ogtt_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a 75 gram oral glucose tolerance test (OGTT) now.","when_to_set_to_false":"Set to false if the patient has not undergone a 75 gram oral glucose tolerance test (OGTT) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a 75 gram oral glucose tolerance test (OGTT) now.","meaning":"Boolean indicating whether the patient has undergone a 75 gram oral glucose tolerance test (OGTT) now."}  ;; "with a 75 gram oral glucose tolerance test"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; BMI > 30 implies obesity (definition in requirement)
(assert
  (! (= patient_has_finding_of_obesity_now
        (> patient_bmi_value_recorded_now_withunit_kg_per_m2 30.0))
     :named REQ0_AUXILIARY0)) ;; "body mass index (BMI) > 30"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Must be obese control (BMI > 30)
(assert
  (! (> patient_bmi_value_recorded_now_withunit_kg_per_m2 30.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "body mass index (BMI) > 30"

;; Component 1: Must be ruled out for diabetes mellitus (with a 75g OGTT)
(assert
  (! (and patient_has_undergone_75g_ogtt_now
          (not patient_has_finding_of_diabetes_mellitus_now))
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "ruled out for diabetes mellitus (with a 75 gram oral glucose tolerance test)"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 18 years AND aged ≤ 65 years"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must be aged ≥ 18 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "aged ≥ 18 years"

;; Component 1: To be included, the patient must be aged ≤ 65 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 65)
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "aged ≤ 65 years"
