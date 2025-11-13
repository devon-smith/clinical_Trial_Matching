;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "younger than twenty-one years of age"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 21))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is younger than twenty-one years of age."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body mass index (BMI) is recorded now in kilograms per square meter.","when_to_set_to_null":"Set to null if no BMI measurement is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kilograms per square meter."} ;; "body mass index"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (< patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 25.0))
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has body mass index less than twenty-five point zero kilograms per square meter."

(assert
(! (not (> patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 39.9))
    :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has body mass index greater than thirty-nine point nine kilograms per square meter."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_weight_increased_value_recorded_inthepast6months_withunit_kilograms Real) ;; {"when_to_set_to_value":"Set to the measured value of weight gained by the patient within the past 6 months, in kilograms, if available.","when_to_set_to_null":"Set to null if no measurement of weight gain within the past 6 months is available or the value is indeterminate.","meaning":"Numeric value representing the patient's weight gain within the past 6 months, in kilograms."} ;; "weight gain greater than four point five kilograms within the last six months"
(declare-const patient_weight_decreased_value_recorded_inthepast6months_withunit_kilograms Real) ;; {"when_to_set_to_value":"Set to the measured value of weight lost by the patient within the past 6 months, in kilograms, if available.","when_to_set_to_null":"Set to null if no measurement of weight loss within the past 6 months is available or the value is indeterminate.","meaning":"Numeric value representing the patient's weight loss within the past 6 months, in kilograms."} ;; "weight loss greater than four point five kilograms within the last six months"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not (> patient_weight_increased_value_recorded_inthepast6months_withunit_kilograms 4.5))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has weight gain greater than four point five kilograms within the last six months."

(assert
  (! (not (> patient_weight_decreased_value_recorded_inthepast6months_withunit_kilograms 4.5))
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has weight loss greater than four point five kilograms within the last six months."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_body_fat_observable_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if the patient's body fat percentage is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current body fat."} ;; "body fat less than twenty-five percent as assessed by plethysmography."
(declare-const patient_body_fat_observable_value_recorded_now_withunit_percent@@assessed_by_plethysmography Bool) ;; {"when_to_set_to_true":"Set to true if the patient's body fat percentage measurement was assessed by plethysmography.","when_to_set_to_false":"Set to false if the patient's body fat percentage measurement was not assessed by plethysmography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether plethysmography was used to assess body fat percentage.","meaning":"Boolean indicating whether the patient's body fat percentage measurement was assessed by plethysmography."} ;; "as assessed by plethysmography"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not (and
            patient_body_fat_observable_value_recorded_now_withunit_percent@@assessed_by_plethysmography
            (< patient_body_fat_observable_value_recorded_now_withunit_percent 25)))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has body fat less than twenty-five percent as assessed by plethysmography."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a tobacco smoker.","when_to_set_to_false":"Set to false if the patient is currently not a tobacco smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a tobacco smoker.","meaning":"Boolean indicating whether the patient is currently a tobacco smoker."} ;; "the patient is currently a tobacco smoker"
(declare-const patient_has_finding_of_smoker_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been a tobacco smoker at any time within the past six months.","when_to_set_to_false":"Set to false if the patient has not been a tobacco smoker at any time within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been a tobacco smoker within the past six months.","meaning":"Boolean indicating whether the patient has been a tobacco smoker at any time within the past six months."} ;; "the patient has been a tobacco smoker within the last six months"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (or patient_has_finding_of_smoker_now
            patient_has_finding_of_smoker_inthepast6months))
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is currently a tobacco smoker) OR (the patient has been a tobacco smoker within the last six months)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_been_involved_in_diet_program_within_last_3_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in a diet program at any time within the last three months.","when_to_set_to_false":"Set to false if the patient has not participated in a diet program within the last three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in a diet program within the last three months.","meaning":"Boolean indicating whether the patient has participated in a diet program within the last three months."} ;; "the patient has been involved in a diet program within the last three months"
(declare-const patient_has_been_involved_in_exercise_program_within_last_3_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in an exercise program at any time within the last three months.","when_to_set_to_false":"Set to false if the patient has not participated in an exercise program within the last three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in an exercise program within the last three months.","meaning":"Boolean indicating whether the patient has participated in an exercise program within the last three months."} ;; "the patient has been involved in an exercise program within the last three months"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not (or patient_has_been_involved_in_diet_program_within_last_3_months
              patient_has_been_involved_in_exercise_program_within_last_3_months))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has been involved in a diet program within the last three months) OR (the patient has been involved in an exercise program within the last three months)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_abnormal_blood_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an abnormal blood test profile.","when_to_set_to_false":"Set to false if the patient currently does not have an abnormal blood test profile.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an abnormal blood test profile.","meaning":"Boolean indicating whether the patient currently has an abnormal blood test profile."} ;; "clinically abnormal blood profile"
(declare-const patient_has_finding_of_abnormal_blood_test_now@@identified_by_study_physician_arthur_rosen_doctor_of_medicine Bool) ;; {"when_to_set_to_true":"Set to true if the patient's abnormal blood test profile is specifically identified by the study physician Arthur Rosen, Doctor of Medicine.","when_to_set_to_false":"Set to false if the patient's abnormal blood test profile is not identified by the study physician Arthur Rosen, Doctor of Medicine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal blood test profile is identified by the study physician Arthur Rosen, Doctor of Medicine.","meaning":"Boolean indicating whether the abnormal blood test profile is identified by the study physician Arthur Rosen, Doctor of Medicine."} ;; "as identified by the study physician Arthur Rosen, Doctor of Medicine"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_abnormal_blood_test_now@@identified_by_study_physician_arthur_rosen_doctor_of_medicine
       patient_has_finding_of_abnormal_blood_test_now)
   :named REQ6_AUXILIARY0)) ;; "as identified by the study physician Arthur Rosen, Doctor of Medicine"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_abnormal_blood_test_now@@identified_by_study_physician_arthur_rosen_doctor_of_medicine)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically abnormal blood profile as identified by the study physician Arthur Rosen, Doctor of Medicine."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_taking_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not taking any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any drug or medicament.","meaning":"Boolean indicating whether the patient is currently taking any drug or medicament."} ;; "the patient is currently taking medication"
(declare-const patient_is_taking_drug_or_medicament_now@@known_to_influence_appetite_or_metabolism Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament currently being taken by the patient is known to influence appetite or metabolism.","when_to_set_to_false":"Set to false if the drug or medicament currently being taken by the patient is not known to influence appetite or metabolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament currently being taken by the patient is known to influence appetite or metabolism.","meaning":"Boolean indicating whether the drug or medicament currently being taken by the patient is known to influence appetite or metabolism."} ;; "medication known to influence appetite or metabolism"
(declare-const patient_has_taken_drug_or_medicament_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any drug or medicament within the past three months.","when_to_set_to_false":"Set to false if the patient has not taken any drug or medicament within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any drug or medicament within the past three months.","meaning":"Boolean indicating whether the patient has taken any drug or medicament within the past three months."} ;; "the patient has taken medication within the last three months"
(declare-const patient_has_taken_drug_or_medicament_inthepast3months@@known_to_influence_appetite_or_metabolism Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament taken by the patient within the past three months is known to influence appetite or metabolism.","when_to_set_to_false":"Set to false if the drug or medicament taken by the patient within the past three months is not known to influence appetite or metabolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament taken by the patient within the past three months is known to influence appetite or metabolism.","meaning":"Boolean indicating whether the drug or medicament taken by the patient within the past three months is known to influence appetite or metabolism."} ;; "medication known to influence appetite or metabolism within the last three months"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_taking_drug_or_medicament_now@@known_to_influence_appetite_or_metabolism
      patient_is_taking_drug_or_medicament_now)
    :named REQ7_AUXILIARY0)) ;; "medication known to influence appetite or metabolism" implies "medication"

(assert
(! (=> patient_has_taken_drug_or_medicament_inthepast3months@@known_to_influence_appetite_or_metabolism
      patient_has_taken_drug_or_medicament_inthepast3months)
    :named REQ7_AUXILIARY1)) ;; "medication known to influence appetite or metabolism within the last three months" implies "medication within the last three months"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (or patient_is_taking_drug_or_medicament_now@@known_to_influence_appetite_or_metabolism
            patient_has_taken_drug_or_medicament_inthepast3months@@known_to_influence_appetite_or_metabolism))
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is currently taking medication known to influence appetite or metabolism) OR (the patient has taken medication known to influence appetite or metabolism within the last three months)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of diabetes mellitus."} ;; "clinical diagnosis of diabetes mellitus"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (not patient_has_diagnosis_of_diabetes_mellitus_now)
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinical diagnosis of diabetes mellitus."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_allergy_to_egg_protein_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of allergy to egg protein.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of allergy to egg protein.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of allergy to egg protein.","meaning":"Boolean indicating whether the patient currently has a clinical finding of allergy to egg protein."} ;; "allergy to eggs"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_allergy_to_egg_protein_now)
    :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has allergy to eggs."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_intolerance_to_lactose_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of intolerance to lactose (lactose intolerance).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of intolerance to lactose.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has intolerance to lactose.","meaning":"Boolean indicating whether the patient currently has intolerance to lactose."} ;; "lactose intolerance"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_intolerance_to_lactose_now)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has lactose intolerance."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_diagnosis_of_diverticular_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of diverticulosis (diverticular disease).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of diverticulosis (diverticular disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of diverticulosis (diverticular disease).","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of diverticulosis (diverticular disease)."} ;; "clinical diagnosis of diverticulosis"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_diagnosis_of_diverticular_disease_now)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinical diagnosis of diverticulosis."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_diagnosis_of_diverticulitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of diverticulitis.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of diverticulitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of diverticulitis.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of diverticulitis."} ;; "clinical diagnosis of diverticulitis"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_diagnosis_of_diverticulitis_now)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinical diagnosis of diverticulitis."
