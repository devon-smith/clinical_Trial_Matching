;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_sleep_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of sleep disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of sleep disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of sleep disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of sleep disorder."} ;; "sleep disorder"
(declare-const patient_has_diagnosis_of_chronic_insomnia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic insomnia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic insomnia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic insomnia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic insomnia."} ;; "chronic insomnia"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive example: diagnosis of chronic insomnia implies sleep disorder
(assert
(! (=> patient_has_diagnosis_of_chronic_insomnia_now
      patient_has_diagnosis_of_sleep_disorder_now)
   :named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples ((diagnosis of chronic insomnia))"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_sleep_disorder_now)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosed sleep disorder with non-exhaustive examples ((diagnosis of chronic insomnia))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_duration_of_sleep_value_recorded_now_withunit_hours Real) ;; {"when_to_set_to_value":"Set to the measured value in hours if the patient's sleep duration is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's sleep duration recorded now, in hours."} ;; "sleep duration"

(declare-const patient_has_finding_of_breathing_related_sleep_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of breathing-related sleep disorder (sleep disordered breathing).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of breathing-related sleep disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of breathing-related sleep disorder.","meaning":"Boolean indicating whether the patient currently has a breathing-related sleep disorder."} ;; "sleep disordered breathing"

(declare-const patient_has_finding_of_breathing_related_sleep_disorder_now@@untreated Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a breathing-related sleep disorder and it is untreated.","when_to_set_to_false":"Set to false if the patient currently has a breathing-related sleep disorder and it is treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the breathing-related sleep disorder is untreated.","meaning":"Boolean indicating whether the patient's current breathing-related sleep disorder is untreated."} ;; "untreated sleep disordered breathing"

(declare-const patient_has_finding_of_sleep_apnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of sleep apnea.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of sleep apnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of sleep apnea.","meaning":"Boolean indicating whether the patient currently has sleep apnea."} ;; "sleep apnea"

(declare-const patient_has_finding_of_sleep_apnea_now@@severity_impairs_ability_to_increase_sleep_duration_intervention_group Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sleep apnea at a level of severity that impairs the ability to increase sleep duration (Intervention Group).","when_to_set_to_false":"Set to false if the patient currently has sleep apnea but the severity does not impair the ability to increase sleep duration (Intervention Group).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether sleep apnea severity impairs ability to increase sleep duration (Intervention Group).","meaning":"Boolean indicating whether the patient's current sleep apnea severity impairs ability to increase sleep duration (Intervention Group)."} ;; "diagnosis of sleep apnea at a level of severity ... that would impair the ability to increase sleep duration (Intervention Group)"

(declare-const patient_has_finding_of_sleep_apnea_now@@severity_impairs_ability_to_maintain_sleep_duration_comparison_group Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sleep apnea at a level of severity that impairs the ability to maintain sleep duration (Comparison Group).","when_to_set_to_false":"Set to false if the patient currently has sleep apnea but the severity does not impair the ability to maintain sleep duration (Comparison Group).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether sleep apnea severity impairs ability to maintain sleep duration (Comparison Group).","meaning":"Boolean indicating whether the patient's current sleep apnea severity impairs ability to maintain sleep duration (Comparison Group)."} ;; "diagnosis of sleep apnea at a level of severity ... that would impair the ability to maintain sleep duration (Comparison Group)"

(declare-const patient_has_finding_of_upper_airway_resistance_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of upper airway resistance syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of upper airway resistance syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of upper airway resistance syndrome.","meaning":"Boolean indicating whether the patient currently has upper airway resistance syndrome."} ;; "upper airway resistance syndrome"

(declare-const patient_has_finding_of_upper_airway_resistance_syndrome_now@@impairs_ability_to_increase_sleep_duration_intervention_group Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has upper airway resistance syndrome that impairs the ability to increase sleep duration (Intervention Group).","when_to_set_to_false":"Set to false if the patient currently has upper airway resistance syndrome but it does not impair the ability to increase sleep duration (Intervention Group).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether upper airway resistance syndrome impairs ability to increase sleep duration (Intervention Group).","meaning":"Boolean indicating whether the patient's current upper airway resistance syndrome impairs ability to increase sleep duration (Intervention Group)."} ;; "diagnosis of upper airway resistance syndrome that would impair the ability to increase sleep duration (Intervention Group)"

(declare-const patient_has_finding_of_upper_airway_resistance_syndrome_now@@impairs_ability_to_maintain_sleep_duration_comparison_group Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has upper airway resistance syndrome that impairs the ability to maintain sleep duration (Comparison Group).","when_to_set_to_false":"Set to false if the patient currently has upper airway resistance syndrome but it does not impair the ability to maintain sleep duration (Comparison Group).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether upper airway resistance syndrome impairs ability to maintain sleep duration (Comparison Group).","meaning":"Boolean indicating whether the patient's current upper airway resistance syndrome impairs ability to maintain sleep duration (Comparison Group)."} ;; "diagnosis of upper airway resistance syndrome that would impair the ability to maintain sleep duration (Comparison Group)"

(declare-const patient_is_undergoing_continuous_positive_airway_pressure_ventilation_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing continuous positive airway pressure ventilation treatment.","when_to_set_to_false":"Set to false if the patient is currently not undergoing continuous positive airway pressure ventilation treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing continuous positive airway pressure ventilation treatment.","meaning":"Boolean indicating whether the patient is currently undergoing continuous positive airway pressure ventilation treatment."} ;; "continuous positive airway pressure treatment"

(declare-const patient_is_undergoing_continuous_positive_airway_pressure_ventilation_treatment_now@@in_place_for_greater_than_or_equal_to_three_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing CPAP treatment and it has been in place for greater than or equal to three months.","when_to_set_to_false":"Set to false if the patient is currently undergoing CPAP treatment but it has been in place for less than three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether CPAP treatment has been in place for greater than or equal to three months.","meaning":"Boolean indicating whether the patient's current CPAP treatment has been in place for greater than or equal to three months."} ;; "continuous positive airway pressure treatment that has been in place for greater than or equal to three months"

(declare-const patient_is_undergoing_continuous_positive_airway_pressure_ventilation_treatment_now@@improves_sleep Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing CPAP treatment and the treatment improves sleep.","when_to_set_to_false":"Set to false if the patient is currently undergoing CPAP treatment but the treatment does not improve sleep.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether CPAP treatment improves sleep.","meaning":"Boolean indicating whether the patient's current CPAP treatment improves sleep."} ;; "continuous positive airway pressure treatment ... improves sleep"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_sleep_apnea_now@@severity_impairs_ability_to_increase_sleep_duration_intervention_group
           patient_has_finding_of_sleep_apnea_now@@severity_impairs_ability_to_maintain_sleep_duration_comparison_group
           patient_has_finding_of_upper_airway_resistance_syndrome_now@@impairs_ability_to_increase_sleep_duration_intervention_group
           patient_has_finding_of_upper_airway_resistance_syndrome_now@@impairs_ability_to_maintain_sleep_duration_comparison_group)
       patient_has_finding_of_breathing_related_sleep_disorder_now@@untreated)
:named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples ((diagnosis of sleep apnea ... OR diagnosis of upper airway resistance syndrome ...))"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_breathing_related_sleep_disorder_now@@untreated
       patient_has_finding_of_breathing_related_sleep_disorder_now)
:named REQ1_AUXILIARY1)) ;; "untreated sleep disordered breathing"

(assert
(! (=> patient_has_finding_of_sleep_apnea_now@@severity_impairs_ability_to_increase_sleep_duration_intervention_group
       patient_has_finding_of_sleep_apnea_now)
:named REQ1_AUXILIARY2)) ;; "diagnosis of sleep apnea at a level of severity ... that would impair the ability to increase sleep duration (Intervention Group)"

(assert
(! (=> patient_has_finding_of_sleep_apnea_now@@severity_impairs_ability_to_maintain_sleep_duration_comparison_group
       patient_has_finding_of_sleep_apnea_now)
:named REQ1_AUXILIARY3)) ;; "diagnosis of sleep apnea at a level of severity ... that would impair the ability to maintain sleep duration (Comparison Group)"

(assert
(! (=> patient_has_finding_of_upper_airway_resistance_syndrome_now@@impairs_ability_to_increase_sleep_duration_intervention_group
       patient_has_finding_of_upper_airway_resistance_syndrome_now)
:named REQ1_AUXILIARY4)) ;; "diagnosis of upper airway resistance syndrome that would impair the ability to increase sleep duration (Intervention Group)"

(assert
(! (=> patient_has_finding_of_upper_airway_resistance_syndrome_now@@impairs_ability_to_maintain_sleep_duration_comparison_group
       patient_has_finding_of_upper_airway_resistance_syndrome_now)
:named REQ1_AUXILIARY5)) ;; "diagnosis of upper airway resistance syndrome that would impair the ability to maintain sleep duration (Comparison Group)"

;; CPAP qualifiers imply stem variable
(assert
(! (=> patient_is_undergoing_continuous_positive_airway_pressure_ventilation_treatment_now@@in_place_for_greater_than_or_equal_to_three_months
       patient_is_undergoing_continuous_positive_airway_pressure_ventilation_treatment_now)
:named REQ1_AUXILIARY6)) ;; "continuous positive airway pressure treatment that has been in place for greater than or equal to three months"

(assert
(! (=> patient_is_undergoing_continuous_positive_airway_pressure_ventilation_treatment_now@@improves_sleep
       patient_is_undergoing_continuous_positive_airway_pressure_ventilation_treatment_now)
:named REQ1_AUXILIARY7)) ;; "continuous positive airway pressure treatment ... improves sleep"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have untreated sleep disordered breathing (with non-exhaustive examples) AND must NOT lack CPAP treatment that has been in place >= 3 months AND improves sleep
(assert
(! (not (and
         patient_has_finding_of_breathing_related_sleep_disorder_now@@untreated
         (not (and patient_is_undergoing_continuous_positive_airway_pressure_ventilation_treatment_now@@in_place_for_greater_than_or_equal_to_three_months
                   patient_is_undergoing_continuous_positive_airway_pressure_ventilation_treatment_now@@improves_sleep))))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has untreated sleep disordered breathing with non-exhaustive examples ... AND the patient does NOT have continuous positive airway pressure treatment that has been in place for greater than or equal to three months AND improves sleep"

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_restless_legs_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of restless leg syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of restless leg syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of restless leg syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of restless leg syndrome."} ;; "restless leg syndrome"
(declare-const patient_has_diagnosis_of_periodic_limb_movement_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of periodic limb movement disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of periodic limb movement disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of periodic limb movement disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of periodic limb movement disorder."} ;; "periodic limb movement disorder"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_restless_legs_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of restless leg syndrome."

(assert
(! (not patient_has_diagnosis_of_periodic_limb_movement_disorder_now)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of periodic limb movement disorder."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_parasomnia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received a diagnosis of parasomnia at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never received a diagnosis of parasomnia at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received a diagnosis of parasomnia.","meaning":"Boolean indicating whether the patient has ever been diagnosed with parasomnia in their medical history."} ;; "diagnosis of parasomnia"

(declare-const patient_has_diagnosis_of_rem_sleep_behavior_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received a diagnosis of REM sleep behavior disorder at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never received a diagnosis of REM sleep behavior disorder at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received a diagnosis of REM sleep behavior disorder.","meaning":"Boolean indicating whether the patient has ever been diagnosed with REM sleep behavior disorder in their medical history."} ;; "diagnosis of rapid eye movement sleep behavior disorder"

(declare-const patient_has_diagnosis_of_confusional_arousal_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received a diagnosis of confusional arousal disorder at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never received a diagnosis of confusional arousal disorder at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received a diagnosis of confusional arousal disorder.","meaning":"Boolean indicating whether the patient has ever been diagnosed with confusional arousal disorder in their medical history."} ;; "diagnosis of confusional arousals"

(declare-const patient_has_diagnosis_of_sleep_terror_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received a diagnosis of sleep terror disorder at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never received a diagnosis of sleep terror disorder at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received a diagnosis of sleep terror disorder.","meaning":"Boolean indicating whether the patient has ever been diagnosed with sleep terror disorder in their medical history."} ;; "diagnosis of sleep terrors"

(declare-const patient_has_diagnosis_of_sleep_walking_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received a diagnosis of sleepwalking disorder at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never received a diagnosis of sleepwalking disorder at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received a diagnosis of sleepwalking disorder.","meaning":"Boolean indicating whether the patient has ever been diagnosed with sleepwalking disorder in their medical history."} ;; "diagnosis of sleepwalking"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_rem_sleep_behavior_disorder_inthehistory
           patient_has_diagnosis_of_confusional_arousal_disorder_inthehistory
           patient_has_diagnosis_of_sleep_terror_disorder_inthehistory
           patient_has_diagnosis_of_sleep_walking_disorder_inthehistory)
       patient_has_diagnosis_of_parasomnia_inthehistory)
   :named REQ3_AUXILIARY0)) ;; "with non-exhaustive examples ((diagnosis of rapid eye movement sleep behavior disorder) OR (diagnosis of confusional arousals) OR (diagnosis of sleep terrors) OR (diagnosis of sleepwalking) OR (diagnosis of sleep violence))."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_parasomnia_inthehistory)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of parasomnia with non-exhaustive examples ((diagnosis of rapid eye movement sleep behavior disorder) OR (diagnosis of confusional arousals) OR (diagnosis of sleep terrors) OR (diagnosis of sleepwalking) OR (diagnosis of sleep violence))."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_bruxism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of bruxism.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of bruxism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of bruxism.","meaning":"Boolean indicating whether the patient currently has a diagnosis of bruxism."} ;; "diagnosis of primary bruxism"

(declare-const patient_has_diagnosis_of_bruxism_now@@interferes_with_ability_to_sleep_additional_ninety_minutes_per_night Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of bruxism and this bruxism interferes with the ability to sleep an additional ninety minutes per night.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of bruxism but it does not interfere with the ability to sleep an additional ninety minutes per night.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's bruxism interferes with the ability to sleep an additional ninety minutes per night.","meaning":"Boolean indicating whether the patient's bruxism interferes with the ability to sleep an additional ninety minutes per night."} ;; "bruxism that interferes with the ability to sleep an additional ninety minutes per night"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_bruxism_now@@interferes_with_ability_to_sleep_additional_ninety_minutes_per_night
       patient_has_diagnosis_of_bruxism_now)
   :named REQ4_AUXILIARY0)) ;; "diagnosis of primary bruxism that interferes with the ability to sleep an additional ninety minutes per night"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_bruxism_now@@interferes_with_ability_to_sleep_additional_ninety_minutes_per_night)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of primary bruxism that interferes with the ability to sleep an additional ninety minutes per night."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_narcolepsy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of narcolepsy.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of narcolepsy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of narcolepsy.","meaning":"Boolean indicating whether the patient currently has a diagnosis of narcolepsy."} ;; "narcolepsy"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_diagnosis_of_narcolepsy_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of narcolepsy."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_central_sleep_apnea_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of central sleep apnea syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of central sleep apnea syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of central sleep apnea syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of central sleep apnea syndrome."} ;; "central apnea"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_diagnosis_of_central_sleep_apnea_syndrome_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of central apnea."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_body_mass_index_value_6_months_ago_withunit_kgperm2 Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body mass index was recorded exactly 6 months ago (unit: kg/m^2).","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's body mass index as measured 6 months ago (unit: kg/m^2)."} ;; "body mass index as measured 6 months ago"

(declare-const patient_body_mass_index_value_recorded_inthepast6months_withunit_kgperm2 Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body mass index was recorded in the past six months (unit: kg/m^2).","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's body mass index recorded in the past six months (unit: kg/m^2)."} ;; "body mass index recorded in the past six months"

(declare-const patient_body_mass_index_value_recorded_inthepast6months_withunit_kgperm2@@voluntary_loss Bool) ;; {"when_to_set_to_true":"Set to true if the loss in body mass index over the past six months is voluntary.","when_to_set_to_false":"Set to false if the loss in body mass index over the past six months is not voluntary.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the loss in body mass index over the past six months is voluntary.","meaning":"Boolean indicating whether any loss in body mass index over the past six months is voluntary."} ;; "voluntary losses in body mass index over the past six months"

(declare-const patient_has_finding_of_weight_decreased_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of decreased weight (weight loss).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of decreased weight (weight loss).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of decreased weight (weight loss).","meaning":"Boolean indicating whether the patient currently has the clinical finding of decreased weight (weight loss)."} ;; "weight loss"

(declare-const patient_is_currently_enrolled_in_weight_loss_program Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being enrolled in a weight loss program.","when_to_set_to_false":"Set to false if the patient is not currently being enrolled in a weight loss program.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being enrolled in a weight loss program.","meaning":"Boolean indicating whether the patient is currently being enrolled in a weight loss program."} ;; "currently being enrolled in a weight loss program"

(declare-const patients_body_weight_is_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's body weight is currently abnormal (unstable).","when_to_set_to_false":"Set to false if the patient's body weight is currently normal (stable).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's body weight is currently abnormal (unstable).","meaning":"Boolean indicating whether the patient's body weight is currently abnormal (unstable)."} ;; "unstable weight"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Definition: unstable weight = voluntary losses in body mass index > 5% over the past 6 months
(assert
(! (= patients_body_weight_is_abnormal_now
     (and patient_body_mass_index_value_recorded_inthepast6months_withunit_kgperm2@@voluntary_loss
          (< patient_body_mass_index_value_recorded_inthepast6months_withunit_kgperm2
             (* 0.95 patient_body_mass_index_value_6_months_ago_withunit_kgperm2))))
:named REQ7_AUXILIARY0)) ;; "unstable weight defined as voluntary losses in body mass index greater than five percent over the past six months"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion: unstable weight OR currently being enrolled in a weight loss program
(assert
(! (not (or patients_body_weight_is_abnormal_now
            patient_is_currently_enrolled_in_weight_loss_program))
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has unstable weight defined as voluntary losses in body mass index greater than five percent over the past six months) OR (the patient is currently being enrolled in a weight loss program)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_untreated_diabetes_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has untreated diabetes.","when_to_set_to_false":"Set to false if the patient currently does not have untreated diabetes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has untreated diabetes.","meaning":"Boolean indicating whether the patient currently has untreated diabetes."} ;; "untreated diabetes"
(declare-const patient_has_finding_of_diabetic_poor_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of poorly controlled diabetes (uncontrolled diabetes).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of poorly controlled diabetes (uncontrolled diabetes).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has poorly controlled diabetes (uncontrolled diabetes).","meaning":"Boolean indicating whether the patient currently has poorly controlled diabetes (uncontrolled diabetes)."} ;; "uncontrolled diabetes"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion: The patient is excluded if (the patient has untreated diabetes) OR (the patient has uncontrolled diabetes).
(assert
(! (not (or patient_has_finding_of_untreated_diabetes_now
            patient_has_finding_of_diabetic_poor_control_now))
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has untreated diabetes) OR (the patient has uncontrolled diabetes)."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_poor_hypertension_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of poor hypertension control (severe uncontrolled hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of poor hypertension control (severe uncontrolled hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has poor hypertension control (severe uncontrolled hypertension).","meaning":"Boolean indicating whether the patient currently has poor hypertension control (severe uncontrolled hypertension)."} ;; "severe uncontrolled hypertension"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_poor_hypertension_control_now)
    :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe uncontrolled hypertension."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic obstructive lung disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic obstructive lung disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic obstructive lung disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic obstructive lung disease."} ;; "chronic obstructive pulmonary disease"
(declare-const patient_has_diagnosis_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of disease."} ;; "disease"
(declare-const patient_has_diagnosis_of_disease_now@@is_chronic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disease diagnosis is chronic.","when_to_set_to_false":"Set to false if the patient's current disease diagnosis is not chronic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disease diagnosis is chronic.","meaning":"Boolean indicating whether the patient's current disease diagnosis is chronic."} ;; "chronic"
(declare-const patient_has_diagnosis_of_disease_now@@is_organ_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disease diagnosis is an organ disease.","when_to_set_to_false":"Set to false if the patient's current disease diagnosis is not an organ disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disease diagnosis is an organ disease.","meaning":"Boolean indicating whether the patient's current disease diagnosis is an organ disease."} ;; "organ disease"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Non-exhaustive example: diagnosis of chronic obstructive pulmonary disease implies diagnosis of chronic organ disease
(assert
(! (=> patient_has_diagnosis_of_chronic_obstructive_lung_disease_now
      (and patient_has_diagnosis_of_disease_now
           patient_has_diagnosis_of_disease_now@@is_chronic
           patient_has_diagnosis_of_disease_now@@is_organ_disease))
:named REQ10_AUXILIARY0)) ;; "with non-exhaustive examples ((a diagnosis of chronic obstructive pulmonary disease))."

;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_disease_now@@is_chronic
      patient_has_diagnosis_of_disease_now)
:named REQ10_AUXILIARY1)) ;; "chronic"

(assert
(! (=> patient_has_diagnosis_of_disease_now@@is_organ_disease
      patient_has_diagnosis_of_disease_now)
:named REQ10_AUXILIARY2)) ;; "organ disease"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Exclusion: patient must NOT have a diagnosis of chronic organ disease
(assert
(! (not (and patient_has_diagnosis_of_disease_now
             patient_has_diagnosis_of_disease_now@@is_chronic
             patient_has_diagnosis_of_disease_now@@is_organ_disease))
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of chronic organ disease with non-exhaustive examples ((a diagnosis of chronic obstructive pulmonary disease))."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_diagnosis_of_cardiac_arrhythmia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cardiac arrhythmia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cardiac arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cardiac arrhythmia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cardiac arrhythmia."} ;; "cardiac arrhythmia"
(declare-const patient_has_diagnosis_of_cardiac_arrhythmia_now@@is_chronic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of cardiac arrhythmia is chronic.","when_to_set_to_false":"Set to false if the patient's current diagnosis of cardiac arrhythmia is not chronic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of cardiac arrhythmia is chronic.","meaning":"Boolean indicating whether the patient's current diagnosis of cardiac arrhythmia is chronic."} ;; "chronic cardiac arrhythmia"
(declare-const patient_has_diagnosis_of_cardiac_arrhythmia_now@@requires_treatments Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of cardiac arrhythmia requires treatments.","when_to_set_to_false":"Set to false if the patient's current diagnosis of cardiac arrhythmia does not require treatments.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of cardiac arrhythmia requires treatments.","meaning":"Boolean indicating whether the patient's current diagnosis of cardiac arrhythmia requires treatments."} ;; "cardiac arrhythmia requiring treatments"
(declare-const patient_has_diagnosis_of_disease_now@@is_chronic@@is_organ_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a chronic organ disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a chronic organ disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a chronic organ disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a chronic organ disease."} ;; "diagnosis of chronic organ disease"
(declare-const patient_has_diagnosis_of_disease_now@@is_chronic@@is_organ_disease@@requires_treatments Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current chronic organ disease requires treatments.","when_to_set_to_false":"Set to false if the patient's current chronic organ disease does not require treatments.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current chronic organ disease requires treatments.","meaning":"Boolean indicating whether the patient's current chronic organ disease requires treatments."} ;; "chronic organ disease requiring treatments"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Non-exhaustive example: chronic cardiac arrhythmia requiring treatments implies chronic organ disease
(assert
(! (=> (and patient_has_diagnosis_of_cardiac_arrhythmia_now@@is_chronic
            patient_has_diagnosis_of_cardiac_arrhythmia_now@@requires_treatments)
       patient_has_diagnosis_of_disease_now@@is_chronic@@is_organ_disease)
:named REQ11_AUXILIARY0)) ;; "with non-exhaustive examples ((a diagnosis of chronic cardiac arrhythmia requiring treatments))."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_cardiac_arrhythmia_now@@is_chronic
       patient_has_diagnosis_of_cardiac_arrhythmia_now)
:named REQ11_AUXILIARY1)) ;; "chronic cardiac arrhythmia"

(assert
(! (=> patient_has_diagnosis_of_cardiac_arrhythmia_now@@requires_treatments
       patient_has_diagnosis_of_cardiac_arrhythmia_now)
:named REQ11_AUXILIARY2)) ;; "cardiac arrhythmia requiring treatments"

(assert
(! (=> patient_has_diagnosis_of_disease_now@@is_chronic@@is_organ_disease@@requires_treatments
       patient_has_diagnosis_of_disease_now@@is_chronic@@is_organ_disease)
:named REQ11_AUXILIARY3)) ;; "chronic organ disease requiring treatments"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_diagnosis_of_disease_now@@is_chronic@@is_organ_disease)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of chronic organ disease with non-exhaustive examples ((a diagnosis of chronic cardiac arrhythmia requiring treatments))."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_diagnosis_of_gastro_esophageal_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of gastro-esophageal disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of gastro-esophageal disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of gastro-esophageal disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of gastro-esophageal disorder."} ;; "diagnosis of gastro-esophageal disorder"

(declare-const patient_has_diagnosis_of_gastro_esophageal_disorder_now@@associated_with_sleep_related_symptoms Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of gastro-esophageal disorder is associated with sleep-related symptoms.","when_to_set_to_false":"Set to false if the patient's current diagnosis of gastro-esophageal disorder is not associated with sleep-related symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of gastro-esophageal disorder is associated with sleep-related symptoms.","meaning":"Boolean indicating whether the patient's current diagnosis of gastro-esophageal disorder is associated with sleep-related symptoms."} ;; "diagnosis of gastro-esophageal disorder associated with sleep-related symptoms"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Non-exhaustive example: diagnosis of gastro-esophageal disorder associated with sleep-related symptoms is an example of chronic organ disease
(assert
(! (=> patient_has_diagnosis_of_gastro_esophageal_disorder_now@@associated_with_sleep_related_symptoms
      patient_has_diagnosis_of_disease_now@@is_chronic@@is_organ_disease)
   :named REQ12_AUXILIARY0)) ;; "with non-exhaustive examples ((a diagnosis of gastro-esophageal disorder associated with sleep-related symptoms))."

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_diagnosis_of_gastro_esophageal_disorder_now@@associated_with_sleep_related_symptoms
      patient_has_diagnosis_of_gastro_esophageal_disorder_now)
   :named REQ12_AUXILIARY1)) ;; "diagnosis of gastro-esophageal disorder associated with sleep-related symptoms" implies "diagnosis of gastro-esophageal disorder"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_diagnosis_of_disease_now@@is_chronic@@is_organ_disease)
   :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of chronic organ disease with non-exhaustive examples ((a diagnosis of gastro-esophageal disorder associated with sleep-related symptoms))."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_chronic_use_of_prescription_medication_known_to_affect_sleep Bool) ;; {"when_to_set_to_true":"Set to true if the patient has chronic use of prescription medications known to affect sleep.","when_to_set_to_false":"Set to false if the patient does not have chronic use of prescription medications known to affect sleep.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has chronic use of prescription medications known to affect sleep.","meaning":"Boolean indicating whether the patient has chronic use of prescription medications known to affect sleep."} ;; "chronic use of prescription medications known to affect sleep"

(declare-const patient_has_chronic_use_of_over_the_counter_medication_known_to_affect_sleep Bool) ;; {"when_to_set_to_true":"Set to true if the patient has chronic use of over-the-counter medications known to affect sleep.","when_to_set_to_false":"Set to false if the patient does not have chronic use of over-the-counter medications known to affect sleep.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has chronic use of over-the-counter medications known to affect sleep.","meaning":"Boolean indicating whether the patient has chronic use of over-the-counter medications known to affect sleep."} ;; "chronic use of over-the-counter medications known to affect sleep"

(declare-const patient_is_exposed_to_steroid_hormone_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to steroid hormones at any time in the history.","when_to_set_to_false":"Set to false if the patient has not been exposed to steroid hormones at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to steroid hormones in the history.","meaning":"Boolean indicating whether the patient has been exposed to steroid hormones at any time in the history."} ;; "systemic steroids"

(declare-const patient_is_exposed_to_steroid_hormone_inthehistory@@systemic Bool) ;; {"when_to_set_to_true":"Set to true if the exposure is specifically to systemic steroid hormones.","when_to_set_to_false":"Set to false if the exposure is not to systemic steroid hormones.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is to systemic steroid hormones.","meaning":"Boolean indicating whether the exposure to steroid hormones is specifically to systemic steroids."} ;; "systemic steroids"

(declare-const patient_is_exposed_to_steroid_hormone_inthehistory@@chronic_use Bool) ;; {"when_to_set_to_true":"Set to true if the exposure is due to chronic use.","when_to_set_to_false":"Set to false if the exposure is not due to chronic use.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is due to chronic use.","meaning":"Boolean indicating whether the exposure to steroid hormones is due to chronic use."} ;; "chronic use"

(declare-const patient_is_exposed_to_steroid_hormone_inthehistory@@prescription_medication_known_to_affect_sleep Bool) ;; {"when_to_set_to_true":"Set to true if the exposure is specifically to prescription medications known to affect sleep.","when_to_set_to_false":"Set to false if the exposure is not to prescription medications known to affect sleep.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is to prescription medications known to affect sleep.","meaning":"Boolean indicating whether the exposure to steroid hormones is specifically to prescription medications known to affect sleep."} ;; "prescription medications known to affect sleep"

(declare-const patient_is_exposed_to_steroid_hormone_inthehistory@@over_the_counter_medication_known_to_affect_sleep Bool) ;; {"when_to_set_to_true":"Set to true if the exposure is specifically to over-the-counter medications known to affect sleep.","when_to_set_to_false":"Set to false if the exposure is not to over-the-counter medications known to affect sleep.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is to over-the-counter medications known to affect sleep.","meaning":"Boolean indicating whether the exposure to steroid hormones is specifically to over-the-counter medications known to affect sleep."} ;; "over-the-counter medications known to affect sleep"

(declare-const patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to nonsteroidal anti-inflammatory agents at any time in the history.","when_to_set_to_false":"Set to false if the patient has not been exposed to nonsteroidal anti-inflammatory agents at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to nonsteroidal anti-inflammatory agents in the history.","meaning":"Boolean indicating whether the patient has been exposed to nonsteroidal anti-inflammatory agents at any time in the history."} ;; "nonsteroidal anti-inflammatory drugs"

(declare-const patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthehistory@@chronic_use Bool) ;; {"when_to_set_to_true":"Set to true if the exposure is due to chronic use.","when_to_set_to_false":"Set to false if the exposure is not due to chronic use.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is due to chronic use.","meaning":"Boolean indicating whether the exposure to nonsteroidal anti-inflammatory agents is due to chronic use."} ;; "chronic use"

(declare-const patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthehistory@@prescription_medication_known_to_affect_sleep Bool) ;; {"when_to_set_to_true":"Set to true if the exposure is specifically to prescription medications known to affect sleep.","when_to_set_to_false":"Set to false if the exposure is not to prescription medications known to affect sleep.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is to prescription medications known to affect sleep.","meaning":"Boolean indicating whether the exposure to nonsteroidal anti-inflammatory agents is specifically to prescription medications known to affect sleep."} ;; "prescription medications known to affect sleep"

(declare-const patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthehistory@@over_the_counter_medication_known_to_affect_sleep Bool) ;; {"when_to_set_to_true":"Set to true if the exposure is specifically to over-the-counter medications known to affect sleep.","when_to_set_to_false":"Set to false if the exposure is not to over-the-counter medications known to affect sleep.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is to over-the-counter medications known to affect sleep.","meaning":"Boolean indicating whether the exposure to nonsteroidal anti-inflammatory agents is specifically to over-the-counter medications known to affect sleep."} ;; "over-the-counter medications known to affect sleep"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Non-exhaustive examples imply umbrella term (prescription medications known to affect sleep)
(assert
(! (=> (or (and patient_is_exposed_to_steroid_hormone_inthehistory@@systemic
                patient_is_exposed_to_steroid_hormone_inthehistory@@chronic_use
                patient_is_exposed_to_steroid_hormone_inthehistory@@prescription_medication_known_to_affect_sleep)
           (and patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthehistory@@chronic_use
                patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthehistory@@prescription_medication_known_to_affect_sleep))
    patient_has_chronic_use_of_prescription_medication_known_to_affect_sleep)
:named REQ13_AUXILIARY0)) ;; "with non-exhaustive examples (systemic steroids, nonsteroidal anti-inflammatory drugs)" for prescription medications

;; Non-exhaustive examples imply umbrella term (over-the-counter medications known to affect sleep)
(assert
(! (=> (or (and patient_is_exposed_to_steroid_hormone_inthehistory@@systemic
                patient_is_exposed_to_steroid_hormone_inthehistory@@chronic_use
                patient_is_exposed_to_steroid_hormone_inthehistory@@over_the_counter_medication_known_to_affect_sleep)
           (and patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthehistory@@chronic_use
                patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthehistory@@over_the_counter_medication_known_to_affect_sleep))
    patient_has_chronic_use_of_over_the_counter_medication_known_to_affect_sleep)
:named REQ13_AUXILIARY1)) ;; "with non-exhaustive examples (systemic steroids, nonsteroidal anti-inflammatory drugs)" for over-the-counter medications

;; Qualifier variables imply corresponding stem variables (steroid hormone exposure)
(assert
(! (=> patient_is_exposed_to_steroid_hormone_inthehistory@@systemic
       patient_is_exposed_to_steroid_hormone_inthehistory)
:named REQ13_AUXILIARY2)) ;; "systemic steroids"

(assert
(! (=> patient_is_exposed_to_steroid_hormone_inthehistory@@chronic_use
       patient_is_exposed_to_steroid_hormone_inthehistory)
:named REQ13_AUXILIARY3)) ;; "chronic use"

(assert
(! (=> patient_is_exposed_to_steroid_hormone_inthehistory@@prescription_medication_known_to_affect_sleep
       patient_is_exposed_to_steroid_hormone_inthehistory)
:named REQ13_AUXILIARY4)) ;; "prescription medications known to affect sleep"

(assert
(! (=> patient_is_exposed_to_steroid_hormone_inthehistory@@over_the_counter_medication_known_to_affect_sleep
       patient_is_exposed_to_steroid_hormone_inthehistory)
:named REQ13_AUXILIARY5)) ;; "over-the-counter medications known to affect sleep"

;; Qualifier variables imply corresponding stem variables (NSAID exposure)
(assert
(! (=> patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthehistory@@chronic_use
       patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthehistory)
:named REQ13_AUXILIARY6)) ;; "chronic use"

(assert
(! (=> patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthehistory@@prescription_medication_known_to_affect_sleep
       patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthehistory)
:named REQ13_AUXILIARY7)) ;; "prescription medications known to affect sleep"

(assert
(! (=> patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthehistory@@over_the_counter_medication_known_to_affect_sleep
       patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthehistory)
:named REQ13_AUXILIARY8)) ;; "over-the-counter medications known to affect sleep"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_chronic_use_of_prescription_medication_known_to_affect_sleep)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic use of prescription medications known to affect sleep with non-exhaustive examples (systemic steroids, nonsteroidal anti-inflammatory drugs)."

(assert
(! (not patient_has_chronic_use_of_over_the_counter_medication_known_to_affect_sleep)
:named REQ13_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic use of over-the-counter medications known to affect sleep with non-exhaustive examples (systemic steroids, nonsteroidal anti-inflammatory drugs)."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_is_undergoing_anticonvulsant_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing anticonvulsant therapy.","when_to_set_to_false":"Set to false if the patient is not currently undergoing anticonvulsant therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing anticonvulsant therapy.","meaning":"Boolean indicating whether the patient is currently undergoing anticonvulsant therapy."} ;; "anticonvulsant therapy"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_is_undergoing_anticonvulsant_therapy_now)
    :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is on current anticonvulsant therapy."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_diagnosis_of_chronic_fatigue_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic fatigue syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic fatigue syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic fatigue syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic fatigue syndrome."} ;; "chronic fatigue syndrome"
(declare-const patient_has_diagnosis_of_fibromyalgia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of fibromyalgia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of fibromyalgia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of fibromyalgia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of fibromyalgia."} ;; "fibromyalgia"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_diagnosis_of_chronic_fatigue_syndrome_now)
:named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of chronic fatigue syndrome."

(assert
(! (not patient_has_diagnosis_of_fibromyalgia_now)
:named REQ15_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of fibromyalgia."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_diagnosis_of_acromegaly_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acromegaly.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acromegaly.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acromegaly.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acromegaly."} ;; "acromegaly"

(declare-const patient_has_diagnosis_of_hypothyroidism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypothyroidism.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypothyroidism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypothyroidism.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypothyroidism."} ;; "hypothyroidism"

(declare-const patient_has_diagnosis_of_hypothyroidism_now@@not_on_stable_replacement_dose_of_thyroid_hormone Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypothyroidism and is NOT on a stable replacement dose of thyroid hormone.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of hypothyroidism and IS on a stable replacement dose of thyroid hormone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is on a stable replacement dose of thyroid hormone.","meaning":"Boolean indicating whether the patient with hypothyroidism is NOT on a stable replacement dose of thyroid hormone."} ;; "NOT on a stable replacement dose of thyroid hormone"

(declare-const patient_has_diagnosis_of_pituitary_dependent_hypercortisolism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Cushing disease (pituitary-dependent hypercortisolism).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Cushing disease (pituitary-dependent hypercortisolism).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Cushing disease (pituitary-dependent hypercortisolism).","meaning":"Boolean indicating whether the patient currently has a diagnosis of Cushing disease (pituitary-dependent hypercortisolism)."} ;; "Cushing disease"

(declare-const patient_has_diagnosis_of_disorder_of_endocrine_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of an endocrine disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of an endocrine disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of an endocrine disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of an endocrine disorder."} ;; "endocrine disorder"

(declare-const patient_has_diagnosis_of_disorder_of_endocrine_system_now@@known_to_affect_sleep Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of an endocrine disorder that is known to affect sleep.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of an endocrine disorder that is NOT known to affect sleep.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the endocrine disorder is known to affect sleep.","meaning":"Boolean indicating whether the patient's endocrine disorder is known to affect sleep."} ;; "other endocrine disorder known to affect sleep"

;; ===================== Auxiliary Assertions (REQ 16) =====================
;; Qualifier variable implies corresponding stem variable for hypothyroidism
(assert
(! (=> patient_has_diagnosis_of_hypothyroidism_now@@not_on_stable_replacement_dose_of_thyroid_hormone
      patient_has_diagnosis_of_hypothyroidism_now)
    :named REQ16_AUXILIARY0)) ;; "the patient has a diagnosis of hypothyroidism AND the patient is NOT on a stable replacement dose of thyroid hormone"

;; Qualifier variable implies corresponding stem variable for endocrine disorder
(assert
(! (=> patient_has_diagnosis_of_disorder_of_endocrine_system_now@@known_to_affect_sleep
      patient_has_diagnosis_of_disorder_of_endocrine_system_now)
    :named REQ16_AUXILIARY1)) ;; "other endocrine disorder known to affect sleep"

;; ===================== Constraint Assertions (REQ 16) =====================
;; Exclusion: acromegaly
(assert
(! (not patient_has_diagnosis_of_acromegaly_now)
    :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of acromegaly."

;; Exclusion: hypothyroidism AND NOT on stable replacement dose of thyroid hormone
(assert
(! (not patient_has_diagnosis_of_hypothyroidism_now@@not_on_stable_replacement_dose_of_thyroid_hormone)
    :named REQ16_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of hypothyroidism AND the patient is NOT on a stable replacement dose of thyroid hormone."

;; Exclusion: Cushing disease
(assert
(! (not patient_has_diagnosis_of_pituitary_dependent_hypercortisolism_now)
    :named REQ16_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of Cushing disease."

;; Exclusion: other endocrine disorder known to affect sleep
(assert
(! (not patient_has_diagnosis_of_disorder_of_endocrine_system_now@@known_to_affect_sleep)
    :named REQ16_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of other endocrine disorder known to affect sleep."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_diagnosis_of_major_depressive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of major depressive disorder (major depression).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of major depressive disorder (major depression).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of major depressive disorder (major depression).","meaning":"Boolean indicating whether the patient currently has a diagnosis of major depressive disorder (major depression)."} ;; "major depression"
(declare-const patient_has_diagnosis_of_major_depressive_disorder_now@@poorly_controlled Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of major depressive disorder (major depression) and the disorder is poorly controlled.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of major depressive disorder (major depression) and the disorder is not poorly controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the major depressive disorder is poorly controlled.","meaning":"Boolean indicating whether the patient's current major depressive disorder is poorly controlled."} ;; "poorly controlled major depression"
(declare-const patient_has_undergone_antidepressant_therapy_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone antidepressant therapy at any time in the past three months.","when_to_set_to_false":"Set to false if the patient has not undergone antidepressant therapy at any time in the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone antidepressant therapy in the past three months.","meaning":"Boolean indicating whether the patient has undergone antidepressant therapy in the past three months."} ;; "antidepressant treatment"
(declare-const patient_has_undergone_antidepressant_therapy_inthepast3months@@stable Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone antidepressant therapy in the past three months and the therapy was stable.","when_to_set_to_false":"Set to false if the patient has undergone antidepressant therapy in the past three months and the therapy was not stable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antidepressant therapy was stable.","meaning":"Boolean indicating whether the antidepressant therapy in the past three months was stable."} ;; "stable pharmacological antidepressant treatment for three months"
(declare-const patient_has_undergone_antidepressant_therapy_inthepast3months@@pharmacological Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone antidepressant therapy in the past three months and the therapy was pharmacological.","when_to_set_to_false":"Set to false if the patient has undergone antidepressant therapy in the past three months and the therapy was not pharmacological.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antidepressant therapy was pharmacological.","meaning":"Boolean indicating whether the antidepressant therapy in the past three months was pharmacological."} ;; "pharmacological antidepressant treatment for three months"
(declare-const patient_is_in_remission_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in remission from major depressive disorder.","when_to_set_to_false":"Set to false if the patient is currently not in remission from major depressive disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in remission from major depressive disorder.","meaning":"Boolean indicating whether the patient is currently in remission from major depressive disorder."} ;; "in remission"
(declare-const patient_is_in_remission_now@@without_substantial_weight_gain Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in remission from major depressive disorder and the remission is without substantial weight gain.","when_to_set_to_false":"Set to false if the patient is currently in remission from major depressive disorder and the remission is with substantial weight gain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the remission is without substantial weight gain.","meaning":"Boolean indicating whether the patient's remission from major depressive disorder is without substantial weight gain."} ;; "in remission without substantial weight gain"

;; ===================== Auxiliary Assertions (REQ 17) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_major_depressive_disorder_now@@poorly_controlled
      patient_has_diagnosis_of_major_depressive_disorder_now)
    :named REQ17_AUXILIARY0)) ;; "poorly controlled major depression"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_antidepressant_therapy_inthepast3months@@stable
      patient_has_undergone_antidepressant_therapy_inthepast3months)
    :named REQ17_AUXILIARY1)) ;; "stable pharmacological antidepressant treatment for three months"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_antidepressant_therapy_inthepast3months@@pharmacological
      patient_has_undergone_antidepressant_therapy_inthepast3months)
    :named REQ17_AUXILIARY2)) ;; "pharmacological antidepressant treatment for three months"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_in_remission_now@@without_substantial_weight_gain
      patient_is_in_remission_now)
    :named REQ17_AUXILIARY3)) ;; "in remission without substantial weight gain"

;; ===================== Constraint Assertions (REQ 17) =====================
;; Exclusion: patient has poorly controlled major depression AND NOT (stable pharmacological antidepressant treatment for three months AND in remission without substantial weight gain)
(assert
(! (not (and
         patient_has_diagnosis_of_major_depressive_disorder_now@@poorly_controlled
         (not (and
                patient_has_undergone_antidepressant_therapy_inthepast3months@@stable
                patient_has_undergone_antidepressant_therapy_inthepast3months@@pharmacological
                patient_is_in_remission_now@@without_substantial_weight_gain))))
    :named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has poorly controlled major depression) AND NOT ((the patient has been on a stable pharmacological antidepressant treatment for three months) AND (the patient is in remission without substantial weight gain))."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_has_diagnosis_of_eating_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of eating disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of eating disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of eating disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of eating disorder."} ;; "a diagnosis of eating disorder"
(declare-const patient_has_diagnosis_of_eating_disorder_now@@diagnosis_according_to_dsm_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of eating disorder is made according to DSM-IV.","when_to_set_to_false":"Set to false if the patient's current diagnosis of eating disorder is not made according to DSM-IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of eating disorder is made according to DSM-IV.","meaning":"Boolean indicating whether the patient's current diagnosis of eating disorder is made according to DSM-IV."} ;; "a current diagnosis according to the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition"
(declare-const patient_has_diagnosis_of_bulimia_nervosa_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of bulimia nervosa.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of bulimia nervosa.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of bulimia nervosa.","meaning":"Boolean indicating whether the patient currently has a diagnosis of bulimia nervosa."} ;; "bulimia nervosa"
(declare-const patient_has_diagnosis_of_bulimia_nervosa_now@@diagnosis_according_to_dsm_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of bulimia nervosa is made according to DSM-IV.","when_to_set_to_false":"Set to false if the patient's current diagnosis of bulimia nervosa is not made according to DSM-IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of bulimia nervosa is made according to DSM-IV.","meaning":"Boolean indicating whether the patient's current diagnosis of bulimia nervosa is made according to DSM-IV."} ;; "bulimia nervosa ... according to DSM-IV"
(declare-const patient_has_diagnosis_of_binge_eating_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of binge eating disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of binge eating disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of binge eating disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of binge eating disorder."} ;; "binge eating disorder"
(declare-const patient_has_diagnosis_of_binge_eating_disorder_now@@diagnosis_according_to_dsm_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of binge eating disorder is made according to DSM-IV.","when_to_set_to_false":"Set to false if the patient's current diagnosis of binge eating disorder is not made according to DSM-IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of binge eating disorder is made according to DSM-IV.","meaning":"Boolean indicating whether the patient's current diagnosis of binge eating disorder is made according to DSM-IV."} ;; "binge eating disorder ... according to DSM-IV"

;; ===================== Auxiliary Assertions (REQ 18) =====================
;; Non-exhaustive examples: bulimia nervosa is an example of eating disorder
(assert
(! (=> patient_has_diagnosis_of_bulimia_nervosa_now@@diagnosis_according_to_dsm_iv
       patient_has_diagnosis_of_eating_disorder_now@@diagnosis_according_to_dsm_iv)
:named REQ18_AUXILIARY0)) ;; "a diagnosis of eating disorder such as bulimia nervosa"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_eating_disorder_now@@diagnosis_according_to_dsm_iv
       patient_has_diagnosis_of_eating_disorder_now)
:named REQ18_AUXILIARY1)) ;; "diagnosis of eating disorder ... according to DSM-IV"

(assert
(! (=> patient_has_diagnosis_of_bulimia_nervosa_now@@diagnosis_according_to_dsm_iv
       patient_has_diagnosis_of_bulimia_nervosa_now)
:named REQ18_AUXILIARY2)) ;; "diagnosis of bulimia nervosa ... according to DSM-IV"

(assert
(! (=> patient_has_diagnosis_of_binge_eating_disorder_now@@diagnosis_according_to_dsm_iv
       patient_has_diagnosis_of_binge_eating_disorder_now)
:named REQ18_AUXILIARY3)) ;; "diagnosis of binge eating disorder ... according to DSM-IV"

;; ===================== Constraint Assertions (REQ 18) =====================
;; Exclusion: patient must NOT have a current diagnosis according to DSM-IV of (eating disorder OR binge eating disorder)
(assert
(! (not (or patient_has_diagnosis_of_eating_disorder_now@@diagnosis_according_to_dsm_iv
            patient_has_diagnosis_of_binge_eating_disorder_now@@diagnosis_according_to_dsm_iv))
:named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current diagnosis according to the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition, with non-exhaustive examples ((a diagnosis of eating disorder such as bulimia nervosa) OR (a diagnosis of binge eating disorder))."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_has_diagnosis_of_anxiety_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of anxiety disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of anxiety disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of anxiety disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of anxiety disorder."} ;; "anxiety disorder"
(declare-const patient_has_diagnosis_of_anxiety_disorder_now@@diagnosis_according_to_dsm_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of anxiety disorder is according to DSM-IV.","when_to_set_to_false":"Set to false if the patient's current diagnosis of anxiety disorder is not according to DSM-IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of anxiety disorder is according to DSM-IV.","meaning":"Boolean indicating whether the patient's current diagnosis of anxiety disorder is according to DSM-IV."} ;; "anxiety disorder ... according to DSM-IV"
(declare-const patient_has_diagnosis_of_panic_attack_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of panic attack.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of panic attack.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of panic attack.","meaning":"Boolean indicating whether the patient currently has a diagnosis of panic attack."} ;; "panic attack"
(declare-const patient_has_diagnosis_of_panic_attack_now@@diagnosis_according_to_dsm_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of panic attack is according to DSM-IV.","when_to_set_to_false":"Set to false if the patient's current diagnosis of panic attack is not according to DSM-IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of panic attack is according to DSM-IV.","meaning":"Boolean indicating whether the patient's current diagnosis of panic attack is according to DSM-IV."} ;; "panic attack ... according to DSM-IV"
(declare-const patient_has_diagnosis_of_posttraumatic_stress_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of posttraumatic stress disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of posttraumatic stress disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of posttraumatic stress disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of posttraumatic stress disorder."} ;; "posttraumatic stress disorder"
(declare-const patient_has_diagnosis_of_posttraumatic_stress_disorder_now@@diagnosis_according_to_dsm_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of posttraumatic stress disorder is according to DSM-IV.","when_to_set_to_false":"Set to false if the patient's current diagnosis of posttraumatic stress disorder is not according to DSM-IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of posttraumatic stress disorder is according to DSM-IV.","meaning":"Boolean indicating whether the patient's current diagnosis of posttraumatic stress disorder is according to DSM-IV."} ;; "posttraumatic stress disorder ... according to DSM-IV"

;; ===================== Auxiliary Assertions (REQ 19) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_anxiety_disorder_now@@diagnosis_according_to_dsm_iv
          patient_has_diagnosis_of_panic_attack_now@@diagnosis_according_to_dsm_iv)
      (or patient_has_diagnosis_of_anxiety_disorder_now@@diagnosis_according_to_dsm_iv
          patient_has_diagnosis_of_panic_attack_now@@diagnosis_according_to_dsm_iv))
:named REQ19_AUXILIARY0)) ;; "with non-exhaustive examples ((a diagnosis of anxiety disorder such as posttraumatic stress disorder) OR (a diagnosis of panic attack))."

;; "such as posttraumatic stress disorder" is a non-exhaustive example for anxiety disorder
(assert
(! (=> patient_has_diagnosis_of_posttraumatic_stress_disorder_now@@diagnosis_according_to_dsm_iv
      patient_has_diagnosis_of_anxiety_disorder_now@@diagnosis_according_to_dsm_iv)
:named REQ19_AUXILIARY1)) ;; "anxiety disorder such as posttraumatic stress disorder"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_anxiety_disorder_now@@diagnosis_according_to_dsm_iv
      patient_has_diagnosis_of_anxiety_disorder_now)
:named REQ19_AUXILIARY2)) ;; "anxiety disorder ... according to DSM-IV"

(assert
(! (=> patient_has_diagnosis_of_panic_attack_now@@diagnosis_according_to_dsm_iv
      patient_has_diagnosis_of_panic_attack_now)
:named REQ19_AUXILIARY3)) ;; "panic attack ... according to DSM-IV"

(assert
(! (=> patient_has_diagnosis_of_posttraumatic_stress_disorder_now@@diagnosis_according_to_dsm_iv
      patient_has_diagnosis_of_posttraumatic_stress_disorder_now)
:named REQ19_AUXILIARY4)) ;; "posttraumatic stress disorder ... according to DSM-IV"

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not (or patient_has_diagnosis_of_anxiety_disorder_now@@diagnosis_according_to_dsm_iv
            patient_has_diagnosis_of_panic_attack_now@@diagnosis_according_to_dsm_iv))
:named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current diagnosis according to the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition, with non-exhaustive examples ((a diagnosis of anxiety disorder such as posttraumatic stress disorder) OR (a diagnosis of panic attack))."

;; ===================== Declarations for the exclusion criterion (REQ 20) =====================
(declare-const patient_has_diagnosis_of_mania_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of mania.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of mania.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of mania.","meaning":"Boolean indicating whether the patient currently has a diagnosis of mania."} ;; "mania"
(declare-const patient_has_diagnosis_of_mania_now@@diagnosis_according_to_dsm_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of mania is made according to DSM-IV.","when_to_set_to_false":"Set to false if the patient's current diagnosis of mania is not made according to DSM-IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of mania is made according to DSM-IV.","meaning":"Boolean indicating whether the patient's current diagnosis of mania is made according to DSM-IV."} ;; "diagnosis of mania ... according to DSM-IV"

;; ===================== Auxiliary Assertions (REQ 20) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_mania_now@@diagnosis_according_to_dsm_iv
       patient_has_diagnosis_of_mania_now)
   :named REQ20_AUXILIARY0)) ;; "diagnosis of mania ... according to DSM-IV"

;; ===================== Constraint Assertions (REQ 20) =====================
;; Exclusion: patient must NOT have a current diagnosis according to DSM-IV, including mania
(assert
(! (not (or
         patient_has_diagnosis_of_anxiety_disorder_now@@diagnosis_according_to_dsm_iv
         patient_has_diagnosis_of_binge_eating_disorder_now@@diagnosis_according_to_dsm_iv
         patient_has_diagnosis_of_eating_disorder_now@@diagnosis_according_to_dsm_iv
         patient_has_diagnosis_of_panic_attack_now@@diagnosis_according_to_dsm_iv
         patient_has_diagnosis_of_posttraumatic_stress_disorder_now@@diagnosis_according_to_dsm_iv
         patient_has_diagnosis_of_mania_now@@diagnosis_according_to_dsm_iv))
   :named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has a current diagnosis according to the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition, including a diagnosis of mania."

;; ===================== Declarations for the exclusion criterion (REQ 21) =====================
(declare-const patient_has_diagnosis_now@@diagnosis_according_to_dsm_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any diagnosis made according to DSM-IV.","when_to_set_to_false":"Set to false if the patient currently does not have any diagnosis made according to DSM-IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any diagnosis made according to DSM-IV.","meaning":"Boolean indicating whether the patient currently has any diagnosis according to DSM-IV."} ;; "current diagnosis according to the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition"
(declare-const patient_has_diagnosis_of_schizophrenia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of schizophrenia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of schizophrenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of schizophrenia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of schizophrenia."} ;; "diagnosis of schizophrenia"
(declare-const patient_has_diagnosis_of_schizophrenia_now@@diagnosis_according_to_dsm_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of schizophrenia is made according to DSM-IV.","when_to_set_to_false":"Set to false if the patient's current diagnosis of schizophrenia is not made according to DSM-IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of schizophrenia is made according to DSM-IV.","meaning":"Boolean indicating whether the patient's current diagnosis of schizophrenia is made according to DSM-IV."} ;; "diagnosis of schizophrenia ... according to DSM-IV"

;; ===================== Auxiliary Assertions (REQ 21) =====================
;; "including a diagnosis of schizophrenia" is a non-exhaustive example for DSM-IV diagnosis
(assert
(! (=> patient_has_diagnosis_of_schizophrenia_now@@diagnosis_according_to_dsm_iv
       patient_has_diagnosis_now@@diagnosis_according_to_dsm_iv)
   :named REQ21_AUXILIARY0)) ;; "including a diagnosis of schizophrenia"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_schizophrenia_now@@diagnosis_according_to_dsm_iv
       patient_has_diagnosis_of_schizophrenia_now)
   :named REQ21_AUXILIARY1)) ;; "diagnosis of schizophrenia ... according to DSM-IV"

;; ===================== Constraint Assertions (REQ 21) =====================
(assert
(! (not (or patient_has_diagnosis_now@@diagnosis_according_to_dsm_iv
            patient_has_diagnosis_of_schizophrenia_now@@diagnosis_according_to_dsm_iv))
   :named REQ21_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has a current diagnosis according to the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition, including a diagnosis of schizophrenia."

;; ===================== Declarations for the exclusion criterion (REQ 22) =====================
(declare-const patient_has_finding_of_alcohol_intake_above_recommended_sensible_limits_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of alcohol intake above recommended sensible limits (excessive alcohol consumption).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of alcohol intake above recommended sensible limits.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has alcohol intake above recommended sensible limits.","meaning":"Boolean indicating whether the patient currently has alcohol intake above recommended sensible limits (excessive alcohol consumption)."} ;; "excessive alcohol consumption"
(declare-const patient_has_finding_of_alcohol_intake_above_recommended_sensible_limits_now@@may_pose_a_threat_to_compliance Bool) ;; {"when_to_set_to_true":"Set to true if the patient's excessive alcohol consumption may pose a threat to compliance.","when_to_set_to_false":"Set to false if the patient's excessive alcohol consumption does not pose a threat to compliance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's excessive alcohol consumption may pose a threat to compliance.","meaning":"Boolean indicating whether the patient's excessive alcohol consumption may pose a threat to compliance."} ;; "excessive alcohol consumption ... that may pose a threat to compliance"
(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding relating to drug misuse behavior (drug abuse).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding relating to drug misuse behavior.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding relating to drug misuse behavior.","meaning":"Boolean indicating whether the patient currently has a finding relating to drug misuse behavior (drug abuse)."} ;; "drug abuse"
(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now@@may_pose_a_threat_to_compliance Bool) ;; {"when_to_set_to_true":"Set to true if the patient's drug abuse may pose a threat to compliance.","when_to_set_to_false":"Set to false if the patient's drug abuse does not pose a threat to compliance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's drug abuse may pose a threat to compliance.","meaning":"Boolean indicating whether the patient's drug abuse may pose a threat to compliance."} ;; "drug abuse ... that may pose a threat to compliance"
(declare-const patient_has_finding_of_psychoactive_substance_dependence_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of psychoactive substance dependence.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of psychoactive substance dependence.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has psychoactive substance dependence.","meaning":"Boolean indicating whether the patient currently has psychoactive substance dependence."} ;; "substance dependence"
(declare-const patient_has_finding_of_psychoactive_substance_dependence_now@@may_pose_a_threat_to_compliance Bool) ;; {"when_to_set_to_true":"Set to true if the patient's psychoactive substance dependence may pose a threat to compliance.","when_to_set_to_false":"Set to false if the patient's psychoactive substance dependence does not pose a threat to compliance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's psychoactive substance dependence may pose a threat to compliance.","meaning":"Boolean indicating whether the patient's psychoactive substance dependence may pose a threat to compliance."} ;; "substance dependence ... that may pose a threat to compliance"

;; ===================== Auxiliary Assertions (REQ 22) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_alcohol_intake_above_recommended_sensible_limits_now@@may_pose_a_threat_to_compliance
      patient_has_finding_of_alcohol_intake_above_recommended_sensible_limits_now)
   :named REQ22_AUXILIARY0)) ;; "excessive alcohol consumption ... that may pose a threat to compliance"

(assert
(! (=> patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now@@may_pose_a_threat_to_compliance
      patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now)
   :named REQ22_AUXILIARY1)) ;; "drug abuse ... that may pose a threat to compliance"

(assert
(! (=> patient_has_finding_of_psychoactive_substance_dependence_now@@may_pose_a_threat_to_compliance
      patient_has_finding_of_psychoactive_substance_dependence_now)
   :named REQ22_AUXILIARY2)) ;; "substance dependence ... that may pose a threat to compliance"

;; ===================== Constraint Assertions (REQ 22) =====================
;; Non-exhaustive examples: "such as" means the list is not exhaustive, so only the listed items (with threat to compliance) are directly encoded.
(assert
(! (not (or patient_has_finding_of_alcohol_intake_above_recommended_sensible_limits_now@@may_pose_a_threat_to_compliance
            patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now@@may_pose_a_threat_to_compliance
            patient_has_finding_of_psychoactive_substance_dependence_now@@may_pose_a_threat_to_compliance))
   :named REQ22_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has medication abuse such as excessive alcohol consumption or substance abuse such as drug abuse or substance dependence that may pose a threat to compliance."

;; ===================== Declarations for the exclusion criterion (REQ 23) =====================
(declare-const patient_has_finding_of_rotating_shift_worker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a rotating shift worker.","when_to_set_to_false":"Set to false if the patient is currently not a rotating shift worker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a rotating shift worker.","meaning":"Boolean indicating whether the patient is currently a rotating shift worker."} ;; "rotating worker"
(declare-const patient_has_finding_of_shift_worker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a shift worker.","when_to_set_to_false":"Set to false if the patient is currently not a shift worker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a shift worker.","meaning":"Boolean indicating whether the patient is currently a shift worker."} ;; "shift worker"
(declare-const patient_has_finding_of_shift_worker_now@@work_involves_evenings_or_nights Bool) ;; {"when_to_set_to_true":"Set to true if the patient's shift work involves evenings or nights.","when_to_set_to_false":"Set to false if the patient's shift work does not involve evenings or nights.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's shift work involves evenings or nights.","meaning":"Boolean indicating whether the patient's shift work involves evenings or nights."} ;; "shift worker (working evenings or nights)"
(declare-const patient_has_finding_of_long_distance_commuter_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a long distance commuter.","when_to_set_to_false":"Set to false if the patient is currently not a long distance commuter.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a long distance commuter.","meaning":"Boolean indicating whether the patient is currently a long distance commuter."} ;; "long distance commuter"
(declare-const patient_commute_duration_each_way_value_recorded_now_in_minutes Real) ;; {"when_to_set_to_value":"Set to the value in minutes if the patient's commute duration each way is known and recorded now.","when_to_set_to_null":"Set to null if the patient's commute duration each way is unknown, not documented, or cannot be determined now.","meaning":"Numeric value indicating the duration in minutes of the patient's commute each way, recorded now."} ;; "more than approximately 90 minutes each way"
(declare-const patient_has_finding_of_travels_frequently_outside_of_time_zone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently travels frequently outside of their time zone.","when_to_set_to_false":"Set to false if the patient does not currently travel frequently outside of their time zone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently travels frequently outside of their time zone.","meaning":"Boolean indicating whether the patient currently travels frequently outside of their time zone."} ;; "travels frequently outside of time zone"
(declare-const patient_has_finding_of_occupation_requires_special_vigilance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in an occupation that requires special vigilance.","when_to_set_to_false":"Set to false if the patient is currently not in an occupation that requires special vigilance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in an occupation that requires special vigilance.","meaning":"Boolean indicating whether the patient is currently in an occupation that requires special vigilance."} ;; "occupation that may require special vigilance"
(declare-const patient_has_finding_of_truck_driver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a truck driver.","when_to_set_to_false":"Set to false if the patient is currently not a truck driver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a truck driver.","meaning":"Boolean indicating whether the patient is currently a truck driver."} ;; "driving a truck"
(declare-const patient_has_finding_of_bus_driver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a bus driver.","when_to_set_to_false":"Set to false if the patient is currently not a bus driver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a bus driver.","meaning":"Boolean indicating whether the patient is currently a bus driver."} ;; "driving a bus"
(declare-const patient_has_finding_of_cab_driver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a cab driver.","when_to_set_to_false":"Set to false if the patient is currently not a cab driver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a cab driver.","meaning":"Boolean indicating whether the patient is currently a cab driver."} ;; "driving a cab"
(declare-const patient_has_finding_of_heavy_machinery_operator_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently an operator of heavy machinery.","when_to_set_to_false":"Set to false if the patient is currently not an operator of heavy machinery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an operator of heavy machinery.","meaning":"Boolean indicating whether the patient is currently an operator of heavy machinery."} ;; "operating heavy machinery"
(declare-const patient_has_finding_of_pilot_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a pilot.","when_to_set_to_false":"Set to false if the patient is currently not a pilot.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a pilot.","meaning":"Boolean indicating whether the patient is currently a pilot."} ;; "being a pilot"
(declare-const patient_has_finding_of_air_traffic_controller_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently an air traffic controller.","when_to_set_to_false":"Set to false if the patient is currently not an air traffic controller.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an air traffic controller.","meaning":"Boolean indicating whether the patient is currently an air traffic controller."} ;; "being an air traffic controller"

;; ===================== Auxiliary Assertions (REQ 23) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_shift_worker_now@@work_involves_evenings_or_nights
      patient_has_finding_of_shift_worker_now)
:named REQ23_AUXILIARY0)) ;; "shift worker (working evenings or nights)"

;; Occupation examples (non-exhaustive) imply occupation requires special vigilance
(assert
(! (=> (or patient_has_finding_of_truck_driver_now
           patient_has_finding_of_bus_driver_now
           patient_has_finding_of_cab_driver_now
           patient_has_finding_of_heavy_machinery_operator_now
           patient_has_finding_of_pilot_now
           patient_has_finding_of_air_traffic_controller_now)
      patient_has_finding_of_occupation_requires_special_vigilance_now)
:named REQ23_AUXILIARY1)) ;; "such as driving a truck, driving a bus, driving a cab, operating heavy machinery, being a pilot, or being an air traffic controller" (non-exhaustive examples for occupation requiring special vigilance)

;; ===================== Constraint Assertions (REQ 23) =====================
(assert
(! (not (or patient_has_finding_of_rotating_shift_worker_now
            patient_has_finding_of_shift_worker_now@@work_involves_evenings_or_nights
            (and patient_has_finding_of_long_distance_commuter_now
                 (> patient_commute_duration_each_way_value_recorded_now_in_minutes 90))
            patient_has_finding_of_travels_frequently_outside_of_time_zone_now
            patient_has_finding_of_occupation_requires_special_vigilance_now))
   :named REQ23_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient is a rotating worker, a shift worker (working evenings or nights), a long distance commuter (more than approximately 90 minutes each way), travels frequently outside of time zone, or is in an occupation that may require special vigilance such as driving a truck, driving a bus, driving a cab, operating heavy machinery, being a pilot, or being an air traffic controller."

;; ===================== Declarations for the exclusion criterion (REQ 24) =====================
(declare-const patient_has_finding_of_transfer_out_of_area_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is likely or expected to move to a different geographical area in the future (e.g., during the study period).","when_to_set_to_false":"Set to false if the patient is not likely or expected to move to a different geographical area in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is likely to move to a different geographical area in the future.","meaning":"Boolean indicating whether the patient is likely to transfer out of the geographical area in the future."} ;; "move to a different geographical area"

;; ===================== Constraint Assertions (REQ 24) =====================
(assert
(! (not patient_has_finding_of_transfer_out_of_area_inthefuture)
:named REQ24_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "A patient is excluded if the patient is likely to move to a different geographical area during the study."
