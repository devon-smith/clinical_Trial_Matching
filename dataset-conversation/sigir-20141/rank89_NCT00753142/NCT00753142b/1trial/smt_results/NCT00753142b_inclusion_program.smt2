;; ===================== Declarations for the inclusion criteria (REQ 0) =====================
(declare-const patient_has_finding_of_obese_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of obesity.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of obesity.","meaning":"Boolean indicating whether the patient currently has the clinical finding of obesity."}  ;; "obese"
(declare-const patient_has_finding_of_obese_now@@has_african_american_ethnicity Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of obesity and is of African American ethnicity.","when_to_set_to_false":"Set to false if the patient currently has the clinical finding of obesity but is not of African American ethnicity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is of African American ethnicity in the context of obesity.","meaning":"Boolean indicating whether the patient currently has the clinical finding of obesity and is of African American ethnicity."}  ;; "obese patient with African American ethnicity"
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the measured BMI value in kg/m² if a numeric measurement of BMI recorded now is available.","when_to_set_to_null":"Set to null if no such BMI measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kg/m²."}  ;; "body mass index (BMI)"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable for obesity with African American ethnicity implies obesity
(assert
  (! (=> patient_has_finding_of_obese_now@@has_african_american_ethnicity
         patient_has_finding_of_obese_now)
     :named REQ0_AUXILIARY0)) ;; "obese patient with African American ethnicity" implies "obese"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: patient must be an obese patient with African American ethnicity
(assert
  (! patient_has_finding_of_obese_now@@has_african_american_ethnicity
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be an obese patient with African American ethnicity."

;; Component 1: patient must have BMI >= 30
(assert
  (! (>= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 30.0)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be a subject with body mass index (BMI) ≥ 30."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 18 years AND aged ≤ 65 years"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must be aged ≥ 18 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; Component 1: To be included, the patient must be aged ≤ 65 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 65)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 65 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const blood_glucose_value_recorded_at_admission_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value of the patient's blood glucose at the time of hospital admission, in mg/dL.","when_to_set_to_null":"Set to null if the blood glucose value at admission is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's blood glucose at admission in mg/dL."}  ;; "blood glucose > 400 mg/dL at admission"
(declare-const patient_has_finding_of_hyperglycemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hyperglycemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hyperglycemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hyperglycemia.","meaning":"Boolean indicating whether the patient currently has hyperglycemia."}  ;; "hyperglycemia"
(declare-const patient_has_finding_of_ketosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of ketosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of ketosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ketosis.","meaning":"Boolean indicating whether the patient currently has ketosis."}  ;; "no evidence of ketosis"
(declare-const patient_is_exposed_to_ketone_body_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to ketone bodies.","when_to_set_to_false":"Set to false if the patient is currently not exposed to ketone bodies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to ketone bodies.","meaning":"Boolean indicating whether the patient is currently exposed to ketone bodies."}  ;; "no evidence of ketones"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Hyperglycemia at admission is defined as blood glucose > 400 mg/dL
(assert
  (! (= patient_has_finding_of_hyperglycemia_now
        (> blood_glucose_value_recorded_at_admission_withunit_mg_per_dl 400.0))
     :named REQ2_AUXILIARY0)) ;; "hyperglycemia (blood glucose > 400 mg/dL)"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Must have been admitted with hyperglycemia (blood glucose > 400 mg/dL)
(assert
  (! patient_has_finding_of_hyperglycemia_now
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have been admitted with hyperglycemia (blood glucose > 400 mg/dL)."

;; Component 1: Must have no evidence of ketosis
(assert
  (! (not patient_has_finding_of_ketosis_now)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have no evidence of ketosis."

;; Component 2: Must have no evidence of ketones
(assert
  (! (not patient_is_exposed_to_ketone_body_now)
     :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have no evidence of ketones."
