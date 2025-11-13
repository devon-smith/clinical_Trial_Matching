;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_mini_mental_state_examination_score_value_recorded_now_withunit_none Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's Mini-Mental Status Examination score is recorded now.","when_to_set_to_null":"Set to null if no such score is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's Mini-Mental Status Examination score recorded now."} ;; "Mini-Mental Status Examination score"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (<= patient_mini_mental_state_examination_score_value_recorded_now_withunit_none 10))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a Mini-Mental Status Examination score less than or equal to 10."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_suffering_from_impellent_disturbances_pre_existing Bool) ;; {"when_to_set_to_true":"Set to true if the patient is suffering from impellent disturbances that are pre-existing (i.e., present before the current context or intervention).","when_to_set_to_false":"Set to false if the patient is not suffering from impellent disturbances that are pre-existing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is suffering from pre-existing impellent disturbances.","meaning":"Boolean indicating whether the patient is suffering from impellent disturbances that are pre-existing."} ;; "The patient is suffering from pre-existing impellent disturbances."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_suffering_from_impellent_disturbances_pre_existing)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suffering from pre-existing impellent disturbances."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of cerebrovascular accident at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of cerebrovascular accident documented in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a cerebrovascular accident.","meaning":"Boolean indicating whether the patient has ever had a cerebrovascular accident in their medical history."} ;; "the patient has a history of cerebrovascular accident"
(declare-const patient_has_finding_of_cerebro_spinal_pathology_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of cerebro-spinal pathology at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of cerebro-spinal pathology documented in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a cerebro-spinal pathology.","meaning":"Boolean indicating whether the patient has ever had a cerebro-spinal pathology in their medical history."} ;; "the patient has a history of cerebro-spinal pathology"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_has_finding_of_cerebrovascular_accident_inthehistory)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of cerebrovascular accident."

(assert
  (! (not patient_has_finding_of_cerebro_spinal_pathology_inthehistory)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of cerebro-spinal pathology."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_poor_workmanship_of_written_french_language_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has poor workmanship of the written French language.","when_to_set_to_false":"Set to false if the patient currently does not have poor workmanship of the written French language.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has poor workmanship of the written French language.","meaning":"Boolean indicating whether the patient currently has poor workmanship of the written French language."} ;; "poor workmanship of the written French language"
(declare-const patient_has_finding_of_poor_workmanship_of_oral_french_language_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has poor workmanship of the oral French language.","when_to_set_to_false":"Set to false if the patient currently does not have poor workmanship of the oral French language.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has poor workmanship of the oral French language.","meaning":"Boolean indicating whether the patient currently has poor workmanship of the oral French language."} ;; "poor workmanship of the oral French language"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_poor_workmanship_of_written_french_language_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has poor workmanship of the written French language."

(assert
(! (not patient_has_finding_of_poor_workmanship_of_oral_french_language_now)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has poor workmanship of the oral French language."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_uses_walking_aid_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently uses any walking aid.","when_to_set_to_false":"Set to false if the patient currently does not use any walking aid.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently uses any walking aid.","meaning":"Boolean indicating whether the patient currently uses any walking aid."} ;; "the patient uses a walking aid"
(declare-const patient_uses_walking_frame_with_wheels_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently uses a walking frame with wheels.","when_to_set_to_false":"Set to false if the patient currently does not use a walking frame with wheels.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently uses a walking frame with wheels.","meaning":"Boolean indicating whether the patient currently uses a walking frame with wheels."} ;; "a walking frame with wheels"
(declare-const patient_uses_tricycle_as_walking_aid_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently uses a tricycle as a walking aid.","when_to_set_to_false":"Set to false if the patient currently does not use a tricycle as a walking aid.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently uses a tricycle as a walking aid.","meaning":"Boolean indicating whether the patient currently uses a tricycle as a walking aid."} ;; "a tricycle"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive example: walking frame with wheels implies walking aid
(assert
(! (=> patient_uses_walking_frame_with_wheels_now
      patient_uses_walking_aid_now)
    :named REQ4_AUXILIARY0)) ;; "with non-exhaustive examples (a walking frame with wheels)"

;; Non-exhaustive example: tricycle as walking aid implies walking aid
(assert
(! (=> patient_uses_tricycle_as_walking_aid_now
      patient_uses_walking_aid_now)
    :named REQ4_AUXILIARY1)) ;; "with non-exhaustive examples (a tricycle)"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient must NOT use a walking aid (first component)
(assert
(! (not patient_uses_walking_aid_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses a walking aid with non-exhaustive examples (a walking frame with wheels)."

;; Exclusion: patient must NOT use a tricycle as a walking aid (second component)
(assert
(! (not patient_uses_tricycle_as_walking_aid_now)
    :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses a walking aid with non-exhaustive examples (a tricycle)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_acute_medical_disease_in_past_3_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an acute medical disease that occurred within the past 3 months.","when_to_set_to_false":"Set to false if the patient has not had an acute medical disease that occurred within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an acute medical disease in the past 3 months.","meaning":"Boolean indicating whether the patient has had an acute medical disease in the past 3 months."} ;; "the patient has had an acute medical disease in the past 3 months"

(declare-const patient_has_finding_of_acute_surgical_disease_in_past_3_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an acute surgical disease that occurred within the past 3 months.","when_to_set_to_false":"Set to false if the patient has not had an acute surgical disease that occurred within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an acute surgical disease in the past 3 months.","meaning":"Boolean indicating whether the patient has had an acute surgical disease in the past 3 months."} ;; "the patient has had an acute surgical disease in the past 3 months"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_acute_medical_disease_in_past_3_months)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had an acute medical disease in the past 3 months."

(assert
(! (not patient_has_finding_of_acute_surgical_disease_in_past_3_months)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had an acute surgical disease in the past 3 months."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_refuses_to_participate Bool) ;; {"when_to_set_to_true":"Set to true if the patient refuses to participate.","when_to_set_to_false":"Set to false if the patient does not refuse to participate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient refuses to participate.","meaning":"Boolean indicating whether the patient refuses to participate."} ;; "the patient refuses to participate"
(declare-const trustworthy_person_refuses_to_participate Bool) ;; {"when_to_set_to_true":"Set to true if a trustworthy person refuses to participate.","when_to_set_to_false":"Set to false if a trustworthy person does not refuse to participate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a trustworthy person refuses to participate.","meaning":"Boolean indicating whether a trustworthy person refuses to participate."} ;; "a trustworthy person refuses to participate"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (or patient_refuses_to_participate trustworthy_person_refuses_to_participate))
:named REQ6_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if (the patient refuses to participate) OR (a trustworthy person refuses to participate)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_near_visual_acuity_value_recorded_now_withunit_fraction Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's near visual acuity is recorded now as a fraction (e.g., 2/10).","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's near visual acuity measured now, in fractional units (e.g., 2/10)."} ;; "near visual acuity less than 2/10"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (< patient_near_visual_acuity_value_recorded_now_withunit_fraction (/ 2.0 10.0)))
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has near visual acuity less than 2/10."
