;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 35 years AND aged ≤ 75 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be aged ≥ 35 years at the time of enrollment.
(assert
  (! (>= patient_age_value_recorded_now_in_years 35)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "aged ≥ 35 years at the time of enrollment"

;; Component 1: To be included, the patient must be aged ≤ 75 years at the time of enrollment.
(assert
  (! (<= patient_age_value_recorded_now_in_years 75)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "aged ≤ 75 years at the time of enrollment"

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_parkinson_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Parkinson's disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Parkinson's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Parkinson's disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Parkinson's disease."} ;; "a diagnosis of idiopathic Parkinson's disease"
(declare-const patient_has_diagnosis_of_parkinson_s_disease_now@@idiopathic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of Parkinson's disease is idiopathic.","when_to_set_to_false":"Set to false if the patient's diagnosis of Parkinson's disease is not idiopathic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's diagnosis of Parkinson's disease is idiopathic.","meaning":"Boolean indicating whether the patient's diagnosis of Parkinson's disease is idiopathic."} ;; "idiopathic Parkinson's disease"

(declare-const patient_has_diagnosis_of_dementia_associated_with_parkinson_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Parkinson's disease dementia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Parkinson's disease dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Parkinson's disease dementia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Parkinson's disease dementia."} ;; "a diagnosis of probable Parkinson's disease dementia (as defined by the Movement Disorder Society consensus guidelines (Emre et al., 2007))"
(declare-const patient_has_diagnosis_of_dementia_associated_with_parkinson_s_disease_now@@probable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of Parkinson's disease dementia is probable.","when_to_set_to_false":"Set to false if the patient's diagnosis of Parkinson's disease dementia is not probable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's diagnosis of Parkinson's disease dementia is probable.","meaning":"Boolean indicating whether the patient's diagnosis of Parkinson's disease dementia is probable."} ;; "probable Parkinson's disease dementia"
(declare-const patient_has_diagnosis_of_dementia_associated_with_parkinson_s_disease_now@@defined_by_movement_disorder_society_consensus_guidelines_emre_et_al_2007 Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of Parkinson's disease dementia is defined according to the Movement Disorder Society consensus guidelines (Emre et al., 2007).","when_to_set_to_false":"Set to false if the patient's diagnosis of Parkinson's disease dementia is not defined according to the Movement Disorder Society consensus guidelines (Emre et al., 2007).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's diagnosis of Parkinson's disease dementia is defined according to the Movement Disorder Society consensus guidelines (Emre et al., 2007).","meaning":"Boolean indicating whether the patient's diagnosis of Parkinson's disease dementia is defined according to the Movement Disorder Society consensus guidelines (Emre et al., 2007)."} ;; "as defined by the Movement Disorder Society consensus guidelines (Emre et al., 2007)"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies stem variable: idiopathic Parkinson's disease
(assert
  (! (=> patient_has_diagnosis_of_parkinson_s_disease_now@@idiopathic
         patient_has_diagnosis_of_parkinson_s_disease_now)
     :named REQ1_AUXILIARY0)) ;; "idiopathic" implies diagnosis of Parkinson's disease

;; Qualifier variable implies stem variable: probable Parkinson's disease dementia
(assert
  (! (=> patient_has_diagnosis_of_dementia_associated_with_parkinson_s_disease_now@@probable
         patient_has_diagnosis_of_dementia_associated_with_parkinson_s_disease_now)
     :named REQ1_AUXILIARY1)) ;; "probable" implies diagnosis of Parkinson's disease dementia

;; Qualifier variable implies stem variable: defined by MDS consensus guidelines
(assert
  (! (=> patient_has_diagnosis_of_dementia_associated_with_parkinson_s_disease_now@@defined_by_movement_disorder_society_consensus_guidelines_emre_et_al_2007
         patient_has_diagnosis_of_dementia_associated_with_parkinson_s_disease_now)
     :named REQ1_AUXILIARY2)) ;; "defined by MDS consensus guidelines" implies diagnosis of Parkinson's disease dementia

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Must have idiopathic Parkinson's disease
(assert
  (! patient_has_diagnosis_of_parkinson_s_disease_now@@idiopathic
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "a diagnosis of idiopathic Parkinson's disease"

;; Component 1: Must have probable Parkinson's disease dementia as defined by MDS consensus guidelines
(assert
  (! (and patient_has_diagnosis_of_dementia_associated_with_parkinson_s_disease_now@@probable
          patient_has_diagnosis_of_dementia_associated_with_parkinson_s_disease_now@@defined_by_movement_disorder_society_consensus_guidelines_emre_et_al_2007)
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "a diagnosis of probable Parkinson's disease dementia (as defined by the Movement Disorder Society consensus guidelines (Emre et al., 2007))"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of dementia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of dementia."} ;; "dementia"
(declare-const patient_mini_mental_state_examination_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured value if a Mini-Mental State Examination score is recorded for the patient now.","when_to_set_to_null":"Set to null if no Mini-Mental State Examination score is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's Mini-Mental State Examination score recorded now, in units of 'score'."} ;; "Mini-Mental State Examination score"

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must have mild or moderately severe dementia as defined by a Mini-Mental State Examination score between 10 and 24 (inclusive).
(assert
  (! (and patient_has_diagnosis_of_dementia_now
          (>= patient_mini_mental_state_examination_score_value_recorded_now_withunit_score 10)
          (<= patient_mini_mental_state_examination_score_value_recorded_now_withunit_score 24))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const duration_of_motor_symptoms_in_years Real) ;; {"when_to_set_to_value":"Set to the number of years the patient has had motor symptoms, as documented in the medical record or reported by the patient.","when_to_set_to_null":"Set to null if the duration of motor symptoms is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration, in years, of the patient's motor symptoms."} ;; "≥ 5 years of motor symptoms"
(declare-const patient_has_diagnosis_of_parkinson_s_disease_now@@bilateral Bool) ;; {"when_to_set_to_true":"Set to true if the patient's idiopathic Parkinson's disease is bilateral.","when_to_set_to_false":"Set to false if the patient's idiopathic Parkinson's disease is not bilateral.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's idiopathic Parkinson's disease is bilateral.","meaning":"Boolean indicating whether the patient's idiopathic Parkinson's disease is bilateral."} ;; "bilateral idiopathic Parkinson's disease"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_parkinson_s_disease_now@@bilateral
         patient_has_diagnosis_of_parkinson_s_disease_now@@idiopathic)
     :named REQ3_AUXILIARY0)) ;; "bilateral idiopathic Parkinson's disease"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_parkinson_s_disease_now@@idiopathic
         patient_has_diagnosis_of_parkinson_s_disease_now)
     :named REQ3_AUXILIARY1)) ;; "idiopathic Parkinson's disease"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: Must have had bilateral idiopathic Parkinson's disease
(assert
  (! patient_has_diagnosis_of_parkinson_s_disease_now@@bilateral
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "bilateral idiopathic Parkinson's disease"

;; Component 1: Must have had ≥ 5 years of motor symptoms
(assert
  (! (>= duration_of_motor_symptoms_in_years 5.0)
     :named REQ3_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "≥ 5 years of motor symptoms"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_parkinson_s_disease_now@@bilateral@@severity_modified_hoehn_and_yahr_stage_gte_2_medication_off_state Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bilateral idiopathic Parkinson's disease and the severity in the medication off state is modified Hoehn and Yahr stage ≥ 2.","when_to_set_to_false":"Set to false if the patient currently has bilateral idiopathic Parkinson's disease but the severity in the medication off state is less than modified Hoehn and Yahr stage 2.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity in the medication off state is modified Hoehn and Yahr stage ≥ 2 for bilateral idiopathic Parkinson's disease.","meaning":"Boolean indicating whether the patient currently has bilateral idiopathic Parkinson's disease and the severity in the medication off state is modified Hoehn and Yahr stage ≥ 2."} ;; "a severity of bilateral idiopathic Parkinson's disease in the medication off state of modified Hoehn and Yahr stage ≥ 2"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_diagnosis_of_parkinson_s_disease_now@@bilateral@@severity_modified_hoehn_and_yahr_stage_gte_2_medication_off_state
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a severity of bilateral idiopathic Parkinson's disease in the medication off state of modified Hoehn and Yahr stage ≥ 2."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const updrs_iii_score_value_recorded_in_medication_off_and_stimulation_off_state_withunit_points Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's UPDRS III score as measured in both the medication off state and stimulation off state, in points.","when_to_set_to_null":"Set to null if the UPDRS III score in the medication off and stimulation off state is not available, not documented, or cannot be determined.","meaning":"Numeric value of the patient's UPDRS III score in the medication off and stimulation off state, in points."} ;; "Unified Parkinson's Disease Rating Scale subset III score ≥ 30 in the medication off state AND stimulation off state"
(declare-const updrs_iii_score_value_recorded_in_medication_off_and_stimulation_off_state_withunit_points@@measured_in_medication_off_and_stimulation_off_state Bool) ;; {"when_to_set_to_true":"Set to true if the UPDRS III score was measured in both the medication off state and stimulation off state.","when_to_set_to_false":"Set to false if the UPDRS III score was not measured in both the medication off state and stimulation off state.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the UPDRS III score was measured in both the medication off state and stimulation off state.","meaning":"Boolean indicating whether the UPDRS III score was measured in both the medication off state and stimulation off state."} ;; "Unified Parkinson's Disease Rating Scale subset III score ... in the medication off state AND stimulation off state"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies the score is measured in the correct state
(assert
  (! (=> updrs_iii_score_value_recorded_in_medication_off_and_stimulation_off_state_withunit_points@@measured_in_medication_off_and_stimulation_off_state
         (>= updrs_iii_score_value_recorded_in_medication_off_and_stimulation_off_state_withunit_points 0))
     :named REQ5_AUXILIARY0)) ;; "score measured in both the medication off state and stimulation off state"

;; ===================== Constraint Assertions (REQ 5) =====================
;; The patient must have a UPDRS III score ≥ 30 measured in both the medication off state AND stimulation off state
(assert
  (! (and updrs_iii_score_value_recorded_in_medication_off_and_stimulation_off_state_withunit_points@@measured_in_medication_off_and_stimulation_off_state
          (>= updrs_iii_score_value_recorded_in_medication_off_and_stimulation_off_state_withunit_points 30))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "Unified Parkinson's Disease Rating Scale subset III score ≥ 30 in the medication off state AND stimulation off state"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_parkinsonian_features_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage improvement in parkinsonian features (Parkinson's disease symptoms) recorded now, as measured by UPDRS III during a levodopa challenge test.","when_to_set_to_null":"Set to null if no such percentage improvement measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's improvement in parkinsonian features (Parkinson's disease symptoms) recorded now."} ;; "the patient's Parkinson's disease symptoms must improve by (≥ 30 %) in a levodopa challenge test (as measured by Unified Parkinson's Disease Rating Scale subset III score)"
(declare-const patient_parkinsonian_features_value_recorded_now_withunit_percent@@measured_by_unified_parkinsons_disease_rating_scale_subset_iii_score Bool) ;; {"when_to_set_to_true":"Set to true if the percentage improvement in parkinsonian features is measured by the Unified Parkinson's Disease Rating Scale subset III score.","when_to_set_to_false":"Set to false if the percentage improvement is not measured by the Unified Parkinson's Disease Rating Scale subset III score.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was made by the Unified Parkinson's Disease Rating Scale subset III score.","meaning":"Boolean indicating whether the percentage improvement in parkinsonian features is measured by the Unified Parkinson's Disease Rating Scale subset III score."} ;; "as measured by Unified Parkinson's Disease Rating Scale subset III score"
(declare-const patient_parkinsonian_features_value_recorded_now_withunit_percent@@measured_in_levodopa_challenge_test Bool) ;; {"when_to_set_to_true":"Set to true if the percentage improvement in parkinsonian features is measured in the context of a levodopa challenge test.","when_to_set_to_false":"Set to false if the percentage improvement is not measured in the context of a levodopa challenge test.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was made in the context of a levodopa challenge test.","meaning":"Boolean indicating whether the percentage improvement in parkinsonian features is measured in the context of a levodopa challenge test."} ;; "in a levodopa challenge test"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply the existence of the stem variable
(assert
  (! (=> patient_parkinsonian_features_value_recorded_now_withunit_percent@@measured_by_unified_parkinsons_disease_rating_scale_subset_iii_score
         (exists ((x Real)) (= x patient_parkinsonian_features_value_recorded_now_withunit_percent)))
     :named REQ6_AUXILIARY0)) ;; "as measured by Unified Parkinson's Disease Rating Scale subset III score"

(assert
  (! (=> patient_parkinsonian_features_value_recorded_now_withunit_percent@@measured_in_levodopa_challenge_test
         (exists ((x Real)) (= x patient_parkinsonian_features_value_recorded_now_withunit_percent)))
     :named REQ6_AUXILIARY1)) ;; "in a levodopa challenge test"

;; ===================== Constraint Assertions (REQ 6) =====================
;; The patient's Parkinson's disease symptoms must improve by ≥ 30% in a levodopa challenge test (as measured by UPDRS III)
(assert
  (! (and (>= patient_parkinsonian_features_value_recorded_now_withunit_percent 30.0)
          patient_parkinsonian_features_value_recorded_now_withunit_percent@@measured_by_unified_parkinsons_disease_rating_scale_subset_iii_score
          patient_parkinsonian_features_value_recorded_now_withunit_percent@@measured_in_levodopa_challenge_test)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient's Parkinson's disease symptoms must improve by (≥ 30 %) in a levodopa challenge test (as measured by Unified Parkinson's Disease Rating Scale subset III score)"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_age_value_recorded_at_onset_of_dementia_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's age in years at the time when Parkinson's disease dementia symptoms first appeared.","when_to_set_to_null":"Set to null if the patient's age at onset of Parkinson's disease dementia symptoms is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's age in years at the time of onset of Parkinson's disease dementia symptoms."} ;; "symptom onset ≥ 2 years after the first symptoms of Parkinson's disease"
(declare-const patient_age_value_recorded_inthehistory_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's age in years at the time when the first symptoms of Parkinson's disease were documented.","when_to_set_to_null":"Set to null if the patient's age at first Parkinson's disease symptoms is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's age in years at the time of first symptoms of Parkinson's disease."} ;; "symptom onset ≥ 2 years after the first symptoms of Parkinson's disease"
(declare-const patient_has_diagnosis_of_dementia_associated_with_parkinson_s_disease_now@@symptom_onset_at_least_2_years_after_first_symptoms_of_parkinson_s_disease Bool) ;; {"when_to_set_to_true":"Set to true if the onset of Parkinson's disease dementia symptoms occurred at least 2 years after the first symptoms of Parkinson's disease.","when_to_set_to_false":"Set to false if the onset of Parkinson's disease dementia symptoms occurred less than 2 years after the first symptoms of Parkinson's disease.","when_to_set_to_null":"Set to null if the timing of symptom onset relative to first Parkinson's disease symptoms is unknown or cannot be determined.","meaning":"Boolean indicating whether the onset of Parkinson's disease dementia symptoms occurred at least 2 years after the first symptoms of Parkinson's disease."} ;; "symptom onset ≥ 2 years after the first symptoms of Parkinson's disease"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Definition in the requirement: symptom onset ≥ 2 years after first symptoms of Parkinson's disease
(assert
  (! (= patient_has_diagnosis_of_dementia_associated_with_parkinson_s_disease_now@@symptom_onset_at_least_2_years_after_first_symptoms_of_parkinson_s_disease
        (>= (- patient_age_value_recorded_at_onset_of_dementia_in_years patient_age_value_recorded_inthehistory_in_years) 2.0))
     :named REQ7_AUXILIARY0)) ;; "symptom onset ≥ 2 years after the first symptoms of Parkinson's disease"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_diagnosis_of_dementia_associated_with_parkinson_s_disease_now@@symptom_onset_at_least_2_years_after_first_symptoms_of_parkinson_s_disease
         patient_has_diagnosis_of_dementia_associated_with_parkinson_s_disease_now)
     :named REQ7_AUXILIARY1)) ;; "Parkinson's disease dementia with symptom onset ≥ 2 years after the first symptoms of Parkinson's disease"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! patient_has_diagnosis_of_dementia_associated_with_parkinson_s_disease_now@@symptom_onset_at_least_2_years_after_first_symptoms_of_parkinson_s_disease
     :named REQ7_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have Parkinson's disease dementia with symptom onset ≥ 2 years after the first symptoms of Parkinson's disease."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_is_mentally_competent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently mentally competent.","when_to_set_to_false":"Set to false if the patient is currently mentally incompetent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently mentally competent.","meaning":"Boolean indicating whether the patient is currently mentally competent."} ;; "if the patient is mentally competent"
(declare-const patient_is_willing_to_comply_with_all_visits_and_study_related_procedures_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently willing to comply with all visits and study related procedures.","when_to_set_to_false":"Set to false if the patient is currently not willing to comply with all visits and study related procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently willing to comply with all visits and study related procedures.","meaning":"Boolean indicating whether the patient is currently willing to comply with all visits and study related procedures."} ;; "be willing ... if the patient is mentally competent"
(declare-const patient_is_able_to_comply_with_all_visits_and_study_related_procedures_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to comply with all visits and study related procedures.","when_to_set_to_false":"Set to false if the patient is currently not able to comply with all visits and study related procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to comply with all visits and study related procedures.","meaning":"Boolean indicating whether the patient is currently able to comply with all visits and study related procedures."} ;; "be able ... if the patient is mentally competent"
(declare-const legally_authorized_representative_is_willing_to_comply_with_all_visits_and_study_related_procedures_now Bool) ;; {"when_to_set_to_true":"Set to true if the legally authorized representative is currently willing to comply with all visits and study related procedures on behalf of the patient.","when_to_set_to_false":"Set to false if the legally authorized representative is currently not willing to comply with all visits and study related procedures on behalf of the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the legally authorized representative is currently willing to comply with all visits and study related procedures on behalf of the patient.","meaning":"Boolean indicating whether the legally authorized representative is currently willing to comply with all visits and study related procedures on behalf of the patient."} ;; "the legally authorized representative ... must be willing ... if the patient is mentally incompetent"
(declare-const legally_authorized_representative_is_able_to_comply_with_all_visits_and_study_related_procedures_now Bool) ;; {"when_to_set_to_true":"Set to true if the legally authorized representative is currently able to comply with all visits and study related procedures on behalf of the patient.","when_to_set_to_false":"Set to false if the legally authorized representative is currently not able to comply with all visits and study related procedures on behalf of the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the legally authorized representative is currently able to comply with all visits and study related procedures on behalf of the patient.","meaning":"Boolean indicating whether the legally authorized representative is currently able to comply with all visits and study related procedures on behalf of the patient."} ;; "the legally authorized representative ... must be able ... if the patient is mentally incompetent"

;; ===================== Constraint Assertions (REQ 8) =====================
;; The patient must ((be willing AND able to comply with all visits AND study related procedures IF the patient is mentally competent) OR (the legally authorized representative of the patient must be willing AND able to comply IF the patient is mentally incompetent)).
(assert
  (! (or
        (and patient_is_mentally_competent_now
             patient_is_willing_to_comply_with_all_visits_and_study_related_procedures_now
             patient_is_able_to_comply_with_all_visits_and_study_related_procedures_now)
        (and (not patient_is_mentally_competent_now)
             legally_authorized_representative_is_willing_to_comply_with_all_visits_and_study_related_procedures_now
             legally_authorized_representative_is_able_to_comply_with_all_visits_and_study_related_procedures_now))
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((be willing AND able to comply with all visits AND study related procedures ... IF the patient is mentally competent) OR (the legally authorized representative ... must be willing AND able to comply IF the patient is mentally incompetent))."

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_can_understand_study_requirements_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to understand the study requirements.","when_to_set_to_false":"Set to false if the patient is currently not able to understand the study requirements.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to understand the study requirements.","meaning":"Boolean indicating whether the patient is currently able to understand the study requirements."} ;; "be able to understand the study requirements"
(declare-const patient_can_understand_treatment_procedures_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to understand the treatment procedures.","when_to_set_to_false":"Set to false if the patient is currently not able to understand the treatment procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to understand the treatment procedures.","meaning":"Boolean indicating whether the patient is currently able to understand the treatment procedures."} ;; "be able to understand ... the treatment procedures"
(declare-const patient_has_provided_written_informed_consent_before_any_study_specific_tests_or_procedures Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent before any study-specific tests or procedures are performed.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent before any study-specific tests or procedures are performed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent before any study-specific tests or procedures are performed.","meaning":"Boolean indicating whether the patient has provided written informed consent before any study-specific tests or procedures are performed."} ;; "provide written informed consent before any study-specific tests or procedures are performed"
(declare-const legally_authorized_representative_has_provided_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the legally authorized representative of the patient has provided written informed consent.","when_to_set_to_false":"Set to false if the legally authorized representative of the patient has not provided written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the legally authorized representative of the patient has provided written informed consent.","meaning":"Boolean indicating whether the legally authorized representative of the patient has provided written informed consent."} ;; "the legally authorized representative of the patient must provide written informed consent IF the patient is mentally incompetent"
;; patient_is_mentally_competent_now is already declared and reused

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Patient must be able to understand study requirements AND treatment procedures AND provide written informed consent before any study-specific tests or procedures are performed IF the patient is mentally competent
(assert
  (! (=> patient_is_mentally_competent_now
         (and patient_can_understand_study_requirements_now
              patient_can_understand_treatment_procedures_now
              patient_has_provided_written_informed_consent_before_any_study_specific_tests_or_procedures))
     :named REQ9_AUXILIARY0)) ;; "be able to understand the study requirements AND the treatment procedures AND provide written informed consent before any study-specific tests or procedures are performed IF the patient is mentally competent"

;; The legally authorized representative of the patient must provide written informed consent IF the patient is mentally incompetent
(assert
  (! (=> (not patient_is_mentally_competent_now)
         legally_authorized_representative_has_provided_written_informed_consent)
     :named REQ9_AUXILIARY1)) ;; "the legally authorized representative of the patient must provide written informed consent IF the patient is mentally incompetent"

;; ===================== Constraint Assertions (REQ 9) =====================
;; To be included, the patient must ((be able to understand the study requirements AND the treatment procedures AND provide written informed consent before any study-specific tests or procedures are performed IF the patient is mentally competent) OR (the legally authorized representative of the patient must provide written informed consent IF the patient is mentally incompetent))
(assert
  (! (or
        (and patient_is_mentally_competent_now
             patient_can_understand_study_requirements_now
             patient_can_understand_treatment_procedures_now
             patient_has_provided_written_informed_consent_before_any_study_specific_tests_or_procedures)
        (and (not patient_is_mentally_competent_now)
             legally_authorized_representative_has_provided_written_informed_consent))
     :named REQ9_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must ((be able to understand the study requirements AND the treatment procedures AND provide written informed consent before any study-specific tests or procedures are performed IF the patient is mentally competent) OR (the legally authorized representative of the patient must provide written informed consent IF the patient is mentally incompetent))."
