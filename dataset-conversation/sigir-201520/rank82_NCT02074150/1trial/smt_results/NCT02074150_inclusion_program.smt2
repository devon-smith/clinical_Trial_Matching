;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "an adult"
(declare-const patient_has_finding_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a stroke (cerebrovascular accident) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a stroke (cerebrovascular accident) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a stroke (cerebrovascular accident).","meaning":"Boolean indicating whether the patient has ever had a stroke (cerebrovascular accident) in their history."} // "stroke"
(declare-const patient_has_finding_of_cerebrovascular_accident_inthehistory@@resulted_in_unilateral_upper_limb_focal_spasticity Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of stroke (cerebrovascular accident) resulted in unilateral upper limb focal spasticity.","when_to_set_to_false":"Set to false if the patient's history of stroke did not result in unilateral upper limb focal spasticity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's stroke resulted in unilateral upper limb focal spasticity.","meaning":"Boolean indicating whether the patient's history of stroke resulted in unilateral upper limb focal spasticity."} // "stroke that resulted in unilateral upper limb focal spasticity"
(declare-const patient_has_finding_of_spasticity_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had spasticity at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had spasticity in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had spasticity.","meaning":"Boolean indicating whether the patient has ever had spasticity in their history."} // "spasticity"
(declare-const patient_has_finding_of_spasticity_inthehistory@@is_focal Bool) ;; {"when_to_set_to_true":"Set to true if the patient's spasticity is focal.","when_to_set_to_false":"Set to false if the patient's spasticity is not focal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's spasticity is focal.","meaning":"Boolean indicating whether the patient's spasticity is focal."} // "focal spasticity"
(declare-const patient_has_finding_of_spasticity_inthehistory@@located_in_unilateral_upper_limb Bool) ;; {"when_to_set_to_true":"Set to true if the patient's spasticity is located in the unilateral upper limb.","when_to_set_to_false":"Set to false if the patient's spasticity is not located in the unilateral upper limb.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's spasticity is located in the unilateral upper limb.","meaning":"Boolean indicating whether the patient's spasticity is located in the unilateral upper limb."} // "unilateral upper limb"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable // "stroke that resulted in unilateral upper limb focal spasticity"
(assert
  (! (=> patient_has_finding_of_cerebrovascular_accident_inthehistory@@resulted_in_unilateral_upper_limb_focal_spasticity
         patient_has_finding_of_cerebrovascular_accident_inthehistory)
     :named REQ0_AUXILIARY0))

;; Qualifier variable implies corresponding stem variable // "focal spasticity"
(assert
  (! (=> patient_has_finding_of_spasticity_inthehistory@@is_focal
         patient_has_finding_of_spasticity_inthehistory)
     :named REQ0_AUXILIARY1))

;; Qualifier variable implies corresponding stem variable // "spasticity located in unilateral upper limb"
(assert
  (! (=> patient_has_finding_of_spasticity_inthehistory@@located_in_unilateral_upper_limb
         patient_has_finding_of_spasticity_inthehistory)
     :named REQ0_AUXILIARY2))

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Patient must be an adult (age >= 18) // "an adult"
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; Component 1: Patient must have a history of stroke that resulted in unilateral upper limb focal spasticity // "history of stroke that resulted in unilateral upper limb focal spasticity"
(assert
  (! patient_has_finding_of_cerebrovascular_accident_inthehistory@@resulted_in_unilateral_upper_limb_focal_spasticity
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const wrist_flexor_muscle_tone_value_recorded_withunit_ashworth_scale Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's wrist flexor muscle tone as measured by the Ashworth Scale, if available.","when_to_set_to_null":"Set to null if the wrist flexor muscle tone as measured by the Ashworth Scale is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's wrist flexor muscle tone as measured by the Ashworth Scale."} // "wrist flexor muscle tone > 2 as measured by the Ashworth Scale"
(declare-const finger_flexor_muscle_tone_value_recorded_withunit_ashworth_scale Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's finger flexor muscle tone as measured by the Ashworth Scale, if available.","when_to_set_to_null":"Set to null if the finger flexor muscle tone as measured by the Ashworth Scale is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's finger flexor muscle tone as measured by the Ashworth Scale."} // "finger flexor muscle tone > 2 as measured by the Ashworth Scale"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (> wrist_flexor_muscle_tone_value_recorded_withunit_ashworth_scale 2.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "wrist flexor muscle tone > 2 as measured by the Ashworth Scale"

(assert
  (! (> finger_flexor_muscle_tone_value_recorded_withunit_ashworth_scale 2.0)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "finger flexor muscle tone > 2 as measured by the Ashworth Scale"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_ability_to_understand_verbal_directions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the ability to understand verbal directions.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to understand verbal directions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to understand verbal directions.","meaning":"Boolean indicating whether the patient currently has the ability to understand verbal directions."} // "the ability to understand verbal directions"
(declare-const patient_has_ability_to_follow_verbal_directions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the ability to follow verbal directions.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to follow verbal directions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to follow verbal directions.","meaning":"Boolean indicating whether the patient currently has the ability to follow verbal directions."} // "the ability to follow verbal directions"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: The patient must have the ability to understand verbal directions.
(assert
  (! patient_has_ability_to_understand_verbal_directions_now
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the ability to understand verbal directions"

;; Component 1: The patient must have the ability to follow verbal directions.
(assert
  (! patient_has_ability_to_follow_verbal_directions_now
     :named REQ2_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the ability to follow verbal directions"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_personal_hygiene_disability_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the numeric score if the patient's personal hygiene disability is currently measured and recorded using the Disability Assessment Scale.","when_to_set_to_null":"Set to null if no current score is available or the measurement is not documented.","meaning":"Numeric score for the patient's current personal hygiene disability."} // "hygiene disability"
(declare-const patient_difficulty_dressing_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the numeric score if the patient's difficulty dressing is currently measured and recorded using the Disability Assessment Scale.","when_to_set_to_null":"Set to null if no current score is available or the measurement is not documented.","meaning":"Numeric score for the patient's current difficulty dressing."} // "dressing disability"
(declare-const patient_pain_level_disruptive_effects_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the numeric score if the patient's pain disability is currently measured and recorded using the Disability Assessment Scale.","when_to_set_to_null":"Set to null if no current score is available or the measurement is not documented.","meaning":"Numeric score for the patient's current pain disability."} // "pain disability"
(declare-const patient_limb_posture_disability_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the numeric score if the patient's limb posture disability is currently measured and recorded using the Disability Assessment Scale.","when_to_set_to_null":"Set to null if no current score is available or the measurement is not documented.","meaning":"Numeric score for the patient's current limb posture disability."} // "limb posture disability"

(declare-const patient_has_at_least_one_functional_disability_item_with_score_greater_than_2_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has at least one of the following disability items (hygiene, dressing, pain, limb posture) with a score greater than 2 on the Disability Assessment Scale.","when_to_set_to_false":"Set to false if the patient currently has none of the listed disability items with a score greater than 2 on the Disability Assessment Scale.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any of the listed disability items with a score greater than 2.","meaning":"Boolean indicating whether the patient currently has at least one functional disability item (hygiene, dressing, pain, limb posture) with a score greater than 2 on the Disability Assessment Scale."} // "at least 1 functional disability item (hygiene disability, dressing disability, pain disability, limb posture disability) with a rating > 2 on the Disability Assessment Scale"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Exhaustive subcategories: Only these four items count as functional disability items for this criterion.
(assert
  (! (= patient_has_at_least_one_functional_disability_item_with_score_greater_than_2_now
        (or
          (> patient_personal_hygiene_disability_value_recorded_now_withunit_score 2)
          (> patient_difficulty_dressing_value_recorded_now_withunit_score 2)
          (> patient_pain_level_disruptive_effects_value_recorded_now_withunit_score 2)
          (> patient_limb_posture_disability_value_recorded_now_withunit_score 2)))
     :named REQ3_AUXILIARY0)) ;; "at least 1 functional disability item (hygiene disability, dressing disability, pain disability, limb posture disability) with a rating > 2 on the Disability Assessment Scale"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_at_least_one_functional_disability_item_with_score_greater_than_2_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have at least 1 functional disability item (with exhaustive subcategories (hygiene disability, dressing disability, pain disability, limb posture disability)) with a rating > 2 on the Disability Assessment Scale."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_filing_of_a_nail_value_recorded_inthepast0days_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured score value if the patient's nail filing task score was recorded at Day 0.","when_to_set_to_null":"Set to null if no such score measurement at Day 0 is available or the value is indeterminate.","meaning":"Numeric score representing the patient's nail filing task performance at Day 0."} // "nail filing task score < 6 at Day 0"
(declare-const patient_washing_hands_value_recorded_inthepast0days_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured score value if the patient's hand cleaning task score was recorded at Day 0.","when_to_set_to_null":"Set to null if no such score measurement at Day 0 is available or the value is indeterminate.","meaning":"Numeric score representing the patient's hand cleaning task performance at Day 0."} // "hand cleaning task score < 6 at Day 0"
(declare-const patient_holding_a_water_bottle_value_recorded_inthepast0days_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured score value if the patient's holding a water bottle task score was recorded at Day 0.","when_to_set_to_null":"Set to null if no such score measurement at Day 0 is available or the value is indeterminate.","meaning":"Numeric score representing the patient's holding a water bottle task performance at Day 0."} // "holding a water bottle task score < 4 at Day 0"
(declare-const patient_brushing_of_teeth_value_recorded_inthepast0days_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured score value if the patient's brushing teeth task score was recorded at Day 0.","when_to_set_to_null":"Set to null if no such score measurement at Day 0 is available or the value is indeterminate.","meaning":"Numeric score representing the patient's brushing teeth task performance at Day 0."} // "brushing teeth task score < 4 at Day 0"
(declare-const patient_is_exposed_to_fruit_inthepast0days Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to (held) fruit at Day 0.","when_to_set_to_false":"Set to false if the patient was not exposed to (did not hold) fruit at Day 0.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient held fruit at Day 0.","meaning":"Boolean indicating whether the patient held fruit at Day 0."} // "holding fruit at Day 0"
(declare-const patient_is_exposed_to_fruit_inthepast0days@@fruit_is_small Bool) ;; {"when_to_set_to_true":"Set to true if the fruit held by the patient at Day 0 is small.","when_to_set_to_false":"Set to false if the fruit held by the patient at Day 0 is not small.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the fruit held at Day 0 is small.","meaning":"Boolean indicating whether the fruit held at Day 0 is small."} // "small fruit"
(declare-const patient_is_exposed_to_fruit_inthepast0days@@fruit_is_medium Bool) ;; {"when_to_set_to_true":"Set to true if the fruit held by the patient at Day 0 is medium.","when_to_set_to_false":"Set to false if the fruit held by the patient at Day 0 is not medium.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the fruit held at Day 0 is medium.","meaning":"Boolean indicating whether the fruit held at Day 0 is medium."} // "medium fruit"
(declare-const patient_is_exposed_to_fruit_inthepast0days@@fruit_is_large Bool) ;; {"when_to_set_to_true":"Set to true if the fruit held by the patient at Day 0 is large.","when_to_set_to_false":"Set to false if the fruit held by the patient at Day 0 is not large.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the fruit held at Day 0 is large.","meaning":"Boolean indicating whether the fruit held at Day 0 is large."} // "large fruit"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Exhaustive subcategories: holding fruit at Day 0 ≡ (holding small OR medium OR large fruit at Day 0)
(assert
  (! (= patient_is_exposed_to_fruit_inthepast0days
        (or patient_is_exposed_to_fruit_inthepast0days@@fruit_is_small
            patient_is_exposed_to_fruit_inthepast0days@@fruit_is_medium
            patient_is_exposed_to_fruit_inthepast0days@@fruit_is_large))
     :named REQ4_AUXILIARY0)) ;; "holding fruit (with exhaustive subcategories (small fruit, medium fruit, large fruit)) at Day 0"

;; ===================== Constraint Assertions (REQ 4) =====================
;; At least one of the following must be true at Day 0:
;; (nail filing task score < 6) OR (hand cleaning task score < 6) OR (holding a water bottle task score < 4) OR (brushing teeth task score < 4) OR (holding small fruit = no) OR (holding medium fruit = no) OR (holding large fruit = no)
(assert
  (! (or (< patient_filing_of_a_nail_value_recorded_inthepast0days_withunit_score 6)
         (< patient_washing_hands_value_recorded_inthepast0days_withunit_score 6)
         (< patient_holding_a_water_bottle_value_recorded_inthepast0days_withunit_score 4)
         (< patient_brushing_of_teeth_value_recorded_inthepast0days_withunit_score 4)
         (not patient_is_exposed_to_fruit_inthepast0days@@fruit_is_small)
         (not patient_is_exposed_to_fruit_inthepast0days@@fruit_is_medium)
         (not patient_is_exposed_to_fruit_inthepast0days@@fruit_is_large))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "at least 1 functional task score at Day 0 that meets at least one of the following criteria: ..."
