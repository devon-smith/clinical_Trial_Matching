;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "be > 5 years of age"
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current BMI in kilograms per square meter is available.","when_to_set_to_null":"Set to null if no current BMI measurement in kilograms per square meter is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current BMI in kilograms per square meter."}  ;; "body mass index"
(declare-const patient_body_weight_percentile_for_age_value_recorded_now Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current body weight percentile for age is available.","when_to_set_to_null":"Set to null if no current body weight percentile for age is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body weight percentile for age."}  ;; "weight > 95th percentile for age"
(declare-const patient_body_weight_value_recorded_now_withunit_kg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current body weight in kilograms is available.","when_to_set_to_null":"Set to null if no current body weight measurement in kilograms is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body weight in kilograms."}  ;; "weight"
(declare-const patient_has_finding_of_obesity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of obesity.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of obesity.","meaning":"Boolean indicating whether the patient currently has obesity."}  ;; "obesity"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition of obesity per requirement: (weight > 95th percentile for age) OR (for adults, BMI > 27)
(assert
  (! (= patient_has_finding_of_obesity_now
        (or
          (> patient_body_weight_percentile_for_age_value_recorded_now 95)
          (and (>= patient_age_value_recorded_now_in_years 18)
               (> patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 27))))
     :named REQ0_AUXILIARY0)) ;; "obesity (defined as (weight > 95th percentile for age) OR (for adults, body mass index > 27))"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Must have obesity as defined above
(assert
  (! patient_has_finding_of_obesity_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have obesity (defined as (weight > 95th percentile for age) OR (for adults, body mass index > 27))."

;; Component 1: Must be > 5 years of age
(assert
  (! (> patient_age_value_recorded_now_in_years 5)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be > 5 years of age."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_acanthosis_nigricans_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acanthosis nigricans.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acanthosis nigricans.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of acanthosis nigricans.","meaning":"Boolean indicating whether the patient currently has acanthosis nigricans."}  ;; "acanthosis nigricans"
(declare-const patient_has_finding_of_dyslipidemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dyslipidemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dyslipidemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of dyslipidemia.","meaning":"Boolean indicating whether the patient currently has dyslipidemia."}  ;; "dyslipidemia"
(declare-const patient_has_finding_of_elevated_blood_pressure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of elevated blood pressure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of elevated blood pressure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of elevated blood pressure.","meaning":"Boolean indicating whether the patient currently has elevated blood pressure."}  ;; "elevated blood pressure"
(declare-const patient_has_finding_of_hyperandrogenism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hyperandrogenism.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hyperandrogenism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hyperandrogenism.","meaning":"Boolean indicating whether the patient currently has hyperandrogenism."}  ;; "hyperandrogenism"
(declare-const patient_has_finding_of_insulin_resistance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of insulin resistance.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of insulin resistance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of insulin resistance.","meaning":"Boolean indicating whether the patient currently has insulin resistance."}  ;; "insulin resistance"

(declare-const patient_has_complication_of_insulin_resistance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has at least one complication of insulin resistance, regardless of the specific type.","when_to_set_to_false":"Set to false if the patient currently does not have any complication of insulin resistance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any complication of insulin resistance.","meaning":"Boolean indicating whether the patient currently has at least one complication of insulin resistance."}  ;; "complication of insulin resistance"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples: each example implies the umbrella term, but the umbrella may include other complications not listed.
(assert
  (! (=> patient_has_finding_of_acanthosis_nigricans_now
         patient_has_complication_of_insulin_resistance_now)
     :named REQ1_AUXILIARY0)) ;; "acanthosis nigricans" is a non-exhaustive example of a complication of insulin resistance

(assert
  (! (=> patient_has_finding_of_dyslipidemia_now
         patient_has_complication_of_insulin_resistance_now)
     :named REQ1_AUXILIARY1)) ;; "dyslipidemia" is a non-exhaustive example of a complication of insulin resistance

(assert
  (! (=> patient_has_finding_of_elevated_blood_pressure_now
         patient_has_complication_of_insulin_resistance_now)
     :named REQ1_AUXILIARY2)) ;; "elevated blood pressure" is a non-exhaustive example of a complication of insulin resistance

(assert
  (! (=> patient_has_finding_of_hyperandrogenism_now
         patient_has_complication_of_insulin_resistance_now)
     :named REQ1_AUXILIARY3)) ;; "hyperandrogenism" is a non-exhaustive example of a complication of insulin resistance

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must have at least one complication of insulin resistance (umbrella term)
(assert
  (! patient_has_complication_of_insulin_resistance_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have at least one complication of insulin resistance with non-exhaustive examples (acanthosis nigricans OR dyslipidemia OR elevated blood pressure OR hyperandrogenism)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const sibling_has_finding_of_insulin_resistance_now Bool) ;; {"when_to_set_to_true":"Set to true if any sibling of the index subject currently has insulin resistance.","when_to_set_to_false":"Set to false if no sibling of the index subject currently has insulin resistance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether any sibling of the index subject currently has insulin resistance.","meaning":"Boolean indicating whether any sibling of the index subject currently has insulin resistance."}  ;; "be a sibling of a patient with insulin resistance"
(declare-const parent_has_finding_of_insulin_resistance_now Bool) ;; {"when_to_set_to_true":"Set to true if any parent of the index subject currently has insulin resistance.","when_to_set_to_false":"Set to false if no parent of the index subject currently has insulin resistance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether any parent of the index subject currently has insulin resistance.","meaning":"Boolean indicating whether any parent of the index subject currently has insulin resistance."}  ;; "be a parent of a patient with insulin resistance"
(declare-const patient_has_finding_of_insulin_resistance_now@@documented_by_oral_glucose_tolerance_test Bool) ;; {"when_to_set_to_true":"Set to true if the index subject's insulin resistance is documented by an oral glucose tolerance test.","when_to_set_to_false":"Set to false if the index subject's insulin resistance is not documented by an oral glucose tolerance test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether an oral glucose tolerance test documents the index subject's insulin resistance.","meaning":"Boolean indicating whether the index subject's insulin resistance is documented by an oral glucose tolerance test."}  ;; "documented by oral glucose tolerance test"
(declare-const patient_has_finding_of_insulin_resistance_now@@documented_by_intravenous_glucose_tolerance_test Bool) ;; {"when_to_set_to_true":"Set to true if the index subject's insulin resistance is documented by an intravenous glucose tolerance test.","when_to_set_to_false":"Set to false if the index subject's insulin resistance is not documented by an intravenous glucose tolerance test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether an intravenous glucose tolerance test documents the index subject's insulin resistance.","meaning":"Boolean indicating whether the index subject's insulin resistance is documented by an intravenous glucose tolerance test."}  ;; "documented by intravenous glucose tolerance test"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_insulin_resistance_now@@documented_by_oral_glucose_tolerance_test
         patient_has_finding_of_insulin_resistance_now)
     :named REQ2_AUXILIARY0)) ;; "documented by oral glucose tolerance test" implies "insulin resistance"

(assert
  (! (=> patient_has_finding_of_insulin_resistance_now@@documented_by_intravenous_glucose_tolerance_test
         patient_has_finding_of_insulin_resistance_now)
     :named REQ2_AUXILIARY1)) ;; "documented by intravenous glucose tolerance test" implies "insulin resistance"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: ((be a sibling of a patient with insulin resistance) OR (be a parent of a patient with insulin resistance))
(assert
  (! (or sibling_has_finding_of_insulin_resistance_now
         parent_has_finding_of_insulin_resistance_now)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "be a sibling of a patient with insulin resistance OR be a parent of a patient with insulin resistance"

;; Component 1: insulin resistance in the index subject must be documented by oral glucose tolerance test OR documented by intravenous glucose tolerance test
(assert
  (! (or patient_has_finding_of_insulin_resistance_now@@documented_by_oral_glucose_tolerance_test
         patient_has_finding_of_insulin_resistance_now@@documented_by_intravenous_glucose_tolerance_test)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "insulin resistance in the index subject must be documented by oral glucose tolerance test OR documented by intravenous glucose tolerance test"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_family_history_of_type_2_diabetes_mellitus Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented family history of type II diabetes mellitus (i.e., a biological relative has been diagnosed with type II diabetes mellitus).","when_to_set_to_false":"Set to false if the patient does not have a documented family history of type II diabetes mellitus (i.e., no biological relative has been diagnosed with type II diabetes mellitus).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a family history of type II diabetes mellitus.","meaning":"Boolean indicating whether the patient has a family history of type II diabetes mellitus."}  ;; "must have a family history of type II diabetes mellitus"
(declare-const patient_has_finding_of_type_2_diabetes_mellitus_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the index patient has ever had a documented finding or diagnosis of type 2 diabetes mellitus at any point in their history.","when_to_set_to_false":"Set to false if the index patient has never had a documented finding or diagnosis of type 2 diabetes mellitus at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the index patient has ever had a finding or diagnosis of type 2 diabetes mellitus.","meaning":"Boolean indicating whether the index patient has ever had a finding or diagnosis of type 2 diabetes mellitus in their history."}  ;; "type II diabetes mellitus"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_family_history_of_type_2_diabetes_mellitus
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a family history of type II diabetes mellitus."
