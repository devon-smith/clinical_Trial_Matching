;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is male at the current time."}  ;; "be male"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."}  ;; "be female"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; To be included, the patient must ((be male) OR (be female AND be aged ≥ 18 years)).
(assert
  (! (or patient_sex_is_male_now
         (and patient_sex_is_female_now (>= patient_age_value_recorded_now_in_years 18)))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered to have childbearing potential based on clinical criteria.","when_to_set_to_false":"Set to false if the patient is currently considered not to have childbearing potential based on clinical criteria.","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} ;; "patient is of childbearing potential"
(declare-const patient_has_agreed_to_use_effective_birth_control_method_during_treatment_and_followup_periods Bool) ;; {"when_to_set_to_true":"Set to true if the patient has agreed to use an effective method of birth control during both the treatment period and the follow-up study period.","when_to_set_to_false":"Set to false if the patient has not agreed to use an effective method of birth control during both the treatment period and the follow-up study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has agreed to use an effective method of birth control during both the treatment period and the follow-up study period.","meaning":"Boolean indicating whether the patient has agreed to use an effective method of birth control during both the treatment period and the follow-up study period."} ;; "agreed to use an effective method of birth control during the treatment and follow-up study periods"
(declare-const patient_has_agreed_to_use_effective_birth_control_method_during_treatment_and_followup_periods@@method_approved_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the effective method of birth control agreed to by the patient is a method approved by the investigator.","when_to_set_to_false":"Set to false if the effective method of birth control agreed to by the patient is not a method approved by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the effective method of birth control agreed to by the patient is a method approved by the investigator.","meaning":"Boolean indicating whether the effective method of birth control agreed to by the patient is a method approved by the investigator."} ;; "method approved by the investigator"
(declare-const patient_has_agreed_to_total_abstinence_from_sexual_intercourse_during_treatment_and_followup_periods Bool) ;; {"when_to_set_to_true":"Set to true if the patient has agreed to total abstinence from sexual intercourse during both the treatment period and the follow-up study period.","when_to_set_to_false":"Set to false if the patient has not agreed to total abstinence from sexual intercourse during both the treatment period and the follow-up study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has agreed to total abstinence from sexual intercourse during both the treatment period and the follow-up study period.","meaning":"Boolean indicating whether the patient has agreed to total abstinence from sexual intercourse during both the treatment period and the follow-up study period."} ;; "total abstinence from sexual intercourse during the treatment and follow-up study periods"
(declare-const patient_has_agreed_to_total_abstinence_from_sexual_intercourse_during_treatment_and_followup_periods@@abstinence_is_total Bool) ;; {"when_to_set_to_true":"Set to true if the abstinence agreed to by the patient is total abstinence from sexual intercourse.","when_to_set_to_false":"Set to false if the abstinence agreed to by the patient is not total abstinence from sexual intercourse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abstinence agreed to by the patient is total abstinence from sexual intercourse.","meaning":"Boolean indicating whether the abstinence agreed to by the patient is total abstinence from sexual intercourse."} ;; "abstinence is total"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Exhaustive subcategories for effective birth control method: method approved by investigator OR total abstinence
(assert
  (! (= patient_has_agreed_to_use_effective_birth_control_method_during_treatment_and_followup_periods
        (or patient_has_agreed_to_use_effective_birth_control_method_during_treatment_and_followup_periods@@method_approved_by_investigator
            patient_has_agreed_to_total_abstinence_from_sexual_intercourse_during_treatment_and_followup_periods))
     :named REQ1_AUXILIARY0)) ;; "with exhaustive subcategories (a method approved by the investigator OR total abstinence from sexual intercourse)"

;; Qualifier variable implies corresponding stem variable for abstinence
(assert
  (! (=> patient_has_agreed_to_total_abstinence_from_sexual_intercourse_during_treatment_and_followup_periods@@abstinence_is_total
         patient_has_agreed_to_total_abstinence_from_sexual_intercourse_during_treatment_and_followup_periods)
     :named REQ1_AUXILIARY1)) ;; "abstinence is total"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: If patient is of childbearing potential, must have agreed to use an effective method of birth control (exhaustive: method approved by investigator OR total abstinence) during treatment period
(assert
  (! (or (not patient_has_childbearing_potential_now)
         (or patient_has_agreed_to_use_effective_birth_control_method_during_treatment_and_followup_periods@@method_approved_by_investigator
             patient_has_agreed_to_total_abstinence_from_sexual_intercourse_during_treatment_and_followup_periods))
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if (the patient is of childbearing potential), must have agreed to use an effective method of birth control during the treatment period"

;; Component 1: If patient is of childbearing potential, must have agreed to use an effective method of birth control (exhaustive: method approved by investigator OR total abstinence) during follow-up study period
;; Since the variable is defined for both periods, the same assertion applies for follow-up
(assert
  (! (or (not patient_has_childbearing_potential_now)
         (or patient_has_agreed_to_use_effective_birth_control_method_during_treatment_and_followup_periods@@method_approved_by_investigator
             patient_has_agreed_to_total_abstinence_from_sexual_intercourse_during_treatment_and_followup_periods))
     :named REQ1_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if (the patient is of childbearing potential), must have agreed to use an effective method of birth control during the follow-up study period"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_pregnancy_test_result_recorded_in_72_hours_before_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a pregnancy test result recorded within the 72 hours before randomization.","when_to_set_to_false":"Set to false if the patient does not have a pregnancy test result recorded within the 72 hours before randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a pregnancy test result recorded within the 72 hours before randomization.","meaning":"Boolean indicating whether the patient has a pregnancy test result recorded within the 72 hours before randomization."} ;; "negative pregnancy test within the 72 hours before randomization"
(declare-const patient_has_pregnancy_test_result_recorded_in_72_hours_before_randomization@@result_is_negative Bool) ;; {"when_to_set_to_true":"Set to true if the pregnancy test result recorded within the 72 hours before randomization is negative.","when_to_set_to_false":"Set to false if the pregnancy test result recorded within the 72 hours before randomization is not negative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pregnancy test result recorded within the 72 hours before randomization is negative.","meaning":"Boolean indicating whether the pregnancy test result recorded within the 72 hours before randomization is negative."} ;; "negative pregnancy test within the 72 hours before randomization"
(declare-const patient_is_pregnant_inthepast72hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient was pregnant at any time during the 72 hours before randomization.","when_to_set_to_false":"Set to false if the patient was not pregnant at any time during the 72 hours before randomization.","when_to_set_to_null":"Set to null if the patient's pregnancy status during the 72 hours before randomization is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient was pregnant at any time during the 72 hours before randomization."} ;; "negative pregnancy test within the 72 hours before randomization"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_pregnancy_test_result_recorded_in_72_hours_before_randomization@@result_is_negative
         patient_has_pregnancy_test_result_recorded_in_72_hours_before_randomization)
     :named REQ2_AUXILIARY0)) ;; "negative pregnancy test within the 72 hours before randomization"

;; ===================== Constraint Assertions (REQ 2) =====================
;; If the patient is a female of childbearing potential, she must have had a negative pregnancy test within the 72 hours before randomization
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         (and patient_has_pregnancy_test_result_recorded_in_72_hours_before_randomization@@result_is_negative))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if (the patient is a female of childbearing potential), the patient must have had a negative pregnancy test within the 72 hours before randomization."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_required_to_take_pregnancy_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently required to take a pregnancy test.","when_to_set_to_false":"Set to false if the patient is currently not required to take a pregnancy test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently required to take a pregnancy test.","meaning":"Boolean indicating whether the patient is currently required to take a pregnancy test."} ;; "the patient is NOT required to take the pregnancy test"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; If the patient is a female of childbearing potential AND the patient abstained totally from sexual intercourse, then the patient is NOT required to take the pregnancy test.
(assert
  (! (=> (and patient_sex_is_female_now
              patient_has_childbearing_potential_now
              patient_has_agreed_to_total_abstinence_from_sexual_intercourse_during_treatment_and_followup_periods@@abstinence_is_total)
         (not patient_is_required_to_take_pregnancy_test_now))
     :named REQ3_AUXILIARY0)) ;; "if (the patient is a female of childbearing potential AND the patient abstained totally from sexual intercourse), the patient is NOT required to take the pregnancy test."

;; ===================== Constraint Assertions (REQ 3) =====================
;; No direct constraint on eligibility; this requirement only modifies the need for pregnancy testing.
;; (No constraint assertion needed for NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patients_recent_countries_visited_is_positive_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a positive history of recent countries visited (i.e., has traveled recently) at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a positive history of recent countries visited at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a positive history of recent countries visited.","meaning":"Boolean indicating whether the patient has a positive history of recent countries visited (recent travel) at any time in the past."} ;; "recent travel"
(declare-const patients_recent_countries_visited_is_positive_inthehistory@@temporalcontext_within30days_of_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient's recent travel occurred within 30 days of randomization.","when_to_set_to_false":"Set to false if the patient's recent travel did not occur within 30 days of randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's recent travel occurred within 30 days of randomization.","meaning":"Boolean indicating whether the patient's recent travel occurred within 30 days of randomization."} ;; "recent travel (within 30 days of randomization)"
(declare-const patients_recent_countries_visited_is_positive_inthehistory@@from_industrialized_country Bool) ;; {"when_to_set_to_true":"Set to true if the patient's recent travel was from an industrialized country.","when_to_set_to_false":"Set to false if the patient's recent travel was not from an industrialized country.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's recent travel was from an industrialized country.","meaning":"Boolean indicating whether the patient's recent travel was from an industrialized country."} ;; "recent travel from an industrialized country"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patients_recent_countries_visited_is_positive_inthehistory@@temporalcontext_within30days_of_randomization
         patients_recent_countries_visited_is_positive_inthehistory)
     :named REQ4_AUXILIARY0)) ;; "recent travel (within 30 days of randomization)"

(assert
  (! (=> patients_recent_countries_visited_is_positive_inthehistory@@from_industrialized_country
         patients_recent_countries_visited_is_positive_inthehistory)
     :named REQ4_AUXILIARY1)) ;; "recent travel from an industrialized country"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: To be included, the patient must have had recent travel (within 30 days of randomization) from an industrialized country.
(assert
  (! (and patients_recent_countries_visited_is_positive_inthehistory@@temporalcontext_within30days_of_randomization
          patients_recent_countries_visited_is_positive_inthehistory@@from_industrialized_country)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "recent travel (within 30 days of randomization) from an industrialized country"

;; ===================== Declarations for the inclusion criteria (REQ 5) =====================
(declare-const bacterial_cause_of_diarrhea_confirmed_by_microbiology_analysis_of_stool_sample Bool) ;; {"when_to_set_to_true":"Set to true if the bacterial cause of diarrhea is confirmed by microbiology analysis of the stool sample.","when_to_set_to_false":"Set to false if the bacterial cause of diarrhea is not confirmed by microbiology analysis of the stool sample.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the bacterial cause of diarrhea is confirmed by microbiology analysis of the stool sample.","meaning":"Boolean indicating whether the bacterial cause of diarrhea is confirmed by microbiology analysis of the stool sample."} ;; "the bacterial cause of diarrhea is confirmed by microbiology analysis of the stool sample"
(declare-const duration_of_diarrhea_symptoms_before_randomization_value_recorded_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours the patient has experienced diarrhea symptoms before randomization.","when_to_set_to_null":"Set to null if the duration of diarrhea symptoms before randomization is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration of diarrhea symptoms before randomization, in hours."} ;; "the duration of illness is ≤ 72 hours before randomization"
(declare-const number_of_soft_stools_in_past_24_hours_value_recorded_in_count Int) ;; {"when_to_set_to_value":"Set to the number of soft stools the patient has passed in the 24 hours preceding randomization.","when_to_set_to_null":"Set to null if the number of soft stools in the past 24 hours is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of soft stools in the past 24 hours, in count units."} ;; "at least three soft stools within the 24 hours preceding randomization"
(declare-const number_of_unformed_stools_in_past_24_hours_value_recorded_in_count Int) ;; {"when_to_set_to_value":"Set to the number of unformed stools the patient has passed in the 24 hours preceding randomization.","when_to_set_to_null":"Set to null if the number of unformed stools in the past 24 hours is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of unformed stools in the past 24 hours, in count units."} ;; "at least three unformed stools within the 24 hours preceding randomization"
(declare-const number_of_watery_stools_in_past_24_hours_value_recorded_in_count Int) ;; {"when_to_set_to_value":"Set to the number of watery stools the patient has passed in the 24 hours preceding randomization.","when_to_set_to_null":"Set to null if the number of watery stools in the past 24 hours is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of watery stools in the past 24 hours, in count units."} ;; "at least three watery stools within the 24 hours preceding randomization"
(declare-const patient_able_to_provide_unformed_stool_sample_at_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to provide an unformed stool sample during Screening.","when_to_set_to_false":"Set to false if the patient is not able to provide an unformed stool sample during Screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to provide an unformed stool sample during Screening.","meaning":"Boolean indicating whether the patient is able to provide an unformed stool sample during Screening."} ;; "be able to provide an unformed stool sample during Screening"
(declare-const patient_has_finding_of_diarrhea_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had diarrhea within the past 24 hours.","when_to_set_to_false":"Set to false if the patient has not had diarrhea within the past 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had diarrhea within the past 24 hours.","meaning":"Boolean indicating whether the patient has had diarrhea within the past 24 hours."} ;; "be experiencing signs or symptoms indicative of acute bacterial diarrhea (traveler's diarrhea)"
(declare-const patient_has_finding_of_diarrhea_inthepast24hours@@acute Bool) ;; {"when_to_set_to_true":"Set to true if the diarrhea within the past 24 hours is acute.","when_to_set_to_false":"Set to false if the diarrhea within the past 24 hours is not acute.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diarrhea within the past 24 hours is acute.","meaning":"Boolean indicating whether the diarrhea within the past 24 hours is acute."} ;; "acute"
(declare-const patient_has_finding_of_diarrhea_inthepast24hours@@bacterial_in_origin Bool) ;; {"when_to_set_to_true":"Set to true if the diarrhea within the past 24 hours is bacterial in origin.","when_to_set_to_false":"Set to false if the diarrhea within the past 24 hours is not bacterial in origin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diarrhea within the past 24 hours is bacterial in origin.","meaning":"Boolean indicating whether the diarrhea within the past 24 hours is bacterial in origin."} ;; "bacterial in origin"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definition: Signs or symptoms indicative of acute bacterial diarrhea (traveler's diarrhea) is defined as at least three unformed stools OR at least three watery stools OR at least three soft stools within the 24 hours preceding randomization.
(assert
  (! (= patient_has_finding_of_diarrhea_inthepast24hours
        (or (>= number_of_unformed_stools_in_past_24_hours_value_recorded_in_count 3)
            (>= number_of_watery_stools_in_past_24_hours_value_recorded_in_count 3)
            (>= number_of_soft_stools_in_past_24_hours_value_recorded_in_count 3)))
     :named REQ5_AUXILIARY0)) ;; "signs or symptoms indicative of acute bacterial diarrhea (traveler's diarrhea), defined as (at least three unformed stools OR at least three watery stools OR at least three soft stools) within the 24 hours preceding randomization"

;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_diarrhea_inthepast24hours@@acute
         patient_has_finding_of_diarrhea_inthepast24hours)
     :named REQ5_AUXILIARY1)) ;; "acute"

(assert
  (! (=> patient_has_finding_of_diarrhea_inthepast24hours@@bacterial_in_origin
         patient_has_finding_of_diarrhea_inthepast24hours)
     :named REQ5_AUXILIARY2)) ;; "bacterial in origin"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: experiencing signs or symptoms indicative of acute bacterial diarrhea (traveler's diarrhea), as defined
(assert
  (! (and patient_has_finding_of_diarrhea_inthepast24hours
          patient_has_finding_of_diarrhea_inthepast24hours@@acute
          patient_has_finding_of_diarrhea_inthepast24hours@@bacterial_in_origin)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "be experiencing signs or symptoms indicative of acute bacterial diarrhea (traveler's diarrhea), defined as ..."

;; Component 1: duration of illness ≤ 72 hours before randomization
(assert
  (! (<= duration_of_diarrhea_symptoms_before_randomization_value_recorded_in_hours 72)
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the duration of illness is ≤ 72 hours before randomization"

;; Component 2: able to provide an unformed stool sample during Screening
(assert
  (! patient_able_to_provide_unformed_stool_sample_at_screening
     :named REQ5_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "be able to provide an unformed stool sample during Screening"

;; Component 3: bacterial cause of diarrhea confirmed by microbiology analysis of the stool sample
(assert
  (! bacterial_cause_of_diarrhea_confirmed_by_microbiology_analysis_of_stool_sample
     :named REQ5_COMPONENT3_OTHER_REQUIREMENTS)) ;; "the bacterial cause of diarrhea is confirmed by microbiology analysis of the stool sample"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_finding_of_infectious_enteritis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of infectious enteritis (enteric infection).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of infectious enteritis (enteric infection).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of infectious enteritis (enteric infection).","meaning":"Boolean indicating whether the patient currently has infectious enteritis (enteric infection)."} ;; "enteric infection"
(declare-const patient_has_finding_of_gas_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of gas.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of gas.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of gas.","meaning":"Boolean indicating whether the patient currently has gas."} ;; "gas"
(declare-const patient_has_finding_of_gas_now@@moderate_to_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has gas and the severity is moderate to severe.","when_to_set_to_false":"Set to false if the patient currently has gas but the severity is not moderate to severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of gas is moderate to severe.","meaning":"Boolean indicating whether the patient currently has gas of moderate to severe severity."} ;; "moderate to severe gas"
(declare-const patient_has_finding_of_excessive_upper_gastrointestinal_gas_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of excessive upper gastrointestinal gas (flatulence).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of excessive upper gastrointestinal gas (flatulence).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of excessive upper gastrointestinal gas (flatulence).","meaning":"Boolean indicating whether the patient currently has excessive upper gastrointestinal gas (flatulence)."} ;; "flatulence"
(declare-const patient_has_finding_of_excessive_upper_gastrointestinal_gas_now@@moderate_to_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has excessive upper gastrointestinal gas (flatulence) and the severity is moderate to severe.","when_to_set_to_false":"Set to false if the patient currently has excessive upper gastrointestinal gas (flatulence) but the severity is not moderate to severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of excessive upper gastrointestinal gas (flatulence) is moderate to severe.","meaning":"Boolean indicating whether the patient currently has excessive upper gastrointestinal gas (flatulence) of moderate to severe severity."} ;; "moderate to severe flatulence"
(declare-const patient_has_finding_of_nausea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of nausea.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of nausea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of nausea.","meaning":"Boolean indicating whether the patient currently has nausea."} ;; "nausea"
(declare-const patient_has_finding_of_vomiting_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of vomiting.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of vomiting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of vomiting.","meaning":"Boolean indicating whether the patient currently has vomiting."} ;; "vomiting"
(declare-const patient_has_finding_of_abdominal_colic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of abdominal colic (abdominal cramps).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of abdominal colic (abdominal cramps).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of abdominal colic (abdominal cramps).","meaning":"Boolean indicating whether the patient currently has abdominal colic (abdominal cramps)."} ;; "abdominal cramps"
(declare-const patient_has_finding_of_abdominal_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of abdominal pain.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of abdominal pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of abdominal pain.","meaning":"Boolean indicating whether the patient currently has abdominal pain."} ;; "abdominal pain"
(declare-const patient_has_finding_of_tenesmus_anal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of anal tenesmus (rectal tenesmus).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of anal tenesmus (rectal tenesmus).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of anal tenesmus (rectal tenesmus).","meaning":"Boolean indicating whether the patient currently has anal tenesmus (rectal tenesmus)."} ;; "rectal tenesmus"
(declare-const patient_has_finding_of_urgent_desire_for_stool_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of urgent desire for stool (defecation urgency).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of urgent desire for stool (defecation urgency).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of urgent desire for stool (defecation urgency).","meaning":"Boolean indicating whether the patient currently has urgent desire for stool (defecation urgency)."} ;; "defecation urgency"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_gas_now@@moderate_to_severe
         patient_has_finding_of_gas_now)
     :named REQ6_AUXILIARY0)) ;; "moderate to severe gas" implies "gas"

(assert
  (! (=> patient_has_finding_of_excessive_upper_gastrointestinal_gas_now@@moderate_to_severe
         patient_has_finding_of_excessive_upper_gastrointestinal_gas_now)
     :named REQ6_AUXILIARY1)) ;; "moderate to severe flatulence" implies "flatulence"

;; Exhaustive subcategories define the umbrella exactly:
(assert
  (! (= patient_has_finding_of_infectious_enteritis_now
        (or patient_has_finding_of_gas_now@@moderate_to_severe
            patient_has_finding_of_excessive_upper_gastrointestinal_gas_now@@moderate_to_severe
            patient_has_finding_of_nausea_now
            patient_has_finding_of_vomiting_now
            patient_has_finding_of_abdominal_colic_now
            patient_has_finding_of_abdominal_pain_now
            patient_has_finding_of_tenesmus_anal_now
            patient_has_finding_of_urgent_desire_for_stool_now))
     :named REQ6_AUXILIARY2)) ;; "sign or symptom of enteric infection" ≡ exhaustive list

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (or patient_has_finding_of_gas_now@@moderate_to_severe
         patient_has_finding_of_excessive_upper_gastrointestinal_gas_now@@moderate_to_severe
         patient_has_finding_of_nausea_now
         patient_has_finding_of_vomiting_now
         patient_has_finding_of_abdominal_colic_now
         patient_has_finding_of_abdominal_pain_now
         patient_has_finding_of_tenesmus_anal_now
         patient_has_finding_of_urgent_desire_for_stool_now)
     :named REQ6_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "at least one sign or symptom of enteric infection (exhaustive list)"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_is_capable_of_giving_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently capable of giving informed consent.","when_to_set_to_false":"Set to false if the patient is currently not capable of giving informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently capable of giving informed consent.","meaning":"Boolean indicating whether the patient is currently capable of giving informed consent."} ;; "the patient must be capable of giving informed consent"
(declare-const patient_is_willing_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently willing to give informed consent.","when_to_set_to_false":"Set to false if the patient is currently not willing to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently willing to give informed consent.","meaning":"Boolean indicating whether the patient is currently willing to give informed consent."} ;; "the patient must be willing to give informed consent"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: The patient must be capable of giving informed consent.
(assert
  (! patient_is_capable_of_giving_informed_consent_now
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be capable of giving informed consent"

;; Component 1: The patient must be willing to give informed consent.
(assert
  (! patient_is_willing_to_give_informed_consent_now
     :named REQ7_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be willing to give informed consent"
