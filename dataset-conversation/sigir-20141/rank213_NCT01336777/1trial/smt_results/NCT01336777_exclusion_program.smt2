;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not lactating as documented or reported.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."
(assert
  (! (not patient_is_lactating_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is lactating."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease.","when_to_set_to_false":"Set to false if the patient currently does not have any disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease.","meaning":"Boolean indicating whether the patient currently has any disease."} ;; "disease"
(declare-const patient_has_finding_of_disease_now@@affects_major_organs Bool) ;; {"when_to_set_to_true":"Set to true if the disease present in the patient currently affects major organs.","when_to_set_to_false":"Set to false if the disease present in the patient currently does not affect major organs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease present in the patient currently affects major organs.","meaning":"Boolean indicating whether the disease present in the patient currently affects major organs."} ;; "major organ disease"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_now@@affects_major_organs
      patient_has_finding_of_disease_now)
   :named REQ1_AUXILIARY0)) ;; "major organ disease" implies "disease"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_disease_now@@affects_major_organs)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has major organ disease."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_taking_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not taking any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any drug or medicament.","meaning":"Boolean indicating whether the patient is currently taking any drug or medicament."} ;; "drugs"
(declare-const patient_is_taking_drug_or_medicament_now@@influences_insulin_resistance Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament being taken by the patient currently influences insulin resistance.","when_to_set_to_false":"Set to false if the drug or medicament being taken by the patient currently does not influence insulin resistance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament being taken by the patient currently influences insulin resistance.","meaning":"Boolean indicating whether the drug or medicament being taken by the patient currently influences insulin resistance."} ;; "drugs that influence insulin resistance"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_taking_drug_or_medicament_now@@influences_insulin_resistance
      patient_is_taking_drug_or_medicament_now)
:named REQ2_AUXILIARY0)) ;; "drugs that influence insulin resistance" implies "drugs"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_taking_drug_or_medicament_now@@influences_insulin_resistance)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking drugs that influence insulin resistance."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_weight_fluctuates_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of unstable (fluctuating) body weight.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of unstable (fluctuating) body weight.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has unstable (fluctuating) body weight.","meaning":"Boolean indicating whether the patient currently has unstable (fluctuating) body weight."} ;; "unstable body weight"
(declare-const patient_is_participating_in_active_weight_loss_program_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in an active weight loss program.","when_to_set_to_false":"Set to false if the patient is currently not participating in an active weight loss program.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in an active weight loss program.","meaning":"Boolean indicating whether the patient is currently participating in an active weight loss program."} ;; "participating in an active weight loss program"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT have unstable body weight OR be participating in an active weight loss program
(assert
(! (not (or patient_has_finding_of_weight_fluctuates_now
            patient_is_participating_in_active_weight_loss_program_now))
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has unstable body weight) OR (the patient is participating in an active weight loss program)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the measured BMI value (in kg/m^2) if a current measurement is available for the patient.","when_to_set_to_null":"Set to null if no current BMI measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kg/m^2."} ;; "body mass index"
(declare-const study_specified_body_mass_index_range_lower_bound_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the lower bound value in kg/m^2 if the study protocol specifies a BMI range.","when_to_set_to_null":"Set to null if the study protocol does not specify a BMI range or the lower bound is unknown.","meaning":"Numeric value representing the lower bound of the BMI range specified for the study, in kg/m^2."} ;; "body mass index range specified for the study (lower bound)"
(declare-const study_specified_body_mass_index_range_upper_bound_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the upper bound value in kg/m^2 if the study protocol specifies a BMI range.","when_to_set_to_null":"Set to null if the study protocol does not specify a BMI range or the upper bound is unknown.","meaning":"Numeric value representing the upper bound of the BMI range specified for the study, in kg/m^2."} ;; "body mass index range specified for the study (upper bound)"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "the patient is outside the age range specified for the study"
(declare-const study_specified_age_range_lower_bound_in_years Real) ;; {"when_to_set_to_value":"Set to the lower bound value in years if the study protocol specifies an age range.","when_to_set_to_null":"Set to null if the study protocol does not specify an age range or the lower bound is unknown.","meaning":"Numeric value representing the lower bound of the age range specified for the study, in years."} ;; "age range specified for the study (lower bound)"
(declare-const study_specified_age_range_upper_bound_in_years Real) ;; {"when_to_set_to_value":"Set to the upper bound value in years if the study protocol specifies an age range.","when_to_set_to_null":"Set to null if the study protocol does not specify an age range or the upper bound is unknown.","meaning":"Numeric value representing the upper bound of the age range specified for the study, in years."} ;; "age range specified for the study (upper bound)"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient is outside the body mass index range specified for the study
(assert
(! (not (or (< patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 study_specified_body_mass_index_range_lower_bound_withunit_kg_per_m2)
            (> patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 study_specified_body_mass_index_range_upper_bound_withunit_kg_per_m2)))
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is outside the body mass index range specified for the study."

;; Exclusion: patient is outside the age range specified for the study
(assert
(! (not (or (< patient_age_value_recorded_now_in_years study_specified_age_range_lower_bound_in_years)
            (> patient_age_value_recorded_now_in_years study_specified_age_range_upper_bound_in_years)))
   :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is outside the age range specified for the study."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_fasting_blood_glucose_measurement_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current fasting blood glucose measurement in milligrams per deciliter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current fasting blood glucose measurement in milligrams per deciliter."} ;; "fasting blood glucose"

(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus."} ;; "diabetes mellitus"

(declare-const patient_has_diagnosis_of_diabetes_mellitus_now@@diagnosed_by_fasting_blood_glucose_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diabetes mellitus diagnosis is made by fasting blood glucose criteria.","when_to_set_to_false":"Set to false if the patient's diabetes mellitus diagnosis is not made by fasting blood glucose criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diabetes mellitus diagnosis was made by fasting blood glucose criteria.","meaning":"Boolean indicating whether the patient's diabetes mellitus diagnosis is made by fasting blood glucose criteria."} ;; "diabetes mellitus by fasting blood glucose criteria"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_diabetes_mellitus_now@@diagnosed_by_fasting_blood_glucose_criteria
      patient_has_diagnosis_of_diabetes_mellitus_now)
:named REQ5_AUXILIARY0)) ;; "diabetes mellitus by fasting blood glucose criteria"

;; Definition: diabetes mellitus by fasting blood glucose criteria = fasting blood glucose ≥ 126 mg/dL
(assert
(! (= patient_has_diagnosis_of_diabetes_mellitus_now@@diagnosed_by_fasting_blood_glucose_criteria
      (>= patient_fasting_blood_glucose_measurement_value_recorded_now_withunit_milligrams_per_deciliter 126))
:named REQ5_AUXILIARY1)) ;; "diabetes mellitus by fasting blood glucose criteria (fasting blood glucose ≥ 126 milligrams per deciliter)"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_diagnosis_of_diabetes_mellitus_now@@diagnosed_by_fasting_blood_glucose_criteria)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diabetes mellitus by fasting blood glucose criteria (fasting blood glucose ≥ 126 milligrams per deciliter)."
