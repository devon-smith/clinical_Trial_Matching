;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const richmond_agitation_sedation_score_value_recorded_study_period_withunit_integer Real) ;; {"when_to_set_to_value":"Set to the Richmond Agitation Sedation Score value recorded for the patient during the study period, as an integer.","when_to_set_to_null":"Set to null if the Richmond Agitation Sedation Score value during the study period is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the Richmond Agitation Sedation Score recorded for the patient during the study period, as an integer."} ;; "Richmond Agitation Sedation Score value recorded for the patient during the study period"

(declare-const richmond_agitation_sedation_score_value_recorded_study_period_withunit_integer@@occurred_during_whole_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the Richmond Agitation Sedation Score value was recorded and occurred during the whole study period.","when_to_set_to_false":"Set to false if the Richmond Agitation Sedation Score value did not occur during the whole study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the Richmond Agitation Sedation Score value occurred during the whole study period.","meaning":"Boolean indicating whether the Richmond Agitation Sedation Score value occurred during the whole study period."} ;; "Richmond Agitation Sedation Score value occurred during the whole study period"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (and richmond_agitation_sedation_score_value_recorded_study_period_withunit_integer@@occurred_during_whole_study_period
             (= richmond_agitation_sedation_score_value_recorded_study_period_withunit_integer -4)))
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a Richmond Agitation Sedation Score of -4 during the whole study period."

(assert
(! (not (and richmond_agitation_sedation_score_value_recorded_study_period_withunit_integer@@occurred_during_whole_study_period
             (= richmond_agitation_sedation_score_value_recorded_study_period_withunit_integer -5)))
   :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a Richmond Agitation Sedation Score of -5 during the whole study period."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const confusion_assessment_method_for_the_intensive_care_unit_score_value_recorded_during_intensive_care_unit_stay_withunit_count Real) ;; {"when_to_set_to_value":"Set to the total number of CAM-ICU scores recorded during the patient's ICU stay.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many CAM-ICU scores were recorded during the ICU stay.","meaning":"Numeric variable representing the total count of CAM-ICU scores recorded during the ICU stay."} ;; "has zero Confusion Assessment Method for the Intensive Care Unit scores during the Intensive Care Unit stay"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (= confusion_assessment_method_for_the_intensive_care_unit_score_value_recorded_during_intensive_care_unit_stay_withunit_count 0))
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has zero Confusion Assessment Method for the Intensive Care Unit scores during the Intensive Care Unit stay."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_aphasia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of aphasia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of aphasia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has aphasia.","meaning":"Boolean indicating whether the patient currently has aphasia."} ;; "the patient has aphasia"
(declare-const patient_has_finding_of_deafness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has deafness.","when_to_set_to_false":"Set to false if the patient currently does not have deafness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has deafness.","meaning":"Boolean indicating whether the patient currently has deafness."} ;; "the patient has deafness"
(declare-const patient_has_finding_of_severe_brain_damage_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe brain damage.","when_to_set_to_false":"Set to false if the patient currently does not have severe brain damage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe brain damage.","meaning":"Boolean indicating whether the patient currently has severe brain damage."} ;; "the patient has severe brain damage"
(declare-const patient_is_non_danish_speaker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a non-Danish speaker.","when_to_set_to_false":"Set to false if the patient is currently a Danish speaker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a non-Danish speaker.","meaning":"Boolean indicating whether the patient is currently a non-Danish speaker."} ;; "the patient is a non-Danish speaker"
(declare-const patient_is_unable_to_communicate_in_danish_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to communicate in Danish.","when_to_set_to_false":"Set to false if the patient is currently able to communicate in Danish.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to communicate in Danish.","meaning":"Boolean indicating whether the patient is currently unable to communicate in Danish."} ;; "the patient is unable to communicate in Danish"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_aphasia_now
           patient_has_finding_of_deafness_now
           patient_is_non_danish_speaker_now
           patient_has_finding_of_severe_brain_damage_now)
       patient_is_unable_to_communicate_in_danish_now)
   :named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples ((the patient has aphasia) OR (the patient has deafness) OR (the patient is a non-Danish speaker) OR (the patient has severe brain damage))."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_unable_to_communicate_in_danish_now)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to communicate in Danish with non-exhaustive examples ((the patient has aphasia) OR (the patient has deafness) OR (the patient is a non-Danish speaker) OR (the patient has severe brain damage))."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_severe_brain_damage_now@@documented_in_electronic_patient_charts_opus Bool) ;; {"when_to_set_to_true":"Set to true if the patient's severe brain damage (including severe dementia) is documented in electronic patient charts (OPUS).","when_to_set_to_false":"Set to false if the patient's severe brain damage (including severe dementia) is not documented in electronic patient charts (OPUS).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's severe brain damage (including severe dementia) is documented in electronic patient charts (OPUS).","meaning":"Boolean indicating whether the patient's severe brain damage (including severe dementia) is documented in electronic patient charts (OPUS)."} ;; "severe dementia documented in electronic patient charts (OPUS)"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_severe_brain_damage_now@@documented_in_electronic_patient_charts_opus
       patient_has_finding_of_severe_brain_damage_now)
:named REQ3_AUXILIARY0)) ;; "documented in electronic patient charts (OPUS)" implies "severe brain damage (including severe dementia)"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_severe_brain_damage_now@@documented_in_electronic_patient_charts_opus)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe dementia documented in electronic patient charts (OPUS)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_moribund_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently moribund.","when_to_set_to_false":"Set to false if the patient is currently not moribund.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently moribund.","meaning":"Boolean indicating whether the patient is currently moribund."} ;; "moribund patient"
(declare-const patient_is_receiving_active_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving active treatment.","when_to_set_to_false":"Set to false if the patient is currently not receiving active treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving active treatment.","meaning":"Boolean indicating whether the patient is currently receiving active treatment."} ;; "receiving active treatment"
(declare-const patient_is_receiving_active_treatment_now@@not_receiving Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently NOT receiving active treatment.","when_to_set_to_false":"Set to false if the patient is currently receiving active treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently NOT receiving active treatment.","meaning":"Boolean indicating whether the patient is currently NOT receiving active treatment."} ;; "NOT receiving active treatment"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_receiving_active_treatment_now@@not_receiving
    (not patient_is_receiving_active_treatment_now))
:named REQ4_AUXILIARY0)) ;; "NOT receiving active treatment"

;; Moribund status is implied by NOT receiving active treatment
(assert
(! (=> patient_is_receiving_active_treatment_now@@not_receiving
    patient_is_moribund_now)
:named REQ4_AUXILIARY1)) ;; "(moribund patient)"

;; Qualifier variable definition
(assert
(! (= patient_is_receiving_active_treatment_now@@not_receiving
    (not patient_is_receiving_active_treatment_now))
:named REQ4_AUXILIARY2)) ;; "NOT receiving active treatment"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_receiving_active_treatment_now@@not_receiving)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is NOT receiving active treatment (moribund patient)."
