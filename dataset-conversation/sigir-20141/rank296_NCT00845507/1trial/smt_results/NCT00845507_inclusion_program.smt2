;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years AND ≤ 55 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 55)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 55 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_bipolar_i_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with bipolar I disorder at any time in the past, regardless of current status.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with bipolar I disorder at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with bipolar I disorder.","meaning":"Boolean indicating whether the patient has ever been diagnosed with bipolar I disorder at any time in the past."} // "bipolar I disorder"
(declare-const patient_has_diagnosis_of_bipolar_i_disorder_inthehistory@@defined_by_dsm_iv_tr_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of bipolar I disorder is defined by DSM-IV-TR criteria.","when_to_set_to_false":"Set to false if the diagnosis of bipolar I disorder is not defined by DSM-IV-TR criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is defined by DSM-IV-TR criteria.","meaning":"Boolean indicating whether the diagnosis of bipolar I disorder is defined by DSM-IV-TR criteria."} // "as defined by Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition, Text Revision criteria"
(declare-const patient_has_diagnosis_of_bipolar_i_disorder_inthehistory@@diagnosed_using_structured_clinical_interview_for_dsm_iv Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of bipolar I disorder was made using the Structured Clinical Interview for DSM-IV.","when_to_set_to_false":"Set to false if the diagnosis of bipolar I disorder was not made using the Structured Clinical Interview for DSM-IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was made using the Structured Clinical Interview for DSM-IV.","meaning":"Boolean indicating whether the diagnosis of bipolar I disorder was made using the Structured Clinical Interview for DSM-IV."} // "diagnosed using the Structured Clinical Interview for DSM-IV"

(declare-const patient_has_diagnosis_of_schizophrenia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with schizophrenia at any time in the past, regardless of current status.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with schizophrenia at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with schizophrenia.","meaning":"Boolean indicating whether the patient has ever been diagnosed with schizophrenia at any time in the past."} // "schizophrenia"
(declare-const patient_has_diagnosis_of_schizophrenia_inthehistory@@defined_by_dsm_iv_tr_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of schizophrenia is defined by DSM-IV-TR criteria.","when_to_set_to_false":"Set to false if the diagnosis of schizophrenia is not defined by DSM-IV-TR criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is defined by DSM-IV-TR criteria.","meaning":"Boolean indicating whether the diagnosis of schizophrenia is defined by DSM-IV-TR criteria."} // "as defined by Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition, Text Revision criteria"
(declare-const patient_has_diagnosis_of_schizophrenia_inthehistory@@diagnosed_using_structured_clinical_interview_for_dsm_iv Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of schizophrenia was made using the Structured Clinical Interview for DSM-IV.","when_to_set_to_false":"Set to false if the diagnosis of schizophrenia was not made using the Structured Clinical Interview for DSM-IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was made using the Structured Clinical Interview for DSM-IV.","meaning":"Boolean indicating whether the diagnosis of schizophrenia was made using the Structured Clinical Interview for DSM-IV."} // "diagnosed using the Structured Clinical Interview for DSM-IV"

(declare-const patient_has_diagnosis_of_schizoaffective_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with schizoaffective disorder at any time in the past, regardless of current status.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with schizoaffective disorder at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with schizoaffective disorder.","meaning":"Boolean indicating whether the patient has ever been diagnosed with schizoaffective disorder at any time in the past."} // "schizoaffective disorder"
(declare-const patient_has_diagnosis_of_schizoaffective_disorder_inthehistory@@defined_by_dsm_iv_tr_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of schizoaffective disorder is defined by DSM-IV-TR criteria.","when_to_set_to_false":"Set to false if the diagnosis of schizoaffective disorder is not defined by DSM-IV-TR criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is defined by DSM-IV-TR criteria.","meaning":"Boolean indicating whether the diagnosis of schizoaffective disorder is defined by DSM-IV-TR criteria."} // "as defined by Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition, Text Revision criteria"
(declare-const patient_has_diagnosis_of_schizoaffective_disorder_inthehistory@@diagnosed_using_structured_clinical_interview_for_dsm_iv Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of schizoaffective disorder was made using the Structured Clinical Interview for DSM-IV.","when_to_set_to_false":"Set to false if the diagnosis of schizoaffective disorder was not made using the Structured Clinical Interview for DSM-IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was made using the Structured Clinical Interview for DSM-IV.","meaning":"Boolean indicating whether the diagnosis of schizoaffective disorder was made using the Structured Clinical Interview for DSM-IV."} // "diagnosed using the Structured Clinical Interview for DSM-IV"

(declare-const patient_has_diagnosis_of_major_depressive_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with major depressive disorder at any time in the past, regardless of current status.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with major depressive disorder at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with major depressive disorder.","meaning":"Boolean indicating whether the patient has ever been diagnosed with major depressive disorder at any time in the past."} // "major depressive disorder"
(declare-const patient_has_diagnosis_of_major_depressive_disorder_inthehistory@@defined_by_dsm_iv_tr_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of major depressive disorder is defined by DSM-IV-TR criteria.","when_to_set_to_false":"Set to false if the diagnosis of major depressive disorder is not defined by DSM-IV-TR criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is defined by DSM-IV-TR criteria.","meaning":"Boolean indicating whether the diagnosis of major depressive disorder is defined by DSM-IV-TR criteria."} // "as defined by Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition, Text Revision criteria"
(declare-const patient_has_diagnosis_of_major_depressive_disorder_inthehistory@@diagnosed_using_structured_clinical_interview_for_dsm_iv Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of major depressive disorder was made using the Structured Clinical Interview for DSM-IV.","when_to_set_to_false":"Set to false if the diagnosis of major depressive disorder was not made using the Structured Clinical Interview for DSM-IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was made using the Structured Clinical Interview for DSM-IV.","meaning":"Boolean indicating whether the diagnosis of major depressive disorder was made using the Structured Clinical Interview for DSM-IV."} // "diagnosed using the Structured Clinical Interview for DSM-IV"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_bipolar_i_disorder_inthehistory@@defined_by_dsm_iv_tr_criteria
         patient_has_diagnosis_of_bipolar_i_disorder_inthehistory)
     :named REQ1_AUXILIARY0)) ;; "diagnosis of bipolar I disorder is defined by DSM-IV-TR criteria"

(assert
  (! (=> patient_has_diagnosis_of_bipolar_i_disorder_inthehistory@@diagnosed_using_structured_clinical_interview_for_dsm_iv
         patient_has_diagnosis_of_bipolar_i_disorder_inthehistory)
     :named REQ1_AUXILIARY1)) ;; "diagnosis of bipolar I disorder was made using the Structured Clinical Interview for DSM-IV"

(assert
  (! (=> patient_has_diagnosis_of_schizophrenia_inthehistory@@defined_by_dsm_iv_tr_criteria
         patient_has_diagnosis_of_schizophrenia_inthehistory)
     :named REQ1_AUXILIARY2)) ;; "diagnosis of schizophrenia is defined by DSM-IV-TR criteria"

(assert
  (! (=> patient_has_diagnosis_of_schizophrenia_inthehistory@@diagnosed_using_structured_clinical_interview_for_dsm_iv
         patient_has_diagnosis_of_schizophrenia_inthehistory)
     :named REQ1_AUXILIARY3)) ;; "diagnosis of schizophrenia was made using the Structured Clinical Interview for DSM-IV"

(assert
  (! (=> patient_has_diagnosis_of_schizoaffective_disorder_inthehistory@@defined_by_dsm_iv_tr_criteria
         patient_has_diagnosis_of_schizoaffective_disorder_inthehistory)
     :named REQ1_AUXILIARY4)) ;; "diagnosis of schizoaffective disorder is defined by DSM-IV-TR criteria"

(assert
  (! (=> patient_has_diagnosis_of_schizoaffective_disorder_inthehistory@@diagnosed_using_structured_clinical_interview_for_dsm_iv
         patient_has_diagnosis_of_schizoaffective_disorder_inthehistory)
     :named REQ1_AUXILIARY5)) ;; "diagnosis of schizoaffective disorder was made using the Structured Clinical Interview for DSM-IV"

(assert
  (! (=> patient_has_diagnosis_of_major_depressive_disorder_inthehistory@@defined_by_dsm_iv_tr_criteria
         patient_has_diagnosis_of_major_depressive_disorder_inthehistory)
     :named REQ1_AUXILIARY6)) ;; "diagnosis of major depressive disorder is defined by DSM-IV-TR criteria"

(assert
  (! (=> patient_has_diagnosis_of_major_depressive_disorder_inthehistory@@diagnosed_using_structured_clinical_interview_for_dsm_iv
         patient_has_diagnosis_of_major_depressive_disorder_inthehistory)
     :named REQ1_AUXILIARY7)) ;; "diagnosis of major depressive disorder was made using the Structured Clinical Interview for DSM-IV"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: At least one of the four disorders, defined by DSM-IV-TR criteria
(assert
  (! (or patient_has_diagnosis_of_bipolar_i_disorder_inthehistory@@defined_by_dsm_iv_tr_criteria
         patient_has_diagnosis_of_schizophrenia_inthehistory@@defined_by_dsm_iv_tr_criteria
         patient_has_diagnosis_of_schizoaffective_disorder_inthehistory@@defined_by_dsm_iv_tr_criteria
         patient_has_diagnosis_of_major_depressive_disorder_inthehistory@@defined_by_dsm_iv_tr_criteria)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "at least one of the following (bipolar I disorder OR schizophrenia OR schizoaffective disorder OR major depressive disorder) as defined by DSM-IV-TR criteria"

;; Component 1: Diagnosed using the Structured Clinical Interview for DSM-IV for at least one of the four disorders
(assert
  (! (or patient_has_diagnosis_of_bipolar_i_disorder_inthehistory@@diagnosed_using_structured_clinical_interview_for_dsm_iv
         patient_has_diagnosis_of_schizophrenia_inthehistory@@diagnosed_using_structured_clinical_interview_for_dsm_iv
         patient_has_diagnosis_of_schizoaffective_disorder_inthehistory@@diagnosed_using_structured_clinical_interview_for_dsm_iv
         patient_has_diagnosis_of_major_depressive_disorder_inthehistory@@diagnosed_using_structured_clinical_interview_for_dsm_iv)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "diagnosed using the Structured Clinical Interview for DSM-IV"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_young_mania_rating_scale_score_value_recorded_at_screening_visit_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's Young Mania Rating Scale score is recorded at the screening visit.","when_to_set_to_null":"Set to null if no such score is recorded at the screening visit or the value is indeterminate.","meaning":"Numeric value representing the patient's Young Mania Rating Scale score measured at the screening visit, in units of score."} // "Young Mania Rating Scale score < 16 at screening visit"
(declare-const patient_young_mania_rating_scale_score_value_recorded_at_baseline_visit_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's Young Mania Rating Scale score is recorded at the baseline visit.","when_to_set_to_null":"Set to null if no such score is recorded at the baseline visit or the value is indeterminate.","meaning":"Numeric value representing the patient's Young Mania Rating Scale score measured at the baseline visit, in units of score."} // "Young Mania Rating Scale score < 16 at baseline visit"
(declare-const patient_madrs_montgomery_asberg_depression_rating_scale_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's Montgomery-Asberg Depression Rating Scale score is recorded now.","when_to_set_to_null":"Set to null if no such score is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's Montgomery-Asberg Depression Rating Scale score measured now."} // "Montgomery-Asberg Depression Rating Scale score < 24"
(declare-const patient_madrs_montgomery_asberg_depression_rating_scale_score_value_recorded_now_withunit_score@@measured_at_screening_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient's Montgomery-Asberg Depression Rating Scale score measured now is specifically recorded at the screening visit.","when_to_set_to_false":"Set to false if the score measured now is not recorded at the screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the score measured now is recorded at the screening visit.","meaning":"Boolean indicating whether the patient's Montgomery-Asberg Depression Rating Scale score measured now is recorded at the screening visit."} // "Montgomery-Asberg Depression Rating Scale score < 24 at screening visit"
(declare-const patient_madrs_montgomery_asberg_depression_rating_scale_score_value_recorded_now_withunit_score@@measured_at_baseline_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient's Montgomery-Asberg Depression Rating Scale score measured now is specifically recorded at the baseline visit.","when_to_set_to_false":"Set to false if the score measured now is not recorded at the baseline visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the score measured now is recorded at the baseline visit.","meaning":"Boolean indicating whether the patient's Montgomery-Asberg Depression Rating Scale score measured now is recorded at the baseline visit."} // "Montgomery-Asberg Depression Rating Scale score < 24 at baseline visit"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Young Mania Rating Scale score < 16 at screening visit
(assert
  (! (< patient_young_mania_rating_scale_score_value_recorded_at_screening_visit_withunit_score 16)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "Young Mania Rating Scale score < 16 at screening visit"

;; Component 1: Young Mania Rating Scale score < 16 at baseline visit
(assert
  (! (< patient_young_mania_rating_scale_score_value_recorded_at_baseline_visit_withunit_score 16)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "Young Mania Rating Scale score < 16 at baseline visit"

;; Component 2: Montgomery-Asberg Depression Rating Scale score < 24 at screening visit
(assert
  (! (and patient_madrs_montgomery_asberg_depression_rating_scale_score_value_recorded_now_withunit_score@@measured_at_screening_visit
          (< patient_madrs_montgomery_asberg_depression_rating_scale_score_value_recorded_now_withunit_score 24))
     :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "Montgomery-Asberg Depression Rating Scale score < 24 at screening visit"

;; Component 3: Montgomery-Asberg Depression Rating Scale score < 24 at baseline visit
(assert
  (! (and patient_madrs_montgomery_asberg_depression_rating_scale_score_value_recorded_now_withunit_score@@measured_at_baseline_visit
          (< patient_madrs_montgomery_asberg_depression_rating_scale_score_value_recorded_now_withunit_score 24))
     :named REQ2_COMPONENT3_OTHER_REQUIREMENTS)) ;; "Montgomery-Asberg Depression Rating Scale score < 24 at baseline visit"

;; --- verifier-bypassed (attempt 8/8) 2025-10-24T04:37:22.753648 policy=eventual
;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const scale_for_the_assessment_of_positive_symptoms_subscale_score_value_recorded_now_withunit_points Real) ;; {"when_to_set_to_value":"Set to the numeric value of the score (in points) for each subscale of the Scale for the Assessment of Positive Symptoms as recorded now.","when_to_set_to_null":"Set to null if the score for any subscale is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the score (in points) for each subscale of the Scale for the Assessment of Positive Symptoms at the current time."} // "Scale for the Assessment of Positive Symptoms score < 2 on all subscales"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (< scale_for_the_assessment_of_positive_symptoms_subscale_score_value_recorded_now_withunit_points 2)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "Scale for the Assessment of Positive Symptoms score < 2 on all subscales"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_body_weight_value_after_olanzapine_withunit_kg Real) ;; {"when_to_set_to_value":"Set to the measured value (in kg) if the patient's body weight after olanzapine treatment is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value (kg) representing the patient's body weight after olanzapine treatment."} // "gained > 7 % of body weight following treatment with olanzapine"
(declare-const patient_body_weight_value_prior_to_olanzapine_withunit_kg Real) ;; {"when_to_set_to_value":"Set to the measured value (in kg) if the patient's body weight prior to olanzapine treatment is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value (kg) representing the patient's body weight prior to olanzapine treatment."} // "gained > 7 % of body weight following treatment with olanzapine"
(declare-const patient_body_weight_value_recorded_inthehistory_withunit_kg Real) ;; {"when_to_set_to_value":"Set to the measured value (in kg) if a body weight measurement is recorded at any time in the patient's history.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value (kg) representing the patient's body weight recorded at any time in history."} // "body weight"
(declare-const patient_body_weight_value_recorded_inthehistory_withunit_kg@@documented_in_medical_records_or_by_patient_report Bool) ;; {"when_to_set_to_true":"Set to true if the body weight value (or the calculated weight gain) is documented in medical records or by patient report.","when_to_set_to_false":"Set to false if the body weight value (or the calculated weight gain) is not documented in medical records or by patient report.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the documentation source is medical records or patient report.","meaning":"Boolean indicating whether the body weight value or weight gain is documented in medical records or by patient report."} // "documented in medical records OR by patient report"
(declare-const patient_has_received_olanzapine_treatment_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received olanzapine treatment at any time in the past.","when_to_set_to_false":"Set to false if the patient has never received olanzapine treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received olanzapine treatment in the past.","meaning":"Boolean indicating whether the patient has received olanzapine treatment in the history."} // "following treatment with olanzapine"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition: patient gained > 7% of body weight following olanzapine
(define-fun patient_has_gained_more_than_7_percent_body_weight_after_olanzapine () Bool
  (> patient_body_weight_value_after_olanzapine_withunit_kg
     (+ patient_body_weight_value_prior_to_olanzapine_withunit_kg
        (* 0.07 patient_body_weight_value_prior_to_olanzapine_withunit_kg)))) ;; "gained > 7 % of body weight following treatment with olanzapine"

;; Qualifier variable implies documentation source
(assert
  (! (=> patient_body_weight_value_recorded_inthehistory_withunit_kg@@documented_in_medical_records_or_by_patient_report
         true)
     :named REQ4_AUXILIARY0)) ;; "documented in medical records OR by patient report"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: Must have gained >7% body weight after olanzapine, and this must be documented in medical records or by patient report
(assert
  (! (and patient_has_received_olanzapine_treatment_in_the_history
          patient_has_gained_more_than_7_percent_body_weight_after_olanzapine
          patient_body_weight_value_recorded_inthehistory_withunit_kg@@documented_in_medical_records_or_by_patient_report)
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have gained > 7 % of body weight following treatment with olanzapine as either documented in medical records or by patient report."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter Real) ;; {"when_to_set_to_value":"Set to the measured BMI value in kilograms per square meter if a current measurement is available.","when_to_set_to_null":"Set to null if no current BMI measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kilograms per square meter."} // "body mass index"
(declare-const patient_has_finding_of_obesity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of obesity.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of obesity.","meaning":"Boolean indicating whether the patient currently has obesity."} // "obesity"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definition in the requirement: "obesity, as defined by current body mass index > 30 kilograms per square meter"
(assert
  (! (= patient_has_finding_of_obesity_now
        (> patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 30.0))
     :named REQ5_AUXILIARY0)) ;; "obesity, as defined by current body mass index > 30 kilograms per square meter"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_finding_of_obesity_now
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have obesity, as defined by current body mass index > 30 kilograms per square meter."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_signed_informed_consent_document_after_trial_nature_fully_explained Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed the informed consent document and this signing occurred after the nature of the trial was fully explained to the patient.","when_to_set_to_false":"Set to false if the patient has not signed the informed consent document after the nature of the trial was fully explained, or if the document was signed before the nature of the trial was fully explained.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient signed the informed consent document after the nature of the trial was fully explained.","meaning":"Boolean indicating whether the patient has signed the informed consent document after the nature of the trial has been fully explained."} // "the patient must sign the informed consent document after the nature of the trial has been fully explained."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_has_signed_informed_consent_document_after_trial_nature_fully_explained
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must sign the informed consent document after the nature of the trial has been fully explained."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} // "if the patient is female"
(declare-const patient_has_finding_of_postmenopausal_status_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has postmenopausal status.","when_to_set_to_false":"Set to false if the patient currently does not have postmenopausal status.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has postmenopausal status.","meaning":"Boolean indicating whether the patient currently has postmenopausal status."} // "postmenopausal status"
(declare-const patient_has_finding_of_surgical_incapacity_for_childbearing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has surgical incapacity for childbearing.","when_to_set_to_false":"Set to false if the patient currently does not have surgical incapacity for childbearing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has surgical incapacity for childbearing.","meaning":"Boolean indicating whether the patient currently has surgical incapacity for childbearing."} // "surgical incapacity for childbearing"
(declare-const patient_is_practicing_hormonal_contraception_method_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently practicing a hormonal contraception method.","when_to_set_to_false":"Set to false if the patient is currently not practicing a hormonal contraception method.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently practicing a hormonal contraception method.","meaning":"Boolean indicating whether the patient is currently practicing a hormonal contraception method."} // "hormonal contraception method"
(declare-const patient_is_practicing_hormonal_contraception_method_now@@medically_acceptable_method Bool) ;; {"when_to_set_to_true":"Set to true if the hormonal contraception method practiced by the patient is medically acceptable.","when_to_set_to_false":"Set to false if the hormonal contraception method practiced by the patient is not medically acceptable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hormonal contraception method practiced by the patient is medically acceptable.","meaning":"Boolean indicating whether the hormonal contraception method practiced by the patient is medically acceptable."} // "medically acceptable method of contraception"
(declare-const patient_is_practicing_hormonal_contraception_method_now@@used_for_at_least_1_month_prior_to_study_entry_and_throughout_study Bool) ;; {"when_to_set_to_true":"Set to true if the hormonal contraception method has been used for at least 1 month prior to study entry and will be used throughout the study.","when_to_set_to_false":"Set to false if the hormonal contraception method has not been used for at least 1 month prior to study entry and/or will not be used throughout the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hormonal contraception method has been used for at least 1 month prior to study entry and will be used throughout the study.","meaning":"Boolean indicating whether the hormonal contraception method has been used for at least 1 month prior to study entry and will be used throughout the study."} // "for ≥ 1 month prior to study entry AND throughout the study"
(declare-const patient_has_finding_of_iud_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently practicing contraception using an intrauterine device (IUD).","when_to_set_to_false":"Set to false if the patient is currently not practicing contraception using an intrauterine device (IUD).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently practicing contraception using an intrauterine device (IUD).","meaning":"Boolean indicating whether the patient is currently practicing contraception using an intrauterine device (IUD)."} // "intrauterine device"
(declare-const patient_has_finding_of_iud_contraception_now@@used_for_at_least_1_month_prior_to_study_entry_and_throughout_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently practicing contraception using an intrauterine device (IUD) and the IUD has been used for at least 1 month prior to study entry and will be used throughout the study.","when_to_set_to_false":"Set to false if the patient is currently practicing contraception using an intrauterine device (IUD) but the duration requirement (at least 1 month prior and throughout the study) is not met.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the duration requirement for IUD use is met.","meaning":"Boolean indicating whether the patient is currently practicing contraception using an intrauterine device (IUD) and the IUD has been used for at least 1 month prior to study entry and will be used throughout the study."} // "for ≥ 1 month prior to study entry AND throughout the study"
(declare-const patient_is_practicing_abstinence_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently practicing abstinence as a method of contraception.","when_to_set_to_false":"Set to false if the patient is currently not practicing abstinence as a method of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently practicing abstinence as a method of contraception.","meaning":"Boolean indicating whether the patient is currently practicing abstinence as a method of contraception."} // "abstinence"
(declare-const patient_is_practicing_abstinence_now@@medically_acceptable_method Bool) ;; {"when_to_set_to_true":"Set to true if abstinence practiced by the patient is considered a medically acceptable method of contraception.","when_to_set_to_false":"Set to false if abstinence practiced by the patient is not considered a medically acceptable method of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether abstinence practiced by the patient is considered a medically acceptable method of contraception.","meaning":"Boolean indicating whether abstinence practiced by the patient is considered a medically acceptable method of contraception."} // "medically acceptable method of contraception"
(declare-const patient_is_practicing_abstinence_now@@practiced_for_at_least_1_month_prior_to_study_entry_and_throughout_study Bool) ;; {"when_to_set_to_true":"Set to true if abstinence has been practiced for at least 1 month prior to study entry and will be practiced throughout the study.","when_to_set_to_false":"Set to false if abstinence has not been practiced for at least 1 month prior to study entry and/or will not be practiced throughout the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether abstinence has been practiced for at least 1 month prior to study entry and will be practiced throughout the study.","meaning":"Boolean indicating whether abstinence has been practiced for at least 1 month prior to study entry and will be practiced throughout the study."} // "for ≥ 1 month prior to study entry AND throughout the study"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Non-exhaustive examples: hormonal contraception, IUD, abstinence are examples of medically acceptable contraception
(assert
  (! (=> (or patient_is_practicing_hormonal_contraception_method_now
            patient_has_finding_of_iud_contraception_now
            patient_is_practicing_abstinence_now)
         (or patient_is_practicing_hormonal_contraception_method_now@@medically_acceptable_method
             patient_has_finding_of_iud_contraception_now ;; IUD is always considered medically acceptable in this context
             patient_is_practicing_abstinence_now@@medically_acceptable_method))
     :named REQ7_AUXILIARY0)) ;; "medically acceptable method of contraception (with non-exhaustive examples (hormonal contraception method OR intrauterine device OR abstinence))"

;; Duration qualifiers for hormonal contraception, IUD, and abstinence
(assert
  (! (=> patient_is_practicing_hormonal_contraception_method_now@@used_for_at_least_1_month_prior_to_study_entry_and_throughout_study
         (and patient_is_practicing_hormonal_contraception_method_now
              patient_is_practicing_hormonal_contraception_method_now@@medically_acceptable_method))
     :named REQ7_AUXILIARY1)) ;; "hormonal contraception method for ≥ 1 month prior to study entry AND throughout the study"

(assert
  (! (=> patient_has_finding_of_iud_contraception_now@@used_for_at_least_1_month_prior_to_study_entry_and_throughout_study
         patient_has_finding_of_iud_contraception_now)
     :named REQ7_AUXILIARY2)) ;; "IUD for ≥ 1 month prior to study entry AND throughout the study"

(assert
  (! (=> patient_is_practicing_abstinence_now@@practiced_for_at_least_1_month_prior_to_study_entry_and_throughout_study
         (and patient_is_practicing_abstinence_now
              patient_is_practicing_abstinence_now@@medically_acceptable_method))
     :named REQ7_AUXILIARY3)) ;; "abstinence for ≥ 1 month prior to study entry AND throughout the study"

;; Medically acceptable contraception umbrella: at least one of the three methods (with duration) or any other medically acceptable method
(define-fun patient_is_practicing_medically_acceptable_contraception_for_required_duration () Bool
  (or patient_is_practicing_hormonal_contraception_method_now@@used_for_at_least_1_month_prior_to_study_entry_and_throughout_study
      patient_has_finding_of_iud_contraception_now@@used_for_at_least_1_month_prior_to_study_entry_and_throughout_study
      patient_is_practicing_abstinence_now@@practiced_for_at_least_1_month_prior_to_study_entry_and_throughout_study))

;; ===================== Constraint Assertions (REQ 7) =====================
;; If the patient is female, she must have (postmenopausal status OR surgical incapacity for childbearing OR (be practicing a medically acceptable method of contraception for ≥ 1 month prior to study entry AND throughout the study))
(assert
  (! (or (not patient_sex_is_female_now)
         patient_has_finding_of_postmenopausal_status_now
         patient_has_finding_of_surgical_incapacity_for_childbearing_now
         patient_is_practicing_medically_acceptable_contraception_for_required_duration)
     :named REQ7_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is female, the patient must have (postmenopausal status OR surgical incapacity for childbearing OR (be practicing a medically acceptable method of contraception ... for ≥ 1 month prior to study entry AND throughout the study))"

;; ===================== Declarations for the inclusion criterion (REQ 8) =====================
(declare-const patient_is_exposed_to_olanzapine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking olanzapine.","when_to_set_to_false":"Set to false if the patient is not currently taking olanzapine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking olanzapine.","meaning":"Boolean indicating whether the patient is currently taking olanzapine."} // "on a stable dose of olanzapine for ≥ 14 days"
(declare-const patient_olanzapine_value_recorded_stable_dose_duration_in_days Real) ;; {"when_to_set_to_value":"Set to the number of consecutive days the patient has been on a stable dose of olanzapine.","when_to_set_to_null":"Set to null if the duration is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in days that the patient has been on a stable dose of olanzapine."} // "on a stable dose of olanzapine for ≥ 14 days"
(declare-const patient_olanzapine_value_recorded_historical_dose_withunit_milligrams_per_day Real) ;; {"when_to_set_to_value":"Set to the daily dose (in milligrams per day) of olanzapine the patient has received over the specified historical period.","when_to_set_to_null":"Set to null if the historical dose is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the historical daily dose of olanzapine in milligrams per day over a specified period."} // "dose of olanzapine ≥ 5 milligrams per day AND ≤ 30 milligrams per day for ≥ 1 month"
(declare-const patient_olanzapine_value_recorded_historical_dose_duration_in_months Real) ;; {"when_to_set_to_value":"Set to the number of consecutive months the patient has been on a specified dose of olanzapine.","when_to_set_to_null":"Set to null if the duration is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in months that the patient has been on a specified dose of olanzapine."} // "dose of olanzapine ≥ 5 milligrams per day AND ≤ 30 milligrams per day for ≥ 1 month"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Component 0: "on a stable dose of olanzapine for ≥ 14 days"
(assert
  (! (and patient_is_exposed_to_olanzapine_now
          (>= patient_olanzapine_value_recorded_stable_dose_duration_in_days 14))
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "on a stable dose of olanzapine for ≥ 14 days"

;; Component 1: "have been on a dose of olanzapine ≥ 5 milligrams per day AND ≤ 30 milligrams per day for ≥ 1 month"
(assert
  (! (and (>= patient_olanzapine_value_recorded_historical_dose_withunit_milligrams_per_day 5.0)
          (<= patient_olanzapine_value_recorded_historical_dose_withunit_milligrams_per_day 30.0)
          (>= patient_olanzapine_value_recorded_historical_dose_duration_in_months 1.0))
     :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "have been on a dose of olanzapine ≥ 5 milligrams per day AND ≤ 30 milligrams per day for ≥ 1 month"
