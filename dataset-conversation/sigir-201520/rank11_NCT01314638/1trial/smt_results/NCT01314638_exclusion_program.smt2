;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_disorder_of_musculoskeletal_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the musculoskeletal system.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the musculoskeletal system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the musculoskeletal system.","meaning":"Boolean indicating whether the patient currently has a disorder of the musculoskeletal system."} ;; "musculoskeletal disorder"
(declare-const patient_has_finding_of_disorder_of_musculoskeletal_system_now@@not_related_to_alzheimers_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient's musculoskeletal disorder is NOT related to Alzheimer's disease.","when_to_set_to_false":"Set to false if the patient's musculoskeletal disorder is related to Alzheimer's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the musculoskeletal disorder is related to Alzheimer's disease.","meaning":"Boolean indicating whether the patient's musculoskeletal disorder is NOT related to Alzheimer's disease."} ;; "musculoskeletal disorder NOT related to Alzheimer's disease"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_of_musculoskeletal_system_now@@not_related_to_alzheimers_disease
      patient_has_finding_of_disorder_of_musculoskeletal_system_now)
:named REQ0_AUXILIARY0)) ;; "musculoskeletal disorder NOT related to Alzheimer's disease" implies "musculoskeletal disorder"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_disorder_of_musculoskeletal_system_now@@not_related_to_alzheimers_disease)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a musculoskeletal disorder NOT related to Alzheimer's disease."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_near_visual_acuity_value_recorded_now_withunit_none Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's near visual acuity recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's near visual acuity measured now."} ;; "near visual acuity"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (< patient_near_visual_acuity_value_recorded_now_withunit_none 2))
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has near visual acuity < 2."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_cerebro_spinal_pathology_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a cerebro-spinal pathology at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a cerebro-spinal pathology at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a cerebro-spinal pathology.","meaning":"Boolean indicating whether the patient has ever had a cerebro-spinal pathology in their medical history."} ;; "the patient has a history of cerebro-spinal pathology"
(declare-const patient_has_finding_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a cerebrovascular accident at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a cerebrovascular accident at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a cerebrovascular accident.","meaning":"Boolean indicating whether the patient has ever had a cerebrovascular accident in their medical history."} ;; "the patient has a history of cerebrovascular accident"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_cerebrovascular_accident_inthehistory)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of cerebrovascular accident."

(assert
(! (not patient_has_finding_of_cerebro_spinal_pathology_inthehistory)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of cerebro-spinal pathology."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_poor_workmanship_of_written_french_language_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has poor workmanship of the written French language.","when_to_set_to_false":"Set to false if the patient currently does not have poor workmanship of the written French language.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has poor workmanship of the written French language.","meaning":"Boolean indicating whether the patient currently has poor workmanship of the written French language."} ;; "poor workmanship of the written French language"
(declare-const patient_has_poor_workmanship_of_oral_french_language_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has poor workmanship of the oral French language.","when_to_set_to_false":"Set to false if the patient currently does not have poor workmanship of the oral French language.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has poor workmanship of the oral French language.","meaning":"Boolean indicating whether the patient currently has poor workmanship of the oral French language."} ;; "poor workmanship of the oral French language"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_poor_workmanship_of_written_french_language_now)
:named REQ3_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has poor workmanship of the written French language."

(assert
(! (not patient_has_poor_workmanship_of_oral_french_language_now)
:named REQ3_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has poor workmanship of the oral French language."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_refuses_to_be_informed_of_possible_hanging_bare_anomaly_during_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient explicitly refuses to be informed about the possibility of a hanging bare anomaly during the study.","when_to_set_to_false":"Set to false if the patient does not refuse to be informed about the possibility of a hanging bare anomaly during the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient refuses to be informed about the possibility of a hanging bare anomaly during the study.","meaning":"Boolean indicating whether the patient refuses to be informed about the possibility of a hanging bare anomaly during the study."} ;; "refuses to be informed on possible hanging bare anomaly during study"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_refuses_to_be_informed_of_possible_hanging_bare_anomaly_during_study)
:named REQ4_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient refuses to be informed on possible hanging bare anomaly during study."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_mini_mental_state_examination_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured score if a Mini-Mental State Examination score is recorded for the patient now.","when_to_set_to_null":"Set to null if no such score is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's Mini-Mental State Examination score recorded now."} ;; "Mini-Mental State Examination"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (< patient_mini_mental_state_examination_score_value_recorded_now_withunit_score 3))
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a score of the Mini-Mental State Examination < 3."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const geriatric_depression_scale_15_item_score_value_recorded_now_withunit_points Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's 15-item Geriatric Depression Scale score recorded now, in points.","when_to_set_to_null":"Set to null if the score is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's 15-item Geriatric Depression Scale score recorded now, in points."} ;; "a score of the 15-item Geriatric Depression Scale > 10"
(declare-const patient_has_finding_of_severe_depression_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of severe depression.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of severe depression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe depression.","meaning":"Boolean indicating whether the patient currently has severe depression now."} ;; "severe depression"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Definition: severe depression = (Geriatric Depression Scale 15-item score > 10)
(assert
(! (= patient_has_finding_of_severe_depression_now
     (> geriatric_depression_scale_15_item_score_value_recorded_now_withunit_points 10))
:named REQ6_AUXILIARY0)) ;; "defined as (a score of the 15-item Geriatric Depression Scale > 10)"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_severe_depression_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe depression defined as (a score of the 15-item Geriatric Depression Scale > 10)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_uses_walking_aid_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently uses a walking aid.","when_to_set_to_false":"Set to false if the patient currently does not use a walking aid.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently uses a walking aid.","meaning":"Boolean indicating whether the patient currently uses a walking aid."} ;; "The patient is excluded if the patient uses a walking aid."

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_uses_walking_aid_now)
:named REQ7_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient uses a walking aid."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_impellent_disturbances_pre_existing Bool) ;; {"when_to_set_to_true":"Set to true if the patient is suffering from impellent disturbances that are pre-existing.","when_to_set_to_false":"Set to false if the patient is not suffering from impellent disturbances that are pre-existing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is suffering from impellent disturbances that are pre-existing.","meaning":"Boolean indicating whether the patient is suffering from impellent disturbances that are pre-existing."} ;; "suffering from pre-existing impellent disturbances"
(declare-const patient_has_finding_of_impellent_disturbances_pre_existing@@pre_existing Bool) ;; {"when_to_set_to_true":"Set to true if the impellent disturbances are pre-existing (present before the current context or intervention).","when_to_set_to_false":"Set to false if the impellent disturbances are not pre-existing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the impellent disturbances are pre-existing.","meaning":"Boolean indicating whether the impellent disturbances are pre-existing."} ;; "pre-existing impellent disturbances"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies the corresponding stem variable
(assert
(! (=> patient_has_finding_of_impellent_disturbances_pre_existing@@pre_existing
       patient_has_finding_of_impellent_disturbances_pre_existing)
   :named REQ8_AUXILIARY0)) ;; "pre-existing impellent disturbances" implies "impellent disturbances"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_impellent_disturbances_pre_existing@@pre_existing)
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suffering from pre-existing impellent disturbances."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_refuses_to_participate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently refuses to participate in the study.","when_to_set_to_false":"Set to false if the patient currently does not refuse to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently refuses to participate in the study.","meaning":"Boolean indicating whether the patient currently refuses to participate in the study."} ;; "the patient refuses to participate"
(declare-const trustworthy_person_of_patient_refuses_to_participate_now Bool) ;; {"when_to_set_to_true":"Set to true if the trustworthy person of the patient currently refuses to participate in the study on behalf of the patient.","when_to_set_to_false":"Set to false if the trustworthy person of the patient currently does not refuse to participate in the study on behalf of the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the trustworthy person of the patient currently refuses to participate in the study on behalf of the patient.","meaning":"Boolean indicating whether the trustworthy person of the patient currently refuses to participate in the study on behalf of the patient."} ;; "the trustworthy person of the patient refuses to participate"
(declare-const legal_representative_of_patient_refuses_to_participate_now Bool) ;; {"when_to_set_to_true":"Set to true if the legal representative of the patient currently refuses to participate in the study on behalf of the patient.","when_to_set_to_false":"Set to false if the legal representative of the patient currently does not refuse to participate in the study on behalf of the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the legal representative of the patient currently refuses to participate in the study on behalf of the patient.","meaning":"Boolean indicating whether the legal representative of the patient currently refuses to participate in the study on behalf of the patient."} ;; "the legal representative of the patient refuses to participate"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_refuses_to_participate_now)
:named REQ9_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient refuses to participate."

(assert
(! (not trustworthy_person_of_patient_refuses_to_participate_now)
:named REQ9_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the trustworthy person of the patient refuses to participate."

(assert
(! (not legal_representative_of_patient_refuses_to_participate_now)
:named REQ9_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the legal representative of the patient refuses to participate."
