;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_binge_eating_disorder_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of binge eating disorder at any time in the past 6 months, according to DSM-IV-TR criteria.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of binge eating disorder at any time in the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of binge eating disorder in the past 6 months.","meaning":"Boolean indicating whether the patient has had a diagnosis of binge eating disorder in the past 6 months."} ;; "To be included, the patient must meet Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition, Text Revision criteria for binge eating disorder for ≥ 6 months."
(declare-const patient_has_diagnosis_of_binge_eating_disorder_inthepast6months@@diagnosis_determined_by_structured_clinical_interview_for_dsm_iv_tr Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of binge eating disorder in the past 6 months was determined by the structured clinical interview for DSM-IV-TR.","when_to_set_to_false":"Set to false if the diagnosis was not determined by the structured clinical interview for DSM-IV-TR.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was determined by the structured clinical interview for DSM-IV-TR.","meaning":"Boolean indicating whether the diagnosis of binge eating disorder in the past 6 months was determined by the structured clinical interview for DSM-IV-TR."} ;; "To be included, the patient must be determined by the structured clinical interview for Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition, Text Revision."
(declare-const patient_has_diagnosis_of_binge_eating_disorder_inthepast6months@@diagnosis_supported_by_eating_disorder_examination Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of binge eating disorder in the past 6 months was supported by the eating disorder examination.","when_to_set_to_false":"Set to false if the diagnosis was not supported by the eating disorder examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was supported by the eating disorder examination.","meaning":"Boolean indicating whether the diagnosis of binge eating disorder in the past 6 months was supported by the eating disorder examination."} ;; "To be included, the patient must be supported by the eating disorder examination."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_binge_eating_disorder_inthepast6months@@diagnosis_determined_by_structured_clinical_interview_for_dsm_iv_tr
         patient_has_diagnosis_of_binge_eating_disorder_inthepast6months)
     :named REQ0_AUXILIARY0)) ;; "be determined by the structured clinical interview for DSM-IV-TR"

;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_binge_eating_disorder_inthepast6months@@diagnosis_supported_by_eating_disorder_examination
         patient_has_diagnosis_of_binge_eating_disorder_inthepast6months)
     :named REQ0_AUXILIARY1)) ;; "be supported by the eating disorder examination"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: DSM-IV-TR criteria for binge eating disorder for ≥ 6 months
(assert
  (! patient_has_diagnosis_of_binge_eating_disorder_inthepast6months
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "meet DSM-IV-TR criteria for binge eating disorder for ≥ 6 months"

;; Component 1: diagnosis determined by structured clinical interview for DSM-IV-TR
(assert
  (! patient_has_diagnosis_of_binge_eating_disorder_inthepast6months@@diagnosis_determined_by_structured_clinical_interview_for_dsm_iv_tr
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "be determined by the structured clinical interview for DSM-IV-TR"

;; Component 2: diagnosis supported by eating disorder examination
(assert
  (! patient_has_diagnosis_of_binge_eating_disorder_inthepast6months@@diagnosis_supported_by_eating_disorder_examination
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "be supported by the eating disorder examination"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_recurrent_episodes_of_binge_eating_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of recurrent episodes of binge eating.","when_to_set_to_false":"Set to false if the patient does not have a history of recurrent episodes of binge eating.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of recurrent episodes of binge eating.","meaning":"Boolean indicating whether the patient has a history of recurrent episodes of binge eating."} ;; "To be included, the patient must have recurrent episodes of binge eating"
(declare-const patient_has_recurrent_episodes_of_binge_eating_in_the_history@@each_episode_occurs_in_discrete_period_of_time_within_two_hours Bool) ;; {"when_to_set_to_true":"Set to true if each recurrent episode of binge eating occurs in a discrete period of time, specifically within any two hour period.","when_to_set_to_false":"Set to false if each recurrent episode of binge eating does not occur in a discrete period of time within any two hour period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether each recurrent episode of binge eating occurs in a discrete period of time within any two hour period.","meaning":"Boolean indicating whether each recurrent episode of binge eating occurs in a discrete period of time within any two hour period."} ;; "where each episode is characterized by eating, in a discrete period of time (with non-exhaustive examples (within any two hour period))"
(declare-const patient_has_recurrent_episodes_of_binge_eating_in_the_history@@each_episode_involves_amount_of_food_larger_than_most_people_would_eat_in_similar_period_under_similar_circumstances Bool) ;; {"when_to_set_to_true":"Set to true if each recurrent episode of binge eating involves eating an amount of food that is definitely larger than most people would eat in a similar period of time under similar circumstances.","when_to_set_to_false":"Set to false if each recurrent episode of binge eating does not involve eating an amount of food that is definitely larger than most people would eat in a similar period of time under similar circumstances.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether each recurrent episode of binge eating involves eating an amount of food that is definitely larger than most people would eat in a similar period of time under similar circumstances.","meaning":"Boolean indicating whether each recurrent episode of binge eating involves eating an amount of food that is definitely larger than most people would eat in a similar period of time under similar circumstances."} ;; "an amount of food that is definitely larger than most people would eat in a similar period of time under similar circumstances"
(declare-const patient_has_finding_of_unable_to_control_bolus_of_food_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever experienced a sense of lack of control over eating (unable to control bolus of food) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never experienced a sense of lack of control over eating (unable to control bolus of food) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever experienced a sense of lack of control over eating (unable to control bolus of food) at any time in the past.","meaning":"Boolean indicating whether the patient has ever experienced a sense of lack of control over eating (unable to control bolus of food) in the past."} ;; "a sense of lack of control over eating during the episode"
(declare-const patient_has_finding_of_unable_to_control_bolus_of_food_inthehistory@@occurs_during_binge_eating_episode Bool) ;; {"when_to_set_to_true":"Set to true if the patient's experience of lack of control over eating (unable to control bolus of food) occurred during a binge eating episode.","when_to_set_to_false":"Set to false if the patient's experience of lack of control over eating (unable to control bolus of food) did not occur during a binge eating episode.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lack of control over eating occurred during a binge eating episode.","meaning":"Boolean indicating whether the patient's lack of control over eating occurred during a binge eating episode."} ;; "a sense of lack of control over eating during the episode"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_unable_to_control_bolus_of_food_inthehistory@@occurs_during_binge_eating_episode
         patient_has_finding_of_unable_to_control_bolus_of_food_inthehistory)
     :named REQ1_AUXILIARY0)) ;; "a sense of lack of control over eating during the episode"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_recurrent_episodes_of_binge_eating_in_the_history@@each_episode_occurs_in_discrete_period_of_time_within_two_hours
         patient_has_recurrent_episodes_of_binge_eating_in_the_history)
     :named REQ1_AUXILIARY1)) ;; "each episode occurs in discrete period of time (within any two hour period)"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_recurrent_episodes_of_binge_eating_in_the_history@@each_episode_involves_amount_of_food_larger_than_most_people_would_eat_in_similar_period_under_similar_circumstances
         patient_has_recurrent_episodes_of_binge_eating_in_the_history)
     :named REQ1_AUXILIARY2)) ;; "each episode involves amount of food larger than most people would eat in similar period under similar circumstances"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have recurrent episodes of binge eating, where each episode is characterized by (eating, in a discrete period of time (with non-exhaustive examples (within any two hour period)), an amount of food that is definitely larger than most people would eat in a similar period of time under similar circumstances) AND (a sense of lack of control over eating during the episode)
(assert
  (! (and patient_has_recurrent_episodes_of_binge_eating_in_the_history
          patient_has_recurrent_episodes_of_binge_eating_in_the_history@@each_episode_involves_amount_of_food_larger_than_most_people_would_eat_in_similar_period_under_similar_circumstances
          patient_has_finding_of_unable_to_control_bolus_of_food_inthehistory@@occurs_during_binge_eating_episode)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have recurrent episodes of binge eating, where each episode is characterized by (eating, in a discrete period of time (with non-exhaustive examples (within any two hour period)), an amount of food that is definitely larger than most people would eat in a similar period of time under similar circumstances) AND (a sense of lack of control over eating during the episode (with non-exhaustive examples (a feeling that the patient cannot stop eating OR cannot control what or how much the patient is eating)))"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const binge_eating_episodes_associated_features_count_now Real) ;; {"when_to_set_to_value":"Set to the number of associated features present during the patient's current binge eating episodes, as defined by the specified features.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many associated features are present during the patient's current binge eating episodes.","meaning":"Numeric variable indicating the number of associated features present during the patient's current binge eating episodes."} ;; "binge eating episodes that are associated with ≥ 3 of the following"
(declare-const patient_has_binge_eating_episodes_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has binge eating episodes.","when_to_set_to_false":"Set to false if the patient currently does not have binge eating episodes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has binge eating episodes.","meaning":"Boolean indicating whether the patient currently has binge eating episodes."} ;; "the patient must have binge eating episodes"
(declare-const patient_has_eating_much_more_rapidly_than_normal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently eats much more rapidly than normal during binge eating episodes.","when_to_set_to_false":"Set to false if the patient currently does not eat much more rapidly than normal during binge eating episodes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently eats much more rapidly than normal during binge eating episodes.","meaning":"Boolean indicating whether the patient currently eats much more rapidly than normal during binge eating episodes."} ;; "eating much more rapidly than normal"
(declare-const patient_has_eating_until_uncomfortably_full_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently eats until uncomfortably full during binge eating episodes.","when_to_set_to_false":"Set to false if the patient currently does not eat until uncomfortably full during binge eating episodes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently eats until uncomfortably full during binge eating episodes.","meaning":"Boolean indicating whether the patient currently eats until uncomfortably full during binge eating episodes."} ;; "eating until uncomfortably full"
(declare-const patient_has_eating_large_amounts_when_not_physically_hungry_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently eats large amounts of food when not feeling physically hungry during binge eating episodes.","when_to_set_to_false":"Set to false if the patient currently does not eat large amounts of food when not feeling physically hungry during binge eating episodes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently eats large amounts of food when not feeling physically hungry during binge eating episodes.","meaning":"Boolean indicating whether the patient currently eats large amounts of food when not feeling physically hungry during binge eating episodes."} ;; "eating large amounts of food when not feeling physically hungry"
(declare-const patient_has_eating_alone_due_to_embarrassment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently eats alone because of being embarrassed by how much they are eating during binge eating episodes.","when_to_set_to_false":"Set to false if the patient currently does not eat alone because of being embarrassed by how much they are eating during binge eating episodes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently eats alone because of being embarrassed by how much they are eating during binge eating episodes.","meaning":"Boolean indicating whether the patient currently eats alone because of being embarrassed by how much they are eating during binge eating episodes."} ;; "eating alone because of being embarrassed by how much the patient is eating"
(declare-const patient_has_feeling_disgusted_with_oneself_after_overeating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently feels disgusted with oneself after overeating during binge eating episodes.","when_to_set_to_false":"Set to false if the patient currently does not feel disgusted with oneself after overeating during binge eating episodes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently feels disgusted with oneself after overeating during binge eating episodes.","meaning":"Boolean indicating whether the patient currently feels disgusted with oneself after overeating during binge eating episodes."} ;; "feeling disgusted with oneself after overeating"
(declare-const patient_has_feeling_depressed_after_overeating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently feels depressed after overeating during binge eating episodes.","when_to_set_to_false":"Set to false if the patient currently does not feel depressed after overeating during binge eating episodes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently feels depressed after overeating during binge eating episodes.","meaning":"Boolean indicating whether the patient currently feels depressed after overeating during binge eating episodes."} ;; "feeling depressed after overeating"
(declare-const patient_has_feeling_very_guilty_after_overeating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently feels very guilty after overeating during binge eating episodes.","when_to_set_to_false":"Set to false if the patient currently does not feel very guilty after overeating during binge eating episodes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently feels very guilty after overeating during binge eating episodes.","meaning":"Boolean indicating whether the patient currently feels very guilty after overeating during binge eating episodes."} ;; "feeling very guilty after overeating"
(declare-const patient_has_finding_of_overeating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of overeating.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of overeating.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of overeating.","meaning":"Boolean indicating whether the patient currently has overeating."} ;; "overeating"
(declare-const patient_has_finding_of_overeating_now@@followed_by_feeling_disgusted_with_oneself_or_feeling_depressed_or_feeling_very_guilty Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current overeating is followed by feeling disgusted with oneself, feeling depressed, or feeling very guilty.","when_to_set_to_false":"Set to false if the patient's current overeating is not followed by any of these feelings.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current overeating is followed by these feelings.","meaning":"Boolean indicating whether the patient's current overeating is followed by feeling disgusted with oneself, feeling depressed, or feeling very guilty."} ;; "overeating followed by feeling disgusted with oneself or feeling depressed or feeling very guilty"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition of the "feeling disgusted/depressed/guilty after overeating" umbrella
(assert
  (! (= patient_has_finding_of_overeating_now@@followed_by_feeling_disgusted_with_oneself_or_feeling_depressed_or_feeling_very_guilty
        (or patient_has_feeling_disgusted_with_oneself_after_overeating_now
            patient_has_feeling_depressed_after_overeating_now
            patient_has_feeling_very_guilty_after_overeating_now))
     :named REQ2_AUXILIARY0)) ;; "feeling disgusted with oneself OR feeling depressed OR feeling very guilty after overeating" is an umbrella for the qualifier

;; Definition of binge_eating_episodes_associated_features_count_now
(define-fun binge_eating_episodes_associated_features_count_now_def () Real
  (+ (ite patient_has_eating_much_more_rapidly_than_normal_now 1.0 0.0)
     (ite patient_has_eating_until_uncomfortably_full_now 1.0 0.0)
     (ite patient_has_eating_large_amounts_when_not_physically_hungry_now 1.0 0.0)
     (ite patient_has_eating_alone_due_to_embarrassment_now 1.0 0.0)
     (ite patient_has_finding_of_overeating_now@@followed_by_feeling_disgusted_with_oneself_or_feeling_depressed_or_feeling_very_guilty 1.0 0.0)))
;; "associated with ≥ 3 of the following" -- count the features

(assert
  (! (= binge_eating_episodes_associated_features_count_now binge_eating_episodes_associated_features_count_now_def)
     :named REQ2_AUXILIARY1)) ;; "binge eating episodes that are associated with ≥ 3 of the following" -- definition of count

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (and patient_has_binge_eating_episodes_now
          (>= binge_eating_episodes_associated_features_count_now 3.0))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have binge eating episodes that are associated with ≥ 3 of the following..."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_marked_distress_regarding_binge_eating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has marked distress regarding binge eating.","when_to_set_to_false":"Set to false if the patient currently does not have marked distress regarding binge eating.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has marked distress regarding binge eating.","meaning":"Boolean indicating whether the patient currently has marked distress regarding binge eating."} ;; "To be included, the patient must have marked distress regarding binge eating."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_finding_of_marked_distress_regarding_binge_eating_now
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have marked distress regarding binge eating."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const binge_eating_days_per_week_average_in_past_6_months Real) ;; {"when_to_set_to_value":"Set to the average number of days per week the patient engaged in binge eating over the past 6 months, as documented or reported. Unit is days per week.","when_to_set_to_null":"Set to null if the average frequency of binge eating per week over the past 6 months is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the average number of days per week the patient engaged in binge eating over the past 6 months (unit: days/week)."} ;; "binge eating that occurs, on average, ≥ 2 days per week for 6 months"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (>= binge_eating_days_per_week_average_in_past_6_months 2.0)
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "binge eating that occurs, on average, ≥ 2 days per week for 6 months"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_binge_eating_exclusively_during_anorexia_nervosa Bool) ;; {"when_to_set_to_true":"Set to true if the patient has binge eating episodes that occur exclusively during the course of anorexia nervosa.","when_to_set_to_false":"Set to false if the patient does not have binge eating episodes that occur exclusively during the course of anorexia nervosa.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's binge eating occurs exclusively during the course of anorexia nervosa.","meaning":"Boolean indicating whether the patient has binge eating that occurs exclusively during the course of anorexia nervosa."} ;; "binge eating that occurs exclusively during the course of anorexia nervosa"
(declare-const patient_has_binge_eating_exclusively_during_bulimia_nervosa Bool) ;; {"when_to_set_to_true":"Set to true if the patient has binge eating episodes that occur exclusively during the course of bulimia nervosa.","when_to_set_to_false":"Set to false if the patient does not have binge eating episodes that occur exclusively during the course of bulimia nervosa.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's binge eating occurs exclusively during the course of bulimia nervosa.","meaning":"Boolean indicating whether the patient has binge eating that occurs exclusively during the course of bulimia nervosa."} ;; "binge eating that occurs exclusively during the course of bulimia nervosa"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: To be included, the patient must NOT have (binge eating that occurs exclusively during the course of bulimia nervosa OR binge eating that occurs exclusively during the course of anorexia nervosa).
(assert
  (! (not (or patient_has_binge_eating_exclusively_during_bulimia_nervosa
              patient_has_binge_eating_exclusively_during_anorexia_nervosa))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have (binge eating that occurs exclusively during the course of bulimia nervosa OR binge eating that occurs exclusively during the course of anorexia nervosa)."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter Real) ;; {"when_to_set_to_value":"Set to the measured BMI value if a numeric measurement of body mass index recorded now is available, in kilograms per square meter.","when_to_set_to_null":"Set to null if no such BMI measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kilograms per square meter."} ;; "body mass index > 30 kilograms per square meter"
(declare-const patient_has_finding_of_obesity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of obesity.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has obesity.","meaning":"Boolean indicating whether the patient currently has obesity."} ;; "obesity, defined by body mass index > 30 kilograms per square meter"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Definition in the requirement: obesity is defined by BMI > 30 kg/m^2
(assert
  (! (= patient_has_finding_of_obesity_now
        (> patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 30.0))
     :named REQ6_AUXILIARY0)) ;; "obesity, defined by body mass index > 30 kilograms per square meter"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_has_finding_of_obesity_now
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have obesity, defined by body mass index > 30 kilograms per square meter."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged ≥ 18 years AND aged ≤ 65 years"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female as currently recorded."} ;; "a woman"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is male as currently recorded."} ;; "a man"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: To be included, the patient must be ((a man AND aged ≥ 18 years AND aged ≤ 65 years) OR (a woman AND aged ≥ 18 years AND aged ≤ 65 years)).
(assert
  (! (or (and patient_sex_is_male_now
              (>= patient_age_value_recorded_now_in_years 18.0)
              (<= patient_age_value_recorded_now_in_years 65.0))
         (and patient_sex_is_female_now
              (>= patient_age_value_recorded_now_in_years 18.0)
              (<= patient_age_value_recorded_now_in_years 65.0)))
     :named REQ7_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be ((a man AND aged ≥ 18 years AND aged ≤ 65 years) OR (a woman AND aged ≥ 18 years AND aged ≤ 65 years))."
