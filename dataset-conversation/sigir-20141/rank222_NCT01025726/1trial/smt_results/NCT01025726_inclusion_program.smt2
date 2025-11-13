;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const number_of_patient_grandparents_of_african_descent_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of the patient's grandparents who are of African descent, as recorded at present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many of the patient's grandparents are of African descent.","meaning":"Numeric value indicating the number of the patient's grandparents who are of African descent, recorded at present, with unit 'count'."}  ;; "the number of grandparents of African descent"
(declare-const number_of_patient_total_grandparents_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the total number of the patient's grandparents, as recorded at present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many total grandparents the patient has.","meaning":"Numeric value indicating the total number of the patient's grandparents, recorded at present, with unit 'count'."}  ;; "4 total grandparents"
(declare-const patient_has_finding_of_african_origin_now Bool) ;; {"when_to_set_to_true":"Set to true if the index patient is currently considered to have African origin (African descent).","when_to_set_to_false":"Set to false if the index patient is currently considered not to have African origin (African descent).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the index patient has African origin (African descent).","meaning":"Boolean indicating whether the index patient is currently considered to have African origin (African descent)."} ;; "the patient must be African American (defined as having (the number of grandparents of African descent ≥ 3 out of 4 total grandparents))"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition: patient is considered African American if number of grandparents of African descent >= 3 out of 4
(assert
  (! (= patient_has_finding_of_african_origin_now
        (and (>= number_of_patient_grandparents_of_african_descent_value_recorded_now_withunit_count 3)
             (= number_of_patient_total_grandparents_value_recorded_now_withunit_count 4)))
     :named REQ0_AUXILIARY0)) ;; "defined as having (the number of grandparents of African descent ≥ 3 out of 4 total grandparents)"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_african_origin_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be African American"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_lives_in_designated_census_area_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently resides in the designated census area.","when_to_set_to_false":"Set to false if the patient currently does not reside in the designated census area.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently resides in the designated census area.","meaning":"Boolean indicating whether the patient currently resides in the designated census area."} ;; "the patient must live in the designated census area"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_lives_in_designated_census_area_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must live in the designated census area"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_plans_to_move_within_next_2_years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has plans to move within the next two years.","when_to_set_to_false":"Set to false if the patient does not have plans to move within the next two years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has plans to move within the next two years.","meaning":"Boolean indicating whether the patient has plans to move within the next two years."} ;; "the patient must NOT have plans to move in the next two years"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_has_plans_to_move_within_next_2_years)
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must NOT have plans to move in the next two years"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have any disease, condition, or clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease, condition, or clinical finding.","meaning":"Boolean indicating whether the patient currently has any disease, condition, or clinical finding."} ;; "medical condition"
(declare-const patient_has_finding_of_disease_condition_finding_now@@limits_participation_in_moderate_intensity_exercise Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disease, condition, or clinical finding would limit participation in moderate intensity exercise.","when_to_set_to_false":"Set to false if the patient's current disease, condition, or clinical finding would not limit participation in moderate intensity exercise.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disease, condition, or clinical finding would limit participation in moderate intensity exercise.","meaning":"Boolean indicating whether the patient's current disease, condition, or clinical finding would limit participation in moderate intensity exercise."} ;; "medical condition that would limit participation in moderate intensity exercise"
(declare-const patient_has_finding_of_life_threatening_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a life-threatening illness.","when_to_set_to_false":"Set to false if the patient currently does not have a life-threatening illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a life-threatening illness.","meaning":"Boolean indicating whether the patient currently has a life-threatening illness."} ;; "life-threatening illness"
(declare-const patient_has_finding_of_life_threatening_illness_now@@limits_participation_in_moderate_intensity_exercise Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current life-threatening illness would limit participation in moderate intensity exercise.","when_to_set_to_false":"Set to false if the patient's current life-threatening illness would not limit participation in moderate intensity exercise.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current life-threatening illness would limit participation in moderate intensity exercise.","meaning":"Boolean indicating whether the patient's current life-threatening illness would limit participation in moderate intensity exercise."} ;; "life-threatening illness that would limit participation in moderate intensity exercise"
(declare-const patient_has_finding_of_immobility_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has immobility.","when_to_set_to_false":"Set to false if the patient currently does not have immobility.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has immobility.","meaning":"Boolean indicating whether the patient currently has immobility."} ;; "immobility"
(declare-const patient_has_finding_of_immobility_now@@limits_participation_in_moderate_intensity_exercise Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current immobility would limit participation in moderate intensity exercise.","when_to_set_to_false":"Set to false if the patient's current immobility would not limit participation in moderate intensity exercise.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current immobility would limit participation in moderate intensity exercise.","meaning":"Boolean indicating whether the patient's current immobility would limit participation in moderate intensity exercise."} ;; "immobility that would limit participation in moderate intensity exercise"
(declare-const patient_has_finding_of_disability_severe_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe disability.","when_to_set_to_false":"Set to false if the patient currently does not have severe disability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe disability.","meaning":"Boolean indicating whether the patient currently has severe disability."} ;; "severe disability"
(declare-const patient_has_finding_of_bed_ridden_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in a bedridden state.","when_to_set_to_false":"Set to false if the patient is currently not in a bedridden state.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in a bedridden state.","meaning":"Boolean indicating whether the patient is currently in a bedridden state."} ;; "bedridden state"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples imply the umbrella subclass
(assert
  (! (=> patient_has_finding_of_life_threatening_illness_now@@limits_participation_in_moderate_intensity_exercise
         patient_has_finding_of_disease_condition_finding_now@@limits_participation_in_moderate_intensity_exercise)
     :named REQ3_AUXILIARY0)) ;; "life-threatening illness is an example of a medical condition that would limit participation in moderate intensity exercise"

(assert
  (! (=> patient_has_finding_of_immobility_now@@limits_participation_in_moderate_intensity_exercise
         patient_has_finding_of_disease_condition_finding_now@@limits_participation_in_moderate_intensity_exercise)
     :named REQ3_AUXILIARY1)) ;; "immobility is an example of a medical condition that would limit participation in moderate intensity exercise"

(assert
  (! (=> patient_has_finding_of_disability_severe_now
         patient_has_finding_of_disease_condition_finding_now@@limits_participation_in_moderate_intensity_exercise)
     :named REQ3_AUXILIARY2)) ;; "severe disability is an example of a medical condition that would limit participation in moderate intensity exercise"

(assert
  (! (=> patient_has_finding_of_bed_ridden_now
         patient_has_finding_of_disease_condition_finding_now@@limits_participation_in_moderate_intensity_exercise)
     :named REQ3_AUXILIARY3)) ;; "bedridden state is an example of a medical condition that would limit participation in moderate intensity exercise"

;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_disease_condition_finding_now@@limits_participation_in_moderate_intensity_exercise
         patient_has_finding_of_disease_condition_finding_now)
     :named REQ3_AUXILIARY4)) ;; "any medical condition that would limit participation in moderate intensity exercise implies having a medical condition"

(assert
  (! (=> patient_has_finding_of_life_threatening_illness_now@@limits_participation_in_moderate_intensity_exercise
         patient_has_finding_of_life_threatening_illness_now)
     :named REQ3_AUXILIARY5)) ;; "life-threatening illness that would limit participation in moderate intensity exercise implies having life-threatening illness"

(assert
  (! (=> patient_has_finding_of_immobility_now@@limits_participation_in_moderate_intensity_exercise
         patient_has_finding_of_immobility_now)
     :named REQ3_AUXILIARY6)) ;; "immobility that would limit participation in moderate intensity exercise implies having immobility"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: Patient must NOT have any medical condition that would limit participation in moderate intensity exercise
(assert
  (! (not patient_has_finding_of_disease_condition_finding_now@@limits_participation_in_moderate_intensity_exercise)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have any medical condition (that would limit participation in moderate intensity exercise with non-exhaustive examples (life-threatening illness, immobility, severe disability, bedridden state))."

;; ===================== Declarations for the inclusion criterion (REQ 4) =====================
(declare-const patient_is_available_over_next_2_years Bool) ;; {"when_to_set_to_true":"Set to true if the patient is available for the next two years.","when_to_set_to_false":"Set to false if the patient is not available for the next two years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is available for the next two years.","meaning":"Boolean indicating whether the patient is available over the next two years."} ;; "the patient must be available over the next two years"
(declare-const patient_is_able_to_participate_in_measurement_activities_over_next_2_years Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to participate in measurement activities over the next two years.","when_to_set_to_false":"Set to false if the patient is not able to participate in measurement activities over the next two years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to participate in measurement activities over the next two years.","meaning":"Boolean indicating whether the patient is able to participate in measurement activities over the next two years."} ;; "the patient must be able to participate in measurement activities over the next two years"
(declare-const patient_is_able_to_participate_in_intervention_activities_over_next_2_years Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to participate in intervention activities over the next two years.","when_to_set_to_false":"Set to false if the patient is not able to participate in intervention activities over the next two years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to participate in intervention activities over the next two years.","meaning":"Boolean indicating whether the patient is able to participate in intervention activities over the next two years."} ;; "the patient must be able to participate in intervention activities over the next two years"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: The patient must be available over the next two years.
(assert
  (! patient_is_available_over_next_2_years
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be available over the next two years"

;; Component 1: The patient must be able to participate in measurement activities over the next two years.
(assert
  (! patient_is_able_to_participate_in_measurement_activities_over_next_2_years
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient must be able to participate in measurement activities over the next two years"

;; Component 2: The patient must be able to participate in intervention activities over the next two years.
(assert
  (! patient_is_able_to_participate_in_intervention_activities_over_next_2_years
     :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient must be able to participate in intervention activities over the next two years"
