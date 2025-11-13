;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."}  ;; "the patient must be a woman"
(declare-const patient_has_finding_of_morbid_obesity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of morbid obesity.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of morbid obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has morbid obesity.","meaning":"Boolean indicating whether the patient currently has morbid obesity."}  ;; "morbid obesity"
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the measured BMI value in kg/m² if a current measurement is available.","when_to_set_to_null":"Set to null if no current BMI measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kg/m²."}  ;; "body mass index"

;; Additional variable for "obesity" (not morbid obesity)
(declare-const patient_has_finding_of_obesity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of obesity (excluding morbid obesity).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of obesity (excluding morbid obesity).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has obesity (excluding morbid obesity).","meaning":"Boolean indicating whether the patient currently has obesity (excluding morbid obesity)."}  ;; "obesity"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; None required for this requirement, as no umbrella or definitional equivalence is stated.

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must be a woman AND (have obesity OR (have morbid obesity AND BMI between 30 and 50))
(assert
  (! (and patient_sex_is_female_now
          (or patient_has_finding_of_obesity_now
              (and patient_has_finding_of_morbid_obesity_now
                   (<= 30.0 patient_body_mass_index_value_recorded_now_withunit_kg_per_m2)
                   (<= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 50.0))))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a woman with obesity or a woman with morbid obesity with a body mass index between 30 and 50."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 25 years"
(declare-const patient_is_undergoing_laparoscopic_bypass_of_stomach_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a laparoscopic bypass of the stomach procedure.","when_to_set_to_false":"Set to false if the patient is not currently undergoing a laparoscopic bypass of the stomach procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing a laparoscopic bypass of the stomach procedure.","meaning":"Boolean indicating whether the patient is currently undergoing a laparoscopic bypass of the stomach procedure."}  ;; "laparoscopic gastric bypass surgery"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: The patient must be aged ≥ 25 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 25)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be aged ≥ 25 years"

;; Component 1: The patient must be undergoing laparoscopic gastric bypass surgery.
(assert
  (! patient_is_undergoing_laparoscopic_bypass_of_stomach_now
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient must be undergoing laparoscopic gastric bypass surgery"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_diabetes_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has diabetes.","when_to_set_to_false":"Set to false if the patient currently does not have diabetes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has diabetes.","meaning":"Boolean indicating whether the patient currently has diabetes."}  ;; "present with diabetes"
(declare-const patient_has_finding_of_metabolic_syndrome_x_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of metabolic syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of metabolic syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of metabolic syndrome.","meaning":"Boolean indicating whether the patient currently has metabolic syndrome."}  ;; "present with metabolic syndrome"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must present with metabolic syndrome OR present with diabetes.
(assert
  (! (or patient_has_finding_of_metabolic_syndrome_x_now
         patient_has_finding_of_diabetes_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must present with metabolic syndrome or present with diabetes."
