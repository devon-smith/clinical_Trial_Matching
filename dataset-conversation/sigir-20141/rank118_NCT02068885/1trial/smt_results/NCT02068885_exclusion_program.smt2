;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_weight_change_value_recorded_inthepast12months_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percent change in body weight if a numeric measurement of percent change in body weight during the prior twelve months is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percent representing the patient's change in body weight during the prior twelve months."} ;; "change in body weight exceeding plus or minus ten percent during the prior twelve months"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (or (> patient_weight_change_value_recorded_inthepast12months_withunit_percent 10)
            (< patient_weight_change_value_recorded_inthepast12months_withunit_percent -10)))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a change in body weight exceeding plus or minus ten percent during the prior twelve months."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_on_special_diet_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had adherence to a special diet at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had adherence to a special diet at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had adherence to a special diet.","meaning":"Boolean indicating whether the patient has ever had adherence to a special diet at any time in their history."} ;; "special diet"
(declare-const patient_has_finding_of_on_special_diet_inthehistory@@recent_adherence Bool) ;; {"when_to_set_to_true":"Set to true if the patient's adherence to a special diet occurred within a recent timeframe as defined by the study protocol.","when_to_set_to_false":"Set to false if the patient's adherence to a special diet did not occur within a recent timeframe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's adherence to a special diet was recent.","meaning":"Boolean indicating whether the patient's adherence to a special diet was recent."} ;; "recent adherence to a special diet"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_on_special_diet_inthehistory@@recent_adherence
      patient_has_finding_of_on_special_diet_inthehistory)
:named REQ1_AUXILIARY0)) ;; "recent adherence to a special diet" implies "adherence to a special diet"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_on_special_diet_inthehistory@@recent_adherence)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had recent adherence to a special diet."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_physical_activity_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had physical activity at any time in the history.","when_to_set_to_false":"Set to false if the patient has not had physical activity at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had physical activity at any time in the history.","meaning":"Boolean indicating whether the patient has had physical activity at any time in the history."} ;; "physical activity"
(declare-const patient_has_finding_of_physical_activity_inthehistory@@recent_adherence Bool) ;; {"when_to_set_to_true":"Set to true if the patient's physical activity in the history was adhered to recently.","when_to_set_to_false":"Set to false if the patient's physical activity in the history was not adhered to recently.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's physical activity in the history was adhered to recently.","meaning":"Boolean indicating whether the patient's physical activity in the history was adhered to recently."} ;; "recent adherence to a physical activity regimen"
(declare-const patient_has_finding_of_physical_activity_inthehistory@@vigorous_regimen Bool) ;; {"when_to_set_to_true":"Set to true if the patient's physical activity regimen in the history was vigorous.","when_to_set_to_false":"Set to false if the patient's physical activity regimen in the history was not vigorous.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's physical activity regimen in the history was vigorous.","meaning":"Boolean indicating whether the patient's physical activity regimen in the history was vigorous."} ;; "vigorous physical activity regimen"
(declare-const patient_has_finding_of_physical_activity_inthehistory@@recent_adherence@@vigorous_regimen Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had recent adherence to a vigorous physical activity regimen at any time in the history.","when_to_set_to_false":"Set to false if the patient has not had recent adherence to a vigorous physical activity regimen at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had recent adherence to a vigorous physical activity regimen at any time in the history.","meaning":"Boolean indicating whether the patient has had recent adherence to a vigorous physical activity regimen at any time in the history."} ;; "recent adherence to a vigorous physical activity regimen"
(declare-const patient_has_finding_of_physical_activity_inthehistory@@recent_adherence@@vigorous_regimen@@example_participation_in_varsity_sport Bool) ;; {"when_to_set_to_true":"Set to true if the patient's recent adherence to a vigorous physical activity regimen includes participation in a varsity sport as a non-exhaustive example.","when_to_set_to_false":"Set to false if the patient's recent adherence to a vigorous physical activity regimen does not include participation in a varsity sport as a non-exhaustive example.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's recent adherence to a vigorous physical activity regimen includes participation in a varsity sport as a non-exhaustive example.","meaning":"Boolean indicating whether the patient's recent adherence to a vigorous physical activity regimen includes participation in a varsity sport as a non-exhaustive example."} ;; "participation in a varsity sport (non-exhaustive example of recent adherence to a vigorous physical activity regimen)"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive example: participation in a varsity sport implies recent adherence to a vigorous physical activity regimen
(assert
(! (=> patient_has_finding_of_physical_activity_inthehistory@@recent_adherence@@vigorous_regimen@@example_participation_in_varsity_sport
      patient_has_finding_of_physical_activity_inthehistory@@recent_adherence@@vigorous_regimen)
:named REQ2_AUXILIARY0)) ;; "such as participation in a varsity sport" (non-exhaustive example)

;; Qualifier variable implies stem variable: recent adherence to a vigorous regimen implies recent adherence to physical activity
(assert
(! (=> patient_has_finding_of_physical_activity_inthehistory@@recent_adherence@@vigorous_regimen
      patient_has_finding_of_physical_activity_inthehistory@@recent_adherence)
:named REQ2_AUXILIARY1)) ;; "recent adherence to a vigorous physical activity regimen" implies "recent adherence to physical activity"

;; Qualifier variable implies stem variable: recent adherence to a vigorous regimen implies vigorous regimen
(assert
(! (=> patient_has_finding_of_physical_activity_inthehistory@@recent_adherence@@vigorous_regimen
      patient_has_finding_of_physical_activity_inthehistory@@vigorous_regimen)
:named REQ2_AUXILIARY2)) ;; "recent adherence to a vigorous physical activity regimen" implies "vigorous physical activity regimen"

;; Qualifier variable implies stem variable: recent adherence to a vigorous regimen implies physical activity in history
(assert
(! (=> patient_has_finding_of_physical_activity_inthehistory@@recent_adherence@@vigorous_regimen
      patient_has_finding_of_physical_activity_inthehistory)
:named REQ2_AUXILIARY3)) ;; "recent adherence to a vigorous physical activity regimen" implies "physical activity in history"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT have had recent adherence to a vigorous physical activity regimen
(assert
(! (not patient_has_finding_of_physical_activity_inthehistory@@recent_adherence@@vigorous_regimen)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had recent adherence to a vigorous physical activity regimen with non-exhaustive examples (participation in a varsity sport)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patients_continuous_use_of_drugs_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic (continuous) use of any medication.","when_to_set_to_false":"Set to false if the patient currently does not have chronic (continuous) use of any medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic (continuous) use of any medication.","meaning":"Boolean indicating whether the patient currently has chronic (continuous) use of any medication."} ;; "chronic use of any medication"
(declare-const patients_continuous_use_of_drugs_is_positive_now@@medication_could_affect_study_outcomes Bool) ;; {"when_to_set_to_true":"Set to true if the medication(s) chronically used by the patient could affect study outcomes.","when_to_set_to_false":"Set to false if the medication(s) chronically used by the patient could not affect study outcomes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the medication(s) chronically used by the patient could affect study outcomes.","meaning":"Boolean indicating whether the medication(s) chronically used by the patient could affect study outcomes."} ;; "medication that could affect study outcomes"
(declare-const patient_is_exposed_to_nutritional_supplement_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any dietary supplement.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any dietary supplement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any dietary supplement.","meaning":"Boolean indicating whether the patient is currently exposed to any dietary supplement."} ;; "dietary supplement"
(declare-const patient_is_exposed_to_nutritional_supplement_now@@supplement_could_affect_study_outcomes Bool) ;; {"when_to_set_to_true":"Set to true if the dietary supplement to which the patient is currently exposed could affect study outcomes.","when_to_set_to_false":"Set to false if the dietary supplement to which the patient is currently exposed could not affect study outcomes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dietary supplement to which the patient is currently exposed could affect study outcomes.","meaning":"Boolean indicating whether the dietary supplement to which the patient is currently exposed could affect study outcomes."} ;; "dietary supplement that could affect study outcomes"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patients_continuous_use_of_drugs_is_positive_now@@medication_could_affect_study_outcomes
      patients_continuous_use_of_drugs_is_positive_now)
:named REQ3_AUXILIARY0)) ;; "chronic use of any medication that could affect study outcomes"

(assert
(! (=> patient_is_exposed_to_nutritional_supplement_now@@supplement_could_affect_study_outcomes
      patient_is_exposed_to_nutritional_supplement_now)
:named REQ3_AUXILIARY1)) ;; "chronic use of any dietary supplement that could affect study outcomes"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patients_continuous_use_of_drugs_is_positive_now@@medication_could_affect_study_outcomes)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic use of any medication that could affect study outcomes."

(assert
(! (not patient_is_exposed_to_nutritional_supplement_now@@supplement_could_affect_study_outcomes)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic use of any dietary supplement that could affect study outcomes."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_tobacco_smoking_behavior_finding_inthepast7days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has engaged in tobacco smoking behavior (smoked at least one cigarette) at any time in the past 7 days.","when_to_set_to_false":"Set to false if the patient has not engaged in tobacco smoking behavior (not smoked any cigarettes) at any time in the past 7 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has engaged in tobacco smoking behavior in the past 7 days.","meaning":"Boolean indicating whether the patient has engaged in tobacco smoking behavior at least once in the past 7 days."} ;; "currently smoking, defined as having smoked at least one cigarette in the last seven days"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_tobacco_smoking_behavior_finding_inthepast7days)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is currently smoking, defined as having smoked at least one cigarette in the last seven days)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_alcoholic_drinks_per_week_value_recorded_now_withunit_drinks Real) ;; {"when_to_set_to_value":"Set to the numeric value of alcoholic drinks the patient consumes per week at baseline, measured in drinks, if known.","when_to_set_to_null":"Set to null if the number of alcoholic drinks per week at baseline is unknown, not documented, or cannot be determined.","meaning":"Numeric value of alcoholic drinks the patient consumes per week at baseline, measured in drinks."} ;; "more than ten drinks per week"
(declare-const patient_has_finding_of_heavy_baseline_alcohol_consumption_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heavy baseline alcohol consumption.","when_to_set_to_false":"Set to false if the patient currently does not have heavy baseline alcohol consumption.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has heavy baseline alcohol consumption.","meaning":"Boolean indicating whether the patient currently has heavy baseline alcohol consumption."} ;; "heavy baseline alcohol consumption"
(declare-const patient_has_finding_of_drinking_binge_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had binge drinking (five or more drinks in one day) at any time in the past six months.","when_to_set_to_false":"Set to false if the patient has not had binge drinking (five or more drinks in one day) at any time in the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had binge drinking (five or more drinks in one day) at any time in the past six months.","meaning":"Boolean indicating whether the patient has had binge drinking (five or more drinks in one day) at any time in the past six months."} ;; "history of binge drinking (five or more drinks in one day, anytime in the past six months)"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definition: heavy baseline alcohol consumption = more than ten drinks per week
(assert
(! (= patient_has_finding_of_heavy_baseline_alcohol_consumption_now
     (> patient_alcoholic_drinks_per_week_value_recorded_now_withunit_drinks 10))
:named REQ5_AUXILIARY0)) ;; "heavy baseline alcohol consumption, defined as more than ten drinks per week"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient must NOT have heavy baseline alcohol consumption OR history of binge drinking in past 6 months
(assert
(! (not (or patient_has_finding_of_heavy_baseline_alcohol_consumption_now
            patient_has_finding_of_drinking_binge_inthepast6months))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has heavy baseline alcohol consumption, defined as more than ten drinks per week) OR (the patient has a history of binge drinking, defined as five or more drinks in one day, anytime in the past six months))."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_serious_physical_health_problem_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a physician diagnosis of a serious physical health problem (major medical illness).","when_to_set_to_false":"Set to false if the patient currently does not have a physician diagnosis of a serious physical health problem (major medical illness).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a physician diagnosis of a serious physical health problem (major medical illness).","meaning":"Boolean indicating whether the patient currently has a physician diagnosis of a serious physical health problem (major medical illness)."} ;; "major medical illness"
(declare-const patient_has_diagnosis_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a physician diagnosis of a mental disorder (psychiatric illness).","when_to_set_to_false":"Set to false if the patient currently does not have a physician diagnosis of a mental disorder (psychiatric illness).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a physician diagnosis of a mental disorder (psychiatric illness).","meaning":"Boolean indicating whether the patient currently has a physician diagnosis of a mental disorder (psychiatric illness)."} ;; "psychiatric illness"
(declare-const patient_has_diagnosis_of_eating_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a physician diagnosis of an eating disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a physician diagnosis of an eating disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a physician diagnosis of an eating disorder.","meaning":"Boolean indicating whether the patient currently has a physician diagnosis of an eating disorder."} ;; "eating disorder"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_diagnosis_of_serious_physical_health_problem_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a physician diagnosis of a major medical illness."

(assert
(! (not patient_has_diagnosis_of_mental_disorder_now)
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a physician diagnosis of a psychiatric illness."

(assert
(! (not patient_has_diagnosis_of_eating_disorder_now)
:named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a physician diagnosis of an eating disorder."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_abnormal_hemoglobin_a1c_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abnormal hemoglobin A1c.","when_to_set_to_false":"Set to false if the patient currently does not have abnormal hemoglobin A1c.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abnormal hemoglobin A1c.","meaning":"Boolean indicating whether the patient currently has abnormal hemoglobin A1c."} ;; "abnormal hemoglobin A1c"
(declare-const patient_has_finding_of_serum_tsh_level_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of abnormal serum TSH level.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of abnormal serum TSH level.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of abnormal serum TSH level.","meaning":"Boolean indicating whether the patient currently has abnormal serum TSH level."} ;; "abnormal thyroid stimulating hormone"
(declare-const patient_has_finding_of_abnormal_blood_urea_nitrogen_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abnormal blood urea nitrogen.","when_to_set_to_false":"Set to false if the patient currently does not have abnormal blood urea nitrogen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abnormal blood urea nitrogen.","meaning":"Boolean indicating whether the patient currently has abnormal blood urea nitrogen."} ;; "abnormal blood urea nitrogen"
(declare-const patient_has_finding_of_abnormal_creatinine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abnormal creatinine.","when_to_set_to_false":"Set to false if the patient currently does not have abnormal creatinine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abnormal creatinine.","meaning":"Boolean indicating whether the patient currently has abnormal creatinine."} ;; "abnormal creatinine"
(declare-const hematocrit_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the value of the patient's hematocrit percentage recorded now.","when_to_set_to_null":"Set to null if the patient's hematocrit percentage recorded now is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's hematocrit percentage recorded now."} ;; "hematocrit less than thirty percent"
(declare-const alanine_aminotransferase_value_recorded_now_withunit_percent_of_normal_upper_limit Real) ;; {"when_to_set_to_value":"Set to the value of the patient's alanine aminotransferase as percent of the normal upper limit recorded now.","when_to_set_to_null":"Set to null if the patient's alanine aminotransferase as percent of the normal upper limit recorded now is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's alanine aminotransferase as percent of the normal upper limit recorded now."} ;; "alanine aminotransferase greater than two hundred percent of the normal upper limit"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (or patient_has_finding_of_abnormal_hemoglobin_a1c_now
            patient_has_finding_of_serum_tsh_level_abnormal_now
            patient_has_finding_of_abnormal_blood_urea_nitrogen_now
            patient_has_finding_of_abnormal_creatinine_now
            (< hematocrit_value_recorded_now_withunit_percent 30)
            (> alanine_aminotransferase_value_recorded_now_withunit_percent_of_normal_upper_limit 200)))
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has abnormal hemoglobin A1c) OR (the patient has abnormal thyroid stimulating hormone) OR (the patient has abnormal blood urea nitrogen) OR (the patient has abnormal creatinine) OR (the patient has hematocrit less than thirty percent) OR (the patient has alanine aminotransferase greater than two hundred percent of the normal upper limit))."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_plans_for_vacation_during_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient has plans for a vacation that will occur during the study period.","when_to_set_to_false":"Set to false if the patient does not have plans for a vacation during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has plans for a vacation during the study period.","meaning":"Boolean indicating whether the patient has plans for a vacation during the study period."} ;; "plans for a vacation during the study"
(declare-const patient_has_plans_for_vacation_during_study_period@@would_preclude_adherence_to_prescribed_diet Bool) ;; {"when_to_set_to_true":"Set to true if the patient's planned vacation during the study period would preclude adherence to the prescribed diet.","when_to_set_to_false":"Set to false if the patient's planned vacation during the study period would not preclude adherence to the prescribed diet.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's planned vacation during the study period would preclude adherence to the prescribed diet.","meaning":"Boolean indicating whether the patient's planned vacation during the study period would preclude adherence to the prescribed diet."} ;; "would preclude adherence to the prescribed diet"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_plans_for_vacation_during_study_period@@would_preclude_adherence_to_prescribed_diet
      patient_has_plans_for_vacation_during_study_period)
:named REQ8_AUXILIARY0)) ;; "plans for a vacation during the study that would preclude adherence to the prescribed diet"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_plans_for_vacation_during_study_period@@would_preclude_adherence_to_prescribed_diet)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has plans for a vacation during the study that would preclude adherence to the prescribed diet."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the time of enrollment.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the time of enrollment.","when_to_set_to_null":"Set to null if the patient's sex at the time of enrollment is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female at the time of enrollment."} ;; "the patient is female"
(declare-const patient_has_finding_of_irregular_periods_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of irregular menstrual cycles.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of irregular menstrual cycles.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has irregular menstrual cycles.","meaning":"Boolean indicating whether the patient currently has irregular menstrual cycles."} ;; "irregular menstrual cycles"
(declare-const patient_has_any_change_in_birth_control_medication_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had any change in birth control medication during the three months prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not had any change in birth control medication during the three months prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had any change in birth control medication during the three months prior to enrollment.","meaning":"Boolean value indicating whether the patient has had any change in birth control medication during the three months prior to enrollment."} ;; "any change in birth control medication during the three months prior to enrollment"
(declare-const patient_is_pregnant_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient was pregnant at any time during the twelve months prior to enrollment.","when_to_set_to_false":"Set to false if the patient was not pregnant at any time during the twelve months prior to enrollment.","when_to_set_to_null":"Set to null if the patient's pregnancy status during the twelve months prior to enrollment is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient was pregnant at any time during the twelve months prior to enrollment."} ;; "pregnancy during the twelve months prior to enrollment"
(declare-const patient_is_lactating_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient was lactating at any time during the twelve months prior to enrollment.","when_to_set_to_false":"Set to false if the patient was not lactating at any time during the twelve months prior to enrollment.","when_to_set_to_null":"Set to null if the patient's lactation status during the twelve months prior to enrollment is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient was lactating at any time during the twelve months prior to enrollment."} ;; "lactation during the twelve months prior to enrollment"
(declare-const patients_lactation_is_positive_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a positive status for lactation at any time in her history.","when_to_set_to_false":"Set to false if the patient has never had a positive status for lactation at any time in her history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a positive status for lactation.","meaning":"Boolean indicating whether the patient has ever had a positive status for lactation in her history."} ;; "lactation"
(declare-const patients_lactation_is_positive_inthehistory@@temporalcontext_within12months_prior_to_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a positive status for lactation within the twelve months prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not had a positive status for lactation within the twelve months prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a positive status for lactation within the twelve months prior to enrollment.","meaning":"Boolean indicating whether the patient has had a positive status for lactation within the twelve months prior to enrollment."} ;; "lactation during the twelve months prior to enrollment"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable for lactation implies stem variable
(assert
(! (=> patients_lactation_is_positive_inthehistory@@temporalcontext_within12months_prior_to_enrollment
       patients_lactation_is_positive_inthehistory)
:named REQ9_AUXILIARY0)) ;; "lactation during the twelve months prior to enrollment" implies "lactation in history"

;; patient_is_lactating_inthepast12months is equivalent to the qualifier variable
(assert
(! (= patient_is_lactating_inthepast12months
      patients_lactation_is_positive_inthehistory@@temporalcontext_within12months_prior_to_enrollment)
:named REQ9_AUXILIARY1)) ;; "patient_is_lactating_inthepast12months" ≡ "patients_lactation_is_positive_inthehistory@@temporalcontext_within12months_prior_to_enrollment"

;; ===================== Constraint Assertions (REQ 9) =====================
;; The exclusion is: if (female) AND (any of the 4 conditions), then EXCLUDE. So, for eligibility, we require NOT((female) AND (any of the 4 conditions))
(assert
(! (not (and patient_sex_is_female_now
             (or patient_has_finding_of_irregular_periods_now
                 patient_has_any_change_in_birth_control_medication_inthepast3months
                 patient_is_pregnant_inthepast12months
                 patient_is_lactating_inthepast12months)))
   :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is female) AND ((the patient has irregular menstrual cycles) OR (the patient has any change in birth control medication during the three months prior to enrollment) OR (the patient has pregnancy during the twelve months prior to enrollment) OR (the patient has lactation during the twelve months prior to enrollment)))."
