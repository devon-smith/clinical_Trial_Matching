;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a malignant neoplastic disease (malignancy) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a malignant neoplastic disease (malignancy) at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a malignant neoplastic disease (malignancy).","meaning":"Boolean indicating whether the patient has ever been diagnosed with a malignant neoplastic disease (malignancy) at any point in their history."} ;; "To be included, the patient must have been diagnosed with a malignancy."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have been diagnosed with a malignancy."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_informed_consent_obtained_and_signed_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided informed consent and both obtaining and signing of informed consent have occurred.","when_to_set_to_false":"Set to false if the patient has not provided informed consent, or if either obtaining or signing of informed consent has not occurred.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided informed consent and both obtaining and signing have occurred.","meaning":"Boolean indicating whether the patient has provided informed consent, with both obtaining and signing completed."} ;; "To be included, the patient must have provided informed consent (informed consent has been obtained AND informed consent has been signed)."
(declare-const patient_has_informed_consent_obtained_and_signed_now@@obtained Bool) ;; {"when_to_set_to_true":"Set to true if informed consent has been obtained from the patient.","when_to_set_to_false":"Set to false if informed consent has not been obtained from the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether informed consent has been obtained.","meaning":"Boolean indicating whether informed consent has been obtained."} ;; "informed consent has been obtained"
(declare-const patient_has_informed_consent_obtained_and_signed_now@@signed Bool) ;; {"when_to_set_to_true":"Set to true if informed consent has been signed by the patient.","when_to_set_to_false":"Set to false if informed consent has not been signed by the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether informed consent has been signed.","meaning":"Boolean indicating whether informed consent has been signed."} ;; "informed consent has been signed"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; The main variable is true if and only if both obtained and signed are true
(assert
  (! (= patient_has_informed_consent_obtained_and_signed_now
        (and patient_has_informed_consent_obtained_and_signed_now@@obtained
             patient_has_informed_consent_obtained_and_signed_now@@signed))
     :named REQ1_AUXILIARY0)) ;; "informed consent has been obtained AND informed consent has been signed"

;; Qualifier variables imply the main variable
(assert
  (! (=> patient_has_informed_consent_obtained_and_signed_now@@obtained
         patient_has_informed_consent_obtained_and_signed_now)
     :named REQ1_AUXILIARY1)) ;; "informed consent has been obtained" implies "provided informed consent"

(assert
  (! (=> patient_has_informed_consent_obtained_and_signed_now@@signed
         patient_has_informed_consent_obtained_and_signed_now)
     :named REQ1_AUXILIARY2)) ;; "informed consent has been signed" implies "provided informed consent"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_informed_consent_obtained_and_signed_now
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have provided informed consent (informed consent has been obtained AND informed consent has been signed)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged greater than or equal to 18 years"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged greater than or equal to 18 years."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_longevity_value_recorded_now_withunit_months Real) ;; {"when_to_set_to_value":"Set to the measured or clinically estimated value of the patient's life expectancy in months, recorded now.","when_to_set_to_null":"Set to null if no such value is available, indeterminate, or not recorded now.","meaning":"Numeric value representing the patient's current life expectancy in months."} ;; "life expectancy determined to be greater than or equal to 6 months"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (>= patient_longevity_value_recorded_now_withunit_months 6)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a life expectancy determined to be greater than or equal to 6 months."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_major_depressive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of major depressive disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of major depressive disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of major depressive disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of major depressive disorder."} ;; "major depressive disorder"
(declare-const patient_has_diagnosis_of_major_depressive_disorder_now@@diagnosis_based_on_clinical_examination Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of major depressive disorder is based on clinical examination.","when_to_set_to_false":"Set to false if the diagnosis of major depressive disorder is not based on clinical examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is based on clinical examination.","meaning":"Boolean indicating whether the diagnosis of major depressive disorder is based on clinical examination."} ;; "diagnosis based on clinical examination"
(declare-const patient_has_diagnosis_of_major_depressive_disorder_now@@diagnosis_based_on_dsm_iv_tr_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of major depressive disorder is based on DSM-IV-TR criteria.","when_to_set_to_false":"Set to false if the diagnosis of major depressive disorder is not based on DSM-IV-TR criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is based on DSM-IV-TR criteria.","meaning":"Boolean indicating whether the diagnosis of major depressive disorder is based on DSM-IV-TR criteria."} ;; "diagnosis based on Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition, Text Revision criteria"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_major_depressive_disorder_now@@diagnosis_based_on_clinical_examination
         patient_has_diagnosis_of_major_depressive_disorder_now)
     :named REQ4_AUXILIARY0)) ;; "diagnosis based on clinical examination" implies "major depressive disorder"

(assert
  (! (=> patient_has_diagnosis_of_major_depressive_disorder_now@@diagnosis_based_on_dsm_iv_tr_criteria
         patient_has_diagnosis_of_major_depressive_disorder_now)
     :named REQ4_AUXILIARY1)) ;; "diagnosis based on DSM-IV-TR criteria" implies "major depressive disorder"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: Must have diagnosis based on clinical examination
(assert
  (! patient_has_diagnosis_of_major_depressive_disorder_now@@diagnosis_based_on_clinical_examination
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "diagnosis based on clinical examination"

;; Component 1: Must have diagnosis based on DSM-IV-TR criteria
(assert
  (! patient_has_diagnosis_of_major_depressive_disorder_now@@diagnosis_based_on_dsm_iv_tr_criteria
     :named REQ4_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "diagnosis based on Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition, Text Revision criteria"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_depression_screening_using_phq_9_patient_health_questionnaire_9_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's most recent PHQ-9 depression assessment score if recorded now.","when_to_set_to_null":"Set to null if no PHQ-9 depression assessment score is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's most recent PHQ-9 depression assessment score recorded now."} ;; "Patient Health Questionnaire-9 depression assessment with a score greater than or equal to 10"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (>= patient_depression_screening_using_phq_9_patient_health_questionnaire_9_score_value_recorded_now_withunit_score 10)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have completed the Patient Health Questionnaire-9 depression assessment with a score greater than or equal to 10."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_is_able_to_take_whole_tablets_by_mouth_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to take whole tablets by mouth.","when_to_set_to_false":"Set to false if the patient is currently unable to take whole tablets by mouth.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to take whole tablets by mouth.","meaning":"Boolean indicating whether the patient is currently able to take whole tablets by mouth."} ;; "able to take whole tablets by mouth"
(declare-const patient_is_able_to_take_crushed_tablets_by_mouth_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to take crushed tablets by mouth.","when_to_set_to_false":"Set to false if the patient is currently unable to take crushed tablets by mouth.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to take crushed tablets by mouth.","meaning":"Boolean indicating whether the patient is currently able to take crushed tablets by mouth."} ;; "able to take crushed tablets by mouth"
(declare-const patient_is_able_to_take_whole_tablets_by_feeding_tube_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to take whole tablets by feeding tube.","when_to_set_to_false":"Set to false if the patient is currently unable to take whole tablets by feeding tube.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to take whole tablets by feeding tube.","meaning":"Boolean indicating whether the patient is currently able to take whole tablets by feeding tube."} ;; "able to take whole tablets by feeding tube"
(declare-const patient_is_able_to_take_crushed_tablets_by_feeding_tube_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to take crushed tablets by feeding tube.","when_to_set_to_false":"Set to false if the patient is currently unable to take crushed tablets by feeding tube.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to take crushed tablets by feeding tube.","meaning":"Boolean indicating whether the patient is currently able to take crushed tablets by feeding tube."} ;; "able to take crushed tablets by feeding tube"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: To be included, the patient must be able to take (whole tablets by mouth OR crushed tablets by mouth OR whole tablets by feeding tube OR crushed tablets by feeding tube).
(assert
  (! (or patient_is_able_to_take_whole_tablets_by_mouth_now
         patient_is_able_to_take_crushed_tablets_by_mouth_now
         patient_is_able_to_take_whole_tablets_by_feeding_tube_now
         patient_is_able_to_take_crushed_tablets_by_feeding_tube_now)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be able to take (whole tablets by mouth OR crushed tablets by mouth OR whole tablets by feeding tube OR crushed tablets by feeding tube)."
