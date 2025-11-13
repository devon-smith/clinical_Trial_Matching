;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age > 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 18.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (age > 18 years)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_been_admitted_to_intensive_coronary_care_unit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently admitted to the intensive coronary care unit.","when_to_set_to_false":"Set to false if the patient is not currently admitted to the intensive coronary care unit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently admitted to the intensive coronary care unit.","meaning":"Boolean indicating whether the patient is currently admitted to the intensive coronary care unit."} // "admitted to the intensive coronary care unit"
(declare-const patient_has_diagnosis_of_acute_coronary_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute coronary syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute coronary syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute coronary syndrome."} // "acute coronary syndrome"
(declare-const patient_has_diagnosis_of_acute_coronary_syndrome_now@@non_st_elevation_type Bool) ;; {"when_to_set_to_true":"Set to true if the patient's acute coronary syndrome diagnosis is of the non-ST elevation type.","when_to_set_to_false":"Set to false if the patient's acute coronary syndrome diagnosis is not of the non-ST elevation type.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the acute coronary syndrome diagnosis is of the non-ST elevation type.","meaning":"Boolean indicating whether the patient's acute coronary syndrome diagnosis is of the non-ST elevation type."} // "non-ST elevation acute coronary syndrome"
(declare-const patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of ST elevation myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of ST elevation myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of ST elevation myocardial infarction.","meaning":"Boolean indicating whether the patient currently has a diagnosis of ST elevation myocardial infarction."} // "ST elevation myocardial infarction"
(declare-const patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_now@@temporalcontext_at_least_24_hours_prior_to_admission_to_intensive_coronary_care_unit Bool) ;; {"when_to_set_to_true":"Set to true if the patient's ST elevation myocardial infarction occurred at least 24 hours prior to admission to the intensive coronary care unit.","when_to_set_to_false":"Set to false if the patient's ST elevation myocardial infarction did not occur at least 24 hours prior to admission to the intensive coronary care unit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ST elevation myocardial infarction occurred at least 24 hours prior to admission to the intensive coronary care unit.","meaning":"Boolean indicating whether the patient's ST elevation myocardial infarction occurred at least 24 hours prior to admission to the intensive coronary care unit."} // "≥ 24 hours after ST elevation myocardial infarction"
(declare-const time_elapsed_from_st_elevation_myocardial_infarction_to_intensive_coronary_care_unit_admission_value_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours elapsed from the occurrence of ST elevation myocardial infarction to admission to the intensive coronary care unit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many hours elapsed from the occurrence of ST elevation myocardial infarction to admission to the intensive coronary care unit.","meaning":"Numeric value indicating the time in hours from the occurrence of ST elevation myocardial infarction to admission to the intensive coronary care unit."} // "≥ 24 hours after ST elevation myocardial infarction"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable for non-ST elevation ACS
(assert
  (! (=> patient_has_diagnosis_of_acute_coronary_syndrome_now@@non_st_elevation_type
         patient_has_diagnosis_of_acute_coronary_syndrome_now)
     :named REQ1_AUXILIARY0)) ;; "non-ST elevation acute coronary syndrome"

;; Qualifier variable implies corresponding stem variable for STEMI
(assert
  (! (=> patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_now@@temporalcontext_at_least_24_hours_prior_to_admission_to_intensive_coronary_care_unit
         patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_now)
     :named REQ1_AUXILIARY1)) ;; "ST elevation myocardial infarction ≥ 24 hours prior to admission"

;; Definition of the temporal qualifier for STEMI (≥ 24 hours)
(assert
  (! (= patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_now@@temporalcontext_at_least_24_hours_prior_to_admission_to_intensive_coronary_care_unit
        (and patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_now
             (>= time_elapsed_from_st_elevation_myocardial_infarction_to_intensive_coronary_care_unit_admission_value_in_hours 24.0)))
     :named REQ1_AUXILIARY2)) ;; "≥ 24 hours after ST elevation myocardial infarction"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must ((have been admitted to the intensive coronary care unit with non-ST elevation acute coronary syndrome) OR (have been admitted to the intensive coronary care unit ≥ 24 hours after ST elevation myocardial infarction)).
(assert
  (! (or
        (and patient_has_been_admitted_to_intensive_coronary_care_unit_now
             patient_has_diagnosis_of_acute_coronary_syndrome_now@@non_st_elevation_type)
        (and patient_has_been_admitted_to_intensive_coronary_care_unit_now
             patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_now@@temporalcontext_at_least_24_hours_prior_to_admission_to_intensive_coronary_care_unit))
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "admitted to the intensive coronary care unit with non-ST elevation acute coronary syndrome OR admitted to the intensive coronary care unit ≥ 24 hours after ST elevation myocardial infarction"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const ischemic_symptoms_duration_value_recorded_during_hospitalization_withunit_minutes Real) ;; {"when_to_set_to_value":"Set to the number of minutes the patient experienced ischemic symptoms during hospitalization.","when_to_set_to_null":"Set to null if the duration in minutes of ischemic symptoms during hospitalization is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the duration in minutes of ischemic symptoms experienced by the patient during hospitalization."} // "ischemic symptoms lasting ≥ 5 minutes during hospitalization"
(declare-const patient_has_finding_of_ischemic_symptoms_during_hospitalization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ischemic symptoms that occurred during hospitalization.","when_to_set_to_false":"Set to false if the patient does not have ischemic symptoms that occurred during hospitalization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ischemic symptoms that occurred during hospitalization.","meaning":"Boolean indicating whether the patient has ischemic symptoms that occurred during hospitalization."} // "presence of ischemic symptoms during hospitalization"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Numeric duration implies presence of ischemic symptoms during hospitalization
(assert
  (! (=> (>= ischemic_symptoms_duration_value_recorded_during_hospitalization_withunit_minutes 1)
         patient_has_finding_of_ischemic_symptoms_during_hospitalization)
     :named REQ2_AUXILIARY0)) ;; "ischemic symptoms lasting ≥ 5 minutes during hospitalization" (duration > 0 implies presence)

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Ischemic symptoms lasting ≥ 5 minutes during hospitalization
(assert
  (! (and patient_has_finding_of_ischemic_symptoms_during_hospitalization
          (>= ischemic_symptoms_duration_value_recorded_during_hospitalization_withunit_minutes 5))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "ischemic symptoms lasting ≥ 5 minutes during hospitalization"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_pain_assessment_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured pain score if a numeric pain assessment using the visual analog scale is recorded now.","when_to_set_to_null":"Set to null if no such pain score is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's current pain assessment score on the visual analog scale."} // "pain assessment = 3 out of 10 on the visual analog scale"
(declare-const patient_pain_assessment_value_recorded_now_withunit_score@@performed_using_visual_analog_scale Bool) ;; {"when_to_set_to_true":"Set to true if the pain assessment was performed using the visual analog scale.","when_to_set_to_false":"Set to false if the pain assessment was not performed using the visual analog scale.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the pain assessment was performed using the visual analog scale.","meaning":"Boolean indicating whether the pain assessment was performed using the visual analog scale."} // "pain assessment = 3 out of 10 on the visual analog scale"
(declare-const patient_has_undergone_electrocardiographic_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone an electrocardiographic procedure now.","when_to_set_to_false":"Set to false if the patient has not undergone an electrocardiographic procedure now.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the patient has undergone an electrocardiographic procedure now.","meaning":"Boolean indicating whether the patient has undergone an electrocardiographic procedure now."} // "dynamic electrocardiogram findings"
(declare-const patient_has_undergone_electrocardiographic_procedure_now@@is_dynamic Bool) ;; {"when_to_set_to_true":"Set to true if the electrocardiographic procedure is dynamic.","when_to_set_to_false":"Set to false if the electrocardiographic procedure is not dynamic.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the procedure is dynamic.","meaning":"Boolean indicating whether the electrocardiographic procedure is dynamic."} // "dynamic electrocardiogram findings"
(declare-const patient_segment_deviation_value_recorded_now_withunit_millivolts Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric ST segment deviation in millivolts is recorded now.","when_to_set_to_null":"Set to null if no such measurement is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's current ST segment deviation in millivolts."} // "ST segment deviation ≥ 0.05 millivolts"
(declare-const patient_inverted_t_wave_value_recorded_now_withunit_millivolts Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric T wave inversion magnitude in millivolts is recorded now.","when_to_set_to_null":"Set to null if no such measurement is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's current T wave inversion magnitude in millivolts."} // "T wave inversion ≥ 0.3 millivolts"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_pain_assessment_value_recorded_now_withunit_score@@performed_using_visual_analog_scale
         true)
     :named REQ3_AUXILIARY0)) ;; "pain assessment performed using visual analog scale"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_electrocardiographic_procedure_now@@is_dynamic
         patient_has_undergone_electrocardiographic_procedure_now)
     :named REQ3_AUXILIARY1)) ;; "dynamic electrocardiogram findings"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (or
        (and (= patient_pain_assessment_value_recorded_now_withunit_score 3)
             patient_pain_assessment_value_recorded_now_withunit_score@@performed_using_visual_analog_scale)
        (and patient_has_undergone_electrocardiographic_procedure_now@@is_dynamic
             (>= patient_segment_deviation_value_recorded_now_withunit_millivolts 0.05))
        (and patient_has_undergone_electrocardiographic_procedure_now@@is_dynamic
             (>= patient_inverted_t_wave_value_recorded_now_withunit_millivolts 0.3))
     )
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "pain assessment = 3 out of 10 on the visual analog scale OR dynamic electrocardiogram findings showing ST segment deviation ≥ 0.05 millivolts OR T wave inversion ≥ 0.3 millivolts"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_willing_to_provide_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to provide written informed consent.","when_to_set_to_false":"Set to false if the patient is not willing to provide written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to provide written informed consent.","meaning":"Boolean indicating whether the patient is willing to provide written informed consent."} // "be willing"
(declare-const patient_is_able_to_provide_written_informed_consent_according_to_regulations_of_ministry_of_health_and_instructions_of_helsinki_committee Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to provide written informed consent according to the regulations of the Ministry of Health and the instructions of the Helsinki committee.","when_to_set_to_false":"Set to false if the patient is not able to provide written informed consent according to the regulations of the Ministry of Health and the instructions of the Helsinki committee.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to provide written informed consent according to the regulations of the Ministry of Health and the instructions of the Helsinki committee.","meaning":"Boolean indicating whether the patient is able to provide written informed consent according to the regulations of the Ministry of Health and the instructions of the Helsinki committee."} // "be able to provide written informed consent according to the regulations of the Ministry of Health and the instructions of the Helsinki committee"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (and patient_is_willing_to_provide_written_informed_consent
          patient_is_able_to_provide_written_informed_consent_according_to_regulations_of_ministry_of_health_and_instructions_of_helsinki_committee)
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "be willing AND be able to provide written informed consent according to the regulations of the Ministry of Health AND the instructions of the Helsinki committee"
