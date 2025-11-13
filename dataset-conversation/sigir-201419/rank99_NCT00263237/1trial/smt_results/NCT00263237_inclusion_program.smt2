;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_given_written_informed_consent_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has given written informed consent prior to the screening procedure.","when_to_set_to_false":"Set to false if the patient has not given written informed consent prior to the screening procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has given written informed consent prior to screening.","meaning":"Boolean indicating whether the patient has given written informed consent prior to screening."} // "To be included, the patient must have given written informed consent prior to screening."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_given_written_informed_consent_prior_to_screening
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have given written informed consent prior to screening."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is currently recorded as male.","when_to_set_to_false":"Set to false if the patient's sex is currently recorded as not male.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is male as currently recorded."} // "be male"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is currently recorded as female.","when_to_set_to_false":"Set to false if the patient's sex is currently recorded as not female.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female as currently recorded."} // "be female"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "be aged ≥ 18 years AND be aged ≤ 75 years"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must (be male) OR (be female AND be aged ≥ 18 years AND be aged ≤ 75 years).
(assert
  (! (or patient_sex_is_male_now
         (and patient_sex_is_female_now
              (>= patient_age_value_recorded_now_in_years 18)
              (<= patient_age_value_recorded_now_in_years 75)))
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must (be male) OR (be female AND be aged ≥ 18 years AND be aged ≤ 75 years)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_common_variable_agammaglobulinemia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with common variable immunodeficiency (common_variable_agammaglobulinemia) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with common variable immunodeficiency (common_variable_agammaglobulinemia) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with common variable immunodeficiency (common_variable_agammaglobulinemia).","meaning":"Boolean indicating whether the patient has ever been diagnosed with common variable immunodeficiency (common_variable_agammaglobulinemia) at any time in their history."} // "common variable immunodeficiency (diagnosed definitively prior to screening based on the International Union of Immunological Societies criteria)"
(declare-const patient_has_diagnosis_of_common_variable_agammaglobulinemia_inthehistory@@diagnosed_definitively Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of common variable immunodeficiency was made definitively.","when_to_set_to_false":"Set to false if the diagnosis was not made definitively (e.g., presumptive or provisional).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was made definitively.","meaning":"Boolean indicating whether the diagnosis of common variable immunodeficiency was made definitively."} // "diagnosed definitively"
(declare-const patient_has_diagnosis_of_common_variable_agammaglobulinemia_inthehistory@@diagnosed_based_on_international_union_of_immunological_societies_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of common variable immunodeficiency was made based on the International Union of Immunological Societies criteria.","when_to_set_to_false":"Set to false if the diagnosis was not made based on the International Union of Immunological Societies criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was made based on the International Union of Immunological Societies criteria.","meaning":"Boolean indicating whether the diagnosis of common variable immunodeficiency was made based on the International Union of Immunological Societies criteria."} // "based on the International Union of Immunological Societies criteria"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply the stem variable
(assert
  (! (=> patient_has_diagnosis_of_common_variable_agammaglobulinemia_inthehistory@@diagnosed_definitively
         patient_has_diagnosis_of_common_variable_agammaglobulinemia_inthehistory)
     :named REQ2_AUXILIARY0)) ;; "diagnosed definitively"

(assert
  (! (=> patient_has_diagnosis_of_common_variable_agammaglobulinemia_inthehistory@@diagnosed_based_on_international_union_of_immunological_societies_criteria
         patient_has_diagnosis_of_common_variable_agammaglobulinemia_inthehistory)
     :named REQ2_AUXILIARY1)) ;; "based on the International Union of Immunological Societies criteria"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (and patient_has_diagnosis_of_common_variable_agammaglobulinemia_inthehistory@@diagnosed_definitively
          patient_has_diagnosis_of_common_variable_agammaglobulinemia_inthehistory@@diagnosed_based_on_international_union_of_immunological_societies_criteria)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have common variable immunodeficiency (diagnosed definitively prior to screening based on the International Union of Immunological Societies criteria)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_weight_decreased_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a decrease in body weight at any time in the past 12 months.","when_to_set_to_false":"Set to false if the patient has not had a decrease in body weight in the past 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a decrease in body weight in the past 12 months.","meaning":"Boolean indicating whether the patient has had a decrease in body weight in the past 12 months."} // "loss of body weight"
(declare-const patient_has_finding_of_weight_decreased_inthepast12months@@documented Bool) ;; {"when_to_set_to_true":"Set to true if the decrease in body weight in the past 12 months is documented.","when_to_set_to_false":"Set to false if the decrease in body weight in the past 12 months is not documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the decrease in body weight in the past 12 months is documented.","meaning":"Boolean indicating whether the decrease in body weight in the past 12 months is documented."} // "documented"
(declare-const patient_has_finding_of_weight_decreased_inthepast12months@@unintended Bool) ;; {"when_to_set_to_true":"Set to true if the decrease in body weight in the past 12 months was unintended.","when_to_set_to_false":"Set to false if the decrease in body weight in the past 12 months was intended.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the decrease in body weight in the past 12 months was unintended.","meaning":"Boolean indicating whether the decrease in body weight in the past 12 months was unintended."} // "unintended"
(declare-const patient_has_finding_of_chronic_diarrhea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic diarrhea.","when_to_set_to_false":"Set to false if the patient currently does not have chronic diarrhea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic diarrhea.","meaning":"Boolean indicating whether the patient currently has chronic diarrhea."} // "chronic diarrhea"
(declare-const patient_has_finding_of_liquid_stool_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had liquid stools at any time in the past 4 weeks.","when_to_set_to_false":"Set to false if the patient has not had liquid stools in the past 4 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had liquid stools in the past 4 weeks.","meaning":"Boolean indicating whether the patient has had liquid stools in the past 4 weeks."} // "liquid stools"
(declare-const patient_has_finding_of_liquid_stool_inthepast4weeks@@consecutive_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had liquid stools in the past 4 weeks and the weeks were consecutive.","when_to_set_to_false":"Set to false if the patient has had liquid stools in the past 4 weeks but the weeks were not consecutive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the weeks were consecutive.","meaning":"Boolean indicating whether the patient has had liquid stools in the past 4 weeks and the weeks were consecutive."} // "consecutive weeks"
(declare-const patient_feces_value_recorded_now_withunit_grams_per_24_hours Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's stool output in grams per 24 hours is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's stool output in grams per 24 hours, recorded now."} // "stool > 200 grams per 24 hours"
(declare-const diet_calories_value_recorded_now_withunit_kilocalories_per_day Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's daily dietary caloric intake in kilocalories per day is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's daily dietary caloric intake in kilocalories per day, recorded now."} // "diet of ≥ 1600 calories"
(declare-const patient_fat_value_recorded_now_withunit_grams_per_day Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's dietary fat intake in grams per day is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's dietary fat intake in grams per day, recorded now."} // "60 grams of fat"
(declare-const patient_is_taking_nutritional_supplement_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking nutritional supplements.","when_to_set_to_false":"Set to false if the patient is currently not taking nutritional supplements.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking nutritional supplements.","meaning":"Boolean indicating whether the patient is currently taking nutritional supplements."} // "nutritional supplements"
(declare-const patient_is_taking_nutritional_supplement_now@@required_to_maintain_body_weight Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking nutritional supplements and the supplements are required to maintain body weight.","when_to_set_to_false":"Set to false if the patient is currently taking nutritional supplements but they are not required to maintain body weight.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the supplements are required to maintain body weight.","meaning":"Boolean indicating whether the patient is currently taking nutritional supplements and the supplements are required to maintain body weight."} // "required to maintain body weight"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_weight_decreased_inthepast12months@@documented
         patient_has_finding_of_weight_decreased_inthepast12months)
     :named REQ3_AUXILIARY0)) ;; "documented, unintended loss of body weight > 5 % over the last 12 months"

(assert
  (! (=> patient_has_finding_of_weight_decreased_inthepast12months@@unintended
         patient_has_finding_of_weight_decreased_inthepast12months)
     :named REQ3_AUXILIARY1)) ;; "unintended loss of body weight > 5 % over the last 12 months"

(assert
  (! (=> patient_is_taking_nutritional_supplement_now@@required_to_maintain_body_weight
         patient_is_taking_nutritional_supplement_now)
     :named REQ3_AUXILIARY2)) ;; "require nutritional supplements to maintain body weight"

(assert
  (! (=> patient_has_finding_of_liquid_stool_inthepast4weeks@@consecutive_weeks
         patient_has_finding_of_liquid_stool_inthepast4weeks)
     :named REQ3_AUXILIARY3)) ;; "liquid stools for ≥ 4 consecutive weeks"

;; Definition of chronic diarrhea per requirement: complaint of liquid stools for ≥ 4 consecutive weeks AND output of stool > 200g/24h on a diet of ≥ 1600 kcal and 60g fat
(assert
  (! (= patient_has_finding_of_chronic_diarrhea_now
        (and patient_has_finding_of_liquid_stool_inthepast4weeks@@consecutive_weeks
             (> patient_feces_value_recorded_now_withunit_grams_per_24_hours 200.0)
             (>= diet_calories_value_recorded_now_withunit_kilocalories_per_day 1600.0)
             (>= patient_fat_value_recorded_now_withunit_grams_per_day 60.0)))
     :named REQ3_AUXILIARY4)) ;; "chronic diarrhea (defined as a complaint of liquid stools for ≥ 4 consecutive weeks AND an output of stool > 200 grams per 24 hours on a diet of ≥ 1600 calories with 60 grams of fat)"

;; ===================== Constraint Assertions (REQ 3) =====================
;; At least one of the three conditions must be satisfied for inclusion
(assert
  (! (or
        (and patient_has_finding_of_weight_decreased_inthepast12months
             patient_has_finding_of_weight_decreased_inthepast12months@@documented
             patient_has_finding_of_weight_decreased_inthepast12months@@unintended)
        patient_is_taking_nutritional_supplement_now@@required_to_maintain_body_weight
        patient_has_finding_of_chronic_diarrhea_now)
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((have a documented, unintended loss of body weight > 5 % over the last 12 months) OR (require nutritional supplements to maintain body weight) OR (have chronic diarrhea (defined as a complaint of liquid stools for ≥ 4 consecutive weeks AND an output of stool > 200 grams per 24 hours on a diet of ≥ 1600 calories with 60 grams of fat)))."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_taking_oral_antibiotics_chronically_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking oral antibiotics chronically (i.e., as a long-term or ongoing therapy).","when_to_set_to_false":"Set to false if the patient is not currently taking oral antibiotics chronically.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking oral antibiotics chronically.","meaning":"Boolean indicating whether the patient is currently taking oral antibiotics chronically."} // "if the patient is taking oral antibiotics chronically"
(declare-const oral_antibiotic_dose_is_stable_now Bool) ;; {"when_to_set_to_true":"Set to true if the dose of oral antibiotic the patient is currently taking is stable (i.e., unchanged).","when_to_set_to_false":"Set to false if the dose of oral antibiotic the patient is currently taking is not stable (i.e., has changed recently).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dose of oral antibiotic the patient is currently taking is stable.","meaning":"Boolean indicating whether the dose of oral antibiotic the patient is currently taking is stable."} // "must have used a stable dose of oral antibiotic"
(declare-const oral_antibiotic_stable_dose_duration_prior_to_screening_period_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days the patient has continuously used a stable dose of oral antibiotic prior to the start of the screening period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days the patient has continuously used a stable dose of oral antibiotic prior to the start of the screening period.","meaning":"Numeric value indicating the number of days the patient has continuously used a stable dose of oral antibiotic prior to the start of the screening period."} // "continuously for ≥ 2 weeks prior to the start of the screening period"

;; ===================== Constraint Assertions (REQ 4) =====================
;; If the patient is taking oral antibiotics chronically, they must have used a stable dose continuously for ≥ 2 weeks prior to screening.
(assert
  (! (or (not patient_is_taking_oral_antibiotics_chronically_now)
         (and oral_antibiotic_dose_is_stable_now
              (>= oral_antibiotic_stable_dose_duration_prior_to_screening_period_in_days 14)))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient is taking oral antibiotics chronically, the patient must have used a stable dose of oral antibiotic continuously for ≥ 2 weeks prior to the start of the screening period."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_is_taking_potential_cytochrome_p450_3a4_inhibitor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any potential cytochrome P450 3A4 inhibitor.","when_to_set_to_false":"Set to false if the patient is currently not taking any potential cytochrome P450 3A4 inhibitor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any potential cytochrome P450 3A4 inhibitor.","meaning":"Boolean indicating whether the patient is currently taking any potential cytochrome P450 3A4 inhibitor."} // "the patient must NOT be taking any potential cytochrome P450 3A4 inhibitor"
(declare-const patient_is_taking_potential_cytochrome_p450_3a4_inducer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any potential cytochrome P450 3A4 inducer.","when_to_set_to_false":"Set to false if the patient is currently not taking any potential cytochrome P450 3A4 inducer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any potential cytochrome P450 3A4 inducer.","meaning":"Boolean indicating whether the patient is currently taking any potential cytochrome P450 3A4 inducer."} // "the patient must NOT be taking any potential cytochrome P450 3A4 inducer"
(declare-const patient_is_taking_macrolide_antibacterial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a macrolide antibacterial agent.","when_to_set_to_false":"Set to false if the patient is currently not taking a macrolide antibacterial agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a macrolide antibacterial agent.","meaning":"Boolean indicating whether the patient is currently taking a macrolide antibacterial agent."} // "macrolide antibiotic"
(declare-const patient_is_taking_protease_inhibitor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a protease inhibitor.","when_to_set_to_false":"Set to false if the patient is currently not taking a protease inhibitor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a protease inhibitor.","meaning":"Boolean indicating whether the patient is currently taking a protease inhibitor."} // "human immunodeficiency virus protease inhibitor"
(declare-const patient_is_taking_antifungal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an antifungal agent.","when_to_set_to_false":"Set to false if the patient is currently not taking an antifungal agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking an antifungal agent.","meaning":"Boolean indicating whether the patient is currently taking an antifungal agent."} // "antifungal agent"
(declare-const patient_is_exposed_to_grapefruit_juice_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to grapefruit juice (e.g., consuming it).","when_to_set_to_false":"Set to false if the patient is currently not exposed to grapefruit juice.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to grapefruit juice.","meaning":"Boolean indicating whether the patient is currently exposed to grapefruit juice."} // "grapefruit juice"
(declare-const patient_is_taking_hypericum_perforatum_extract_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking St. John's Wort (hypericum perforatum extract).","when_to_set_to_false":"Set to false if the patient is currently not taking St. John's Wort (hypericum perforatum extract).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking St. John's Wort (hypericum perforatum extract).","meaning":"Boolean indicating whether the patient is currently taking St. John's Wort (hypericum perforatum extract)."} // "St. John's Wort"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Non-exhaustive examples imply the umbrella term for inhibitor
(assert
  (! (=> (or patient_is_taking_macrolide_antibacterial_now
             patient_is_taking_protease_inhibitor_now
             patient_is_taking_antifungal_now
             patient_is_exposed_to_grapefruit_juice_now
             patient_is_taking_hypericum_perforatum_extract_now)
         patient_is_taking_potential_cytochrome_p450_3a4_inhibitor_now)
     :named REQ5_AUXILIARY0)) ;; "with non-exhaustive examples (macrolide antibiotic, human immunodeficiency virus protease inhibitor, antifungal agent, grapefruit juice, St. John's Wort)"

;; Non-exhaustive examples imply the umbrella term for inducer
(assert
  (! (=> (or patient_is_taking_macrolide_antibacterial_now
             patient_is_taking_protease_inhibitor_now
             patient_is_taking_antifungal_now
             patient_is_exposed_to_grapefruit_juice_now
             patient_is_taking_hypericum_perforatum_extract_now)
         patient_is_taking_potential_cytochrome_p450_3a4_inducer_now)
     :named REQ5_AUXILIARY1)) ;; "with non-exhaustive examples (macrolide antibiotic, human immunodeficiency virus protease inhibitor, antifungal agent, grapefruit juice, St. John's Wort)"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: NOT taking any potential cytochrome P450 3A4 inhibitor
(assert
  (! (not patient_is_taking_potential_cytochrome_p450_3a4_inhibitor_now)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must NOT be taking any potential cytochrome P450 3A4 inhibitor"

;; Component 1: NOT taking any potential cytochrome P450 3A4 inducer
(assert
  (! (not patient_is_taking_potential_cytochrome_p450_3a4_inducer_now)
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient must NOT be taking any potential cytochrome P450 3A4 inducer"
