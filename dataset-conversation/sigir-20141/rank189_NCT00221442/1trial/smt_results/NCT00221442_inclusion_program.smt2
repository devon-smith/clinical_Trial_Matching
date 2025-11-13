;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_binge_eating_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with binge eating disorder at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with binge eating disorder at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with binge eating disorder.","meaning":"Boolean indicating whether the patient has a diagnosis of binge eating disorder at any time in their history."} // "binge eating disorder"
(declare-const patient_has_diagnosis_of_binge_eating_disorder_inthehistory@@meets_dsm_iv_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of binge eating disorder meets DSM-IV criteria.","when_to_set_to_false":"Set to false if the patient's diagnosis of binge eating disorder does not meet DSM-IV criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's diagnosis of binge eating disorder meets DSM-IV criteria.","meaning":"Boolean indicating whether the patient's diagnosis of binge eating disorder meets DSM-IV criteria."} // "DSM-IV criteria for binge eating disorder"
(declare-const patient_has_diagnosis_of_binge_eating_disorder_inthehistory@@duration_at_least_6_months_immediately_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's binge eating disorder has been present for at least 6 months immediately prior to screening.","when_to_set_to_false":"Set to false if the patient's binge eating disorder has not been present for at least 6 months immediately prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's binge eating disorder has been present for at least 6 months immediately prior to screening.","meaning":"Boolean indicating whether the patient's binge eating disorder has been present for at least 6 months immediately prior to screening."} // "≥ 6 months immediately prior to screening"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_binge_eating_disorder_inthehistory@@meets_dsm_iv_criteria
         patient_has_diagnosis_of_binge_eating_disorder_inthehistory)
     :named REQ0_AUXILIARY0)) ;; "DSM-IV criteria for binge eating disorder"

(assert
  (! (=> patient_has_diagnosis_of_binge_eating_disorder_inthehistory@@duration_at_least_6_months_immediately_prior_to_screening
         patient_has_diagnosis_of_binge_eating_disorder_inthehistory)
     :named REQ0_AUXILIARY1)) ;; "≥ 6 months immediately prior to screening"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must meet DSM-IV criteria for binge eating disorder for ≥ 6 months immediately prior to screening.
(assert
  (! (and patient_has_diagnosis_of_binge_eating_disorder_inthehistory@@meets_dsm_iv_criteria
          patient_has_diagnosis_of_binge_eating_disorder_inthehistory@@duration_at_least_6_months_immediately_prior_to_screening)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must meet Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition criteria for binge eating disorder for ≥ 6 months immediately prior to screening."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_recurrent_episodes_of_binge_eating_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has recurrent episodes of binge eating in the history.","when_to_set_to_false":"Set to false if the patient does not have recurrent episodes of binge eating in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has recurrent episodes of binge eating in the history.","meaning":"Boolean indicating whether the patient has recurrent episodes of binge eating in the history."} // "recurrent episodes of binge eating"
(declare-const binge_eating_episode_amount_of_food_value_recorded_per_episode_withunit_servings Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the amount of food consumed during a binge eating episode, in servings, for each episode.","when_to_set_to_null":"Set to null if the amount of food consumed during a binge eating episode is unknown, not documented, or cannot be determined.","meaning":"Numeric value for the amount of food consumed during a binge eating episode, in servings."} // "amount of food consumed during a binge eating episode"
(declare-const binge_eating_episode_amount_of_food_value_recorded_per_episode_withunit_servings@@definitely_larger_than_most_people_would_eat_in_similar_period_under_similar_circumstances Bool) ;; {"when_to_set_to_true":"Set to true if the amount of food consumed during the binge eating episode is definitely larger than what most people would eat in a similar period of time under similar circumstances.","when_to_set_to_false":"Set to false if the amount of food consumed during the binge eating episode is not definitely larger than what most people would eat in a similar period of time under similar circumstances.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the amount is definitely larger than what most people would eat in a similar period of time under similar circumstances.","meaning":"Boolean indicating whether the amount of food consumed during a binge eating episode is definitely larger than what most people would eat in a similar period of time under similar circumstances."} // "definitely larger than most people would eat in similar period under similar circumstances"
(declare-const binge_eating_episode_duration_value_recorded_per_episode_withunit_hours Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the duration of a binge eating episode, in hours, for each episode.","when_to_set_to_null":"Set to null if the duration of a binge eating episode is unknown, not documented, or cannot be determined.","meaning":"Numeric value for the duration of a binge eating episode, in hours."} // "duration of binge eating episode"
(declare-const binge_eating_episode_duration_value_recorded_per_episode_withunit_hours@@within_any_two_hour_period Bool) ;; {"when_to_set_to_true":"Set to true if the binge eating episode occurs within any two hour period.","when_to_set_to_false":"Set to false if the binge eating episode does not occur within any two hour period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the episode occurs within any two hour period.","meaning":"Boolean indicating whether the binge eating episode occurs within any two hour period."} // "within any two hour period"
(declare-const binge_eating_episode_has_sense_of_lack_of_control_over_eating_per_episode Bool) ;; {"when_to_set_to_true":"Set to true if the patient experiences a sense of lack of control over eating during a binge eating episode.","when_to_set_to_false":"Set to false if the patient does not experience a sense of lack of control over eating during a binge eating episode.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient experiences a sense of lack of control over eating during a binge eating episode.","meaning":"Boolean indicating whether the patient experiences a sense of lack of control over eating during a binge eating episode."} // "sense of lack of control over eating during the episode"
(declare-const binge_eating_episode_has_sense_of_lack_of_control_over_eating_per_episode@@feeling_cannot_stop_eating Bool) ;; {"when_to_set_to_true":"Set to true if the patient feels they cannot stop eating during a binge eating episode.","when_to_set_to_false":"Set to false if the patient does not feel they cannot stop eating during a binge eating episode.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient feels they cannot stop eating during a binge eating episode.","meaning":"Boolean indicating whether the patient feels they cannot stop eating during a binge eating episode."} // "feeling cannot stop eating"
(declare-const binge_eating_episode_has_sense_of_lack_of_control_over_eating_per_episode@@feeling_cannot_control_what_or_how_much_eating Bool) ;; {"when_to_set_to_true":"Set to true if the patient feels they cannot control what or how much they are eating during a binge eating episode.","when_to_set_to_false":"Set to false if the patient does not feel they cannot control what or how much they are eating during a binge eating episode.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient feels they cannot control what or how much they are eating during a binge eating episode.","meaning":"Boolean indicating whether the patient feels they cannot control what or how much they are eating during a binge eating episode."} // "feeling cannot control what or how much eating"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive example: "within any two hour period" implies discrete period of time
(assert
  (! (=> binge_eating_episode_duration_value_recorded_per_episode_withunit_hours@@within_any_two_hour_period
         (<= binge_eating_episode_duration_value_recorded_per_episode_withunit_hours 2.0))
     :named REQ1_AUXILIARY0)) ;; "within any two hour period" is a non-exhaustive example of discrete period of time

;; Non-exhaustive examples: "feeling cannot stop eating" or "cannot control what or how much eating" imply sense of lack of control
(assert
  (! (=> (or binge_eating_episode_has_sense_of_lack_of_control_over_eating_per_episode@@feeling_cannot_stop_eating
             binge_eating_episode_has_sense_of_lack_of_control_over_eating_per_episode@@feeling_cannot_control_what_or_how_much_eating)
         binge_eating_episode_has_sense_of_lack_of_control_over_eating_per_episode)
     :named REQ1_AUXILIARY1)) ;; "feeling cannot stop eating" or "cannot control what or how much eating" are non-exhaustive examples of lack of control

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have recurrent episodes of binge eating, where each episode is characterized by:
;; (1) eating, in a discrete period of time (e.g., within any two hour period), an amount of food definitely larger than most people would eat in a similar period under similar circumstances
;; AND
;; (2) a sense of lack of control over eating during the episode (e.g., feeling cannot stop eating or cannot control what or how much eating)
(assert
  (! (and patient_has_recurrent_episodes_of_binge_eating_in_the_history
          binge_eating_episode_amount_of_food_value_recorded_per_episode_withunit_servings@@definitely_larger_than_most_people_would_eat_in_similar_period_under_similar_circumstances
          binge_eating_episode_has_sense_of_lack_of_control_over_eating_per_episode)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "recurrent episodes of binge eating, each episode characterized by (amount definitely larger than most people would eat in similar period under similar circumstances) AND (sense of lack of control over eating during the episode)"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_overeating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of overeating (binge eating) episodes.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of overeating (binge eating) episodes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of overeating (binge eating) episodes.","meaning":"Boolean indicating whether the patient currently has overeating (binge eating) episodes."} // "binge eating episodes"
(declare-const patient_has_finding_of_overeating_now@@associated_with_eating_much_more_rapidly_than_normal Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current overeating (binge eating) episodes are associated with eating much more rapidly than normal.","when_to_set_to_false":"Set to false if the patient's current overeating (binge eating) episodes are not associated with eating much more rapidly than normal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current overeating (binge eating) episodes are associated with eating much more rapidly than normal.","meaning":"Boolean indicating whether the patient's current overeating (binge eating) episodes are associated with eating much more rapidly than normal."} // "eating much more rapidly than normal"
(declare-const patient_has_finding_of_overeating_now@@associated_with_eating_until_uncomfortably_full Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current overeating (binge eating) episodes are associated with eating until the patient is uncomfortably full.","when_to_set_to_false":"Set to false if the patient's current overeating (binge eating) episodes are not associated with eating until the patient is uncomfortably full.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current overeating (binge eating) episodes are associated with eating until the patient is uncomfortably full.","meaning":"Boolean indicating whether the patient's current overeating (binge eating) episodes are associated with eating until the patient is uncomfortably full."} // "eating until the patient is uncomfortably full"
(declare-const patient_has_finding_of_overeating_now@@associated_with_eating_large_amounts_when_not_feeling_physical_hunger Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current overeating (binge eating) episodes are associated with eating large amounts of food when the patient is not feeling physical hunger.","when_to_set_to_false":"Set to false if the patient's current overeating (binge eating) episodes are not associated with eating large amounts of food when the patient is not feeling physical hunger.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current overeating (binge eating) episodes are associated with eating large amounts of food when the patient is not feeling physical hunger.","meaning":"Boolean indicating whether the patient's current overeating (binge eating) episodes are associated with eating large amounts of food when the patient is not feeling physical hunger."} // "eating large amounts of food when the patient is not feeling physical hunger"
(declare-const patient_has_finding_of_overeating_now@@associated_with_eating_alone_due_to_embarrassment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current overeating (binge eating) episodes are associated with eating alone because of being embarrassed by how much the patient is eating.","when_to_set_to_false":"Set to false if the patient's current overeating (binge eating) episodes are not associated with eating alone because of being embarrassed by how much the patient is eating.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current overeating (binge eating) episodes are associated with eating alone because of being embarrassed by how much the patient is eating.","meaning":"Boolean indicating whether the patient's current overeating (binge eating) episodes are associated with eating alone because of being embarrassed by how much the patient is eating."} // "eating alone because of being embarrassed by how much the patient is eating"
(declare-const patient_has_finding_of_overeating_now@@associated_with_feeling_disgust_with_oneself_after_the_episode Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current overeating (binge eating) episodes are associated with feeling disgust with oneself after the episode.","when_to_set_to_false":"Set to false if the patient's current overeating (binge eating) episodes are not associated with feeling disgust with oneself after the episode.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current overeating (binge eating) episodes are associated with feeling disgust with oneself after the episode.","meaning":"Boolean indicating whether the patient's current overeating (binge eating) episodes are associated with feeling disgust with oneself after the episode."} // "feeling disgust with oneself after overeating"
(declare-const patient_has_finding_of_overeating_now@@associated_with_feeling_depression_after_the_episode Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current overeating (binge eating) episodes are associated with feeling depression after the episode.","when_to_set_to_false":"Set to false if the patient's current overeating (binge eating) episodes are not associated with feeling depression after the episode.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current overeating (binge eating) episodes are associated with feeling depression after the episode.","meaning":"Boolean indicating whether the patient's current overeating (binge eating) episodes are associated with feeling depression after the episode."} // "feeling depression after overeating"
(declare-const patient_has_finding_of_overeating_now@@associated_with_feeling_very_guilty_after_the_episode Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current overeating (binge eating) episodes are associated with feeling very guilty after the episode.","when_to_set_to_false":"Set to false if the patient's current overeating (binge eating) episodes are not associated with feeling very guilty after the episode.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current overeating (binge eating) episodes are associated with feeling very guilty after the episode.","meaning":"Boolean indicating whether the patient's current overeating (binge eating) episodes are associated with feeling very guilty after the episode."} // "feeling very guilty after overeating"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_overeating_now@@associated_with_eating_much_more_rapidly_than_normal
         patient_has_finding_of_overeating_now)
     :named REQ2_AUXILIARY0)) ;; "eating much more rapidly than normal" is associated with binge eating episodes

(assert
  (! (=> patient_has_finding_of_overeating_now@@associated_with_eating_until_uncomfortably_full
         patient_has_finding_of_overeating_now)
     :named REQ2_AUXILIARY1)) ;; "eating until uncomfortably full" is associated with binge eating episodes

(assert
  (! (=> patient_has_finding_of_overeating_now@@associated_with_eating_large_amounts_when_not_feeling_physical_hunger
         patient_has_finding_of_overeating_now)
     :named REQ2_AUXILIARY2)) ;; "eating large amounts when not feeling physical hunger" is associated with binge eating episodes

(assert
  (! (=> patient_has_finding_of_overeating_now@@associated_with_eating_alone_due_to_embarrassment
         patient_has_finding_of_overeating_now)
     :named REQ2_AUXILIARY3)) ;; "eating alone due to embarrassment" is associated with binge eating episodes

(assert
  (! (=> patient_has_finding_of_overeating_now@@associated_with_feeling_disgust_with_oneself_after_the_episode
         patient_has_finding_of_overeating_now)
     :named REQ2_AUXILIARY4)) ;; "feeling disgust with oneself after overeating" is associated with binge eating episodes

(assert
  (! (=> patient_has_finding_of_overeating_now@@associated_with_feeling_depression_after_the_episode
         patient_has_finding_of_overeating_now)
     :named REQ2_AUXILIARY5)) ;; "feeling depression after overeating" is associated with binge eating episodes

(assert
  (! (=> patient_has_finding_of_overeating_now@@associated_with_feeling_very_guilty_after_the_episode
         patient_has_finding_of_overeating_now)
     :named REQ2_AUXILIARY6)) ;; "feeling very guilty after overeating" is associated with binge eating episodes

;; Define the count of associated features
(define-fun overeating_associated_features_count () Int
  (+ (ite patient_has_finding_of_overeating_now@@associated_with_eating_much_more_rapidly_than_normal 1 0)
     (ite patient_has_finding_of_overeating_now@@associated_with_eating_until_uncomfortably_full 1 0)
     (ite patient_has_finding_of_overeating_now@@associated_with_eating_large_amounts_when_not_feeling_physical_hunger 1 0)
     (ite patient_has_finding_of_overeating_now@@associated_with_eating_alone_due_to_embarrassment 1 0)
     (ite patient_has_finding_of_overeating_now@@associated_with_feeling_disgust_with_oneself_after_the_episode 1 0)
     (ite patient_has_finding_of_overeating_now@@associated_with_feeling_depression_after_the_episode 1 0)
     (ite patient_has_finding_of_overeating_now@@associated_with_feeling_very_guilty_after_the_episode 1 0)
  )
) ;; "≥ 3 of the following associated features with binge eating episodes"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (and patient_has_finding_of_overeating_now
          (>= overeating_associated_features_count 3))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have binge eating episodes that are associated with ≥ 3 of the following features"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_distress_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of distress, regardless of context.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of distress.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of distress.","meaning":"Boolean indicating whether the patient currently has distress."} // "distress"
(declare-const patient_has_finding_of_distress_now@@regarding_binge_eating Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current distress is specifically regarding binge eating.","when_to_set_to_false":"Set to false if the patient's current distress is not regarding binge eating.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current distress is regarding binge eating.","meaning":"Boolean indicating whether the patient's current distress is specifically regarding binge eating."} // "marked distress regarding binge eating"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_distress_now@@regarding_binge_eating
         patient_has_finding_of_distress_now)
     :named REQ3_AUXILIARY0)) ;; "distress regarding binge eating" implies "distress"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: To be included, the patient must have marked distress regarding binge eating.
(assert
  (! patient_has_finding_of_distress_now@@regarding_binge_eating
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "marked distress regarding binge eating"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const binge_eating_days_per_week_value_recorded_in_the_6_months_immediately_prior_to_screening_withunit_days_per_week Real) ;; {"when_to_set_to_value":"Set to the average number of days per week the patient experienced binge eating during the 6 months immediately prior to screening.","when_to_set_to_null":"Set to null if the average number of days per week of binge eating during the 6 months immediately prior to screening is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the average number of days per week the patient experienced binge eating during the 6 months immediately prior to screening."} // "binge eating that occurs, on average, ≥ 2 days per week for ≥ 6 months immediately prior to screening"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (>= binge_eating_days_per_week_value_recorded_in_the_6_months_immediately_prior_to_screening_withunit_days_per_week 2.0)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "binge eating that occurs, on average, ≥ 2 days per week for ≥ 6 months immediately prior to screening"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_binge_eating_exclusively_during_anorexia_nervosa_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has binge eating and this binge eating occurs exclusively during the course of anorexia nervosa.","when_to_set_to_false":"Set to false if the patient currently does not have binge eating that occurs exclusively during the course of anorexia nervosa, including if binge eating is absent or occurs outside the course of anorexia nervosa.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has binge eating that occurs exclusively during the course of anorexia nervosa.","meaning":"Boolean indicating whether the patient currently has binge eating that occurs exclusively during the course of anorexia nervosa."} // "binge eating that occurs exclusively during the course of anorexia nervosa"
(declare-const patient_has_binge_eating_exclusively_during_bulimia_nervosa_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has binge eating and this binge eating occurs exclusively during the course of bulimia nervosa.","when_to_set_to_false":"Set to false if the patient currently does not have binge eating that occurs exclusively during the course of bulimia nervosa, including if binge eating is absent or occurs outside the course of bulimia nervosa.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has binge eating that occurs exclusively during the course of bulimia nervosa.","meaning":"Boolean indicating whether the patient currently has binge eating that occurs exclusively during the course of bulimia nervosa."} // "binge eating that occurs exclusively during the course of bulimia nervosa"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: To be included, the patient must NOT have binge eating that occurs exclusively during the course of bulimia nervosa.
(assert
  (! (not patient_has_binge_eating_exclusively_during_bulimia_nervosa_now)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have binge eating that occurs exclusively during the course of bulimia nervosa."

;; Component 1: To be included, the patient must NOT have binge eating that occurs exclusively during the course of anorexia nervosa.
(assert
  (! (not patient_has_binge_eating_exclusively_during_anorexia_nervosa_now)
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have binge eating that occurs exclusively during the course of anorexia nervosa."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter Real) ;; {"when_to_set_to_value":"Set to the measured BMI value if a numeric measurement of body mass index recorded now is available, in kilograms per square meter.","when_to_set_to_null":"Set to null if no such BMI measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kilograms per square meter."} // "body mass index"
(declare-const patient_has_finding_of_obesity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of obesity.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of obesity.","meaning":"Boolean indicating whether the patient currently has obesity."} // "obesity"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Definition in the requirement: "obesity as defined by body mass index > 30 kilograms per square meter"
(assert
  (! (= patient_has_finding_of_obesity_now
        (> patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 30.0))
     :named REQ6_AUXILIARY0)) ;; "obesity as defined by body mass index > 30 kilograms per square meter"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_has_finding_of_obesity_now
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have obesity as defined by body mass index > 30 kilograms per square meter."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years AND aged ≤ 65 years"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."} // "a man OR a woman"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is male at the current time."} // "a man OR a woman"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: patient must be (a man OR a woman)
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ7_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (a man OR a woman)."

;; Component 1: patient must be aged ≥ 18 years AND aged ≤ 65 years
(assert
  (! (and (>= patient_age_value_recorded_now_in_years 18.0)
          (<= patient_age_value_recorded_now_in_years 65.0))
     :named REQ7_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 18 years AND aged ≤ 65 years."
