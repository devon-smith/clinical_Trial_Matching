;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const number_of_alcohol_units_consumed_per_day_value_recorded_now_withunit_alcohol_units Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the number of alcohol units the patient currently consumes per day, in units of alcohol units.","when_to_set_to_null":"Set to null if the number of alcohol units consumed per day is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of alcohol units the patient currently consumes per day, in units of alcohol units."} ;; "number of alcohol units consumed per day"
(declare-const number_of_cigarettes_smoked_per_day_value_recorded_now_withunit_cigarettes Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the number of cigarettes the patient currently smokes per day, in units of cigarettes.","when_to_set_to_null":"Set to null if the number of cigarettes smoked per day is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of cigarettes the patient currently smokes per day, in units of cigarettes."} ;; "number of cigarettes smoked per day"
(declare-const patient_has_finding_of_heavy_cigarette_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a heavy cigarette smoker.","when_to_set_to_false":"Set to false if the patient is currently not a heavy cigarette smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a heavy cigarette smoker.","meaning":"Boolean indicating whether the patient is currently a heavy cigarette smoker."} ;; "heavy cigarette smoker"
(declare-const patient_has_finding_of_heavy_drinker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a heavy alcohol consumer.","when_to_set_to_false":"Set to false if the patient is currently not a heavy alcohol consumer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a heavy alcohol consumer.","meaning":"Boolean indicating whether the patient is currently a heavy alcohol consumer."} ;; "heavy alcohol consumer"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} ;; "the patient is female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} ;; "the patient is male"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition: heavy cigarette smoker = number of cigarettes smoked per day > 10
(assert
(! (= patient_has_finding_of_heavy_cigarette_smoker_now
     (> number_of_cigarettes_smoked_per_day_value_recorded_now_withunit_cigarettes 10))
:named REQ0_AUXILIARY0)) ;; "heavy cigarette smoker (number of cigarettes smoked per day > 10)"

;; Definition: heavy alcohol consumer = (male AND >4 units) OR (female AND >3 units)
(assert
(! (= patient_has_finding_of_heavy_drinker_now
     (or (and patient_sex_is_male_now
              (> number_of_alcohol_units_consumed_per_day_value_recorded_now_withunit_alcohol_units 4))
         (and patient_sex_is_female_now
              (> number_of_alcohol_units_consumed_per_day_value_recorded_now_withunit_alcohol_units 3))))
:named REQ0_AUXILIARY1)) ;; "heavy alcohol consumer ((the patient is male AND number of alcohol units consumed per day > 4) OR (the patient is female AND number of alcohol units consumed per day > 3))"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT be a heavy cigarette smoker
(assert
(! (not patient_has_finding_of_heavy_cigarette_smoker_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a heavy cigarette smoker (number of cigarettes smoked per day > 10)."

;; Exclusion: patient must NOT be a heavy alcohol consumer
(assert
(! (not patient_has_finding_of_heavy_drinker_now)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a heavy alcohol consumer ((the patient is male AND number of alcohol units consumed per day > 4) OR (the patient is female AND number of alcohol units consumed per day > 3))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_obesity_of_endocrine_origin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of obesity of endocrine origin.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of obesity of endocrine origin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of obesity of endocrine origin.","meaning":"Boolean indicating whether the patient currently has obesity of endocrine origin."} ;; "obesity of endocrine origin"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_obesity_of_endocrine_origin_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has obesity of endocrine origin."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_chronic_metabolic_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chronic metabolic disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a chronic metabolic disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a chronic metabolic disorder.","meaning":"Boolean indicating whether the patient currently has a chronic metabolic disorder."} ;; "chronic metabolic condition"
(declare-const patient_has_finding_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has diabetes mellitus."} ;; "diabetes mellitus"
(declare-const patient_has_finding_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease of the liver.","when_to_set_to_false":"Set to false if the patient currently does not have a disease of the liver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disease of the liver.","meaning":"Boolean indicating whether the patient currently has a disease of the liver."} ;; "hepatic disease"
(declare-const patient_has_finding_of_gout_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has gout.","when_to_set_to_false":"Set to false if the patient currently does not have gout.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has gout.","meaning":"Boolean indicating whether the patient currently has gout."} ;; "gout"
(declare-const patient_has_finding_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has kidney disease.","when_to_set_to_false":"Set to false if the patient currently does not have kidney disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has kidney disease.","meaning":"Boolean indicating whether the patient currently has kidney disease."} ;; "kidney disease"
(declare-const patient_has_finding_of_disorder_of_thyroid_gland_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the thyroid gland.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the thyroid gland.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the thyroid gland.","meaning":"Boolean indicating whether the patient currently has a disorder of the thyroid gland."} ;; "thyroid disease"
(declare-const patient_has_finding_of_blood_coagulation_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a blood coagulation disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a blood coagulation disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a blood coagulation disorder.","meaning":"Boolean indicating whether the patient currently has a blood coagulation disorder."} ;; "coagulation disease"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_diabetes_mellitus_now
           patient_has_finding_of_disease_of_liver_now
           patient_has_finding_of_gout_now
           patient_has_finding_of_kidney_disease_now
           patient_has_finding_of_disorder_of_thyroid_gland_now
           patient_has_finding_of_blood_coagulation_disorder_now)
       patient_has_finding_of_chronic_metabolic_disorder_now)
   :named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples (diabetes mellitus, hepatic disease, gout, kidney disease, thyroid disease, coagulation disease)."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_chronic_metabolic_disorder_now)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any chronic metabolic condition with non-exhaustive examples (diabetes mellitus, hepatic disease, gout, kidney disease, thyroid disease, coagulation disease)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_disorder_of_gastrointestinal_tract_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disorder of the gastrointestinal tract.","when_to_set_to_false":"Set to false if the patient currently does not have any disorder of the gastrointestinal tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disorder of the gastrointestinal tract.","meaning":"Boolean indicating whether the patient currently has any disorder of the gastrointestinal tract."} ;; "gastrointestinal disorder"

(declare-const patient_has_finding_of_celiac_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has celiac disease.","when_to_set_to_false":"Set to false if the patient currently does not have celiac disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has celiac disease.","meaning":"Boolean indicating whether the patient currently has celiac disease."} ;; "celiac disease"

(declare-const patient_has_finding_of_ulcerative_colitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ulcerative colitis.","when_to_set_to_false":"Set to false if the patient currently does not have ulcerative colitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ulcerative colitis.","meaning":"Boolean indicating whether the patient currently has ulcerative colitis."} ;; "ulcerative colitis"

(declare-const patient_has_finding_of_irritable_bowel_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has irritable bowel syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have irritable bowel syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has irritable bowel syndrome.","meaning":"Boolean indicating whether the patient currently has irritable bowel syndrome."} ;; "irritable bowel syndrome"

(declare-const patient_has_finding_of_crohn_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has Crohn's disease.","when_to_set_to_false":"Set to false if the patient currently does not have Crohn's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Crohn's disease.","meaning":"Boolean indicating whether the patient currently has Crohn's disease."} ;; "Crohn's disease"

(declare-const patient_has_finding_of_chronic_constipation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic constipation.","when_to_set_to_false":"Set to false if the patient currently does not have chronic constipation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic constipation.","meaning":"Boolean indicating whether the patient currently has chronic constipation."} ;; "chronic constipation"

(declare-const patient_has_finding_of_diverticulitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has diverticulitis.","when_to_set_to_false":"Set to false if the patient currently does not have diverticulitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has diverticulitis.","meaning":"Boolean indicating whether the patient currently has diverticulitis."} ;; "diverticulitis"

(declare-const patient_has_history_of_gastric_bezoar Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of gastric bezoar.","when_to_set_to_false":"Set to false if the patient does not have a documented history of gastric bezoar.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of gastric bezoar.","meaning":"Boolean indicating whether the patient has a history of gastric bezoar."} ;; "history of gastric bezoar"

(declare-const patient_has_finding_of_gastrointestinal_stricture_now@@suspected Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a suspected gastrointestinal stricture.","when_to_set_to_false":"Set to false if the patient currently does not have a suspected gastrointestinal stricture.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a suspected gastrointestinal stricture.","meaning":"Boolean indicating whether the patient currently has a suspected gastrointestinal stricture."} ;; "suspected gastrointestinal stricture"

(declare-const patient_has_finding_of_gastrointestinal_fistula_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a gastrointestinal fistula.","when_to_set_to_false":"Set to false if the patient currently does not have a gastrointestinal fistula.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a gastrointestinal fistula.","meaning":"Boolean indicating whether the patient currently has a gastrointestinal fistula."} ;; "gastrointestinal fistula"

(declare-const patient_has_finding_of_gastrointestinal_obstruction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has gastrointestinal obstruction.","when_to_set_to_false":"Set to false if the patient currently does not have gastrointestinal obstruction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has gastrointestinal obstruction.","meaning":"Boolean indicating whether the patient currently has gastrointestinal obstruction."} ;; "gastrointestinal obstruction"

(declare-const patient_has_finding_of_gastrointestinal_obstruction_now@@physiological Bool) ;; {"when_to_set_to_true":"Set to true if the patient's gastrointestinal obstruction is physiological.","when_to_set_to_false":"Set to false if the patient's gastrointestinal obstruction is not physiological.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's gastrointestinal obstruction is physiological.","meaning":"Boolean indicating whether the patient's gastrointestinal obstruction is physiological."} ;; "physiological gastrointestinal obstruction"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_celiac_disease_now
          patient_has_finding_of_ulcerative_colitis_now
          patient_has_finding_of_irritable_bowel_syndrome_now
          patient_has_finding_of_crohn_s_disease_now
          patient_has_finding_of_chronic_constipation_now
          patient_has_finding_of_diverticulitis_now
          patient_has_history_of_gastric_bezoar
          patient_has_finding_of_gastrointestinal_stricture_now@@suspected
          patient_has_finding_of_gastrointestinal_fistula_now
          patient_has_finding_of_gastrointestinal_obstruction_now@@physiological)
    patient_has_finding_of_disorder_of_gastrointestinal_tract_now)
:named REQ3_AUXILIARY0)) ;; "with non-exhaustive examples (celiac disease, ulcerative colitis, irritable bowel syndrome, Crohn's disease, chronic constipation, diverticulitis, history of gastric bezoar, suspected gastrointestinal stricture, gastrointestinal fistula, physiological gastrointestinal obstruction)."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_gastrointestinal_stricture_now@@suspected
       patient_has_finding_of_disorder_of_gastrointestinal_tract_now)
:named REQ3_AUXILIARY1)) ;; "suspected gastrointestinal stricture"

(assert
(! (=> patient_has_finding_of_gastrointestinal_obstruction_now@@physiological
       patient_has_finding_of_gastrointestinal_obstruction_now)
:named REQ3_AUXILIARY2)) ;; "physiological gastrointestinal obstruction"

(assert
(! (=> patient_has_finding_of_gastrointestinal_obstruction_now
       patient_has_finding_of_disorder_of_gastrointestinal_tract_now)
:named REQ3_AUXILIARY3)) ;; "gastrointestinal obstruction"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_disorder_of_gastrointestinal_tract_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any gastrointestinal disorder with non-exhaustive examples (celiac disease, ulcerative colitis, irritable bowel syndrome, Crohn's disease, chronic constipation, diverticulitis, history of gastric bezoar, suspected gastrointestinal stricture, gastrointestinal fistula, physiological gastrointestinal obstruction)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any mental disorder (psychiatric disorder).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of any mental disorder (psychiatric disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of any mental disorder (psychiatric disorder).","meaning":"Boolean indicating whether the patient currently has a diagnosis of any mental disorder (psychiatric disorder)."} ;; "psychiatric disorder"
(declare-const patient_has_diagnosis_of_severe_major_depression_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of severe major depression (severe depressive disorder).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of severe major depression (severe depressive disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of severe major depression (severe depressive disorder).","meaning":"Boolean indicating whether the patient currently has a diagnosis of severe major depression (severe depressive disorder)."} ;; "severe depressive disorder"
(declare-const patient_has_diagnosis_of_bulimia_nervosa_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of bulimia nervosa.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of bulimia nervosa.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of bulimia nervosa.","meaning":"Boolean indicating whether the patient currently has a diagnosis of bulimia nervosa."} ;; "bulimia nervosa"
(declare-const patient_has_diagnosis_of_anorexia_nervosa_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of anorexia nervosa.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of anorexia nervosa.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of anorexia nervosa.","meaning":"Boolean indicating whether the patient currently has a diagnosis of anorexia nervosa."} ;; "anorexia nervosa"
(declare-const patient_has_diagnosis_of_schizophrenia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of schizophrenia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of schizophrenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of schizophrenia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of schizophrenia."} ;; "schizophrenia"
(declare-const patient_has_diagnosis_of_bipolar_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of bipolar disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of bipolar disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of bipolar disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of bipolar disorder."} ;; "bipolar disorder"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_severe_major_depression_now
          patient_has_diagnosis_of_bulimia_nervosa_now
          patient_has_diagnosis_of_anorexia_nervosa_now
          patient_has_diagnosis_of_schizophrenia_now
          patient_has_diagnosis_of_bipolar_disorder_now)
    patient_has_diagnosis_of_mental_disorder_now)
:named REQ4_AUXILIARY0)) ;; "with non-exhaustive examples (severe depressive disorder, bulimia nervosa, anorexia nervosa, schizophrenia, bipolar disorder)."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_mental_disorder_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any psychiatric disorder with non-exhaustive examples (severe depressive disorder, bulimia nervosa, anorexia nervosa, schizophrenia, bipolar disorder)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_undergone_gastrointestinal_procedure_in_the_past_3_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone any gastrointestinal procedure within the past three months.","when_to_set_to_false":"Set to false if the patient has not undergone any gastrointestinal procedure within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone any gastrointestinal procedure within the past three months.","meaning":"Boolean indicating whether the patient has undergone any gastrointestinal procedure within the past three months."} ;; "the patient has had a gastrointestinal procedure in the past three months"
(declare-const patient_has_undergone_operation_on_gastrointestinal_tract_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone any operation on the gastrointestinal tract within the past three months.","when_to_set_to_false":"Set to false if the patient has not undergone any operation on the gastrointestinal tract within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone any operation on the gastrointestinal tract within the past three months.","meaning":"Boolean indicating whether the patient has undergone any operation on the gastrointestinal tract within the past three months."} ;; "the patient has had gastrointestinal surgery in the past three months"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_undergone_gastrointestinal_procedure_in_the_past_3_months)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a gastrointestinal procedure in the past three months."

(assert
(! (not patient_has_undergone_operation_on_gastrointestinal_tract_inthepast3months)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had gastrointestinal surgery in the past three months."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_abnormal_deglutition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of swallowing disorder (abnormal deglutition).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of swallowing disorder (abnormal deglutition).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a swallowing disorder (abnormal deglutition).","meaning":"Boolean indicating whether the patient currently has a swallowing disorder (abnormal deglutition)."} ;; "swallowing disorder"

(declare-const patient_has_finding_of_difficulty_swallowing_food_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of dysphagia to food (difficulty swallowing food).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of dysphagia to food (difficulty swallowing food).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dysphagia to food (difficulty swallowing food).","meaning":"Boolean indicating whether the patient currently has dysphagia to food (difficulty swallowing food)."} ;; "dysphagia to food"

(declare-const patient_has_finding_of_difficulty_swallowing_food_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dysphagia to food (difficulty swallowing food) and the severity is severe.","when_to_set_to_false":"Set to false if the patient currently has dysphagia to food (difficulty swallowing food) but the severity is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of dysphagia to food is severe.","meaning":"Boolean indicating whether the patient currently has severe dysphagia to food (difficulty swallowing food)."} ;; "severe dysphagia to food"

(declare-const patient_has_finding_of_difficulty_swallowing_pills_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of dysphagia to pills (difficulty swallowing pills).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of dysphagia to pills (difficulty swallowing pills).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dysphagia to pills (difficulty swallowing pills).","meaning":"Boolean indicating whether the patient currently has dysphagia to pills (difficulty swallowing pills)."} ;; "dysphagia to pills"

(declare-const patient_has_finding_of_difficulty_swallowing_pills_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dysphagia to pills (difficulty swallowing pills) and the severity is severe.","when_to_set_to_false":"Set to false if the patient currently has dysphagia to pills (difficulty swallowing pills) but the severity is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of dysphagia to pills is severe.","meaning":"Boolean indicating whether the patient currently has severe dysphagia to pills (difficulty swallowing pills)."} ;; "severe dysphagia to pills"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_difficulty_swallowing_food_now@@severity_severe
      patient_has_finding_of_difficulty_swallowing_food_now)
    :named REQ6_AUXILIARY0)) ;; "severe dysphagia to food" implies "dysphagia to food"

(assert
(! (=> patient_has_finding_of_difficulty_swallowing_pills_now@@severity_severe
      patient_has_finding_of_difficulty_swallowing_pills_now)
    :named REQ6_AUXILIARY1)) ;; "severe dysphagia to pills" implies "dysphagia to pills"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_abnormal_deglutition_now)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a swallowing disorder."

(assert
(! (not patient_has_finding_of_difficulty_swallowing_food_now@@severity_severe)
    :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe dysphagia to food."

(assert
(! (not patient_has_finding_of_difficulty_swallowing_pills_now@@severity_severe)
    :named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe dysphagia to pills."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if there is documented evidence that the patient is currently pregnant.","when_to_set_to_false":"Set to false if there is documented evidence that the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_is_pregnant_now)
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_taking_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any medication.","when_to_set_to_false":"Set to false if the patient is currently not taking any medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any medication.","meaning":"Boolean indicating whether the patient is currently taking any medication."} ;; "the patient is taking medication"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_is_taking_medication_now)
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking medication."
