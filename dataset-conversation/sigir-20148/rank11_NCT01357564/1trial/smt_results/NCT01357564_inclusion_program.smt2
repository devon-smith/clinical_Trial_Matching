;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the index patient currently has a diagnosis of dementia.","when_to_set_to_false":"Set to false if the index patient currently does not have a diagnosis of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the index patient currently has a diagnosis of dementia.","meaning":"Boolean indicating whether the index patient currently has a diagnosis of dementia."}  ;; "dementia"
(declare-const patient_is_english_speaking_now Bool) ;; {"when_to_set_to_true":"Set to true if the index patient is currently able to speak English.","when_to_set_to_false":"Set to false if the index patient is currently not able to speak English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the index patient is currently able to speak English.","meaning":"Boolean indicating whether the index patient is currently able to speak English."}  ;; "an English-speaking patient"
(declare-const patient_is_veteran_now Bool) ;; {"when_to_set_to_true":"Set to true if the index patient is currently a Veteran (has Veteran status).","when_to_set_to_false":"Set to false if the index patient is currently not a Veteran.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the index patient is currently a Veteran.","meaning":"Boolean indicating whether the index patient is currently a Veteran."}  ;; "a Veteran"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (and patient_is_veteran_now
          patient_has_diagnosis_of_dementia_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a Veteran with dementia."

(assert
  (! patient_is_english_speaking_now
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be an English-speaking patient."

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: "To be included, the patient must be a Veteran with dementia."
(assert
  (! (and patient_is_veteran_now
          patient_has_diagnosis_of_dementia_now)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a Veteran with dementia."

;; Component 1: "To be included, the patient must have a diagnosis of dementia as above."
(assert
  (! patient_has_diagnosis_of_dementia_now
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a diagnosis of dementia as above."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_activity_of_daily_living_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of ADLs (from the exhaustive subcategories: bathing, dressing, grooming, toileting, transferring from bed to chair) in which the patient is currently able to participate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many ADLs the patient can currently participate in.","meaning":"Numeric count of ADLs (from the specified exhaustive subcategories) in which the patient is currently able to participate."}  ;; "able to participate in at least two activities of daily living (with exhaustive subcategories (bathing, dressing, grooming, toileting, transferring from bed to chair))"
(declare-const patient_activity_of_daily_living_value_recorded_now_withunit_count@@adls_exhaustive_subcategories_bathing_dressing_grooming_toileting_transferring_from_bed_to_chair Bool) ;; {"when_to_set_to_true":"Set to true if the ADLs counted are strictly limited to the exhaustive subcategories: bathing, dressing, grooming, toileting, transferring from bed to chair.","when_to_set_to_false":"Set to false if the ADLs counted include any activities outside the specified exhaustive subcategories.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ADLs counted are limited to the specified exhaustive subcategories.","meaning":"Qualifier indicating that the ADLs counted are strictly defined by the exhaustive subcategories: bathing, dressing, grooming, toileting, transferring from bed to chair."}  ;; "with exhaustive subcategories (bathing, dressing, grooming, toileting, transferring from bed to chair)"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies the count is strictly for the exhaustive subcategories
(assert
  (! (=> patient_activity_of_daily_living_value_recorded_now_withunit_count@@adls_exhaustive_subcategories_bathing_dressing_grooming_toileting_transferring_from_bed_to_chair
         (and (>= patient_activity_of_daily_living_value_recorded_now_withunit_count 0)
              (<= patient_activity_of_daily_living_value_recorded_now_withunit_count 5)))
     :named REQ2_AUXILIARY0)) ;; "activities of daily living (with exhaustive subcategories (bathing, dressing, grooming, toileting, transferring from bed to chair))"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Must be a Veteran with dementia
(assert
  (! (and patient_is_veteran_now
          patient_has_diagnosis_of_dementia_now)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be a Veteran with dementia"

;; Component 1: Must be able to participate in at least two ADLs (from exhaustive subcategories)
(assert
  (! (and (>= patient_activity_of_daily_living_value_recorded_now_withunit_count 2)
          patient_activity_of_daily_living_value_recorded_now_withunit_count@@adls_exhaustive_subcategories_bathing_dressing_grooming_toileting_transferring_from_bed_to_chair)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "able to participate in at least two activities of daily living (with exhaustive subcategories (bathing, dressing, grooming, toileting, transferring from bed to chair))"

;; ===================== Declarations for the criterion (REQ 3) =====================
;; "a Veteran"
;; "dementia"
;; Both already declared above and must not be redeclared.

(declare-const patient_is_currently_participating_in_dementia_related_intervention Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in any other dementia-related intervention.","when_to_set_to_false":"Set to false if the patient is currently not participating in any other dementia-related intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in any other dementia-related intervention.","meaning":"Boolean indicating whether the patient is currently participating in any other dementia-related intervention."} ;; "currently participating in any other dementia-related intervention"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: To be included, the patient must be a Veteran with dementia.
(assert
  (! (and patient_is_veteran_now
          patient_has_diagnosis_of_dementia_now)
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be a Veteran with dementia"

;; Component 1: To be included, the patient must not be currently participating in any other dementia-related intervention.
(assert
  (! (not patient_is_currently_participating_in_dementia_related_intervention)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "NOT currently participating in any other dementia-related intervention"

;; ===================== Declarations for the inclusion criterion (REQ 4) =====================
(declare-const patient_is_taking_psychotropic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a psychotropic agent.","when_to_set_to_false":"Set to false if the patient is currently not taking a psychotropic agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a psychotropic agent.","meaning":"Boolean indicating whether the patient is currently taking a psychotropic agent."} ;; "psychotropic medication"
(declare-const patient_is_taking_psychotropic_agent_now@@dose_is_stable Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a psychotropic agent and the dose is stable.","when_to_set_to_false":"Set to false if the patient is currently taking a psychotropic agent but the dose is not stable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dose of the psychotropic agent is stable.","meaning":"Boolean indicating whether the patient is currently taking a psychotropic agent and the dose is stable."} ;; "stable dose of the psychotropic medication"
(declare-const patient_is_taking_psychotropic_agent_now@@stable_dose_for_at_least_60_days_prior_to_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a psychotropic agent and the dose has been stable for at least 60 days prior to enrollment.","when_to_set_to_false":"Set to false if the patient is currently taking a psychotropic agent but the dose has not been stable for at least 60 days prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dose has been stable for at least 60 days prior to enrollment.","meaning":"Boolean indicating whether the patient is currently taking a psychotropic agent and the dose has been stable for at least 60 days prior to enrollment."} ;; "stable dose of the psychotropic medication for ≥ 60 days prior to enrollment"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply the stem variable (if dose is stable, must be taking the agent)
(assert
  (! (=> patient_is_taking_psychotropic_agent_now@@dose_is_stable
         patient_is_taking_psychotropic_agent_now)
     :named REQ4_AUXILIARY0)) ;; "stable dose of the psychotropic medication" implies taking the medication

;; Qualifier variables imply the stem variable (if dose has been stable for ≥ 60 days, must be taking the agent)
(assert
  (! (=> patient_is_taking_psychotropic_agent_now@@stable_dose_for_at_least_60_days_prior_to_enrollment
         patient_is_taking_psychotropic_agent_now)
     :named REQ4_AUXILIARY1)) ;; "stable dose of the psychotropic medication for ≥ 60 days prior to enrollment" implies taking the medication

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: The patient must be a Veteran with dementia.
(assert
  (! (and patient_is_veteran_now
          patient_has_diagnosis_of_dementia_now)
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be a Veteran with dementia"

;; Component 1: If the patient is taking any psychotropic agent, they must have been on a stable dose for ≥ 60 days prior to enrollment.
(assert
  (! (or (not patient_is_taking_psychotropic_agent_now)
         patient_is_taking_psychotropic_agent_now@@stable_dose_for_at_least_60_days_prior_to_enrollment)
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "if taking any of the following classes of psychotropic medication..., has been on a stable dose of the psychotropic medication for ≥ 60 days prior to enrollment"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_caregiver_who_is_english_speaking_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a caregiver who is an English-speaking caregiver.","when_to_set_to_false":"Set to false if the patient currently does not have a caregiver who is an English-speaking caregiver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a caregiver who is an English-speaking caregiver.","meaning":"Boolean indicating whether the patient currently has a caregiver who is an English-speaking caregiver."} ;; "must have a caregiver who is an English-speaking caregiver"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_caregiver_who_is_english_speaking_now
     :named REQ5_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "must have a caregiver who is an English-speaking caregiver"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const caregiver_self_identifies_as_primary_family_member_caring_for_veteran_now Bool) ;; {"when_to_set_to_true":"Set to true if the caregiver currently self-identifies as the primary member of the family providing hands-on care or supervision for the Veteran.","when_to_set_to_false":"Set to false if the caregiver currently does not self-identify as the primary member of the family providing hands-on care or supervision for the Veteran.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the caregiver currently self-identifies as the primary member of the family providing hands-on care or supervision for the Veteran.","meaning":"Boolean indicating whether the caregiver currently self-identifies as the primary member of the family providing hands-on care or supervision for the Veteran."} ;; "a caregiver who self-identifies as the primary member of the family caring (hands-on OR supervision) for the Veteran"
(declare-const caregiver_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the caregiver's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the caregiver's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the caregiver's current age in years."} ;; "a caregiver who is ≥ 21 years of age"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: Caregiver must self-identify as primary family member caring for Veteran (hands-on OR supervision)
(assert
  (! caregiver_self_identifies_as_primary_family_member_caring_for_veteran_now
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "a caregiver who self-identifies as the primary member of the family caring (hands-on OR supervision) for the Veteran"

;; Component 1: Caregiver must be ≥ 21 years of age
(assert
  (! (>= caregiver_age_value_recorded_now_in_years 21)
     :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "a caregiver who is ≥ 21 years of age"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_caregiver_living_with_veteran_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a caregiver who is living with the Veteran.","when_to_set_to_false":"Set to false if the patient currently does not have a caregiver who is living with the Veteran.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a caregiver who is living with the Veteran.","meaning":"Boolean indicating whether the patient currently has a caregiver who is living with the Veteran."} ;; "must have a caregiver who is living with the Veteran"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! patient_has_caregiver_living_with_veteran_now
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a caregiver who is living with the Veteran."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_has_caregiver_accessible_by_telephone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a caregiver who is accessible by telephone.","when_to_set_to_false":"Set to false if the patient currently does not have a caregiver who is accessible by telephone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a caregiver who is accessible by telephone.","meaning":"Boolean indicating whether the patient currently has a caregiver who is accessible by telephone."} ;; "must have a caregiver who is accessible by telephone"
(declare-const patient_has_caregiver_accessible_by_telephone_now@@able_to_schedule_interview_intervention_and_followup_by_telephone Bool) ;; {"when_to_set_to_true":"Set to true if the patient's caregiver who is accessible by telephone is able to schedule interview, intervention sessions, and follow-up interviews by telephone.","when_to_set_to_false":"Set to false if the patient's caregiver who is accessible by telephone is not able to schedule interview, intervention sessions, and follow-up interviews by telephone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's caregiver who is accessible by telephone is able to schedule interview, intervention sessions, and follow-up interviews by telephone.","meaning":"Boolean indicating whether the patient's caregiver who is accessible by telephone is able to schedule interview, intervention sessions, and follow-up interviews by telephone."} ;; "a caregiver who is accessible by telephone to schedule interview, intervention sessions, AND follow-up interviews"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_caregiver_accessible_by_telephone_now@@able_to_schedule_interview_intervention_and_followup_by_telephone
         patient_has_caregiver_accessible_by_telephone_now)
     :named REQ8_AUXILIARY0)) ;; "a caregiver who is accessible by telephone to schedule interview, intervention sessions, AND follow-up interviews"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! patient_has_caregiver_accessible_by_telephone_now@@able_to_schedule_interview_intervention_and_followup_by_telephone
     :named REQ8_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "a caregiver who is accessible by telephone to schedule interview, intervention sessions, AND follow-up interviews"

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const caregiver_is_planning_to_live_in_area_for_months_value_recorded_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months the caregiver is planning to live in the area, as documented or reported.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many months the caregiver is planning to live in the area.","meaning":"Numeric value representing the number of months the caregiver is planning to live in the area."} ;; "a caregiver who is planning to live in the area for ≥ 8 months"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (>= caregiver_is_planning_to_live_in_area_for_months_value_recorded_in_months 8)
     :named REQ9_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "a caregiver who is planning to live in the area for ≥ 8 months"

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_has_finding_of_has_a_carer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a caregiver.","when_to_set_to_false":"Set to false if the patient currently does not have a caregiver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a caregiver.","meaning":"Boolean indicating whether the patient currently has a caregiver."} ;; "caregiver"
(declare-const patient_has_finding_of_has_a_carer_now@@caregiver_indicates_willingness_to_learn_activity_use Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a caregiver and that caregiver indicates willingness to learn activity use.","when_to_set_to_false":"Set to false if the patient currently has a caregiver but that caregiver does not indicate willingness to learn activity use.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the caregiver indicates willingness to learn activity use.","meaning":"Boolean indicating whether the patient's caregiver indicates willingness to learn activity use."} ;; "caregiver who indicates willingness to learn activity use"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_has_a_carer_now@@caregiver_indicates_willingness_to_learn_activity_use
         patient_has_finding_of_has_a_carer_now)
     :named REQ10_AUXILIARY0)) ;; "caregiver who indicates willingness to learn activity use" implies "has a caregiver"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Component 0: To be included, the patient must have a caregiver who indicates willingness to learn activity use.
(assert
  (! patient_has_finding_of_has_a_carer_now@@caregiver_indicates_willingness_to_learn_activity_use
     :named REQ10_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "must have a caregiver who indicates willingness to learn activity use"

;; ===================== Declarations for the criterion (REQ 11) =====================
(declare-const patient_has_finding_of_has_a_carer_now@@caregiver_reports_at_least_one_neuropsychiatric_symptom_in_veteran_in_past_month Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a caregiver and that caregiver reports at least one neuropsychiatric symptom in the Veteran in the past month.","when_to_set_to_false":"Set to false if the patient currently has a caregiver but that caregiver does not report any neuropsychiatric symptoms in the Veteran in the past month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the caregiver reports at least one neuropsychiatric symptom in the Veteran in the past month.","meaning":"Boolean indicating whether the patient's caregiver reports at least one neuropsychiatric symptom in the Veteran in the past month."} ;; "must have a caregiver who reports at least one neuropsychiatric symptom in the Veteran in the past month"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable implies the patient has a caregiver
(assert
  (! (=> patient_has_finding_of_has_a_carer_now@@caregiver_reports_at_least_one_neuropsychiatric_symptom_in_veteran_in_past_month
         patient_has_finding_of_has_a_carer_now)
     :named REQ11_AUXILIARY0)) ;; "must have a caregiver who reports at least one neuropsychiatric symptom in the Veteran in the past month"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! patient_has_finding_of_has_a_carer_now@@caregiver_reports_at_least_one_neuropsychiatric_symptom_in_veteran_in_past_month
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must have a caregiver who reports at least one neuropsychiatric symptom in the Veteran in the past month"

;; ===================== Declarations for the criterion (REQ 12) =====================
(declare-const patient_has_finding_of_has_a_carer_now@@carer_not_participating_in_other_caregiver_related_intervention_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current caregiver is NOT currently participating in any other caregiver-related intervention.","when_to_set_to_false":"Set to false if the patient's current caregiver IS currently participating in any other caregiver-related intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current caregiver is participating in any other caregiver-related intervention.","meaning":"Boolean indicating whether the patient's current caregiver is NOT currently participating in any other caregiver-related intervention."} ;; "a caregiver who is NOT currently participating in any other caregiver-related intervention"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variable implies the patient has a caregiver
(assert
  (! (=> patient_has_finding_of_has_a_carer_now@@carer_not_participating_in_other_caregiver_related_intervention_now
         patient_has_finding_of_has_a_carer_now)
     :named REQ12_AUXILIARY0)) ;; "the patient must have a caregiver who is NOT currently participating in any other caregiver-related intervention"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
  (! patient_has_finding_of_has_a_carer_now@@carer_not_participating_in_other_caregiver_related_intervention_now
     :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have a caregiver who is NOT currently participating in any other caregiver-related intervention"

;; ===================== Declarations for the criterion (REQ 13) =====================
(declare-const caregiver_is_exposed_to_psychotropic_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's caregiver is currently exposed to (taking) a psychotropic medication at the time of telephone screen.","when_to_set_to_false":"Set to false if the patient's caregiver is not currently exposed to (taking) a psychotropic medication at the time of telephone screen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's caregiver is currently exposed to (taking) a psychotropic medication at the time of telephone screen.","meaning":"Boolean indicating whether the patient's caregiver is currently exposed to (taking) a psychotropic medication at the time of telephone screen."} ;; "caregiver who, if taking psychotropic medication at time of telephone screen"
(declare-const caregiver_is_exposed_to_psychotropic_medication_now@@psychotropic_medication_subcategory_antidepressant Bool) ;; {"when_to_set_to_true":"Set to true if the psychotropic medication the caregiver is currently exposed to is an antidepressant.","when_to_set_to_false":"Set to false if the psychotropic medication the caregiver is currently exposed to is not an antidepressant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the psychotropic medication the caregiver is currently exposed to is an antidepressant.","meaning":"Boolean indicating whether the psychotropic medication the caregiver is currently exposed to is an antidepressant."} ;; "antidepressant"
(declare-const caregiver_is_exposed_to_psychotropic_medication_now@@psychotropic_medication_subcategory_benzodiazepine Bool) ;; {"when_to_set_to_true":"Set to true if the psychotropic medication the caregiver is currently exposed to is a benzodiazepine.","when_to_set_to_false":"Set to false if the psychotropic medication the caregiver is currently exposed to is not a benzodiazepine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the psychotropic medication the caregiver is currently exposed to is a benzodiazepine.","meaning":"Boolean indicating whether the psychotropic medication the caregiver is currently exposed to is a benzodiazepine."} ;; "benzodiazepine"
(declare-const caregiver_is_exposed_to_psychotropic_medication_now@@psychotropic_medication_subcategory_antipsychotic Bool) ;; {"when_to_set_to_true":"Set to true if the psychotropic medication the caregiver is currently exposed to is an antipsychotic.","when_to_set_to_false":"Set to false if the psychotropic medication the caregiver is currently exposed to is not an antipsychotic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the psychotropic medication the caregiver is currently exposed to is an antipsychotic.","meaning":"Boolean indicating whether the psychotropic medication the caregiver is currently exposed to is an antipsychotic."} ;; "antipsychotic"
(declare-const caregiver_is_exposed_to_psychotropic_medication_now@@psychotropic_medication_subcategory_anticonvulsant Bool) ;; {"when_to_set_to_true":"Set to true if the psychotropic medication the caregiver is currently exposed to is an anticonvulsant.","when_to_set_to_false":"Set to false if the psychotropic medication the caregiver is currently exposed to is not an anticonvulsant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the psychotropic medication the caregiver is currently exposed to is an anticonvulsant.","meaning":"Boolean indicating whether the psychotropic medication the caregiver is currently exposed to is an anticonvulsant."} ;; "anticonvulsant"
(declare-const caregiver_stable_dose_duration_psychotropic_medication_prior_to_enrollment_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days the patient's caregiver has been on a stable dose of the psychotropic medication prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days the patient's caregiver has been on a stable dose of the psychotropic medication prior to enrollment.","meaning":"Numeric value indicating the number of days the patient's caregiver has been on a stable dose of the psychotropic medication prior to enrollment."} ;; "stable dose of the psychotropic medication for ≥ 60 days prior to enrollment"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Exhaustive subcategories define the umbrella exactly:
(assert
  (! (= caregiver_is_exposed_to_psychotropic_medication_now
        (or caregiver_is_exposed_to_psychotropic_medication_now@@psychotropic_medication_subcategory_antidepressant
            caregiver_is_exposed_to_psychotropic_medication_now@@psychotropic_medication_subcategory_benzodiazepine
            caregiver_is_exposed_to_psychotropic_medication_now@@psychotropic_medication_subcategory_antipsychotic
            caregiver_is_exposed_to_psychotropic_medication_now@@psychotropic_medication_subcategory_anticonvulsant))
     :named REQ13_AUXILIARY0)) ;; "psychotropic medication with exhaustive subcategories (antidepressant OR benzodiazepine OR antipsychotic OR anticonvulsant)"

;; ===================== Constraint Assertions (REQ 13) =====================
;; If the caregiver is taking a psychotropic medication (from exhaustive subcategories) at time of telephone screen, they must have been on a stable dose for ≥ 60 days prior to enrollment.
(assert
  (! (or (not caregiver_is_exposed_to_psychotropic_medication_now)
         (>= caregiver_stable_dose_duration_psychotropic_medication_prior_to_enrollment_in_days 60))
     :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if taking psychotropic medication at time of telephone screen, has been on a stable dose of the psychotropic medication for ≥ 60 days prior to enrollment"
