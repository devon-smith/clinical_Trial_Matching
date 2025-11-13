;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (e.g., male or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."}  ;; "a woman"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "age ≥ 60 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be a woman.
(assert
  (! patient_sex_is_female_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a woman."

;; Component 1: To be included, the patient must be age ≥ 60 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 60)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be age ≥ 60 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_general_well_being_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in good general health (has good general well-being).","when_to_set_to_false":"Set to false if the patient is currently not in good general health (does not have good general well-being).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in good general health.","meaning":"Boolean indicating whether the patient currently has good general well-being (is in good general health)."} ;; "the patient must be in good general health"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_general_well_being_finding_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be in good general health"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_willing_to_participate_in_this_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient expresses willingness to participate in this study.","when_to_set_to_false":"Set to false if the patient expresses unwillingness to participate in this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to participate in this study.","meaning":"Boolean indicating whether the patient is willing to participate in this study."} ;; "the patient must be willing to participate in this study"
(declare-const study_duration_value_in_years Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the duration of the study in years (e.g., 3.5).","when_to_set_to_null":"Set to null if the study duration in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the duration of the study in years."} ;; "study duration = 3.5 years"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_is_willing_to_participate_in_this_study
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be willing to participate in this study (study duration = 3.5 years)"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_ability_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the ability to give informed consent.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to give informed consent.","meaning":"Boolean indicating whether the patient currently has the ability to give informed consent."} ;; "the patient must have the ability to give informed consent"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_ability_to_give_informed_consent_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have the ability to give informed consent"

;; ===================== Declarations for the inclusion criterion (REQ 4) =====================
(declare-const patient_has_ability_to_live_independently_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the ability to live independently.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to live independently.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to live independently.","meaning":"Boolean indicating whether the patient currently has the ability to live independently."} ;; "the patient must have the ability to live independently"
(declare-const patient_has_ability_to_travel_to_research_center_for_visits_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the ability to travel to the research center for visits.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to travel to the research center for visits.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to travel to the research center for visits.","meaning":"Boolean indicating whether the patient currently has the ability to travel to the research center for visits."} ;; "the patient must have the ability to travel to the research center for visits (with transportation provided on a limited basis)"
(declare-const patient_has_ability_to_travel_to_research_center_for_visits_now@@with_transportation_provided_on_limited_basis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's ability to travel to the research center for visits is with transportation provided on a limited basis.","when_to_set_to_false":"Set to false if the patient's ability to travel to the research center for visits is not with transportation provided on a limited basis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether transportation is provided on a limited basis for the patient's ability to travel to the research center for visits.","meaning":"Boolean indicating whether the patient's ability to travel to the research center for visits is with transportation provided on a limited basis."} ;; "with transportation provided on a limited basis"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_ability_to_travel_to_research_center_for_visits_now@@with_transportation_provided_on_limited_basis
         patient_has_ability_to_travel_to_research_center_for_visits_now)
     :named REQ4_AUXILIARY0)) ;; "with transportation provided on a limited basis" implies "ability to travel to research center for visits"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: The patient must have the ability to live independently.
(assert
  (! patient_has_ability_to_live_independently_now
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have the ability to live independently"

;; Component 1: The patient must have the ability to travel to the research center for visits (with transportation provided on a limited basis).
(assert
  (! patient_has_ability_to_travel_to_research_center_for_visits_now
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient must have the ability to travel to the research center for visits (with transportation provided on a limited basis)"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_bone_density_finding_value_recorded_now_withunit_tscore Real) ;; {"when_to_set_to_value":"Set to the measured T-score value if a bone mineral density T-score at the lumbar vertebrae L1-4 or hip is recorded now.","when_to_set_to_null":"Set to null if no such T-score measurement is available or the value is indeterminate.","meaning":"Numeric T-score representing the patient's bone mineral density measured now."} ;; "bone mineral density T-score"
(declare-const patient_bone_density_finding_value_recorded_now_withunit_tscore@@measured_at_lumbar_vertebrae_l1_4 Bool) ;; {"when_to_set_to_true":"Set to true if the bone mineral density T-score value was measured at the lumbar vertebrae L1-4.","when_to_set_to_false":"Set to false if the bone mineral density T-score value was not measured at the lumbar vertebrae L1-4.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the measurement was at the lumbar vertebrae L1-4.","meaning":"Boolean indicating whether the bone mineral density T-score value was measured at the lumbar vertebrae L1-4."} ;; "bone mineral density measured at lumbar vertebrae L1-4"
(declare-const patient_bone_density_finding_value_recorded_now_withunit_tscore@@measured_at_hip Bool) ;; {"when_to_set_to_true":"Set to true if the bone mineral density T-score value was measured at the hip.","when_to_set_to_false":"Set to false if the bone mineral density T-score value was not measured at the hip.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the measurement was at the hip.","meaning":"Boolean indicating whether the bone mineral density T-score value was measured at the hip."} ;; "bone mineral density measured at hip"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply that a T-score value is present
(assert
  (! (=> patient_bone_density_finding_value_recorded_now_withunit_tscore@@measured_at_lumbar_vertebrae_l1_4
         true)
     :named REQ5_AUXILIARY0)) ;; "bone mineral density measured at lumbar vertebrae L1-4"
(assert
  (! (=> patient_bone_density_finding_value_recorded_now_withunit_tscore@@measured_at_hip
         true)
     :named REQ5_AUXILIARY1)) ;; "bone mineral density measured at hip"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: ((spine BMD T-score ≥ -2.5 AND ≤ -1.0) OR (hip BMD T-score ≥ -2.5 AND ≤ -1.0))
(assert
  (! (or
        (and patient_bone_density_finding_value_recorded_now_withunit_tscore@@measured_at_lumbar_vertebrae_l1_4
             (>= patient_bone_density_finding_value_recorded_now_withunit_tscore -2.5)
             (<= patient_bone_density_finding_value_recorded_now_withunit_tscore -1.0))
        (and patient_bone_density_finding_value_recorded_now_withunit_tscore@@measured_at_hip
             (>= patient_bone_density_finding_value_recorded_now_withunit_tscore -2.5)
             (<= patient_bone_density_finding_value_recorded_now_withunit_tscore -1.0)))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((have a spine bone mineral density (bone mineral density measured at lumbar vertebrae L1-4) T-score ≥ -2.5 AND T-score ≤ -1.0) OR (have a hip bone mineral density T-score ≥ -2.5 AND T-score ≤ -1.0))."
