;; ===================== Declarations for the inclusion criteria (REQ 0) =====================
(declare-const patient_is_non_institutionalized_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently non-institutionalized.","when_to_set_to_false":"Set to false if the patient is currently institutionalized.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently non-institutionalized.","meaning":"Boolean indicating whether the patient is currently non-institutionalized."} ;; "To be included, the patient must be a non-institutionalized patient."

(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Alzheimer's disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Alzheimer's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Alzheimer's disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Alzheimer's disease."} ;; "To be included, the patient must have a diagnosis of Alzheimer's disease as defined by Diagnostic and Statistical Manual of Mental Disorders - Fourth Edition criteria."

(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now@@defined_by_dsm_iv_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of Alzheimer's disease is defined by DSM-IV criteria.","when_to_set_to_false":"Set to false if the patient's diagnosis of Alzheimer's disease is not defined by DSM-IV criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's diagnosis of Alzheimer's disease is defined by DSM-IV criteria.","meaning":"Boolean indicating whether the patient's diagnosis of Alzheimer's disease is defined by DSM-IV criteria."} ;; "To be included, the patient must have a diagnosis of Alzheimer's disease as defined by Diagnostic and Statistical Manual of Mental Disorders - Fourth Edition criteria."

(declare-const patient_has_symptoms_of_delusions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of delusions.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of delusions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of delusions.","meaning":"Boolean indicating whether the patient currently has symptoms of delusions."} ;; "have symptoms of delusions"

(declare-const patient_has_symptoms_of_delusions_now@@present_at_least_intermittently_for_1_month_or_more Bool) ;; {"when_to_set_to_true":"Set to true if the patient's symptoms of delusions have been present, at least intermittently, for at least 1 month.","when_to_set_to_false":"Set to false if the patient's symptoms of delusions have not been present, at least intermittently, for at least 1 month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's symptoms of delusions have been present, at least intermittently, for at least 1 month.","meaning":"Boolean indicating whether the patient's symptoms of delusions have been present, at least intermittently, for at least 1 month."} ;; "these symptoms have been present, at least intermittently, for ≥ 1 month"

(declare-const patient_has_symptoms_of_hallucinations_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of hallucinations.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of hallucinations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of hallucinations.","meaning":"Boolean indicating whether the patient currently has symptoms of hallucinations."} ;; "have symptoms of hallucinations"

(declare-const patient_has_symptoms_of_hallucinations_now@@present_at_least_intermittently_for_1_month_or_more Bool) ;; {"when_to_set_to_true":"Set to true if the patient's symptoms of hallucinations have been present, at least intermittently, for at least 1 month.","when_to_set_to_false":"Set to false if the patient's symptoms of hallucinations have not been present, at least intermittently, for at least 1 month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's symptoms of hallucinations have been present, at least intermittently, for at least 1 month.","meaning":"Boolean indicating whether the patient's symptoms of hallucinations have been present, at least intermittently, for at least 1 month."} ;; "these symptoms have been present, at least intermittently, for ≥ 1 month"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply their stem variables
(assert
  (! (=> patient_has_diagnosis_of_alzheimer_s_disease_now@@defined_by_dsm_iv_criteria
         patient_has_diagnosis_of_alzheimer_s_disease_now)
     :named REQ0_AUXILIARY0)) ;; "diagnosis of Alzheimer's disease as defined by DSM-IV criteria"

(assert
  (! (=> patient_has_symptoms_of_delusions_now@@present_at_least_intermittently_for_1_month_or_more
         patient_has_symptoms_of_delusions_now)
     :named REQ0_AUXILIARY1)) ;; "symptoms of delusions present, at least intermittently, for ≥ 1 month"

(assert
  (! (=> patient_has_symptoms_of_hallucinations_now@@present_at_least_intermittently_for_1_month_or_more
         patient_has_symptoms_of_hallucinations_now)
     :named REQ0_AUXILIARY2)) ;; "symptoms of hallucinations present, at least intermittently, for ≥ 1 month"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: non-institutionalized
(assert
  (! patient_is_non_institutionalized_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be a non-institutionalized patient."

;; Component 1: Alzheimer's disease diagnosis defined by DSM-IV
(assert
  (! patient_has_diagnosis_of_alzheimer_s_disease_now@@defined_by_dsm_iv_criteria
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "diagnosis of Alzheimer's disease as defined by DSM-IV criteria"

;; Component 2: (delusions OR hallucinations) present at least intermittently for ≥ 1 month
(assert
  (! (or patient_has_symptoms_of_delusions_now@@present_at_least_intermittently_for_1_month_or_more
         patient_has_symptoms_of_hallucinations_now@@present_at_least_intermittently_for_1_month_or_more)
     :named REQ0_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have symptoms of delusions OR have symptoms of hallucinations, and these symptoms have been present, at least intermittently, for ≥ 1 month"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_mini_mental_state_examination_score_value_recorded_now_withunit_points Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's Mini Mental State Examination score in points is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's Mini Mental State Examination score, recorded now, in points."} ;; "Mini Mental State Examination score"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Mini Mental State Examination score ≥ 6 points
(assert
  (! (>= patient_mini_mental_state_examination_score_value_recorded_now_withunit_points 6)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a Mini Mental State Examination score ≥ 6 points."

;; Component 1: Mini Mental State Examination score ≤ 24 points
(assert
  (! (<= patient_mini_mental_state_examination_score_value_recorded_now_withunit_points 24)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a Mini Mental State Examination score ≤ 24 points."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patients_self_propelled_locomotion_activity_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently capable of self-propelled locomotion activity (can ambulate independently without assistive devices).","when_to_set_to_false":"Set to false if the patient is currently not capable of self-propelled locomotion activity (cannot ambulate independently without assistive devices).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently capable of self-propelled locomotion activity.","meaning":"Boolean indicating whether the patient is currently capable of self-propelled locomotion activity (can ambulate independently without assistive devices)."} ;; "self locomotion"
(declare-const patients_locomotion_with_assistive_device_activity_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently capable of locomotion with the aid of an assistive device (can ambulate with assistance from a device such as a cane, walker, or wheelchair).","when_to_set_to_false":"Set to false if the patient is currently not capable of locomotion with the aid of an assistive device (cannot ambulate even with assistance from a device).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently capable of locomotion with the aid of an assistive device.","meaning":"Boolean indicating whether the patient is currently capable of locomotion with the aid of an assistive device (can ambulate with assistance from a device such as a cane, walker, or wheelchair)."} ;; "be capable of locomotion with the aid of an assistive device"

;; ===================== Constraint Assertions (REQ 2) =====================
;; To be included, the patient must be capable of self locomotion OR be capable of locomotion with the aid of an assistive device.
(assert
  (! (or patients_self_propelled_locomotion_activity_is_positive_now
         patients_locomotion_with_assistive_device_activity_is_positive_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_has_a_carer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has at least one identified caregiver.","when_to_set_to_false":"Set to false if the patient currently does not have any identified caregiver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an identified caregiver.","meaning":"Boolean indicating whether the patient currently has a caregiver."} ;; "To be included, the patient must have ≥ 1 identified caregiver OR ≥ 1 identified proxy."
(declare-const patient_has_identified_proxy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has at least one identified proxy.","when_to_set_to_false":"Set to false if the patient currently does not have any identified proxy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an identified proxy.","meaning":"Boolean indicating whether the patient currently has at least one identified proxy."} ;; "To be included, the patient must have ≥ 1 identified caregiver OR ≥ 1 identified proxy."
(declare-const patient_identified_proxy_count_now_withunit_integer Int) ;; {"when_to_set_to_value":"Set to the integer value representing the number of identified proxies the patient currently has.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many identified proxies the patient currently has.","meaning":"Numeric variable indicating the number of identified proxies the patient currently has, measured in integer units."} ;; "To be included, the patient must have ≥ 1 identified caregiver OR ≥ 1 identified proxy."

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition: patient_has_identified_proxy_now is true iff patient_identified_proxy_count_now_withunit_integer >= 1
(assert
  (! (= patient_has_identified_proxy_now
        (>= patient_identified_proxy_count_now_withunit_integer 1))
     :named REQ3_AUXILIARY0)) ;; "To be included, the patient must have ≥ 1 identified proxy."

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: patient must have ≥ 1 identified caregiver OR ≥ 1 identified proxy
(assert
  (! (or patient_has_finding_of_has_a_carer_now
         patient_has_identified_proxy_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have ≥ 1 identified caregiver OR ≥ 1 identified proxy."

;; ===================== Declarations for the inclusion criterion (REQ 4) =====================
(declare-const patient_has_completed_acute_phase_in_any_treatment_group Bool) ;; {"when_to_set_to_true":"Set to true if the patient has completed the 10-week Acute Phase in either treatment group.","when_to_set_to_false":"Set to false if the patient has not completed the 10-week Acute Phase in either treatment group.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has completed the 10-week Acute Phase in either treatment group.","meaning":"Boolean indicating whether the patient has completed the 10-week Acute Phase in either treatment group."} ;; "To be included in the Extension Phase, the patient must have completed the 10-week Acute Phase in either treatment group."
(declare-const neuropsychiatric_inventory_total_score_value_recorded_week_10_withunit_points Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's Neuropsychiatric Inventory Total Score recorded at Week 10, in points.","when_to_set_to_null":"Set to null if the score is unknown, not documented, or cannot be determined for Week 10.","meaning":"Numeric value representing the patient's Neuropsychiatric Inventory Total Score recorded at Week 10, in points."} ;; "To be included in the Extension Phase, the patient must have a Week 10 Total Score ≥ 6 on the Neuropsychiatric Inventory."
(declare-const patient_is_deemed_suitable_for_long_term_trial_by_investigator_judgment Bool) ;; {"when_to_set_to_true":"Set to true if, in the judgment of the investigator, the patient is deemed suitable for participation in the long-term trial.","when_to_set_to_false":"Set to false if, in the judgment of the investigator, the patient is not deemed suitable for participation in the long-term trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is deemed suitable for participation in the long-term trial by investigator judgment.","meaning":"Boolean indicating whether, in the judgment of the investigator, the patient is deemed suitable for participation in the long-term trial."} ;; "To be included in the Extension Phase, in the judgment of the investigator, the patient must be deemed suitable for participation in the long-term trial."

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: Patient must have completed the 10-week Acute Phase in either treatment group
(assert
  (! patient_has_completed_acute_phase_in_any_treatment_group
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included in the Extension Phase, the patient must have completed the 10-week Acute Phase in either treatment group."

;; Component 1: Patient must have a Week 10 Total Score ≥ 6 on the Neuropsychiatric Inventory
(assert
  (! (>= neuropsychiatric_inventory_total_score_value_recorded_week_10_withunit_points 6)
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included in the Extension Phase, the patient must have a Week 10 Total Score ≥ 6 on the Neuropsychiatric Inventory."

;; Component 2: In the judgment of the investigator, patient must be deemed suitable for participation in the long-term trial
(assert
  (! patient_is_deemed_suitable_for_long_term_trial_by_investigator_judgment
     :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included in the Extension Phase, in the judgment of the investigator, the patient must be deemed suitable for participation in the long-term trial."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_completed_extension_phase_of_study_cn138_006_at_any_french_investigational_site Bool) ;; {"when_to_set_to_true":"Set to true if the patient has completed the extension phase of study CN138-006 at any French Investigational Site.","when_to_set_to_false":"Set to false if the patient has not completed the extension phase of study CN138-006 at any French Investigational Site.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has completed the extension phase of study CN138-006 at any French Investigational Site.","meaning":"Boolean indicating whether the patient has completed the extension phase of study CN138-006 at any French Investigational Site."} ;; "the patient must have completed the extension phase of study CN138-006 in any French Investigational Site"
(declare-const patient_is_receiving_ongoing_clinical_benefit_per_investigator_judgment Bool) ;; {"when_to_set_to_true":"Set to true if the patient is receiving ongoing clinical benefit as determined by the investigator's judgment.","when_to_set_to_false":"Set to false if the patient is not receiving ongoing clinical benefit as determined by the investigator's judgment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is receiving ongoing clinical benefit as determined by the investigator's judgment.","meaning":"Boolean indicating whether the patient is receiving ongoing clinical benefit as determined by the investigator's judgment."} ;; "per the investigator's judgment, be receiving ongoing clinical benefit"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: patient must have completed the extension phase of study CN138-006 in any French Investigational Site
(assert
  (! patient_has_completed_extension_phase_of_study_cn138_006_at_any_french_investigational_site
     :named REQ5_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must have completed the extension phase of study CN138-006 in any French Investigational Site"

;; Component 1: per the investigator's judgment, patient must be receiving ongoing clinical benefit
(assert
  (! patient_is_receiving_ongoing_clinical_benefit_per_investigator_judgment
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "per the investigator's judgment, be receiving ongoing clinical benefit"
