;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "the patient must be (a child)"
(declare-const patient_is_child_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as a child according to the study's definition.","when_to_set_to_false":"Set to false if the patient is currently not classified as a child according to the study's definition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as a child.","meaning":"Boolean indicating whether the patient is currently classified as a child according to the study's definition."}  ;; "the patient must be (a child)"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; No explicit definition of "child" provided in the requirement, so no auxiliary assertion relating age to child status.

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_is_child_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a child."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_weight_decreased_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has experienced weight loss during the past 3 months.","when_to_set_to_false":"Set to false if the patient has not experienced weight loss during the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has experienced weight loss during the past 3 months.","meaning":"Boolean indicating whether the patient has experienced weight loss during the past 3 months."}  ;; "unexplained weight loss during the past 3 months"
(declare-const patient_has_finding_of_weight_decreased_inthepast3months@@despite_adequate_nutrition_and_deworming Bool) ;; {"when_to_set_to_true":"Set to true if the patient's weight loss during the past 3 months occurred despite adequate nutrition and deworming.","when_to_set_to_false":"Set to false if the patient's weight loss during the past 3 months did not occur despite adequate nutrition and deworming.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the weight loss occurred despite adequate nutrition and deworming.","meaning":"Boolean indicating whether the patient's weight loss during the past 3 months occurred despite adequate nutrition and deworming."}  ;; "unexplained weight loss during the past 3 months despite adequate nutrition and deworming"

(declare-const patient_has_finding_of_failure_to_thrive_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had failure to thrive during the past 3 months.","when_to_set_to_false":"Set to false if the patient has not had failure to thrive during the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had failure to thrive during the past 3 months.","meaning":"Boolean indicating whether the patient has had failure to thrive during the past 3 months."}  ;; "documented failure to thrive during the past 3 months"
(declare-const patient_has_finding_of_failure_to_thrive_inthepast3months@@despite_adequate_nutrition_and_deworming Bool) ;; {"when_to_set_to_true":"Set to true if the patient's failure to thrive during the past 3 months occurred despite adequate nutrition and deworming.","when_to_set_to_false":"Set to false if the patient's failure to thrive during the past 3 months did not occur despite adequate nutrition and deworming.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the failure to thrive occurred despite adequate nutrition and deworming.","meaning":"Boolean indicating whether the patient's failure to thrive during the past 3 months occurred despite adequate nutrition and deworming."}  ;; "documented failure to thrive during the past 3 months despite adequate nutrition and deworming"

(declare-const patient_has_finding_of_failure_to_maintain_weight_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had stagnant weight during the past 3 months.","when_to_set_to_false":"Set to false if the patient has not had stagnant weight during the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had stagnant weight during the past 3 months.","meaning":"Boolean indicating whether the patient has had stagnant weight during the past 3 months."}  ;; "stagnant weight during the past 3 months"
(declare-const patient_has_finding_of_failure_to_maintain_weight_inthepast3months@@despite_adequate_nutrition_and_deworming Bool) ;; {"when_to_set_to_true":"Set to true if the patient's stagnant weight during the past 3 months occurred despite adequate nutrition and deworming.","when_to_set_to_false":"Set to false if the patient's stagnant weight during the past 3 months did not occur despite adequate nutrition and deworming.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the stagnant weight occurred despite adequate nutrition and deworming.","meaning":"Boolean indicating whether the patient's stagnant weight during the past 3 months occurred despite adequate nutrition and deworming."}  ;; "stagnant weight during the past 3 months despite adequate nutrition and deworming"

(declare-const patient_has_finding_of_growth_faltering_on_growth_charts_inthepast3months@@despite_adequate_nutrition_and_deworming Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had growth faltering on the growth charts during the past 3 months and this occurred despite adequate nutrition and deworming.","when_to_set_to_false":"Set to false if the patient has not had growth faltering on the growth charts during the past 3 months or if it did not occur despite adequate nutrition and deworming.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had growth faltering on the growth charts during the past 3 months despite adequate nutrition and deworming.","meaning":"Boolean indicating whether the patient has had growth faltering on the growth charts during the past 3 months and this occurred despite adequate nutrition and deworming."}  ;; "growth faltering on the growth charts during the past 3 months despite adequate nutrition and deworming"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply their stem variables
(assert
  (! (=> patient_has_finding_of_weight_decreased_inthepast3months@@despite_adequate_nutrition_and_deworming
         patient_has_finding_of_weight_decreased_inthepast3months)
     :named REQ1_AUXILIARY0)) ;; "unexplained weight loss during the past 3 months despite adequate nutrition and deworming"

(assert
  (! (=> patient_has_finding_of_failure_to_thrive_inthepast3months@@despite_adequate_nutrition_and_deworming
         patient_has_finding_of_failure_to_thrive_inthepast3months)
     :named REQ1_AUXILIARY1)) ;; "documented failure to thrive during the past 3 months despite adequate nutrition and deworming"

(assert
  (! (=> patient_has_finding_of_failure_to_maintain_weight_inthepast3months@@despite_adequate_nutrition_and_deworming
         patient_has_finding_of_failure_to_maintain_weight_inthepast3months)
     :named REQ1_AUXILIARY2)) ;; "stagnant weight during the past 3 months despite adequate nutrition and deworming"

;; Growth faltering on growth charts is a specific case of failure to thrive on growth charts, but here we use the direct variable as per the requirement
;; No umbrella mapping needed since the requirement lists all as alternatives

;; ===================== Constraint Assertions (REQ 1) =====================
;; At least one of the following must be true (all must be "despite adequate nutrition and deworming"):
;; - unexplained weight loss during the past 3 months despite adequate nutrition and deworming
;; - documented failure to thrive during the past 3 months despite adequate nutrition and deworming
;; - stagnant weight during the past 3 months despite adequate nutrition and deworming
;; - growth faltering on the growth charts during the past 3 months despite adequate nutrition and deworming

(assert
  (! (or patient_has_finding_of_weight_decreased_inthepast3months@@despite_adequate_nutrition_and_deworming
         patient_has_finding_of_failure_to_thrive_inthepast3months@@despite_adequate_nutrition_and_deworming
         patient_has_finding_of_failure_to_maintain_weight_inthepast3months@@despite_adequate_nutrition_and_deworming
         patient_has_finding_of_growth_faltering_on_growth_charts_inthepast3months@@despite_adequate_nutrition_and_deworming)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have ((unexplained weight loss during the past 3 months despite adequate nutrition and deworming) OR (documented failure to thrive during the past 3 months despite adequate nutrition and deworming) OR (stagnant weight during the past 3 months despite adequate nutrition and deworming) OR (growth faltering on the growth charts during the past 3 months despite adequate nutrition and deworming))."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const duration_of_non_remittent_cough_in_weeks Real) ;; {"when_to_set_to_value":"Set to the number of weeks the patient has had a non-remittent cough.","when_to_set_to_null":"Set to null if the duration in weeks of the patient's non-remittent cough is unknown, not documented, or cannot be determined.","meaning":"Numeric value for the duration in weeks of the patient's non-remittent cough."}  ;; "a non-remittent cough for more than 2 weeks"
(declare-const duration_of_non_remittent_wheeze_in_weeks Real) ;; {"when_to_set_to_value":"Set to the number of weeks the patient has had a non-remittent wheeze.","when_to_set_to_null":"Set to null if the duration in weeks of the patient's non-remittent wheeze is unknown, not documented, or cannot be determined.","meaning":"Numeric value for the duration in weeks of the patient's non-remittent wheeze."}  ;; "a non-remittent wheeze for more than 2 weeks"
(declare-const patient_has_finding_of_non_remittent_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a non-remittent cough.","when_to_set_to_false":"Set to false if the patient currently does not have a non-remittent cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a non-remittent cough.","meaning":"Boolean indicating whether the patient currently has a non-remittent cough."}  ;; "a non-remittent cough for more than 2 weeks"
(declare-const patient_has_finding_of_non_remittent_wheeze_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a non-remittent wheeze.","when_to_set_to_false":"Set to false if the patient currently does not have a non-remittent wheeze.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a non-remittent wheeze.","meaning":"Boolean indicating whether the patient currently has a non-remittent wheeze."}  ;; "a non-remittent wheeze for more than 2 weeks"

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must have ((a non-remittent cough for more than 2 weeks) OR (a non-remittent wheeze for more than 2 weeks)).
(assert
  (! (or
        (and patient_has_finding_of_non_remittent_cough_now
             (> duration_of_non_remittent_cough_in_weeks 2.0))
        (and patient_has_finding_of_non_remittent_wheeze_now
             (> duration_of_non_remittent_wheeze_in_weeks 2.0)))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have ((a non-remittent cough for more than 2 weeks) OR (a non-remittent wheeze for more than 2 weeks))."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_night_sweats_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had night sweats at any time during the last 2 weeks.","when_to_set_to_false":"Set to false if the patient has not had night sweats at any time during the last 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had night sweats during the last 2 weeks.","meaning":"Boolean indicating whether the patient has had night sweats during the last 2 weeks."}  ;; "night sweats during the last 2 weeks"
(declare-const patient_has_finding_of_night_sweats_inthepast2weeks@@persistent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had persistent night sweats during the last 2 weeks.","when_to_set_to_false":"Set to false if the patient has had night sweats during the last 2 weeks but they were not persistent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the night sweats during the last 2 weeks were persistent.","meaning":"Boolean indicating whether the patient's night sweats during the last 2 weeks were persistent."}  ;; "persistent night sweats during the last 2 weeks"
(declare-const patient_has_finding_of_night_sweats_inthepast2weeks@@intermittent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had intermittent night sweats during the last 2 weeks.","when_to_set_to_false":"Set to false if the patient has had night sweats during the last 2 weeks but they were not intermittent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the night sweats during the last 2 weeks were intermittent.","meaning":"Boolean indicating whether the patient's night sweats during the last 2 weeks were intermittent."}  ;; "intermittent night sweats during the last 2 weeks"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply the stem variable (if persistent or intermittent night sweats, then night sweats)
(assert
  (! (=> patient_has_finding_of_night_sweats_inthepast2weeks@@persistent
         patient_has_finding_of_night_sweats_inthepast2weeks)
     :named REQ3_AUXILIARY0)) ;; "persistent night sweats during the last 2 weeks" implies "night sweats during the last 2 weeks"

(assert
  (! (=> patient_has_finding_of_night_sweats_inthepast2weeks@@intermittent
         patient_has_finding_of_night_sweats_inthepast2weeks)
     :named REQ3_AUXILIARY1)) ;; "intermittent night sweats during the last 2 weeks" implies "night sweats during the last 2 weeks"

;; ===================== Constraint Assertions (REQ 3) =====================
;; The patient must have either persistent or intermittent night sweats during the last 2 weeks
(assert
  (! (or patient_has_finding_of_night_sweats_inthepast2weeks@@persistent
         patient_has_finding_of_night_sweats_inthepast2weeks@@intermittent)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have ((persistent night sweats during the last 2 weeks) OR (intermittent night sweats during the last 2 weeks))."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_fever_duration_value_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days the patient has had a fever if available.","when_to_set_to_null":"Set to null if the duration in days of the patient's fever is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the duration in days that the patient has had a fever."}  ;; "a prolonged fever (temperature > 38 degrees Celsius) for 7 days"
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of fever.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fever.","meaning":"Boolean indicating whether the patient currently has fever."}  ;; "a prolonged fever (temperature > 38 degrees Celsius) for 7 days"
(declare-const patient_temperature_value_recorded_last_7_days_in_celsius Real) ;; {"when_to_set_to_value":"Set to the patient's recorded body temperature in degrees Celsius if available for the last 7 days.","when_to_set_to_null":"Set to null if the patient's body temperature in degrees Celsius over the last 7 days is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's recorded body temperature in degrees Celsius over the last 7 days."}  ;; "a prolonged fever (temperature > 38 degrees Celsius) for 7 days"
(declare-const patient_has_malaria_excluded_now Bool) ;; {"when_to_set_to_true":"Set to true if malaria has been excluded as a cause for the patient's current illness.","when_to_set_to_false":"Set to false if malaria has not been excluded as a cause for the patient's current illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether malaria has been excluded as a cause for the patient's current illness.","meaning":"Boolean indicating whether malaria has been excluded as a cause for the patient's current illness."}  ;; "common causes such as malaria OR pneumonia have been excluded"
(declare-const patient_has_pneumonia_excluded_now Bool) ;; {"when_to_set_to_true":"Set to true if pneumonia has been excluded as a cause for the patient's current illness.","when_to_set_to_false":"Set to false if pneumonia has not been excluded as a cause for the patient's current illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether pneumonia has been excluded as a cause for the patient's current illness.","meaning":"Boolean indicating whether pneumonia has been excluded as a cause for the patient's current illness."}  ;; "common causes such as malaria OR pneumonia have been excluded"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition: "a prolonged fever (temperature > 38 degrees Celsius) for 7 days"
(assert
  (! (and patient_has_finding_of_fever_now
          (>= patient_has_fever_duration_value_in_days 7)
          (> patient_temperature_value_recorded_last_7_days_in_celsius 38.0))
     :named REQ4_AUXILIARY0)) ;; "a prolonged fever (temperature > 38 degrees Celsius) for 7 days"

;; Non-exhaustive examples: "common causes such as malaria OR pneumonia have been excluded"
;; malaria or pneumonia are examples, so exclusion of either suffices for the umbrella "common causes excluded"
(declare-const patient_has_common_causes_excluded_now Bool) ;; {"when_to_set_to_true":"Set to true if common causes for the patient's current illness have been excluded, including but not limited to malaria or pneumonia.","when_to_set_to_false":"Set to false if common causes for the patient's current illness have not been excluded.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether common causes have been excluded.","meaning":"Boolean indicating whether common causes for the patient's current illness have been excluded."}  ;; "common causes such as malaria OR pneumonia have been excluded"
(assert
  (! (=> (or patient_has_malaria_excluded_now
             patient_has_pneumonia_excluded_now)
         patient_has_common_causes_excluded_now)
     :named REQ4_AUXILIARY1)) ;; "common causes such as malaria OR pneumonia have been excluded"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: "a prolonged fever (temperature > 38 degrees Celsius) for 7 days"
(assert
  (! (and patient_has_finding_of_fever_now
          (>= patient_has_fever_duration_value_in_days 7)
          (> patient_temperature_value_recorded_last_7_days_in_celsius 38.0))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "a prolonged fever (temperature > 38 degrees Celsius) for 7 days"

;; Component 1: "common causes such as malaria OR pneumonia have been excluded"
(assert
  (! patient_has_common_causes_excluded_now
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "common causes such as malaria OR pneumonia have been excluded"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_wheezing_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had wheezing during the last 2 weeks.","when_to_set_to_false":"Set to false if the patient has not had wheezing during the last 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had wheezing during the last 2 weeks.","meaning":"Boolean indicating whether the patient has had wheezing during the last 2 weeks."}  ;; "persistent wheeze during the last 2 weeks" OR "non-remitting wheeze during the last 2 weeks"
(declare-const patient_has_finding_of_wheezing_inthepast2weeks@@persistent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had wheezing during the last 2 weeks and the wheezing is persistent.","when_to_set_to_false":"Set to false if the patient has had wheezing during the last 2 weeks and the wheezing is not persistent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the wheezing during the last 2 weeks is persistent.","meaning":"Boolean indicating whether the patient's wheezing during the last 2 weeks is persistent."}  ;; "persistent wheeze during the last 2 weeks"
(declare-const patient_has_finding_of_wheezing_inthepast2weeks@@non_remitting Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had wheezing during the last 2 weeks and the wheezing is non-remitting.","when_to_set_to_false":"Set to false if the patient has had wheezing during the last 2 weeks and the wheezing is not non-remitting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the wheezing during the last 2 weeks is non-remitting.","meaning":"Boolean indicating whether the patient's wheezing during the last 2 weeks is non-remitting."}  ;; "non-remitting wheeze during the last 2 weeks"
(declare-const patient_has_finding_of_stridor_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had stridor during the last 2 weeks.","when_to_set_to_false":"Set to false if the patient has not had stridor during the last 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had stridor during the last 2 weeks.","meaning":"Boolean indicating whether the patient has had stridor during the last 2 weeks."}  ;; "persistent stridor during the last 2 weeks" OR "non-remitting stridor during the last 2 weeks"
(declare-const patient_has_finding_of_stridor_inthepast2weeks@@persistent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had stridor during the last 2 weeks and the stridor is persistent.","when_to_set_to_false":"Set to false if the patient has had stridor during the last 2 weeks and the stridor is not persistent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the stridor during the last 2 weeks is persistent.","meaning":"Boolean indicating whether the patient's stridor during the last 2 weeks is persistent."}  ;; "persistent stridor during the last 2 weeks"
(declare-const patient_has_finding_of_stridor_inthepast2weeks@@non_remitting Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had stridor during the last 2 weeks and the stridor is non-remitting.","when_to_set_to_false":"Set to false if the patient has had stridor during the last 2 weeks and the stridor is not non-remitting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the stridor during the last 2 weeks is non-remitting.","meaning":"Boolean indicating whether the patient's stridor during the last 2 weeks is non-remitting."}  ;; "non-remitting stridor during the last 2 weeks"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_wheezing_inthepast2weeks@@persistent
         patient_has_finding_of_wheezing_inthepast2weeks)
     :named REQ5_AUXILIARY0)) ;; "persistent wheeze during the last 2 weeks"

(assert
  (! (=> patient_has_finding_of_wheezing_inthepast2weeks@@non_remitting
         patient_has_finding_of_wheezing_inthepast2weeks)
     :named REQ5_AUXILIARY1)) ;; "non-remitting wheeze during the last 2 weeks"

(assert
  (! (=> patient_has_finding_of_stridor_inthepast2weeks@@persistent
         patient_has_finding_of_stridor_inthepast2weeks)
     :named REQ5_AUXILIARY2)) ;; "persistent stridor during the last 2 weeks"

(assert
  (! (=> patient_has_finding_of_stridor_inthepast2weeks@@non_remitting
         patient_has_finding_of_stridor_inthepast2weeks)
     :named REQ5_AUXILIARY3)) ;; "non-remitting stridor during the last 2 weeks"

;; ===================== Constraint Assertions (REQ 5) =====================
;; The patient must have ((persistent wheeze during the last 2 weeks) OR (non-remitting wheeze during the last 2 weeks) OR (persistent stridor during the last 2 weeks) OR (non-remitting stridor during the last 2 weeks)).
(assert
  (! (or patient_has_finding_of_wheezing_inthepast2weeks@@persistent
         patient_has_finding_of_wheezing_inthepast2weeks@@non_remitting
         patient_has_finding_of_stridor_inthepast2weeks@@persistent
         patient_has_finding_of_stridor_inthepast2weeks@@non_remitting)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have ((persistent wheeze during the last 2 weeks) OR (non-remitting wheeze during the last 2 weeks) OR (persistent stridor during the last 2 weeks) OR (non-remitting stridor during the last 2 weeks))."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_finding_of_persistent_chest_pain_in_last_2_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had persistent chest pain during the last 2 weeks.","when_to_set_to_false":"Set to false if the patient has not had persistent chest pain during the last 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had persistent chest pain during the last 2 weeks.","meaning":"Boolean indicating whether the patient has had persistent chest pain during the last 2 weeks."}  ;; "persistent chest pain during the last 2 weeks"
(declare-const patient_has_finding_of_localized_chest_pain_in_last_2_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had localized chest pain during the last 2 weeks.","when_to_set_to_false":"Set to false if the patient has not had localized chest pain during the last 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had localized chest pain during the last 2 weeks.","meaning":"Boolean indicating whether the patient has had localized chest pain during the last 2 weeks."}  ;; "localized chest pain during the last 2 weeks"
(declare-const patient_has_finding_of_pleuritic_chest_pain_in_last_2_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had pleuritic chest pain during the last 2 weeks.","when_to_set_to_false":"Set to false if the patient has not had pleuritic chest pain during the last 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had pleuritic chest pain during the last 2 weeks.","meaning":"Boolean indicating whether the patient has had pleuritic chest pain during the last 2 weeks."}  ;; "pleuritic chest pain during the last 2 weeks"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: To be included, the patient must have ((persistent chest pain during the last 2 weeks) OR (localized chest pain during the last 2 weeks) OR (pleuritic chest pain during the last 2 weeks)).
(assert
  (! (or patient_has_finding_of_persistent_chest_pain_in_last_2_weeks
         patient_has_finding_of_localized_chest_pain_in_last_2_weeks
         patient_has_finding_of_pleuritic_chest_pain_in_last_2_weeks)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have ((persistent chest pain during the last 2 weeks) OR (localized chest pain during the last 2 weeks) OR (pleuritic chest pain during the last 2 weeks))."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_finding_of_fatigue_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has experienced fatigue at any time during the last 2 weeks.","when_to_set_to_false":"Set to false if the patient has not experienced fatigue during the last 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has experienced fatigue during the last 2 weeks.","meaning":"Boolean indicating whether the patient has experienced fatigue during the last 2 weeks."}  ;; "unexplained fatigue during the last 2 weeks"
(declare-const patient_has_finding_of_fatigue_inthepast2weeks@@unexplained Bool) ;; {"when_to_set_to_true":"Set to true if the patient's fatigue during the last 2 weeks is unexplained.","when_to_set_to_false":"Set to false if the patient's fatigue during the last 2 weeks is explained by a known cause.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's fatigue during the last 2 weeks is unexplained.","meaning":"Boolean indicating whether the patient's fatigue during the last 2 weeks is unexplained."}  ;; "unexplained fatigue during the last 2 weeks"

(declare-const patient_has_finding_of_asthenia_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has experienced weakness at any time during the last 2 weeks.","when_to_set_to_false":"Set to false if the patient has not experienced weakness during the last 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has experienced weakness during the last 2 weeks.","meaning":"Boolean indicating whether the patient has experienced weakness during the last 2 weeks."}  ;; "unexplained weakness during the last 2 weeks"
(declare-const patient_has_finding_of_asthenia_inthepast2weeks@@unexplained Bool) ;; {"when_to_set_to_true":"Set to true if the patient's weakness during the last 2 weeks is unexplained.","when_to_set_to_false":"Set to false if the patient's weakness during the last 2 weeks is explained by a known cause.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's weakness during the last 2 weeks is unexplained.","meaning":"Boolean indicating whether the patient's weakness during the last 2 weeks is unexplained."}  ;; "unexplained weakness during the last 2 weeks"

(declare-const patient_has_finding_of_indifference_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has experienced apathy at any time during the last 2 weeks.","when_to_set_to_false":"Set to false if the patient has not experienced apathy during the last 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has experienced apathy during the last 2 weeks.","meaning":"Boolean indicating whether the patient has experienced apathy during the last 2 weeks."}  ;; "unexplained apathy during the last 2 weeks"
(declare-const patient_has_finding_of_indifference_inthepast2weeks@@unexplained Bool) ;; {"when_to_set_to_true":"Set to true if the patient's apathy during the last 2 weeks is unexplained.","when_to_set_to_false":"Set to false if the patient's apathy during the last 2 weeks is explained by a known cause.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's apathy during the last 2 weeks is unexplained.","meaning":"Boolean indicating whether the patient's apathy during the last 2 weeks is unexplained."}  ;; "unexplained apathy during the last 2 weeks"

(declare-const patient_has_finding_of_lethargy_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has experienced lethargy at any time during the last 2 weeks.","when_to_set_to_false":"Set to false if the patient has not experienced lethargy during the last 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has experienced lethargy during the last 2 weeks.","meaning":"Boolean indicating whether the patient has experienced lethargy during the last 2 weeks."}  ;; "unexplained lethargy during the last 2 weeks"
(declare-const patient_has_finding_of_lethargy_inthepast2weeks@@unexplained Bool) ;; {"when_to_set_to_true":"Set to true if the patient's lethargy during the last 2 weeks is unexplained.","when_to_set_to_false":"Set to false if the patient's lethargy during the last 2 weeks is explained by a known cause.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's lethargy during the last 2 weeks is unexplained.","meaning":"Boolean indicating whether the patient's lethargy during the last 2 weeks is unexplained."}  ;; "unexplained lethargy during the last 2 weeks"

(declare-const patient_has_finding_of_reduced_playfulness_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has experienced reduced playfulness at any time during the last 2 weeks.","when_to_set_to_false":"Set to false if the patient has not experienced reduced playfulness during the last 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has experienced reduced playfulness during the last 2 weeks.","meaning":"Boolean indicating whether the patient has experienced reduced playfulness during the last 2 weeks."}  ;; "unexplained reduced playfulness during the last 2 weeks"
(declare-const patient_has_finding_of_reduced_playfulness_inthepast2weeks@@unexplained Bool) ;; {"when_to_set_to_true":"Set to true if the patient's reduced playfulness during the last 2 weeks is unexplained.","when_to_set_to_false":"Set to false if the patient's reduced playfulness during the last 2 weeks is explained by a known cause.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's reduced playfulness during the last 2 weeks is unexplained.","meaning":"Boolean indicating whether the patient's reduced playfulness during the last 2 weeks is unexplained."}  ;; "unexplained reduced playfulness during the last 2 weeks"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_fatigue_inthepast2weeks@@unexplained
         patient_has_finding_of_fatigue_inthepast2weeks)
     :named REQ7_AUXILIARY0)) ;; "unexplained fatigue during the last 2 weeks"

(assert
  (! (=> patient_has_finding_of_asthenia_inthepast2weeks@@unexplained
         patient_has_finding_of_asthenia_inthepast2weeks)
     :named REQ7_AUXILIARY1)) ;; "unexplained weakness during the last 2 weeks"

(assert
  (! (=> patient_has_finding_of_indifference_inthepast2weeks@@unexplained
         patient_has_finding_of_indifference_inthepast2weeks)
     :named REQ7_AUXILIARY2)) ;; "unexplained apathy during the last 2 weeks"

(assert
  (! (=> patient_has_finding_of_lethargy_inthepast2weeks@@unexplained
         patient_has_finding_of_lethargy_inthepast2weeks)
     :named REQ7_AUXILIARY3)) ;; "unexplained lethargy during the last 2 weeks"

(assert
  (! (=> patient_has_finding_of_reduced_playfulness_inthepast2weeks@@unexplained
         patient_has_finding_of_reduced_playfulness_inthepast2weeks)
     :named REQ7_AUXILIARY4)) ;; "unexplained reduced playfulness during the last 2 weeks"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: To be included, the patient must have ((unexplained fatigue during the last 2 weeks) OR (unexplained weakness during the last 2 weeks) OR (unexplained apathy during the last 2 weeks) OR (unexplained lethargy during the last 2 weeks) OR (unexplained reduced playfulness during the last 2 weeks)).
(assert
  (! (or patient_has_finding_of_fatigue_inthepast2weeks@@unexplained
         patient_has_finding_of_asthenia_inthepast2weeks@@unexplained
         patient_has_finding_of_indifference_inthepast2weeks@@unexplained
         patient_has_finding_of_lethargy_inthepast2weeks@@unexplained
         patient_has_finding_of_reduced_playfulness_inthepast2weeks@@unexplained)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have ((unexplained fatigue during the last 2 weeks) OR (unexplained weakness during the last 2 weeks) OR (unexplained apathy during the last 2 weeks) OR (unexplained lethargy during the last 2 weeks) OR (unexplained reduced playfulness during the last 2 weeks))."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_has_finding_of_superficial_lymph_node_mass_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a superficial lymph node mass.","when_to_set_to_false":"Set to false if the patient currently does not have a superficial lymph node mass.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a superficial lymph node mass.","meaning":"Boolean indicating whether the patient currently has a superficial lymph node mass."}  ;; "the patient must have (a painless superficial lymph node mass with size greater than 2 centimeters by 2 centimeters)"
(declare-const patient_has_finding_of_superficial_lymph_node_mass_now@@painless Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current superficial lymph node mass is painless.","when_to_set_to_false":"Set to false if the patient's current superficial lymph node mass is painful.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current superficial lymph node mass is painless.","meaning":"Boolean indicating whether the patient's current superficial lymph node mass is painless."}  ;; "the patient must have (a painless superficial lymph node mass with size greater than 2 centimeters by 2 centimeters)"
(declare-const superficial_lymph_node_mass_size_value_now_in_cm2 Real) ;; {"when_to_set_to_value":"Set to the numeric value of the area (in cm^2) of the patient's current superficial lymph node mass if known and measured.","when_to_set_to_null":"Set to null if the size of the patient's current superficial lymph node mass is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the area of the patient's current superficial lymph node mass in square centimeters (cm^2)."}  ;; "the patient must have (a painless superficial lymph node mass with size greater than 2 centimeters by 2 centimeters)"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_superficial_lymph_node_mass_now@@painless
         patient_has_finding_of_superficial_lymph_node_mass_now)
     :named REQ8_AUXILIARY0)) ;; "the patient must have (a painless superficial lymph node mass with size greater than 2 centimeters by 2 centimeters)"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (and patient_has_finding_of_superficial_lymph_node_mass_now@@painless
          (> superficial_lymph_node_mass_size_value_now_in_cm2 4.0))
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have (a painless superficial lymph node mass with size greater than 2 centimeters by 2 centimeters)"

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const meningitis_duration_value_recorded_now_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days corresponding to the duration of the patient's current episode of meningitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days the patient's current episode of meningitis has lasted.","meaning":"Numeric value indicating the duration in days of the patient's current episode of meningitis."}  ;; "chronic onset meningitis (duration greater than 5 days)"
(declare-const patient_has_finding_of_cerebrospinal_fluid_lymphocytosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of lymphocytic predominance in cerebrospinal fluid.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of lymphocytic predominance in cerebrospinal fluid.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has lymphocytic predominance in cerebrospinal fluid.","meaning":"Boolean indicating whether the patient currently has lymphocytic predominance in cerebrospinal fluid."}  ;; "lymphocytic predominance in cerebrospinal fluid"
(declare-const patient_has_finding_of_chronic_meningitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chronic meningitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chronic meningitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic meningitis.","meaning":"Boolean indicating whether the patient currently has chronic meningitis."}  ;; "chronic onset meningitis (duration greater than 5 days)"
(declare-const patient_has_finding_of_chronic_onset_meningitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic onset meningitis.","when_to_set_to_false":"Set to false if the patient currently does not have chronic onset meningitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic onset meningitis.","meaning":"Boolean indicating whether the patient currently has chronic onset meningitis."}  ;; "chronic onset meningitis (duration greater than 5 days)"
(declare-const patient_has_finding_of_chronic_onset_meningitis_now@@duration_greater_than_5_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current chronic onset meningitis has a duration greater than 5 days.","when_to_set_to_false":"Set to false if the patient's current chronic onset meningitis has a duration of 5 days or less.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the duration of the patient's current chronic onset meningitis is greater than 5 days.","meaning":"Boolean indicating whether the patient's current chronic onset meningitis has a duration greater than 5 days."}  ;; "chronic onset meningitis (duration greater than 5 days)"
(declare-const patient_has_finding_of_meningitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of meningitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of meningitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has meningitis.","meaning":"Boolean indicating whether the patient currently has meningitis."}  ;; "meningitis"
(declare-const patient_has_finding_of_meningitis_now@@not_responding_to_antibiotic_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has meningitis and the meningitis is not responding to antibiotic treatment.","when_to_set_to_false":"Set to false if the patient currently has meningitis and the meningitis is responding to antibiotic treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's meningitis is responding to antibiotic treatment.","meaning":"Boolean indicating whether the patient's current meningitis is not responding to antibiotic treatment."}  ;; "meningitis not responding to antibiotic treatment"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable for chronic onset meningitis duration
(assert
  (! (=> patient_has_finding_of_chronic_onset_meningitis_now@@duration_greater_than_5_days
         patient_has_finding_of_chronic_onset_meningitis_now)
     :named REQ9_AUXILIARY0)) ;; "chronic onset meningitis (duration greater than 5 days)"

;; Definition: duration > 5 days implies chronic onset meningitis with qualifier
(assert
  (! (= patient_has_finding_of_chronic_onset_meningitis_now@@duration_greater_than_5_days
        (> meningitis_duration_value_recorded_now_in_days 5))
     :named REQ9_AUXILIARY1)) ;; "duration greater than 5 days"

;; Qualifier variable for meningitis not responding to antibiotics
(assert
  (! (=> patient_has_finding_of_meningitis_now@@not_responding_to_antibiotic_treatment
         patient_has_finding_of_meningitis_now)
     :named REQ9_AUXILIARY2)) ;; "meningitis not responding to antibiotic treatment"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Component 0: To be included, the patient must have ((chronic onset meningitis (duration greater than 5 days)) OR (lymphocytic predominance in cerebrospinal fluid) OR (meningitis not responding to antibiotic treatment)).
(assert
  (! (or patient_has_finding_of_chronic_onset_meningitis_now@@duration_greater_than_5_days
         patient_has_finding_of_cerebrospinal_fluid_lymphocytosis_now
         patient_has_finding_of_meningitis_now@@not_responding_to_antibiotic_treatment)
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have ((chronic onset meningitis (duration greater than 5 days)) OR (lymphocytic predominance in cerebrospinal fluid) OR (meningitis not responding to antibiotic treatment))."

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_has_finding_of_kyphosis_deformity_of_spine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a kyphosis deformity of the spine (gibbus).","when_to_set_to_false":"Set to false if the patient currently does not have a kyphosis deformity of the spine (gibbus).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a kyphosis deformity of the spine (gibbus).","meaning":"Boolean indicating whether the patient currently has a kyphosis deformity of the spine (gibbus)."}  ;; "To be included, the patient must have recent gibbus."
(declare-const patient_has_finding_of_kyphosis_deformity_of_spine_recently Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a kyphosis deformity of the spine (gibbus) in the recent past.","when_to_set_to_false":"Set to false if the patient has not had a kyphosis deformity of the spine (gibbus) in the recent past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a kyphosis deformity of the spine (gibbus) in the recent past.","meaning":"Boolean indicating whether the patient has had a kyphosis deformity of the spine (gibbus) in the recent past."}  ;; "To be included, the patient must have recent gibbus."

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
  (! patient_has_finding_of_kyphosis_deformity_of_spine_recently
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have recent gibbus."

;; ===================== Declarations for the criterion (REQ 11) =====================
(declare-const patient_has_finding_of_ascites_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of ascites.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of ascites.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of ascites.","meaning":"Boolean indicating whether the patient currently has ascites."}  ;; "To be included, the patient must have ascites."
(declare-const patient_has_finding_of_swollen_abdomen_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of swollen abdomen (abdominal distention).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of swollen abdomen (abdominal distention).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of swollen abdomen (abdominal distention).","meaning":"Boolean indicating whether the patient currently has swollen abdomen (abdominal distention)."}  ;; "To be included, the patient must have abdominal distention."

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! patient_has_finding_of_swollen_abdomen_now
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have abdominal distention."

(assert
  (! patient_has_finding_of_ascites_now
     :named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have ascites."

;; ===================== Declarations for the criterion (REQ 12) =====================
(declare-const patient_has_documented_tuberculosis_contact_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has documented tuberculosis contact.","when_to_set_to_false":"Set to false if the patient currently does not have documented tuberculosis contact.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has documented tuberculosis contact.","meaning":"Boolean indicating whether the patient currently has documented tuberculosis contact."}  ;; "documented tuberculosis contact"
(declare-const patient_has_finding_of_airspace_opacification_not_responding_to_antibiotics_on_chest_radiograph_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has airspace opacification on chest radiograph that is not responding to antibiotics.","when_to_set_to_false":"Set to false if the patient currently does not have airspace opacification on chest radiograph that is not responding to antibiotics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has airspace opacification on chest radiograph that is not responding to antibiotics.","meaning":"Boolean indicating whether the patient currently has airspace opacification on chest radiograph that is not responding to antibiotics."}  ;; "airspace opacification not responding to antibiotics"
(declare-const patient_has_finding_of_hilar_adenopathy_on_chest_radiograph_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hilar adenopathy on chest radiograph.","when_to_set_to_false":"Set to false if the patient currently does not have hilar adenopathy on chest radiograph.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hilar adenopathy on chest radiograph.","meaning":"Boolean indicating whether the patient currently has hilar adenopathy on chest radiograph."}  ;; "hilar adenopathy"
(declare-const patient_has_finding_of_imaging_of_thorax_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an abnormal chest radiograph (imaging of thorax abnormal).","when_to_set_to_false":"Set to false if the patient currently does not have an abnormal chest radiograph (imaging of thorax abnormal).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an abnormal chest radiograph (imaging of thorax abnormal).","meaning":"Boolean indicating whether the patient currently has an abnormal chest radiograph (imaging of thorax abnormal)."}  ;; "abnormal chest radiograph"
(declare-const patient_has_finding_of_imaging_of_thorax_abnormal_now@@suggestive_of_tuberculosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's abnormal chest radiograph (imaging of thorax abnormal) is suggestive of tuberculosis.","when_to_set_to_false":"Set to false if the patient's abnormal chest radiograph (imaging of thorax abnormal) is not suggestive of tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal chest radiograph is suggestive of tuberculosis.","meaning":"Boolean indicating whether the patient's abnormal chest radiograph (imaging of thorax abnormal) is suggestive of tuberculosis."}  ;; "abnormal chest radiograph suggestive of tuberculosis"
(declare-const patient_has_finding_of_lung_cavities_on_chest_radiograph_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has lung cavities on chest radiograph.","when_to_set_to_false":"Set to false if the patient currently does not have lung cavities on chest radiograph.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has lung cavities on chest radiograph.","meaning":"Boolean indicating whether the patient currently has lung cavities on chest radiograph."}  ;; "lung cavities"
(declare-const patient_has_finding_of_miliary_infiltrates_on_chest_radiograph_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has miliary infiltrates on chest radiograph.","when_to_set_to_false":"Set to false if the patient currently does not have miliary infiltrates on chest radiograph.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has miliary infiltrates on chest radiograph.","meaning":"Boolean indicating whether the patient currently has miliary infiltrates on chest radiograph."}  ;; "miliary infiltrates"
(declare-const patient_has_finding_of_paratracheal_adenopathy_on_chest_radiograph_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has paratracheal adenopathy on chest radiograph.","when_to_set_to_false":"Set to false if the patient currently does not have paratracheal adenopathy on chest radiograph.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has paratracheal adenopathy on chest radiograph.","meaning":"Boolean indicating whether the patient currently has paratracheal adenopathy on chest radiograph."}  ;; "paratracheal adenopathy"
(declare-const patient_has_finding_of_paratracheal_adenopathy_on_chest_radiograph_now@@with_or_without_airway_compression Bool) ;; {"when_to_set_to_true":"Set to true if the patient's paratracheal adenopathy on chest radiograph is present with or without airway compression.","when_to_set_to_false":"Set to false if the patient's paratracheal adenopathy on chest radiograph is not present with or without airway compression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's paratracheal adenopathy on chest radiograph is present with or without airway compression.","meaning":"Boolean indicating whether the patient's paratracheal adenopathy on chest radiograph is present with or without airway compression."}  ;; "paratracheal adenopathy (with or without airway compression)"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_imaging_of_thorax_abnormal_now@@suggestive_of_tuberculosis
         patient_has_finding_of_imaging_of_thorax_abnormal_now)
     :named REQ12_AUXILIARY0)) ;; "abnormal chest radiograph suggestive of tuberculosis"

(assert
  (! (=> patient_has_finding_of_paratracheal_adenopathy_on_chest_radiograph_now@@with_or_without_airway_compression
         patient_has_finding_of_paratracheal_adenopathy_on_chest_radiograph_now)
     :named REQ12_AUXILIARY1)) ;; "paratracheal adenopathy (with or without airway compression)"

;; Non-exhaustive examples imply umbrella subclass
(assert
  (! (=> (or patient_has_finding_of_hilar_adenopathy_on_chest_radiograph_now
             patient_has_finding_of_paratracheal_adenopathy_on_chest_radiograph_now@@with_or_without_airway_compression
             patient_has_finding_of_airspace_opacification_not_responding_to_antibiotics_on_chest_radiograph_now
             patient_has_documented_tuberculosis_contact_now
             patient_has_finding_of_lung_cavities_on_chest_radiograph_now
             patient_has_finding_of_miliary_infiltrates_on_chest_radiograph_now)
         patient_has_finding_of_imaging_of_thorax_abnormal_now@@suggestive_of_tuberculosis)
     :named REQ12_AUXILIARY2)) ;; "abnormal chest radiograph suggestive of tuberculosis with non-exhaustive examples (hilar adenopathy OR paratracheal adenopathy (with or without airway compression) OR airspace opacification not responding to antibiotics OR documented tuberculosis contact OR lung cavities OR miliary infiltrates)"

;; ===================== Constraint Assertions (REQ 12) =====================
;; Component 0: "To be included, the patient must be a child."
(assert
  (! patient_is_child_now
     :named REQ12_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be a child"

;; Component 1: "To be included, the patient must have an abnormal chest radiograph suggestive of tuberculosis..."
(assert
  (! patient_has_finding_of_imaging_of_thorax_abnormal_now@@suggestive_of_tuberculosis
     :named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "abnormal chest radiograph suggestive of tuberculosis"

;; ===================== Declarations for the inclusion criterion (REQ 13) =====================
(declare-const patient_is_asymptomatic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently asymptomatic.","when_to_set_to_false":"Set to false if the patient is currently symptomatic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently asymptomatic.","meaning":"Boolean indicating whether the patient is currently asymptomatic."}  ;; "the patient must be (an asymptomatic child)"
(declare-const patient_has_documented_tuberculosis_contact_within_past_1_year Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of contact with a tuberculosis patient within the past one year.","when_to_set_to_false":"Set to false if the patient does not have a documented history of contact with a tuberculosis patient within the past one year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a documented history of contact with a tuberculosis patient within the past one year.","meaning":"Boolean indicating whether the patient has a documented history of contact with a tuberculosis patient within the past one year."}  ;; "history of recent contact (within past one year) with (a pulmonary tuberculosis smear positive patient OR a pulmonary tuberculosis culture positive patient)"
(declare-const patient_has_documented_tuberculosis_contact_within_past_1_year@@contact_with_pulmonary_tuberculosis_smear_positive_or_culture_positive_patient Bool) ;; {"when_to_set_to_true":"Set to true if the patient's documented contact within the past one year was with a pulmonary tuberculosis smear positive patient or a pulmonary tuberculosis culture positive patient.","when_to_set_to_false":"Set to false if the patient's documented contact within the past one year was not with a pulmonary tuberculosis smear positive patient or a pulmonary tuberculosis culture positive patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's documented contact within the past one year was with a pulmonary tuberculosis smear positive patient or a pulmonary tuberculosis culture positive patient.","meaning":"Boolean indicating whether the patient's documented contact within the past one year was with a pulmonary tuberculosis smear positive patient or a pulmonary tuberculosis culture positive patient."}  ;; "history of recent contact (within past one year) with (a pulmonary tuberculosis smear positive patient OR a pulmonary tuberculosis culture positive patient)"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_documented_tuberculosis_contact_within_past_1_year@@contact_with_pulmonary_tuberculosis_smear_positive_or_culture_positive_patient
         patient_has_documented_tuberculosis_contact_within_past_1_year)
     :named REQ13_AUXILIARY0)) ;; "history of recent contact (within past one year) with (a pulmonary tuberculosis smear positive patient OR a pulmonary tuberculosis culture positive patient)"

;; ===================== Constraint Assertions (REQ 13) =====================
;; Component 0: The patient must be an asymptomatic child
(assert
  (! (and patient_is_child_now
          patient_is_asymptomatic_now)
     :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be (an asymptomatic child)"

;; Component 1: The patient must have a history of recent contact (within past one year) with (a pulmonary tuberculosis smear positive patient OR a pulmonary tuberculosis culture positive patient)
(assert
  (! patient_has_documented_tuberculosis_contact_within_past_1_year@@contact_with_pulmonary_tuberculosis_smear_positive_or_culture_positive_patient
     :named REQ13_COMPONENT1_OTHER_REQUIREMENTS)) ;; "history of recent contact (within past one year) with (a pulmonary tuberculosis smear positive patient OR a pulmonary tuberculosis culture positive patient)"

;; Component 2: The patient must have an abnormal chest radiograph
(assert
  (! patient_has_finding_of_imaging_of_thorax_abnormal_now
     :named REQ13_COMPONENT2_OTHER_REQUIREMENTS)) ;; "have an abnormal chest radiograph"

;; ===================== Declarations for the criterion (REQ 14) =====================
(declare-const patient_has_informed_consent_signed_by_parent_or_legal_representative Bool) ;; {"when_to_set_to_true":"Set to true if the patient has informed consent and it is signed by either a parent or a legal representative.","when_to_set_to_false":"Set to false if the patient does not have informed consent signed by either a parent or a legal representative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has informed consent signed by either a parent or a legal representative.","meaning":"Boolean indicating whether the patient has informed consent signed by either a parent or a legal representative."}  ;; "the patient must have informed consent signed by (a parent OR a legal representative)."
(declare-const patient_has_informed_consent_signed_by_parent_or_legal_representative@@signed_by_parent_or_legal_representative Bool) ;; {"when_to_set_to_true":"Set to true if the patient's informed consent is signed by either a parent or a legal representative.","when_to_set_to_false":"Set to false if the patient's informed consent is not signed by either a parent or a legal representative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's informed consent is signed by either a parent or a legal representative.","meaning":"Boolean indicating whether the patient's informed consent is signed by either a parent or a legal representative."}  ;; "the patient must have informed consent signed by (a parent OR a legal representative)."

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_informed_consent_signed_by_parent_or_legal_representative@@signed_by_parent_or_legal_representative
         patient_has_informed_consent_signed_by_parent_or_legal_representative)
     :named REQ14_AUXILIARY0)) ;; "the patient must have informed consent signed by (a parent OR a legal representative)."

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
  (! patient_has_informed_consent_signed_by_parent_or_legal_representative@@signed_by_parent_or_legal_representative
     :named REQ14_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have informed consent signed by (a parent OR a legal representative)."
