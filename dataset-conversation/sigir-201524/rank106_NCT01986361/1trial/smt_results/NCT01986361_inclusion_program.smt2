;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_pharyngitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of pharyngitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of pharyngitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of pharyngitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of pharyngitis."}  ;; "To be included, the patient must have a primary diagnosis of pharyngitis confirmed by (a tonsillo-pharyngitis assessment score ≥ 5)."
(declare-const patient_has_diagnosis_of_pharyngitis_now@@primary_diagnosis Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of pharyngitis is the primary diagnosis for the patient.","when_to_set_to_false":"Set to false if the diagnosis of pharyngitis is not the primary diagnosis for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of pharyngitis is the primary diagnosis.","meaning":"Boolean indicating whether the diagnosis of pharyngitis is the primary diagnosis."}  ;; "To be included, the patient must have a primary diagnosis of pharyngitis confirmed by (a tonsillo-pharyngitis assessment score ≥ 5)."
(declare-const tonsillo_pharyngitis_assessment_score_value_recorded_now_withunit_points Real) ;; {"when_to_set_to_value":"Set to the value of the tonsillo-pharyngitis assessment score recorded for the patient at the current time, in points.","when_to_set_to_null":"Set to null if the tonsillo-pharyngitis assessment score is unknown, not documented, or cannot be determined for the patient at the current time.","meaning":"Numeric variable indicating the tonsillo-pharyngitis assessment score for the patient, recorded at the current time, in units of points."}  ;; "To be included, the patient must have a primary diagnosis of pharyngitis confirmed by (a tonsillo-pharyngitis assessment score ≥ 5)."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_diagnosis_of_pharyngitis_now@@primary_diagnosis
         patient_has_diagnosis_of_pharyngitis_now)
     :named REQ0_AUXILIARY0)) ;; "To be included, the patient must have a primary diagnosis of pharyngitis confirmed by (a tonsillo-pharyngitis assessment score ≥ 5)."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (and patient_has_diagnosis_of_pharyngitis_now@@primary_diagnosis
          (>= tonsillo_pharyngitis_assessment_score_value_recorded_now_withunit_points 5))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a primary diagnosis of pharyngitis confirmed by (a tonsillo-pharyngitis assessment score ≥ 5)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_symptoms_of_sore_throat_symptom_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of sore throat.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of sore throat.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of sore throat.","meaning":"Boolean indicating whether the patient currently has symptoms of sore throat."}  ;; "To be included, the patient must have a complaint of sore throat with (an onset ≤ 4 days prior to randomization)."
(declare-const patient_has_symptoms_of_sore_throat_symptom_now@@temporalcontext_within_4_days_prior_to_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the onset of the patient's sore throat symptoms occurred within 4 days prior to randomization.","when_to_set_to_false":"Set to false if the onset of the patient's sore throat symptoms occurred more than 4 days prior to randomization.","when_to_set_to_null":"Set to null if the onset timing of the patient's sore throat symptoms relative to randomization is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the onset of the patient's sore throat symptoms occurred within 4 days prior to randomization."}  ;; "To be included, the patient must have a complaint of sore throat with (an onset ≤ 4 days prior to randomization)."

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_symptoms_of_sore_throat_symptom_now@@temporalcontext_within_4_days_prior_to_randomization
         patient_has_symptoms_of_sore_throat_symptom_now)
     :named REQ1_AUXILIARY0)) ;; "To be included, the patient must have a complaint of sore throat with (an onset ≤ 4 days prior to randomization)."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_symptoms_of_sore_throat_symptom_now@@temporalcontext_within_4_days_prior_to_randomization
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a complaint of sore throat with (an onset ≤ 4 days prior to randomization)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_symptoms_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of cough.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of cough.","meaning":"Boolean indicating whether the patient currently has symptoms of cough."}  ;; "cough"
(declare-const patient_has_symptoms_of_cough_now@@identified_as_symptom_on_upper_respiratory_infection_questionnaire Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cough symptom is identified as a symptom on the upper respiratory tract infection questionnaire.","when_to_set_to_false":"Set to false if the patient's cough symptom is not identified as a symptom on the upper respiratory tract infection questionnaire.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cough symptom is identified on the questionnaire.","meaning":"Boolean indicating whether the patient's cough symptom is identified as a symptom on the upper respiratory tract infection questionnaire."}  ;; "cough"
(declare-const patient_has_symptoms_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of fever.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of fever.","meaning":"Boolean indicating whether the patient currently has symptoms of fever."}  ;; "fever"
(declare-const patient_has_symptoms_of_fever_now@@identified_as_symptom_on_upper_respiratory_infection_questionnaire Bool) ;; {"when_to_set_to_true":"Set to true if the patient's fever symptom is identified as a symptom on the upper respiratory tract infection questionnaire.","when_to_set_to_false":"Set to false if the patient's fever symptom is not identified as a symptom on the upper respiratory tract infection questionnaire.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the fever symptom is identified on the questionnaire.","meaning":"Boolean indicating whether the patient's fever symptom is identified as a symptom on the upper respiratory tract infection questionnaire."}  ;; "fever"
(declare-const patient_has_symptoms_of_pain_in_throat_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of sore throat.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of sore throat.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of sore throat.","meaning":"Boolean indicating whether the patient currently has symptoms of sore throat."}  ;; "sore throat"
(declare-const patient_has_symptoms_of_pain_in_throat_now@@identified_as_symptom_on_upper_respiratory_infection_questionnaire Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sore throat symptom is identified as a symptom on the upper respiratory tract infection questionnaire.","when_to_set_to_false":"Set to false if the patient's sore throat symptom is not identified as a symptom on the upper respiratory tract infection questionnaire.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the sore throat symptom is identified on the questionnaire.","meaning":"Boolean indicating whether the patient's sore throat symptom is identified as a symptom on the upper respiratory tract infection questionnaire."}  ;; "sore throat"
(declare-const patient_has_symptoms_of_runny_nose_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of runny nose.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of runny nose.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of runny nose.","meaning":"Boolean indicating whether the patient currently has symptoms of runny nose."}  ;; "runny nose"
(declare-const patient_has_symptoms_of_runny_nose_now@@identified_as_symptom_on_upper_respiratory_infection_questionnaire Bool) ;; {"when_to_set_to_true":"Set to true if the patient's runny nose symptom is identified as a symptom on the upper respiratory tract infection questionnaire.","when_to_set_to_false":"Set to false if the patient's runny nose symptom is not identified as a symptom on the upper respiratory tract infection questionnaire.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the runny nose symptom is identified on the questionnaire.","meaning":"Boolean indicating whether the patient's runny nose symptom is identified as a symptom on the upper respiratory tract infection questionnaire."}  ;; "runny nose"
(declare-const patient_has_symptoms_of_upper_respiratory_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has at least one symptom of upper respiratory tract infection.","when_to_set_to_false":"Set to false if the patient currently does not have any symptoms of upper respiratory tract infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of upper respiratory tract infection.","meaning":"Boolean indicating whether the patient currently has symptoms of upper respiratory tract infection."}  ;; "upper respiratory tract infection"
(declare-const patient_has_symptoms_of_upper_respiratory_infection_now@@identified_on_upper_respiratory_infection_questionnaire Bool) ;; {"when_to_set_to_true":"Set to true if the patient's symptoms of upper respiratory tract infection are identified on the upper respiratory tract infection questionnaire.","when_to_set_to_false":"Set to false if the patient's symptoms of upper respiratory tract infection are not identified on the upper respiratory tract infection questionnaire.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the symptoms are identified on the questionnaire.","meaning":"Boolean indicating whether the patient's symptoms of upper respiratory tract infection are identified on the upper respiratory tract infection questionnaire."}  ;; "upper respiratory tract infection"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_symptoms_of_cough_now@@identified_as_symptom_on_upper_respiratory_infection_questionnaire
         patient_has_symptoms_of_cough_now)
     :named REQ2_AUXILIARY0)) ;; "cough" identified as symptom on questionnaire implies cough symptom

(assert
  (! (=> patient_has_symptoms_of_fever_now@@identified_as_symptom_on_upper_respiratory_infection_questionnaire
         patient_has_symptoms_of_fever_now)
     :named REQ2_AUXILIARY1)) ;; "fever" identified as symptom on questionnaire implies fever symptom

(assert
  (! (=> patient_has_symptoms_of_pain_in_throat_now@@identified_as_symptom_on_upper_respiratory_infection_questionnaire
         patient_has_symptoms_of_pain_in_throat_now)
     :named REQ2_AUXILIARY2)) ;; "sore throat" identified as symptom on questionnaire implies sore throat symptom

(assert
  (! (=> patient_has_symptoms_of_runny_nose_now@@identified_as_symptom_on_upper_respiratory_infection_questionnaire
         patient_has_symptoms_of_runny_nose_now)
     :named REQ2_AUXILIARY3)) ;; "runny nose" identified as symptom on questionnaire implies runny nose symptom

;; Non-exhaustive examples: if any of the listed symptoms are identified as symptoms on the questionnaire, then the patient has a symptom of upper respiratory tract infection on the questionnaire
(assert
  (! (=> (or patient_has_symptoms_of_pain_in_throat_now@@identified_as_symptom_on_upper_respiratory_infection_questionnaire
            patient_has_symptoms_of_runny_nose_now@@identified_as_symptom_on_upper_respiratory_infection_questionnaire
            patient_has_symptoms_of_cough_now@@identified_as_symptom_on_upper_respiratory_infection_questionnaire
            patient_has_symptoms_of_fever_now@@identified_as_symptom_on_upper_respiratory_infection_questionnaire)
         patient_has_symptoms_of_upper_respiratory_infection_now@@identified_on_upper_respiratory_infection_questionnaire)
     :named REQ2_AUXILIARY4)) ;; "such as sore throat, runny nose, cough, or fever" (non-exhaustive examples) imply umbrella

;; Qualifier variable for umbrella implies stem variable
(assert
  (! (=> patient_has_symptoms_of_upper_respiratory_infection_now@@identified_on_upper_respiratory_infection_questionnaire
         patient_has_symptoms_of_upper_respiratory_infection_now)
     :named REQ2_AUXILIARY5)) ;; umbrella qualifier implies umbrella

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must have at least one symptom of upper respiratory tract infection on the upper respiratory tract infection questionnaire
(assert
  (! patient_has_symptoms_of_upper_respiratory_infection_now@@identified_on_upper_respiratory_infection_questionnaire
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have at least one symptom of upper respiratory tract infection on the upper respiratory tract infection questionnaire with non-exhaustive examples (sore throat, runny nose, cough, fever)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_pain_in_throat_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pain in the throat (sore throat pain).","when_to_set_to_false":"Set to false if the patient currently does not have pain in the throat (sore throat pain).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pain in the throat (sore throat pain).","meaning":"Boolean indicating whether the patient currently has pain in the throat (sore throat pain)."} ;; "To be included, the patient must have ((moderate sore throat pain) OR (severe sore throat pain) on the throat pain scale)."
(declare-const patient_has_finding_of_pain_in_throat_now@@measured_on_throat_pain_scale Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sore throat pain is measured on the throat pain scale.","when_to_set_to_false":"Set to false if the patient's sore throat pain is not measured on the throat pain scale.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's sore throat pain is measured on the throat pain scale.","meaning":"Boolean indicating whether the patient's sore throat pain is measured on the throat pain scale."} ;; "To be included, the patient must have ((moderate sore throat pain) OR (severe sore throat pain) on the throat pain scale)."
(declare-const throat_pain_severity_value_recorded_now_withunit_throat_pain_scale Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the severity of the patient's current sore throat pain as measured on the throat pain scale.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the patient's current sore throat pain severity is on the throat pain scale.","meaning":"Numeric value indicating the severity of the patient's current sore throat pain, as measured on the throat pain scale."} ;; "To be included, the patient must have ((moderate sore throat pain) OR (severe sore throat pain) on the throat pain scale)."

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_pain_in_throat_now@@measured_on_throat_pain_scale
         patient_has_finding_of_pain_in_throat_now)
     :named REQ3_AUXILIARY0)) ;; "To be included, the patient must have ((moderate sore throat pain) OR (severe sore throat pain) on the throat pain scale)."

;; Definition: moderate or severe sore throat pain on the throat pain scale
;; (Assume moderate = 4, 5, 6; severe = 7, 8, 9, 10; scale is 0-10)
(define-fun patient_has_moderate_sore_throat_pain_on_throat_pain_scale_now () Bool
  (and patient_has_finding_of_pain_in_throat_now@@measured_on_throat_pain_scale
       (>= throat_pain_severity_value_recorded_now_withunit_throat_pain_scale 4)
       (<= throat_pain_severity_value_recorded_now_withunit_throat_pain_scale 6))) ;; "moderate sore throat pain on the throat pain scale"

(define-fun patient_has_severe_sore_throat_pain_on_throat_pain_scale_now () Bool
  (and patient_has_finding_of_pain_in_throat_now@@measured_on_throat_pain_scale
       (>= throat_pain_severity_value_recorded_now_withunit_throat_pain_scale 7)
       (<= throat_pain_severity_value_recorded_now_withunit_throat_pain_scale 10))) ;; "severe sore throat pain on the throat pain scale"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (or patient_has_moderate_sore_throat_pain_on_throat_pain_scale_now
         patient_has_severe_sore_throat_pain_on_throat_pain_scale_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have ((moderate sore throat pain) OR (severe sore throat pain) on the throat pain scale)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(assert
  (! (>= throat_pain_severity_value_recorded_now_withunit_throat_pain_scale 6)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (a baseline sore throat scale score ≥ 6)."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Indicates whether the patient's sex is female at the current time."} ;; "female of childbearing potential"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently assessed to have childbearing potential.","when_to_set_to_false":"Set to false if the patient is currently assessed to not have childbearing potential.","when_to_set_to_null":"Set to null if the patient's childbearing potential is unknown, not documented, or cannot be determined at the current time.","meaning":"Indicates whether the patient currently has the potential to bear children."} ;; "female of childbearing potential"
(declare-const patient_has_been_using_effective_contraception_since_last_menses Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been using effective contraception continuously since the last date of menses.","when_to_set_to_false":"Set to false if the patient has not been using effective contraception continuously since the last date of menses.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been using effective contraception continuously since the last date of menses.","meaning":"Boolean indicating whether the patient has been using effective contraception continuously since the last date of menses."} ;; "have been using effective contraception since the last date of menses"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breast-feeding.","when_to_set_to_false":"Set to false if the patient is currently not breast-feeding.","when_to_set_to_null":"Set to null if the patient's breast-feeding status is unknown, not documented, or cannot be determined at the current time.","meaning":"Indicates whether the patient is currently breast-feeding."} ;; "NOT be breast-feeding"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently not lactating.","when_to_set_to_null":"Set to null if the patient's lactation status is unknown, not documented, or cannot be determined at the current time.","meaning":"Indicates whether the patient is currently lactating."} ;; "NOT be lactating"
(declare-const patient_is_willing_to_take_adequate_contraceptive_precautions_through_24_hours_after_study_completion Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to take adequate contraceptive precautions through 24 hours after the completion of the study.","when_to_set_to_false":"Set to false if the patient is not willing to take adequate contraceptive precautions through 24 hours after the completion of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to take adequate contraceptive precautions through 24 hours after the completion of the study.","meaning":"Boolean indicating whether the patient is willing to take adequate contraceptive precautions through 24 hours after the completion of the study."} ;; "be willing to take adequate contraceptive precautions through 24 hours after the completion of the study"
(declare-const patients_breastfeeding_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breast-feeding.","when_to_set_to_false":"Set to false if the patient is currently not breast-feeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently breast-feeding.","meaning":"Boolean indicating whether the patient is currently breast-feeding."} ;; "breast-feeding"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; If the patient is a female of childbearing potential, then all contraception-related requirements apply
(assert
  (! (= patient_has_childbearing_potential_now
        (and patient_sex_is_female_now patient_has_childbearing_potential_now))
     :named REQ5_AUXILIARY0)) ;; "female of childbearing potential" is defined as female AND has childbearing potential

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: If the patient is a female of childbearing potential, must have been using effective contraception since last menses
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         patient_has_been_using_effective_contraception_since_last_menses)
     :named REQ5_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, if the patient is a female of childbearing potential, the patient must have been using effective contraception since the last date of menses."

;; Component 1: If the patient is a female of childbearing potential, must NOT be breast-feeding
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         (not patient_is_breastfeeding_now))
     :named REQ5_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, if the patient is a female of childbearing potential, the patient must not be breast-feeding."

;; Component 2: If the patient is a female of childbearing potential, must NOT be lactating
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         (not patient_is_lactating_now))
     :named REQ5_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, if the patient is a female of childbearing potential, the patient must not be lactating."

;; Component 3: If the patient is a female of childbearing potential, must be willing to take adequate contraceptive precautions through 24 hours after study completion
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         patient_is_willing_to_take_adequate_contraceptive_precautions_through_24_hours_after_study_completion)
     :named REQ5_COMPONENT3_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, if the patient is a female of childbearing potential, the patient must be willing to take adequate contraceptive precautions through 24 hours after the completion of the study."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_undergone_urine_pregnancy_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a urine pregnancy test now (i.e., on the day of scheduled randomization prior to the designated time of randomization).","when_to_set_to_false":"Set to false if the patient has not undergone a urine pregnancy test now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a urine pregnancy test now.","meaning":"Boolean indicating whether the patient has undergone a urine pregnancy test now."} ;; "a negative urine pregnancy test result obtained on the day of scheduled randomization prior to the designated time of randomization"
(declare-const patient_has_undergone_urine_pregnancy_test_now@@obtained_on_day_of_scheduled_randomization_prior_to_designated_time Bool) ;; {"when_to_set_to_true":"Set to true if the urine pregnancy test was obtained on the day of scheduled randomization prior to the designated time of randomization.","when_to_set_to_false":"Set to false if the urine pregnancy test was not obtained on the day of scheduled randomization prior to the designated time of randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the urine pregnancy test was obtained on the day of scheduled randomization prior to the designated time of randomization.","meaning":"Boolean indicating whether the urine pregnancy test was obtained on the day of scheduled randomization prior to the designated time of randomization."} ;; "a negative urine pregnancy test result obtained on the day of scheduled randomization prior to the designated time of randomization"
(declare-const patient_has_undergone_urine_pregnancy_test_now@@outcome_is_negative Bool) ;; {"when_to_set_to_true":"Set to true if the result of the urine pregnancy test is negative.","when_to_set_to_false":"Set to false if the result of the urine pregnancy test is not negative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the result of the urine pregnancy test is negative.","meaning":"Boolean indicating whether the result of the urine pregnancy test is negative."} ;; "a negative urine pregnancy test result obtained on the day of scheduled randomization prior to the designated time of randomization"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the urine pregnancy test performed on the day of scheduled randomization prior to the designated time is positive, indicating the patient is currently pregnant.","when_to_set_to_false":"Set to false if the urine pregnancy test performed on the day of scheduled randomization prior to the designated time is negative, indicating the patient is not currently pregnant.","when_to_set_to_null":"Set to null if the urine pregnancy test result is unavailable, indeterminate, or not performed on the day of scheduled randomization prior to the designated time.","meaning":"Boolean value indicating whether the patient is currently pregnant, as determined by a urine pregnancy test performed on the day of randomization prior to the designated time."} ;; "a negative urine pregnancy test result obtained on the day of scheduled randomization prior to the designated time of randomization"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_urine_pregnancy_test_now@@obtained_on_day_of_scheduled_randomization_prior_to_designated_time
         patient_has_undergone_urine_pregnancy_test_now)
     :named REQ6_AUXILIARY0)) ;; "urine pregnancy test obtained on the day of scheduled randomization prior to the designated time"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_urine_pregnancy_test_now@@outcome_is_negative
         patient_has_undergone_urine_pregnancy_test_now)
     :named REQ6_AUXILIARY1)) ;; "urine pregnancy test result is negative"

;; Definition: negative urine pregnancy test result on the day of scheduled randomization prior to the designated time means patient is not pregnant now
(assert
  (! (= patient_is_pregnant_now
        (not (and patient_has_undergone_urine_pregnancy_test_now@@obtained_on_day_of_scheduled_randomization_prior_to_designated_time
                  patient_has_undergone_urine_pregnancy_test_now@@outcome_is_negative)))
     :named REQ6_AUXILIARY2)) ;; "a negative urine pregnancy test result obtained on the day of scheduled randomization prior to the designated time of randomization"

;; ===================== Constraint Assertions (REQ 6) =====================
;; If the patient is a female of childbearing potential, she must have a negative urine pregnancy test result obtained on the day of scheduled randomization prior to the designated time of randomization
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         (and patient_has_undergone_urine_pregnancy_test_now@@obtained_on_day_of_scheduled_randomization_prior_to_designated_time
              patient_has_undergone_urine_pregnancy_test_now@@outcome_is_negative))
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is a female of childbearing potential, the patient must have a negative urine pregnancy test result obtained on the day of scheduled randomization prior to the designated time of randomization"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to the study drug or medicament (i.e., has received the dose).","when_to_set_to_false":"Set to false if the patient is not currently exposed to the study drug or medicament (i.e., has not received the dose).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to the study drug or medicament.","meaning":"Boolean indicating whether the patient is currently exposed to the study drug or medicament."} ;; "after receiving the dose of study medication"
(declare-const patient_is_willing_to_remain_at_study_centre_for_3_hours_after_receiving_dose Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to remain at the study centre for 3 hours after receiving the dose of study medication.","when_to_set_to_false":"Set to false if the patient is not willing to remain at the study centre for 3 hours after receiving the dose of study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to remain at the study centre for 3 hours after receiving the dose of study medication.","meaning":"Boolean indicating whether the patient is willing to remain at the study centre for 3 hours after receiving the dose of study medication."} ;; "To be included, the patient must be willing to remain at the study centre for 3 hours after receiving the dose of study medication."

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! patient_is_willing_to_remain_at_study_centre_for_3_hours_after_receiving_dose
     :named REQ7_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be willing to remain at the study centre for 3 hours after receiving the dose of study medication."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_is_willing_to_take_nothing_by_mouth_during_3_hour_evaluation_of_study_medication_lozenge_at_site Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to take nothing by mouth (including no smoking, no food, no candy, no lozenges, no chewing gum, no liquids) during the 3-hour evaluation of the study medication lozenge at the site.","when_to_set_to_false":"Set to false if the patient is not willing to take nothing by mouth (including no smoking, no food, no candy, no lozenges, no chewing gum, no liquids) during the 3-hour evaluation of the study medication lozenge at the site.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to take nothing by mouth during the 3-hour evaluation of the study medication lozenge at the site.","meaning":"Boolean indicating whether the patient is willing to take nothing by mouth (including no smoking, no food, no candy, no lozenges, no chewing gum, no liquids) during the 3-hour evaluation of the study medication lozenge at the site."} ;; "the patient must be willing to take nothing by mouth (including with exhaustive subcategories (no smoking, no food, no candy, no lozenges, no chewing gum, no liquids)) during the 3-hour evaluation of the study medication lozenge at the site."
(declare-const patient_is_exposed_to_tobacco_smoking_behavior_finding_now@@during_3_hour_evaluation_of_study_medication_lozenge_at_site Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to tobacco smoking occurs during the 3-hour evaluation of the study medication lozenge at the site.","when_to_set_to_false":"Set to false if the patient's current exposure to tobacco smoking does not occur during the 3-hour evaluation of the study medication lozenge at the site.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current exposure to tobacco smoking occurs during the 3-hour evaluation of the study medication lozenge at the site.","meaning":"Boolean indicating whether the patient's current exposure to tobacco smoking occurs during the 3-hour evaluation of the study medication lozenge at the site."} ;; "no smoking during the 3-hour evaluation"
(declare-const patient_is_exposed_to_foods_now@@during_3_hour_evaluation_of_study_medication_lozenge_at_site Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to food occurs during the 3-hour evaluation of the study medication lozenge at the site.","when_to_set_to_false":"Set to false if the patient's current exposure to food does not occur during the 3-hour evaluation of the study medication lozenge at the site.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current exposure to food occurs during the 3-hour evaluation of the study medication lozenge at the site.","meaning":"Boolean indicating whether the patient's current exposure to food occurs during the 3-hour evaluation of the study medication lozenge at the site."} ;; "no food during the 3-hour evaluation"
(declare-const patient_is_exposed_to_candy_now@@during_3_hour_evaluation_of_study_medication_lozenge_at_site Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to candy occurs during the 3-hour evaluation of the study medication lozenge at the site.","when_to_set_to_false":"Set to false if the patient's current exposure to candy does not occur during the 3-hour evaluation of the study medication lozenge at the site.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current exposure to candy occurs during the 3-hour evaluation of the study medication lozenge at the site.","meaning":"Boolean indicating whether the patient's current exposure to candy occurs during the 3-hour evaluation of the study medication lozenge at the site."} ;; "no candy during the 3-hour evaluation"
(declare-const patient_is_exposed_to_lozenges_now@@during_3_hour_evaluation_of_study_medication_lozenge_at_site Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to lozenges occurs during the 3-hour evaluation of the study medication lozenge at the site.","when_to_set_to_false":"Set to false if the patient's current exposure to lozenges does not occur during the 3-hour evaluation of the study medication lozenge at the site.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current exposure to lozenges occurs during the 3-hour evaluation of the study medication lozenge at the site.","meaning":"Boolean indicating whether the patient's current exposure to lozenges occurs during the 3-hour evaluation of the study medication lozenge at the site."} ;; "no lozenges during the 3-hour evaluation"
(declare-const patient_is_exposed_to_chewing_gum_now@@during_3_hour_evaluation_of_study_medication_lozenge_at_site Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to chewing gum occurs during the 3-hour evaluation of the study medication lozenge at the site.","when_to_set_to_false":"Set to false if the patient's current exposure to chewing gum does not occur during the 3-hour evaluation of the study medication lozenge at the site.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current exposure to chewing gum occurs during the 3-hour evaluation of the study medication lozenge at the site.","meaning":"Boolean indicating whether the patient's current exposure to chewing gum occurs during the 3-hour evaluation of the study medication lozenge at the site."} ;; "no chewing gum during the 3-hour evaluation"
(declare-const patient_is_exposed_to_liquid_substance_now@@during_3_hour_evaluation_of_study_medication_lozenge_at_site Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to liquids occurs during the 3-hour evaluation of the study medication lozenge at the site.","when_to_set_to_false":"Set to false if the patient's current exposure to liquids does not occur during the 3-hour evaluation of the study medication lozenge at the site.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current exposure to liquids occurs during the 3-hour evaluation of the study medication lozenge at the site.","meaning":"Boolean indicating whether the patient's current exposure to liquids occurs during the 3-hour evaluation of the study medication lozenge at the site."} ;; "no liquids during the 3-hour evaluation"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Exhaustive subcategories: "nothing by mouth" ≡ (no smoking ∧ no food ∧ no candy ∧ no lozenges ∧ no chewing gum ∧ no liquids)
(assert
  (! (= patient_is_willing_to_take_nothing_by_mouth_during_3_hour_evaluation_of_study_medication_lozenge_at_site
        (and (not patient_is_exposed_to_tobacco_smoking_behavior_finding_now@@during_3_hour_evaluation_of_study_medication_lozenge_at_site)
             (not patient_is_exposed_to_foods_now@@during_3_hour_evaluation_of_study_medication_lozenge_at_site)
             (not patient_is_exposed_to_candy_now@@during_3_hour_evaluation_of_study_medication_lozenge_at_site)
             (not patient_is_exposed_to_lozenges_now@@during_3_hour_evaluation_of_study_medication_lozenge_at_site)
             (not patient_is_exposed_to_chewing_gum_now@@during_3_hour_evaluation_of_study_medication_lozenge_at_site)
             (not patient_is_exposed_to_liquid_substance_now@@during_3_hour_evaluation_of_study_medication_lozenge_at_site)))
     :named REQ8_AUXILIARY0)) ;; "including with exhaustive subcategories (no smoking, no food, no candy, no lozenges, no chewing gum, no liquids)"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! patient_is_willing_to_take_nothing_by_mouth_during_3_hour_evaluation_of_study_medication_lozenge_at_site
     :named REQ8_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be willing to take nothing by mouth (including with exhaustive subcategories (no smoking, no food, no candy, no lozenges, no chewing gum, no liquids)) during the 3-hour evaluation of the study medication lozenge at the site."
