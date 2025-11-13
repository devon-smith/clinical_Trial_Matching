;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} ;; "To be included, the patient must be (a man OR a woman)."
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} ;; "To be included, the patient must be (a man OR a woman)."
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged ≥ 19 years AND aged ≤ 65 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: (a man OR a woman)
(assert
  (! (or patient_sex_is_female_now patient_sex_is_male_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (a man OR a woman)."

;; Component 1: aged ≥ 19 years
(assert
  (! (>= patient_age_value_recorded_now_in_years 19)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 19 years."

;; Component 2: aged ≤ 65 years
(assert
  (! (<= patient_age_value_recorded_now_in_years 65)
     :named REQ0_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≤ 65 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_bipolar_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any type of bipolar disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of any type of bipolar disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of any type of bipolar disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of any type of bipolar disorder."} ;; "a diagnosis of any type of bipolar disorder"
(declare-const patient_has_diagnosis_of_bipolar_disorder_now@@diagnosed_by_structured_diagnostic_interview_mini_international_neuropsychiatric_interview Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of bipolar disorder is based on a structured diagnostic interview (Mini International Neuropsychiatric Interview).","when_to_set_to_false":"Set to false if the patient's diagnosis of bipolar disorder is not based on a structured diagnostic interview (Mini International Neuropsychiatric Interview).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of bipolar disorder is based on a structured diagnostic interview (Mini International Neuropsychiatric Interview).","meaning":"Boolean indicating whether the patient's diagnosis of bipolar disorder is based on a structured diagnostic interview (Mini International Neuropsychiatric Interview)."} ;; "diagnosis of any type of bipolar disorder based on structured diagnostic interview (Mini International Neuropsychiatric Interview)"
(declare-const patient_has_diagnosis_of_psychotic_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any type of psychotic disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of any type of psychotic disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of any type of psychotic disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of any type of psychotic disorder."} ;; "a diagnosis of any type of psychotic disorder"
(declare-const patient_has_diagnosis_of_psychotic_disorder_now@@diagnosed_by_structured_diagnostic_interview_mini_international_neuropsychiatric_interview Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of psychotic disorder is based on a structured diagnostic interview (Mini International Neuropsychiatric Interview).","when_to_set_to_false":"Set to false if the patient's diagnosis of psychotic disorder is not based on a structured diagnostic interview (Mini International Neuropsychiatric Interview).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of psychotic disorder is based on a structured diagnostic interview (Mini International Neuropsychiatric Interview).","meaning":"Boolean indicating whether the patient's diagnosis of psychotic disorder is based on a structured diagnostic interview (Mini International Neuropsychiatric Interview)."} ;; "diagnosis of any type of psychotic disorder based on structured diagnostic interview (Mini International Neuropsychiatric Interview)"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable for bipolar disorder implies the stem variable
(assert
  (! (=> patient_has_diagnosis_of_bipolar_disorder_now@@diagnosed_by_structured_diagnostic_interview_mini_international_neuropsychiatric_interview
         patient_has_diagnosis_of_bipolar_disorder_now)
     :named REQ1_AUXILIARY0)) ;; "diagnosis of any type of bipolar disorder based on structured diagnostic interview (Mini International Neuropsychiatric Interview)"

;; Qualifier variable for psychotic disorder implies the stem variable
(assert
  (! (=> patient_has_diagnosis_of_psychotic_disorder_now@@diagnosed_by_structured_diagnostic_interview_mini_international_neuropsychiatric_interview
         patient_has_diagnosis_of_psychotic_disorder_now)
     :named REQ1_AUXILIARY1)) ;; "diagnosis of any type of psychotic disorder based on structured diagnostic interview (Mini International Neuropsychiatric Interview)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must have (a diagnosis of any type of bipolar disorder based on structured diagnostic interview (Mini International Neuropsychiatric Interview) OR a diagnosis of any type of psychotic disorder based on structured diagnostic interview (Mini International Neuropsychiatric Interview)).
(assert
  (! (or patient_has_diagnosis_of_bipolar_disorder_now@@diagnosed_by_structured_diagnostic_interview_mini_international_neuropsychiatric_interview
         patient_has_diagnosis_of_psychotic_disorder_now@@diagnosed_by_structured_diagnostic_interview_mini_international_neuropsychiatric_interview)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "a diagnosis of any type of bipolar disorder based on structured diagnostic interview (Mini International Neuropsychiatric Interview) OR a diagnosis of any type of psychotic disorder based on structured diagnostic interview (Mini International Neuropsychiatric Interview)"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_currently_inpatient Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently an inpatient.","when_to_set_to_false":"Set to false if the patient is not currently an inpatient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an inpatient.","meaning":"Boolean indicating whether the patient is currently an inpatient."} ;; "currently be an inpatient"
(declare-const patient_is_currently_outpatient Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently an outpatient.","when_to_set_to_false":"Set to false if the patient is not currently an outpatient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an outpatient.","meaning":"Boolean indicating whether the patient is currently an outpatient."} ;; "currently be an outpatient"
(declare-const patient_is_exposed_to_anti_psychotic_agent_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken an antipsychotic agent (neuroleptic medication) at any time in the past 6 months.","when_to_set_to_false":"Set to false if the patient has not taken an antipsychotic agent (neuroleptic medication) at any time in the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken an antipsychotic agent (neuroleptic medication) in the past 6 months.","meaning":"Boolean indicating whether the patient has been exposed to an antipsychotic agent (neuroleptic medication) in the past 6 months."} ;; "have been taking a neuroleptic medication for the past 6 months"
(declare-const patient_is_exposed_to_anti_psychotic_agent_inthepast2months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken an antipsychotic agent (neuroleptic medication) at any time in the past 2 months.","when_to_set_to_false":"Set to false if the patient has not taken an antipsychotic agent (neuroleptic medication) at any time in the past 2 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken an antipsychotic agent (neuroleptic medication) in the past 2 months.","meaning":"Boolean indicating whether the patient has been exposed to an antipsychotic agent (neuroleptic medication) in the past 2 months."} ;; "have been on a stable dose of that neuroleptic medication for the past 2 months"
(declare-const patient_is_exposed_to_anti_psychotic_agent_inthepast2months@@stable_dose_entire_timeframe Bool) ;; {"when_to_set_to_true":"Set to true if the patient was on a stable dose of antipsychotic agent (neuroleptic medication) for the entire past 2 months.","when_to_set_to_false":"Set to false if the patient was not on a stable dose for the entire past 2 months, even if exposed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dose was stable for the entire past 2 months.","meaning":"Boolean indicating whether the patient was on a stable dose of antipsychotic agent (neuroleptic medication) for the entire past 2 months."} ;; "have been on a stable dose of that neuroleptic medication for the past 2 months"
(declare-const patient_is_exposed_to_mood_stabilizer_medication_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken a mood stabilizer medication at any time in the past 6 months.","when_to_set_to_false":"Set to false if the patient has not taken a mood stabilizer medication at any time in the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken a mood stabilizer medication in the past 6 months.","meaning":"Boolean indicating whether the patient has been exposed to a mood stabilizer medication in the past 6 months."} ;; "have been taking a mood stabilizer medication for the past 6 months"
(declare-const patient_is_exposed_to_mood_stabilizer_medication_inthepast2months@@stable_dose_entire_timeframe Bool) ;; {"when_to_set_to_true":"Set to true if the patient was on a stable dose of mood stabilizer medication for the entire past 2 months.","when_to_set_to_false":"Set to false if the patient was not on a stable dose for the entire past 2 months, even if exposed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dose was stable for the entire past 2 months.","meaning":"Boolean indicating whether the patient was on a stable dose of mood stabilizer medication for the entire past 2 months."} ;; "have been on a stable dose of that mood stabilizer medication for the past 2 months"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for antipsychotic agent stable dose implies exposure in the same timeframe
(assert
  (! (=> patient_is_exposed_to_anti_psychotic_agent_inthepast2months@@stable_dose_entire_timeframe
         patient_is_exposed_to_anti_psychotic_agent_inthepast2months)
     :named REQ2_AUXILIARY0)) ;; "have been on a stable dose of that neuroleptic medication for the past 2 months" implies "have been exposed to neuroleptic medication in the past 2 months"

;; Qualifier variable for mood stabilizer stable dose implies exposure in the same timeframe
(assert
  (! (=> patient_is_exposed_to_mood_stabilizer_medication_inthepast2months@@stable_dose_entire_timeframe
         patient_is_exposed_to_mood_stabilizer_medication_inthepast6months)
     :named REQ2_AUXILIARY1)) ;; "have been on a stable dose of that mood stabilizer medication for the past 2 months" implies "have been exposed to mood stabilizer medication in the past 6 months"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: (currently be an outpatient OR currently be an inpatient)
(assert
  (! (or patient_is_currently_outpatient
         patient_is_currently_inpatient)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "currently be an outpatient OR currently be an inpatient"

;; Component 1: ((neuroleptic 6mo AND stable dose 2mo) OR (mood stabilizer 6mo AND stable dose 2mo))
(assert
  (! (or (and patient_is_exposed_to_anti_psychotic_agent_inthepast6months
              patient_is_exposed_to_anti_psychotic_agent_inthepast2months@@stable_dose_entire_timeframe)
         (and patient_is_exposed_to_mood_stabilizer_medication_inthepast6months
              patient_is_exposed_to_mood_stabilizer_medication_inthepast2months@@stable_dose_entire_timeframe))
     :named REQ2_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have been taking a neuroleptic medication for the past 6 months AND have been on a stable dose of that neuroleptic medication for the past 2 months OR have been taking a mood stabilizer medication for the past 6 months AND have been on a stable dose of that mood stabilizer medication for the past 2 months"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the measured BMI value in kg/m^2 if a BMI measurement is recorded for the patient at the current time.","when_to_set_to_null":"Set to null if no BMI measurement is available for the patient at the current time or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kg/m^2."} ;; "To be included, the patient must have a body mass index > 25."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (> patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 25.0)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a body mass index > 25."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_psychoactive_substance_use_disorder_inthepast2months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of psychoactive substance use disorder within the past 2 months.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of psychoactive substance use disorder within the past 2 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of psychoactive substance use disorder within the past 2 months.","meaning":"Boolean indicating whether the patient has had a diagnosis of psychoactive substance use disorder within the past 2 months."} ;; "substance use disorder in the past 2 months"
(declare-const patient_has_diagnosis_of_psychoactive_substance_use_disorder_inthepast2months@@excludes_nicotine_and_caffeine_use_disorders Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of psychoactive substance use disorder within the past 2 months excludes nicotine use disorder and caffeine use disorder.","when_to_set_to_false":"Set to false if the diagnosis includes nicotine use disorder or caffeine use disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether nicotine or caffeine use disorders are excluded.","meaning":"Boolean indicating whether the diagnosis of psychoactive substance use disorder within the past 2 months excludes nicotine and caffeine use disorders."} ;; "except for (nicotine use disorder OR caffeine use disorder)"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_psychoactive_substance_use_disorder_inthepast2months@@excludes_nicotine_and_caffeine_use_disorders
        patient_has_diagnosis_of_psychoactive_substance_use_disorder_inthepast2months)
     :named REQ4_AUXILIARY0)) ;; "except for (nicotine use disorder OR caffeine use disorder)"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: To be included, the patient must NOT have had a substance use disorder in the past 2 months, except for (nicotine use disorder OR caffeine use disorder).
(assert
  (! (not patient_has_diagnosis_of_psychoactive_substance_use_disorder_inthepast2months@@excludes_nicotine_and_caffeine_use_disorders)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have had a substance use disorder in the past 2 months, except for (nicotine use disorder OR caffeine use disorder)."

;; ===================== Declarations for the inclusion criterion (REQ 5) =====================
(declare-const patient_agrees_to_not_become_pregnant_during_the_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has explicitly agreed to not become pregnant during the study period.","when_to_set_to_false":"Set to false if the patient has explicitly not agreed to not become pregnant during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has agreed to not become pregnant during the study period.","meaning":"Boolean value indicating whether the patient agrees to not become pregnant during the study."} ;; "the patient must agree to NOT become pregnant during the study"
(declare-const patient_agrees_to_use_adequate_method_of_birth_control_during_the_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has explicitly agreed to use an adequate method of birth control for the duration of the study.","when_to_set_to_false":"Set to false if the patient has explicitly not agreed to use an adequate method of birth control for the duration of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has agreed to use an adequate method of birth control during the study.","meaning":"Boolean value indicating whether the patient agrees to use an adequate method of birth control during the study."} ;; "the patient must agree to use an adequate method of birth control during the study"
(declare-const patient_has_finding_of_barrier_contraception_method_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a barrier contraception method.","when_to_set_to_false":"Set to false if the patient is currently not using a barrier contraception method.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a barrier contraception method.","meaning":"Boolean indicating whether the patient is currently using a barrier contraception method."} ;; "a barrier method"
(declare-const patient_has_finding_of_barrier_contraception_method_now@@used_during_the_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a barrier contraception method and it is intended to be used for the duration of the study.","when_to_set_to_false":"Set to false if the patient is currently using a barrier contraception method but it is not intended to be used for the duration of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the barrier contraception method is intended to be used for the duration of the study.","meaning":"Boolean indicating whether the barrier contraception method is intended to be used for the duration of the study."} ;; "a barrier method ... during the study"
(declare-const patient_has_finding_of_hormonal_contraceptive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a hormonal contraceptive.","when_to_set_to_false":"Set to false if the patient is currently not using a hormonal contraceptive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a hormonal contraceptive.","meaning":"Boolean indicating whether the patient is currently using a hormonal contraceptive."} ;; "a hormonal contraceptive"
(declare-const patient_has_finding_of_hormonal_contraceptive_now@@used_during_the_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a hormonal contraceptive and it is intended to be used for the duration of the study.","when_to_set_to_false":"Set to false if the patient is currently using a hormonal contraceptive but it is not intended to be used for the duration of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hormonal contraceptive is intended to be used for the duration of the study.","meaning":"Boolean indicating whether the hormonal contraceptive is intended to be used for the duration of the study."} ;; "a hormonal contraceptive ... during the study"
(declare-const patient_has_undergone_sterilization_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a surgical sterilization procedure as of now.","when_to_set_to_false":"Set to false if the patient has not undergone a surgical sterilization procedure as of now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a surgical sterilization procedure as of now.","meaning":"Boolean indicating whether the patient has undergone a surgical sterilization procedure as of now."} ;; "a surgical sterilization"
(declare-const patient_has_undergone_sterilization_procedure_now@@used_as_adequate_method_of_birth_control Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a surgical sterilization procedure and this is being used as an adequate method of birth control.","when_to_set_to_false":"Set to false if the patient has undergone a surgical sterilization procedure but it is not being used as an adequate method of birth control.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surgical sterilization is being used as an adequate method of birth control.","meaning":"Boolean indicating whether the surgical sterilization is being used as an adequate method of birth control."} ;; "a surgical sterilization ... as an adequate method of birth control"
(declare-const patient_has_undergone_sterilization_procedure_now@@used_during_the_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a surgical sterilization procedure and this status is relevant for the duration of the study.","when_to_set_to_false":"Set to false if the patient has undergone a surgical sterilization procedure but this status is not relevant for the duration of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surgical sterilization status is relevant for the duration of the study.","meaning":"Boolean indicating whether the surgical sterilization status is relevant for the duration of the study."} ;; "a surgical sterilization ... during the study"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered to have childbearing potential (i.e., is biologically capable of becoming pregnant).","when_to_set_to_false":"Set to false if the patient is currently not considered to have childbearing potential (e.g., postmenopausal, surgically sterilized, or otherwise incapable of becoming pregnant).","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} ;; "if the patient is a woman of childbearing potential"
(declare-const patient_has_undergone_pregnancy_detection_examination_now_outcome_is_negative Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a pregnancy detection examination (pregnancy test) as of now and the result is negative.","when_to_set_to_false":"Set to false if the patient has undergone a pregnancy detection examination (pregnancy test) as of now and the result is not negative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a pregnancy detection examination (pregnancy test) as of now with a negative result.","meaning":"Boolean indicating whether the patient has undergone a pregnancy detection examination (pregnancy test) as of now with a negative result."} ;; "the patient must have a negative pregnancy test"
(declare-const patient_has_undergone_pregnancy_detection_examination_now_outcome_is_negative@@performed_before_beginning_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a pregnancy detection examination (pregnancy test) as of now with a negative result, and the test was performed before beginning study medication.","when_to_set_to_false":"Set to false if the patient has undergone a pregnancy detection examination (pregnancy test) as of now with a negative result, but the test was not performed before beginning study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the negative pregnancy test was performed before beginning study medication.","meaning":"Boolean indicating whether the negative pregnancy test was performed before beginning study medication."} ;; "the patient must have a negative pregnancy test before beginning study medication"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as determined by a pregnancy test.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as determined by a pregnancy test.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient must have a negative pregnancy test before beginning study medication"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Non-exhaustive examples: using a barrier method, hormonal contraceptive, or surgical sterilization implies adequate method of birth control
(assert
  (! (=> (or patient_has_finding_of_barrier_contraception_method_now@@used_during_the_study
             patient_has_finding_of_hormonal_contraceptive_now@@used_during_the_study
             patient_has_undergone_sterilization_procedure_now@@used_as_adequate_method_of_birth_control
             patient_has_undergone_sterilization_procedure_now@@used_during_the_study)
         patient_agrees_to_use_adequate_method_of_birth_control_during_the_study)
     :named REQ5_AUXILIARY0)) ;; "agree to use an adequate method of birth control during the study (with non-exhaustive examples (a barrier method OR a hormonal contraceptive OR a surgical sterilization))"

;; Qualifier variables imply their stem variables
(assert
  (! (=> patient_has_finding_of_barrier_contraception_method_now@@used_during_the_study
         patient_has_finding_of_barrier_contraception_method_now)
     :named REQ5_AUXILIARY1)) ;; "barrier method ... during the study"

(assert
  (! (=> patient_has_finding_of_hormonal_contraceptive_now@@used_during_the_study
         patient_has_finding_of_hormonal_contraceptive_now)
     :named REQ5_AUXILIARY2)) ;; "hormonal contraceptive ... during the study"

(assert
  (! (=> patient_has_undergone_sterilization_procedure_now@@used_as_adequate_method_of_birth_control
         patient_has_undergone_sterilization_procedure_now)
     :named REQ5_AUXILIARY3)) ;; "surgical sterilization ... as an adequate method of birth control"

(assert
  (! (=> patient_has_undergone_sterilization_procedure_now@@used_during_the_study
         patient_has_undergone_sterilization_procedure_now)
     :named REQ5_AUXILIARY4)) ;; "surgical sterilization ... during the study"

;; Qualifier variable for pregnancy test implies stem variable
(assert
  (! (=> patient_has_undergone_pregnancy_detection_examination_now_outcome_is_negative@@performed_before_beginning_study_medication
         patient_has_undergone_pregnancy_detection_examination_now_outcome_is_negative)
     :named REQ5_AUXILIARY5)) ;; "pregnancy test ... before beginning study medication"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: If the patient is female, she must agree to NOT become pregnant during the study AND agree to use an adequate method of birth control during the study
(assert
  (! (or (not patient_sex_is_female_now)
         (and patient_agrees_to_not_become_pregnant_during_the_study
              patient_agrees_to_use_adequate_method_of_birth_control_during_the_study))
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is female, the patient must (agree to NOT become pregnant during the study AND agree to use an adequate method of birth control during the study ...)"

;; Component 1: If the patient is a woman of childbearing potential, she must have a negative pregnancy test before beginning study medication
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         patient_has_undergone_pregnancy_detection_examination_now_outcome_is_negative@@performed_before_beginning_study_medication)
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "if the patient is a woman of childbearing potential, the patient must have a negative pregnancy test before beginning study medication"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_can_undergo_capsule_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to swallow capsules.","when_to_set_to_false":"Set to false if the patient is currently unable to swallow capsules.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to swallow capsules.","meaning":"Boolean indicating whether the patient is currently able to swallow capsules."} ;; "To be included, the patient must be able to swallow the capsules whole."
(declare-const patient_can_undergo_capsule_now@@must_be_swallowed_whole Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to swallow capsules whole (not chewed, crushed, or opened).","when_to_set_to_false":"Set to false if the patient is unable to swallow capsules whole.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to swallow capsules whole.","meaning":"Boolean indicating whether the patient is able to swallow capsules whole."} ;; "To be included, the patient must be able to swallow the capsules whole."

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_can_undergo_capsule_now@@must_be_swallowed_whole
         patient_can_undergo_capsule_now)
     :named REQ6_AUXILIARY0)) ;; "To be included, the patient must be able to swallow the capsules whole."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_can_undergo_capsule_now@@must_be_swallowed_whole
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be able to swallow the capsules whole."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_is_able_to_follow_investigator_instructions_and_study_procedures_and_report_adverse_events Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to follow investigator instructions, follow study procedures, and report adverse events.","when_to_set_to_false":"Set to false if the patient is unable to follow investigator instructions, follow study procedures, or report adverse events.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to follow investigator instructions, follow study procedures, and report adverse events.","meaning":"Boolean indicating whether the patient is able to follow investigator instructions, follow study procedures, and report adverse events."} ;; "To be included, the patient must be able to (follow Investigator instructions AND follow study procedures AND report adverse events)."
(declare-const patient_is_willing_to_follow_investigator_instructions_and_study_procedures_and_report_adverse_events Bool) ;; {"when_to_set_to_true":"Set to true if the patient expresses willingness to follow investigator instructions, follow study procedures, and report adverse events.","when_to_set_to_false":"Set to false if the patient expresses unwillingness to follow investigator instructions, follow study procedures, or report adverse events.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to follow investigator instructions, follow study procedures, and report adverse events.","meaning":"Boolean indicating whether the patient is willing to follow investigator instructions, follow study procedures, and report adverse events."} ;; "To be included, the patient must be willing to (follow Investigator instructions AND follow study procedures AND report adverse events)."

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! patient_is_willing_to_follow_investigator_instructions_and_study_procedures_and_report_adverse_events
     :named REQ7_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be willing to (follow Investigator instructions AND follow study procedures AND report adverse events)."

(assert
  (! patient_is_able_to_follow_investigator_instructions_and_study_procedures_and_report_adverse_events
     :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be able to (follow Investigator instructions AND follow study procedures AND report adverse events)."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_has_finding_of_suicidal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suicidal.","when_to_set_to_false":"Set to false if the patient is currently not suicidal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suicidal.","meaning":"Boolean indicating whether the patient is currently suicidal."} ;; "the patient must NOT currently be actively suicidal"
(declare-const patient_has_finding_of_homicidal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently homicidal.","when_to_set_to_false":"Set to false if the patient is currently not homicidal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently homicidal.","meaning":"Boolean indicating whether the patient is currently homicidal."} ;; "the patient must NOT currently be actively homicidal"
(declare-const patient_has_finding_of_homicidal_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current homicidal behavior is active.","when_to_set_to_false":"Set to false if the patient's current homicidal behavior is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current homicidal behavior is active.","meaning":"Boolean indicating whether the patient's current homicidal behavior is active."} ;; "the patient must NOT currently be actively homicidal"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable 'active' implies stem variable for homicidal
(assert
  (! (=> patient_has_finding_of_homicidal_now@@active
         patient_has_finding_of_homicidal_now)
     :named REQ8_AUXILIARY0)) ;; "The qualifier 'active' specifies that the homicidal behavior is active at the present time."

;; ===================== Constraint Assertions (REQ 8) =====================
;; The patient must NOT currently be actively suicidal AND NOT currently be actively homicidal.
(assert
  (! (and (not patient_has_finding_of_suicidal_now)
          (not patient_has_finding_of_homicidal_now@@active))
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT currently be actively suicidal AND NOT currently be actively homicidal."

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_has_taken_topiramate_containing_product_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any topiramate-containing product within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not taken any topiramate-containing product within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any topiramate-containing product within the past 6 months.","meaning":"Boolean indicating whether the patient has taken any topiramate-containing product within the past 6 months."} ;; "To be included, the patient must NOT have used topiramate within the last 6 months."

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (not patient_has_taken_topiramate_containing_product_inthepast6months)
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have used topiramate within the last 6 months."

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_has_finding_of_medical_contraindication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any medical contraindication.","when_to_set_to_false":"Set to false if the patient currently does not have any medical contraindication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any medical contraindication.","meaning":"Boolean indicating whether the patient currently has any medical contraindication."} ;; "To be included, the patient must have no medical contraindication to the use of zonisamide."
(declare-const patient_has_finding_of_medical_contraindication_now@@to_the_use_of_zonisamide Bool) ;; {"when_to_set_to_true":"Set to true if the patient's medical contraindication is specifically to the use of zonisamide.","when_to_set_to_false":"Set to false if the patient's medical contraindication is not specifically to the use of zonisamide.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's medical contraindication is specifically to the use of zonisamide.","meaning":"Boolean indicating whether the patient's medical contraindication is specifically to the use of zonisamide."} ;; "To be included, the patient must have no medical contraindication to the use of zonisamide."
(declare-const patient_is_exposed_to_zonisamide_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to zonisamide.","when_to_set_to_false":"Set to false if the patient is currently not exposed to zonisamide.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to zonisamide.","meaning":"Boolean indicating whether the patient is currently exposed to zonisamide."} ;; "To be included, the patient must have no medical contraindication to the use of zonisamide."

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_medical_contraindication_now@@to_the_use_of_zonisamide
         patient_has_finding_of_medical_contraindication_now)
     :named REQ10_AUXILIARY0)) ;; "To be included, the patient must have no medical contraindication to the use of zonisamide."

;; ===================== Constraint Assertions (REQ 10) =====================
;; Component 0: Patient must NOT have any medical contraindication to the use of zonisamide
(assert
  (! (not patient_has_finding_of_medical_contraindication_now@@to_the_use_of_zonisamide)
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have no medical contraindication to the use of zonisamide."

;; ===================== Declarations for the criterion (REQ 11) =====================
(declare-const patient_is_exposed_to_anti_psychotic_agent_inthepast6months@@conventional Bool) ;; {"when_to_set_to_true":"Set to true if the anti-psychotic agent exposure in the past 6 months is specifically to a conventional neuroleptic agent.","when_to_set_to_false":"Set to false if the anti-psychotic agent exposure in the past 6 months is not to a conventional neuroleptic agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the anti-psychotic agent exposure in the past 6 months is to a conventional neuroleptic agent.","meaning":"Boolean indicating whether the anti-psychotic agent exposure in the past 6 months is specifically to a conventional neuroleptic agent."} ;; "any conventional neuroleptic medication"
(declare-const patient_is_exposed_to_anti_psychotic_agent_inthepast6months@@atypical Bool) ;; {"when_to_set_to_true":"Set to true if the anti-psychotic agent exposure in the past 6 months is specifically to an atypical neuroleptic agent.","when_to_set_to_false":"Set to false if the anti-psychotic agent exposure in the past 6 months is not to an atypical neuroleptic agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the anti-psychotic agent exposure in the past 6 months is to an atypical neuroleptic agent.","meaning":"Boolean indicating whether the anti-psychotic agent exposure in the past 6 months is specifically to an atypical neuroleptic agent."} ;; "any atypical neuroleptic medication"
(declare-const patient_is_exposed_to_anti_psychotic_agent_inthepast6months@@except_aripiprazole_or_ziprasidone Bool) ;; {"when_to_set_to_true":"Set to true if the anti-psychotic agent exposure in the past 6 months is to an atypical neuroleptic agent other than aripiprazole or ziprasidone.","when_to_set_to_false":"Set to false if the anti-psychotic agent exposure in the past 6 months is to aripiprazole or ziprasidone, or to a non-atypical agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the anti-psychotic agent exposure in the past 6 months is to an atypical neuroleptic agent other than aripiprazole or ziprasidone.","meaning":"Boolean indicating whether the anti-psychotic agent exposure in the past 6 months is to an atypical neuroleptic agent other than aripiprazole or ziprasidone."} ;; "any atypical neuroleptic medication except aripiprazole or ziprasidone"
(declare-const patient_is_exposed_to_valproate_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any form of valproate in the past 6 months.","when_to_set_to_false":"Set to false if the patient has not been exposed to any form of valproate in the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any form of valproate in the past 6 months.","meaning":"Boolean indicating whether the patient has been exposed to any form of valproate in the past 6 months."} ;; "any form of valproate"
(declare-const patient_is_exposed_to_lithium_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any form of lithium in the past 6 months.","when_to_set_to_false":"Set to false if the patient has not been exposed to any form of lithium in the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any form of lithium in the past 6 months.","meaning":"Boolean indicating whether the patient has been exposed to any form of lithium in the past 6 months."} ;; "any form of lithium"
(declare-const patient_is_exposed_to_carbamazepine_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any form of carbamazepine in the past 6 months.","when_to_set_to_false":"Set to false if the patient has not been exposed to any form of carbamazepine in the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any form of carbamazepine in the past 6 months.","meaning":"Boolean indicating whether the patient has been exposed to any form of carbamazepine in the past 6 months."} ;; "any form of carbamazepine"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; "any atypical neuroleptic medication except aripiprazole or ziprasidone" is a subset of "any atypical neuroleptic medication"
(assert
  (! (=> patient_is_exposed_to_anti_psychotic_agent_inthepast6months@@except_aripiprazole_or_ziprasidone
         patient_is_exposed_to_anti_psychotic_agent_inthepast6months@@atypical)
     :named REQ11_AUXILIARY0)) ;; "any atypical neuroleptic medication except aripiprazole or ziprasidone" implies "any atypical neuroleptic medication"

;; ===================== Constraint Assertions (REQ 11) =====================
;; To be included, the patient must be taking at least one of the following medications:
;; - any conventional neuroleptic medication
;; - any atypical neuroleptic medication except aripiprazole or ziprasidone
;; - any form of valproate
;; - any form of lithium
;; - any form of carbamazepine
(assert
  (! (or patient_is_exposed_to_anti_psychotic_agent_inthepast6months@@conventional
         patient_is_exposed_to_anti_psychotic_agent_inthepast6months@@except_aripiprazole_or_ziprasidone
         patient_is_exposed_to_valproate_inthepast6months
         patient_is_exposed_to_lithium_inthepast6months
         patient_is_exposed_to_carbamazepine_inthepast6months)
     :named REQ11_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be taking at least one of the following medications to meet inclusion criterion number 3: any conventional neuroleptic medication, any atypical neuroleptic medication except aripiprazole or ziprasidone, any form of valproate, any form of lithium, or any form of carbamazepine."
