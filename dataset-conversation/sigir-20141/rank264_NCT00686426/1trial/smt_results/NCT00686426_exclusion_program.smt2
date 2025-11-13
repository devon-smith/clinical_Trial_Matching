;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the measured BMI value in kg/m^2 if a current measurement is available.","when_to_set_to_null":"Set to null if no current BMI measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kg/m^2."} ;; "body mass index"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: BMI < 30 OR BMI > 40 (must NOT satisfy either for eligibility)
(assert
(! (not (or (< patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 30)
            (> patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 40)))
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has body mass index < 30) OR (the patient has body mass index > 40))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_type_2_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of type 2 diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of type 2 diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of type 2 diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of type 2 diabetes mellitus."} ;; "type II diabetes"

(declare-const patient_has_diagnosis_of_type_2_diabetes_mellitus_now@@requires_use_of_any_oral_antidiabetic_agent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's type 2 diabetes mellitus diagnosis requires the use of any oral antidiabetic agent.","when_to_set_to_false":"Set to false if the patient's type 2 diabetes mellitus diagnosis does not require the use of any oral antidiabetic agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's type 2 diabetes mellitus diagnosis requires the use of any oral antidiabetic agent.","meaning":"Boolean indicating whether the patient's type 2 diabetes mellitus diagnosis requires the use of any oral antidiabetic agent."} ;; "type II diabetes requiring the use of any oral antidiabetic agent"

(declare-const patient_has_diagnosis_of_type_2_diabetes_mellitus_now@@requires_use_of_insulin Bool) ;; {"when_to_set_to_true":"Set to true if the patient's type 2 diabetes mellitus diagnosis requires the use of insulin.","when_to_set_to_false":"Set to false if the patient's type 2 diabetes mellitus diagnosis does not require the use of insulin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's type 2 diabetes mellitus diagnosis requires the use of insulin.","meaning":"Boolean indicating whether the patient's type 2 diabetes mellitus diagnosis requires the use of insulin."} ;; "type II diabetes requiring the use of insulin"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_type_2_diabetes_mellitus_now@@requires_use_of_any_oral_antidiabetic_agent
      patient_has_diagnosis_of_type_2_diabetes_mellitus_now)
   :named REQ1_AUXILIARY0)) ;; "type II diabetes requiring the use of any oral antidiabetic agent"

(assert
(! (=> patient_has_diagnosis_of_type_2_diabetes_mellitus_now@@requires_use_of_insulin
      patient_has_diagnosis_of_type_2_diabetes_mellitus_now)
   :named REQ1_AUXILIARY1)) ;; "type II diabetes requiring the use of insulin"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (or patient_has_diagnosis_of_type_2_diabetes_mellitus_now@@requires_use_of_any_oral_antidiabetic_agent
            patient_has_diagnosis_of_type_2_diabetes_mellitus_now@@requires_use_of_insulin))
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has type II diabetes requiring the use of any oral antidiabetic agent) OR (the patient has type II diabetes requiring the use of insulin))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_adverse_reaction_to_food_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an adverse reaction to study foods.","when_to_set_to_false":"Set to false if the patient currently does not have an adverse reaction to study foods.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an adverse reaction to study foods.","meaning":"Boolean indicating whether the patient currently has an adverse reaction to study foods."} ;; "adverse response to study foods"
(declare-const patient_has_finding_of_adverse_reaction_to_food_now@@determined_by_self_report Bool) ;; {"when_to_set_to_true":"Set to true if the patient's adverse reaction to study foods is determined by self-report.","when_to_set_to_false":"Set to false if the patient's adverse reaction to study foods is not determined by self-report.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the adverse reaction to study foods is determined by self-report.","meaning":"Boolean indicating whether the patient's adverse reaction to study foods is determined by self-report."} ;; "as determined by self-report"
(declare-const patient_has_finding_of_intolerance_to_lactose_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has lactose intolerance.","when_to_set_to_false":"Set to false if the patient currently does not have lactose intolerance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has lactose intolerance.","meaning":"Boolean indicating whether the patient currently has lactose intolerance."} ;; "lactose intolerance"
(declare-const patient_has_finding_of_intolerance_to_lactose_now@@determined_by_self_report Bool) ;; {"when_to_set_to_true":"Set to true if the patient's lactose intolerance is determined by self-report.","when_to_set_to_false":"Set to false if the patient's lactose intolerance is not determined by self-report.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lactose intolerance is determined by self-report.","meaning":"Boolean indicating whether the patient's lactose intolerance is determined by self-report."} ;; "lactose intolerance as determined by self-report"
(declare-const patient_has_finding_of_intolerance_to_milk_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dairy intolerance.","when_to_set_to_false":"Set to false if the patient currently does not have dairy intolerance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dairy intolerance.","meaning":"Boolean indicating whether the patient currently has dairy intolerance."} ;; "dairy intolerance"
(declare-const patient_has_finding_of_intolerance_to_milk_now@@determined_by_self_report Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dairy intolerance is determined by self-report.","when_to_set_to_false":"Set to false if the patient's dairy intolerance is not determined by self-report.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dairy intolerance is determined by self-report.","meaning":"Boolean indicating whether the patient's dairy intolerance is determined by self-report."} ;; "dairy intolerance as determined by self-report"
(declare-const patient_has_finding_of_allergy_to_milk_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a dairy allergy.","when_to_set_to_false":"Set to false if the patient currently does not have a dairy allergy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a dairy allergy.","meaning":"Boolean indicating whether the patient currently has a dairy allergy."} ;; "dairy allergy"
(declare-const patient_has_finding_of_allergy_to_milk_now@@determined_by_self_report Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dairy allergy is determined by self-report.","when_to_set_to_false":"Set to false if the patient's dairy allergy is not determined by self-report.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dairy allergy is determined by self-report.","meaning":"Boolean indicating whether the patient's dairy allergy is determined by self-report."} ;; "dairy allergy as determined by self-report"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply umbrella term (adverse response to study foods as determined by self-report)
(assert
(! (=> (or patient_has_finding_of_intolerance_to_lactose_now@@determined_by_self_report
           patient_has_finding_of_intolerance_to_milk_now@@determined_by_self_report
           patient_has_finding_of_allergy_to_milk_now@@determined_by_self_report)
        patient_has_finding_of_adverse_reaction_to_food_now@@determined_by_self_report)
   :named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples ((lactose intolerance) OR (dairy intolerance) OR (dairy allergy)), as determined by self-report."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_adverse_reaction_to_food_now@@determined_by_self_report
       patient_has_finding_of_adverse_reaction_to_food_now)
   :named REQ2_AUXILIARY1)) ;; "as determined by self-report"

(assert
(! (=> patient_has_finding_of_intolerance_to_lactose_now@@determined_by_self_report
       patient_has_finding_of_intolerance_to_lactose_now)
   :named REQ2_AUXILIARY2)) ;; "lactose intolerance as determined by self-report"

(assert
(! (=> patient_has_finding_of_intolerance_to_milk_now@@determined_by_self_report
       patient_has_finding_of_intolerance_to_milk_now)
   :named REQ2_AUXILIARY3)) ;; "dairy intolerance as determined by self-report"

(assert
(! (=> patient_has_finding_of_allergy_to_milk_now@@determined_by_self_report
       patient_has_finding_of_allergy_to_milk_now)
   :named REQ2_AUXILIARY4)) ;; "dairy allergy as determined by self-report"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_adverse_reaction_to_food_now@@determined_by_self_report)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has adverse response to study foods with non-exhaustive examples ((lactose intolerance) OR (dairy intolerance) OR (dairy allergy)), as determined by self-report."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_significant_metabolic_disease_inthehistory@@could_impact_study_results Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with significant metabolic disease at any time in their medical history and the disease could impact the results of the study.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with significant metabolic disease at any time in their medical history, or if the disease could not impact the results of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with significant metabolic disease at any time in their medical history, or whether the disease could impact the results of the study.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of significant metabolic disease at any point in their medical history, with the additional constraint that the disease could impact the results of the study."} ;; "history of significant metabolic disease which could impact the results of the study"

(declare-const patient_has_diagnosis_of_disorder_of_endocrine_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a disorder of the endocrine system at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a disorder of the endocrine system at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a disorder of the endocrine system.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of a disorder of the endocrine system."} ;; "endocrine disease"

(declare-const patient_has_diagnosis_of_disease_of_liver_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a disease of the liver at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a disease of the liver at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a disease of the liver.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of a disease of the liver."} ;; "hepatic disease"

(declare-const patient_has_diagnosis_of_kidney_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with kidney disease at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with kidney disease at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with kidney disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of kidney disease."} ;; "renal disease"

(declare-const patient_has_diagnosis_of_kidney_disease_inthehistory@@could_impact_study_results Bool) ;; {"when_to_set_to_true":"Set to true if the patient's kidney disease could impact the results of the study.","when_to_set_to_false":"Set to false if the patient's kidney disease could not impact the results of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's kidney disease could impact the results of the study.","meaning":"Boolean indicating whether the patient's kidney disease could impact the results of the study."} ;; "renal disease which could impact the results of the study"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples imply umbrella term (history)
(assert
(! (=> (or patient_has_diagnosis_of_disorder_of_endocrine_system_inthehistory
           patient_has_diagnosis_of_disease_of_liver_inthehistory
           patient_has_diagnosis_of_kidney_disease_inthehistory@@could_impact_study_results)
        patient_has_diagnosis_of_significant_metabolic_disease_inthehistory@@could_impact_study_results)
   :named REQ3_AUXILIARY0)) ;; "with non-exhaustive examples ((endocrine disease) OR (hepatic disease) OR (renal disease)) which could impact the results of the study"

;; Qualifier variable implies corresponding stem variable (renal disease)
(assert
(! (=> patient_has_diagnosis_of_kidney_disease_inthehistory@@could_impact_study_results
       patient_has_diagnosis_of_kidney_disease_inthehistory)
   :named REQ3_AUXILIARY1)) ;; "renal disease which could impact the results of the study"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT have history of significant metabolic disease which could impact the results of the study
(assert
(! (not patient_has_diagnosis_of_significant_metabolic_disease_inthehistory@@could_impact_study_results)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has history of significant metabolic disease which could impact the results of the study with non-exhaustive examples ((endocrine disease) OR (hepatic disease) OR (renal disease))."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_eating_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with an eating disorder at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with an eating disorder at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with an eating disorder.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of eating disorder in their history."} ;; "history of eating disorder"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_eating_disorder_inthehistory)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has history of eating disorder."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_disorder_of_gastrointestinal_tract_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the gastrointestinal tract.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the gastrointestinal tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the gastrointestinal tract.","meaning":"Boolean indicating whether the patient currently has a disorder of the gastrointestinal tract."} ;; "gastrointestinal disorder"
(declare-const patient_has_finding_of_disorder_of_gastrointestinal_tract_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder of the gastrointestinal tract is active.","when_to_set_to_false":"Set to false if the patient's current disorder of the gastrointestinal tract is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disorder of the gastrointestinal tract is active.","meaning":"Boolean indicating whether the patient's current disorder of the gastrointestinal tract is active."} ;; "active gastrointestinal disorder"
(declare-const patient_has_finding_of_malabsorption_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has malabsorption syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have malabsorption syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has malabsorption syndrome.","meaning":"Boolean indicating whether the patient currently has malabsorption syndrome."} ;; "malabsorption syndrome"
(declare-const patient_has_finding_of_malabsorption_syndrome_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current malabsorption syndrome is active.","when_to_set_to_false":"Set to false if the patient's current malabsorption syndrome is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current malabsorption syndrome is active.","meaning":"Boolean indicating whether the patient's current malabsorption syndrome is active."} ;; "active malabsorption syndrome"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> patient_has_finding_of_malabsorption_syndrome_now@@active
      patient_has_finding_of_disorder_of_gastrointestinal_tract_now@@active)
:named REQ5_AUXILIARY0)) ;; "with non-exhaustive examples (malabsorption syndrome)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_disorder_of_gastrointestinal_tract_now@@active
      patient_has_finding_of_disorder_of_gastrointestinal_tract_now)
:named REQ5_AUXILIARY1)) ;; "active gastrointestinal disorder"

(assert
(! (=> patient_has_finding_of_malabsorption_syndrome_now@@active
      patient_has_finding_of_malabsorption_syndrome_now)
:named REQ5_AUXILIARY2)) ;; "active malabsorption syndrome"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_disorder_of_gastrointestinal_tract_now@@active)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active gastrointestinal disorder with non-exhaustive examples (malabsorption syndrome)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not lactating as documented or reported.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_is_pregnant_now)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
(! (not patient_is_lactating_now)
    :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is lactating."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_used_obesity_pharmacotherapeutic_agent_within_last_6_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used any obesity pharmacotherapeutic agent within the last 6 months.","when_to_set_to_false":"Set to false if the patient has not used any obesity pharmacotherapeutic agent within the last 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any obesity pharmacotherapeutic agent within the last 6 months.","meaning":"Boolean indicating whether the patient has used any obesity pharmacotherapeutic agent within the last 6 months."} ;; "has used obesity pharmacotherapeutic agent within the last 6 months"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_used_obesity_pharmacotherapeutic_agent_within_last_6_months)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used obesity pharmacotherapeutic agent within the last 6 months."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_used_over_the_counter_anti_obesity_agent_within_last_6_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used any over-the-counter anti-obesity agent within the last 6 months, regardless of the specific active ingredient.","when_to_set_to_false":"Set to false if the patient has not used any over-the-counter anti-obesity agent within the last 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any over-the-counter anti-obesity agent within the last 6 months.","meaning":"Boolean indicating whether the patient has used any over-the-counter anti-obesity agent within the last 6 months."} ;; "has used over-the-counter anti-obesity agent within the last 6 months"
(declare-const patient_has_taken_phenylpropanolamine_containing_product_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken an over-the-counter anti-obesity agent containing phenylpropanolamine within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not taken an over-the-counter anti-obesity agent containing phenylpropanolamine within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken an over-the-counter anti-obesity agent containing phenylpropanolamine within the past 6 months.","meaning":"Boolean indicating whether the patient has taken a phenylpropanolamine-containing over-the-counter anti-obesity product within the past 6 months."} ;; "over-the-counter anti-obesity agent containing phenylpropanolamine within the last 6 months"
(declare-const patient_has_taken_ephedrine_containing_product_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken an over-the-counter anti-obesity agent containing ephedrine within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not taken an over-the-counter anti-obesity agent containing ephedrine within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken an over-the-counter anti-obesity agent containing ephedrine within the past 6 months.","meaning":"Boolean indicating whether the patient has taken an ephedrine-containing over-the-counter anti-obesity product within the past 6 months."} ;; "over-the-counter anti-obesity agent containing ephedrine within the last 6 months"
(declare-const patient_has_taken_caffeine_containing_product_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken an over-the-counter anti-obesity agent containing caffeine within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not taken an over-the-counter anti-obesity agent containing caffeine within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken an over-the-counter anti-obesity agent containing caffeine within the past 6 months.","meaning":"Boolean indicating whether the patient has taken a caffeine-containing over-the-counter anti-obesity product within the past 6 months."} ;; "over-the-counter anti-obesity agent containing caffeine within the last 6 months"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_taken_phenylpropanolamine_containing_product_inthepast6months
           patient_has_taken_ephedrine_containing_product_inthepast6months
           patient_has_taken_caffeine_containing_product_inthepast6months)
    patient_has_used_over_the_counter_anti_obesity_agent_within_last_6_months)
:named REQ8_AUXILIARY0)) ;; "with non-exhaustive examples ((over-the-counter anti-obesity agent containing phenylpropanolamine) OR (over-the-counter anti-obesity agent containing ephedrine) OR (over-the-counter anti-obesity agent containing caffeine)) within the last 6 months."

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_used_over_the_counter_anti_obesity_agent_within_last_6_months)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used over-the-counter anti-obesity agent with non-exhaustive examples ... within the last 6 months."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_is_exposed_to_tobacco_inthepast12weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to tobacco at any time in the past 12 weeks.","when_to_set_to_false":"Set to false if the patient has not been exposed to tobacco at any time in the past 12 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to tobacco in the past 12 weeks.","meaning":"Boolean indicating whether the patient has been exposed to tobacco in the past 12 weeks."} ;; "has used tobacco in the past 12 weeks"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_is_exposed_to_tobacco_inthepast12weeks)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used tobacco in the past 12 weeks."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using or exposed to any drug or medicament (medication) now.","when_to_set_to_false":"Set to false if the patient is not currently using or exposed to any drug or medicament (medication) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using or exposed to any drug or medicament (medication) now.","meaning":"Boolean indicating whether the patient is currently exposed to any drug or medicament (medication)."} ;; "medication"
(declare-const patient_is_exposed_to_psychotropic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using or exposed to any psychotropic agent (psychotropic medication) now.","when_to_set_to_false":"Set to false if the patient is not currently using or exposed to any psychotropic agent (psychotropic medication) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using or exposed to any psychotropic agent (psychotropic medication) now.","meaning":"Boolean indicating whether the patient is currently exposed to any psychotropic agent (psychotropic medication)."} ;; "currently using any psychotropic medication"
(declare-const patient_is_exposed_to_psychotropic_agent_inthepast12weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used or been exposed to any psychotropic agent (psychotropic medication) at any time within the past twelve weeks.","when_to_set_to_false":"Set to false if the patient has not used or been exposed to any psychotropic agent (psychotropic medication) within the past twelve weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used or been exposed to any psychotropic agent (psychotropic medication) within the past twelve weeks.","meaning":"Boolean indicating whether the patient has been exposed to any psychotropic agent (psychotropic medication) within the past twelve weeks."} ;; "psychotropic medication within the past twelve weeks"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable for psychotropic agent now implies general drug/medicament exposure now
(assert
(! (=> patient_is_exposed_to_psychotropic_agent_now
      patient_is_exposed_to_drug_or_medicament_now)
:named REQ10_AUXILIARY0)) ;; "currently using any psychotropic medication" implies "currently using any medication"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Exclusion: patient must NOT be currently using any psychotropic medication
(assert
(! (not patient_is_exposed_to_psychotropic_agent_now)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently using any psychotropic medication."

;; Exclusion: patient must NOT have used any psychotropic medication within the past twelve weeks
(assert
(! (not patient_is_exposed_to_psychotropic_agent_inthepast12weeks)
:named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used any psychotropic medication within the past twelve weeks."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_initiated_exercise_program_within_past_4_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has initiated an exercise program within the past four weeks.","when_to_set_to_false":"Set to false if the patient has not initiated an exercise program within the past four weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has initiated an exercise program within the past four weeks.","meaning":"Boolean indicating whether the patient has initiated an exercise program within the past four weeks."} ;; "has initiated an exercise program within the past four weeks"
(declare-const weeks_since_patient_initiated_exercise_program_value_recorded_in_weeks Real) ;; {"when_to_set_to_value":"Set to the number of weeks since the patient initiated an exercise program, if known and documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined when the patient initiated an exercise program.","meaning":"Numeric value indicating the number of weeks since the patient initiated an exercise program, in weeks."} ;; "number of weeks since the patient initiated an exercise program"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_initiated_exercise_program_within_past_4_weeks)
:named REQ11_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has initiated an exercise program within the past four weeks."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_undergone_hormone_replacement_therapy_inthepast12weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has initiated or undergone hormone replacement therapy within the past twelve weeks.","when_to_set_to_false":"Set to false if the patient has not initiated or undergone hormone replacement therapy within the past twelve weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone hormone replacement therapy within the past twelve weeks.","meaning":"Boolean indicating whether the patient has undergone hormone replacement therapy within the past twelve weeks."} ;; "hormone replacement therapy"

(declare-const patient_has_undergone_hormone_replacement_therapy_inthepast12weeks@@initiated Bool) ;; {"when_to_set_to_true":"Set to true if the patient has initiated (first started) hormone replacement therapy within the past twelve weeks.","when_to_set_to_false":"Set to false if the patient has not initiated hormone replacement therapy within the past twelve weeks, even if they have undergone it previously.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has initiated hormone replacement therapy within the past twelve weeks.","meaning":"Boolean indicating whether the patient has initiated hormone replacement therapy within the past twelve weeks."} ;; "initiated hormone replacement therapy within the past twelve weeks"

(declare-const patient_has_undergone_hormone_replacement_therapy_inthepast12weeks@@regimen_changed Bool) ;; {"when_to_set_to_true":"Set to true if the patient has changed their hormone replacement therapy regimen within the past twelve weeks.","when_to_set_to_false":"Set to false if the patient has not changed their hormone replacement therapy regimen within the past twelve weeks, even if they have undergone the therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has changed their hormone replacement therapy regimen within the past twelve weeks.","meaning":"Boolean indicating whether the patient has changed their hormone replacement therapy regimen within the past twelve weeks."} ;; "changed hormone replacement therapy regimen within the past twelve weeks"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_undergone_hormone_replacement_therapy_inthepast12weeks@@initiated
      patient_has_undergone_hormone_replacement_therapy_inthepast12weeks)
:named REQ12_AUXILIARY0)) ;; "initiated hormone replacement therapy within the past twelve weeks"

(assert
(! (=> patient_has_undergone_hormone_replacement_therapy_inthepast12weeks@@regimen_changed
      patient_has_undergone_hormone_replacement_therapy_inthepast12weeks)
:named REQ12_AUXILIARY1)) ;; "changed hormone replacement therapy regimen within the past twelve weeks"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_undergone_hormone_replacement_therapy_inthepast12weeks@@initiated)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has initiated hormone replacement therapy within the past twelve weeks."

(assert
(! (not patient_has_undergone_hormone_replacement_therapy_inthepast12weeks@@regimen_changed)
:named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has changed hormone replacement therapy regimen within the past twelve weeks."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_finding_of_contraception_inthepast12weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has initiated hormonal birth control (contraception) within the past twelve weeks.","when_to_set_to_false":"Set to false if the patient has not initiated hormonal birth control (contraception) within the past twelve weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has initiated hormonal birth control (contraception) within the past twelve weeks.","meaning":"Boolean indicating whether the patient has initiated hormonal birth control (contraception) within the past twelve weeks."} ;; "the patient has initiated hormonal birth control within the past twelve weeks"
(declare-const patient_has_finding_of_contraception_inthepast12weeks@@regimen_changed Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had contraception (hormonal birth control) within the past twelve weeks and the regimen was changed during that period.","when_to_set_to_false":"Set to false if the patient has had contraception (hormonal birth control) within the past twelve weeks but the regimen was not changed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the regimen was changed during the past twelve weeks.","meaning":"Boolean indicating whether the patient's contraception regimen was changed within the past twelve weeks."} ;; "the patient has changed hormonal birth control regimen within the past twelve weeks"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_finding_of_contraception_inthepast12weeks)
:named REQ13_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has initiated hormonal birth control within the past twelve weeks."

(assert
(! (not patient_has_finding_of_contraception_inthepast12weeks@@regimen_changed)
:named REQ13_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has changed hormonal birth control regimen within the past twelve weeks."
