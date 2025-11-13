;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now Bool) ;; "Boolean indicating whether the patient currently has a diagnosis of Alzheimer's disease." {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Alzheimer's disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Alzheimer's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Alzheimer's disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Alzheimer's disease."}
(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosed_according_to_dsm_iv_criteria Bool) ;; "Boolean indicating whether the patient currently has a diagnosis of Alzheimer's disease, and the diagnosis is made according to Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition (DSM-IV) criteria." {"when_to_set_to_true":"Set to true if the patient's current diagnosis of Alzheimer's disease is made according to DSM-IV criteria.","when_to_set_to_false":"Set to false if the patient's current diagnosis of Alzheimer's disease is not made according to DSM-IV criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of Alzheimer's disease is made according to DSM-IV criteria.","meaning":"Boolean indicating whether the patient's current diagnosis of Alzheimer's disease is made according to DSM-IV criteria."}
(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosed_according_to_nincds_adrda_criteria Bool) ;; "Boolean indicating whether the patient currently has a diagnosis of Alzheimer's disease, and the diagnosis is made according to National Institute of Neurological and Communicative Disorders and Stroke and the Alzheimer's Disease and Related Disorders Association (NINCDS-ADRDA) criteria." {"when_to_set_to_true":"Set to true if the patient's current diagnosis of Alzheimer's disease is made according to NINCDS-ADRDA criteria.","when_to_set_to_false":"Set to false if the patient's current diagnosis of Alzheimer's disease is not made according to NINCDS-ADRDA criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of Alzheimer's disease is made according to NINCDS-ADRDA criteria.","meaning":"Boolean indicating whether the patient's current diagnosis of Alzheimer's disease is made according to NINCDS-ADRDA criteria."}

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply the stem variable
(assert
  (! (=> patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosed_according_to_dsm_iv_criteria
         patient_has_diagnosis_of_alzheimer_s_disease_now)
     :named REQ0_AUXILIARY0)) ;; "diagnosis of Alzheimer's disease according to DSM-IV criteria" implies "diagnosis of Alzheimer's disease"

(assert
  (! (=> patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosed_according_to_nincds_adrda_criteria
         patient_has_diagnosis_of_alzheimer_s_disease_now)
     :named REQ0_AUXILIARY1)) ;; "diagnosis of Alzheimer's disease according to NINCDS-ADRDA criteria" implies "diagnosis of Alzheimer's disease"

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must have a diagnosis of Alzheimer's disease according to DSM-IV OR NINCDS-ADRDA criteria
(assert
  (! (or patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosed_according_to_dsm_iv_criteria
         patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosed_according_to_nincds_adrda_criteria)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((have a diagnosis of Alzheimer's disease according to Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition criteria) OR (have a diagnosis of Alzheimer's disease according to National Institute of Neurological and Communicative Disorders and Stroke and the Alzheimer's Disease and Related Disorders Association criteria))."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; "aged ≥ 65 years" {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 65.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 65 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const mini_mental_state_examination_score_value_recorded_now_withunit_points Real) ;; "Numeric value representing the patient's Mini-Mental State Examination (MMSE) score, recorded at the current time, in units of points." {"when_to_set_to_value":"Set to the numeric value of the patient's MMSE score recorded at the current time, in points.","when_to_set_to_null":"Set to null if the MMSE score is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric value representing the patient's MMSE score recorded now, in points."}
(declare-const patient_has_finding_of_alzheimers_disease_now Bool) ;; "Boolean clinical finding indicating whether the patient currently has Alzheimer's disease." {"when_to_set_to_true":"Set to true if the patient currently has Alzheimer's disease.","when_to_set_to_false":"Set to false if the patient currently does not have Alzheimer's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Alzheimer's disease.","meaning":"Boolean indicating whether the patient currently has Alzheimer's disease."}
(declare-const patient_has_finding_of_mild_alzheimers_disease_now Bool) ;; "To be included, the patient must have mild Alzheimer's disease (defined as Mini-Mental State Examination score between 21 and 25, inclusive)." {"when_to_set_to_true":"Set to true if the patient currently has mild Alzheimer's disease, defined as MMSE score between 21 and 25, inclusive.","when_to_set_to_false":"Set to false if the patient does not currently have mild Alzheimer's disease, or MMSE score is outside 21-25.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has mild Alzheimer's disease.","meaning":"Boolean indicating whether the patient currently has mild Alzheimer's disease (MMSE 21-25, inclusive)."}
(declare-const patient_has_finding_of_moderate_alzheimers_disease_now Bool) ;; "To be included, the patient must have moderate Alzheimer's disease (defined as Mini-Mental State Examination score between 10 and 20, inclusive)." {"when_to_set_to_true":"Set to true if the patient currently has moderate Alzheimer's disease, defined as MMSE score between 10 and 20, inclusive.","when_to_set_to_false":"Set to false if the patient does not currently have moderate Alzheimer's disease, or MMSE score is outside 10-20.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has moderate Alzheimer's disease.","meaning":"Boolean indicating whether the patient currently has moderate Alzheimer's disease (MMSE 10-20, inclusive)."}
(declare-const patient_has_finding_of_severe_alzheimers_disease_now Bool) ;; "To be included, the patient must have severe Alzheimer's disease (defined as Mini-Mental State Examination score between 3 and 9, inclusive)." {"when_to_set_to_true":"Set to true if the patient currently has severe Alzheimer's disease, defined as MMSE score between 3 and 9, inclusive.","when_to_set_to_false":"Set to false if the patient does not currently have severe Alzheimer's disease, or MMSE score is outside 3-9.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe Alzheimer's disease.","meaning":"Boolean indicating whether the patient currently has severe Alzheimer's disease (MMSE 3-9, inclusive)."}

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition of mild Alzheimer's disease per MMSE score
(assert
  (! (= patient_has_finding_of_mild_alzheimers_disease_now
        (and patient_has_finding_of_alzheimers_disease_now
             (>= mini_mental_state_examination_score_value_recorded_now_withunit_points 21)
             (<= mini_mental_state_examination_score_value_recorded_now_withunit_points 25)))
     :named REQ2_AUXILIARY0)) ;; "mild Alzheimer's disease (defined as MMSE score between 21 and 25, inclusive)"

;; Definition of moderate Alzheimer's disease per MMSE score
(assert
  (! (= patient_has_finding_of_moderate_alzheimers_disease_now
        (and patient_has_finding_of_alzheimers_disease_now
             (>= mini_mental_state_examination_score_value_recorded_now_withunit_points 10)
             (<= mini_mental_state_examination_score_value_recorded_now_withunit_points 20)))
     :named REQ2_AUXILIARY1)) ;; "moderate Alzheimer's disease (defined as MMSE score between 10 and 20, inclusive)"

;; Definition of severe Alzheimer's disease per MMSE score
(assert
  (! (= patient_has_finding_of_severe_alzheimers_disease_now
        (and patient_has_finding_of_alzheimers_disease_now
             (>= mini_mental_state_examination_score_value_recorded_now_withunit_points 3)
             (<= mini_mental_state_examination_score_value_recorded_now_withunit_points 9)))
     :named REQ2_AUXILIARY2)) ;; "severe Alzheimer's disease (defined as MMSE score between 3 and 9, inclusive)"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have mild OR moderate OR severe Alzheimer's disease (as defined above)
(assert
  (! (or patient_has_finding_of_mild_alzheimers_disease_now
         patient_has_finding_of_moderate_alzheimers_disease_now
         patient_has_finding_of_severe_alzheimers_disease_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((have mild Alzheimer's disease (defined as MMSE score between 21 and 25, inclusive)) OR (have moderate Alzheimer's disease (defined as MMSE score between 10 and 20, inclusive)) OR (have severe Alzheimer's disease (defined as MMSE score between 3 and 9, inclusive)))."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_walking_value_recorded_now_withunit_meters Real) ;; "Numeric observable representing the distance in meters the patient is able to walk unaided, measured now." {"when_to_set_to_value":"Set to the measured distance in meters if a numeric measurement of how far the patient can walk unaided, recorded now, is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the distance in meters the patient is able to walk unaided, measured now."}
(declare-const patient_walking_value_recorded_now_withunit_meters@@without_any_aid Bool) ;; "Numeric observable representing the distance in meters the patient is able to walk unaided, measured now, with the additional constraint that the walking is performed without any aid." {"when_to_set_to_true":"Set to true if the measurement of walking distance was performed without any aid (e.g., no assistive devices, support, or help).","when_to_set_to_false":"Set to false if the measurement was performed with any aid (e.g., assistive devices, support, or help).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the walking measurement was performed without any aid.","meaning":"Boolean indicating whether the walking distance measurement was performed without any aid."}

;; ===================== Constraint Assertions (REQ 3) =====================
;; To be included, the patient must be able to walk without any aid for ≥ 15 meters.
(assert
  (! (and patient_walking_value_recorded_now_withunit_meters@@without_any_aid
          (>= patient_walking_value_recorded_now_withunit_meters 15.0))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be able to walk without any aid for ≥ 15 meters."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_near_visual_acuity_value_recorded_now_withunit_none Real) ;; "Numeric value representing the patient's near visual acuity measured now, with no specified unit." {"when_to_set_to_value":"Set to the measured value if the patient's near visual acuity is recorded now.","when_to_set_to_null":"Set to null if no near visual acuity measurement is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's near visual acuity measured now."}

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: To be included, the patient must have near visual acuity ≥ 2.
(assert
  (! (>= patient_near_visual_acuity_value_recorded_now_withunit_none 2)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have near visual acuity ≥ 2."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const geriatric_depression_scale_15_item_score_value_recorded_now_withunit_points Real) ;; "Numeric value representing the patient's score on the 15-item Geriatric Depression Scale, recorded at the current time, in points." {"when_to_set_to_value":"Set to the numeric value of the patient's 15-item Geriatric Depression Scale score recorded at the current time, in points.","when_to_set_to_null":"Set to null if the score is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric value representing the patient's score on the 15-item Geriatric Depression Scale, recorded at the current time, in points."}
(declare-const patient_has_finding_of_severe_depression_now Bool) ;; "Boolean clinical finding indicating whether the patient currently has severe depression." {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of severe depression.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of severe depression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of severe depression.","meaning":"Boolean indicating whether the patient currently has severe depression."}

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definition in the requirement: severe depression is defined as a score of the 15-item Geriatric Depression Scale > 10
(assert
  (! (= patient_has_finding_of_severe_depression_now
        (> geriatric_depression_scale_15_item_score_value_recorded_now_withunit_points 10))
     :named REQ5_AUXILIARY0)) ;; "defined as a score of the 15-item Geriatric Depression Scale > 10"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: To be included, the patient must NOT have severe depression
(assert
  (! (not patient_has_finding_of_severe_depression_now)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have severe depression"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_written_consent_form_to_participate_in_study_now Bool) ;; "To be included, the patient must have a written consent form to participate in the study." {"when_to_set_to_true":"Set to true if the patient currently has a written consent form to participate in the study.","when_to_set_to_false":"Set to false if the patient currently does not have a written consent form to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a written consent form to participate in the study.","meaning":"Boolean indicating whether the patient currently has a written consent form to participate in the study."}
(declare-const trustworthy_person_has_provided_consent_for_patient_with_severe_alzheimers_disease_now Bool) ;; "for severe Alzheimer's disease, have consent provided by a trustworthy person" {"when_to_set_to_true":"Set to true if a trustworthy person has provided consent for the patient with severe Alzheimer's disease at the current time.","when_to_set_to_false":"Set to false if a trustworthy person has not provided consent for the patient with severe Alzheimer's disease at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a trustworthy person has provided consent for the patient with severe Alzheimer's disease at the current time.","meaning":"Boolean indicating whether a trustworthy person has provided consent for the patient with severe Alzheimer's disease at the current time."}
(declare-const legal_representative_has_provided_consent_for_patient_with_severe_alzheimers_disease_now Bool) ;; "for severe Alzheimer's disease, have consent provided by ... legal representative" {"when_to_set_to_true":"Set to true if a legal representative has provided consent for the patient with severe Alzheimer's disease at the current time.","when_to_set_to_false":"Set to false if a legal representative has not provided consent for the patient with severe Alzheimer's disease at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a legal representative has provided consent for the patient with severe Alzheimer's disease at the current time.","meaning":"Boolean indicating whether a legal representative has provided consent for the patient with severe Alzheimer's disease at the current time."}

;; ===================== Constraint Assertions (REQ 6) =====================
;; To be included, the patient must ((have a written consent form to participate in the study) OR (for severe Alzheimer's disease, have consent provided by a trustworthy person OR legal representative)).
(assert
  (!
    (or
      patient_has_written_consent_form_to_participate_in_study_now
      (and
        patient_has_finding_of_severe_alzheimers_disease_now
        (or trustworthy_person_has_provided_consent_for_patient_with_severe_alzheimers_disease_now
            legal_representative_has_provided_consent_for_patient_with_severe_alzheimers_disease_now)
      )
    )
    :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION))

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_is_affiliated_to_social_security_regime_now Bool) ;; "To be included, the patient must be affiliated to a social security regime." {"when_to_set_to_true":"Set to true if the patient is currently affiliated to a social security regime.","when_to_set_to_false":"Set to false if the patient is currently not affiliated to a social security regime.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently affiliated to a social security regime.","meaning":"Boolean indicating whether the patient is currently affiliated to a social security regime."}

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! patient_is_affiliated_to_social_security_regime_now
     :named REQ7_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be affiliated to a social security regime."
