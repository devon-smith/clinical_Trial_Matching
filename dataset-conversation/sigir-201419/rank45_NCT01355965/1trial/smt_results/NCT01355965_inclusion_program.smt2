;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_malignant_mesothelioma_of_pleura_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of malignant mesothelioma of the pleura.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of malignant mesothelioma of the pleura.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of malignant mesothelioma of the pleura.","meaning":"Boolean indicating whether the patient currently has malignant mesothelioma of the pleura."} // "malignant pleural mesothelioma"
(declare-const patient_has_finding_of_malignant_mesothelioma_of_pleura_now@@histologically_confirmed Bool) ;; {"when_to_set_to_true":"Set to true if the patient's malignant mesothelioma of the pleura diagnosis is histologically confirmed.","when_to_set_to_false":"Set to false if the patient's malignant mesothelioma of the pleura diagnosis is not histologically confirmed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is histologically confirmed.","meaning":"Boolean indicating whether the patient's malignant mesothelioma of the pleura diagnosis is histologically confirmed."} // "histologically confirmed malignant pleural mesothelioma"
(declare-const patient_has_finding_of_biphasic_malignant_mesothelioma_of_pleura_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of biphasic malignant mesothelioma of the pleura.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of biphasic malignant mesothelioma of the pleura.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of biphasic malignant mesothelioma of the pleura.","meaning":"Boolean indicating whether the patient currently has biphasic malignant mesothelioma of the pleura."} // "biphasic malignant pleural mesothelioma"
(declare-const patient_has_finding_of_biphasic_malignant_mesothelioma_of_pleura_now@@histologically_confirmed Bool) ;; {"when_to_set_to_true":"Set to true if the patient's biphasic malignant mesothelioma of the pleura diagnosis is histologically confirmed.","when_to_set_to_false":"Set to false if the patient's biphasic malignant mesothelioma of the pleura diagnosis is not histologically confirmed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is histologically confirmed.","meaning":"Boolean indicating whether the patient's biphasic malignant mesothelioma of the pleura diagnosis is histologically confirmed."} // "histologically confirmed biphasic malignant pleural mesothelioma"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_malignant_mesothelioma_of_pleura_now@@histologically_confirmed
         patient_has_finding_of_malignant_mesothelioma_of_pleura_now)
     :named REQ0_AUXILIARY0)) ;; "histologically confirmed malignant pleural mesothelioma" implies "malignant pleural mesothelioma"

(assert
  (! (=> patient_has_finding_of_biphasic_malignant_mesothelioma_of_pleura_now@@histologically_confirmed
         patient_has_finding_of_biphasic_malignant_mesothelioma_of_pleura_now)
     :named REQ0_AUXILIARY1)) ;; "histologically confirmed biphasic malignant pleural mesothelioma" implies "biphasic malignant pleural mesothelioma"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must have (histologically confirmed epithelial malignant pleural mesothelioma OR histologically confirmed biphasic malignant pleural mesothelioma).
(assert
  (! (or patient_has_finding_of_malignant_mesothelioma_of_pleura_now@@histologically_confirmed
         patient_has_finding_of_biphasic_malignant_mesothelioma_of_pleura_now@@histologically_confirmed)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (histologically confirmed epithelial malignant pleural mesothelioma OR histologically confirmed biphasic malignant pleural mesothelioma)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_undergone_first_line_treatment_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone first line treatment at any time in the past.","when_to_set_to_false":"Set to false if the patient has not undergone first line treatment at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone first line treatment in the past.","meaning":"Boolean indicating whether the patient has undergone first line treatment in the past."} // "standard first line therapy"
(declare-const patient_has_undergone_first_line_treatment_inthehistory@@completed Bool) ;; {"when_to_set_to_true":"Set to true if the patient's first line treatment was completed.","when_to_set_to_false":"Set to false if the patient's first line treatment was not completed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the first line treatment was completed.","meaning":"Boolean indicating whether the patient's first line treatment was completed."} // "have completed standard first line therapy"
(declare-const patient_has_undergone_first_line_treatment_inthehistory@@platinum_based_double_regimen Bool) ;; {"when_to_set_to_true":"Set to true if the patient's first line treatment regimen was platinum-based and doublet.","when_to_set_to_false":"Set to false if the patient's first line treatment regimen was not platinum-based and doublet.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the regimen was platinum-based and doublet.","meaning":"Boolean indicating whether the patient's first line treatment regimen was platinum-based and doublet."} // "platinum-based double regimen"
(declare-const patient_has_finding_of_tumor_progression_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had tumor progression at any time in the past.","when_to_set_to_false":"Set to false if the patient has not had tumor progression at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had tumor progression in the past.","meaning":"Boolean indicating whether the patient has had tumor progression in the past."} // "progressive disease"
(declare-const patient_has_chosen_not_to_pursue_primary_standard_of_care_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient has chosen not to pursue primary standard of care therapy.","when_to_set_to_false":"Set to false if the patient has not chosen to forgo primary standard of care therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has chosen not to pursue primary standard of care therapy.","meaning":"Boolean indicating whether the patient has chosen not to pursue primary standard of care therapy."} // "have chosen NOT to pursue primary standard of care therapy"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_undergone_first_line_treatment_inthehistory@@completed
         patient_has_undergone_first_line_treatment_inthehistory)
     :named REQ1_AUXILIARY0)) ;; "have completed standard first line therapy"

(assert
  (! (=> patient_has_undergone_first_line_treatment_inthehistory@@platinum_based_double_regimen
         patient_has_undergone_first_line_treatment_inthehistory)
     :named REQ1_AUXILIARY1)) ;; "platinum-based double regimen"

;; ===================== Constraint Assertions (REQ 1) =====================
;; To be included, the patient must ((have completed standard first line therapy with a platinum-based double regimen AND had progressive disease) OR (have chosen NOT to pursue primary standard of care therapy)).
(assert
  (! (or (and patient_has_undergone_first_line_treatment_inthehistory@@completed
              patient_has_undergone_first_line_treatment_inthehistory@@platinum_based_double_regimen
              patient_has_finding_of_tumor_progression_inthehistory)
         patient_has_chosen_not_to_pursue_primary_standard_of_care_therapy)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const eastern_cooperative_oncology_group_performance_status_value_recorded_now_withunit_none Int) ;; {"when_to_set_to_value":"Set to the integer value of the patient's ECOG performance status as recorded at the current time (e.g., 0, 1, 2, etc.).","when_to_set_to_null":"Set to null if the ECOG performance status is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric value representing the patient's ECOG performance status at the current time (no unit; integer score)."} // "Eastern Cooperative Oncology Group performance status value recorded now"

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must have ECOG performance status = 0 OR ECOG performance status = 1.
(assert
  (! (or (= eastern_cooperative_oncology_group_performance_status_value_recorded_now_withunit_none 0)
         (= eastern_cooperative_oncology_group_performance_status_value_recorded_now_withunit_none 1))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have Eastern Cooperative Oncology Group performance status = 0 OR Eastern Cooperative Oncology Group performance status = 1."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "older than 18 years"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 18)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be older than 18 years."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_longevity_value_recorded_now_withunit_months Real) ;; {"when_to_set_to_value":"Set to the estimated number of months if the patient's current life expectancy is documented or determined.","when_to_set_to_null":"Set to null if the patient's current life expectancy in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current life expectancy in months."} // "life expectancy > 4 months"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (> patient_longevity_value_recorded_now_withunit_months 4.0)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have life expectancy > 4 months."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_undergone_chemotherapy_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone chemotherapy at any time within the past 2 weeks (i.e., between now and 2 weeks ago).","when_to_set_to_false":"Set to false if the patient has not undergone chemotherapy within the past 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone chemotherapy within the past 2 weeks.","meaning":"Boolean indicating whether the patient has undergone chemotherapy within the past 2 weeks."} // "chemotherapy"
(declare-const patient_has_undergone_radiotherapy_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone radiotherapy at any time within the past 2 weeks (i.e., between now and 2 weeks ago).","when_to_set_to_false":"Set to false if the patient has not undergone radiotherapy within the past 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone radiotherapy within the past 2 weeks.","meaning":"Boolean indicating whether the patient has undergone radiotherapy within the past 2 weeks."}
(declare-const patient_has_undergone_immunological_therapy_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone immunological therapy at any time within the past 2 weeks (i.e., between now and 2 weeks ago).","when_to_set_to_false":"Set to false if the patient has not undergone immunological therapy within the past 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone immunological therapy within the past 2 weeks.","meaning":"Boolean indicating whether the patient has undergone immunological therapy within the past 2 weeks."}
(declare-const patient_has_undergone_interferon_therapy_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone interferon therapy at any time within the past 2 weeks (i.e., between now and 2 weeks ago).","when_to_set_to_false":"Set to false if the patient has not undergone interferon therapy within the past 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone interferon therapy within the past 2 weeks.","meaning":"Boolean indicating whether the patient has undergone interferon therapy within the past 2 weeks."}
(declare-const patient_has_undergone_tumor_necrosis_factor_therapy_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone tumor necrosis factor therapy at any time within the past 2 weeks (i.e., between now and 2 weeks ago).","when_to_set_to_false":"Set to false if the patient has not undergone tumor necrosis factor therapy within the past 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone tumor necrosis factor therapy within the past 2 weeks.","meaning":"Boolean indicating whether the patient has undergone tumor necrosis factor therapy within the past 2 weeks."}
(declare-const patient_has_undergone_interleukin_therapy_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone interleukin therapy at any time within the past 2 weeks (i.e., between now and 2 weeks ago).","when_to_set_to_false":"Set to false if the patient has not undergone interleukin therapy within the past 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone interleukin therapy within the past 2 weeks.","meaning":"Boolean indicating whether the patient has undergone interleukin therapy within the past 2 weeks."}
(declare-const patient_has_undergone_monoclonal_antibody_therapy_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone monoclonal antibody therapy at any time within the past 2 weeks (i.e., between now and 2 weeks ago).","when_to_set_to_false":"Set to false if the patient has not undergone monoclonal antibody therapy within the past 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone monoclonal antibody therapy within the past 2 weeks.","meaning":"Boolean indicating whether the patient has undergone monoclonal antibody therapy within the past 2 weeks."}
(declare-const patient_is_undergoing_chemotherapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing chemotherapy at the time of inclusion.","when_to_set_to_false":"Set to false if the patient is not currently undergoing chemotherapy at the time of inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing chemotherapy.","meaning":"Boolean indicating whether the patient is currently undergoing chemotherapy."}
(declare-const patient_is_undergoing_radiotherapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing radiotherapy at the time of inclusion.","when_to_set_to_false":"Set to false if the patient is not currently undergoing radiotherapy at the time of inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing radiotherapy.","meaning":"Boolean indicating whether the patient is currently undergoing radiotherapy."}
(declare-const patient_is_undergoing_immunological_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing immunological therapy at the time of inclusion.","when_to_set_to_false":"Set to false if the patient is not currently undergoing immunological therapy at the time of inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing immunological therapy.","meaning":"Boolean indicating whether the patient is currently undergoing immunological therapy."}
(declare-const patient_has_fully_recovered_from_adverse_events_related_to_chemotherapy_radiotherapy_or_immunotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient has fully recovered from all adverse events related to chemotherapy, radiotherapy, or immunotherapy.","when_to_set_to_false":"Set to false if the patient has not fully recovered from any adverse events related to chemotherapy, radiotherapy, or immunotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has fully recovered from adverse events related to chemotherapy, radiotherapy, or immunotherapy.","meaning":"Boolean indicating whether the patient has fully recovered from any adverse events related to chemotherapy, radiotherapy, or immunotherapy."}

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Non-exhaustive examples: prior interferon, TNF, interleukin, monoclonal antibody therapy are examples of immunological therapy
(assert
  (! (=> (or patient_has_undergone_interferon_therapy_inthepast2weeks
            patient_has_undergone_tumor_necrosis_factor_therapy_inthepast2weeks
            patient_has_undergone_interleukin_therapy_inthepast2weeks
            patient_has_undergone_monoclonal_antibody_therapy_inthepast2weeks)
         patient_has_undergone_immunological_therapy_inthepast2weeks)
     :named REQ5_AUXILIARY0)) ;; "prior immunotherapy (with non-exhaustive examples (prior interferon therapy OR prior tumor necrosis factor therapy OR prior interleukin therapy OR prior monoclonal antibody therapy))"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: At least 2 weeks since prior chemotherapy OR radiotherapy OR immunotherapy
(assert
  (! (or (not patient_has_undergone_chemotherapy_inthepast2weeks)
         (not patient_has_undergone_radiotherapy_inthepast2weeks)
         (not patient_has_undergone_immunological_therapy_inthepast2weeks))
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "at least 2 weeks since prior chemotherapy OR radiotherapy OR immunotherapy"

;; Component 1: NOT receiving concurrent chemotherapy
(assert
  (! (not patient_is_undergoing_chemotherapy_now)
     :named REQ5_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "NOT be receiving concurrent chemotherapy"

;; Component 2: NOT receiving concurrent radiotherapy
(assert
  (! (not patient_is_undergoing_radiotherapy_now)
     :named REQ5_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "NOT be receiving concurrent radiotherapy"

;; Component 3: NOT receiving concurrent immunotherapy
(assert
  (! (not patient_is_undergoing_immunological_therapy_now)
     :named REQ5_COMPONENT3_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "NOT be receiving concurrent immunotherapy"

;; Component 4: Fully recovered from any adverse events related to these agents
(assert
  (! patient_has_fully_recovered_from_adverse_events_related_to_chemotherapy_radiotherapy_or_immunotherapy
     :named REQ5_COMPONENT4_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "have fully recovered from any adverse events related to these agents"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_is_receiving_concurrent_investigational_agent_administration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving administration of an investigational agent.","when_to_set_to_false":"Set to false if the patient is not currently receiving administration of an investigational agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving administration of an investigational agent.","meaning":"Boolean indicating whether the patient is currently receiving administration of an investigational agent."} // "NOT be receiving concurrent investigational agent administration"
(declare-const weeks_since_prior_investigational_agent_administration Real) ;; {"when_to_set_to_value":"Set to the number of weeks that have elapsed since the patient's most recent prior investigational agent administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many weeks have elapsed since the patient's most recent prior investigational agent administration.","meaning":"Numeric value representing the number of weeks since the patient's most recent prior investigational agent administration."} // "more than 4 weeks since prior investigational agent administration"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: patient must have had more than 4 weeks since prior investigational agent administration
(assert
  (! (> weeks_since_prior_investigational_agent_administration 4.0)
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "have had more than 4 weeks since prior investigational agent administration"

;; Component 1: patient must NOT be receiving concurrent investigational agent administration
(assert
  (! (not patient_is_receiving_concurrent_investigational_agent_administration_now)
     :named REQ6_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "NOT be receiving concurrent investigational agent administration"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_finding_of_malignant_mesothelioma_of_pleura_now@@measurable_by_accepted_mesothelioma_measurement_techniques Bool) ;; {"when_to_set_to_true":"Set to true if the patient's malignant mesothelioma of the pleura is measurable by accepted measurement techniques (such as modified RECIST criteria).","when_to_set_to_false":"Set to false if the patient's malignant mesothelioma of the pleura is not measurable by accepted measurement techniques.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's malignant mesothelioma of the pleura is measurable by accepted measurement techniques.","meaning":"Boolean indicating whether the patient's malignant mesothelioma of the pleura is measurable by accepted measurement techniques."} // "measurable disease as defined by accepted malignant pleural mesothelioma measurement techniques (modified RECIST criteria)"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_malignant_mesothelioma_of_pleura_now@@measurable_by_accepted_mesothelioma_measurement_techniques
         patient_has_finding_of_malignant_mesothelioma_of_pleura_now)
     :named REQ7_AUXILIARY0)) ;; "measurable disease as defined by accepted malignant pleural mesothelioma measurement techniques (modified RECIST criteria)"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! patient_has_finding_of_malignant_mesothelioma_of_pleura_now@@measurable_by_accepted_mesothelioma_measurement_techniques
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have measurable disease as defined by accepted malignant pleural mesothelioma measurement techniques (modified RECIST criteria)."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const partial_thromboplastin_time_upper_limit_of_normal_value_withunit_seconds Real) ;; {"when_to_set_to_value":"Set to the upper limit of normal for partial thromboplastin time in seconds as defined by the laboratory reference range.","when_to_set_to_null":"Set to null if the upper limit of normal for partial thromboplastin time is not available or indeterminate.","meaning":"Numeric value representing the upper limit of normal for partial thromboplastin time (PTT) in seconds."} // "upper limit of normal for partial thromboplastin time"
(declare-const patient_has_diagnosis_of_venous_thrombosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of venous thrombosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of venous thrombosis.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient currently has a diagnosis of venous thrombosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of venous thrombosis."} // "venous thrombosis"
(declare-const patient_has_diagnosis_of_venous_thrombosis_now@@managed_therapeutically_with_warfarin Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of venous thrombosis and is being managed therapeutically with warfarin.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of venous thrombosis but is not being managed therapeutically with warfarin.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient with venous thrombosis is being managed therapeutically with warfarin.","meaning":"Boolean indicating whether the patient with venous thrombosis is being managed therapeutically with warfarin."} // "managed therapeutically with warfarin"
(declare-const patient_has_undergone_prothrombin_time_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a prothrombin time test now.","when_to_set_to_false":"Set to false if the patient has not undergone a prothrombin time test now.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient has undergone a prothrombin time test now.","meaning":"Boolean indicating whether the patient has undergone a prothrombin time test now."} // "prothrombin time"
(declare-const patient_international_normalized_ratio_value_recorded_now_withunit_ratio Real) ;; {"when_to_set_to_value":"Set to the measured INR value if a current INR measurement is available.","when_to_set_to_null":"Set to null if no current INR measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current international normalized ratio (INR)."} // "international normalized ratio"
(declare-const patient_partial_thromboplastin_time_value_recorded_now_withunit_seconds Real) ;; {"when_to_set_to_value":"Set to the measured partial thromboplastin time value in seconds if a current measurement is available.","when_to_set_to_null":"Set to null if no current partial thromboplastin time measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current partial thromboplastin time (PTT) in seconds."} // "partial thromboplastin time"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_diagnosis_of_venous_thrombosis_now@@managed_therapeutically_with_warfarin
         patient_has_diagnosis_of_venous_thrombosis_now)
     :named REQ8_AUXILIARY0)) ;; "managed therapeutically with warfarin" implies "venous thrombosis"

;; Non-exhaustive example: pulmonary thromboembolus is a subclass of venous thrombosis
;; (No variable for pulmonary thromboembolus in <new_variable_declarations>, so not asserted here.)

;; INR in-range definition (usually between 2 and 3) for patients on stable therapeutic warfarin for venous thrombosis
(define-fun patient_international_normalized_ratio_in_range_for_therapeutic_warfarin () Bool
  (and (>= patient_international_normalized_ratio_value_recorded_now_withunit_ratio 2.0)
       (<= patient_international_normalized_ratio_value_recorded_now_withunit_ratio 3.0))) ;; "international normalized ratio in-range (usually between 2 and 3)"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Component 0: ((INR < 1.5) OR (INR in-range (2-3) if on stable therapeutic warfarin for venous thrombosis))
(assert
  (! (or
        (< patient_international_normalized_ratio_value_recorded_now_withunit_ratio 1.5) ;; "international normalized ratio < 1.5"
        (and patient_has_diagnosis_of_venous_thrombosis_now@@managed_therapeutically_with_warfarin
             patient_international_normalized_ratio_in_range_for_therapeutic_warfarin)) ;; "INR in-range (2-3) if on stable dose of therapeutic warfarin for venous thrombosis"
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS))

;; Component 1: partial thromboplastin time < 1.2 times the upper limit of normal
(assert
  (! (< patient_partial_thromboplastin_time_value_recorded_now_withunit_seconds
        (* 1.2 partial_thromboplastin_time_upper_limit_of_normal_value_withunit_seconds))
     :named REQ8_COMPONENT1_OTHER_REQUIREMENTS))

;; ===================== Declarations for the inclusion criterion (REQ 9) =====================
(declare-const patient_can_undergo_apheresis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo apheresis.","when_to_set_to_false":"Set to false if the patient cannot currently undergo apheresis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo apheresis.","meaning":"Boolean indicating whether the patient can currently undergo apheresis."} // "have adequate venous peripheral access for apheresis"
(declare-const patient_has_adequate_venous_peripheral_access_for_apheresis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has adequate venous peripheral access for apheresis.","when_to_set_to_false":"Set to false if the patient currently does not have adequate venous peripheral access for apheresis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has adequate venous peripheral access for apheresis.","meaning":"Boolean indicating whether the patient currently has adequate venous peripheral access for apheresis."} // "adequate venous peripheral access for apheresis"
(declare-const patient_has_adequate_venous_access_for_modified_chimeric_immune_receptor_t_cell_administration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has adequate venous access for subsequent modified chimeric immune receptor T cell administration.","when_to_set_to_false":"Set to false if the patient currently does not have adequate venous access for subsequent modified chimeric immune receptor T cell administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has adequate venous access for subsequent modified chimeric immune receptor T cell administration.","meaning":"Boolean indicating whether the patient currently has adequate venous access for subsequent modified chimeric immune receptor T cell administration."} // "adequate venous access for subsequent modified chimeric immune receptor T cell administration"
(declare-const patient_has_adequate_venous_access_for_modified_chimeric_immune_receptor_t_cell_administration_now@@can_be_done_through_central_venous_access_device Bool) ;; {"when_to_set_to_true":"Set to true if the adequate venous access for subsequent modified chimeric immune receptor T cell administration can be achieved through a central venous access device.","when_to_set_to_false":"Set to false if the adequate venous access for subsequent modified chimeric immune receptor T cell administration cannot be achieved through a central venous access device.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the adequate venous access for subsequent modified chimeric immune receptor T cell administration can be achieved through a central venous access device.","meaning":"Boolean indicating whether the adequate venous access for subsequent modified chimeric immune receptor T cell administration can be achieved through a central venous access device."} // "can be done through a central venous access device"
;; Non-exhaustive example: port for systemic chemotherapy
(declare-const patient_has_adequate_venous_access_for_modified_chimeric_immune_receptor_t_cell_administration_now@@can_be_done_through_central_venous_access_device@@port_for_systemic_chemotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the adequate venous access for subsequent modified chimeric immune receptor T cell administration can be achieved specifically through a port for systemic chemotherapy.","when_to_set_to_false":"Set to false if the adequate venous access for subsequent modified chimeric immune receptor T cell administration cannot be achieved specifically through a port for systemic chemotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the adequate venous access for subsequent modified chimeric immune receptor T cell administration can be achieved specifically through a port for systemic chemotherapy.","meaning":"Boolean indicating whether the adequate venous access for subsequent modified chimeric immune receptor T cell administration can be achieved specifically through a port for systemic chemotherapy."} // "port for systemic chemotherapy"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_adequate_venous_access_for_modified_chimeric_immune_receptor_t_cell_administration_now@@can_be_done_through_central_venous_access_device
         patient_has_adequate_venous_access_for_modified_chimeric_immune_receptor_t_cell_administration_now)
     :named REQ9_AUXILIARY0)) ;; "can be done through a central venous access device"

;; Non-exhaustive example implies umbrella qualifier
(assert
  (! (=> patient_has_adequate_venous_access_for_modified_chimeric_immune_receptor_t_cell_administration_now@@can_be_done_through_central_venous_access_device@@port_for_systemic_chemotherapy
         patient_has_adequate_venous_access_for_modified_chimeric_immune_receptor_t_cell_administration_now@@can_be_done_through_central_venous_access_device)
     :named REQ9_AUXILIARY1)) ;; "port for systemic chemotherapy" is a non-exhaustive example of central venous access device

;; Adequate venous peripheral access for apheresis implies ability to undergo apheresis
(assert
  (! (=> patient_has_adequate_venous_peripheral_access_for_apheresis_now
         patient_can_undergo_apheresis_now)
     :named REQ9_AUXILIARY2)) ;; "adequate venous peripheral access for apheresis" enables "can undergo apheresis"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Component 0: Must have adequate venous peripheral access for apheresis
(assert
  (! patient_has_adequate_venous_peripheral_access_for_apheresis_now
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "have adequate venous peripheral access for apheresis"

;; Component 1: Must have adequate venous access for subsequent modified chimeric immune receptor T cell administration
(assert
  (! patient_has_adequate_venous_access_for_modified_chimeric_immune_receptor_t_cell_administration_now
     :named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "have adequate venous access for subsequent modified chimeric immune receptor T cell administration"

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_is_receiving_short_term_therapy_for_acute_conditions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving short-term therapy for acute conditions.","when_to_set_to_false":"Set to false if the patient is currently not receiving short-term therapy for acute conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving short-term therapy for acute conditions.","meaning":"Boolean indicating whether the patient is currently receiving short-term therapy for acute conditions."} // "the patient may receive short-term therapy for acute conditions"
(declare-const patient_is_receiving_short_term_therapy_for_acute_conditions_now@@acute_conditions_not_specifically_related_to_malignant_pleural_mesothelioma Bool) ;; {"when_to_set_to_true":"Set to true if the acute conditions for which short-term therapy is given are NOT specifically related to malignant pleural mesothelioma.","when_to_set_to_false":"Set to false if the acute conditions for which short-term therapy is given are specifically related to malignant pleural mesothelioma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the acute conditions for which short-term therapy is given are specifically related to malignant pleural mesothelioma.","meaning":"Boolean indicating whether the acute conditions for which short-term therapy is given are NOT specifically related to malignant pleural mesothelioma."} // "NOT specifically related to malignant pleural mesothelioma"
(declare-const patient_is_receiving_short_term_therapy_for_acute_conditions_now@@short_term_therapy_does_not_include_immune_modulating_agent_administration Bool) ;; {"when_to_set_to_true":"Set to true if the short-term therapy for acute conditions does NOT include any immune modulating agent administration.","when_to_set_to_false":"Set to false if the short-term therapy for acute conditions does include immune modulating agent administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the short-term therapy for acute conditions includes immune modulating agent administration.","meaning":"Boolean indicating whether the short-term therapy for acute conditions does NOT include any immune modulating agent administration."} // "short-term therapy does NOT include any immune modulating agent administration"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_is_receiving_short_term_therapy_for_acute_conditions_now@@acute_conditions_not_specifically_related_to_malignant_pleural_mesothelioma
         patient_is_receiving_short_term_therapy_for_acute_conditions_now)
     :named REQ10_AUXILIARY0)) ;; "acute conditions not specifically related to malignant pleural mesothelioma" implies short-term therapy for acute conditions

(assert
  (! (=> patient_is_receiving_short_term_therapy_for_acute_conditions_now@@short_term_therapy_does_not_include_immune_modulating_agent_administration
         patient_is_receiving_short_term_therapy_for_acute_conditions_now)
     :named REQ10_AUXILIARY1)) ;; "short-term therapy does NOT include any immune modulating agent administration" implies short-term therapy for acute conditions

;; ===================== Constraint Assertions (REQ 10) =====================
;; Inclusion: patient may receive short-term therapy for acute conditions (NOT specifically related to malignant pleural mesothelioma) IF the short-term therapy does NOT include any immune modulating agent administration
(assert
  (! (or (not patient_is_receiving_short_term_therapy_for_acute_conditions_now)
         (and patient_is_receiving_short_term_therapy_for_acute_conditions_now@@acute_conditions_not_specifically_related_to_malignant_pleural_mesothelioma
              patient_is_receiving_short_term_therapy_for_acute_conditions_now@@short_term_therapy_does_not_include_immune_modulating_agent_administration))
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient may receive short-term therapy for acute conditions (NOT specifically related to malignant pleural mesothelioma) if (the short-term therapy does NOT include any immune modulating agent administration)."

;; ===================== Declarations for the criterion (REQ 11) =====================
(declare-const patient_agrees_to_abstinence_during_study_and_for_3_months_following_last_dose_of_study_cell_infusion Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to practice abstinence during the study and for 3 months following the last dose of the study cell infusion.","when_to_set_to_false":"Set to false if the patient does not agree to practice abstinence for the full required period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to practice abstinence for the full required period.","meaning":"Boolean indicating whether the patient agrees to practice abstinence during the study and for 3 months following the last dose of the study cell infusion."} // "abstinence during the study AND for 3 months following the last dose of the study cell infusion"
(declare-const patient_agrees_to_use_approved_contraceptive_method_during_study_and_for_3_months_following_last_dose_of_study_cell_infusion Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to use an approved contraceptive method during the study and for 3 months following the last dose of the study cell infusion.","when_to_set_to_false":"Set to false if the patient does not agree to use an approved contraceptive method for the full required period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to use an approved contraceptive method for the full required period.","meaning":"Boolean indicating whether the patient agrees to use an approved contraceptive method during the study and for 3 months following the last dose of the study cell infusion."} // "approved contraceptive method administration during the study AND for 3 months following the last dose of the study cell infusion"
(declare-const patient_has_finding_of_barrier_contraception_method_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to use a barrier contraception method (barrier device administration) during the study and for the required post-infusion period.","when_to_set_to_false":"Set to false if the patient does not agree to use a barrier contraception method (barrier device administration) during the study and for the required post-infusion period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to use a barrier contraception method (barrier device administration) during the study and for the required post-infusion period.","meaning":"Boolean indicating whether the patient agrees to use a barrier contraception method (barrier device administration) in the future."} // "barrier device administration"
(declare-const patient_has_finding_of_barrier_contraception_method_inthefuture@@temporalcontext_during_study_and_for_3_months_following_last_dose_of_study_cell_infusion Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to use a barrier contraception method (barrier device administration) specifically during the study and for 3 months following the last dose of the study cell infusion.","when_to_set_to_false":"Set to false if the patient does not agree to use a barrier contraception method (barrier device administration) for the full required period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to use a barrier contraception method (barrier device administration) for the full required period.","meaning":"Boolean indicating whether the patient agrees to use a barrier contraception method (barrier device administration) during the study and for 3 months following the last dose of the study cell infusion."} // "barrier device administration during the study AND for 3 months following the last dose of the study cell infusion"
(declare-const patient_has_finding_of_oral_contraception_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to use oral contraception (birth control pill administration) during the study and for the required post-infusion period.","when_to_set_to_false":"Set to false if the patient does not agree to use oral contraception (birth control pill administration) during the study and for the required post-infusion period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to use oral contraception (birth control pill administration) during the study and for the required post-infusion period.","meaning":"Boolean indicating whether the patient agrees to use oral contraception (birth control pill administration) in the future."} // "birth control pill administration"
(declare-const patient_has_finding_of_oral_contraception_inthefuture@@temporalcontext_during_study_and_for_3_months_following_last_dose_of_study_cell_infusion Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to use oral contraception (birth control pill administration) specifically during the study and for 3 months following the last dose of the study cell infusion.","when_to_set_to_false":"Set to false if the patient does not agree to use oral contraception (birth control pill administration) for the full required period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to use oral contraception (birth control pill administration) for the full required period.","meaning":"Boolean indicating whether the patient agrees to use oral contraception (birth control pill administration) during the study and for 3 months following the last dose of the study cell infusion."} // "birth control pill administration during the study AND for 3 months following the last dose of the study cell infusion"
(declare-const patient_will_undergo_insertion_of_intrauterine_contraceptive_device_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to undergo insertion of an intrauterine contraceptive device during the study and for the required post-infusion period.","when_to_set_to_false":"Set to false if the patient does not agree to undergo insertion of an intrauterine contraceptive device during the study and for the required post-infusion period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to undergo insertion of an intrauterine contraceptive device during the study and for the required post-infusion period.","meaning":"Boolean indicating whether the patient will undergo insertion of an intrauterine contraceptive device in the future."} // "intrauterine device administration"
(declare-const patient_will_undergo_insertion_of_intrauterine_contraceptive_device_inthefuture@@temporalcontext_during_study_and_for_3_months_following_last_dose_of_study_cell_infusion Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to undergo insertion of an intrauterine contraceptive device specifically during the study and for 3 months following the last dose of the study cell infusion.","when_to_set_to_false":"Set to false if the patient does not agree to undergo insertion of an intrauterine contraceptive device for the full required period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to undergo insertion of an intrauterine contraceptive device for the full required period.","meaning":"Boolean indicating whether the patient will undergo insertion of an intrauterine contraceptive device during the study and for 3 months following the last dose of the study cell infusion."} // "intrauterine device administration during the study AND for 3 months following the last dose of the study cell infusion"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_barrier_contraception_method_inthefuture@@temporalcontext_during_study_and_for_3_months_following_last_dose_of_study_cell_infusion
         patient_has_finding_of_barrier_contraception_method_inthefuture)
     :named REQ11_AUXILIARY0)) ;; "barrier device administration during the study AND for 3 months following the last dose of the study cell infusion"

(assert
  (! (=> patient_has_finding_of_oral_contraception_inthefuture@@temporalcontext_during_study_and_for_3_months_following_last_dose_of_study_cell_infusion
         patient_has_finding_of_oral_contraception_inthefuture)
     :named REQ11_AUXILIARY1)) ;; "birth control pill administration during the study AND for 3 months following the last dose of the study cell infusion"

(assert
  (! (=> patient_will_undergo_insertion_of_intrauterine_contraceptive_device_inthefuture@@temporalcontext_during_study_and_for_3_months_following_last_dose_of_study_cell_infusion
         patient_will_undergo_insertion_of_intrauterine_contraceptive_device_inthefuture)
     :named REQ11_AUXILIARY2)) ;; "intrauterine device administration during the study AND for 3 months following the last dose of the study cell infusion"

;; Non-exhaustive examples imply the umbrella term
(assert
  (! (=> (or patient_has_finding_of_barrier_contraception_method_inthefuture@@temporalcontext_during_study_and_for_3_months_following_last_dose_of_study_cell_infusion
            patient_has_finding_of_oral_contraception_inthefuture@@temporalcontext_during_study_and_for_3_months_following_last_dose_of_study_cell_infusion
            patient_will_undergo_insertion_of_intrauterine_contraceptive_device_inthefuture@@temporalcontext_during_study_and_for_3_months_following_last_dose_of_study_cell_infusion
            patient_agrees_to_abstinence_during_study_and_for_3_months_following_last_dose_of_study_cell_infusion)
         patient_agrees_to_use_approved_contraceptive_method_during_study_and_for_3_months_following_last_dose_of_study_cell_infusion)
     :named REQ11_AUXILIARY3)) ;; "approved contraceptive method administration (with non-exhaustive examples (birth control pill administration OR barrier device administration OR intrauterine device administration OR abstinence)) during the study AND for 3 months following the last dose of the study cell infusion"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! patient_agrees_to_use_approved_contraceptive_method_during_study_and_for_3_months_following_last_dose_of_study_cell_infusion
     :named REQ11_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "patient must agree to use approved contraceptive method administration during the study AND for 3 months following the last dose of the study cell infusion"

;; ===================== Declarations for the criterion (REQ 12) =====================
(declare-const patient_has_signed_study_specific_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently signed the study-specific informed consent.","when_to_set_to_false":"Set to false if the patient has not currently signed the study-specific informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has currently signed the study-specific informed consent.","meaning":"Boolean indicating whether the patient has currently signed the study-specific informed consent."} // "sign the study-specific informed consent"
(declare-const patient_understands_study_specific_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently understands the study-specific informed consent.","when_to_set_to_false":"Set to false if the patient currently does not understand the study-specific informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently understands the study-specific informed consent.","meaning":"Boolean indicating whether the patient currently understands the study-specific informed consent."} // "understand the study-specific informed consent"

;; ===================== Constraint Assertions (REQ 12) =====================
;; Component 0: To be included, the patient must understand AND sign the study-specific informed consent.
(assert
  (! (and patient_understands_study_specific_informed_consent_now
          patient_has_signed_study_specific_informed_consent_now)
     :named REQ12_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must understand AND sign the study-specific informed consent."

;; ===================== Declarations for the inclusion criterion (REQ 13) =====================
(declare-const patient_absolute_neutrophil_count_value_recorded_now_withunit_per_microliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's absolute neutrophil count is recorded now in units of per microliter.","when_to_set_to_null":"Set to null if no absolute neutrophil count measurement is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's current absolute neutrophil count in per microliter."} // "absolute neutrophil count > 1,000 per microliter"
(declare-const patient_platelet_count_value_recorded_now_withunit_per_microliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's platelet count is recorded now in units of per microliter.","when_to_set_to_null":"Set to null if no platelet count measurement is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's current platelet count in per microliter."} // "platelet count > 100,000 per microliter"
(declare-const patient_hematocrit_determination_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's hematocrit is recorded now in percent.","when_to_set_to_null":"Set to null if no hematocrit measurement is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's current hematocrit in percent."} // "hematocrit > 30 percent"
(declare-const patient_aspartate_aminotransferase_value_recorded_now_withunit_times_institutional_normal_upper_limit Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's aspartate aminotransferase is recorded now in units of times the institutional normal upper limit.","when_to_set_to_null":"Set to null if no AST measurement is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's current aspartate aminotransferase in times the institutional normal upper limit."} // "aspartate aminotransferase < 3 times the institutional normal upper limit"
(declare-const patient_alanine_aminotransferase_value_recorded_now_withunit_times_institutional_normal_upper_limit Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's alanine aminotransferase is recorded now in units of times the institutional normal upper limit.","when_to_set_to_null":"Set to null if no ALT measurement is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's current alanine aminotransferase in times the institutional normal upper limit."} // "alanine aminotransferase < 3 times the institutional normal upper limit"
(declare-const patient_bilirubin_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's bilirubin is recorded now in milligrams per deciliter.","when_to_set_to_null":"Set to null if no bilirubin measurement is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's current bilirubin in milligrams per deciliter."} // "bilirubin < 2.0 milligrams per deciliter"
(declare-const patient_bilirubin_value_recorded_now_withunit_milligrams_per_deciliter@@secondary_to_malignant_bile_duct_obstruction Bool) ;; {"when_to_set_to_true":"Set to true if the patient's elevated bilirubin is secondary to malignant bile duct obstruction.","when_to_set_to_false":"Set to false if the patient's elevated bilirubin is not secondary to malignant bile duct obstruction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's elevated bilirubin is secondary to malignant bile duct obstruction.","meaning":"Boolean indicating whether the patient's elevated bilirubin is secondary to malignant bile duct obstruction."} // "bilirubin ≥ 2.0 milligrams per deciliter AND secondary to malignant bile duct obstruction"
(declare-const patient_creatinine_value_recorded_now_withunit_times_institutional_normal_upper_limit Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's creatinine is recorded now in units of times the institutional normal upper limit.","when_to_set_to_null":"Set to null if no creatinine measurement is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's current creatinine in times the institutional normal upper limit."} // "creatinine < 1.5 times the institutional normal upper limit"
(declare-const patient_has_finding_of_obstruction_of_bile_duct_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has obstruction of the bile duct.","when_to_set_to_false":"Set to false if the patient currently does not have obstruction of the bile duct.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has obstruction of the bile duct.","meaning":"Boolean indicating whether the patient currently has obstruction of the bile duct."} // "bile duct obstruction"
(declare-const patient_has_finding_of_obstruction_of_bile_duct_now@@malignant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's bile duct obstruction is malignant.","when_to_set_to_false":"Set to false if the patient's bile duct obstruction is not malignant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's bile duct obstruction is malignant.","meaning":"Boolean indicating whether the patient's bile duct obstruction is malignant."} // "malignant bile duct obstruction"
(declare-const patient_has_satisfactory_bone_marrow_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has satisfactory bone marrow function as defined by protocol.","when_to_set_to_false":"Set to false if the patient currently does not have satisfactory bone marrow function as defined by protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has satisfactory bone marrow function as defined by protocol.","meaning":"Boolean indicating whether the patient currently has satisfactory bone marrow function as defined by protocol."} // "satisfactory bone marrow function"
(declare-const patient_has_satisfactory_organ_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has satisfactory organ function as defined by protocol.","when_to_set_to_false":"Set to false if the patient currently does not have satisfactory organ function as defined by protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has satisfactory organ function as defined by protocol.","meaning":"Boolean indicating whether the patient currently has satisfactory organ function as defined by protocol."} // "satisfactory organ function"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Satisfactory bone marrow function definition
(assert
  (! (= patient_has_satisfactory_bone_marrow_function_now
        (and (> patient_absolute_neutrophil_count_value_recorded_now_withunit_per_microliter 1000.0)
             (> patient_platelet_count_value_recorded_now_withunit_per_microliter 100000.0)
             (> patient_hematocrit_determination_value_recorded_now_withunit_percent 30.0)))
     :named REQ13_AUXILIARY0)) ;; "absolute neutrophil count > 1,000 per microliter AND platelet count > 100,000 per microliter AND hematocrit > 30 percent"

;; Satisfactory organ function definition
(assert
  (! (= patient_has_satisfactory_organ_function_now
        (and
          ;; AST or ALT < 3x ULN
          (or (< patient_aspartate_aminotransferase_value_recorded_now_withunit_times_institutional_normal_upper_limit 3.0)
              (< patient_alanine_aminotransferase_value_recorded_now_withunit_times_institutional_normal_upper_limit 3.0))
          ;; Bilirubin < 2.0 mg/dL OR (bilirubin >= 2.0 mg/dL AND secondary to malignant bile duct obstruction)
          (or (< patient_bilirubin_value_recorded_now_withunit_milligrams_per_deciliter 2.0)
              (and (>= patient_bilirubin_value_recorded_now_withunit_milligrams_per_deciliter 2.0)
                   patient_bilirubin_value_recorded_now_withunit_milligrams_per_deciliter@@secondary_to_malignant_bile_duct_obstruction))
          ;; Creatinine < 1.5x ULN
          (< patient_creatinine_value_recorded_now_withunit_times_institutional_normal_upper_limit 1.5)))
     :named REQ13_AUXILIARY1)) ;; "aspartate aminotransferase OR alanine aminotransferase < 3 times the institutional normal upper limit AND (bilirubin < 2.0 milligrams per deciliter OR (bilirubin ≥ 2.0 milligrams per deciliter AND secondary to malignant bile duct obstruction)) AND creatinine < 1.5 times the institutional normal upper limit"

;; Malignant bile duct obstruction qualifier implies both bile duct obstruction and malignancy
(assert
  (! (=> patient_bilirubin_value_recorded_now_withunit_milligrams_per_deciliter@@secondary_to_malignant_bile_duct_obstruction
         (and patient_has_finding_of_obstruction_of_bile_duct_now
              patient_has_finding_of_obstruction_of_bile_duct_now@@malignant))
     :named REQ13_AUXILIARY2)) ;; "secondary to malignant bile duct obstruction" implies both obstruction and malignancy

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
  (! (and patient_has_satisfactory_organ_function_now
          patient_has_satisfactory_bone_marrow_function_now)
     :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (satisfactory organ function AND satisfactory bone marrow function) as defined by ..."
