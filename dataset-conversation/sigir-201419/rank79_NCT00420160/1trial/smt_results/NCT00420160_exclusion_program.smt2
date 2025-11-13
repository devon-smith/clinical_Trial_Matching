;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_can_read_fluently_in_english_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently read fluently in the English language.","when_to_set_to_false":"Set to false if the patient cannot currently read fluently in the English language.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently read fluently in the English language.","meaning":"Boolean indicating whether the patient can currently read fluently in the English language."} ;; "the patient cannot read fluently in the English language"
(declare-const patient_can_write_fluently_in_english_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently write fluently in the English language.","when_to_set_to_false":"Set to false if the patient cannot currently write fluently in the English language.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently write fluently in the English language.","meaning":"Boolean indicating whether the patient can currently write fluently in the English language."} ;; "the patient cannot write fluently in the English language"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (not patient_can_read_fluently_in_english_now))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient cannot read fluently in the English language."

(assert
  (! (not (not patient_can_write_fluently_in_english_now))
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient cannot write fluently in the English language."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is confirmed to be currently pregnant.","when_to_set_to_false":"Set to false if the patient is confirmed not to be currently pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_pregnant_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient has stated or documented plans to attempt pregnancy in the future.","when_to_set_to_false":"Set to false if the patient has stated or documented plans not to attempt pregnancy in the future.","when_to_set_to_null":"Set to null if the patient's future pregnancy plans are unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient plans to become pregnant in the future."} ;; "the patient plans to attempt pregnancy"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not (or patient_is_pregnant_now
              patient_is_pregnant_inthefuture))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is pregnant) OR (the patient plans to attempt pregnancy)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_physical_activity_value_recorded_inthehistory_withunit_minutes_per_week Real) ;; {"when_to_set_to_value":"Set to the total number of minutes per week if a numeric measurement of moderate physical activity during the relevant history period is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the total minutes per week of moderate physical activity the patient engaged in during the relevant history period."} ;; "physical activity"
(declare-const patient_physical_activity_value_recorded_inthehistory_withunit_minutes_per_week@@moderate_intensity Bool) ;; {"when_to_set_to_true":"Set to true if the recorded physical activity is of moderate intensity.","when_to_set_to_false":"Set to false if the recorded physical activity is not of moderate intensity.","when_to_set_to_null":"Set to null if the intensity of the recorded physical activity is unknown or indeterminate.","meaning":"Boolean indicating whether the recorded physical activity is of moderate intensity."} ;; "moderate physical activity"
(declare-const patient_physical_activity_value_recorded_inthehistory_withunit_minutes_per_week@@vigorous_intensity Bool) ;; {"when_to_set_to_true":"Set to true if the recorded physical activity is of vigorous intensity.","when_to_set_to_false":"Set to false if the recorded physical activity is not of vigorous intensity.","when_to_set_to_null":"Set to null if the intensity of the recorded physical activity is unknown or indeterminate.","meaning":"Boolean indicating whether the recorded physical activity is of vigorous intensity."} ;; "vigorous physical activity"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient engages in moderate physical activity for >= 60 minutes per week
(assert
(! (not (and patient_physical_activity_value_recorded_inthehistory_withunit_minutes_per_week@@moderate_intensity
             (>= patient_physical_activity_value_recorded_inthehistory_withunit_minutes_per_week 60)))
:named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient engages in moderate physical activity for greater than or equal to sixty (60) minutes per week."

;; Exclusion: patient engages in vigorous physical activity for >= 60 minutes per week
(assert
(! (not (and patient_physical_activity_value_recorded_inthehistory_withunit_minutes_per_week@@vigorous_intensity
             (>= patient_physical_activity_value_recorded_inthehistory_withunit_minutes_per_week 60)))
:named REQ2_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient engages in vigorous physical activity for greater than or equal to sixty (60) minutes per week."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_cigar_smoking_frequency_per_week_value_recorded_now_withunit_per_week Real) ;; {"when_to_set_to_value":"Set to the number of times per week the patient currently smokes cigars.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many times per week the patient currently smokes cigars.","meaning":"Numeric value indicating the number of times per week the patient currently smokes cigars."} ;; "the patient smokes cigars at least once per week"
(declare-const patient_has_finding_of_cigar_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently smokes cigars.","when_to_set_to_false":"Set to false if the patient currently does not smoke cigars.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently smokes cigars.","meaning":"Boolean indicating whether the patient currently smokes cigars."} ;; "the patient smokes cigars"
(declare-const patient_has_finding_of_pipe_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently smokes pipes.","when_to_set_to_false":"Set to false if the patient currently does not smoke pipes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently smokes pipes.","meaning":"Boolean indicating whether the patient currently smokes pipes."} ;; "the patient smokes pipes"
(declare-const patient_has_finding_of_user_of_smokeless_tobacco_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently uses smokeless tobacco.","when_to_set_to_false":"Set to false if the patient currently does not use smokeless tobacco.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently uses smokeless tobacco.","meaning":"Boolean indicating whether the patient currently uses smokeless tobacco."} ;; "the patient uses smokeless tobacco"
(declare-const patient_pipe_smoking_frequency_per_week_value_recorded_now_withunit_per_week Real) ;; {"when_to_set_to_value":"Set to the number of times per week the patient currently smokes pipes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many times per week the patient currently smokes pipes.","meaning":"Numeric value indicating the number of times per week the patient currently smokes pipes."} ;; "the patient smokes pipes at least once per week"
(declare-const patient_smokeless_tobacco_use_frequency_per_week_value_recorded_now_withunit_per_week Real) ;; {"when_to_set_to_value":"Set to the number of times per week the patient currently uses smokeless tobacco.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many times per week the patient currently uses smokeless tobacco.","meaning":"Numeric value indicating the number of times per week the patient currently uses smokeless tobacco."} ;; "the patient uses smokeless tobacco at least once per week"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Numeric frequency implies Boolean finding for cigars
(assert
(! (=> (>= patient_cigar_smoking_frequency_per_week_value_recorded_now_withunit_per_week 1)
       patient_has_finding_of_cigar_smoker_now)
:named REQ3_AUXILIARY0)) ;; "the patient smokes cigars at least once per week"

;; Numeric frequency implies Boolean finding for pipes
(assert
(! (=> (>= patient_pipe_smoking_frequency_per_week_value_recorded_now_withunit_per_week 1)
       patient_has_finding_of_pipe_smoker_now)
:named REQ3_AUXILIARY1)) ;; "the patient smokes pipes at least once per week"

;; Numeric frequency implies Boolean finding for smokeless tobacco
(assert
(! (=> (>= patient_smokeless_tobacco_use_frequency_per_week_value_recorded_now_withunit_per_week 1)
       patient_has_finding_of_user_of_smokeless_tobacco_now)
:named REQ3_AUXILIARY2)) ;; "the patient uses smokeless tobacco at least once per week"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (or (>= patient_cigar_smoking_frequency_per_week_value_recorded_now_withunit_per_week 1)
            (>= patient_pipe_smoking_frequency_per_week_value_recorded_now_withunit_per_week 1)
            (>= patient_smokeless_tobacco_use_frequency_per_week_value_recorded_now_withunit_per_week 1)))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient smokes cigars at least once per week) OR (the patient smokes pipes at least once per week) OR (the patient uses smokeless tobacco at least once per week)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_currently_in_quit_smoking_program Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently enrolled in a quit smoking program.","when_to_set_to_false":"Set to false if the patient is not currently enrolled in a quit smoking program.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently enrolled in a quit smoking program.","meaning":"Boolean indicating whether the patient is currently enrolled in a quit smoking program."} ;; "The patient is excluded if the patient is currently in a quit smoking program."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_currently_in_quit_smoking_program)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently in a quit smoking program."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_exposed_to_nicotine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to nicotine.","when_to_set_to_false":"Set to false if the patient is currently not exposed to nicotine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to nicotine.","meaning":"Boolean indicating whether the patient is currently exposed to nicotine."} ;; "nicotine"
(declare-const patient_is_exposed_to_nicotine_now@@as_replacement_therapy_of_any_kind Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to nicotine as part of any nicotine replacement therapy.","when_to_set_to_false":"Set to false if the patient is currently exposed to nicotine but not as part of any nicotine replacement therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current nicotine exposure is as part of any nicotine replacement therapy.","meaning":"Boolean indicating whether the patient's current nicotine exposure is as part of any nicotine replacement therapy."} ;; "nicotine replacement therapy of any kind"
(declare-const patients_smoking_cessation_behavior_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a quit smoking method.","when_to_set_to_false":"Set to false if the patient is currently not using a quit smoking method.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a quit smoking method.","meaning":"Boolean indicating whether the patient is currently using a quit smoking method."} ;; "quit smoking method"
(declare-const patients_smoking_cessation_behavior_is_positive_now@@any_other_method Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using any other quit smoking method (not nicotine replacement therapy).","when_to_set_to_false":"Set to false if the patient is currently using a quit smoking method but it is not considered 'any other' method.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the quit smoking method is 'any other' method.","meaning":"Boolean indicating whether the patient's current quit smoking method is 'any other' method (not nicotine replacement therapy)."} ;; "any other quit smoking method"
(declare-const patients_smoking_cessation_therapy_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a quit smoking treatment.","when_to_set_to_false":"Set to false if the patient is currently not using a quit smoking treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a quit smoking treatment.","meaning":"Boolean indicating whether the patient is currently using a quit smoking treatment."} ;; "quit smoking treatment"
(declare-const patients_smoking_cessation_therapy_is_positive_now@@any_other_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using any other quit smoking treatment (not nicotine replacement therapy).","when_to_set_to_false":"Set to false if the patient is currently using a quit smoking treatment but it is not considered 'any other' treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the quit smoking treatment is 'any other' treatment.","meaning":"Boolean indicating whether the patient's current quit smoking treatment is 'any other' treatment (not nicotine replacement therapy)."} ;; "any other quit smoking treatment"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable for nicotine replacement therapy implies nicotine exposure
(assert
(! (=> patient_is_exposed_to_nicotine_now@@as_replacement_therapy_of_any_kind
       patient_is_exposed_to_nicotine_now)
    :named REQ5_AUXILIARY0)) ;; "nicotine replacement therapy of any kind"

;; Qualifier variable for 'any other' quit smoking method implies quit smoking method
(assert
(! (=> patients_smoking_cessation_behavior_is_positive_now@@any_other_method
       patients_smoking_cessation_behavior_is_positive_now)
    :named REQ5_AUXILIARY1)) ;; "any other quit smoking method"

;; Qualifier variable for 'any other' quit smoking treatment implies quit smoking treatment
(assert
(! (=> patients_smoking_cessation_therapy_is_positive_now@@any_other_treatment
       patients_smoking_cessation_therapy_is_positive_now)
    :named REQ5_AUXILIARY2)) ;; "any other quit smoking treatment"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: currently using nicotine replacement therapy of any kind
(assert
(! (not patient_is_exposed_to_nicotine_now@@as_replacement_therapy_of_any_kind)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently using nicotine replacement therapy of any kind."

;; Exclusion: currently using any other quit smoking method
(assert
(! (not patients_smoking_cessation_behavior_is_positive_now@@any_other_method)
    :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently using any other quit smoking method."

;; Exclusion: currently using any other quit smoking treatment
(assert
(! (not patients_smoking_cessation_therapy_is_positive_now@@any_other_treatment)
    :named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently using any other quit smoking treatment."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_adverse_reaction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an adverse reaction at any time in the past, regardless of cause or outcome.","when_to_set_to_false":"Set to false if the patient has never had an adverse reaction at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an adverse reaction.","meaning":"Boolean indicating whether the patient has ever had an adverse reaction at any time in the past."} ;; "has ever had an adverse reaction"
(declare-const patient_has_finding_of_adverse_reaction_inthehistory@@caused_by_nicotine_patch Bool) ;; {"when_to_set_to_true":"Set to true if the patient's adverse reaction was caused by the nicotine patch.","when_to_set_to_false":"Set to false if the patient's adverse reaction was not caused by the nicotine patch.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the adverse reaction was caused by the nicotine patch.","meaning":"Boolean indicating whether the patient's adverse reaction was caused by the nicotine patch."} ;; "adverse reaction to the nicotine patch"
(declare-const patient_has_finding_of_adverse_reaction_inthehistory@@resulted_in_discontinuation_of_use Bool) ;; {"when_to_set_to_true":"Set to true if the patient's adverse reaction resulted in discontinuation of use.","when_to_set_to_false":"Set to false if the patient's adverse reaction did not result in discontinuation of use.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the adverse reaction resulted in discontinuation of use.","meaning":"Boolean indicating whether the patient's adverse reaction resulted in discontinuation of use."} ;; "adverse reaction ... resulting in discontinuation of use"
(declare-const patient_has_finding_of_adverse_reaction_inthehistory@@caused_by_nicotine_patch@@resulted_in_discontinuation_of_use Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an adverse reaction at any time in the past, the adverse reaction was caused by the nicotine patch, and it resulted in discontinuation of use.","when_to_set_to_false":"Set to false if the patient has never had an adverse reaction at any time in the past, or if the adverse reaction was not caused by the nicotine patch, or if it did not result in discontinuation of use.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an adverse reaction caused by the nicotine patch that resulted in discontinuation of use.","meaning":"Boolean indicating whether the patient has ever had an adverse reaction caused by the nicotine patch that resulted in discontinuation of use."} ;; "adverse reaction to the nicotine patch resulting in discontinuation of use"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Definitional: The fully qualified variable is true iff all three conditions are true
(assert
(! (= patient_has_finding_of_adverse_reaction_inthehistory@@caused_by_nicotine_patch@@resulted_in_discontinuation_of_use
     (and patient_has_finding_of_adverse_reaction_inthehistory
          patient_has_finding_of_adverse_reaction_inthehistory@@caused_by_nicotine_patch
          patient_has_finding_of_adverse_reaction_inthehistory@@resulted_in_discontinuation_of_use))
   :named REQ6_AUXILIARY0)) ;; "has ever had an adverse reaction to the nicotine patch resulting in discontinuation of use."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_adverse_reaction_inthehistory@@caused_by_nicotine_patch
      patient_has_finding_of_adverse_reaction_inthehistory)
   :named REQ6_AUXILIARY1)) ;; "adverse reaction ... caused by the nicotine patch" implies "adverse reaction"

(assert
(! (=> patient_has_finding_of_adverse_reaction_inthehistory@@resulted_in_discontinuation_of_use
      patient_has_finding_of_adverse_reaction_inthehistory)
   :named REQ6_AUXILIARY2)) ;; "adverse reaction ... resulted in discontinuation of use" implies "adverse reaction"

(assert
(! (=> patient_has_finding_of_adverse_reaction_inthehistory@@caused_by_nicotine_patch@@resulted_in_discontinuation_of_use
      patient_has_finding_of_adverse_reaction_inthehistory@@caused_by_nicotine_patch)
   :named REQ6_AUXILIARY3)) ;; "adverse reaction ... caused by nicotine patch and resulted in discontinuation" implies "adverse reaction ... caused by nicotine patch"

(assert
(! (=> patient_has_finding_of_adverse_reaction_inthehistory@@caused_by_nicotine_patch@@resulted_in_discontinuation_of_use
      patient_has_finding_of_adverse_reaction_inthehistory@@resulted_in_discontinuation_of_use)
   :named REQ6_AUXILIARY4)) ;; "adverse reaction ... caused by nicotine patch and resulted in discontinuation" implies "adverse reaction ... resulted in discontinuation of use"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_adverse_reaction_inthehistory@@caused_by_nicotine_patch@@resulted_in_discontinuation_of_use)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has ever had an adverse reaction to the nicotine patch resulting in discontinuation of use."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_poor_willingness_to_comply_with_protocol_requirements_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has poor willingness to comply with protocol requirements.","when_to_set_to_false":"Set to false if the patient currently does not have poor willingness to comply with protocol requirements.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has poor willingness to comply with protocol requirements.","meaning":"Boolean indicating whether the patient currently has poor willingness to comply with protocol requirements."} ;; "the patient has poor willingness to comply with protocol requirements"
(declare-const patient_has_finding_of_inability_to_comply_with_protocol_requirements_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has inability to comply with protocol requirements.","when_to_set_to_false":"Set to false if the patient currently does not have inability to comply with protocol requirements.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has inability to comply with protocol requirements.","meaning":"Boolean indicating whether the patient currently has inability to comply with protocol requirements."} ;; "the patient has inability to comply with protocol requirements"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_poor_willingness_to_comply_with_protocol_requirements_now)
:named REQ7_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has poor willingness to comply with protocol requirements."

(assert
(! (not patient_has_finding_of_inability_to_comply_with_protocol_requirements_now)
:named REQ7_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has inability to comply with protocol requirements."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_employee_of_centers_for_behavioral_and_preventive_medicine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently an employee of the Centers for Behavioral and Preventive Medicine.","when_to_set_to_false":"Set to false if the patient is currently not an employee of the Centers for Behavioral and Preventive Medicine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an employee of the Centers for Behavioral and Preventive Medicine.","meaning":"Boolean indicating whether the patient is currently an employee of the Centers for Behavioral and Preventive Medicine."} ;; "The patient is excluded if the patient is an employee of the Centers for Behavioral and Preventive Medicine."

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_is_employee_of_centers_for_behavioral_and_preventive_medicine_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is an employee of the Centers for Behavioral and Preventive Medicine."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_is_previous_participant_in_commit_to_quit_smoking_cessation_studies Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously participated in Commit to Quit smoking cessation studies.","when_to_set_to_false":"Set to false if the patient has not previously participated in Commit to Quit smoking cessation studies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously participated in Commit to Quit smoking cessation studies.","meaning":"Boolean indicating whether the patient has previously participated in Commit to Quit smoking cessation studies."} ;; "the patient is a previous participant in Commit to Quit smoking cessation studies"
(declare-const patient_is_previous_participant_in_fit_to_quit_smoking_cessation_studies Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously participated in Fit to Quit smoking cessation studies.","when_to_set_to_false":"Set to false if the patient has not previously participated in Fit to Quit smoking cessation studies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously participated in Fit to Quit smoking cessation studies.","meaning":"Boolean indicating whether the patient has previously participated in Fit to Quit smoking cessation studies."} ;; "the patient is a previous participant in Fit to Quit smoking cessation studies"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_is_previous_participant_in_commit_to_quit_smoking_cessation_studies)
    :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a previous participant in Commit to Quit smoking cessation studies."

(assert
(! (not patient_is_previous_participant_in_fit_to_quit_smoking_cessation_studies)
    :named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a previous participant in Fit to Quit smoking cessation studies."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const other_household_member_is_currently_enrolled_in_this_study Bool) ;; {"when_to_set_to_true":"Set to true if at least one other member of the patient's household is currently enrolled in this study.","when_to_set_to_false":"Set to false if no other member of the patient's household is currently enrolled in this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether any other member of the patient's household is currently enrolled in this study.","meaning":"Boolean indicating whether at least one other member of the patient's household is currently enrolled in this study."} ;; "at least one other member of the patient's household is currently enrolled in this study"
(declare-const other_household_member_was_previously_enrolled_in_this_study Bool) ;; {"when_to_set_to_true":"Set to true if at least one other member of the patient's household was previously enrolled in this study.","when_to_set_to_false":"Set to false if no other member of the patient's household was previously enrolled in this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether any other member of the patient's household was previously enrolled in this study.","meaning":"Boolean indicating whether at least one other member of the patient's household was previously enrolled in this study."} ;; "at least one other member of the patient's household was previously enrolled in this study"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not (or other_household_member_is_currently_enrolled_in_this_study
            other_household_member_was_previously_enrolled_in_this_study))
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (at least one other member of the patient's household is currently enrolled in this study) OR (at least one other member of the patient's household was previously enrolled in this study)."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_is_currently_taking_medication_that_might_impact_heart_rate_response Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any medication that might impact heart rate response, including but not limited to acebutolol, atenolol, carvedilol, metoprolol, nadolol, pindolol, propranolol, timolol, or similar agents.","when_to_set_to_false":"Set to false if the patient is not currently taking any medication that might impact heart rate response.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any medication that might impact heart rate response.","meaning":"Boolean indicating whether the patient is currently taking any medication that might impact heart rate response."} ;; "currently taking a medication that might impact heart rate response, including but not limited to: acebutolol, atenolol, carvedilol, metoprolol, nadolol, pindolol, propranolol, or timolol."

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_is_currently_taking_medication_that_might_impact_heart_rate_response)
    :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently taking a medication that might impact heart rate response with non-exhaustive examples (acebutolol OR atenolol OR carvedilol OR metoprolol OR nadolol OR pindolol OR propranolol OR timolol)."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_problem_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has at least one medical problem documented at any time in their history.","when_to_set_to_false":"Set to false if the patient has no medical problems documented at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has any medical problem in their history.","meaning":"Boolean indicating whether the patient has any medical problem documented at any time in their history."} ;; "medical problems"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_finding_of_problem_inthehistory)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has at least one of the following medical problems."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_finding_of_cardiac_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any type of cardiac disease, including but not limited to angina.","when_to_set_to_false":"Set to false if the patient currently does not have any type of cardiac disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any type of cardiac disease.","meaning":"Boolean indicating whether the patient currently has any type of cardiac disease."} ;; "cardiac disease of any kind"
(declare-const patient_has_finding_of_angina_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has angina.","when_to_set_to_false":"Set to false if the patient currently does not have angina.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has angina.","meaning":"Boolean indicating whether the patient currently has angina."} ;; "angina"
(declare-const patient_has_finding_of_myocardial_infarction_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of myocardial infarction.","when_to_set_to_false":"Set to false if the patient does not have a history of myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of myocardial infarction.","meaning":"Boolean indicating whether the patient has a history of myocardial infarction."} ;; "history of myocardial infarction"
(declare-const patient_has_finding_of_valve_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any type of valve disease, including but not limited to mitral valve prolapse.","when_to_set_to_false":"Set to false if the patient currently does not have any type of valve disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any type of valve disease.","meaning":"Boolean indicating whether the patient currently has any type of valve disease."} ;; "valve disease"
(declare-const patient_has_finding_of_mitral_valve_prolapse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has mitral valve prolapse.","when_to_set_to_false":"Set to false if the patient currently does not have mitral valve prolapse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has mitral valve prolapse.","meaning":"Boolean indicating whether the patient currently has mitral valve prolapse."} ;; "mitral valve prolapse"
(declare-const patient_has_undergone_interventional_procedure_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone any interventional procedure in the past, including but not limited to stent placement.","when_to_set_to_false":"Set to false if the patient has not undergone any interventional procedure in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone any interventional procedure in the past.","meaning":"Boolean indicating whether the patient has undergone any interventional procedure in the past."} ;; "interventional procedure"
(declare-const patient_has_undergone_stent_placement_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone stent placement in the past.","when_to_set_to_false":"Set to false if the patient has not undergone stent placement in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone stent placement in the past.","meaning":"Boolean indicating whether the patient has undergone stent placement in the past."} ;; "stent"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Non-exhaustive example: angina implies cardiac disease of any kind
(assert
(! (=> patient_has_finding_of_angina_now
       patient_has_finding_of_cardiac_disease_now)
   :named REQ13_AUXILIARY0)) ;; "with non-exhaustive examples (angina)"

;; Non-exhaustive example: mitral valve prolapse implies valve disease
(assert
(! (=> patient_has_finding_of_mitral_valve_prolapse_now
       patient_has_finding_of_valve_disease_now)
   :named REQ13_AUXILIARY1)) ;; "with non-exhaustive examples (mitral valve prolapse)"

;; Non-exhaustive example: stent placement implies interventional procedure
(assert
(! (=> patient_has_undergone_stent_placement_in_the_history
       patient_has_undergone_interventional_procedure_in_the_history)
   :named REQ13_AUXILIARY2)) ;; "with non-exhaustive examples (stent)"

;; ===================== Constraint Assertions (REQ 13) =====================
;; Exclusion: patient must NOT have any of the following:
;; (cardiac disease of any kind) OR (history of myocardial infarction) OR (valve disease) OR (interventional procedure)
(assert
(! (not (or patient_has_finding_of_cardiac_disease_now
            patient_has_finding_of_myocardial_infarction_in_the_history
            patient_has_finding_of_valve_disease_now
            patient_has_undergone_interventional_procedure_in_the_history))
   :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has cardiac disease of any kind with non-exhaustive examples (angina)) OR (the patient has a history of myocardial infarction) OR (the patient has valve disease with non-exhaustive examples (mitral valve prolapse)) OR (the patient has had an interventional procedure with non-exhaustive examples (stent))."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pain located in the chest.","when_to_set_to_false":"Set to false if the patient currently does not have pain located in the chest.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pain located in the chest.","meaning":"Boolean indicating whether the patient currently has pain located in the chest."} ;; "pain in the chest"
(declare-const patient_has_finding_of_chest_discomfort_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has discomfort located in the chest.","when_to_set_to_false":"Set to false if the patient currently does not have discomfort located in the chest.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has discomfort located in the chest.","meaning":"Boolean indicating whether the patient currently has discomfort located in the chest."} ;; "discomfort in the chest"
(declare-const patient_has_finding_of_anginal_equivalent_in_chest_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an anginal equivalent located in the chest.","when_to_set_to_false":"Set to false if the patient currently does not have an anginal equivalent located in the chest.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an anginal equivalent located in the chest.","meaning":"Boolean indicating whether the patient currently has an anginal equivalent located in the chest."} ;; "anginal equivalent in the chest"
(declare-const patient_has_finding_of_neck_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pain located in the neck.","when_to_set_to_false":"Set to false if the patient currently does not have pain located in the neck.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pain located in the neck.","meaning":"Boolean indicating whether the patient currently has neck pain."} ;; "pain in the neck"
(declare-const patient_has_finding_of_neck_discomfort_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has discomfort located in the neck.","when_to_set_to_false":"Set to false if the patient currently does not have discomfort located in the neck.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has discomfort located in the neck.","meaning":"Boolean indicating whether the patient currently has discomfort located in the neck."} ;; "discomfort in the neck"
(declare-const patient_has_finding_of_anginal_equivalent_in_neck_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an anginal equivalent located in the neck.","when_to_set_to_false":"Set to false if the patient currently does not have an anginal equivalent located in the neck.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an anginal equivalent located in the neck.","meaning":"Boolean indicating whether the patient currently has an anginal equivalent located in the neck."} ;; "anginal equivalent in the neck"
(declare-const patient_has_finding_of_jaw_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pain located in the jaw.","when_to_set_to_false":"Set to false if the patient currently does not have pain located in the jaw.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pain located in the jaw.","meaning":"Boolean indicating whether the patient currently has jaw pain."} ;; "pain in the jaw"
(declare-const patient_has_finding_of_jaw_discomfort_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has discomfort located in the jaw.","when_to_set_to_false":"Set to false if the patient currently does not have discomfort located in the jaw.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has discomfort located in the jaw.","meaning":"Boolean indicating whether the patient currently has discomfort located in the jaw."} ;; "discomfort in the jaw"
(declare-const patient_has_finding_of_anginal_equivalent_in_jaw_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an anginal equivalent located in the jaw.","when_to_set_to_false":"Set to false if the patient currently does not have an anginal equivalent located in the jaw.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an anginal equivalent located in the jaw.","meaning":"Boolean indicating whether the patient currently has an anginal equivalent located in the jaw."} ;; "anginal equivalent in the jaw"
(declare-const patient_has_finding_of_pain_in_upper_limb_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pain located in the upper limb(s)/arms.","when_to_set_to_false":"Set to false if the patient currently does not have pain located in the upper limb(s)/arms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pain located in the upper limb(s)/arms.","meaning":"Boolean indicating whether the patient currently has pain in the upper limb(s)/arms."} ;; "pain in the arms"
(declare-const patient_has_finding_of_upper_limb_discomfort_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has discomfort located in the upper limb(s)/arms.","when_to_set_to_false":"Set to false if the patient currently does not have discomfort located in the upper limb(s)/arms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has discomfort located in the upper limb(s)/arms.","meaning":"Boolean indicating whether the patient currently has discomfort located in the upper limb(s)/arms."} ;; "discomfort in the arms"
(declare-const patient_has_finding_of_anginal_equivalent_in_upper_limb_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an anginal equivalent located in the upper limb(s)/arms.","when_to_set_to_false":"Set to false if the patient currently does not have an anginal equivalent located in the upper limb(s)/arms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an anginal equivalent located in the upper limb(s)/arms.","meaning":"Boolean indicating whether the patient currently has an anginal equivalent located in the upper limb(s)/arms."} ;; "anginal equivalent in the arms"
(declare-const patient_has_finding_of_other_area_pain_due_to_ischemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pain in other areas that may be due to ischemia.","when_to_set_to_false":"Set to false if the patient currently does not have pain in other areas that may be due to ischemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pain in other areas that may be due to ischemia.","meaning":"Boolean indicating whether the patient currently has pain in other areas that may be due to ischemia."} ;; "pain in other areas that may be due to ischemia"
(declare-const patient_has_finding_of_other_area_discomfort_due_to_ischemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has discomfort in other areas that may be due to ischemia.","when_to_set_to_false":"Set to false if the patient currently does not have discomfort in other areas that may be due to ischemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has discomfort in other areas that may be due to ischemia.","meaning":"Boolean indicating whether the patient currently has discomfort in other areas that may be due to ischemia."} ;; "discomfort in other areas that may be due to ischemia"
(declare-const patient_has_finding_of_anginal_equivalent_in_other_area_due_to_ischemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an anginal equivalent in other areas that may be due to ischemia.","when_to_set_to_false":"Set to false if the patient currently does not have an anginal equivalent in other areas that may be due to ischemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an anginal equivalent in other areas that may be due to ischemia.","meaning":"Boolean indicating whether the patient currently has an anginal equivalent in other areas that may be due to ischemia."} ;; "anginal equivalent in other areas that may be due to ischemia"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_finding_of_chest_pain_now)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pain in the chest."

(assert
(! (not patient_has_finding_of_chest_discomfort_now)
:named REQ14_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has discomfort in the chest."

(assert
(! (not patient_has_finding_of_anginal_equivalent_in_chest_now)
:named REQ14_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has anginal equivalent in the chest."

(assert
(! (not patient_has_finding_of_neck_pain_now)
:named REQ14_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pain in the neck."

(assert
(! (not patient_has_finding_of_neck_discomfort_now)
:named REQ14_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has discomfort in the neck."

(assert
(! (not patient_has_finding_of_anginal_equivalent_in_neck_now)
:named REQ14_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has anginal equivalent in the neck."

(assert
(! (not patient_has_finding_of_jaw_pain_now)
:named REQ14_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pain in the jaw."

(assert
(! (not patient_has_finding_of_jaw_discomfort_now)
:named REQ14_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has discomfort in the jaw."

(assert
(! (not patient_has_finding_of_anginal_equivalent_in_jaw_now)
:named REQ14_COMPONENT8_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has anginal equivalent in the jaw."

(assert
(! (not patient_has_finding_of_pain_in_upper_limb_now)
:named REQ14_COMPONENT9_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pain in the arms."

(assert
(! (not patient_has_finding_of_upper_limb_discomfort_now)
:named REQ14_COMPONENT10_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has discomfort in the arms."

(assert
(! (not patient_has_finding_of_anginal_equivalent_in_upper_limb_now)
:named REQ14_COMPONENT11_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has anginal equivalent in the arms."

(assert
(! (not patient_has_finding_of_other_area_pain_due_to_ischemia_now)
:named REQ14_COMPONENT12_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pain in other areas that may be due to ischemia."

(assert
(! (not patient_has_finding_of_other_area_discomfort_due_to_ischemia_now)
:named REQ14_COMPONENT13_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has discomfort in other areas that may be due to ischemia."

(assert
(! (not patient_has_finding_of_anginal_equivalent_in_other_area_due_to_ischemia_now)
:named REQ14_COMPONENT14_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has anginal equivalent in other areas that may be due to ischemia."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_diagnosis_of_cerebrovascular_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with cerebrovascular disease at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with cerebrovascular disease at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with cerebrovascular disease.","meaning":"Boolean indicating whether the patient has ever been diagnosed with cerebrovascular disease in their history."} ;; "cerebrovascular disease"

(declare-const patient_has_diagnosis_of_stroke_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with stroke at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with stroke at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with stroke.","meaning":"Boolean indicating whether the patient has ever been diagnosed with stroke in their history."} ;; "stroke"

(declare-const patient_has_diagnosis_of_transient_cerebral_ischemia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with transient cerebral ischemia (transient ischemic attacks) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with transient cerebral ischemia (transient ischemic attacks) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with transient cerebral ischemia (transient ischemic attacks).","meaning":"Boolean indicating whether the patient has ever been diagnosed with transient cerebral ischemia (transient ischemic attacks) in their history."} ;; "transient ischemic attacks"

;; ===================== Auxiliary Assertions (REQ 15) =====================
;; Non-exhaustive examples: stroke is an example of cerebrovascular disease, but not the only one
(assert
(! (=> patient_has_diagnosis_of_stroke_inthehistory
       patient_has_diagnosis_of_cerebrovascular_disease_inthehistory)
    :named REQ15_AUXILIARY0)) ;; "with non-exhaustive examples (stroke)"

;; ===================== Constraint Assertions (REQ 15) =====================
;; Exclusion if (cerebrovascular disease) OR (history of transient ischemic attacks)
(assert
(! (not (or patient_has_diagnosis_of_cerebrovascular_disease_inthehistory
            patient_has_diagnosis_of_transient_cerebral_ischemia_inthehistory))
    :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has cerebrovascular disease with non-exhaustive examples (stroke)) OR (the patient has a history of transient ischemic attacks)."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_finding_of_peripheral_vascular_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding or diagnosis of peripheral vascular disease documented in their history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding or diagnosis of peripheral vascular disease documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had peripheral vascular disease.","meaning":"Boolean indicating whether the patient has ever had peripheral vascular disease in their history."} ;; "peripheral vascular disease"
(declare-const patient_has_finding_of_claudication_ever Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had claudication documented in their history.","when_to_set_to_false":"Set to false if the patient has never had claudication documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had claudication.","meaning":"Boolean indicating whether the patient has ever had claudication in their history."} ;; "claudication"

;; ===================== Auxiliary Assertions (REQ 16) =====================
;; Non-exhaustive example: claudication is an example of peripheral vascular disease, but not the only possible finding
(assert
(! (=> patient_has_finding_of_claudication_ever
      patient_has_finding_of_peripheral_vascular_disease_inthehistory)
    :named REQ16_AUXILIARY0)) ;; "with non-exhaustive examples (claudication)."

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not patient_has_finding_of_peripheral_vascular_disease_inthehistory)
    :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has peripheral vascular disease with non-exhaustive examples (claudication)."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_diagnosis_of_type_1_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of type 1 diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of type 1 diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of type 1 diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of type 1 diabetes mellitus."} ;; "type I diabetes"
(declare-const patient_has_diagnosis_of_type_2_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of type 2 diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of type 2 diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of type 2 diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of type 2 diabetes mellitus."} ;; "type II diabetes"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not patient_has_diagnosis_of_type_1_diabetes_mellitus_now)
:named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has type I diabetes."

(assert
(! (not patient_has_diagnosis_of_type_2_diabetes_mellitus_now)
:named REQ17_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has type II diabetes."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_has_finding_of_chronic_infectious_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chronic infectious disease.","when_to_set_to_false":"Set to false if the patient currently does not have a chronic infectious disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a chronic infectious disease.","meaning":"Boolean indicating whether the patient currently has a chronic infectious disease."} ;; "the patient has a chronic infectious disease"
(declare-const patient_has_finding_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has human immunodeficiency virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient currently has human immunodeficiency virus infection."} ;; "human immunodeficiency virus infection"
(declare-const patient_has_finding_of_chronic_hepatitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic hepatitis.","when_to_set_to_false":"Set to false if the patient currently does not have chronic hepatitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic hepatitis.","meaning":"Boolean indicating whether the patient currently has chronic hepatitis."} ;; "chronic hepatitis"
(declare-const patient_has_finding_of_chronic_hepatitis_now@@excluding_hepatitis_a Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic hepatitis and hepatitis A is excluded.","when_to_set_to_false":"Set to false if the patient currently has chronic hepatitis and hepatitis A is not excluded (i.e., the chronic hepatitis is hepatitis A).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether hepatitis A is excluded from the chronic hepatitis diagnosis.","meaning":"Boolean indicating whether the patient's chronic hepatitis excludes hepatitis A."} ;; "chronic hepatitis EXCEPT hepatitis A"

;; ===================== Auxiliary Assertions (REQ 18) =====================
;; Non-exhaustive example: HIV infection implies chronic infectious disease
(assert
(! (=> patient_has_finding_of_human_immunodeficiency_virus_infection_now
      patient_has_finding_of_chronic_infectious_disease_now)
    :named REQ18_AUXILIARY0)) ;; "with non-exhaustive examples (human immunodeficiency virus infection)"

;; Qualifier variable for chronic hepatitis EXCEPT hepatitis A implies chronic hepatitis
(assert
(! (=> patient_has_finding_of_chronic_hepatitis_now@@excluding_hepatitis_a
      patient_has_finding_of_chronic_hepatitis_now)
    :named REQ18_AUXILIARY1)) ;; "chronic hepatitis EXCEPT hepatitis A"

;; ===================== Constraint Assertions (REQ 18) =====================
;; Exclusion: patient must NOT have a chronic infectious disease (with non-exhaustive examples)
(assert
(! (not patient_has_finding_of_chronic_infectious_disease_now)
    :named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has a chronic infectious disease with non-exhaustive examples (human immunodeficiency virus infection)"

;; Exclusion: patient must NOT have chronic hepatitis EXCEPT hepatitis A
(assert
(! (not patient_has_finding_of_chronic_hepatitis_now@@excluding_hepatitis_a)
    :named REQ18_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has chronic hepatitis EXCEPT hepatitis A"

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_has_finding_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any liver disease.","when_to_set_to_false":"Set to false if the patient currently does not have any liver disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any liver disease.","meaning":"Boolean indicating whether the patient currently has any liver disease."} ;; "liver disease"

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not patient_has_finding_of_disease_of_liver_now)
:named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has liver disease."

;; ===================== Declarations for the exclusion criterion (REQ 20) =====================
(declare-const patient_has_diagnosis_of_cystic_fibrosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cystic fibrosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cystic fibrosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cystic fibrosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cystic fibrosis."} ;; "cystic fibrosis"

;; ===================== Constraint Assertions (REQ 20) =====================
(assert
  (! (not patient_has_diagnosis_of_cystic_fibrosis_now)
     :named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cystic fibrosis."

;; ===================== Declarations for the exclusion criterion (REQ 21) =====================
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic obstructive pulmonary disease (COPD).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic obstructive pulmonary disease (COPD).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic obstructive pulmonary disease (COPD).","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic obstructive pulmonary disease."} ;; "chronic obstructive pulmonary disease"

;; ===================== Constraint Assertions (REQ 21) =====================
(assert
(! (not patient_has_diagnosis_of_chronic_obstructive_lung_disease_now)
:named REQ21_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic obstructive pulmonary disease."

;; ===================== Declarations for the exclusion criterion (REQ 22) =====================
(declare-const patient_has_finding_of_interstitial_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has interstitial lung disease.","when_to_set_to_false":"Set to false if the patient currently does not have interstitial lung disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has interstitial lung disease.","meaning":"Boolean indicating whether the patient currently has interstitial lung disease."} ;; "interstitial lung disease"

;; ===================== Constraint Assertions (REQ 22) =====================
(assert
(! (not patient_has_finding_of_interstitial_lung_disease_now)
:named REQ22_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has interstitial lung disease."

;; ===================== Declarations for the exclusion criterion (REQ 23) =====================
(declare-const patient_has_diagnosis_of_pulmonary_emphysema_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of pulmonary emphysema.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of pulmonary emphysema.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of pulmonary emphysema.","meaning":"Boolean indicating whether the patient currently has a diagnosis of pulmonary emphysema."} ;; "The patient is excluded if the patient has emphysema."

;; ===================== Constraint Assertions (REQ 23) =====================
(assert
  (! (not patient_has_diagnosis_of_pulmonary_emphysema_now)
     :named REQ23_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has emphysema."

;; ===================== Declarations for the exclusion criterion (REQ 24) =====================
(declare-const patient_has_diagnosis_of_chronic_bronchitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic bronchitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic bronchitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic bronchitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic bronchitis."} ;; "The patient is excluded if the patient has chronic bronchitis."

;; ===================== Constraint Assertions (REQ 24) =====================
(assert
(! (not patient_has_diagnosis_of_chronic_bronchitis_now)
:named REQ24_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic bronchitis."
