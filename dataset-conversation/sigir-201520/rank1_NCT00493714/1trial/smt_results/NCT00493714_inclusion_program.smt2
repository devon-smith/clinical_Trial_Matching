;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_secondary_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of secondary malignant neoplastic disease (metastatic cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of secondary malignant neoplastic disease (metastatic cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of secondary malignant neoplastic disease (metastatic cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of secondary malignant neoplastic neoplastic disease (metastatic cancer)."}
(declare-const patient_has_finding_of_locally_recurrent_cancer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has locally recurrent cancer.","when_to_set_to_false":"Set to false if the patient currently does not have locally recurrent cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has locally recurrent cancer.","meaning":"Boolean indicating whether the patient currently has locally recurrent cancer."}

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_has_finding_of_locally_recurrent_cancer_now
         patient_has_diagnosis_of_secondary_malignant_neoplastic_disease_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (locally recurrent cancer OR metastatic cancer)."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_delirium_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had delirium at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had delirium at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had delirium.","meaning":"Boolean indicating whether the patient has ever had delirium in their history."} ;; "a history of an episode of delirium"
(declare-const patient_has_finding_of_delirium_inthehistory@@occurred_during_current_inpatient_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient's episode of delirium occurred during the current inpatient admission.","when_to_set_to_false":"Set to false if the patient's episode of delirium did not occur during the current inpatient admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the episode of delirium occurred during the current inpatient admission.","meaning":"Boolean indicating whether the patient's episode of delirium occurred during the current inpatient admission."} ;; "a history of an episode of delirium during the patient's current inpatient admission"
(declare-const patient_has_diagnosis_of_delirium_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of delirium.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of delirium.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of delirium.","meaning":"Boolean indicating whether the patient currently has a diagnosis of delirium."} ;; "diagnosis of delirium"
(declare-const patient_has_diagnosis_of_delirium_now@@diagnosed_by_palliative_care_specialist Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of delirium was made by at least one palliative care specialist.","when_to_set_to_false":"Set to false if the patient's diagnosis of delirium was not made by a palliative care specialist.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was made by a palliative care specialist.","meaning":"Boolean indicating whether the patient's diagnosis of delirium was made by a palliative care specialist."} ;; "diagnosis of delirium made by at least one of the palliative care specialists"
(declare-const patient_has_diagnosis_of_delirium_now@@diagnosed_according_to_dsm_iv_tr_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of delirium was made according to DSM-IV-TR criteria.","when_to_set_to_false":"Set to false if the patient's diagnosis of delirium was not made according to DSM-IV-TR criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was made according to DSM-IV-TR criteria.","meaning":"Boolean indicating whether the patient's diagnosis of delirium was made according to DSM-IV-TR criteria."} ;; "diagnosis of delirium made ... according to Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition, Text Revision criteria"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_delirium_inthehistory@@occurred_during_current_inpatient_admission
         patient_has_finding_of_delirium_inthehistory)
     :named REQ1_AUXILIARY0)) ;; "episode of delirium during the patient's current inpatient admission" implies "history of delirium"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_delirium_now@@diagnosed_by_palliative_care_specialist
         patient_has_diagnosis_of_delirium_now)
     :named REQ1_AUXILIARY1)) ;; "diagnosis of delirium made by palliative care specialist" implies "diagnosis of delirium"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_delirium_now@@diagnosed_according_to_dsm_iv_tr_criteria
         patient_has_diagnosis_of_delirium_now)
     :named REQ1_AUXILIARY2)) ;; "diagnosis of delirium made according to DSM-IV-TR criteria" implies "diagnosis of delirium"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: history of an episode of delirium during current inpatient admission
(assert
  (! patient_has_finding_of_delirium_inthehistory@@occurred_during_current_inpatient_admission
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "a history of an episode of delirium during the patient's current inpatient admission"

;; Component 1: diagnosis of delirium made by at least one palliative care specialist according to DSM-IV-TR criteria
(assert
  (! (and patient_has_diagnosis_of_delirium_now@@diagnosed_by_palliative_care_specialist
          patient_has_diagnosis_of_delirium_now@@diagnosed_according_to_dsm_iv_tr_criteria)
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "diagnosis of delirium made by at least one of the palliative care specialists according to DSM-IV-TR criteria"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const days_since_delirium_remission_to_study_approach_value_recorded_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days between the patient's complete recovery from delirium and the time the patient was approached for study inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days elapsed between delirium remission and study approach.","meaning":"Numeric value indicating the number of days between delirium remission and study approach. Unit: days."} ;; "the patient must be approached within 3 days for the possibility of inclusion in the study"
(declare-const patient_approached_for_study_inclusion_within_3_days_of_delirium_remission Bool) ;; {"when_to_set_to_true":"Set to true if the patient was approached for study inclusion within 3 days after complete recovery from delirium.","when_to_set_to_false":"Set to false if the patient was not approached for study inclusion within 3 days after complete recovery from delirium.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was approached for study inclusion within 3 days after complete recovery from delirium.","meaning":"Boolean indicating whether the patient was approached for study inclusion within 3 days after complete recovery from delirium."} ;; "the patient must be approached within 3 days for the possibility of inclusion in the study"
(declare-const patient_has_finding_of_delirium_in_remission_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has complete recovery (remission) from an episode of delirium.","when_to_set_to_false":"Set to false if the patient currently does not have complete recovery (remission) from an episode of delirium.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has complete recovery (remission) from an episode of delirium.","meaning":"Boolean indicating whether the patient currently has complete recovery (remission) from an episode of delirium."} ;; "complete recovery from the episode of delirium"
(declare-const patient_has_finding_of_delirium_in_remission_now@@diagnosed_according_to_dsm_iv_tr_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's delirium remission is diagnosed according to DSM-IV-TR criteria.","when_to_set_to_false":"Set to false if the patient's delirium remission is not diagnosed according to DSM-IV-TR criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether DSM-IV-TR criteria were used for diagnosis.","meaning":"Boolean indicating whether the patient's delirium remission diagnosis was made according to DSM-IV-TR criteria."} ;; "diagnosis of complete resolution of all symptoms of delirium according to Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition, Text Revision criteria"
(declare-const patient_has_finding_of_delirium_in_remission_now@@diagnosed_by_at_least_one_palliative_care_specialist Bool) ;; {"when_to_set_to_true":"Set to true if the patient's delirium remission is diagnosed by at least one palliative care specialist.","when_to_set_to_false":"Set to false if the patient's delirium remission is not diagnosed by at least one palliative care specialist.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a palliative care specialist made the diagnosis.","meaning":"Boolean indicating whether the patient's delirium remission diagnosis was made by at least one palliative care specialist."} ;; "diagnosis of complete resolution of all symptoms of delirium ... by at least one of the palliative care specialists"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_delirium_in_remission_now@@diagnosed_according_to_dsm_iv_tr_criteria
         patient_has_finding_of_delirium_in_remission_now)
     :named REQ2_AUXILIARY0)) ;; "diagnosis of complete resolution of all symptoms of delirium according to DSM-IV-TR criteria"

(assert
  (! (=> patient_has_finding_of_delirium_in_remission_now@@diagnosed_by_at_least_one_palliative_care_specialist
         patient_has_finding_of_delirium_in_remission_now)
     :named REQ2_AUXILIARY1)) ;; "diagnosis of complete resolution of all symptoms of delirium ... by at least one of the palliative care specialists"

;; Definition: patient_approached_for_study_inclusion_within_3_days_of_delirium_remission is true iff days_since_delirium_remission_to_study_approach_value_recorded_in_days ≤ 3
(assert
  (! (= patient_approached_for_study_inclusion_within_3_days_of_delirium_remission
        (<= days_since_delirium_remission_to_study_approach_value_recorded_in_days 3.0))
     :named REQ2_AUXILIARY2)) ;; "the patient must be approached within 3 days for the possibility of inclusion in the study"

;; ===================== Constraint Assertions (REQ 2) =====================
;; If the patient has complete recovery from delirium (diagnosed by DSM-IV-TR criteria by at least one palliative care specialist), then the patient must be approached within 3 days for study inclusion.
(assert
  (! (=> (and patient_has_finding_of_delirium_in_remission_now@@diagnosed_according_to_dsm_iv_tr_criteria
              patient_has_finding_of_delirium_in_remission_now@@diagnosed_by_at_least_one_palliative_care_specialist)
         patient_approached_for_study_inclusion_within_3_days_of_delirium_remission)
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient has complete recovery from the episode of delirium (defined as diagnosis ... by at least one of the palliative care specialists), the patient must be approached within 3 days for the possibility of inclusion in the study"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_ability_to_communicate_in_english_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the ability to communicate in the English language.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to communicate in the English language.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to communicate in the English language.","meaning":"Boolean indicating whether the patient currently has the ability to communicate in the English language."} ;; "the patient must have the ability to communicate in the English language"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_ability_to_communicate_in_english_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have the ability to communicate in the English language"

;; ===================== Declarations for the inclusion criterion (REQ 4) =====================
(declare-const caregiver_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the caregiver's age in years as recorded at the current time.","when_to_set_to_null":"Set to null if the caregiver's age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the age in years of the caregiver at the current time."} ;; "a caregiver who is aged ≥ 18 years"
(declare-const caregiver_is_able_to_communicate_in_english_now Bool) ;; {"when_to_set_to_true":"Set to true if the caregiver is able to communicate in English at the current time.","when_to_set_to_false":"Set to false if the caregiver is not able to communicate in English at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the caregiver is able to communicate in English at the current time.","meaning":"Boolean indicating whether the caregiver is able to communicate in the English language at the current time."} ;; "a caregiver who is able to communicate in the English language"
(declare-const caregiver_is_able_to_comprehend_assessment_questionnaire_now Bool) ;; {"when_to_set_to_true":"Set to true if the caregiver is able to comprehend the assessment questionnaire at the current time.","when_to_set_to_false":"Set to false if the caregiver is not able to comprehend the assessment questionnaire at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the caregiver is able to comprehend the assessment questionnaire at the current time.","meaning":"Boolean indicating whether the caregiver is able to comprehend the assessment questionnaire at the current time."} ;; "a caregiver who is able to comprehend the assessment questionnaire"
(declare-const caregiver_bedside_duration_value_each_day_during_delirium_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours per day the caregiver is at the bedside during the episode of delirium.","when_to_set_to_null":"Set to null if the number of hours per day the caregiver is at the bedside during the episode of delirium is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of hours per day the caregiver is at the bedside during the episode of delirium."} ;; "a caregiver who is at the bedside for a significant length of time (approximately 4 hours) each day during the episode of delirium"
(declare-const patient_agrees_to_participate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to participate at the current time.","when_to_set_to_false":"Set to false if the patient does not agree to participate at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to participate at the current time.","meaning":"Boolean indicating whether the patient agrees to participate at the current time."} ;; "the patient agrees to participate"
(declare-const caregiver_agrees_to_participate_now Bool) ;; {"when_to_set_to_true":"Set to true if the caregiver agrees to participate at the current time.","when_to_set_to_false":"Set to false if the caregiver does not agree to participate at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the caregiver agrees to participate at the current time.","meaning":"Boolean indicating whether the caregiver agrees to participate at the current time."} ;; "the caregiver of the patient agrees to participate"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: Caregiver must be aged ≥ 18 years
(assert
  (! (>= caregiver_age_value_recorded_now_in_years 18.0)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "a caregiver who is aged ≥ 18 years"

;; Component 1: Caregiver must be able to communicate in English
(assert
  (! caregiver_is_able_to_communicate_in_english_now
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "a caregiver who is able to communicate in the English language"

;; Component 2: Caregiver must be able to comprehend the assessment questionnaire
(assert
  (! caregiver_is_able_to_comprehend_assessment_questionnaire_now
     :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "a caregiver who is able to comprehend the assessment questionnaire"

;; Component 3: Caregiver must be at the bedside for approximately 4 hours each day during delirium
(assert
  (! (>= caregiver_bedside_duration_value_each_day_during_delirium_in_hours 4.0)
     :named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "a caregiver who is at the bedside for a significant length of time (approximately 4 hours) each day during the episode of delirium"

;; Component 4: Patient must agree to participate
(assert
  (! patient_agrees_to_participate_now
     :named REQ4_COMPONENT4_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient agrees to participate"

;; Component 5: Caregiver must agree to participate
(assert
  (! caregiver_agrees_to_participate_now
     :named REQ4_COMPONENT5_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the caregiver of the patient agrees to participate"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_signed_written_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed written informed consent at the current time.","when_to_set_to_false":"Set to false if the patient has not signed written informed consent at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed written informed consent at the current time.","meaning":"Boolean indicating whether the patient has signed written informed consent at the current time."} ;; "the patient must have written informed consent signed by the patient"
(declare-const caregiver_has_signed_written_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the participating caregiver has signed written informed consent at the current time.","when_to_set_to_false":"Set to false if the participating caregiver has not signed written informed consent at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the participating caregiver has signed written informed consent at the current time.","meaning":"Boolean indicating whether the participating caregiver has signed written informed consent at the current time."} ;; "the patient must have written informed consent signed by the participating caregiver"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: patient must have written informed consent signed by the patient
(assert
  (! patient_has_signed_written_informed_consent_now
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have written informed consent signed by the patient"

;; Component 1: patient must have written informed consent signed by the participating caregiver
(assert
  (! caregiver_has_signed_written_informed_consent_now
     :named REQ5_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have written informed consent signed by the participating caregiver"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_memorial_delirium_assessment_scale_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured value if a Memorial Delirium Assessment Scale score is recorded for the patient now.","when_to_set_to_null":"Set to null if no Memorial Delirium Assessment Scale score is recorded for the patient now or the value is indeterminate.","meaning":"Numeric value representing the patient's current Memorial Delirium Assessment Scale score."} ;; "Memorial Delirium Assessment Scale score"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (< patient_memorial_delirium_assessment_scale_score_value_recorded_now_withunit_score 13.0)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a Memorial Delirium Assessment Scale score < 13."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_finding_of_inpatient_palliative_care_unit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently recruited from the inpatient palliative care unit.","when_to_set_to_false":"Set to false if the patient is currently not recruited from the inpatient palliative care unit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently recruited from the inpatient palliative care unit.","meaning":"Boolean indicating whether the patient is currently recruited from the inpatient palliative care unit."} ;; "inpatient palliative care unit"
(declare-const patient_has_finding_of_palliative_care_mobile_team_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently recruited from the palliative care mobile team.","when_to_set_to_false":"Set to false if the patient is currently not recruited from the palliative care mobile team.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently recruited from the palliative care mobile team.","meaning":"Boolean indicating whether the patient is currently recruited from the palliative care mobile team."} ;; "palliative care mobile team"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: To be included, the patient must be recruited from (the palliative care mobile team OR the inpatient palliative care unit).
(assert
  (! (or patient_has_finding_of_palliative_care_mobile_team_now
         patient_has_finding_of_inpatient_palliative_care_unit_now)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be recruited from (the palliative care mobile team OR the inpatient palliative care unit)."
