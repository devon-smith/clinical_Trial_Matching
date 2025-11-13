;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_internet_access_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has access to the internet.","when_to_set_to_false":"Set to false if the patient currently does not have access to the internet.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has access to the internet.","meaning":"Boolean indicating whether the patient currently has access to the internet."} ;; "the patient has no internet access"
(declare-const patient_has_access_to_computer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has access to a computer.","when_to_set_to_false":"Set to false if the patient currently does not have access to a computer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has access to a computer.","meaning":"Boolean indicating whether the patient currently has access to a computer."} ;; "the patient has no access to a computer"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_internet_access_now)
    :named REQ0_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has no internet access."

(assert
(! (not patient_has_access_to_computer_now)
    :named REQ0_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has no access to a computer."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_tobacco_smoking_behavior_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tobacco smoking behavior.","when_to_set_to_false":"Set to false if the patient currently does not have tobacco smoking behavior.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tobacco smoking behavior.","meaning":"Boolean indicating whether the patient currently has tobacco smoking behavior."} ;; "smoking"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_tobacco_smoking_behavior_finding_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has tobacco smoking."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient has pregnancy"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient has breast-feeding"
(declare-const patient_is_pregnant_inthefuture12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is planning or expected to become pregnant at any time within the next twelve months.","when_to_set_to_false":"Set to false if the patient is not planning or expected to become pregnant at any time within the next twelve months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is planning or expected to become pregnant within the next twelve months.","meaning":"Boolean value indicating whether the patient is expected to be pregnant at any time within the next twelve months."} ;; "the patient has planning to become pregnant within the next twelve months"
(declare-const patients_breastfeeding_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breast-feeding.","when_to_set_to_false":"Set to false if the patient is currently not breast-feeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently breast-feeding.","meaning":"Boolean indicating whether the patient is currently breast-feeding."} ;; "breast-feeding"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Link observable entity to main variable for breast-feeding
(assert
(! (= patient_is_breastfeeding_now patients_breastfeeding_is_positive_now)
:named REQ2_AUXILIARY0)) ;; "the patient has breast-feeding" and "breast-feeding"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pregnancy."

(assert
(! (not patient_is_breastfeeding_now)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has breast-feeding."

(assert
(! (not patient_is_pregnant_inthefuture12months)
:named REQ2_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has planning to become pregnant within the next twelve months."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a disorder of the cardiovascular system at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a disorder of the cardiovascular system at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a disorder of the cardiovascular system.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of a disorder of the cardiovascular system in their history."} ;; "cardiovascular disease"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of cardiovascular disease."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_type_2_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of type 2 diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of type 2 diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of type 2 diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of type 2 diabetes mellitus."} ;; "type 2 diabetes mellitus"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_type_2_diabetes_mellitus_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has type 2 diabetes mellitus."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_chronic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a chronic disease at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a chronic disease at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a chronic disease.","meaning":"Boolean indicating whether the patient has ever been diagnosed with a chronic disease."} ;; "the patient has chronic disease"
(declare-const patient_has_chronic_disorder_that_may_affect_study_results Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a chronic disorder and that disorder may affect the results of the study.","when_to_set_to_false":"Set to false if the patient does not have a chronic disorder, or if the patient has a chronic disorder but it does not affect the results of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a chronic disorder that may affect the results of the study.","meaning":"Boolean indicating whether the patient has a chronic disorder that may affect the results of the study."} ;; "the patient has chronic disorder that may affect the results of the study"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_diagnosis_of_chronic_disease_inthehistory)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic disease."

(assert
(! (not patient_has_chronic_disorder_that_may_affect_study_results)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic disorder that may affect the results of the study."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_substance_misuse_behavior_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented finding of substance misuse behavior that occurred at any time within the past twelve months.","when_to_set_to_false":"Set to false if the patient does not have a documented finding of substance misuse behavior within the past twelve months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had substance misuse behavior within the past twelve months.","meaning":"Boolean indicating whether the patient has had substance misuse behavior within the past twelve months."} ;; "substance abuse within the past twelve months"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_substance_misuse_behavior_inthepast12months)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has substance abuse within the past twelve months."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_alcohol_intake_finding_value_recorded_now_withunit_units_per_week Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's regular alcohol intake in units per week is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's regular alcohol intake in units per week, recorded now."} ;; "alcohol consumption"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} ;; "for women"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} ;; "for men"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (or
        (and patient_sex_is_male_now
             (> patient_alcohol_intake_finding_value_recorded_now_withunit_units_per_week 21))
        (and patient_sex_is_female_now
             (> patient_alcohol_intake_finding_value_recorded_now_withunit_units_per_week 14))))
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has regular alcohol consumption greater than twenty-one units per week for men) OR (the patient has regular alcohol consumption greater than fourteen units per week for women)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_allergy_to_food_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of allergy to food.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of allergy to food.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of allergy to food.","meaning":"Boolean indicating whether the patient currently has allergy to food."} ;; "allergy to food groups"

(declare-const patient_has_finding_of_allergy_to_food_now@@food_groups_are_those_in_dietary_guidelines Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergy to food involves food groups defined in the dietary guidelines.","when_to_set_to_false":"Set to false if the patient's allergy to food does not involve food groups defined in the dietary guidelines.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's allergy to food involves food groups defined in the dietary guidelines.","meaning":"Boolean indicating whether the patient's allergy to food involves food groups defined in the dietary guidelines."} ;; "allergy to food groups in the dietary guidelines"

(declare-const patient_has_finding_of_intolerance_to_food_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of intolerance to food.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of intolerance to food.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of intolerance to food.","meaning":"Boolean indicating whether the patient currently has intolerance to food."} ;; "intolerance to food groups"

(declare-const patient_has_finding_of_intolerance_to_food_now@@food_groups_are_those_in_dietary_guidelines Bool) ;; {"when_to_set_to_true":"Set to true if the patient's intolerance to food involves food groups defined in the dietary guidelines.","when_to_set_to_false":"Set to false if the patient's intolerance to food does not involve food groups defined in the dietary guidelines.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's intolerance to food involves food groups defined in the dietary guidelines.","meaning":"Boolean indicating whether the patient's intolerance to food involves food groups defined in the dietary guidelines."} ;; "intolerance to food groups in the dietary guidelines"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_allergy_to_food_now@@food_groups_are_those_in_dietary_guidelines
      patient_has_finding_of_allergy_to_food_now)
   :named REQ8_AUXILIARY0)) ;; "allergy to food groups in the dietary guidelines"

(assert
(! (=> patient_has_finding_of_intolerance_to_food_now@@food_groups_are_those_in_dietary_guidelines
      patient_has_finding_of_intolerance_to_food_now)
   :named REQ8_AUXILIARY1)) ;; "intolerance to food groups in the dietary guidelines"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion: patient must NOT have allergy to food groups in the dietary guidelines
(assert
(! (not patient_has_finding_of_allergy_to_food_now@@food_groups_are_those_in_dietary_guidelines)
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has allergy to food groups in the dietary guidelines."

;; Exclusion: patient must NOT have intolerance to food groups in the dietary guidelines
(assert
(! (not patient_has_finding_of_intolerance_to_food_now@@food_groups_are_those_in_dietary_guidelines)
   :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has intolerance to food groups in the dietary guidelines."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_is_exposed_to_nutritional_supplement_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking nutritional supplements.","when_to_set_to_false":"Set to false if the patient is currently not taking nutritional supplements.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking nutritional supplements.","meaning":"Boolean indicating whether the patient is currently exposed to nutritional supplements."} ;; "supplements"
(declare-const patient_is_exposed_to_nutritional_supplement_now@@with_mega_doses_of_nutrients Bool) ;; {"when_to_set_to_true":"Set to true if the nutritional supplements the patient is currently taking are with mega doses of nutrients.","when_to_set_to_false":"Set to false if the nutritional supplements the patient is currently taking are not with mega doses of nutrients.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the nutritional supplements are with mega doses of nutrients.","meaning":"Boolean indicating whether the nutritional supplements the patient is currently taking are with mega doses of nutrients."} ;; "supplements with mega doses of nutrients"
(declare-const patient_is_taking_fish_derived_omega_3_fatty_acid_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking fish-derived omega-3 fatty acid containing products (e.g., fish oils).","when_to_set_to_false":"Set to false if the patient is currently not taking fish-derived omega-3 fatty acid containing products.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking fish-derived omega-3 fatty acid containing products.","meaning":"Boolean indicating whether the patient is currently taking fish-derived omega-3 fatty acid containing products."} ;; "fish oils"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_is_exposed_to_nutritional_supplement_now@@with_mega_doses_of_nutrients
      patient_is_exposed_to_nutritional_supplement_now)
   :named REQ9_AUXILIARY0)) ;; "supplements with mega doses of nutrients"

;; Non-exhaustive example: taking fish oils implies taking supplements with mega doses of nutrients that can impact ischemic heart disease risk markers
(assert
(! (=> patient_is_taking_fish_derived_omega_3_fatty_acid_containing_product_now
      patient_is_exposed_to_nutritional_supplement_now@@with_mega_doses_of_nutrients)
   :named REQ9_AUXILIARY1)) ;; "e.g., fish oils"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_is_exposed_to_nutritional_supplement_now@@with_mega_doses_of_nutrients)
   :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient takes supplements with mega doses of nutrients that can have potential impact on ischemic heart disease risk markers (e.g., fish oils)."
