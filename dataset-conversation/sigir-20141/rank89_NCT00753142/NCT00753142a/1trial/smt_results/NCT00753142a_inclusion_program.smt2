;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_race_is_african_american_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current race is documented as African American.","when_to_set_to_false":"Set to false if the patient's current race is documented as not African American.","when_to_set_to_null":"Set to null if the patient's current race is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient's current race is African American."} // "To be included, the patient must be an African American subject."
(declare-const patient_has_finding_of_obesity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of obesity.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of obesity.","meaning":"Boolean indicating whether the patient currently has a clinical finding or diagnosis of obesity."} // "To be included, the patient must have obesity."
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current body mass index (BMI) in kg/m2 is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kg/m2."} // "To be included, the patient must have a body mass index (BMI) equal to or greater than 30."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_race_is_african_american_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be an African American subject."
(assert
  (! patient_has_finding_of_obesity_now
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have obesity."
(assert
  (! (>= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 30.0)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a body mass index (BMI) equal to or greater than 30."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years AND aged ≤ 65 years"

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
(declare-const patient_has_finding_of_diabetic_ketoacidosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented clinical finding of diabetic ketoacidosis at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a documented clinical finding of diabetic ketoacidosis in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had diabetic ketoacidosis.","meaning":"Boolean indicating whether the patient has ever had diabetic ketoacidosis in their medical history."} // "To be included, the patient must have a history of diabetic ketoacidosis as defined by the American Diabetes Association (ADA) criteria."
(declare-const patient_has_finding_of_diabetic_ketoacidosis_inthehistory@@defined_by_american_diabetes_association_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of diabetic ketoacidosis is defined according to the American Diabetes Association (ADA) criteria.","when_to_set_to_false":"Set to false if the patient's history of diabetic ketoacidosis does not meet the ADA criteria or is defined by other criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ADA criteria were used to define the patient's history of diabetic ketoacidosis.","meaning":"Boolean indicating whether the patient's history of diabetic ketoacidosis is defined by ADA criteria."} // "To be included, the patient must have a history of diabetic ketoacidosis as defined by the American Diabetes Association (ADA) criteria."

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies the corresponding stem variable
(assert
  (! (=> patient_has_finding_of_diabetic_ketoacidosis_inthehistory@@defined_by_american_diabetes_association_criteria
         patient_has_finding_of_diabetic_ketoacidosis_inthehistory)
     :named REQ2_AUXILIARY0)) ;; If the patient's history of diabetic ketoacidosis is defined by ADA criteria, then the patient must have a history of diabetic ketoacidosis.

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_diabetic_ketoacidosis_inthehistory@@defined_by_american_diabetes_association_criteria
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; The patient must have a history of diabetic ketoacidosis as defined by the American Diabetes Association (ADA) criteria.
